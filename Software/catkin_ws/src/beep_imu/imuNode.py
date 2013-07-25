#!/usr/bin/env python
from __future__ import division

import roslib; roslib.load_manifest('beep_imu')

import rospy
import tf

from sensor_msgs.msg import Imu
from geometry_msgs.msg import Vector3Stamped
from tf.transformations import euler_from_quaternion
from std_msgs.msg import String

from math import degrees, atan2

import smbus
import time

bus = smbus.SMBus(1)

linearAddress = 0x53
angleAddress = 0x69
compassAddress = 0x1e

#pub_mag_xsens = rospy.Publisher('imu/mag', Vector3Stamped)

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
	# normal filter mode
	bus.write_byte_data(angleAddress, 0x21, 0x20)
	#bus.write_byte_data(angleAddress, 0x24, 0x12)
	# power and axes on
	bus.write_byte_data(angleAddress, 0x20, 0x0f)

	#setup compass
	bus.write_byte_data(compassAddress, 0x00, 0x70) #average 8 samples
	bus.write_byte_data(compassAddress, 0x01, 0x20) #set gain
	bus.write_byte_data(compassAddress, 0x02, 0x00) #operating mode
	
# reading imu data and publishing Imu msg to topic Imu
def talker():
	pub_imu = rospy.Publisher('imu/data_raw', Imu)
	pub_mag = rospy.Publisher('imu/mag', Vector3Stamped)

	rospy.init_node('ImuPublisherNode')
	
	rospy.loginfo('starting ImuPublisherNode')

	rospy.Subscriber("/magnetic", Vector3Stamped, callback)


	while not rospy.is_shutdown():
		imu_msg = Imu()
		imu_msg.header.stamp = rospy.get_rostime()
		imu_msg.header.frame_id = '/map'
		storeLinearAcceleration(imu_msg)
		storeAngularVelocity(imu_msg)
		
		pub_imu.publish(imu_msg)

		mag_msg = Vector3Stamped()
		mag_msg.header.stamp = rospy.get_rostime()
		mag_msg.header.frame_id = '/map'
		storeCompassOrientation(mag_msg)

		pub_mag.publish(mag_msg)

		rospy.sleep(0.01)
	
	rospy.loginfo('ImuPublisherNode shut down')

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
	#msg.linear_acceleration_covariance[0]=0.01201314625
	#msg.linear_acceleration_covariance[4]=0.01201314625
	#msg.linear_acceleration_covariance[8]=0.01569064

	msg.orientation.x=0
	msg.orientation.y=0
	msg.orientation.z=0
	msg.orientation.w=0

	#msg.angular_velocity_covariance[0]=-1
	#msg.orientation_covariance[0]=-1
	return msg

def storeAngularVelocity(msg):
	"""Reads the current angular velocity of x, y, z axis and stores it in the Imu message msg

    Args:
        msg: Imu message to store current angular velocity in
    Returns:
        The new Imu message
    """
	#read current angular velocity
	x = bus.read_byte_data(angleAddress, 0x28)
	x += bus.read_byte_data(angleAddress, 0x29) * 0x100
	y = bus.read_byte_data(angleAddress, 0x2a)
	y += bus.read_byte_data(angleAddress, 0x2b) * 0x100
	z = bus.read_byte_data(angleAddress, 0x2c)
	z += bus.read_byte_data(angleAddress, 0x2d) * 0x100
	
	x = decFrom2Compl(x, 16)
	y = decFrom2Compl(y, 16)
	z = decFrom2Compl(z, 16)

	#print x

	#update angular velocity in msg
	#TODO Zahlenbereich von -2^14 bis 2^14 -1 warum nicht -2^15 bis 2^15 - 1 ???
		#aktuell mit 2^15. gut oder nicht?!
	msg.angular_velocity.x = scaleToRange(x, -32768, 32767, -4.363323, 4.363323)
	msg.angular_velocity.y = scaleToRange(y, -32768, 32767, -4.363323, 4.363323)
	msg.angular_velocity.z = scaleToRange(z, -32768, 32767, -4.363323, 4.363323)
	#msg.angular_velocity_covariance[0]=0.01201314625
	#msg.angular_velocity_covariance[4]=0.01201314625
	#msg.angular_velocity_covariance[8]=0.01569064
	return msg

#TODO was soll mit den Magnetwerten geschehen?
def storeCompassOrientation(msg):
	"""Reads the current compass orientation of x, y, z axis and stores it in the Imu message msg

    Args:
        msg: Imu message to store current compass orientation in
    Returns:
        The new Imu message
    """



	x = bus.read_byte_data(compassAddress, 0x04)
	x += bus.read_byte_data(compassAddress, 0x03) * 0x100
	y = bus.read_byte_data(compassAddress, 0x06)
	y += bus.read_byte_data(compassAddress, 0x05) * 0x100
	z = bus.read_byte_data(compassAddress, 0x08)
	z += bus.read_byte_data(compassAddress, 0x07) * 0x100

	x = decFrom2Compl(x, 12)
	y = decFrom2Compl(y, 12)
	z = decFrom2Compl(z, 12)

	#print(x)

	#x = scaleToRange(x, -2048, 2047, -1, 1)
	#y = scaleToRange(y, -2048, 2047, -1, 1)
	#z = scaleToRange(z, -2048, 2047, -1, 1)

	msg.vector.x = x
	msg.vector.y = y
	msg.vector.z = z

	return msg

def callback(data):
	
	data.header.stamp = rospy.get_rostime()
	x=data.vector.x
	y=data.vector.y
	z=data.vector.z

	#data.vector.x=z
	#data.vector.y=y
	#data.vector.z=x

	pub_mag_xsens.publish(data)




if __name__ == '__main__':
	init()
	talker()
	pass
	
	
	
