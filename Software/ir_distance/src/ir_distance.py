#!/usr/bin/env python


import serial

import roslib; roslib.load_manifest('ir_distance')
import rospy
from std_msgs.msg import Int16


def talk():
	port = serial.Serial("/dev/ttyAMA0", baudrate=115200, timeout=3.0)
	topic = 'IRSensor/IR0'
	publisher = rospy.Publisher(topic, Int16)
	while not rospy.is_shutdown():
		msg = Int16()
		msg.data = int(readLine(port))
		publisher.publish(msg)

def readLine(p):
	rv = ""
	while True:
		ch = p.read()
		if ch=='\r':
			return rv
		if ch!='\n':
			rv += ch

	
if __name__ == '__main__':
	rospy.init_node('IRNode_Serial')
	talk()
	pass
	
