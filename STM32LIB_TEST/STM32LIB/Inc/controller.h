#ifndef __CONTROLLER_H__
#define __CONTROLLER_H__

#include <stdint.h>
#include <math.h>
#include <stdbool.h>
#include <stdlib.h>

#include "stateEstimator.h"
#include "stabilizer_typedef.h"

/* pid lpfilter */
#define ATTITUDE_LPF_CUTOFF_FREQ 15.0f
#define ATTITUDE_LPF_ENABLE false
#define ATTITUDE_RATE_LPF_CUTOFF_FREQ 30.0f
#define ATTITUDE_RATE_LPF_ENABLE false

#define PID_ROLL_RATE_KP 130.0 //70 //100
#define PID_ROLL_RATE_KI 0.0
#define PID_ROLL_RATE_KD 0.0
#define PID_ROLL_RATE_INTEGRATION_LIMIT 33.3

#define PID_PITCH_RATE_KP 130.0  //70 //100
#define PID_PITCH_RATE_KI 0.0
#define PID_PITCH_RATE_KD 0.0
#define PID_PITCH_RATE_INTEGRATION_LIMIT 33.3

#define PID_YAW_RATE_KP 70.0
#define PID_YAW_RATE_KI 16.7
#define PID_YAW_RATE_KD 0.0
#define PID_YAW_RATE_INTEGRATION_LIMIT 166.7

#define PID_ROLL_KP 7  //3.5
#define PID_ROLL_KI 2.0
#define PID_ROLL_KD 0.0
#define PID_ROLL_INTEGRATION_LIMIT 20.0

#define PID_PITCH_KP 7  //3.5
#define PID_PITCH_KI 2.0
#define PID_PITCH_KD 0.0
#define PID_PITCH_INTEGRATION_LIMIT 20.0

#define PID_YAW_KP 10.0
#define PID_YAW_KI 1.0
#define PID_YAW_KD 0.35
#define PID_YAW_INTEGRATION_LIMIT 360.0

#define DEFAULT_PID_INTEGRATION_LIMIT 11110000.0
#define DEFAULT_PID_OUTPUT_LIMIT 0.0

#define RATE_1000_HZ 1000
#define RATE_500_HZ 500
#define RATE_250_HZ 250
#define RATE_100_HZ 100
#define RATE_50_HZ 50
#define RATE_25_HZ 25
#define RATE_MAIN_LOOP RATE_1000_HZ
#define ATTITUDE_RATE RATE_500_HZ
#define POSITION_RATE RATE_100_HZ
#define RATE_DO_EXECUTE(RATE_HZ, TICK) ((TICK % (RATE_MAIN_LOOP / RATE_HZ)) == 0)

typedef struct
{
    float desired;      //< set point
    float error;        //< error
    float prevError;    //< previous error
    float integ;        //< integral
    float deriv;        //< derivative
    float kp;           //< proportional gain
    float ki;           //< integral gain
    float kd;           //< derivative gain
    float outP;         //< proportional output (debugging)
    float outI;         //< integral output (debugging)
    float outD;         //< derivative output (debugging)
    float iLimit;       //< integral limit, absolute value. '0' means no limit.
    float outputLimit;  //< total PID output limit, absolute value. '0' means no limit.
    float dt;           //< delta-time dt
    bool enableDFilter; //< filter for D term enable flag
} PidObject;

void ControllerInit(void);
void stateControllerUpdate(uint32_t tick);
bool controllerTest(void);

void cmdSetPoint(setpoint_t *cmdsetpoint);

#endif //__CONTROLLER_H__