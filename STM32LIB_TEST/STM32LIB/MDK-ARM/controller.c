#include <math.h>
#include <stdio.h>

#include "controller.h"
#include "sensor.h"

#define M_PI 3.14159265358979323846 // pi
#define M_PI_F ((float)M_PI)

/* MAHONY_QUATERNION_IMU */
#define TWO_KP_DEF (2.0f * 0.4f)   // 2 * proportional gain
#define TWO_KI_DEF (2.0f * 0.001f) // 2 * integral gain

#define RATE_250_HZ 250
#define ATTITUDE_UPDATE_RATE RATE_250_HZ
#define ATTITUDE_UPDATE_DT 1.0 / ATTITUDE_UPDATE_RATE

float twoKp = TWO_KP_DEF; // 2 * proportional gain (Kp)
float twoKi = TWO_KI_DEF; // 2 * integral gain (Ki)
float integralFBx = 0.0f;
float integralFBy = 0.0f;
float integralFBz = 0.0f; // integral error terms scaled by Ki

float q0 = 1.0f;
float q1 = 0.0f;
float q2 = 0.0f;
float q3 = 0.0f; // quaternion of sensor frame relative to auxiliary frame

static float gravX, gravY, gravZ; // Unit vector in the estimated gravity direction

static state_t state;
static control_t control;
extern sensorData_t sensorData;

/* The acc in Z for static position (g)
*  Set on first update, assuming we are in a static position since the sensors were just calibrates.
*  This value will be better the more level the copter is at calibration time
*  static float baseZacc = 1.0;
*/
static float baseZacc = 1.0;

static bool isCalibrated = false;

// Fast inverse square-root
// See: http://en.wikipedia.org/wiki/Fast_inverse_square_root
float invSqrt(float x)
{
    float halfx = 0.5f * x;
    float y = x;
    long i = *(long *)&y;
    i = 0x5f3759df - (i >> 1);
    y = *(float *)&i;
    y = y * (1.5f - (halfx * y * y));
    return y;
}

void sensfusion6UpdateQImpl(float gx, float gy, float gz, float ax, float ay, float az, float dt)
{
    float recipNorm;
    float halfvx, halfvy, halfvz;
    float halfex, halfey, halfez;
    float qa, qb, qc;

    gx = gx * M_PI_F / 180;
    gy = gy * M_PI_F / 180;
    gz = gz * M_PI_F / 180;

    // Compute feedback only if accelerometer measurement valid (avoids NaN in accelerometer normalisation)
    if (!((ax == 0.0f) && (ay == 0.0f) && (az == 0.0f)))
    {
        // Normalise accelerometer measurement
        recipNorm = invSqrt(ax * ax + ay * ay + az * az);
        ax *= recipNorm;
        ay *= recipNorm;
        az *= recipNorm;

        // Estimated direction of gravity and vector perpendicular to magnetic flux
        halfvx = q1 * q3 - q0 * q2;
        halfvy = q0 * q1 + q2 * q3;
        halfvz = q0 * q0 - 0.5f + q3 * q3;

        // Error is sum of cross product between estimated and measured direction of gravity
        halfex = (ay * halfvz - az * halfvy);
        halfey = (az * halfvx - ax * halfvz);
        halfez = (ax * halfvy - ay * halfvx);

        // Compute and apply integral feedback if enabled
        if (twoKi > 0.0f)
        {
            integralFBx += twoKi * halfex * dt; // integral error scaled by Ki
            integralFBy += twoKi * halfey * dt;
            integralFBz += twoKi * halfez * dt;
            gx += integralFBx; // apply integral feedback
            gy += integralFBy;
            gz += integralFBz;
        }
        else
        {
            integralFBx = 0.0f; // prevent integral windup
            integralFBy = 0.0f;
            integralFBz = 0.0f;
        }
        // Apply proportional feedback
        gx += twoKp * halfex;
        gy += twoKp * halfey;
        gz += twoKp * halfez;
    }
    // Integrate rate of change of quaternion
    gx *= (0.5f * dt); // pre-multiply common factors
    gy *= (0.5f * dt);
    gz *= (0.5f * dt);
    qa = q0;
    qb = q1;
    qc = q2;
    q0 += (-qb * gx - qc * gy - q3 * gz);
    q1 += (qa * gx + qc * gz - q3 * gy);
    q2 += (qa * gy - qb * gz + q3 * gx);
    q3 += (qa * gz + qb * gy - qc * gx);

    // Normalise quaternion
    recipNorm = invSqrt(q0 * q0 + q1 * q1 + q2 * q2 + q3 * q3);
    q0 *= recipNorm;
    q1 *= recipNorm;
    q2 *= recipNorm;
    q3 *= recipNorm;
}

static void estimatedGravityDirection(float *gx, float *gy, float *gz)
{
    *gx = 2 * (q1 * q3 - q0 * q2);
    *gy = 2 * (q0 * q1 + q2 * q3);
    *gz = q0 * q0 - q1 * q1 - q2 * q2 + q3 * q3;
}

static float sensfusion6GetAccZ(const float ax, const float ay, const float az)
{
    // return vertical acceleration
    // (A dot G) / |G|,  (|G| = 1) -> (A dot G)
    return (ax * gravX + ay * gravY + az * gravZ);
}

void sensorfusion6UpdateQ(float gx, float gy, float gz, float ax, float ay, float az, float dt)
{
    sensfusion6UpdateQImpl(gx, gy, gz, ax, ay, az, dt);
    estimatedGravityDirection(&gravX, &gravY, &gravZ);
    //printf("x:%-5f, y:%-5f, z:%-5f\n", gravX, gravY, gravZ);

    if (!isCalibrated)
    {
        baseZacc = sensfusion6GetAccZ(ax, ay, az);
        isCalibrated = true;
    }
}

void sensfusion6GetEulerRPY(float *roll, float *pitch, float *yaw)
{
    float gx = gravX;
    float gy = gravY;
    float gz = gravZ;

    if (gx > 1)
        gx = 1;
    if (gx < -1)
        gx = -1;

    *yaw = atan2f(2 * (q0 * q3 + q1 * q2), q0 * q0 + q1 * q1 - q2 * q2 - q3 * q3) * 180 / M_PI_F;
    *roll = asinf(gx) * 180 / M_PI_F; //Pitch seems to be inverted
    *pitch = atan2f(gy, gz) * 180 / M_PI_F;
}

/* Complementary estimator by cf2 */
void stateEstimator(state_t *state, sensorData_t *sensorData, control_t *control, const uint32_t tick)
{
    sensorfusion6UpdateQ(sensorData->gyro.x, sensorData->gyro.y, sensorData->gyro.z, sensorData->acc.x, sensorData->acc.y, sensorData->acc.z, ATTITUDE_UPDATE_DT);

    sensfusion6GetEulerRPY(&state->attitude.roll, &state->attitude.pitch, &state->attitude.yaw);

    state->acc.z = sensfusion6GetAccZ(sensorData->acc.x, sensorData->acc.y, sensorData->acc.z) - baseZacc;\

    //positionUpdateVelocity(state->acc.z, ATTITUDE_UPDATE_DT);
}

void stateEstimatorUpdate()
{
    stateEstimator(&state, &sensorData, &control, ATTITUDE_UPDATE_DT);
    //    printf("p:%-5f, r:%-5f, y:%-5f \n", (state.attitude.pitch/M_PI_F*180.0f), state.attitude.roll/M_PI_F*180.0f, state.attitude.yaw/M_PI_F*180.0f);
    SEGGER_RTT_printf(0, "p:%-5d, r:%-5d, y:%-5d \n", (int)(state.attitude.pitch), (int)(state.attitude.roll), (int)(state.attitude.yaw));
}