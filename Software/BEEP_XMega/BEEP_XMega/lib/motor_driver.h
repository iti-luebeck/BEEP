
#pragma once

#include <avr/io.h>
#include <stdbool.h>

/*! \brief First pin of left and right motor.
 *
 */
typedef enum motor_enum{
	motor_l = 4, //first pin of motor control
	motor_r = 6, //first pin of motor control
} motor_t;

/*! \brief Operation mode of the motor
 *
 *	a motor has 4 operation modes:
 *	turn clockwise
 *	turn counterclockwise
 *	stop (break)
 *	free run (no break)
 */
typedef enum motor_op_mode_enum{
	motor_cw = 0b01,
	motor_ccw = 0b10,
	motor_stop = 0b11,
	motor_free_run = 0b00,
} motor_op_mode_t;


/*! \brief Initialize motors and timer for PWM
 *	
 *	Declare output pins.
 *	Setup Timer 0 of port C for PWM
 *
 */
void init_motor(void);

/*! \brief Set operation mode of a motor
 *	
 *	Sets the mode of the motor.
 *
 *  \param motor     First control pin of the motor.
 *  \param op        Mode the motor shell operate in.
 */
void set_motor_operation_mode(motor_t motor, motor_op_mode_t op);

/*! \brief Set motor speed.
 *	
 *	Sets the speed of the motor.
 *	
 *	\note Maximum value for speed is 0xaaaa, to ensure max voltage of the motor. 
 *	Values greater than 0xaaaa will be replaced by 0xaaaa.
 *
 *  \param motor	which speed will be set
 *  \param speed	new speed for the motor
 */
void set_motor_speed(motor_t motor, uint8_t speed);

/*! \brief (de-)activate motor control
 *
 *	Deactivated by default. Activate, to run motors.
 *
 *  \param activate
 */
void set_motor_on(bool activate);

