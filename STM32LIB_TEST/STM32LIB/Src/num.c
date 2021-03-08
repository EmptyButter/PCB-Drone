#include <math.h>
#include <stdint.h>

#include "num.h"

float constrain(float value, const float minVal, const float maxVal)
{
    return min(maxVal, max(minVal, value));
}

float deadband(float value, const float threshold)
{
    if (fabsf(value) < threshold)
    {
        value = 0;
    }
    else if (value > 0)
    {
        value = value - threshold;
    }
    else if (value < 0)
    {
        value = value + threshold;
    }
    return value;
}