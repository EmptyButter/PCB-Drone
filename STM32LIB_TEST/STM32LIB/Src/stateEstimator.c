#include <math.h>
#include <stdio.h>

#include "num.h"
#include "sensor.h"
#include "stateEstimator.h"

#include "vl53l0x_api.h"

#define G 9.8

#define M_PI 3.14159265358979323846 // pi
#define M_PI_F ((float)M_PI)

/* MAHONY_QUATERNION_IMU */
#define TWO_KP_DEF (2.0f * 0.4f)   // 2 * proportional gain
#define TWO_KI_DEF (2.0f * 0.001f) // 2 * integral gain

#define ATTITUDE_UPDATE_RATE RATE_250_HZ
#define ATTITUDE_UPDATE_DT 1.0 / ATTITUDE_UPDATE_RATE
#define POS_UPDATE_RATE RATE_100_HZ
#define POS_UPDATE_DT 1.0 / POS_UPDATE_RATE

extern VL53L0X_Dev_t vl53l0C;

struct internalState_s {
	float estimatedZ; // The current Z estimate, has same offset as asl
	float velocityZ;  // Vertical speed (world frame) integrated from vertical acceleration (m/s)
	float estAlphaZrange;
	float estAlphaAsl;
	float velocityFactor;
	float vAccDeadband; // Vertical acceleration deadband
	float velZAlpha;    // Blending factor to avoid vertical speed to accumulate error
	float estimatedVZ;
};

static struct internalState_s internalState = {
    .estimatedZ = 0.0f,
    .velocityZ = 0.0f,
    .estAlphaZrange = 0.80f, //0.9
    .estAlphaAsl = 0.997f,
    .velocityFactor = 1.0f,
    .vAccDeadband = 0.04f,
    .velZAlpha = 0.995f,
    .estimatedVZ = 0.0f,
};

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

/* global stabilizer objects */
state_t state;
control_t control;
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
	if (!((ax == 0.0f) && (ay == 0.0f) && (az == 0.0f))) {
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
		if (twoKi > 0.0f) {
			integralFBx += twoKi * halfex * dt; // integral error scaled by Ki
			integralFBy += twoKi * halfey * dt;
			integralFBz += twoKi * halfez * dt;
			gx += integralFBx; // apply integral feedback
			gy += integralFBy;
			gz += integralFBz;
		} else {
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

	if (!isCalibrated) {
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

static void positionUpdateVelocityInternal(float accWZ, float dt, struct internalState_s *s)
{
	s->velocityZ += deadband(accWZ, s->vAccDeadband) * dt * G; //deadband defined 0.04f above: don't let valZ value change within 0.04G vertical acceleration.
	s->velocityZ *= s->velZAlpha;				   //0.995f blending factor to avoid vertical speed to accumulate error.
}

void positionUpdateVelocity(float accWZ, float dt)
{
	positionUpdateVelocityInternal(accWZ, dt, &internalState);
}

void aquireTofMeasurement(tofMeasurement_t *tof)
{
	static int8_t status = 0;
	static uint8_t newdataRdy = 0;
	static uint32_t newdatatime;
	VL53L0X_RangingMeasurementData_t data;
	newdatatime = HAL_GetTick();
	status = VL53L0X_GetMeasurementDataReady(&vl53l0C, &newdataRdy);
	if (newdataRdy && status == 0) {
		newdataRdy = 0;
		newdatatime = HAL_GetTick() - newdatatime;

		VL53L0X_GetRangingMeasurementData(&vl53l0C, &data);
		//SEGGER_RTT_printf(0, "Range=%d mm, in %d ms ", data.RangeMilliMeter, newdatatime);
		if (data.RangeStatus != 0) {
			SEGGER_RTT_printf(0, " Invalid data");
		} else {
			tof->distance = data.RangeMilliMeter / 1000.0f;
			if (tof->distance > 1.2)
				tof->distance = 1.2;
			tof->timestamp = HAL_GetTick();
		}
		//SEGGER_RTT_printf(0, "\n");
		newdatatime = HAL_GetTick();
		VL53L0X_ClearInterruptMask(&vl53l0C, 0);
	}
}

void positionEstimate(state_t *estimate, const sensorData_t *sensorData, tofMeasurement_t *tofMeasurement, float dt, uint32_t tick, struct internalState_s *internalState)
{
	float filteredZ;
	static float prev_estimatedZ = 0;
	static bool surfaceFollowingMode = false;

	const uint32_t MAX_SAMPLE_AGE = 80; //50ms

	uint32_t now = HAL_GetTick();
	//tofMeasurement->timestamp = 0; //testing baro, disable tofMeasurement;
	bool isSampleUseful = ((now - tofMeasurement->timestamp) <= MAX_SAMPLE_AGE);

	if (isSampleUseful) {
		surfaceFollowingMode = true;
	}

	if (surfaceFollowingMode || 1) {
		//SEGGER_RTT_printf(0, "surfacemode");
		if (isSampleUseful) {
			//IIR filter
			filteredZ = (internalState->estAlphaZrange) * internalState->estimatedZ +
				    (1.0f - internalState->estAlphaZrange) * tofMeasurement->distance;
			//Use filtered Zrange as base and add velocity changes.
			//internalState->estimatedZ = filteredZ + (internalState->velocityFactor * internalState->velocityZ * dt);
			internalState->estimatedZ = filteredZ;
			//SEGGER_RTT_printf(0, "estimatedZ:%-2dcm", (int)(internalState->estimatedZ * 100));
		}
	} else {
		SEGGER_RTT_printf(0, "not surfacemode");
		if (internalState->estimatedZ == 0.0f) {
			filteredZ = sensorData->baro.asl;
		} else {
			filteredZ = (internalState->estAlphaAsl) * internalState->estimatedZ +
				    (1.0f - internalState->estAlphaAsl) * sensorData->baro.asl;
		}
		//Use filtered asl as base and add velocity changes.
		internalState->estimatedZ = filteredZ + (internalState->velocityFactor * internalState->velocityZ * dt);
		//SEGGER_RTT_printf(0, "estimatedZ:%-2dcm\n", (int)(internalState->estimatedZ * 100));
	}
	//SEGGER_RTT_printf(0, "\n");
}

/* Complementary estimator by cf2 */
void stateEstimator(state_t *state, sensorData_t *sensorData, control_t *control, const uint32_t tick)
{
	/* Attitude estimate + Z velocity*/
	if (RATE_DO_EXECUTE(ATTITUDE_UPDATE_RATE, tick)) {
		sensorfusion6UpdateQ(sensorData->gyro.x, sensorData->gyro.y, sensorData->gyro.z, sensorData->acc.x, sensorData->acc.y, sensorData->acc.z, ATTITUDE_UPDATE_DT);

		sensfusion6GetEulerRPY(&state->attitude.roll, &state->attitude.pitch, &state->attitude.yaw);

		state->acc.z = sensfusion6GetAccZ(sensorData->acc.x, sensorData->acc.y, sensorData->acc.z) - baseZacc;

		positionUpdateVelocity(state->acc.z, ATTITUDE_UPDATE_DT); //update internalState obj(internal) accelZ
	}

	/* Position estimate */
	if (RATE_DO_EXECUTE(POS_UPDATE_RATE, tick)) {
		tofMeasurement_t tofMeasurement;
		aquireTofMeasurement(&tofMeasurement);
		positionEstimate(state, sensorData, &tofMeasurement, POS_UPDATE_DT, tick, &internalState);
		state->position.z = internalState.estimatedZ;
	}
}

void stateEstimatorUpdate(uint32_t tick)
{
	stateEstimator(&state, &sensorData, &control, tick); //DT does not matter for now.
							     //    printf("p:%-5f, r:%-5f, y:%-5f \n", (state.attitude.pitch/M_PI_F*180.0f), state.attitude.roll/M_PI_F*180.0f, state.attitude.yaw/M_PI_F*180.0f);
							     //SEGGER_RTT_printf(0, "p:%-5d, r:%-5d, y:%-5d \n", (int)(state.attitude.pitch), (int)(state.attitude.roll), (int)(state.attitude.yaw));
}

float getYaw()
{
	return state.attitude.yaw;
}