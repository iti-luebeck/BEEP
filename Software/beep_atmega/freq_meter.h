#include <avr/io.h>
#include <avr/interrupt.h>

#ifndef FREQ_METER2_H_
#define FREQ_METER2_H_

volatile uint16_t frequency;
volatile uint16_t overflows;

#ifndef F_CPU
#define F_CPU 14745600UL
#endif

void setup_freq_measurement();
void start_freq_measurement();
uint16_t get_measured_freq();

#endif /* FREQ_METER2_H_ */