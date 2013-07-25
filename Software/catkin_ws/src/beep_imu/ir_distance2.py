#!/usr/bin/env python

import smbus
import time

bus = smbus.SMBus(1)
irAddress = 0x39

def init():
	#bus.write_byte_data(irAddress, 0, 0);
	bus.write_byte_data(irAddress, 0x82, 0xFF) #set proximity integration time
	bus.write_byte_data(irAddress, 0x83, 0x00) #set wait time
	bus.write_byte_data(irAddress, 0x8D, 0x02) #set set wlong
	bus.write_byte_data(irAddress, 0x8E, 0x03) #set pulse count
	bus.write_byte_data(irAddress, 0x8F, 0x30) #100mA, diode channel 0 and 1
	bus.write_byte_data(irAddress, 0x80, 0x0F) #enable
	time.sleep(0.012)


init()
while True:
	print "Clear (not for 2671)"
	print bus.read_word_data(irAddress, 0x94) #PDATA
	print "IR (not for 2671)"
	print bus.read_word_data(irAddress, 0x96) #PDATA
	print "Prox"
	print bus.read_word_data(irAddress, 0xB8) #PDATA
	print
	time.sleep(0.05)
	
	
	
