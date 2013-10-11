#pragma once

#include <stdint.h>
#include <stdbool.h>
#include <avr/pgmspace.h>
#include "usart_driver.h"

#define BEEP_COM_IR0 0x00
#define BEEP_COM_IR1 0x01
#define BEEP_COM_IR2 0x02
#define BEEP_COM_IR3 0x03
#define BEEP_COM_IR4 0x04
#define BEEP_COM_IR5 0x05
#define BEEP_COM_IR6 0x06
#define BEEP_COM_IR7 0x07
#define BEEP_COM_IR_ALL 0x0f
#define ADC_TASK_IDLE 0
#define ADC_TASK_IR_ONCE 1
#define ADC_TASK_IR_CONTINUES 2
#define ADC_TASK_IR_FILTERED_ONCE 3
#define ADC_TASK_IR_FILTERED_CONTINUES 4

#define BEEP_DEV_IR 0x00
#define BEEP_DEV_IR_FILTERED 0x10



//lookup table for logarithm values scaled to 8 Bit
//calculated using wolfram alpha
//table[round(log_10(x) / (log_10(2047))*255) ,{x,1,2047,1}]
//first value =0
extern const uint8_t scaleIRTable[2048] PROGMEM;

#define BUFFER_SIZE 8 //number of values for ir-average filter

/*! \brief Initializes led outputpins and adc device 
*	ADC enabled, signed mode, no current limit, no freerun, internal 1V reference, 12 bit resolution, 512 clock divider, interupts enabled (low priority)
*	LED outputpins: PortF: pin 0, 1, 2
*/
void init_ir_driver(void);

/*! \brief measures multiple distances with turned on/off filter
*	If filter is turned on there will be a daylight filter and an average filter turned on.
*	Sets the adc_task, number of conversions that will have to be done and cur_ir_led.
*	\param start_led	First ir distance that shall be measured
*	\param count		Number of sensors that will be measured
*	\param filtered		turns on/off the daylight and average filter
*/
void measure_ir_distances(uint8_t start_led, uint8_t count, bool filtered);


/*! \brief  handling of results of adc conversions (ir distances)
*	ISR that shall be placed in the ISR(ADCA_CH0_vect) of the application.
*	Handles data of the ADC result register interpreting it as distances of an ir-sensor.
*	Buffers multiple measurements if filters are activated and starts new measurements if multiple ir-senors shall be read or filtermode is activated.
*	If requested data is ready sends it as a Byte to the USART_data given by suart_driver
*/
void ISR_adc_ir_driver();

/*! \brief indicates whether last measuring task is already done or still measuring
*	\retval true	Last measurment task is still in progress
*	\retval false	Currently doing nothing, no conversion/measurement in progress
*/
bool ir_driver_is_measuring(void);