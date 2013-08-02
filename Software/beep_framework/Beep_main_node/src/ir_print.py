#!/usr/bin/env python


import serial

import roslib; roslib.load_manifest('Beep_main_node')
import rospy
from beep_msgs.msg import *
import colorsys


def cb(data):
	print data.ir[6]

	
if __name__ == '__main__':
	rospy.init_node('ir_printer')
	rospy.Subscriber("IR_filtered", IR, cb)
	rospy.spin()
	pass
	
