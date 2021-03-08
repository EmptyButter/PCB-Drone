#ifndef __STABILIZER_TYPES_H__
#define __STABILIZER_TYPES_H__

#include <stdbool.h>
#include <stdint.h>

typedef union
{
    struct
    {
        int16_t x;
        int16_t y;
        int16_t z;
    };
    int16_t axis[3];
} Axis3i16;

typedef union
{
    struct
    {
        int32_t x;
        int32_t y;
        int32_t z;
    };
    int32_t axis[3];
} Axis3i32;

typedef struct Axis3f_s
{
    float x;
    float y;
    float z;
} Axis3f;

typedef struct baro_s
{
    float pressure;    // mbar
    float temperature; // degree Celcius
    float asl;         // m (ASL = altitude above sea level)
} baro_t;

typedef struct sensorData_s
{
    Axis3f acc;
    Axis3f gyro;
    Axis3f mag;
    baro_t baro;
} sensorData_t;

struct vec3_s
{
    uint32_t timestamp; // Timestamp when the data was computed

    float x;
    float y;
    float z;
};

typedef struct vec3_s point_t;
typedef struct vec3_s velocity_t;
typedef struct vec3_s acc_t;

typedef struct attitude_s
{
    uint32_t timestamp; // Timestamp when the data was computed

    float roll;
    float pitch;
    float yaw;
} attitude_t;

typedef struct quaternion_s
{
    uint32_t timestamp;

    union
    {
        struct
        {
            float q0;
            float q1;
            float q2;
            float q3;
        };
        struct
        {
            float x;
            float y;
            float z;
            float w;
        };
    };
} quaternion_t;

typedef struct state_s
{
    attitude_t attitude;
    quaternion_t attitudeQuaternion;
    point_t position;
    velocity_t velocity;
    acc_t acc;
} state_t;

typedef struct control_s
{
    int16_t roll;
    int16_t pitch;
    int16_t yaw;
    float thrust;
} control_t;

typedef enum mode_e
{
    modeDisable = 0,
    modeAbs,
    modeVelocity
} stab_mode_t;

typedef struct setpoint_s
{
    uint32_t timestamp;

    attitude_t attitude;
    attitude_t attitudeRate;
    float thrust;
    point_t position;
    velocity_t velocity;
    bool velocity_body;

    struct
    {
        stab_mode_t x;
        stab_mode_t y;
        stab_mode_t z;
        stab_mode_t roll;
        stab_mode_t pitch;
        stab_mode_t yaw;
    } mode;
} setpoint_t;

typedef struct tofMeasurement_s
{
    uint32_t timestamp;
    float distance;
    float stdDev;
} tofMeasurement_t;

// Frequencies to bo used with the RATE_DO_EXECUTE_HZ macro. Do NOT use an arbitrary number.
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

#endif //__STABILIZER_TYPES_H__