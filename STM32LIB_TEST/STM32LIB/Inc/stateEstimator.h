#ifndef __STATEESTIMATOR_H__
#define __STATEESTIMATOR_H__

#include "stdint.h"
#include "stabilizer_typedef.h"


void stateEstimatorUpdate(uint32_t tick);

float getYaw(void);

#endif //__STATEESTIMATOR_H__