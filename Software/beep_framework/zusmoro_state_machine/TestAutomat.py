#!/usr/bin/env python

import roslib; roslib.load_manifest('zusmoro_state_machine')
import rospy
import smach
import smach_ros

import colorsys
from beep_msgs.msg import Color_sensors
import time
from std_msgs.msg import Int8
from beep_msgs.msg import Color
from beep_msgs.msg import Led
from beep_msgs.msg import IR


t_timer = time.time()
ir = [0, 0, 0, 0, 0, 0, 0, 0]
colorSensor = [0, 0, 0]
pub_BEEP = rospy.Publisher('/beep', Int8)
pub_MOTOR2 = rospy.Publisher('/motor_r', Int8)
pub_led = rospy.Publisher('/leds', Led)
pub_MOTOR1 = rospy.Publisher('/motor_l', Int8)


class State1(smach.State):
	def __init__(self):
		smach.State.__init__(self, outcomes=[])

	def execute(self, userdata):
		rospy.loginfo('Executing state State 1')
		global ir
		global colorSensor
		global t_timer
		t_timer = time.time()
		global pub_led
		global pub_MOTOR1
		global pub_MOTOR2
		global pub_BEEP
		MOTOR1 = Int8()
		MOTOR1.data = 0
		pub_MOTOR1.publish(MOTOR1)
		MOTOR2 = Int8()
		MOTOR2.data = 0
		pub_MOTOR2.publish(MOTOR2)
		BEEP = Int8()
		BEEP.data = 1
		pub_BEEP.publish(BEEP)

		while not rospy.is_shutdown():
			rospy.sleep(0.01)


def color_cb(msg):
	global colorSensor
	for (i, sensor) in enumerate(msg.sensors):
		groundColor[i] = colorsys.rgb_to_hsv(sensor.r, sensor.g, sensor.b)[0]

def ir_cb(msg):
	global ir
	ir = msg.ir

if __name__ == '__main__':
	rospy.init_node('zusmoro_state_machine')
	
	rospy.Subscriber('/IR_filtered', IR, ir_cb)

	rospy.Subscriber('/ground_Color', Color_sensors, color_cb)

	sm = smach.StateMachine(outcomes=[])
	with sm:
		smach.StateMachine.add('State1', State1(), transitions={})
	sis = smach_ros.IntrospectionServer('Beep_State_Server', sm, '/SM_ROOT')
	sis.start()
	sm.execute()
	rospy.spin()
	sis.stop()