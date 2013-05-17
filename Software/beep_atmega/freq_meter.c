#include "freq_meter.h"

void setup_freq_measurement(){
	TIMSK1 = (1<<TOIE1);
}

void start_freq_measurement(){
	frequency = 0;
	overflows = 0;
	//enable pin-change interrupt for PB1, to count impulses
	PCMSK2 = (1<<PCINT23);
	PCICR = (1<<PCIE2);

	
	TCNT1 = 0; //reset count
	TCCR1B = (1<<CS10); //enable timer, no prescaler
}

uint16_t get_measured_freq(){
	if (overflows>=5){
		return frequency;		
	}else{
		return 0;
	}
}


ISR(PCINT2_vect) {
	frequency++;
}



ISR(TIMER1_OVF_vect) {
	overflows++;
	if(overflows >= 5){
		// stop timer
		TCCR1B = 0;
		//stop counting
		PCMSK2	= (0<<PCINT21);
		PCICR &= ~(1<<PCIE2);
		if(frequency==0){frequency=1;}
	}	
}