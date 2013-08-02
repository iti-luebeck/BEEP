#!/usr/bin/env python


import serial

from multiprocessing import Lock


import roslib; roslib.load_manifest('Beep_main_node')
import rospy
import time
from std_msgs.msg import Int8, Int32
from beep_msgs.msg import *


devices = [ 0x00, #IR raw
			0x10, #IR filtered
			0x20, #RGB sensor 
			0x30, #wheel encoder
			0x40, #motors
			0x50, #RGB-LED
			0x60] #Battery LED

port = serial.Serial("/dev/ttyAMA0", baudrate=76800, timeout=0.01)
USART_TIMEOUT = 0.1

writing = Lock() #Lock object for blocking usart

# creating publisher for all sensors
def talker():
	pub_IRraw = rospy.Publisher("IR_raw", IR)
	pub_IRfiltered = rospy.Publisher("IR_filtered", IR)
	pub_RGB = rospy.Publisher("ground_colors", Color_sensors)
	pub_speed = rospy.Publisher("speed", Speed)


	while not rospy.is_shutdown():
		#get and publish IR raw data
		ir = IR()
		port.write(chr(devices[0] | 0x0f))
		for i in range(0, 8):
			ir.ir[i] = readByte(port)
		
		ir.header.frame_id = "IR"
		ir.header.stamp = rospy.get_rostime()
		pub_IRraw.publish(ir)

		#get and publish IR daylight filtered data
		ir_filtered = IR()
		port.write(chr(devices[1] | 0x0f))
		for i in range(0, 8):
			ir_filtered.ir[i] = readByte(port)
		
		ir_filtered.header.frame_id = "IR"
		ir_filtered.header.stamp = rospy.get_rostime()
		pub_IRfiltered.publish(ir_filtered)
		
		#get and publish detected groundcolours
		color = Color_sensors()
		port.write(chr(devices[2] | 0x04))
		for i in range(0, 3):
			color.sensors[i].r = readByte(port)
			color.sensors[i].g = readByte(port)
			color.sensors[i].b = readByte(port)
			color.sensors[i].w = readByte(port)
		color.header.frame_id = "Color_Sensors"
		color.header.stamp = rospy.get_rostime()
		pub_RGB.publish(color)

		#get and publish speed
		speed = Speed() 
		port.write(chr(devices[1] | 0x08))
		speed.motor[0] = readByte(port)
		speed.motor[1] = readByte(port)

		#TODO was bekomme ich? umrechnen (-100 bis 100)!
		speed.header.frame_id = "Motors"
		speed.header.stamp = rospy.get_rostime()
		pub_speed.publish(speed)

		rospy.sleep(0.05)


def readByte(p):
	startTime = time.time()
	
	while True:
		ch = p.read()
		if len(ch)==1:
			#print ord(ch) #debug
			return ord(ch)

#		print 'Error: USART timeout'
		return 0


#Tell atxmega the speed for left motor
def cbMotorLeft(msg):
	writing.acquire()
	print 'motor_l: ' + str(msg.data) #debug
	port.write(chr(devices[4] | 0x01))
	sendMotorSpeed(msg.data)
	writing.release()

#Tell atxmega the speed for left motor
def cbMotorRight(msg):
	writing.acquire()
	print 'motor_r: ' + str(msg.data) #debug
	port.write(chr(devices[4] | 0x02))
	sendMotorSpeed(msg.data)
	writing.release()

#transmits the speedvalue in range from -128 to 127 as char to atxmega
def sendMotorSpeed(s):
	if s > 127:
		port.write(chr(127))
	elif s < -128:
		port.write(chr(255))
	elif s < 0:
		s = 256 + s #converting in twoscomplement
		port.write(chr(s))
	else:
		port.write(chr(s))

#Tell atxmega the color of a led
def cbLeds(msg):
	writing.acquire()
	print 'LED' + str(msg.led) + ': ' + str(hex(msg.col.r))[-2:] + str(hex(msg.col.g))[-2:] + str(hex(msg.col.b))[-2:] #debug
	port.write(chr(devices[5] | msg.led))#led
	port.write(chr(msg.col.r))#r
	port.write(chr(msg.col.g))#g
	port.write(chr(msg.col.b))#b
	writing.release()

def listener():
	rospy.Subscriber("motor_l", Int8, cbMotorLeft)
	rospy.Subscriber("motor_r", Int8, cbMotorRight)
	rospy.Subscriber("leds", Led, cbLeds)

	
if __name__ == '__main__':
	rospy.init_node('Beep')
	port.write(chr(devices[4] | 0x0e)) #enable motor driver
	listener()
	talker()
	
	pass
	
