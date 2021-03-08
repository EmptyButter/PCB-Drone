#include <stdint.h>

#include "SEGGER_RTT.h"
#include "controller.h"
#include "num.h"

#ifndef M_PI
#define M_PI 3.14159265358979323846
#endif

#define RATE_MAIN_LOOP RATE_1000_HZ
#define ATTITUDE_RATE RATE_500_HZ
#define POSITION_RATE RATE_100_HZ

#define ATTITUDE_UPDATE_DT (float)(1.0f / ATTITUDE_RATE)

PidObject pidRollRate;
PidObject pidPitchRate;
PidObject pidYawRate;
PidObject pidRoll;
PidObject pidPitch;
PidObject pidYaw;

static attitude_t attitudeDesired;
static attitude_t rateDesired;
static float actuatorThrust;
static bool isInit = false;

static int16_t rollOutput;
static int16_t pitchOutput;
static int16_t yawOutput;

/* Gobal stabilizer variables */
extern state_t state;
extern control_t control;
extern sensorData_t sensorData;
setpoint_t setpoint;

struct pidInit_s
{
    float kp;
    float ki;
    float kd;
};

struct pidAxis_s
{
    PidObject pid;

    struct pidInit_s init;
    stab_mode_t previousMode;
    float setpoint;

    float output;
};

struct this_s
{
    struct pidAxis_s pidVX;
    struct pidAxis_s pidVY;
    struct pidAxis_s pidVZ;

    struct pidAxis_s pidX;
    struct pidAxis_s pidY;
    struct pidAxis_s pidZ;

    uint16_t thrustBase; // approximate throttle needed when in perfect hover. More weight/older battery can use a higher value
    uint16_t thrustMin;  // Minimum thrust value to output
};

// Maximum roll/pitch angle permited
static float rpLimit = 20;
static float rpLimitOverhead = 1.10f;
// Velocity maximums
static float xyVelMax = 1.0f;
static float zVelMax = 1.0f;
static float velMaxOverhead = 1.10f;
static const float thrustScale = 5000.0f;

#define DT (float)(1.0f / POSITION_RATE)
#define POSITION_LPF_CUTOFF_FREQ 20.0f
#define POSITION_LPF_ENABLE true

static struct this_s this = {
    .pidVX = {
        .init = {
            .kp = 25.0f,
            .ki = 1.0f,
            .kd = 0.0f,
        },
        .pid.dt = DT,
    },

    .pidVY = {
        .init = {
            .kp = 25.0f,
            .ki = 1.0f,
            .kd = 0.0f,
        },
        .pid.dt = DT,
    },

    .pidVZ = {
        .init = {
            .kp = 25, //25
            .ki = 15, //15
            .kd = 0,  //0
        },
        .pid.dt = DT,
    },

    .pidX = {
        .init = {
            .kp = 2.0f,
            .ki = 0,
            .kd = 0,
        },
        .pid.dt = DT,
    },

    .pidY = {
        .init = {
            .kp = 2.0f,
            .ki = 0,
            .kd = 0,
        },
        .pid.dt = DT,
    },

    .pidZ = {
        .init = {

            .kp = 1.0,
            .ki = 0.1,
            .kd = 1.0,
        },
        .pid.dt = DT,
    },

    .thrustBase = 42000, //base38250 37250  40250  46000
    .thrustMin = 20000,
};
float ilimitt = 10000;
void pidInit(PidObject *pid, const float desired, const float kp,
    const float ki, const float kd, const float dt,
    const float samplingRate, const float cutoffFreq,
    bool enableDFilter)
{
    pid->error = 0;
    pid->prevError = 0;
    pid->integ = 0;
    pid->deriv = 0;
    pid->desired = desired;
    pid->kp = kp;
    pid->ki = ki;
    pid->kd = kd;
    pid->iLimit = DEFAULT_PID_INTEGRATION_LIMIT;
    pid->outputLimit = DEFAULT_PID_OUTPUT_LIMIT;
    pid->dt = dt;
    pid->enableDFilter = enableDFilter;
    if (pid->enableDFilter)
    {
    }
}

float pidUpdateOutput(PidObject *pid, const float measured, const bool updateError)
{
    float output = 0.0f;

    if (updateError)
    {
        pid->error = pid->desired - measured;
    }

    pid->outP = pid->desired - measured;
    output += pid->outP;

    float deriv = (pid->error - pid->prevError) / pid->dt;
    if (pid->enableDFilter)
    {
        SEGGER_RTT_printf(0, "D filter not implemented yet! pid update [ERROR]!");
        pid->deriv = 0;
    }
    else
    {
        pid->deriv = deriv;
    }
    if (isnan(pid->deriv))
    {
        SEGGER_RTT_printf(0, "deriv isnan [ERROR]!");
        pid->deriv = 0;
    }
    pid->outD = pid->kd * pid->deriv;
    output += pid->outD;

    pid->integ += pid->error * pid->dt;

    //constrain the integral (uless the iLimit is zero)
    if (pid->iLimit != 0)
    {
        pid->integ = constrain(pid->integ, -pid->iLimit, pid->iLimit);
    }

    pid->outI = pid->ki * pid->integ;
    output += pid->outI;

    //constrain the PID output (uless the outputLimit is zero)
    if (pid->outputLimit != 0)
    {
        output = constrain(output, -pid->outputLimit, pid->outputLimit);
    }

    pid->prevError = pid->error;

    return output;
}

void pidSetIntegralLimit(PidObject *pid, const float limit)
{
    pid->iLimit = limit;
}

void attitudeControllerInit(const float updateDt)
{
    pidInit(&pidRollRate, 0, PID_ROLL_RATE_KP, PID_ROLL_RATE_KI, PID_ROLL_RATE_KD,
        updateDt, ATTITUDE_RATE, ATTITUDE_RATE_LPF_CUTOFF_FREQ, ATTITUDE_RATE_LPF_ENABLE);
    pidInit(&pidPitchRate, 0, PID_PITCH_RATE_KP, PID_PITCH_RATE_KI, PID_PITCH_RATE_KD,
        updateDt, ATTITUDE_RATE, ATTITUDE_RATE_LPF_CUTOFF_FREQ, ATTITUDE_RATE_LPF_ENABLE);
    pidInit(&pidYawRate, 0, PID_YAW_RATE_KP, PID_YAW_RATE_KI, PID_YAW_RATE_KD,
        updateDt, ATTITUDE_RATE, ATTITUDE_RATE_LPF_CUTOFF_FREQ, ATTITUDE_RATE_LPF_ENABLE);

    pidSetIntegralLimit(&pidRollRate, PID_ROLL_RATE_INTEGRATION_LIMIT);
    pidSetIntegralLimit(&pidPitchRate, PID_PITCH_RATE_INTEGRATION_LIMIT);
    pidSetIntegralLimit(&pidYawRate, PID_YAW_RATE_INTEGRATION_LIMIT);

    pidInit(&pidRoll, 0, PID_ROLL_KP, PID_ROLL_KI, PID_ROLL_KD, updateDt,
        ATTITUDE_RATE, ATTITUDE_LPF_CUTOFF_FREQ, ATTITUDE_LPF_ENABLE);
    pidInit(&pidPitch, 0, PID_PITCH_KP, PID_PITCH_KI, PID_PITCH_KD, updateDt,
        ATTITUDE_RATE, ATTITUDE_LPF_CUTOFF_FREQ, ATTITUDE_LPF_ENABLE);
    pidInit(&pidYaw, 0, PID_YAW_KP, PID_YAW_KI, PID_YAW_KD, updateDt,
        ATTITUDE_RATE, ATTITUDE_LPF_CUTOFF_FREQ, ATTITUDE_LPF_ENABLE);

    pidSetIntegralLimit(&pidRoll, PID_ROLL_INTEGRATION_LIMIT);
    pidSetIntegralLimit(&pidPitch, PID_PITCH_INTEGRATION_LIMIT);
    pidSetIntegralLimit(&pidYaw, PID_YAW_INTEGRATION_LIMIT);
}

void positionControllerInit(void)
{
    pidInit(&this.pidX.pid, this.pidX.setpoint, this.pidX.init.kp, this.pidX.init.ki, this.pidX.init.kd,
        this.pidX.pid.dt, POSITION_RATE, POSITION_LPF_CUTOFF_FREQ, false);
    pidInit(&this.pidY.pid, this.pidY.setpoint, this.pidY.init.kp, this.pidY.init.ki, this.pidY.init.kd,
        this.pidY.pid.dt, POSITION_RATE, POSITION_LPF_CUTOFF_FREQ, false);
    pidInit(&this.pidZ.pid, this.pidZ.setpoint, this.pidZ.init.kp, this.pidZ.init.ki, this.pidZ.init.kd,
        this.pidZ.pid.dt, POSITION_RATE, POSITION_LPF_CUTOFF_FREQ, false);

    this.pidZ.pid.iLimit = ilimitt;

    pidInit(&this.pidVX.pid, this.pidVX.setpoint, this.pidVX.init.kp, this.pidVX.init.ki, this.pidVX.init.kd,
        this.pidVX.pid.dt, POSITION_RATE, POSITION_LPF_CUTOFF_FREQ, false);
    pidInit(&this.pidVY.pid, this.pidVY.setpoint, this.pidVY.init.kp, this.pidVY.init.ki, this.pidVY.init.kd,
        this.pidVY.pid.dt, POSITION_RATE, POSITION_LPF_CUTOFF_FREQ, false);
    pidInit(&this.pidVZ.pid, this.pidVZ.setpoint, this.pidVZ.init.kp, this.pidVZ.init.ki, this.pidVZ.init.kd,
        this.pidVZ.pid.dt, POSITION_RATE, POSITION_LPF_CUTOFF_FREQ, false);
}

void ControllerInit(void)
{
    attitudeControllerInit(ATTITUDE_UPDATE_DT);
    positionControllerInit();
    isInit = true;
}

bool controllerTest()
{
    return isInit;
}

void attitudeControllerCorrectAttitudePID(
    float eulerRollActual, float eulerPitchActual, float eulerYawActual,
    float eulerRollDesired, float eulerPitchDesired, float eulerYawDesired,
    float *rollRateDesired, float *pitchRateDesired, float *yawRateDesired)
{
    pidRoll.desired = eulerRollDesired;
    *rollRateDesired = pidUpdateOutput(&pidRoll, eulerRollActual, true);

    pidPitch.desired = eulerPitchDesired;
    *pitchRateDesired = pidUpdateOutput(&pidPitch, eulerPitchActual, true);

    float yawError;
    yawError = eulerYawDesired - eulerYawActual;

    if (yawError > 180.0f)
        yawError -= 360.0f;
    else if (yawError < -180.0f)
        yawError += 360.0f;
    pidYaw.error = yawError;
    *yawRateDesired = pidUpdateOutput(&pidYaw, eulerYawActual, false);
}

void attitudeControllerCorrectRatePID(
    float rollRateActual, float pitchRateActual, float yawRateActual,
    float rollRateDesired, float pitchRateDesired, float yawRateDesired)
{ //limit pidUpdateOutput to int16? not for now. Will limit to uint16_t in motor distribution.
    pidRollRate.desired = rollRateDesired;
    rollOutput = pidUpdateOutput(&pidRollRate, rollRateActual, true);

    pidPitchRate.desired = pitchRateDesired;
    pitchOutput = pidUpdateOutput(&pidPitchRate, pitchRateActual, true);

    pidYawRate.desired = yawRateDesired;
    yawOutput = pidUpdateOutput(&pidYawRate, yawRateActual, true);
}

void pidReset(PidObject *pid)
{
    pid->error = 0;
    pid->prevError = 0;
    pid->integ = 0;
    pid->deriv = 0;
}

void attitudeControllerResetAllPID(void)
{
    pidReset(&pidRoll);
    pidReset(&pidPitch);
    pidReset(&pidYaw);
    pidReset(&pidRollRate);
    pidReset(&pidPitchRate);
    pidReset(&pidYawRate);
}

void positionControllerResetAllPID(void)
{
    pidReset(&this.pidX.pid);
    pidReset(&this.pidY.pid);
    pidReset(&this.pidZ.pid);
    pidReset(&this.pidVX.pid);
    pidReset(&this.pidVY.pid);
    pidReset(&this.pidVZ.pid);
}

void velocityController(float *thrust, attitude_t *attitude, setpoint_t *setpoint, const state_t *state)
{
    this.pidVX.pid.outputLimit = rpLimit * rpLimitOverhead;
    this.pidVY.pid.outputLimit = rpLimit * rpLimitOverhead;
    // Set the output limit to the maximum thrust range
    this.pidVZ.pid.outputLimit = (UINT16_MAX / 2 / thrustScale);

    this.pidVX.pid.desired = setpoint->velocity.x;
    float rollRaw = pidUpdateOutput(&this.pidVX.pid, state->velocity.x, true);
    this.pidVY.pid.desired = setpoint->velocity.y;
    float pitchRaw = pidUpdateOutput(&this.pidVY.pid, state->velocity.y, true);

    float yawRad = state->attitude.yaw * (float)M_PI / 180;
    attitude->pitch = -(rollRaw * cosf(yawRad)) - (pitchRaw * sinf(yawRad));
    attitude->roll = -(pitchRaw * cosf(yawRad)) + (rollRaw * sinf(yawRad));

    attitude->roll = constrain(attitude->roll, -rpLimit, rpLimit);
    attitude->pitch = constrain(attitude->pitch, -rpLimit, rpLimit);

    //Thrust
    float thrustRaw;
    if (setpoint->mode.z == modeAbs) //test. don't use Velocity update in Abs mode.
    {
        //this.pidZ.pid.desired = setpoint->position.z;
        //thrustRaw = pidUpdateOutput(&this.pidZ.pid, state->position.z, true);
        thrustRaw = setpoint->velocity.z;
        *thrust = thrustRaw * thrustScale + this.thrustBase;
    }
    else if (setpoint->mode.z == modeVelocity)
    {
        //this.pidVZ.pid.desired = setpoint->velocity.z;
        //thrustRaw = pidUpdateOutput(&this.pidVZ.pid, state->velocity.z, true);
        //*thrust = thrustRaw * thrustScale + this.thrustBase;
    }

    //Scale the thrust and add feed forward term
    //*thrust = thrustRaw * thrustScale + this.thrustBase;

    if (*thrust < this.thrustMin)
    {
        *thrust = this.thrustMin;
    }
    *thrust /= 257.0f; //scale down from 65536 to 255
    //SEGGER_RTT_printf(0, "thrust: %d \n", (int)(*thrust * 100));
}

void positionController(float *thrust, attitude_t *attitude, setpoint_t *setpoint, const state_t *state)
{
    this.pidX.pid.outputLimit = xyVelMax * velMaxOverhead;
    this.pidY.pid.outputLimit = xyVelMax * velMaxOverhead;
    this.pidZ.pid.outputLimit = fmax(zVelMax, 0.5f) * velMaxOverhead;

    float cosyaw = cosf(state->attitude.yaw * (float)M_PI / 180.0f);
    float sinyaw = sinf(state->attitude.yaw * (float)M_PI / 180.0f);
    float bodyvx = setpoint->velocity.x;
    float bodyvy = setpoint->velocity.y;

    if (setpoint->mode.x == modeAbs)
    {
        //setpoint->velocity.x = runPid
    }
    else if (setpoint->velocity_body)
    {
        setpoint->velocity.x = bodyvx * cosyaw - bodyvy * sinyaw;
    }

    if (setpoint->mode.y == modeAbs)
    {
        //setpoint->velocity.y = pidUpdateOutput()
    }
    else if (setpoint->velocity_body)
    {
        setpoint->velocity.y = bodyvy * cosyaw + bodyvx * sinyaw;
    }
    if (setpoint->mode.z == modeAbs)
    {
        this.pidZ.pid.desired = setpoint->position.z;
        setpoint->velocity.z = pidUpdateOutput(&this.pidZ.pid, state->position.z, true);
    }

    velocityController(thrust, attitude, setpoint, state);
}

static float capAngle(float angle)
{
    float result = angle;

    while (result > 180.0f)
    {
        result -= 360.0f;
    }

    while (result < -180.0f)
    {
        result += 360.0f;
    }

    return result;
}

void stateController(control_t *control, setpoint_t *setpoint, const sensorData_t *sensors, const state_t *state, const uint32_t tick)
{
    if (RATE_DO_EXECUTE(POSITION_RATE, tick))
    {
        positionController(&actuatorThrust, &attitudeDesired, setpoint, state);
    }

    if (RATE_DO_EXECUTE(ATTITUDE_RATE, tick))
    {
        // Rate-controled YAW is moving YAW angle setpoint
        if (setpoint->mode.yaw == modeVelocity)
        {
            attitudeDesired.yaw += setpoint->attitudeRate.yaw * ATTITUDE_UPDATE_DT;
        }
        else
        {
            attitudeDesired.yaw = setpoint->attitude.yaw;
        }

        attitudeDesired.yaw = capAngle(attitudeDesired.yaw);
        //        attitudeDesired.yaw = setpoint->attitude.yaw;

        if (setpoint->mode.z == modeDisable)
        {
            actuatorThrust = setpoint->thrust;
        }
        if (setpoint->mode.x == modeDisable || setpoint->mode.y == modeDisable)
        {
            attitudeDesired.roll = setpoint->attitude.roll;
            attitudeDesired.pitch = setpoint->attitude.pitch;
        }

        attitudeControllerCorrectAttitudePID(
            state->attitude.roll, state->attitude.pitch, state->attitude.yaw,
            attitudeDesired.roll, attitudeDesired.pitch, attitudeDesired.yaw,
            &rateDesired.roll, &rateDesired.pitch, &rateDesired.yaw);

        attitudeControllerCorrectRatePID(-sensors->gyro.y, sensors->gyro.x, sensors->gyro.z,
            rateDesired.roll, rateDesired.pitch, rateDesired.yaw);
        control->roll = rollOutput;
        control->pitch = pitchOutput;
        control->yaw = yawOutput;

        control->yaw = -control->yaw;
    }

    control->thrust = actuatorThrust;

    if (setpoint->thrust == 0)
    {
        control->thrust = 0;
        control->pitch = 0;
        control->roll = 0;
        control->yaw = 0;
        attitudeControllerResetAllPID();
        positionControllerResetAllPID();

        attitudeDesired.yaw = state->attitude.yaw;
    }
}

void stateControllerUpdate(uint32_t tick)
{
    //debug test set
    setpoint.mode.x = 0;
    setpoint.mode.y = 0;
    setpoint.mode.z = 0;
    setpoint.mode.yaw = 0;

    static uint8_t flag = 0;
    if (flag == 0 && 0)
    {
        if (state.position.z > 0.4)
        {
            setpoint.mode.z = modeAbs;
            flag = 1;
        }
        else
        {
            setpoint.mode.z = 0;
        }
    }
    //setpoint.attitude.roll = 0;
    //setpoint.attitude.pitch = 0;

    // setpoint.attitude.yaw = state.attitude.yaw;

    //setpoint.thrust = 15;

    stateController(&control, &setpoint, &sensorData, &state, tick);
    //SEGGER_RTT_printf(0, "Rpitch: %-5d, Rroll: %-5d, Ryaw:%-5d\n", (int)rateDesired.pitch, (int)rateDesired.roll, (int)rateDesired.yaw);
    //SEGGER_RTT_printf(0, "Cpitch: %-5d, Croll: %-5d, Cyaw:%-5d\n",    (int)control.pitch, (int)control.roll, (int)control.yaw);
}

void cmdSetPoint(setpoint_t *cmdsetpoint)
{
    setpoint.thrust = cmdsetpoint->thrust;
    setpoint.velocity.z = cmdsetpoint->velocity.z;
    setpoint.position.z = cmdsetpoint->position.z;
    setpoint.attitude.roll = cmdsetpoint->attitude.roll;
    setpoint.attitude.pitch = cmdsetpoint->attitude.pitch;

    setpoint.attitude.yaw = cmdsetpoint->attitude.yaw;
}