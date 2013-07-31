#!/usr/bin/env python


import serial

import roslib; roslib.load_manifest('Beep_main_node')
import rospy
from std_msgs.msg import Int8, Int32
from beep_msgs.msg import *


devices = [ 0x00, #IR raw
			0x10, #IR filtered
			0x20, #RGB sensor 
			0x30, #wheel encoder
			0x40, #motors
			0x50, #RGB-LED
			0x60] #Battery LED

port = serial.Serial("/dev/ttyAMA0", baudrate=115200, timeout=3.0)

# creating publisher for all sensors
def talker():
	pub_IRraw = rospy.Publisher("IR_raw", IR)
	pub_IRfiltered = rospy.Publisher("IR_filtered", IR)
	pub_RGB = rospy.Publisher("ground_colors", Color_sensors)
	pub_speed = rospy.Publisher("speed", Speed)


	while not rospy.is_shutdown():
		#get and publish IR raw data
		ir = IR()
		port.write(chr(devices[0] | 0x08))
		for i in range(0, 8):
			ir.ir[i] = int(readLine(port))
		
		ir.header.frame_id = "IR"
		ir.header.stamp = rospy.get_rostime()
		pub_IRraw.publish(ir)

		#get and publish IR daylight filtered data
		ir_filtered = IR()
		port.write(chr(devices[1] | 0x08))
		for i in range(0, 8):
			ir_filtered.ir[i] = int(readLine(port))
		
		ir_filtered.header.frame_id = "IR"
		ir_filtered.header.stamp = rospy.get_rostime()
		pub_IRfiltered.publish(ir_filtered)
		
		#get and publish detected groundcolours
		color = Color_sensors()
		port.write(chr(devices[2] | 0x04))
		for i in range(0, 3):
			color.sensors[i].r = int(readLine(port))
			color.sensors[i].g = int(readLine(port))
			color.sensors[i].b = int(readLine(port))
			color.sensors[i].w = int(readLine(port))
		color.header.frame_id = "Color_Sensors"
		color.header.stamp = rospy.get_rostime()
		pub_RGB.publish(color)

		#get and publish speed
		speed = Speed() 
		port.write(chr(devices[1] | 0x08))
		speed.motor[0] = int(readLine(port))
		speed.motor[1] = int(readLine(port))

		#TODO was bekomme ich? umrechnen (-100 bis 100)!
		speed.header.frame_id = "Motors"
		speed.header.stamp = rospy.get_rostime()
		pub_speed.publish(speed)



def readLine(p):
	rv = ""
	while True:
		ch = p.read()
		if ch=='\r':
			return rv
		if ch!='\n':
			rv += ch

#Tell atxmega the speed for left motor
def cbMotorLeft(msg):
	port.write(chr(devices[4] | 0x01))
	sendMotorSpeed(msg.data)

#Tell atxmega the speed for left motor
def cbMotorRight(msg):
	port.write(chr(devices[4] | 0x02))
	sendMotorSpeed(msg.data)

#transmits the speedvalue in range from 0 to 200 as char to atxmega
def sendMotorSpeed(s):
	if s > 100:
		port.write(chr(200))
	elif s < -100:
		port.write(chr(0))
	else:
		port.write(chr(s+100))

#Tell atxmega the color of a led
def cbLeds(msg):
	port.write(chr(devices[5] | msg.led))#led
	port.write(chr(msg.col.r))#r
	port.write(chr(msg.col.g))#g
	port.write(chr(msg.col.b))#b


def listener():
	#motor listeners waiting for speed in range of -100 to 100
	rospy.Subscriber("motor_l", Int8, cbMotorLeft)
	rospy.Subscriber("motor_r", Int8, cbMotorRight)
	rospy.Subscriber("leds", Led, cbLeds)

	
if __name__ == '__main__':
	rospy.init_node('Beep')
	listener()
	talker()
	pass
	
