#ifndef __CONTROLLER_H__
#define __CONTROLLER_H__

#include "stdint.h"



struct vec3_s {
  uint32_t timestamp; // Timestamp when the data was computed

  float x;
  float y;
  float z;
};

typedef struct vec3_s point_t;
typedef struct vec3_s velocity_t;
typedef struct vec3_s acc_t;



typedef struct attitude_s {
  uint32_t timestamp;  // Timestamp when the data was computed

  float roll;
  float pitch;
  float yaw;
} attitude_t;

typedef struct quaternion_s {
  uint32_t timestamp;

  union {
    struct {
      float q0;
      float q1;
      float q2;
      float q3;
    };
    struct {
      float x;
      float y;
      float z;
      float w;
    };
  };
} quaternion_t;

typedef struct control_s {
  int16_t roll;
  int16_t pitch;
  int16_t yaw;
  float thrust;
} control_t;

typedef struct state_s {
  attitude_t attitude;
  quaternion_t attitudeQuaternion;
  point_t position;
  velocity_t velocity;
  acc_t acc;
} state_t;






void stateEstimatorUpdate(void);


#endif //__CONTROLLER_H__