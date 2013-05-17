#ifndef AVR205_FREQUENCY_MEASURE_INTERRUPT_H_
#define AVR205_FREQUENCY_MEASURE_INTERRUPT_H_

#include <avr/io.h>
#include <compat/ina90.h>
#include <avr/interrupt.h>
#include "freq_meter.h"
#include <util/delay.h>
#include <avr/pgmspace.h>


/*! \brief  Measures color and stores value in last_color_freq
 *
 *  \note  this methode uses the scaleFactors to scale to a correct part of the rgb value. Call calibrateColor first.
 */
void measure_color(uint8_t color);

/*! \brief  stores the scaleFactors while measuring white.
 *
 *  \note  let the sensore see white, when calibrating.
 */
void calibrateColor();

void setup_rgb_leds();



volatile uint8_t last_color_freq[4];	//last measured values
volatile float scaleFactors[4];			//values to scale to rgb values
volatile uint8_t calibrate;				//flag to indicate the main to calibrate the scaleFactors

//ground colorsensor
#define S2				PB0 //uses PD6 and PD7 to set color for measurement
#define S3				PB1
#define COLOR_BIT_MASK	0xff & ~((1<<S2)|(1<<S3))

//LEDs
#define PWM_R 

#endif /* AVR205_FREQUENCY_MEASURE_INTERRUPT_H_ */