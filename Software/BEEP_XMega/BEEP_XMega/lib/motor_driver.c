#include "motor_driver.h"

void set_motor_operation_mode(motor_t motor, motor_op_mode_t op){
	PORTE.OUTCLR = 0b11 << motor;
	PORTE.OUTSET = op << motor;
}

void init_motor(void){
 	PORTE.DIRSET = PIN4_bm | PIN5_bm | PIN6_bm | PIN7_bm; //Set Motor control as output
 	PORTA.DIRSET = PIN6_bm; // Standby as output
 	PORTC.DIRSET = PIN2_bm | PIN3_bm; //PWM as output
 	
 	TCC0.CTRLA = TC_CLKSEL_DIV1_gc; //prescaler: Clk/1
 	TCC0.CTRLB = TC0_CCCEN_bm|TC0_CCDEN_bm| TC_WGMODE_SS_gc; //enable pwm output, Single slope pwm
 	
 	TCC0.PER = 0xff;
	

}

void set_motor_speed(motor_t motor, uint8_t speed){
	if(speed > 0xaa){//ensure 5V average
		speed = 0xaa;
	}
	
	if(motor == motor_l){
		TCC0.CCD = speed;
	} else if(motor == motor_r){
		TCC0.CCC = speed;
	}
}

void set_motor_on(bool b){
	if(b){
		PORTA.OUTSET = PIN6_bm;
		}else{
		PORTA.OUTCLR = PIN6_bm;
	}
}

