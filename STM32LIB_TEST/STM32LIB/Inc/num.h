#ifndef __NUM_H__
#define __NUM_H__

#include <stdint.h>

#undef max
#define max(a, b) ((a) > (b) ? (a) : (b))
#undef min
#define min(a, b) ((a) < (b) ? (a) : (b))

float constrain(float value, const float minVal, const float maxVal);
float deadband(float value, const float threshold);

#endif