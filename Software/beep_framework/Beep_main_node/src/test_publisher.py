#!/usr/bin/env python


import serial

import roslib; roslib.load_manifest('Beep_main_node')
import rospy
from std_msgs.msg import Int8, Int32
from beep_msgs.msg import *
import colorsys


	
if __name__ == '__main__':
	rospy.init_node('test_Publisher')
	pub = rospy.Publisher('led', Led)

	while not rospy.is_shutdown():	
		led = Led()
		led.header.frame_id = "test"
		led.header.stamp = rospy.get_rostime()
	
		c = Color()
		c.r = 0x50
		c.g = 0xFF
		c.b = 0x3E
		c.w = 0x12


		led.col = c

		led.led = 5

#		pub.publish(led)
		print colorsys.rgb_to_hsv(100,180,50)[0]

	pass
	
