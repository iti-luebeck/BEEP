#!/usr/bin/env python
from __future__ import division

import roslib; roslib.load_manifest('beep_imu')

import rospy
import tf

from sensor_msgs.msg import Imu
from tf.transformations import euler_from_quaternion
from std_msgs.msg import String


import smbus
import time

bus = smbus.SMBus(1)

linearAddress = 0x53
angleAddress = 0x69
compassAddress = 0x1e

def decFrom2Compl(val, bitlen):
	if val & (1 << bitlen - 1):
		val = val - (1 << bitlen)
	return val

#returns the val scaled from an old range into a new continouse range
def scaleToRange(val, oldMin, oldMax, newMin, newMax):
	val -= oldMin
	val /= oldMax - oldMin
	val *= newMax - newMin
	val += newMin
	return val

def init():
	# linear accelleration start messurement
	bus.write_byte_data(linearAddress, 0x2d, 0x08)

	# angular velocity
	# power and axes on
	bus.write_byte_data(angleAddress, 0x20, 0x0f)
	# normal filter mode
	bus.write_byte_data(angleAddress, 0x21, 0x20)
	
# reading imu data and publishing Imu msg to topic Imu
def talker():
	pub = rospy.Publisher('Imu', Imu)
	rospy.init_node('ImuPublisherNode')
	
	rospy.loginfo('starting Imu Node')

	while not rospy.is_shutdown():
		msg = Imu()
		msg.header.stamp = rospy.get_rostime()
		msg.header.frame_id = '\imu'

		storeLinearAcceleration(msg)
		storeAngularVelocity(msg)
		#storeCompassOrientation(msg)

		pub.publish(msg)
		rospy.sleep(0.2)
	
	rospy.loginfo('Imu Node shut down')

def storeLinearAcceleration(msg):
	"""Reads the current acceleration in x, y, z direction and stores it in the Imu message msg

    Args:
        msg: Imu message to store current linear accelerations in
    Returns:
        The new Imu message
    """
	#read current linear accelerations
	x = decFrom2Compl(bus.read_word_data(linearAddress, 0x32),16)
	y = decFrom2Compl(bus.read_word_data(linearAddress, 0x34),16)
	z = decFrom2Compl(bus.read_word_data(linearAddress, 0x36),16)	

	#update acceleration in msg
	msg.linear_acceleration.x = scaleToRange(x, -512, 511, -19.6133, 19.6133)
	msg.linear_acceleration.y = scaleToRange(y, -512, 511, -19.6133, 19.6133)
	msg.linear_acceleration.z = scaleToRange(z, -512, 511, -19.6133, 19.6133)
	msg.linear_acceleration_covariance[0]=0.01201314625
	msg.linear_acceleration_covariance[4]=0.01201314625
	msg.linear_acceleration_covariance[8]=0.01569064
	return msg

def storeAngularVelocity(msg):
	"""Reads the current angular velocity of x, y, z axis and stores it in the Imu message msg

    Args:
        msg: Imu message to store current angular velocity in
    Returns:
        The new Imu message
    """
	#read current angular velocity
	x = decFrom2Compl(bus.read_byte_data(angleAddress, 0x28),8)
	x += decFrom2Compl(bus.read_byte_data(angleAddress, 0x29),8) * 0x100
	y = decFrom2Compl(bus.read_byte_data(angleAddress, 0x2a),8)
	y += decFrom2Compl(bus.read_byte_data(angleAddress, 0x2b),8) * 0x100
	z = decFrom2Compl(bus.read_byte_data(angleAddress, 0x2c),8)
	z += decFrom2Compl(bus.read_byte_data(angleAddress, 0x2d),8) * 0x100
	
	#print x

	#update angular velocity in msg
	#TODO Zahlenbereich von -2^14 bis 2^14 -1 warum nicht -2^15 bis 2^15 - 1 ???
		#aktuell mit 2^15. gut oder nicht?!
	msg.angular_velocity.x = scaleToRange(x, -32768, 32767, -250, 250)
	msg.angular_velocity.y = scaleToRange(y, -32768, 32767, -250, 250)
	msg.angular_velocity.z = scaleToRange(z, -32768, 32767, -250, 250)
	#msg.angular_velocity_covariance[0]=0.01201314625
	#msg.angular_velocity_covariance[4]=0.01201314625
	#msg.angular_velocity_covariance[8]=0.01569064
	return msg

#TODO verstehen, was mir die Werte sagen sollen und in Orientation Quaternion umrechnen...
def storeCompassOrientation(msg):
	"""Reads the current compass orientation of x, y, z axis and stores it in the Imu message msg

    Args:
        msg: Imu message to store current compass orientation in
    Returns:
        The new Imu message
    """
	#read current angular velocity
	x = decFrom2Compl(bus.read_word_data(compassAddress, 0x03),16)
	y = decFrom2Compl(bus.read_word_data(compassAddress, 0x05),16)
	z = decFrom2Compl(bus.read_word_data(compassAddress, 0x07),16)

	
	#update compass Orientation in msg
	q = tf.transformations.quaternion_from_euler(z, y, x, 'rzyx')
	msg.orientation.x = q[0]
	msg.orientation.y = q[1]
	msg.orientation.z = q[2]
	msg.orientation.w = q[3]
	return msg



if __name__ == '__main__':
	init()
	talker()
	pass
	
	
	
