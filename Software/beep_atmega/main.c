#include "main.h"

typedef struct RGB {
	uint8_t red;
	uint8_t green;
	uint8_t blue;
} RGB;

const uint8_t pwmtable_8D[32] PROGMEM =
{
	0, 1, 2, 2, 2, 3, 3, 4, 5, 6, 7, 8, 10, 11, 13, 16, 19, 23,
	27, 32, 38, 45, 54, 64, 76, 91, 108, 128, 152, 181, 215, 255
};

volatile RGB myColors[8];
uint8_t mplx = 0;
#define rgbID_mask 0b111
#define DEVICE_MASK 0xf0
#define COLOR_SENSOR 0x00
#define LEDS 0x10
uint8_t rgbLEDid;
uint8_t waitingForColor;
uint8_t mplx_wait = 0;


ISR(SPI_STC_vect){
	if(SPDR==0xff){
		SPDR = 0; //tue nichts
	}
	//TODO Blink Muster verarbeiten ersten 3 Bits
	if(waitingForColor==1){
		myColors[rgbLEDid].red=SPDR&0b11111;
		waitingForColor++;
	}else if(waitingForColor==2){
		myColors[rgbLEDid].green=SPDR&0b11111;
		waitingForColor++;
	}else if(waitingForColor==3){
		myColors[rgbLEDid].blue=SPDR&0b11111;
		waitingForColor=0;
	}else{
		switch (SPDR & DEVICE_MASK){
		case COLOR_SENSOR:
			if(SPDR <4 ){//Ground color			
				SPDR = last_color_freq[SPDR];
			}else if(SPDR == 0x0e){//calibrate without storing
				calibrate = 1;
			}else if(SPDR == 0x0f){//calibrate and store
				calibrate = 2;
			}
			break;
		case LEDS:
			rgbLEDid = SPDR & rgbID_mask;
			if(SPDR & 0b1000){
				waitingForColor=1;
				}else{
				myColors[rgbLEDid].red=0;
				myColors[rgbLEDid].green=0;
				myColors[rgbLEDid].blue=0;
			}
			break;
		default:
			SPDR = 0; //tue nichts 
			break;
		}
	}
}

void EEPROM_write(uint8_t uiAddress, float ucData)
{
	/*
	Wait for completion of previous write
	*/
	while(EECR & (1<<EEPE))
	;
	/* Set up address and Data Registers */
	EEAR = uiAddress;
	EEDR = ucData;
	/*
	Write logical one to EEMPE */
	EECR |= (1<<EEMPE);
	/* Start eeprom write by setting EEPE */
	EECR |= (1<<EEPE);
}

float EEPROM_read(uint8_t uiAddress)
{
	/* Wait for completion of previous write */
	while(EECR & (1<<EEPE))
	;
	/* Set up address register */
	EEAR = uiAddress;
	/*
	Start eeprom read by writing EERE */
	EECR |= (1<<EERE);
	/* Return data from Data Register */
	return EEDR;
}

void measure_color(uint8_t color){
	PORTB &= COLOR_BIT_MASK;
	PORTB |= (color<<S2);
	start_freq_measurement();
	while (get_measured_freq() == 0){}
	if(get_measured_freq() * scaleFactors[color] > 0xff){
		last_color_freq[color] = 0xff;
	}else {
		last_color_freq[color] = get_measured_freq() * scaleFactors[color];
	}
}

void calibrateColor(){
	for(uint8_t c = 0; c <= 3; c++){
		scaleFactors[c] = 1;
		measure_color(c);
		scaleFactors[c] = 255.0/last_color_freq[c];
	}
}


void setup_rgb_leds(){
		//setup rgb as output
		DDRD |= (1<<DDD3)|(1<<DDD5)|(1<<DDD6);
		
		//setup multiplexer outputs
		DDRC |= (1<<DDC2)|(1<<DDC1)|(1<<DDC0);
		
		// set up Timer0
		TCCR0A = (1<<COM0A1) | // OC0A inverted fast pwm
		(1<<COM0A0) |
		(1<<COM0B1) | // OC0B inverted fast pwm
		(1<<COM0B0) |
		(1<<WGM01)  | // fast pwm
		(1<< WGM00);  // fast pwm

		TCCR0B = (0<<FOC0A) |
		(0<<FOC0B) |
		(0<<WGM02) | // fast pwm
		(0<<CS02)  | // no prescaler
		(0<<CS01)  |
		(1<<CS00);
		
		// set up Timer2
		TCCR2A = (0<<COM2A1) | //OC2A normal
		(0<<COM2A0) |
		(1<<COM0B1) | // OC2B inverted pwm
		(1<<COM0B0) |
		(1<<WGM01)  | // fast pwm
		(1<< WGM00);  // fast pwm

		TCCR2B = (0<<FOC0A) |
		(0<<FOC0B) |
		(0<<WGM02) | // fast pwm
		(0<<CS02)  | // no prescaler
		(0<<CS01)  |
		(1<<CS00);
		
		TIMSK2 = (1<<TOIE2);
		
}

ISR(TIMER2_OVF_vect){
	if(mplx_wait<0x50){
		mplx_wait++;
	}else{
		//turn all pwm off
		TCCR0A &= ~((1<<COM0A1) |(1<<COM0A0)|(1<<COM0B1) |(1<<COM0B0));
		TCCR2A &= ~((1<<COM2B1) |(1<<COM2B0));
		PORTD |= (1<<PD3)|(1<<PD5)|(1<<PD6);

		//set
		PORTC &= ~rgbID_mask;

		mplx++;
		mplx &= rgbID_mask;
		
		PORTC |= mplx;

		if(myColors[mplx].blue){
			//set intensity, turn on
			OCR0A = myColors[mplx].blue;
			TCCR0A |= (1<<COM0A1) |(1<<COM0A0);
		}

		if(myColors[mplx].green){
			//set intensity, turn on
			OCR2B = myColors[mplx].green;
			TCCR2A |= (1<<COM2B1) |(1<<COM2B0);
		}

		if(myColors[mplx].red){
			//set intensity, turn on
			OCR0B = myColors[mplx].red;
			TCCR0A |= (1<<COM0B1) |(1<<COM0B0);
		}
		mplx_wait=0;
	}
}

int main() {
	//Set MOSI input 
	DDRB |= (1<<DDB4);
	//Todo set other as output

	//Enable SPI, (Slave), enable interrupts 
	SPCR = (1<<SPE) | (1<<SPIE);
	
	setup_rgb_leds();

	setup_freq_measurement();
	//Setup Ports for selecting color
	DDRB &= ~((1<<S2)&(1<<S3));



	// set some colors
	myColors[0].red = 0xff;
	myColors[0].green = 0x00;
	myColors[0].blue = 0x00;
	
	myColors[1].red = 0x00;
	myColors[1].green = 0xff;
	myColors[1].blue = 0x00;
	
	myColors[2].red = 0x00;
	myColors[2].green = 0x00;
	myColors[2].blue = 0xff;
	
	myColors[3].red = 0xff;
	myColors[3].green = 0xff;
	myColors[3].blue = 0x0;
	
	myColors[4].red = 0xff;
	myColors[4].green = 0x00;
	myColors[4].blue = 0xff;
	
	myColors[5].red = 0x00;
	myColors[5].green = 0xff;
	myColors[5].blue = 0xff;
	
	myColors[6].red = 0x00;
	myColors[6].green = 0x00;
	myColors[6].blue = 0x00;
	
	myColors[7].red = 0x00;
	myColors[7].green = 0x00;
	myColors[7].blue = 0x00;

	waitingForColor = 0;

	//enable interrupts
	sei();
	
	
	
	calibrate = 2;
	
	while (1)
    {
		if(calibrate==1){
			scaleFactors[0]=EEPROM_read(0x00);
			scaleFactors[1]=EEPROM_read(0x01);
			scaleFactors[2]=EEPROM_read(0x02);
			scaleFactors[3]=EEPROM_read(0x03);
			calibrate=0;
		}
		if(calibrate){
			calibrate-=2;
			calibrateColor();
			if(calibrate){
				cli();
				EEPROM_write(0x00,scaleFactors[0]);
				EEPROM_write(0x01,scaleFactors[1]);
				EEPROM_write(0x02,scaleFactors[2]);
				EEPROM_write(0x03,scaleFactors[3]);
				sei();
				calibrate=0;
			}
		}
		for(uint8_t c = 0; c <= 3; c++){
			measure_color(c);
		}
		//LED 8 als debug Ausgabe
		myColors[7].red = (uint8_t) pgm_read_byte (&pwmtable_8D[last_color_freq[0]/(255/31)]);
		myColors[7].green = (uint8_t) pgm_read_byte (&pwmtable_8D[last_color_freq[3]/(255/31)]);
		myColors[7].blue = (uint8_t) pgm_read_byte (&pwmtable_8D[last_color_freq[1]/(255/31)]);
		
	}


}
