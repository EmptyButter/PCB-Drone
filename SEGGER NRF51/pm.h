#ifndef __PM_H__
#define __PM_H__

#include "stdbool.h"

static enum OpMode{
	TestMode1,
	ChargingMode,
	NormalMode
}OpMode;

void pmInit(void);

void pmProcess(void);

static bool pmUSBPower(void);

bool pmIsCharging(void);

static void EnableCharging(void);

static void ChargingManagement(void);

static void DisableCharging(void);

static bool isBattOK(void);

static void OperatingMode(enum OpMode mode);







#endif //__PM_H__