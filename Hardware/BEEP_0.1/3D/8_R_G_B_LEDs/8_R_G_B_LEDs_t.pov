//POVRay-Datei erstellt mit 3d41.ulp v20110101
///home/flexxxv/eagle/BEEP_0.1/8_R_G_B_LEDs.brd
//29.04.13 04:14

#version 3.5;

//Set to on if the file should be used as .inc
#local use_file_as_inc = off;
#if(use_file_as_inc=off)


//changes the apperance of resistors (1 Blob / 0 real)
#declare global_res_shape = 1;
//randomize color of resistors 1=random 0=same color
#declare global_res_colselect = 0;
//Number of the color for the resistors
//0=Green, 1="normal color" 2=Blue 3=Brown
#declare global_res_col = 1;
//Set to on if you want to render the PCB upside-down
#declare pcb_upsidedown = off;
//Set to x or z to rotate around the corresponding axis (referring to pcb_upsidedown)
#declare pcb_rotdir = x;
//Set the length off short pins over the PCB
#declare pin_length = 2.5;
#declare global_diode_bend_radius = 1;
#declare global_res_bend_radius = 1;
#declare global_solder = on;

#declare global_show_screws = on;
#declare global_show_washers = on;
#declare global_show_nuts = on;

#declare global_use_radiosity = on;

#declare global_ambient_mul = 1;
#declare global_ambient_mul_emit = 0;

//Animation
#declare global_anim = off;
#local global_anim_showcampath = no;

#declare global_fast_mode = off;

#declare col_preset = 2;
#declare pin_short = on;

#declare e3d_environment = off;

#local cam_x = 0;
#local cam_y = 286;
#local cam_z = -96;
#local cam_a = 20;
#local cam_look_x = 0;
#local cam_look_y = -4;
#local cam_look_z = 0;

#local pcb_rotate_x = 0;
#local pcb_rotate_y = 0;
#local pcb_rotate_z = 0;

#local pcb_board = on;
#local pcb_parts = on;
#local pcb_wire_bridges = off;
#if(global_fast_mode=off)
	#local pcb_polygons = on;
	#local pcb_silkscreen = on;
	#local pcb_wires = on;
	#local pcb_pads_smds = on;
#else
	#local pcb_polygons = off;
	#local pcb_silkscreen = off;
	#local pcb_wires = off;
	#local pcb_pads_smds = off;
#end

#local lgt1_pos_x = 34;
#local lgt1_pos_y = 51;
#local lgt1_pos_z = 22;
#local lgt1_intense = 0.753532;
#local lgt2_pos_x = -34;
#local lgt2_pos_y = 51;
#local lgt2_pos_z = 22;
#local lgt2_intense = 0.753532;
#local lgt3_pos_x = 34;
#local lgt3_pos_y = 51;
#local lgt3_pos_z = -15;
#local lgt3_intense = 0.753532;
#local lgt4_pos_x = -34;
#local lgt4_pos_y = 51;
#local lgt4_pos_z = -15;
#local lgt4_intense = 0.753532;

//Do not change these values
#declare pcb_height = 1.500000;
#declare pcb_cuheight = 0.035000;
#declare pcb_x_size = 89.540000;
#declare pcb_y_size = 41.850000;
#declare pcb_layer1_used = 1;
#declare pcb_layer16_used = 0;
#declare inc_testmode = off;
#declare global_seed=seed(54);
#declare global_pcb_layer_dis = array[16]
{
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	1.535000,
}
#declare global_pcb_real_hole = 2.000000;

#include "e3d_tools.inc"
#include "e3d_user.inc"

global_settings{charset utf8}

#if(e3d_environment=on)
sky_sphere {pigment {Navy}
pigment {bozo turbulence 0.65 octaves 7 omega 0.7 lambda 2
color_map {
[0.0 0.1 color rgb <0.85, 0.85, 0.85> color rgb <0.75, 0.75, 0.75>]
[0.1 0.5 color rgb <0.75, 0.75, 0.75> color rgbt <1, 1, 1, 1>]
[0.5 1.0 color rgbt <1, 1, 1, 1> color rgbt <1, 1, 1, 1>]}
scale <0.1, 0.5, 0.1>} rotate -90*x}
plane{y, -10.0-max(pcb_x_size,pcb_y_size)*abs(max(sin((pcb_rotate_x/180)*pi),sin((pcb_rotate_z/180)*pi)))
texture{T_Chrome_2D
normal{waves 0.1 frequency 3000.0 scale 3000.0}} translate<0,0,0>}
#end

//Animationsdaten
#if(global_anim=on)
#declare global_anim_showcampath = no;
#end

#if((global_anim=on)|(global_anim_showcampath=yes))
#declare global_anim_npoints_cam_flight=0;
#warning "Keine/zu wenig Animationsdaten vorhanden (mind. 3 Punkte) (Flugpfad)"
#end

#if((global_anim=on)|(global_anim_showcampath=yes))
#declare global_anim_npoints_cam_view=0;
#warning "Keine/zu wenig Animationsdaten vorhanden (mind. 3 Punkte) (Blickpunktpfad)"
#end

#if((global_anim=on)|(global_anim_showcampath=yes))
#end

#if((global_anim_showcampath=yes)&(global_anim=off))
#end
#if(global_anim=on)
camera
{
	location global_anim_spline_cam_flight(clock)
	#if(global_anim_npoints_cam_view>2)
		look_at global_anim_spline_cam_view(clock)
	#else
		look_at global_anim_spline_cam_flight(clock+0.01)-<0,-0.01,0>
	#end
	angle 45
}
light_source
{
	global_anim_spline_cam_flight(clock)
	color rgb <1,1,1>
	spotlight point_at 
	#if(global_anim_npoints_cam_view>2)
		global_anim_spline_cam_view(clock)
	#else
		global_anim_spline_cam_flight(clock+0.01)-<0,-0.01,0>
	#end
	radius 35 falloff  40
}
#else
camera
{
	location <cam_x,cam_y,cam_z>
	look_at <cam_look_x,cam_look_y,cam_look_z>
	angle cam_a
	//versetzt die Kamera, sodass <0,0,0> über dem Eagle-Nullpunkt ist
	//translate<-44.770000,0,-20.925000>
}
#end

background{col_bgr}
light_source{<lgt1_pos_x,lgt1_pos_y,lgt1_pos_z> White*lgt1_intense shadowless}
light_source{<lgt2_pos_x,lgt2_pos_y,lgt2_pos_z> White*lgt2_intense shadowless}
light_source{<lgt3_pos_x,lgt3_pos_y,lgt3_pos_z> White*lgt3_intense shadowless}
light_source{<lgt4_pos_x,lgt4_pos_y,lgt4_pos_z> White*lgt4_intense}
#end


#macro Z_R_G_B_LEDS(mac_x_ver,mac_y_ver,mac_z_ver,mac_x_rot,mac_y_rot,mac_z_rot)
union{
#if(pcb_board = on)
difference{
union{
//Platine
prism{-1.500000,0.000000,8
<0.000000,0.000000><89.540000,0.100000>
<89.540000,0.100000><89.540000,41.850000>
<89.540000,41.850000><0.000000,41.850000>
<0.000000,41.850000><0.000000,0.000000>
texture{col_brd}}
}//End union(PCB)
//Bohrungen(real)/Bauteile
cylinder{<4.100000,1,4.100000><4.100000,-5,4.100000>1.600000 texture{col_hls}}
cylinder{<85.500000,1,4.200000><85.500000,-5,4.200000>1.600000 texture{col_hls}}
cylinder{<85.400000,1,37.800000><85.400000,-5,37.800000>1.600000 texture{col_hls}}
//Bohrungen(real)/Platine
//Bohrungen(real)/Durchkontaktierungen
}//End difference(reale Bohrungen/Durchbrüche)
#end
#if(pcb_parts=on)//Bauteile
union{
//MPD-File
#ifndef(pack_JP1) #declare global_pack_JP1=yes; object {CON_PH_1X8()translate<0,-0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,180> translate<41.890000,-1.500000,2.860000>}#end		//Stiftleiste 2,54mm Raster 8Pin 1Reihe (pinhead.lib) JP1  1X08
#ifndef(pack_LED1) #declare global_pack_LED1=yes; object {DIODE_DIS_LED_5MM(Red,0.500000,0.000000,)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,180> translate<16.900000,-1.500000,21.400000>}#end		//Diskrete 5MM LED LED1  LED5MM
#ifndef(pack_LED2) #declare global_pack_LED2=yes; object {DIODE_DIS_LED_5MM(Green,0.500000,0.000000,)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,180> translate<10.300000,-1.500000,21.400000>}#end		//Diskrete 5MM LED LED2  LED5MM
#ifndef(pack_LED3) #declare global_pack_LED3=yes; object {DIODE_DIS_LED_5MM(Blue,0.500000,0.000000,)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,180> translate<3.700000,-1.500000,21.400000>}#end		//Diskrete 5MM LED LED3  LED5MM
#ifndef(pack_LED4) #declare global_pack_LED4=yes; object {DIODE_DIS_LED_5MM(Red,0.500000,0.000000,)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,180> translate<25.500000,-1.500000,14.700000>}#end		//Diskrete 5MM LED LED4  LED5MM
#ifndef(pack_LED5) #declare global_pack_LED5=yes; object {DIODE_DIS_LED_5MM(Green,0.500000,0.000000,)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,180> translate<18.800000,-1.500000,14.600000>}#end		//Diskrete 5MM LED LED5  LED5MM
#ifndef(pack_LED6) #declare global_pack_LED6=yes; object {DIODE_DIS_LED_5MM(Blue,0.500000,0.000000,)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,180> translate<12.100000,-1.500000,14.600000>}#end		//Diskrete 5MM LED LED6  LED5MM
#ifndef(pack_LED7) #declare global_pack_LED7=yes; object {DIODE_DIS_LED_5MM(Red,0.500000,0.000000,)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,180> translate<37.400000,-1.500000,21.400000>}#end		//Diskrete 5MM LED LED7  LED5MM
#ifndef(pack_LED8) #declare global_pack_LED8=yes; object {DIODE_DIS_LED_5MM(Green,0.500000,0.000000,)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,180> translate<30.700000,-1.500000,21.400000>}#end		//Diskrete 5MM LED LED8  LED5MM
#ifndef(pack_LED9) #declare global_pack_LED9=yes; object {DIODE_DIS_LED_5MM(Blue,0.500000,0.000000,)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,180> translate<24.000000,-1.500000,21.400000>}#end		//Diskrete 5MM LED LED9  LED5MM
#ifndef(pack_LED10) #declare global_pack_LED10=yes; object {DIODE_DIS_LED_5MM(Red,0.500000,0.000000,)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,180> translate<45.600000,-1.500000,14.600000>}#end		//Diskrete 5MM LED LED10  LED5MM
#ifndef(pack_LED11) #declare global_pack_LED11=yes; object {DIODE_DIS_LED_5MM(Green,0.500000,0.000000,)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,180> translate<38.900000,-1.500000,14.600000>}#end		//Diskrete 5MM LED LED11  LED5MM
#ifndef(pack_LED12) #declare global_pack_LED12=yes; object {DIODE_DIS_LED_5MM(Blue,0.500000,0.000000,)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,180> translate<32.200000,-1.500000,14.600000>}#end		//Diskrete 5MM LED LED12  LED5MM
#ifndef(pack_LED13) #declare global_pack_LED13=yes; object {DIODE_DIS_LED_5MM(Red,0.500000,0.000000,)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,180> translate<57.800000,-1.500000,21.500000>}#end		//Diskrete 5MM LED LED13  LED5MM
#ifndef(pack_LED14) #declare global_pack_LED14=yes; object {DIODE_DIS_LED_5MM(Green,0.500000,0.000000,)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,180> translate<51.100000,-1.500000,21.500000>}#end		//Diskrete 5MM LED LED14  LED5MM
#ifndef(pack_LED15) #declare global_pack_LED15=yes; object {DIODE_DIS_LED_5MM(Blue,0.500000,0.000000,)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,180> translate<44.400000,-1.500000,21.500000>}#end		//Diskrete 5MM LED LED15  LED5MM
#ifndef(pack_LED16) #declare global_pack_LED16=yes; object {DIODE_DIS_LED_5MM(Red,0.500000,0.000000,)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,180> translate<65.900000,-1.500000,15.100000>}#end		//Diskrete 5MM LED LED16  LED5MM
#ifndef(pack_LED17) #declare global_pack_LED17=yes; object {DIODE_DIS_LED_5MM(Green,0.500000,0.000000,)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,180> translate<59.100000,-1.500000,14.900000>}#end		//Diskrete 5MM LED LED17  LED5MM
#ifndef(pack_LED18) #declare global_pack_LED18=yes; object {DIODE_DIS_LED_5MM(Blue,0.500000,0.000000,)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,180> translate<52.300000,-1.500000,14.700000>}#end		//Diskrete 5MM LED LED18  LED5MM
#ifndef(pack_LED19) #declare global_pack_LED19=yes; object {DIODE_DIS_LED_5MM(Red,0.500000,0.000000,)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,180> translate<77.900000,-1.500000,21.600000>}#end		//Diskrete 5MM LED LED19  LED5MM
#ifndef(pack_LED20) #declare global_pack_LED20=yes; object {DIODE_DIS_LED_5MM(Green,0.500000,0.000000,)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,180> translate<71.200000,-1.500000,21.700000>}#end		//Diskrete 5MM LED LED20  LED5MM
#ifndef(pack_LED21) #declare global_pack_LED21=yes; object {DIODE_DIS_LED_5MM(Blue,0.500000,0.000000,)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,180> translate<64.600000,-1.500000,21.600000>}#end		//Diskrete 5MM LED LED21  LED5MM
#ifndef(pack_LED22) #declare global_pack_LED22=yes; object {DIODE_DIS_LED_5MM(Red,0.500000,0.000000,)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,180> translate<86.000000,-1.500000,15.100000>}#end		//Diskrete 5MM LED LED22  LED5MM
#ifndef(pack_LED23) #declare global_pack_LED23=yes; object {DIODE_DIS_LED_5MM(Green,0.500000,0.000000,)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,180> translate<79.300000,-1.500000,15.100000>}#end		//Diskrete 5MM LED LED23  LED5MM
#ifndef(pack_LED24) #declare global_pack_LED24=yes; object {DIODE_DIS_LED_5MM(Blue,0.500000,0.000000,)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,180> translate<72.600000,-1.500000,15.200000>}#end		//Diskrete 5MM LED LED24  LED5MM
#ifndef(pack_R1) #declare global_pack_R1=yes; object {RES_DIS_0207_075MM(texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,180> translate<12.700000,-1.500000,35.610000>}#end		//Diskreter Widerstand 0,3W 7,5MM Raster R1  0207/7
#ifndef(pack_R2) #declare global_pack_R2=yes; object {RES_DIS_0207_075MM(texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,180> translate<10.160000,-1.500000,33.070000>}#end		//Diskreter Widerstand 0,3W 7,5MM Raster R2  0207/7
#ifndef(pack_R3) #declare global_pack_R3=yes; object {RES_DIS_0207_075MM(texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,180> translate<7.620000,-1.500000,30.530000>}#end		//Diskreter Widerstand 0,3W 7,5MM Raster R3  0207/7
#ifndef(pack_R4) #declare global_pack_R4=yes; object {RES_DIS_0207_075MM(texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,180> translate<23.790000,-1.500000,35.610000>}#end		//Diskreter Widerstand 0,3W 7,5MM Raster R4  0207/7
#ifndef(pack_R5) #declare global_pack_R5=yes; object {RES_DIS_0207_075MM(texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,180> translate<21.350000,-1.500000,33.070000>}#end		//Diskreter Widerstand 0,3W 7,5MM Raster R5  0207/7
#ifndef(pack_R6) #declare global_pack_R6=yes; object {RES_DIS_0207_075MM(texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,180> translate<18.910000,-1.500000,30.530000>}#end		//Diskreter Widerstand 0,3W 7,5MM Raster R6  0207/7
#ifndef(pack_R7) #declare global_pack_R7=yes; object {RES_DIS_0207_075MM(texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,180> translate<32.480000,-1.500000,35.610000>}#end		//Diskreter Widerstand 0,3W 7,5MM Raster R7  0207/7
#ifndef(pack_R8) #declare global_pack_R8=yes; object {RES_DIS_0207_075MM(texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,180> translate<29.940000,-1.500000,33.070000>}#end		//Diskreter Widerstand 0,3W 7,5MM Raster R8  0207/7
#ifndef(pack_R9) #declare global_pack_R9=yes; object {RES_DIS_0207_075MM(texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,180> translate<27.300000,-1.500000,30.530000>}#end		//Diskreter Widerstand 0,3W 7,5MM Raster R9  0207/7
#ifndef(pack_R10) #declare global_pack_R10=yes; object {RES_DIS_0207_075MM(texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,180> translate<43.070000,-1.500000,35.610000>}#end		//Diskreter Widerstand 0,3W 7,5MM Raster R10  0207/7
#ifndef(pack_R11) #declare global_pack_R11=yes; object {RES_DIS_0207_075MM(texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,180> translate<40.630000,-1.500000,33.070000>}#end		//Diskreter Widerstand 0,3W 7,5MM Raster R11  0207/7
#ifndef(pack_R12) #declare global_pack_R12=yes; object {RES_DIS_0207_075MM(texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,180> translate<37.990000,-1.500000,30.530000>}#end		//Diskreter Widerstand 0,3W 7,5MM Raster R12  0207/7
#ifndef(pack_R13) #declare global_pack_R13=yes; object {RES_DIS_0207_075MM(texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,180> translate<52.660000,-1.500000,35.610000>}#end		//Diskreter Widerstand 0,3W 7,5MM Raster R13  0207/7
#ifndef(pack_R14) #declare global_pack_R14=yes; object {RES_DIS_0207_075MM(texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,180> translate<50.120000,-1.500000,33.070000>}#end		//Diskreter Widerstand 0,3W 7,5MM Raster R14  0207/7
#ifndef(pack_R15) #declare global_pack_R15=yes; object {RES_DIS_0207_075MM(texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,180> translate<47.480000,-1.500000,30.630000>}#end		//Diskreter Widerstand 0,3W 7,5MM Raster R15  0207/7
#ifndef(pack_R16) #declare global_pack_R16=yes; object {RES_DIS_0207_075MM(texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,180> translate<61.550000,-1.500000,35.610000>}#end		//Diskreter Widerstand 0,3W 7,5MM Raster R16  0207/7
#ifndef(pack_R17) #declare global_pack_R17=yes; object {RES_DIS_0207_075MM(texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,180> translate<59.010000,-1.500000,33.070000>}#end		//Diskreter Widerstand 0,3W 7,5MM Raster R17  0207/7
#ifndef(pack_R18) #declare global_pack_R18=yes; object {RES_DIS_0207_075MM(texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,180> translate<56.470000,-1.500000,30.530000>}#end		//Diskreter Widerstand 0,3W 7,5MM Raster R18  0207/7
#ifndef(pack_R19) #declare global_pack_R19=yes; object {RES_DIS_0207_075MM(texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,180> translate<70.440000,-1.500000,35.610000>}#end		//Diskreter Widerstand 0,3W 7,5MM Raster R19  0207/7
#ifndef(pack_R20) #declare global_pack_R20=yes; object {RES_DIS_0207_075MM(texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,180> translate<67.900000,-1.500000,33.070000>}#end		//Diskreter Widerstand 0,3W 7,5MM Raster R20  0207/7
#ifndef(pack_R21) #declare global_pack_R21=yes; object {RES_DIS_0207_075MM(texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,180> translate<65.360000,-1.500000,30.530000>}#end		//Diskreter Widerstand 0,3W 7,5MM Raster R21  0207/7
#ifndef(pack_R22) #declare global_pack_R22=yes; object {RES_DIS_0207_075MM(texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,180> translate<79.330000,-1.500000,35.610000>}#end		//Diskreter Widerstand 0,3W 7,5MM Raster R22  0207/7
#ifndef(pack_R23) #declare global_pack_R23=yes; object {RES_DIS_0207_075MM(texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,180> translate<76.790000,-1.500000,33.070000>}#end		//Diskreter Widerstand 0,3W 7,5MM Raster R23  0207/7
#ifndef(pack_R24) #declare global_pack_R24=yes; object {RES_DIS_0207_075MM(texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,180> translate<74.250000,-1.500000,30.530000>}#end		//Diskreter Widerstand 0,3W 7,5MM Raster R24  0207/7
#ifndef(pack_RGB) #declare global_pack_RGB=yes; object {CON_PH_1X3()translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,180> translate<2.540000,-1.500000,36.880000>}#end		//Stiftleiste 2,54mm Raster 3Pin 1Reihe (pinhead.lib) RGB  1X03
}//End union
#end
#if(pcb_pads_smds=on)
//Lötaugen&SMD/Bauteile
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<50.780000,0,2.860000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<48.240000,0,2.860000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<45.700000,0,2.860000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<43.160000,0,2.860000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<40.620000,0,2.860000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<38.080000,0,2.860000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<35.540000,0,2.860000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<33.000000,0,2.860000> texture{col_thl}}
#ifndef(global_pack_LED1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<16.900000,0,22.670000> texture{col_thl}}
#ifndef(global_pack_LED1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<16.900000,0,20.130000> texture{col_thl}}
#ifndef(global_pack_LED2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<10.300000,0,22.670000> texture{col_thl}}
#ifndef(global_pack_LED2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<10.300000,0,20.130000> texture{col_thl}}
#ifndef(global_pack_LED3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<3.700000,0,22.670000> texture{col_thl}}
#ifndef(global_pack_LED3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<3.700000,0,20.130000> texture{col_thl}}
#ifndef(global_pack_LED4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<25.500000,0,15.970000> texture{col_thl}}
#ifndef(global_pack_LED4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<25.500000,0,13.430000> texture{col_thl}}
#ifndef(global_pack_LED5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<18.800000,0,15.870000> texture{col_thl}}
#ifndef(global_pack_LED5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<18.800000,0,13.330000> texture{col_thl}}
#ifndef(global_pack_LED6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<12.100000,0,15.870000> texture{col_thl}}
#ifndef(global_pack_LED6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<12.100000,0,13.330000> texture{col_thl}}
#ifndef(global_pack_LED7) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<37.400000,0,22.670000> texture{col_thl}}
#ifndef(global_pack_LED7) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<37.400000,0,20.130000> texture{col_thl}}
#ifndef(global_pack_LED8) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<30.700000,0,22.670000> texture{col_thl}}
#ifndef(global_pack_LED8) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<30.700000,0,20.130000> texture{col_thl}}
#ifndef(global_pack_LED9) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<24.000000,0,22.670000> texture{col_thl}}
#ifndef(global_pack_LED9) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<24.000000,0,20.130000> texture{col_thl}}
#ifndef(global_pack_LED10) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<45.600000,0,15.870000> texture{col_thl}}
#ifndef(global_pack_LED10) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<45.600000,0,13.330000> texture{col_thl}}
#ifndef(global_pack_LED11) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<38.900000,0,15.870000> texture{col_thl}}
#ifndef(global_pack_LED11) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<38.900000,0,13.330000> texture{col_thl}}
#ifndef(global_pack_LED12) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<32.200000,0,15.870000> texture{col_thl}}
#ifndef(global_pack_LED12) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<32.200000,0,13.330000> texture{col_thl}}
#ifndef(global_pack_LED13) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<57.800000,0,22.770000> texture{col_thl}}
#ifndef(global_pack_LED13) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<57.800000,0,20.230000> texture{col_thl}}
#ifndef(global_pack_LED14) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<51.100000,0,22.770000> texture{col_thl}}
#ifndef(global_pack_LED14) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<51.100000,0,20.230000> texture{col_thl}}
#ifndef(global_pack_LED15) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<44.400000,0,22.770000> texture{col_thl}}
#ifndef(global_pack_LED15) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<44.400000,0,20.230000> texture{col_thl}}
#ifndef(global_pack_LED16) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<65.900000,0,16.370000> texture{col_thl}}
#ifndef(global_pack_LED16) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<65.900000,0,13.830000> texture{col_thl}}
#ifndef(global_pack_LED17) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<59.100000,0,16.170000> texture{col_thl}}
#ifndef(global_pack_LED17) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<59.100000,0,13.630000> texture{col_thl}}
#ifndef(global_pack_LED18) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<52.300000,0,15.970000> texture{col_thl}}
#ifndef(global_pack_LED18) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<52.300000,0,13.430000> texture{col_thl}}
#ifndef(global_pack_LED19) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<77.900000,0,22.870000> texture{col_thl}}
#ifndef(global_pack_LED19) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<77.900000,0,20.330000> texture{col_thl}}
#ifndef(global_pack_LED20) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<71.200000,0,22.970000> texture{col_thl}}
#ifndef(global_pack_LED20) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<71.200000,0,20.430000> texture{col_thl}}
#ifndef(global_pack_LED21) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<64.600000,0,22.870000> texture{col_thl}}
#ifndef(global_pack_LED21) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<64.600000,0,20.330000> texture{col_thl}}
#ifndef(global_pack_LED22) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<86.000000,0,16.370000> texture{col_thl}}
#ifndef(global_pack_LED22) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<86.000000,0,13.830000> texture{col_thl}}
#ifndef(global_pack_LED23) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<79.300000,0,16.370000> texture{col_thl}}
#ifndef(global_pack_LED23) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<79.300000,0,13.830000> texture{col_thl}}
#ifndef(global_pack_LED24) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<72.600000,0,16.470000> texture{col_thl}}
#ifndef(global_pack_LED24) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<72.600000,0,13.930000> texture{col_thl}}
#ifndef(global_pack_R1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<12.700000,0,31.800000> texture{col_thl}}
#ifndef(global_pack_R1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<12.700000,0,39.420000> texture{col_thl}}
#ifndef(global_pack_R2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<10.160000,0,29.260000> texture{col_thl}}
#ifndef(global_pack_R2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<10.160000,0,36.880000> texture{col_thl}}
#ifndef(global_pack_R3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<7.620000,0,26.720000> texture{col_thl}}
#ifndef(global_pack_R3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<7.620000,0,34.340000> texture{col_thl}}
#ifndef(global_pack_R4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<23.790000,0,31.800000> texture{col_thl}}
#ifndef(global_pack_R4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<23.790000,0,39.420000> texture{col_thl}}
#ifndef(global_pack_R5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<21.350000,0,29.260000> texture{col_thl}}
#ifndef(global_pack_R5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<21.350000,0,36.880000> texture{col_thl}}
#ifndef(global_pack_R6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<18.910000,0,26.720000> texture{col_thl}}
#ifndef(global_pack_R6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<18.910000,0,34.340000> texture{col_thl}}
#ifndef(global_pack_R7) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<32.480000,0,31.800000> texture{col_thl}}
#ifndef(global_pack_R7) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<32.480000,0,39.420000> texture{col_thl}}
#ifndef(global_pack_R8) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<29.940000,0,29.260000> texture{col_thl}}
#ifndef(global_pack_R8) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<29.940000,0,36.880000> texture{col_thl}}
#ifndef(global_pack_R9) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<27.300000,0,26.720000> texture{col_thl}}
#ifndef(global_pack_R9) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<27.300000,0,34.340000> texture{col_thl}}
#ifndef(global_pack_R10) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<43.070000,0,31.800000> texture{col_thl}}
#ifndef(global_pack_R10) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<43.070000,0,39.420000> texture{col_thl}}
#ifndef(global_pack_R11) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<40.630000,0,29.260000> texture{col_thl}}
#ifndef(global_pack_R11) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<40.630000,0,36.880000> texture{col_thl}}
#ifndef(global_pack_R12) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<37.990000,0,26.720000> texture{col_thl}}
#ifndef(global_pack_R12) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<37.990000,0,34.340000> texture{col_thl}}
#ifndef(global_pack_R13) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<52.660000,0,31.800000> texture{col_thl}}
#ifndef(global_pack_R13) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<52.660000,0,39.420000> texture{col_thl}}
#ifndef(global_pack_R14) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<50.120000,0,29.260000> texture{col_thl}}
#ifndef(global_pack_R14) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<50.120000,0,36.880000> texture{col_thl}}
#ifndef(global_pack_R15) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<47.480000,0,26.820000> texture{col_thl}}
#ifndef(global_pack_R15) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<47.480000,0,34.440000> texture{col_thl}}
#ifndef(global_pack_R16) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<61.550000,0,31.800000> texture{col_thl}}
#ifndef(global_pack_R16) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<61.550000,0,39.420000> texture{col_thl}}
#ifndef(global_pack_R17) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<59.010000,0,29.260000> texture{col_thl}}
#ifndef(global_pack_R17) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<59.010000,0,36.880000> texture{col_thl}}
#ifndef(global_pack_R18) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<56.470000,0,26.720000> texture{col_thl}}
#ifndef(global_pack_R18) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<56.470000,0,34.340000> texture{col_thl}}
#ifndef(global_pack_R19) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<70.440000,0,31.800000> texture{col_thl}}
#ifndef(global_pack_R19) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<70.440000,0,39.420000> texture{col_thl}}
#ifndef(global_pack_R20) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<67.900000,0,29.260000> texture{col_thl}}
#ifndef(global_pack_R20) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<67.900000,0,36.880000> texture{col_thl}}
#ifndef(global_pack_R21) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<65.360000,0,26.720000> texture{col_thl}}
#ifndef(global_pack_R21) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<65.360000,0,34.340000> texture{col_thl}}
#ifndef(global_pack_R22) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<79.330000,0,31.800000> texture{col_thl}}
#ifndef(global_pack_R22) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<79.330000,0,39.420000> texture{col_thl}}
#ifndef(global_pack_R23) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<76.790000,0,29.260000> texture{col_thl}}
#ifndef(global_pack_R23) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<76.790000,0,36.880000> texture{col_thl}}
#ifndef(global_pack_R24) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<74.250000,0,26.720000> texture{col_thl}}
#ifndef(global_pack_R24) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<74.250000,0,34.340000> texture{col_thl}}
#ifndef(global_pack_RGB) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<2.540000,0,34.340000> texture{col_thl}}
#ifndef(global_pack_RGB) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<2.540000,0,36.880000> texture{col_thl}}
#ifndef(global_pack_RGB) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<2.540000,0,39.420000> texture{col_thl}}
//Lötaugen/Durchkontaktierungen
#end
#if(pcb_wires=on)
union{
//Signale
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<3.700000,0.000000,22.670000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<5.970000,0.000000,22.670000>}
box{<0,0,-0.508000><2.270000,0.035000,0.508000> rotate<0,0.000000,0> translate<3.700000,0.000000,22.670000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<5.970000,0.000000,22.670000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<7.600000,0.000000,24.300000>}
box{<0,0,-0.508000><2.305168,0.035000,0.508000> rotate<0,-44.997030,0> translate<5.970000,0.000000,22.670000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<7.600000,0.000000,24.300000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<7.600000,0.000000,26.700000>}
box{<0,0,-0.508000><2.400000,0.035000,0.508000> rotate<0,90.000000,0> translate<7.600000,0.000000,26.700000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<7.620000,0.000000,26.720000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<7.620000,0.000000,26.590000>}
box{<0,0,-0.508000><0.130000,0.035000,0.508000> rotate<0,-90.000000,0> translate<7.620000,0.000000,26.590000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<7.600000,0.000000,26.700000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<7.620000,0.000000,26.720000>}
box{<0,0,-0.508000><0.028284,0.035000,0.508000> rotate<0,-44.997030,0> translate<7.600000,0.000000,26.700000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<2.540000,0.000000,34.340000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<7.620000,0.000000,34.340000>}
box{<0,0,-0.508000><5.080000,0.035000,0.508000> rotate<0,0.000000,0> translate<2.540000,0.000000,34.340000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<3.700000,0.000000,20.130000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<8.700000,0.000000,20.130000>}
box{<0,0,-0.508000><5.000000,0.035000,0.508000> rotate<0,0.000000,0> translate<3.700000,0.000000,20.130000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<2.540000,0.000000,36.880000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<10.160000,0.000000,36.880000>}
box{<0,0,-0.508000><7.620000,0.035000,0.508000> rotate<0,0.000000,0> translate<2.540000,0.000000,36.880000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<8.700000,0.000000,20.130000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<10.200000,0.000000,18.630000>}
box{<0,0,-0.508000><2.121320,0.035000,0.508000> rotate<0,44.997030,0> translate<8.700000,0.000000,20.130000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<10.200000,0.000000,10.000000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<10.200000,0.000000,18.630000>}
box{<0,0,-0.508000><8.630000,0.035000,0.508000> rotate<0,90.000000,0> translate<10.200000,0.000000,18.630000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<8.700000,0.000000,20.130000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<10.300000,0.000000,20.130000>}
box{<0,0,-0.508000><1.600000,0.035000,0.508000> rotate<0,0.000000,0> translate<8.700000,0.000000,20.130000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<10.160000,0.000000,29.260000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<10.300000,0.000000,29.120000>}
box{<0,0,-0.508000><0.197990,0.035000,0.508000> rotate<0,44.997030,0> translate<10.160000,0.000000,29.260000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<10.300000,0.000000,22.670000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<10.300000,0.000000,29.120000>}
box{<0,0,-0.508000><6.450000,0.035000,0.508000> rotate<0,90.000000,0> translate<10.300000,0.000000,29.120000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.500000,0.000000,24.100000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.500000,0.000000,31.600000>}
box{<0,0,-0.508000><7.500000,0.035000,0.508000> rotate<0,90.000000,0> translate<12.500000,0.000000,31.600000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.500000,0.000000,31.600000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,0.000000,31.800000>}
box{<0,0,-0.508000><0.282843,0.035000,0.508000> rotate<0,-44.997030,0> translate<12.500000,0.000000,31.600000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<2.540000,0.000000,39.420000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,0.000000,39.420000>}
box{<0,0,-0.508000><10.160000,0.035000,0.508000> rotate<0,0.000000,0> translate<2.540000,0.000000,39.420000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.500000,0.000000,24.100000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<13.930000,0.000000,22.670000>}
box{<0,0,-0.508000><2.022325,0.035000,0.508000> rotate<0,44.997030,0> translate<12.500000,0.000000,24.100000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.100000,0.000000,15.870000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<14.530000,0.000000,18.300000>}
box{<0,0,-0.508000><3.436539,0.035000,0.508000> rotate<0,-44.997030,0> translate<12.100000,0.000000,15.870000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<10.300000,0.000000,20.130000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<16.900000,0.000000,20.130000>}
box{<0,0,-0.508000><6.600000,0.035000,0.508000> rotate<0,0.000000,0> translate<10.300000,0.000000,20.130000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<13.930000,0.000000,22.670000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<16.900000,0.000000,22.670000>}
box{<0,0,-0.508000><2.970000,0.035000,0.508000> rotate<0,0.000000,0> translate<13.930000,0.000000,22.670000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<14.530000,0.000000,18.300000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<17.300000,0.000000,18.300000>}
box{<0,0,-0.508000><2.770000,0.035000,0.508000> rotate<0,0.000000,0> translate<14.530000,0.000000,18.300000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<10.200000,0.000000,10.000000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<17.340000,0.000000,2.860000>}
box{<0,0,-0.508000><10.097485,0.035000,0.508000> rotate<0,44.997030,0> translate<10.200000,0.000000,10.000000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.100000,0.000000,13.330000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<18.800000,0.000000,13.330000>}
box{<0,0,-0.508000><6.700000,0.035000,0.508000> rotate<0,0.000000,0> translate<12.100000,0.000000,13.330000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<17.300000,0.000000,18.300000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<18.910000,0.000000,19.910000>}
box{<0,0,-0.508000><2.276884,0.035000,0.508000> rotate<0,-44.997030,0> translate<17.300000,0.000000,18.300000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<18.910000,0.000000,26.720000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<18.910000,0.000000,19.910000>}
box{<0,0,-0.508000><6.810000,0.035000,0.508000> rotate<0,-90.000000,0> translate<18.910000,0.000000,19.910000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<7.620000,0.000000,34.340000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<18.910000,0.000000,34.340000>}
box{<0,0,-0.508000><11.290000,0.035000,0.508000> rotate<0,0.000000,0> translate<7.620000,0.000000,34.340000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<18.800000,0.000000,13.330000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<19.000000,0.000000,13.130000>}
box{<0,0,-0.508000><0.282843,0.035000,0.508000> rotate<0,44.997030,0> translate<18.800000,0.000000,13.330000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<18.800000,0.000000,13.330000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<20.600000,0.000000,11.530000>}
box{<0,0,-0.508000><2.545584,0.035000,0.508000> rotate<0,44.997030,0> translate<18.800000,0.000000,13.330000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<20.600000,0.000000,7.100000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<20.600000,0.000000,11.530000>}
box{<0,0,-0.508000><4.430000,0.035000,0.508000> rotate<0,90.000000,0> translate<20.600000,0.000000,11.530000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<18.800000,0.000000,15.870000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<20.600000,0.000000,17.670000>}
box{<0,0,-0.508000><2.545584,0.035000,0.508000> rotate<0,-44.997030,0> translate<18.800000,0.000000,15.870000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<20.600000,0.000000,25.800000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<20.600000,0.000000,17.670000>}
box{<0,0,-0.508000><8.130000,0.035000,0.508000> rotate<0,-90.000000,0> translate<20.600000,0.000000,17.670000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<20.600000,0.000000,25.800000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<21.350000,0.000000,26.550000>}
box{<0,0,-0.508000><1.060660,0.035000,0.508000> rotate<0,-44.997030,0> translate<20.600000,0.000000,25.800000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<21.350000,0.000000,29.260000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<21.350000,0.000000,26.550000>}
box{<0,0,-0.508000><2.710000,0.035000,0.508000> rotate<0,-90.000000,0> translate<21.350000,0.000000,26.550000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<10.160000,0.000000,36.880000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<21.350000,0.000000,36.880000>}
box{<0,0,-0.508000><11.190000,0.035000,0.508000> rotate<0,0.000000,0> translate<10.160000,0.000000,36.880000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<20.600000,0.000000,7.100000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<22.320000,0.000000,5.380000>}
box{<0,0,-0.508000><2.432447,0.035000,0.508000> rotate<0,44.997030,0> translate<20.600000,0.000000,7.100000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<22.400000,0.000000,24.300000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<22.400000,0.000000,19.070000>}
box{<0,0,-0.508000><5.230000,0.035000,0.508000> rotate<0,-90.000000,0> translate<22.400000,0.000000,19.070000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<22.400000,0.000000,24.300000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<23.790000,0.000000,25.690000>}
box{<0,0,-0.508000><1.965757,0.035000,0.508000> rotate<0,-44.997030,0> translate<22.400000,0.000000,24.300000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<23.790000,0.000000,31.800000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<23.790000,0.000000,25.690000>}
box{<0,0,-0.508000><6.110000,0.035000,0.508000> rotate<0,-90.000000,0> translate<23.790000,0.000000,25.690000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,0.000000,39.420000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<23.790000,0.000000,39.420000>}
box{<0,0,-0.508000><11.090000,0.035000,0.508000> rotate<0,0.000000,0> translate<12.700000,0.000000,39.420000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<18.800000,0.000000,13.330000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<25.400000,0.000000,13.330000>}
box{<0,0,-0.508000><6.600000,0.035000,0.508000> rotate<0,0.000000,0> translate<18.800000,0.000000,13.330000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<25.400000,0.000000,13.330000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<25.500000,0.000000,13.430000>}
box{<0,0,-0.508000><0.141421,0.035000,0.508000> rotate<0,-44.997030,0> translate<25.400000,0.000000,13.330000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<22.400000,0.000000,19.070000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<25.500000,0.000000,15.970000>}
box{<0,0,-0.508000><4.384062,0.035000,0.508000> rotate<0,44.997030,0> translate<22.400000,0.000000,19.070000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<24.000000,0.000000,22.670000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<26.470000,0.000000,22.670000>}
box{<0,0,-0.508000><2.470000,0.035000,0.508000> rotate<0,0.000000,0> translate<24.000000,0.000000,22.670000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<26.470000,0.000000,22.670000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<27.200000,0.000000,23.400000>}
box{<0,0,-0.508000><1.032376,0.035000,0.508000> rotate<0,-44.997030,0> translate<26.470000,0.000000,22.670000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<27.200000,0.000000,23.400000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<27.200000,0.000000,26.620000>}
box{<0,0,-0.508000><3.220000,0.035000,0.508000> rotate<0,90.000000,0> translate<27.200000,0.000000,26.620000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<27.200000,0.000000,26.620000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<27.300000,0.000000,26.720000>}
box{<0,0,-0.508000><0.141421,0.035000,0.508000> rotate<0,-44.997030,0> translate<27.200000,0.000000,26.620000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<18.910000,0.000000,34.340000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<27.300000,0.000000,34.340000>}
box{<0,0,-0.508000><8.390000,0.035000,0.508000> rotate<0,0.000000,0> translate<18.910000,0.000000,34.340000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<29.000000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<29.000000,0.000000,18.430000>}
box{<0,0,-0.508000><5.730000,0.035000,0.508000> rotate<0,90.000000,0> translate<29.000000,0.000000,18.430000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<29.940000,0.000000,29.260000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<29.940000,0.000000,23.430000>}
box{<0,0,-0.508000><5.830000,0.035000,0.508000> rotate<0,-90.000000,0> translate<29.940000,0.000000,23.430000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<21.350000,0.000000,36.880000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<29.940000,0.000000,36.880000>}
box{<0,0,-0.508000><8.590000,0.035000,0.508000> rotate<0,0.000000,0> translate<21.350000,0.000000,36.880000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<24.000000,0.000000,20.130000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<30.700000,0.000000,20.130000>}
box{<0,0,-0.508000><6.700000,0.035000,0.508000> rotate<0,0.000000,0> translate<24.000000,0.000000,20.130000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<29.000000,0.000000,18.430000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<30.700000,0.000000,20.130000>}
box{<0,0,-0.508000><2.404163,0.035000,0.508000> rotate<0,-44.997030,0> translate<29.000000,0.000000,18.430000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<29.940000,0.000000,23.430000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<30.700000,0.000000,22.670000>}
box{<0,0,-0.508000><1.074802,0.035000,0.508000> rotate<0,44.997030,0> translate<29.940000,0.000000,23.430000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<23.790000,0.000000,39.420000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<32.480000,0.000000,39.420000>}
box{<0,0,-0.508000><8.690000,0.035000,0.508000> rotate<0,0.000000,0> translate<23.790000,0.000000,39.420000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<32.480000,0.000000,31.800000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<32.700000,0.000000,31.580000>}
box{<0,0,-0.508000><0.311127,0.035000,0.508000> rotate<0,44.997030,0> translate<32.480000,0.000000,31.800000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<32.700000,0.000000,23.400000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<32.700000,0.000000,31.580000>}
box{<0,0,-0.508000><8.180000,0.035000,0.508000> rotate<0,90.000000,0> translate<32.700000,0.000000,31.580000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<17.340000,0.000000,2.860000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<33.000000,0.000000,2.860000>}
box{<0,0,-0.508000><15.660000,0.035000,0.508000> rotate<0,0.000000,0> translate<17.340000,0.000000,2.860000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<32.700000,0.000000,23.400000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<33.430000,0.000000,22.670000>}
box{<0,0,-0.508000><1.032376,0.035000,0.508000> rotate<0,44.997030,0> translate<32.700000,0.000000,23.400000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<22.320000,0.000000,5.380000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<33.990000,0.000000,5.380000>}
box{<0,0,-0.508000><11.670000,0.035000,0.508000> rotate<0,0.000000,0> translate<22.320000,0.000000,5.380000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<29.000000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<34.280000,0.000000,7.620000>}
box{<0,0,-0.508000><7.326991,0.035000,0.508000> rotate<0,43.891144,0> translate<29.000000,0.000000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<34.280000,0.000000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<34.290000,0.000000,7.620000>}
box{<0,0,-0.508000><0.010000,0.035000,0.508000> rotate<0,0.000000,0> translate<34.280000,0.000000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<35.540000,0.000000,2.860000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<35.540000,0.000000,3.790000>}
box{<0,0,-0.508000><0.930000,0.035000,0.508000> rotate<0,90.000000,0> translate<35.540000,0.000000,3.790000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<33.990000,0.000000,5.380000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<35.560000,0.000000,3.810000>}
box{<0,0,-0.508000><2.220315,0.035000,0.508000> rotate<0,44.997030,0> translate<33.990000,0.000000,5.380000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<35.540000,0.000000,3.790000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<35.560000,0.000000,3.810000>}
box{<0,0,-0.508000><0.028284,0.035000,0.508000> rotate<0,-44.997030,0> translate<35.540000,0.000000,3.790000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<32.200000,0.000000,15.870000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<35.870000,0.000000,15.870000>}
box{<0,0,-0.508000><3.670000,0.035000,0.508000> rotate<0,0.000000,0> translate<32.200000,0.000000,15.870000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<30.700000,0.000000,20.130000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<37.400000,0.000000,20.130000>}
box{<0,0,-0.508000><6.700000,0.035000,0.508000> rotate<0,0.000000,0> translate<30.700000,0.000000,20.130000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<33.430000,0.000000,22.670000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<37.400000,0.000000,22.670000>}
box{<0,0,-0.508000><3.970000,0.035000,0.508000> rotate<0,0.000000,0> translate<33.430000,0.000000,22.670000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<27.300000,0.000000,34.340000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<37.990000,0.000000,34.340000>}
box{<0,0,-0.508000><10.690000,0.035000,0.508000> rotate<0,0.000000,0> translate<27.300000,0.000000,34.340000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<38.080000,0.000000,2.860000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<38.080000,0.000000,3.790000>}
box{<0,0,-0.508000><0.930000,0.035000,0.508000> rotate<0,90.000000,0> translate<38.080000,0.000000,3.790000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<34.290000,0.000000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<38.100000,0.000000,3.810000>}
box{<0,0,-0.508000><5.388154,0.035000,0.508000> rotate<0,44.997030,0> translate<34.290000,0.000000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<38.080000,0.000000,3.790000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<38.100000,0.000000,3.810000>}
box{<0,0,-0.508000><0.028284,0.035000,0.508000> rotate<0,-44.997030,0> translate<38.080000,0.000000,3.790000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<32.200000,0.000000,13.330000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<38.900000,0.000000,13.330000>}
box{<0,0,-0.508000><6.700000,0.035000,0.508000> rotate<0,0.000000,0> translate<32.200000,0.000000,13.330000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<38.900000,0.000000,15.870000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<38.900000,0.000000,16.000000>}
box{<0,0,-0.508000><0.130000,0.035000,0.508000> rotate<0,90.000000,0> translate<38.900000,0.000000,16.000000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<35.870000,0.000000,15.870000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<39.200000,0.000000,19.200000>}
box{<0,0,-0.508000><4.709331,0.035000,0.508000> rotate<0,-44.997030,0> translate<35.870000,0.000000,15.870000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<37.990000,0.000000,26.720000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<39.200000,0.000000,25.510000>}
box{<0,0,-0.508000><1.711198,0.035000,0.508000> rotate<0,44.997030,0> translate<37.990000,0.000000,26.720000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<39.200000,0.000000,19.200000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<39.200000,0.000000,25.510000>}
box{<0,0,-0.508000><6.310000,0.035000,0.508000> rotate<0,90.000000,0> translate<39.200000,0.000000,25.510000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<38.900000,0.000000,13.330000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<40.620000,0.000000,11.610000>}
box{<0,0,-0.508000><2.432447,0.035000,0.508000> rotate<0,44.997030,0> translate<38.900000,0.000000,13.330000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<40.620000,0.000000,2.860000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<40.620000,0.000000,11.610000>}
box{<0,0,-0.508000><8.750000,0.035000,0.508000> rotate<0,90.000000,0> translate<40.620000,0.000000,11.610000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<29.940000,0.000000,36.880000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<40.630000,0.000000,36.880000>}
box{<0,0,-0.508000><10.690000,0.035000,0.508000> rotate<0,0.000000,0> translate<29.940000,0.000000,36.880000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<38.900000,0.000000,16.000000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<40.800000,0.000000,17.900000>}
box{<0,0,-0.508000><2.687006,0.035000,0.508000> rotate<0,-44.997030,0> translate<38.900000,0.000000,16.000000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<40.630000,0.000000,29.260000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<40.800000,0.000000,29.090000>}
box{<0,0,-0.508000><0.240416,0.035000,0.508000> rotate<0,44.997030,0> translate<40.630000,0.000000,29.260000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<40.800000,0.000000,17.900000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<40.800000,0.000000,29.090000>}
box{<0,0,-0.508000><11.190000,0.035000,0.508000> rotate<0,90.000000,0> translate<40.800000,0.000000,29.090000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<42.700000,0.000000,29.100000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<42.700000,0.000000,17.700000>}
box{<0,0,-0.508000><11.400000,0.035000,0.508000> rotate<0,-90.000000,0> translate<42.700000,0.000000,17.700000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<42.700000,0.000000,29.100000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<43.070000,0.000000,29.470000>}
box{<0,0,-0.508000><0.523259,0.035000,0.508000> rotate<0,-44.997030,0> translate<42.700000,0.000000,29.100000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<43.070000,0.000000,31.800000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<43.070000,0.000000,29.470000>}
box{<0,0,-0.508000><2.330000,0.035000,0.508000> rotate<0,-90.000000,0> translate<43.070000,0.000000,29.470000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<32.480000,0.000000,39.420000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<43.070000,0.000000,39.420000>}
box{<0,0,-0.508000><10.590000,0.035000,0.508000> rotate<0,0.000000,0> translate<32.480000,0.000000,39.420000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<43.160000,0.000000,2.860000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<43.160000,0.000000,5.060000>}
box{<0,0,-0.508000><2.200000,0.035000,0.508000> rotate<0,90.000000,0> translate<43.160000,0.000000,5.060000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<42.700000,0.000000,17.700000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<44.530000,0.000000,15.870000>}
box{<0,0,-0.508000><2.588011,0.035000,0.508000> rotate<0,44.997030,0> translate<42.700000,0.000000,17.700000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<38.900000,0.000000,13.260000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<45.530000,0.000000,13.260000>}
box{<0,0,-0.508000><6.630000,0.035000,0.508000> rotate<0,0.000000,0> translate<38.900000,0.000000,13.260000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<45.530000,0.000000,13.260000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<45.600000,0.000000,13.330000>}
box{<0,0,-0.508000><0.098995,0.035000,0.508000> rotate<0,-44.997030,0> translate<45.530000,0.000000,13.260000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<44.530000,0.000000,15.870000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<45.600000,0.000000,15.870000>}
box{<0,0,-0.508000><1.070000,0.035000,0.508000> rotate<0,0.000000,0> translate<44.530000,0.000000,15.870000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<45.700000,0.000000,2.860000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<45.700000,0.000000,3.790000>}
box{<0,0,-0.508000><0.930000,0.035000,0.508000> rotate<0,90.000000,0> translate<45.700000,0.000000,3.790000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<44.400000,0.000000,22.770000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<46.170000,0.000000,22.770000>}
box{<0,0,-0.508000><1.770000,0.035000,0.508000> rotate<0,0.000000,0> translate<44.400000,0.000000,22.770000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<37.990000,0.000000,34.340000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<47.480000,0.000000,34.440000>}
box{<0,0,-0.508000><9.490527,0.035000,0.508000> rotate<0,-0.603687,0> translate<37.990000,0.000000,34.340000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<46.170000,0.000000,22.770000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<47.600000,0.000000,24.200000>}
box{<0,0,-0.508000><2.022325,0.035000,0.508000> rotate<0,-44.997030,0> translate<46.170000,0.000000,22.770000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<47.480000,0.000000,26.820000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<47.600000,0.000000,26.700000>}
box{<0,0,-0.508000><0.169706,0.035000,0.508000> rotate<0,44.997030,0> translate<47.480000,0.000000,26.820000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<47.600000,0.000000,24.200000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<47.600000,0.000000,26.700000>}
box{<0,0,-0.508000><2.500000,0.035000,0.508000> rotate<0,90.000000,0> translate<47.600000,0.000000,26.700000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<48.240000,0.000000,2.860000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<48.240000,0.000000,3.790000>}
box{<0,0,-0.508000><0.930000,0.035000,0.508000> rotate<0,90.000000,0> translate<48.240000,0.000000,3.790000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<43.160000,0.000000,5.060000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<49.100000,0.000000,11.000000>}
box{<0,0,-0.508000><8.400429,0.035000,0.508000> rotate<0,-44.997030,0> translate<43.160000,0.000000,5.060000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<49.100000,0.000000,11.000000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<49.100000,0.000000,18.230000>}
box{<0,0,-0.508000><7.230000,0.035000,0.508000> rotate<0,90.000000,0> translate<49.100000,0.000000,18.230000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<45.700000,0.000000,3.790000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<49.530000,0.000000,7.620000>}
box{<0,0,-0.508000><5.416438,0.035000,0.508000> rotate<0,-44.997030,0> translate<45.700000,0.000000,3.790000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<48.240000,0.000000,3.790000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<50.030000,0.000000,5.580000>}
box{<0,0,-0.508000><2.531442,0.035000,0.508000> rotate<0,-44.997030,0> translate<48.240000,0.000000,3.790000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<40.630000,0.000000,36.880000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<50.120000,0.000000,36.880000>}
box{<0,0,-0.508000><9.490000,0.035000,0.508000> rotate<0,0.000000,0> translate<40.630000,0.000000,36.880000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<50.120000,0.000000,29.260000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<50.200000,0.000000,29.180000>}
box{<0,0,-0.508000><0.113137,0.035000,0.508000> rotate<0,44.997030,0> translate<50.120000,0.000000,29.260000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<50.200000,0.000000,23.900000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<50.200000,0.000000,29.180000>}
box{<0,0,-0.508000><5.280000,0.035000,0.508000> rotate<0,90.000000,0> translate<50.200000,0.000000,29.180000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<44.400000,0.000000,20.230000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<51.100000,0.000000,20.230000>}
box{<0,0,-0.508000><6.700000,0.035000,0.508000> rotate<0,0.000000,0> translate<44.400000,0.000000,20.230000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<49.100000,0.000000,18.230000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<51.100000,0.000000,20.230000>}
box{<0,0,-0.508000><2.828427,0.035000,0.508000> rotate<0,-44.997030,0> translate<49.100000,0.000000,18.230000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<50.200000,0.000000,23.900000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<51.100000,0.000000,23.000000>}
box{<0,0,-0.508000><1.272792,0.035000,0.508000> rotate<0,44.997030,0> translate<50.200000,0.000000,23.900000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<51.100000,0.000000,22.770000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<51.100000,0.000000,23.000000>}
box{<0,0,-0.508000><0.230000,0.035000,0.508000> rotate<0,90.000000,0> translate<51.100000,0.000000,23.000000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<43.070000,0.000000,39.420000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<52.660000,0.000000,39.420000>}
box{<0,0,-0.508000><9.590000,0.035000,0.508000> rotate<0,0.000000,0> translate<43.070000,0.000000,39.420000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<52.660000,0.000000,31.800000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<52.800000,0.000000,31.660000>}
box{<0,0,-0.508000><0.197990,0.035000,0.508000> rotate<0,44.997030,0> translate<52.660000,0.000000,31.800000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<52.800000,0.000000,24.600000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<52.800000,0.000000,31.660000>}
box{<0,0,-0.508000><7.060000,0.035000,0.508000> rotate<0,90.000000,0> translate<52.800000,0.000000,31.660000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<49.530000,0.000000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<53.340000,0.000000,7.620000>}
box{<0,0,-0.508000><3.810000,0.035000,0.508000> rotate<0,0.000000,0> translate<49.530000,0.000000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<53.340000,0.000000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<54.610000,0.000000,8.890000>}
box{<0,0,-0.508000><1.796051,0.035000,0.508000> rotate<0,-44.997030,0> translate<53.340000,0.000000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<54.610000,0.000000,8.890000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<54.610000,0.000000,8.910000>}
box{<0,0,-0.508000><0.020000,0.035000,0.508000> rotate<0,90.000000,0> translate<54.610000,0.000000,8.910000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<52.800000,0.000000,24.600000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<54.630000,0.000000,22.770000>}
box{<0,0,-0.508000><2.588011,0.035000,0.508000> rotate<0,44.997030,0> translate<52.800000,0.000000,24.600000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<52.300000,0.000000,15.970000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<56.070000,0.000000,15.970000>}
box{<0,0,-0.508000><3.770000,0.035000,0.508000> rotate<0,0.000000,0> translate<52.300000,0.000000,15.970000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<47.480000,0.000000,34.440000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<56.470000,0.000000,34.340000>}
box{<0,0,-0.508000><8.990556,0.035000,0.508000> rotate<0,0.637260,0> translate<47.480000,0.000000,34.440000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<54.610000,0.000000,8.910000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<57.000000,0.000000,11.300000>}
box{<0,0,-0.508000><3.379970,0.035000,0.508000> rotate<0,-44.997030,0> translate<54.610000,0.000000,8.910000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<57.000000,0.000000,11.300000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<57.000000,0.000000,12.130000>}
box{<0,0,-0.508000><0.830000,0.035000,0.508000> rotate<0,90.000000,0> translate<57.000000,0.000000,12.130000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<51.100000,0.000000,20.230000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<57.800000,0.000000,20.230000>}
box{<0,0,-0.508000><6.700000,0.035000,0.508000> rotate<0,0.000000,0> translate<51.100000,0.000000,20.230000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<54.630000,0.000000,22.770000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<57.800000,0.000000,22.770000>}
box{<0,0,-0.508000><3.170000,0.035000,0.508000> rotate<0,0.000000,0> translate<54.630000,0.000000,22.770000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<52.300000,0.000000,13.430000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<58.300000,0.000000,13.430000>}
box{<0,0,-0.508000><6.000000,0.035000,0.508000> rotate<0,0.000000,0> translate<52.300000,0.000000,13.430000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<57.000000,0.000000,12.130000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<58.300000,0.000000,13.430000>}
box{<0,0,-0.508000><1.838478,0.035000,0.508000> rotate<0,-44.997030,0> translate<57.000000,0.000000,12.130000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<58.300000,0.000000,13.430000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<58.900000,0.000000,13.430000>}
box{<0,0,-0.508000><0.600000,0.035000,0.508000> rotate<0,0.000000,0> translate<58.300000,0.000000,13.430000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<50.120000,0.000000,36.880000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<59.010000,0.000000,36.880000>}
box{<0,0,-0.508000><8.890000,0.035000,0.508000> rotate<0,0.000000,0> translate<50.120000,0.000000,36.880000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<58.900000,0.000000,13.430000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<59.100000,0.000000,13.630000>}
box{<0,0,-0.508000><0.282843,0.035000,0.508000> rotate<0,-44.997030,0> translate<58.900000,0.000000,13.430000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<59.100000,0.000000,16.170000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<59.100000,0.000000,16.300000>}
box{<0,0,-0.508000><0.130000,0.035000,0.508000> rotate<0,90.000000,0> translate<59.100000,0.000000,16.300000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<56.070000,0.000000,15.970000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<59.400000,0.000000,19.300000>}
box{<0,0,-0.508000><4.709331,0.035000,0.508000> rotate<0,-44.997030,0> translate<56.070000,0.000000,15.970000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<56.470000,0.000000,26.720000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<59.400000,0.000000,23.790000>}
box{<0,0,-0.508000><4.143646,0.035000,0.508000> rotate<0,44.997030,0> translate<56.470000,0.000000,26.720000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<59.400000,0.000000,19.300000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<59.400000,0.000000,23.790000>}
box{<0,0,-0.508000><4.490000,0.035000,0.508000> rotate<0,90.000000,0> translate<59.400000,0.000000,23.790000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<50.030000,0.000000,5.580000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<61.080000,0.000000,5.580000>}
box{<0,0,-0.508000><11.050000,0.035000,0.508000> rotate<0,0.000000,0> translate<50.030000,0.000000,5.580000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<59.100000,0.000000,16.300000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<61.400000,0.000000,18.600000>}
box{<0,0,-0.508000><3.252691,0.035000,0.508000> rotate<0,-44.997030,0> translate<59.100000,0.000000,16.300000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<59.010000,0.000000,29.260000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<61.400000,0.000000,26.870000>}
box{<0,0,-0.508000><3.379970,0.035000,0.508000> rotate<0,44.997030,0> translate<59.010000,0.000000,29.260000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<61.400000,0.000000,18.600000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<61.400000,0.000000,26.870000>}
box{<0,0,-0.508000><8.270000,0.035000,0.508000> rotate<0,90.000000,0> translate<61.400000,0.000000,26.870000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<61.550000,0.000000,31.800000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<61.550000,0.000000,29.650000>}
box{<0,0,-0.508000><2.150000,0.035000,0.508000> rotate<0,-90.000000,0> translate<61.550000,0.000000,29.650000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<52.660000,0.000000,39.420000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<61.550000,0.000000,39.420000>}
box{<0,0,-0.508000><8.890000,0.035000,0.508000> rotate<0,0.000000,0> translate<52.660000,0.000000,39.420000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<63.000000,0.000000,28.200000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<63.000000,0.000000,18.500000>}
box{<0,0,-0.508000><9.700000,0.035000,0.508000> rotate<0,-90.000000,0> translate<63.000000,0.000000,18.500000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<61.550000,0.000000,29.650000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<63.000000,0.000000,28.200000>}
box{<0,0,-0.508000><2.050610,0.035000,0.508000> rotate<0,44.997030,0> translate<61.550000,0.000000,29.650000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<63.000000,0.000000,18.500000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<65.100000,0.000000,16.400000>}
box{<0,0,-0.508000><2.969848,0.035000,0.508000> rotate<0,44.997030,0> translate<63.000000,0.000000,18.500000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<64.600000,0.000000,22.870000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<65.360000,0.000000,23.630000>}
box{<0,0,-0.508000><1.074802,0.035000,0.508000> rotate<0,-44.997030,0> translate<64.600000,0.000000,22.870000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<65.360000,0.000000,26.720000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<65.360000,0.000000,23.630000>}
box{<0,0,-0.508000><3.090000,0.035000,0.508000> rotate<0,-90.000000,0> translate<65.360000,0.000000,23.630000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<56.470000,0.000000,34.340000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<65.360000,0.000000,34.340000>}
box{<0,0,-0.508000><8.890000,0.035000,0.508000> rotate<0,0.000000,0> translate<56.470000,0.000000,34.340000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<59.100000,0.000000,13.630000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<65.700000,0.000000,13.630000>}
box{<0,0,-0.508000><6.600000,0.035000,0.508000> rotate<0,0.000000,0> translate<59.100000,0.000000,13.630000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<65.100000,0.000000,16.400000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<65.870000,0.000000,16.400000>}
box{<0,0,-0.508000><0.770000,0.035000,0.508000> rotate<0,0.000000,0> translate<65.100000,0.000000,16.400000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<65.700000,0.000000,13.630000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<65.900000,0.000000,13.830000>}
box{<0,0,-0.508000><0.282843,0.035000,0.508000> rotate<0,-44.997030,0> translate<65.700000,0.000000,13.630000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<65.870000,0.000000,16.400000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<65.900000,0.000000,16.370000>}
box{<0,0,-0.508000><0.042426,0.035000,0.508000> rotate<0,44.997030,0> translate<65.870000,0.000000,16.400000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<50.780000,0.000000,2.860000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<66.460000,0.000000,2.860000>}
box{<0,0,-0.508000><15.680000,0.035000,0.508000> rotate<0,0.000000,0> translate<50.780000,0.000000,2.860000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<59.010000,0.000000,36.880000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<67.900000,0.000000,36.880000>}
box{<0,0,-0.508000><8.890000,0.035000,0.508000> rotate<0,0.000000,0> translate<59.010000,0.000000,36.880000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<67.900000,0.000000,29.260000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<68.100000,0.000000,29.060000>}
box{<0,0,-0.508000><0.282843,0.035000,0.508000> rotate<0,44.997030,0> translate<67.900000,0.000000,29.260000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<68.100000,0.000000,24.000000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<68.100000,0.000000,29.060000>}
box{<0,0,-0.508000><5.060000,0.035000,0.508000> rotate<0,90.000000,0> translate<68.100000,0.000000,29.060000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<68.100000,0.000000,24.000000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<69.130000,0.000000,22.970000>}
box{<0,0,-0.508000><1.456640,0.035000,0.508000> rotate<0,44.997030,0> translate<68.100000,0.000000,24.000000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<61.080000,0.000000,5.580000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<69.600000,0.000000,14.100000>}
box{<0,0,-0.508000><12.049100,0.035000,0.508000> rotate<0,-44.997030,0> translate<61.080000,0.000000,5.580000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<69.600000,0.000000,14.100000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<69.600000,0.000000,18.830000>}
box{<0,0,-0.508000><4.730000,0.035000,0.508000> rotate<0,90.000000,0> translate<69.600000,0.000000,18.830000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<61.550000,0.000000,39.420000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<70.440000,0.000000,39.420000>}
box{<0,0,-0.508000><8.890000,0.035000,0.508000> rotate<0,0.000000,0> translate<61.550000,0.000000,39.420000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<70.440000,0.000000,31.800000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<70.500000,0.000000,31.740000>}
box{<0,0,-0.508000><0.084853,0.035000,0.508000> rotate<0,44.997030,0> translate<70.440000,0.000000,31.800000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<70.500000,0.000000,26.300000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<70.500000,0.000000,31.740000>}
box{<0,0,-0.508000><5.440000,0.035000,0.508000> rotate<0,90.000000,0> translate<70.500000,0.000000,31.740000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<64.600000,0.000000,20.330000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<71.100000,0.000000,20.330000>}
box{<0,0,-0.508000><6.500000,0.035000,0.508000> rotate<0,0.000000,0> translate<64.600000,0.000000,20.330000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<69.600000,0.000000,18.830000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<71.200000,0.000000,20.430000>}
box{<0,0,-0.508000><2.262742,0.035000,0.508000> rotate<0,-44.997030,0> translate<69.600000,0.000000,18.830000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<71.100000,0.000000,20.330000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<71.200000,0.000000,20.430000>}
box{<0,0,-0.508000><0.141421,0.035000,0.508000> rotate<0,-44.997030,0> translate<71.100000,0.000000,20.330000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<69.130000,0.000000,22.970000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<71.200000,0.000000,22.970000>}
box{<0,0,-0.508000><2.070000,0.035000,0.508000> rotate<0,0.000000,0> translate<69.130000,0.000000,22.970000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<66.460000,0.000000,2.860000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<72.390000,0.000000,8.890000>}
box{<0,0,-0.508000><8.457293,0.035000,0.508000> rotate<0,-45.476049,0> translate<66.460000,0.000000,2.860000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<72.390000,0.000000,8.890000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<72.390000,0.000000,13.720000>}
box{<0,0,-0.508000><4.830000,0.035000,0.508000> rotate<0,90.000000,0> translate<72.390000,0.000000,13.720000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<72.390000,0.000000,13.720000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<72.600000,0.000000,13.930000>}
box{<0,0,-0.508000><0.296985,0.035000,0.508000> rotate<0,-44.997030,0> translate<72.390000,0.000000,13.720000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<70.500000,0.000000,26.300000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<73.930000,0.000000,22.870000>}
box{<0,0,-0.508000><4.850753,0.035000,0.508000> rotate<0,44.997030,0> translate<70.500000,0.000000,26.300000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<65.360000,0.000000,34.340000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<74.250000,0.000000,34.340000>}
box{<0,0,-0.508000><8.890000,0.035000,0.508000> rotate<0,0.000000,0> translate<65.360000,0.000000,34.340000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<74.250000,0.000000,26.720000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<75.770000,0.000000,25.200000>}
box{<0,0,-0.508000><2.149605,0.035000,0.508000> rotate<0,44.997030,0> translate<74.250000,0.000000,26.720000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<67.900000,0.000000,36.880000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<76.790000,0.000000,36.880000>}
box{<0,0,-0.508000><8.890000,0.035000,0.508000> rotate<0,0.000000,0> translate<67.900000,0.000000,36.880000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<76.790000,0.000000,29.260000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<76.800000,0.000000,29.250000>}
box{<0,0,-0.508000><0.014142,0.035000,0.508000> rotate<0,44.997030,0> translate<76.790000,0.000000,29.260000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<76.800000,0.000000,28.000000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<76.800000,0.000000,29.250000>}
box{<0,0,-0.508000><1.250000,0.035000,0.508000> rotate<0,90.000000,0> translate<76.800000,0.000000,29.250000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<72.600000,0.000000,16.470000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<76.870000,0.000000,16.470000>}
box{<0,0,-0.508000><4.270000,0.035000,0.508000> rotate<0,0.000000,0> translate<72.600000,0.000000,16.470000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<71.200000,0.000000,20.430000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<77.800000,0.000000,20.430000>}
box{<0,0,-0.508000><6.600000,0.035000,0.508000> rotate<0,0.000000,0> translate<71.200000,0.000000,20.430000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<76.800000,0.000000,28.000000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<77.800000,0.000000,27.000000>}
box{<0,0,-0.508000><1.414214,0.035000,0.508000> rotate<0,44.997030,0> translate<76.800000,0.000000,28.000000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<77.800000,0.000000,20.430000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<77.900000,0.000000,20.330000>}
box{<0,0,-0.508000><0.141421,0.035000,0.508000> rotate<0,44.997030,0> translate<77.800000,0.000000,20.430000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<73.930000,0.000000,22.870000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<77.900000,0.000000,22.870000>}
box{<0,0,-0.508000><3.970000,0.035000,0.508000> rotate<0,0.000000,0> translate<73.930000,0.000000,22.870000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<75.770000,0.000000,25.200000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<78.400000,0.000000,25.200000>}
box{<0,0,-0.508000><2.630000,0.035000,0.508000> rotate<0,0.000000,0> translate<75.770000,0.000000,25.200000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<72.600000,0.000000,13.930000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<79.200000,0.000000,13.930000>}
box{<0,0,-0.508000><6.600000,0.035000,0.508000> rotate<0,0.000000,0> translate<72.600000,0.000000,13.930000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<79.200000,0.000000,13.930000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<79.300000,0.000000,13.830000>}
box{<0,0,-0.508000><0.141421,0.035000,0.508000> rotate<0,44.997030,0> translate<79.200000,0.000000,13.930000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<77.800000,0.000000,27.000000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<79.300000,0.000000,27.000000>}
box{<0,0,-0.508000><1.500000,0.035000,0.508000> rotate<0,0.000000,0> translate<77.800000,0.000000,27.000000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<70.440000,0.000000,39.420000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<79.330000,0.000000,39.420000>}
box{<0,0,-0.508000><8.890000,0.035000,0.508000> rotate<0,0.000000,0> translate<70.440000,0.000000,39.420000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<79.330000,0.000000,31.800000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<79.400000,0.000000,31.730000>}
box{<0,0,-0.508000><0.098995,0.035000,0.508000> rotate<0,44.997030,0> translate<79.330000,0.000000,31.800000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<79.400000,0.000000,29.000000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<79.400000,0.000000,31.730000>}
box{<0,0,-0.508000><2.730000,0.035000,0.508000> rotate<0,90.000000,0> translate<79.400000,0.000000,31.730000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<79.300000,0.000000,16.370000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<79.470000,0.000000,16.370000>}
box{<0,0,-0.508000><0.170000,0.035000,0.508000> rotate<0,0.000000,0> translate<79.300000,0.000000,16.370000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<79.400000,0.000000,29.000000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<79.900000,0.000000,28.500000>}
box{<0,0,-0.508000><0.707107,0.035000,0.508000> rotate<0,44.997030,0> translate<79.400000,0.000000,29.000000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<76.870000,0.000000,16.470000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<80.000000,0.000000,19.600000>}
box{<0,0,-0.508000><4.426488,0.035000,0.508000> rotate<0,-44.997030,0> translate<76.870000,0.000000,16.470000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<78.400000,0.000000,25.200000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<80.000000,0.000000,23.600000>}
box{<0,0,-0.508000><2.262742,0.035000,0.508000> rotate<0,44.997030,0> translate<78.400000,0.000000,25.200000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<80.000000,0.000000,19.600000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<80.000000,0.000000,23.600000>}
box{<0,0,-0.508000><4.000000,0.035000,0.508000> rotate<0,90.000000,0> translate<80.000000,0.000000,23.600000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<79.900000,0.000000,28.500000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<80.700000,0.000000,28.500000>}
box{<0,0,-0.508000><0.800000,0.035000,0.508000> rotate<0,0.000000,0> translate<79.900000,0.000000,28.500000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<79.470000,0.000000,16.370000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<81.700000,0.000000,18.600000>}
box{<0,0,-0.508000><3.153696,0.035000,0.508000> rotate<0,-44.997030,0> translate<79.470000,0.000000,16.370000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<79.300000,0.000000,27.000000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<81.700000,0.000000,24.600000>}
box{<0,0,-0.508000><3.394113,0.035000,0.508000> rotate<0,44.997030,0> translate<79.300000,0.000000,27.000000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<81.700000,0.000000,18.600000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<81.700000,0.000000,24.600000>}
box{<0,0,-0.508000><6.000000,0.035000,0.508000> rotate<0,90.000000,0> translate<81.700000,0.000000,24.600000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<80.700000,0.000000,28.500000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<84.100000,0.000000,25.100000>}
box{<0,0,-0.508000><4.808326,0.035000,0.508000> rotate<0,44.997030,0> translate<80.700000,0.000000,28.500000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<84.100000,0.000000,18.800000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<84.100000,0.000000,25.100000>}
box{<0,0,-0.508000><6.300000,0.035000,0.508000> rotate<0,90.000000,0> translate<84.100000,0.000000,25.100000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<79.300000,0.000000,13.830000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<86.000000,0.000000,13.830000>}
box{<0,0,-0.508000><6.700000,0.035000,0.508000> rotate<0,0.000000,0> translate<79.300000,0.000000,13.830000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<84.100000,0.000000,18.800000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<86.000000,0.000000,16.900000>}
box{<0,0,-0.508000><2.687006,0.035000,0.508000> rotate<0,44.997030,0> translate<84.100000,0.000000,18.800000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<86.000000,0.000000,16.370000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<86.000000,0.000000,16.900000>}
box{<0,0,-0.508000><0.530000,0.035000,0.508000> rotate<0,90.000000,0> translate<86.000000,0.000000,16.900000> }
//Text
//Rect
union{
texture{col_pds}
}
texture{col_wrs}
}
#end
#if(pcb_polygons=on)
union{
//Polygone
texture{col_pol}
}
#end
union{
cylinder{<50.780000,0.038000,2.860000><50.780000,-1.538000,2.860000>0.508000}
cylinder{<48.240000,0.038000,2.860000><48.240000,-1.538000,2.860000>0.508000}
cylinder{<45.700000,0.038000,2.860000><45.700000,-1.538000,2.860000>0.508000}
cylinder{<43.160000,0.038000,2.860000><43.160000,-1.538000,2.860000>0.508000}
cylinder{<40.620000,0.038000,2.860000><40.620000,-1.538000,2.860000>0.508000}
cylinder{<38.080000,0.038000,2.860000><38.080000,-1.538000,2.860000>0.508000}
cylinder{<35.540000,0.038000,2.860000><35.540000,-1.538000,2.860000>0.508000}
cylinder{<33.000000,0.038000,2.860000><33.000000,-1.538000,2.860000>0.508000}
cylinder{<16.900000,0.038000,22.670000><16.900000,-1.538000,22.670000>0.406400}
cylinder{<16.900000,0.038000,20.130000><16.900000,-1.538000,20.130000>0.406400}
cylinder{<10.300000,0.038000,22.670000><10.300000,-1.538000,22.670000>0.406400}
cylinder{<10.300000,0.038000,20.130000><10.300000,-1.538000,20.130000>0.406400}
cylinder{<3.700000,0.038000,22.670000><3.700000,-1.538000,22.670000>0.406400}
cylinder{<3.700000,0.038000,20.130000><3.700000,-1.538000,20.130000>0.406400}
cylinder{<25.500000,0.038000,15.970000><25.500000,-1.538000,15.970000>0.406400}
cylinder{<25.500000,0.038000,13.430000><25.500000,-1.538000,13.430000>0.406400}
cylinder{<18.800000,0.038000,15.870000><18.800000,-1.538000,15.870000>0.406400}
cylinder{<18.800000,0.038000,13.330000><18.800000,-1.538000,13.330000>0.406400}
cylinder{<12.100000,0.038000,15.870000><12.100000,-1.538000,15.870000>0.406400}
cylinder{<12.100000,0.038000,13.330000><12.100000,-1.538000,13.330000>0.406400}
cylinder{<37.400000,0.038000,22.670000><37.400000,-1.538000,22.670000>0.406400}
cylinder{<37.400000,0.038000,20.130000><37.400000,-1.538000,20.130000>0.406400}
cylinder{<30.700000,0.038000,22.670000><30.700000,-1.538000,22.670000>0.406400}
cylinder{<30.700000,0.038000,20.130000><30.700000,-1.538000,20.130000>0.406400}
cylinder{<24.000000,0.038000,22.670000><24.000000,-1.538000,22.670000>0.406400}
cylinder{<24.000000,0.038000,20.130000><24.000000,-1.538000,20.130000>0.406400}
cylinder{<45.600000,0.038000,15.870000><45.600000,-1.538000,15.870000>0.406400}
cylinder{<45.600000,0.038000,13.330000><45.600000,-1.538000,13.330000>0.406400}
cylinder{<38.900000,0.038000,15.870000><38.900000,-1.538000,15.870000>0.406400}
cylinder{<38.900000,0.038000,13.330000><38.900000,-1.538000,13.330000>0.406400}
cylinder{<32.200000,0.038000,15.870000><32.200000,-1.538000,15.870000>0.406400}
cylinder{<32.200000,0.038000,13.330000><32.200000,-1.538000,13.330000>0.406400}
cylinder{<57.800000,0.038000,22.770000><57.800000,-1.538000,22.770000>0.406400}
cylinder{<57.800000,0.038000,20.230000><57.800000,-1.538000,20.230000>0.406400}
cylinder{<51.100000,0.038000,22.770000><51.100000,-1.538000,22.770000>0.406400}
cylinder{<51.100000,0.038000,20.230000><51.100000,-1.538000,20.230000>0.406400}
cylinder{<44.400000,0.038000,22.770000><44.400000,-1.538000,22.770000>0.406400}
cylinder{<44.400000,0.038000,20.230000><44.400000,-1.538000,20.230000>0.406400}
cylinder{<65.900000,0.038000,16.370000><65.900000,-1.538000,16.370000>0.406400}
cylinder{<65.900000,0.038000,13.830000><65.900000,-1.538000,13.830000>0.406400}
cylinder{<59.100000,0.038000,16.170000><59.100000,-1.538000,16.170000>0.406400}
cylinder{<59.100000,0.038000,13.630000><59.100000,-1.538000,13.630000>0.406400}
cylinder{<52.300000,0.038000,15.970000><52.300000,-1.538000,15.970000>0.406400}
cylinder{<52.300000,0.038000,13.430000><52.300000,-1.538000,13.430000>0.406400}
cylinder{<77.900000,0.038000,22.870000><77.900000,-1.538000,22.870000>0.406400}
cylinder{<77.900000,0.038000,20.330000><77.900000,-1.538000,20.330000>0.406400}
cylinder{<71.200000,0.038000,22.970000><71.200000,-1.538000,22.970000>0.406400}
cylinder{<71.200000,0.038000,20.430000><71.200000,-1.538000,20.430000>0.406400}
cylinder{<64.600000,0.038000,22.870000><64.600000,-1.538000,22.870000>0.406400}
cylinder{<64.600000,0.038000,20.330000><64.600000,-1.538000,20.330000>0.406400}
cylinder{<86.000000,0.038000,16.370000><86.000000,-1.538000,16.370000>0.406400}
cylinder{<86.000000,0.038000,13.830000><86.000000,-1.538000,13.830000>0.406400}
cylinder{<79.300000,0.038000,16.370000><79.300000,-1.538000,16.370000>0.406400}
cylinder{<79.300000,0.038000,13.830000><79.300000,-1.538000,13.830000>0.406400}
cylinder{<72.600000,0.038000,16.470000><72.600000,-1.538000,16.470000>0.406400}
cylinder{<72.600000,0.038000,13.930000><72.600000,-1.538000,13.930000>0.406400}
cylinder{<12.700000,0.038000,31.800000><12.700000,-1.538000,31.800000>0.406400}
cylinder{<12.700000,0.038000,39.420000><12.700000,-1.538000,39.420000>0.406400}
cylinder{<10.160000,0.038000,29.260000><10.160000,-1.538000,29.260000>0.406400}
cylinder{<10.160000,0.038000,36.880000><10.160000,-1.538000,36.880000>0.406400}
cylinder{<7.620000,0.038000,26.720000><7.620000,-1.538000,26.720000>0.406400}
cylinder{<7.620000,0.038000,34.340000><7.620000,-1.538000,34.340000>0.406400}
cylinder{<23.790000,0.038000,31.800000><23.790000,-1.538000,31.800000>0.406400}
cylinder{<23.790000,0.038000,39.420000><23.790000,-1.538000,39.420000>0.406400}
cylinder{<21.350000,0.038000,29.260000><21.350000,-1.538000,29.260000>0.406400}
cylinder{<21.350000,0.038000,36.880000><21.350000,-1.538000,36.880000>0.406400}
cylinder{<18.910000,0.038000,26.720000><18.910000,-1.538000,26.720000>0.406400}
cylinder{<18.910000,0.038000,34.340000><18.910000,-1.538000,34.340000>0.406400}
cylinder{<32.480000,0.038000,31.800000><32.480000,-1.538000,31.800000>0.406400}
cylinder{<32.480000,0.038000,39.420000><32.480000,-1.538000,39.420000>0.406400}
cylinder{<29.940000,0.038000,29.260000><29.940000,-1.538000,29.260000>0.406400}
cylinder{<29.940000,0.038000,36.880000><29.940000,-1.538000,36.880000>0.406400}
cylinder{<27.300000,0.038000,26.720000><27.300000,-1.538000,26.720000>0.406400}
cylinder{<27.300000,0.038000,34.340000><27.300000,-1.538000,34.340000>0.406400}
cylinder{<43.070000,0.038000,31.800000><43.070000,-1.538000,31.800000>0.406400}
cylinder{<43.070000,0.038000,39.420000><43.070000,-1.538000,39.420000>0.406400}
cylinder{<40.630000,0.038000,29.260000><40.630000,-1.538000,29.260000>0.406400}
cylinder{<40.630000,0.038000,36.880000><40.630000,-1.538000,36.880000>0.406400}
cylinder{<37.990000,0.038000,26.720000><37.990000,-1.538000,26.720000>0.406400}
cylinder{<37.990000,0.038000,34.340000><37.990000,-1.538000,34.340000>0.406400}
cylinder{<52.660000,0.038000,31.800000><52.660000,-1.538000,31.800000>0.406400}
cylinder{<52.660000,0.038000,39.420000><52.660000,-1.538000,39.420000>0.406400}
cylinder{<50.120000,0.038000,29.260000><50.120000,-1.538000,29.260000>0.406400}
cylinder{<50.120000,0.038000,36.880000><50.120000,-1.538000,36.880000>0.406400}
cylinder{<47.480000,0.038000,26.820000><47.480000,-1.538000,26.820000>0.406400}
cylinder{<47.480000,0.038000,34.440000><47.480000,-1.538000,34.440000>0.406400}
cylinder{<61.550000,0.038000,31.800000><61.550000,-1.538000,31.800000>0.406400}
cylinder{<61.550000,0.038000,39.420000><61.550000,-1.538000,39.420000>0.406400}
cylinder{<59.010000,0.038000,29.260000><59.010000,-1.538000,29.260000>0.406400}
cylinder{<59.010000,0.038000,36.880000><59.010000,-1.538000,36.880000>0.406400}
cylinder{<56.470000,0.038000,26.720000><56.470000,-1.538000,26.720000>0.406400}
cylinder{<56.470000,0.038000,34.340000><56.470000,-1.538000,34.340000>0.406400}
cylinder{<70.440000,0.038000,31.800000><70.440000,-1.538000,31.800000>0.406400}
cylinder{<70.440000,0.038000,39.420000><70.440000,-1.538000,39.420000>0.406400}
cylinder{<67.900000,0.038000,29.260000><67.900000,-1.538000,29.260000>0.406400}
cylinder{<67.900000,0.038000,36.880000><67.900000,-1.538000,36.880000>0.406400}
cylinder{<65.360000,0.038000,26.720000><65.360000,-1.538000,26.720000>0.406400}
cylinder{<65.360000,0.038000,34.340000><65.360000,-1.538000,34.340000>0.406400}
cylinder{<79.330000,0.038000,31.800000><79.330000,-1.538000,31.800000>0.406400}
cylinder{<79.330000,0.038000,39.420000><79.330000,-1.538000,39.420000>0.406400}
cylinder{<76.790000,0.038000,29.260000><76.790000,-1.538000,29.260000>0.406400}
cylinder{<76.790000,0.038000,36.880000><76.790000,-1.538000,36.880000>0.406400}
cylinder{<74.250000,0.038000,26.720000><74.250000,-1.538000,26.720000>0.406400}
cylinder{<74.250000,0.038000,34.340000><74.250000,-1.538000,34.340000>0.406400}
cylinder{<2.540000,0.038000,34.340000><2.540000,-1.538000,34.340000>0.508000}
cylinder{<2.540000,0.038000,36.880000><2.540000,-1.538000,36.880000>0.508000}
cylinder{<2.540000,0.038000,39.420000><2.540000,-1.538000,39.420000>0.508000}
//Bohrungen(schnell)/Durchkontaktierungen
//Bohrungen(schnell)/Platine
texture{col_hls}
}
#if(pcb_silkscreen=on)
//Bestückungsdruck
union{
cylinder{<0,0,0><0,0.036000,0>0.508000 translate<20.600000,-1.536000,19.000000>}
cylinder{<0,0,0><0,0.036000,0>0.508000 translate<20.600000,-1.536000,27.700000>}
box{<0,0,-0.508000><8.700000,0.036000,0.508000> rotate<0,90.000000,0> translate<20.600000,-1.536000,27.700000> }
cylinder{<0,0,0><0,0.036000,0>0.508000 translate<40.900000,-1.536000,19.000000>}
cylinder{<0,0,0><0,0.036000,0>0.508000 translate<40.900000,-1.536000,27.700000>}
box{<0,0,-0.508000><8.700000,0.036000,0.508000> rotate<0,90.000000,0> translate<40.900000,-1.536000,27.700000> }
cylinder{<0,0,0><0,0.036000,0>0.508000 translate<61.300000,-1.536000,19.100000>}
cylinder{<0,0,0><0,0.036000,0>0.508000 translate<61.300000,-1.536000,27.800000>}
box{<0,0,-0.508000><8.700000,0.036000,0.508000> rotate<0,90.000000,0> translate<61.300000,-1.536000,27.800000> }
cylinder{<0,0,0><0,0.036000,0>0.508000 translate<69.500000,-1.536000,9.200000>}
cylinder{<0,0,0><0,0.036000,0>0.508000 translate<69.500000,-1.536000,17.900000>}
box{<0,0,-0.508000><8.700000,0.036000,0.508000> rotate<0,90.000000,0> translate<69.500000,-1.536000,17.900000> }
cylinder{<0,0,0><0,0.036000,0>0.508000 translate<49.200000,-1.536000,8.900000>}
cylinder{<0,0,0><0,0.036000,0>0.508000 translate<49.200000,-1.536000,17.600000>}
box{<0,0,-0.508000><8.700000,0.036000,0.508000> rotate<0,90.000000,0> translate<49.200000,-1.536000,17.600000> }
cylinder{<0,0,0><0,0.036000,0>0.508000 translate<28.900000,-1.536000,8.900000>}
cylinder{<0,0,0><0,0.036000,0>0.508000 translate<28.900000,-1.536000,17.600000>}
box{<0,0,-0.508000><8.700000,0.036000,0.508000> rotate<0,90.000000,0> translate<28.900000,-1.536000,17.600000> }
//JP1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.175000,-1.536000,4.130000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.905000,-1.536000,4.130000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<34.905000,-1.536000,4.130000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.905000,-1.536000,4.130000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.270000,-1.536000,3.495000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<34.270000,-1.536000,3.495000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.270000,-1.536000,3.495000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.270000,-1.536000,2.225000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<34.270000,-1.536000,2.225000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.270000,-1.536000,2.225000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.905000,-1.536000,1.590000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<34.270000,-1.536000,2.225000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.350000,-1.536000,3.495000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.715000,-1.536000,4.130000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<38.715000,-1.536000,4.130000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.715000,-1.536000,4.130000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.445000,-1.536000,4.130000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<37.445000,-1.536000,4.130000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.445000,-1.536000,4.130000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.810000,-1.536000,3.495000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<36.810000,-1.536000,3.495000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.810000,-1.536000,3.495000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.810000,-1.536000,2.225000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<36.810000,-1.536000,2.225000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.810000,-1.536000,2.225000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.445000,-1.536000,1.590000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<36.810000,-1.536000,2.225000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.445000,-1.536000,1.590000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.715000,-1.536000,1.590000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<37.445000,-1.536000,1.590000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.715000,-1.536000,1.590000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.350000,-1.536000,2.225000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<38.715000,-1.536000,1.590000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.175000,-1.536000,4.130000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.810000,-1.536000,3.495000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<36.175000,-1.536000,4.130000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.810000,-1.536000,2.225000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.175000,-1.536000,1.590000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<36.175000,-1.536000,1.590000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.905000,-1.536000,1.590000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.175000,-1.536000,1.590000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<34.905000,-1.536000,1.590000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.795000,-1.536000,4.130000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.525000,-1.536000,4.130000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<42.525000,-1.536000,4.130000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.525000,-1.536000,4.130000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.890000,-1.536000,3.495000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<41.890000,-1.536000,3.495000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.890000,-1.536000,3.495000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.890000,-1.536000,2.225000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<41.890000,-1.536000,2.225000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.890000,-1.536000,2.225000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.525000,-1.536000,1.590000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<41.890000,-1.536000,2.225000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.890000,-1.536000,3.495000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.255000,-1.536000,4.130000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<41.255000,-1.536000,4.130000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.255000,-1.536000,4.130000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.985000,-1.536000,4.130000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<39.985000,-1.536000,4.130000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.985000,-1.536000,4.130000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.350000,-1.536000,3.495000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<39.350000,-1.536000,3.495000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.350000,-1.536000,3.495000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.350000,-1.536000,2.225000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<39.350000,-1.536000,2.225000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.350000,-1.536000,2.225000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.985000,-1.536000,1.590000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<39.350000,-1.536000,2.225000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.985000,-1.536000,1.590000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.255000,-1.536000,1.590000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<39.985000,-1.536000,1.590000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.255000,-1.536000,1.590000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.890000,-1.536000,2.225000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<41.255000,-1.536000,1.590000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.970000,-1.536000,3.495000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.335000,-1.536000,4.130000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<46.335000,-1.536000,4.130000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.335000,-1.536000,4.130000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.065000,-1.536000,4.130000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<45.065000,-1.536000,4.130000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.065000,-1.536000,4.130000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.430000,-1.536000,3.495000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<44.430000,-1.536000,3.495000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.430000,-1.536000,3.495000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.430000,-1.536000,2.225000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<44.430000,-1.536000,2.225000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.430000,-1.536000,2.225000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.065000,-1.536000,1.590000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<44.430000,-1.536000,2.225000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.065000,-1.536000,1.590000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.335000,-1.536000,1.590000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<45.065000,-1.536000,1.590000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.335000,-1.536000,1.590000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.970000,-1.536000,2.225000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<46.335000,-1.536000,1.590000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.795000,-1.536000,4.130000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.430000,-1.536000,3.495000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<43.795000,-1.536000,4.130000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.430000,-1.536000,2.225000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.795000,-1.536000,1.590000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<43.795000,-1.536000,1.590000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.525000,-1.536000,1.590000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.795000,-1.536000,1.590000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<42.525000,-1.536000,1.590000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.415000,-1.536000,4.130000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.145000,-1.536000,4.130000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<50.145000,-1.536000,4.130000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.145000,-1.536000,4.130000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.510000,-1.536000,3.495000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<49.510000,-1.536000,3.495000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.510000,-1.536000,3.495000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.510000,-1.536000,2.225000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<49.510000,-1.536000,2.225000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.510000,-1.536000,2.225000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.145000,-1.536000,1.590000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<49.510000,-1.536000,2.225000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.510000,-1.536000,3.495000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.875000,-1.536000,4.130000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<48.875000,-1.536000,4.130000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.875000,-1.536000,4.130000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.605000,-1.536000,4.130000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<47.605000,-1.536000,4.130000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.605000,-1.536000,4.130000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.970000,-1.536000,3.495000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<46.970000,-1.536000,3.495000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.970000,-1.536000,3.495000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.970000,-1.536000,2.225000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<46.970000,-1.536000,2.225000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.970000,-1.536000,2.225000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.605000,-1.536000,1.590000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<46.970000,-1.536000,2.225000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.605000,-1.536000,1.590000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.875000,-1.536000,1.590000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<47.605000,-1.536000,1.590000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.875000,-1.536000,1.590000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.510000,-1.536000,2.225000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<48.875000,-1.536000,1.590000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.050000,-1.536000,3.495000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.050000,-1.536000,2.225000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<52.050000,-1.536000,2.225000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.415000,-1.536000,4.130000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.050000,-1.536000,3.495000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<51.415000,-1.536000,4.130000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.050000,-1.536000,2.225000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.415000,-1.536000,1.590000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<51.415000,-1.536000,1.590000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.145000,-1.536000,1.590000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.415000,-1.536000,1.590000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<50.145000,-1.536000,1.590000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.635000,-1.536000,4.130000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.365000,-1.536000,4.130000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<32.365000,-1.536000,4.130000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.365000,-1.536000,4.130000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.730000,-1.536000,3.495000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<31.730000,-1.536000,3.495000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.730000,-1.536000,3.495000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.730000,-1.536000,2.225000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<31.730000,-1.536000,2.225000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.730000,-1.536000,2.225000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.365000,-1.536000,1.590000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<31.730000,-1.536000,2.225000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.635000,-1.536000,4.130000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.270000,-1.536000,3.495000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<33.635000,-1.536000,4.130000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.270000,-1.536000,2.225000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.635000,-1.536000,1.590000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<33.635000,-1.536000,1.590000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.365000,-1.536000,1.590000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.635000,-1.536000,1.590000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<32.365000,-1.536000,1.590000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<35.540000,-1.536000,2.860000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<38.080000,-1.536000,2.860000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<40.620000,-1.536000,2.860000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<43.160000,-1.536000,2.860000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<45.700000,-1.536000,2.860000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<48.240000,-1.536000,2.860000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<50.780000,-1.536000,2.860000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<33.000000,-1.536000,2.860000>}
//LED1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<18.805000,-1.536000,18.860000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.995000,-1.536000,18.860000>}
box{<0,0,-0.101600><3.810000,0.036000,0.101600> rotate<0,0.000000,0> translate<14.995000,-1.536000,18.860000> }
object{ARC(3.175000,0.254000,306.869898,593.130102,0.036000) translate<16.900000,-1.536000,21.400000>}
object{ARC(1.143000,0.152400,90.000000,180.000000,0.036000) translate<16.900000,-1.536000,21.400000>}
object{ARC(1.143000,0.152400,270.000000,360.000000,0.036000) translate<16.900000,-1.536000,21.400000>}
object{ARC(1.651000,0.152400,90.000000,180.000000,0.036000) translate<16.900000,-1.536000,21.400000>}
object{ARC(1.651000,0.152400,270.000000,360.000000,0.036000) translate<16.900000,-1.536000,21.400000>}
object{ARC(2.159000,0.152400,90.000000,180.000000,0.036000) translate<16.900000,-1.536000,21.400000>}
object{ARC(2.159000,0.152400,270.000000,360.000000,0.036000) translate<16.900000,-1.536000,21.400000>}
difference{
cylinder{<16.900000,0,21.400000><16.900000,0.036000,21.400000>2.616200 translate<0,-1.536000,0>}
cylinder{<16.900000,-0.1,21.400000><16.900000,0.135000,21.400000>2.463800 translate<0,-1.536000,0>}}
//LED2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<12.205000,-1.536000,18.860000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.395000,-1.536000,18.860000>}
box{<0,0,-0.101600><3.810000,0.036000,0.101600> rotate<0,0.000000,0> translate<8.395000,-1.536000,18.860000> }
object{ARC(3.175000,0.254000,306.869898,593.130102,0.036000) translate<10.300000,-1.536000,21.400000>}
object{ARC(1.143000,0.152400,90.000000,180.000000,0.036000) translate<10.300000,-1.536000,21.400000>}
object{ARC(1.143000,0.152400,270.000000,360.000000,0.036000) translate<10.300000,-1.536000,21.400000>}
object{ARC(1.651000,0.152400,90.000000,180.000000,0.036000) translate<10.300000,-1.536000,21.400000>}
object{ARC(1.651000,0.152400,270.000000,360.000000,0.036000) translate<10.300000,-1.536000,21.400000>}
object{ARC(2.159000,0.152400,90.000000,180.000000,0.036000) translate<10.300000,-1.536000,21.400000>}
object{ARC(2.159000,0.152400,270.000000,360.000000,0.036000) translate<10.300000,-1.536000,21.400000>}
difference{
cylinder{<10.300000,0,21.400000><10.300000,0.036000,21.400000>2.616200 translate<0,-1.536000,0>}
cylinder{<10.300000,-0.1,21.400000><10.300000,0.135000,21.400000>2.463800 translate<0,-1.536000,0>}}
//LED3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.605000,-1.536000,18.860000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<1.795000,-1.536000,18.860000>}
box{<0,0,-0.101600><3.810000,0.036000,0.101600> rotate<0,0.000000,0> translate<1.795000,-1.536000,18.860000> }
object{ARC(3.175000,0.254000,306.869898,593.130102,0.036000) translate<3.700000,-1.536000,21.400000>}
object{ARC(1.143000,0.152400,90.000000,180.000000,0.036000) translate<3.700000,-1.536000,21.400000>}
object{ARC(1.143000,0.152400,270.000000,360.000000,0.036000) translate<3.700000,-1.536000,21.400000>}
object{ARC(1.651000,0.152400,90.000000,180.000000,0.036000) translate<3.700000,-1.536000,21.400000>}
object{ARC(1.651000,0.152400,270.000000,360.000000,0.036000) translate<3.700000,-1.536000,21.400000>}
object{ARC(2.159000,0.152400,90.000000,180.000000,0.036000) translate<3.700000,-1.536000,21.400000>}
object{ARC(2.159000,0.152400,270.000000,360.000000,0.036000) translate<3.700000,-1.536000,21.400000>}
difference{
cylinder{<3.700000,0,21.400000><3.700000,0.036000,21.400000>2.616200 translate<0,-1.536000,0>}
cylinder{<3.700000,-0.1,21.400000><3.700000,0.135000,21.400000>2.463800 translate<0,-1.536000,0>}}
//LED4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.405000,-1.536000,12.160000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<23.595000,-1.536000,12.160000>}
box{<0,0,-0.101600><3.810000,0.036000,0.101600> rotate<0,0.000000,0> translate<23.595000,-1.536000,12.160000> }
object{ARC(3.175000,0.254000,306.869898,593.130102,0.036000) translate<25.500000,-1.536000,14.700000>}
object{ARC(1.143000,0.152400,90.000000,180.000000,0.036000) translate<25.500000,-1.536000,14.700000>}
object{ARC(1.143000,0.152400,270.000000,360.000000,0.036000) translate<25.500000,-1.536000,14.700000>}
object{ARC(1.651000,0.152400,90.000000,180.000000,0.036000) translate<25.500000,-1.536000,14.700000>}
object{ARC(1.651000,0.152400,270.000000,360.000000,0.036000) translate<25.500000,-1.536000,14.700000>}
object{ARC(2.159000,0.152400,90.000000,180.000000,0.036000) translate<25.500000,-1.536000,14.700000>}
object{ARC(2.159000,0.152400,270.000000,360.000000,0.036000) translate<25.500000,-1.536000,14.700000>}
difference{
cylinder{<25.500000,0,14.700000><25.500000,0.036000,14.700000>2.616200 translate<0,-1.536000,0>}
cylinder{<25.500000,-0.1,14.700000><25.500000,0.135000,14.700000>2.463800 translate<0,-1.536000,0>}}
//LED5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.705000,-1.536000,12.060000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.895000,-1.536000,12.060000>}
box{<0,0,-0.101600><3.810000,0.036000,0.101600> rotate<0,0.000000,0> translate<16.895000,-1.536000,12.060000> }
object{ARC(3.175000,0.254000,306.869898,593.130102,0.036000) translate<18.800000,-1.536000,14.600000>}
object{ARC(1.143000,0.152400,90.000000,180.000000,0.036000) translate<18.800000,-1.536000,14.600000>}
object{ARC(1.143000,0.152400,270.000000,360.000000,0.036000) translate<18.800000,-1.536000,14.600000>}
object{ARC(1.651000,0.152400,90.000000,180.000000,0.036000) translate<18.800000,-1.536000,14.600000>}
object{ARC(1.651000,0.152400,270.000000,360.000000,0.036000) translate<18.800000,-1.536000,14.600000>}
object{ARC(2.159000,0.152400,90.000000,180.000000,0.036000) translate<18.800000,-1.536000,14.600000>}
object{ARC(2.159000,0.152400,270.000000,360.000000,0.036000) translate<18.800000,-1.536000,14.600000>}
difference{
cylinder{<18.800000,0,14.600000><18.800000,0.036000,14.600000>2.616200 translate<0,-1.536000,0>}
cylinder{<18.800000,-0.1,14.600000><18.800000,0.135000,14.600000>2.463800 translate<0,-1.536000,0>}}
//LED6 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.005000,-1.536000,12.060000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<10.195000,-1.536000,12.060000>}
box{<0,0,-0.101600><3.810000,0.036000,0.101600> rotate<0,0.000000,0> translate<10.195000,-1.536000,12.060000> }
object{ARC(3.175000,0.254000,306.869898,593.130102,0.036000) translate<12.100000,-1.536000,14.600000>}
object{ARC(1.143000,0.152400,90.000000,180.000000,0.036000) translate<12.100000,-1.536000,14.600000>}
object{ARC(1.143000,0.152400,270.000000,360.000000,0.036000) translate<12.100000,-1.536000,14.600000>}
object{ARC(1.651000,0.152400,90.000000,180.000000,0.036000) translate<12.100000,-1.536000,14.600000>}
object{ARC(1.651000,0.152400,270.000000,360.000000,0.036000) translate<12.100000,-1.536000,14.600000>}
object{ARC(2.159000,0.152400,90.000000,180.000000,0.036000) translate<12.100000,-1.536000,14.600000>}
object{ARC(2.159000,0.152400,270.000000,360.000000,0.036000) translate<12.100000,-1.536000,14.600000>}
difference{
cylinder{<12.100000,0,14.600000><12.100000,0.036000,14.600000>2.616200 translate<0,-1.536000,0>}
cylinder{<12.100000,-0.1,14.600000><12.100000,0.135000,14.600000>2.463800 translate<0,-1.536000,0>}}
//LED7 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.305000,-1.536000,18.860000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.495000,-1.536000,18.860000>}
box{<0,0,-0.101600><3.810000,0.036000,0.101600> rotate<0,0.000000,0> translate<35.495000,-1.536000,18.860000> }
object{ARC(3.175000,0.254000,306.869898,593.130102,0.036000) translate<37.400000,-1.536000,21.400000>}
object{ARC(1.143000,0.152400,90.000000,180.000000,0.036000) translate<37.400000,-1.536000,21.400000>}
object{ARC(1.143000,0.152400,270.000000,360.000000,0.036000) translate<37.400000,-1.536000,21.400000>}
object{ARC(1.651000,0.152400,90.000000,180.000000,0.036000) translate<37.400000,-1.536000,21.400000>}
object{ARC(1.651000,0.152400,270.000000,360.000000,0.036000) translate<37.400000,-1.536000,21.400000>}
object{ARC(2.159000,0.152400,90.000000,180.000000,0.036000) translate<37.400000,-1.536000,21.400000>}
object{ARC(2.159000,0.152400,270.000000,360.000000,0.036000) translate<37.400000,-1.536000,21.400000>}
difference{
cylinder{<37.400000,0,21.400000><37.400000,0.036000,21.400000>2.616200 translate<0,-1.536000,0>}
cylinder{<37.400000,-0.1,21.400000><37.400000,0.135000,21.400000>2.463800 translate<0,-1.536000,0>}}
//LED8 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.605000,-1.536000,18.860000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<28.795000,-1.536000,18.860000>}
box{<0,0,-0.101600><3.810000,0.036000,0.101600> rotate<0,0.000000,0> translate<28.795000,-1.536000,18.860000> }
object{ARC(3.175000,0.254000,306.869898,593.130102,0.036000) translate<30.700000,-1.536000,21.400000>}
object{ARC(1.143000,0.152400,90.000000,180.000000,0.036000) translate<30.700000,-1.536000,21.400000>}
object{ARC(1.143000,0.152400,270.000000,360.000000,0.036000) translate<30.700000,-1.536000,21.400000>}
object{ARC(1.651000,0.152400,90.000000,180.000000,0.036000) translate<30.700000,-1.536000,21.400000>}
object{ARC(1.651000,0.152400,270.000000,360.000000,0.036000) translate<30.700000,-1.536000,21.400000>}
object{ARC(2.159000,0.152400,90.000000,180.000000,0.036000) translate<30.700000,-1.536000,21.400000>}
object{ARC(2.159000,0.152400,270.000000,360.000000,0.036000) translate<30.700000,-1.536000,21.400000>}
difference{
cylinder{<30.700000,0,21.400000><30.700000,0.036000,21.400000>2.616200 translate<0,-1.536000,0>}
cylinder{<30.700000,-0.1,21.400000><30.700000,0.135000,21.400000>2.463800 translate<0,-1.536000,0>}}
//LED9 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<25.905000,-1.536000,18.860000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.095000,-1.536000,18.860000>}
box{<0,0,-0.101600><3.810000,0.036000,0.101600> rotate<0,0.000000,0> translate<22.095000,-1.536000,18.860000> }
object{ARC(3.175000,0.254000,306.869898,593.130102,0.036000) translate<24.000000,-1.536000,21.400000>}
object{ARC(1.143000,0.152400,90.000000,180.000000,0.036000) translate<24.000000,-1.536000,21.400000>}
object{ARC(1.143000,0.152400,270.000000,360.000000,0.036000) translate<24.000000,-1.536000,21.400000>}
object{ARC(1.651000,0.152400,90.000000,180.000000,0.036000) translate<24.000000,-1.536000,21.400000>}
object{ARC(1.651000,0.152400,270.000000,360.000000,0.036000) translate<24.000000,-1.536000,21.400000>}
object{ARC(2.159000,0.152400,90.000000,180.000000,0.036000) translate<24.000000,-1.536000,21.400000>}
object{ARC(2.159000,0.152400,270.000000,360.000000,0.036000) translate<24.000000,-1.536000,21.400000>}
difference{
cylinder{<24.000000,0,21.400000><24.000000,0.036000,21.400000>2.616200 translate<0,-1.536000,0>}
cylinder{<24.000000,-0.1,21.400000><24.000000,0.135000,21.400000>2.463800 translate<0,-1.536000,0>}}
//LED10 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.505000,-1.536000,12.060000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<43.695000,-1.536000,12.060000>}
box{<0,0,-0.101600><3.810000,0.036000,0.101600> rotate<0,0.000000,0> translate<43.695000,-1.536000,12.060000> }
object{ARC(3.175000,0.254000,306.869898,593.130102,0.036000) translate<45.600000,-1.536000,14.600000>}
object{ARC(1.143000,0.152400,90.000000,180.000000,0.036000) translate<45.600000,-1.536000,14.600000>}
object{ARC(1.143000,0.152400,270.000000,360.000000,0.036000) translate<45.600000,-1.536000,14.600000>}
object{ARC(1.651000,0.152400,90.000000,180.000000,0.036000) translate<45.600000,-1.536000,14.600000>}
object{ARC(1.651000,0.152400,270.000000,360.000000,0.036000) translate<45.600000,-1.536000,14.600000>}
object{ARC(2.159000,0.152400,90.000000,180.000000,0.036000) translate<45.600000,-1.536000,14.600000>}
object{ARC(2.159000,0.152400,270.000000,360.000000,0.036000) translate<45.600000,-1.536000,14.600000>}
difference{
cylinder{<45.600000,0,14.600000><45.600000,0.036000,14.600000>2.616200 translate<0,-1.536000,0>}
cylinder{<45.600000,-0.1,14.600000><45.600000,0.135000,14.600000>2.463800 translate<0,-1.536000,0>}}
//LED11 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.805000,-1.536000,12.060000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.995000,-1.536000,12.060000>}
box{<0,0,-0.101600><3.810000,0.036000,0.101600> rotate<0,0.000000,0> translate<36.995000,-1.536000,12.060000> }
object{ARC(3.175000,0.254000,306.869898,593.130102,0.036000) translate<38.900000,-1.536000,14.600000>}
object{ARC(1.143000,0.152400,90.000000,180.000000,0.036000) translate<38.900000,-1.536000,14.600000>}
object{ARC(1.143000,0.152400,270.000000,360.000000,0.036000) translate<38.900000,-1.536000,14.600000>}
object{ARC(1.651000,0.152400,90.000000,180.000000,0.036000) translate<38.900000,-1.536000,14.600000>}
object{ARC(1.651000,0.152400,270.000000,360.000000,0.036000) translate<38.900000,-1.536000,14.600000>}
object{ARC(2.159000,0.152400,90.000000,180.000000,0.036000) translate<38.900000,-1.536000,14.600000>}
object{ARC(2.159000,0.152400,270.000000,360.000000,0.036000) translate<38.900000,-1.536000,14.600000>}
difference{
cylinder{<38.900000,0,14.600000><38.900000,0.036000,14.600000>2.616200 translate<0,-1.536000,0>}
cylinder{<38.900000,-0.1,14.600000><38.900000,0.135000,14.600000>2.463800 translate<0,-1.536000,0>}}
//LED12 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.105000,-1.536000,12.060000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.295000,-1.536000,12.060000>}
box{<0,0,-0.101600><3.810000,0.036000,0.101600> rotate<0,0.000000,0> translate<30.295000,-1.536000,12.060000> }
object{ARC(3.175000,0.254000,306.869898,593.130102,0.036000) translate<32.200000,-1.536000,14.600000>}
object{ARC(1.143000,0.152400,90.000000,180.000000,0.036000) translate<32.200000,-1.536000,14.600000>}
object{ARC(1.143000,0.152400,270.000000,360.000000,0.036000) translate<32.200000,-1.536000,14.600000>}
object{ARC(1.651000,0.152400,90.000000,180.000000,0.036000) translate<32.200000,-1.536000,14.600000>}
object{ARC(1.651000,0.152400,270.000000,360.000000,0.036000) translate<32.200000,-1.536000,14.600000>}
object{ARC(2.159000,0.152400,90.000000,180.000000,0.036000) translate<32.200000,-1.536000,14.600000>}
object{ARC(2.159000,0.152400,270.000000,360.000000,0.036000) translate<32.200000,-1.536000,14.600000>}
difference{
cylinder{<32.200000,0,14.600000><32.200000,0.036000,14.600000>2.616200 translate<0,-1.536000,0>}
cylinder{<32.200000,-0.1,14.600000><32.200000,0.135000,14.600000>2.463800 translate<0,-1.536000,0>}}
//LED13 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.705000,-1.536000,18.960000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<55.895000,-1.536000,18.960000>}
box{<0,0,-0.101600><3.810000,0.036000,0.101600> rotate<0,0.000000,0> translate<55.895000,-1.536000,18.960000> }
object{ARC(3.175000,0.254000,306.869898,593.130102,0.036000) translate<57.800000,-1.536000,21.500000>}
object{ARC(1.143000,0.152400,90.000000,180.000000,0.036000) translate<57.800000,-1.536000,21.500000>}
object{ARC(1.143000,0.152400,270.000000,360.000000,0.036000) translate<57.800000,-1.536000,21.500000>}
object{ARC(1.651000,0.152400,90.000000,180.000000,0.036000) translate<57.800000,-1.536000,21.500000>}
object{ARC(1.651000,0.152400,270.000000,360.000000,0.036000) translate<57.800000,-1.536000,21.500000>}
object{ARC(2.159000,0.152400,90.000000,180.000000,0.036000) translate<57.800000,-1.536000,21.500000>}
object{ARC(2.159000,0.152400,270.000000,360.000000,0.036000) translate<57.800000,-1.536000,21.500000>}
difference{
cylinder{<57.800000,0,21.500000><57.800000,0.036000,21.500000>2.616200 translate<0,-1.536000,0>}
cylinder{<57.800000,-0.1,21.500000><57.800000,0.135000,21.500000>2.463800 translate<0,-1.536000,0>}}
//LED14 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<53.005000,-1.536000,18.960000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.195000,-1.536000,18.960000>}
box{<0,0,-0.101600><3.810000,0.036000,0.101600> rotate<0,0.000000,0> translate<49.195000,-1.536000,18.960000> }
object{ARC(3.175000,0.254000,306.869898,593.130102,0.036000) translate<51.100000,-1.536000,21.500000>}
object{ARC(1.143000,0.152400,90.000000,180.000000,0.036000) translate<51.100000,-1.536000,21.500000>}
object{ARC(1.143000,0.152400,270.000000,360.000000,0.036000) translate<51.100000,-1.536000,21.500000>}
object{ARC(1.651000,0.152400,90.000000,180.000000,0.036000) translate<51.100000,-1.536000,21.500000>}
object{ARC(1.651000,0.152400,270.000000,360.000000,0.036000) translate<51.100000,-1.536000,21.500000>}
object{ARC(2.159000,0.152400,90.000000,180.000000,0.036000) translate<51.100000,-1.536000,21.500000>}
object{ARC(2.159000,0.152400,270.000000,360.000000,0.036000) translate<51.100000,-1.536000,21.500000>}
difference{
cylinder{<51.100000,0,21.500000><51.100000,0.036000,21.500000>2.616200 translate<0,-1.536000,0>}
cylinder{<51.100000,-0.1,21.500000><51.100000,0.135000,21.500000>2.463800 translate<0,-1.536000,0>}}
//LED15 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.305000,-1.536000,18.960000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.495000,-1.536000,18.960000>}
box{<0,0,-0.101600><3.810000,0.036000,0.101600> rotate<0,0.000000,0> translate<42.495000,-1.536000,18.960000> }
object{ARC(3.175000,0.254000,306.869898,593.130102,0.036000) translate<44.400000,-1.536000,21.500000>}
object{ARC(1.143000,0.152400,90.000000,180.000000,0.036000) translate<44.400000,-1.536000,21.500000>}
object{ARC(1.143000,0.152400,270.000000,360.000000,0.036000) translate<44.400000,-1.536000,21.500000>}
object{ARC(1.651000,0.152400,90.000000,180.000000,0.036000) translate<44.400000,-1.536000,21.500000>}
object{ARC(1.651000,0.152400,270.000000,360.000000,0.036000) translate<44.400000,-1.536000,21.500000>}
object{ARC(2.159000,0.152400,90.000000,180.000000,0.036000) translate<44.400000,-1.536000,21.500000>}
object{ARC(2.159000,0.152400,270.000000,360.000000,0.036000) translate<44.400000,-1.536000,21.500000>}
difference{
cylinder{<44.400000,0,21.500000><44.400000,0.036000,21.500000>2.616200 translate<0,-1.536000,0>}
cylinder{<44.400000,-0.1,21.500000><44.400000,0.135000,21.500000>2.463800 translate<0,-1.536000,0>}}
//LED16 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<67.805000,-1.536000,12.560000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<63.995000,-1.536000,12.560000>}
box{<0,0,-0.101600><3.810000,0.036000,0.101600> rotate<0,0.000000,0> translate<63.995000,-1.536000,12.560000> }
object{ARC(3.175000,0.254000,306.869898,593.130102,0.036000) translate<65.900000,-1.536000,15.100000>}
object{ARC(1.143000,0.152400,90.000000,180.000000,0.036000) translate<65.900000,-1.536000,15.100000>}
object{ARC(1.143000,0.152400,270.000000,360.000000,0.036000) translate<65.900000,-1.536000,15.100000>}
object{ARC(1.651000,0.152400,90.000000,180.000000,0.036000) translate<65.900000,-1.536000,15.100000>}
object{ARC(1.651000,0.152400,270.000000,360.000000,0.036000) translate<65.900000,-1.536000,15.100000>}
object{ARC(2.159000,0.152400,90.000000,180.000000,0.036000) translate<65.900000,-1.536000,15.100000>}
object{ARC(2.159000,0.152400,270.000000,360.000000,0.036000) translate<65.900000,-1.536000,15.100000>}
difference{
cylinder{<65.900000,0,15.100000><65.900000,0.036000,15.100000>2.616200 translate<0,-1.536000,0>}
cylinder{<65.900000,-0.1,15.100000><65.900000,0.135000,15.100000>2.463800 translate<0,-1.536000,0>}}
//LED17 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<61.005000,-1.536000,12.360000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<57.195000,-1.536000,12.360000>}
box{<0,0,-0.101600><3.810000,0.036000,0.101600> rotate<0,0.000000,0> translate<57.195000,-1.536000,12.360000> }
object{ARC(3.175000,0.254000,306.869898,593.130102,0.036000) translate<59.100000,-1.536000,14.900000>}
object{ARC(1.143000,0.152400,90.000000,180.000000,0.036000) translate<59.100000,-1.536000,14.900000>}
object{ARC(1.143000,0.152400,270.000000,360.000000,0.036000) translate<59.100000,-1.536000,14.900000>}
object{ARC(1.651000,0.152400,90.000000,180.000000,0.036000) translate<59.100000,-1.536000,14.900000>}
object{ARC(1.651000,0.152400,270.000000,360.000000,0.036000) translate<59.100000,-1.536000,14.900000>}
object{ARC(2.159000,0.152400,90.000000,180.000000,0.036000) translate<59.100000,-1.536000,14.900000>}
object{ARC(2.159000,0.152400,270.000000,360.000000,0.036000) translate<59.100000,-1.536000,14.900000>}
difference{
cylinder{<59.100000,0,14.900000><59.100000,0.036000,14.900000>2.616200 translate<0,-1.536000,0>}
cylinder{<59.100000,-0.1,14.900000><59.100000,0.135000,14.900000>2.463800 translate<0,-1.536000,0>}}
//LED18 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.205000,-1.536000,12.160000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.395000,-1.536000,12.160000>}
box{<0,0,-0.101600><3.810000,0.036000,0.101600> rotate<0,0.000000,0> translate<50.395000,-1.536000,12.160000> }
object{ARC(3.175000,0.254000,306.869898,593.130102,0.036000) translate<52.300000,-1.536000,14.700000>}
object{ARC(1.143000,0.152400,90.000000,180.000000,0.036000) translate<52.300000,-1.536000,14.700000>}
object{ARC(1.143000,0.152400,270.000000,360.000000,0.036000) translate<52.300000,-1.536000,14.700000>}
object{ARC(1.651000,0.152400,90.000000,180.000000,0.036000) translate<52.300000,-1.536000,14.700000>}
object{ARC(1.651000,0.152400,270.000000,360.000000,0.036000) translate<52.300000,-1.536000,14.700000>}
object{ARC(2.159000,0.152400,90.000000,180.000000,0.036000) translate<52.300000,-1.536000,14.700000>}
object{ARC(2.159000,0.152400,270.000000,360.000000,0.036000) translate<52.300000,-1.536000,14.700000>}
difference{
cylinder{<52.300000,0,14.700000><52.300000,0.036000,14.700000>2.616200 translate<0,-1.536000,0>}
cylinder{<52.300000,-0.1,14.700000><52.300000,0.135000,14.700000>2.463800 translate<0,-1.536000,0>}}
//LED19 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<79.805000,-1.536000,19.060000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<75.995000,-1.536000,19.060000>}
box{<0,0,-0.101600><3.810000,0.036000,0.101600> rotate<0,0.000000,0> translate<75.995000,-1.536000,19.060000> }
object{ARC(3.175000,0.254000,306.869898,593.130102,0.036000) translate<77.900000,-1.536000,21.600000>}
object{ARC(1.143000,0.152400,90.000000,180.000000,0.036000) translate<77.900000,-1.536000,21.600000>}
object{ARC(1.143000,0.152400,270.000000,360.000000,0.036000) translate<77.900000,-1.536000,21.600000>}
object{ARC(1.651000,0.152400,90.000000,180.000000,0.036000) translate<77.900000,-1.536000,21.600000>}
object{ARC(1.651000,0.152400,270.000000,360.000000,0.036000) translate<77.900000,-1.536000,21.600000>}
object{ARC(2.159000,0.152400,90.000000,180.000000,0.036000) translate<77.900000,-1.536000,21.600000>}
object{ARC(2.159000,0.152400,270.000000,360.000000,0.036000) translate<77.900000,-1.536000,21.600000>}
difference{
cylinder{<77.900000,0,21.600000><77.900000,0.036000,21.600000>2.616200 translate<0,-1.536000,0>}
cylinder{<77.900000,-0.1,21.600000><77.900000,0.135000,21.600000>2.463800 translate<0,-1.536000,0>}}
//LED20 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<73.105000,-1.536000,19.160000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<69.295000,-1.536000,19.160000>}
box{<0,0,-0.101600><3.810000,0.036000,0.101600> rotate<0,0.000000,0> translate<69.295000,-1.536000,19.160000> }
object{ARC(3.175000,0.254000,306.869898,593.130102,0.036000) translate<71.200000,-1.536000,21.700000>}
object{ARC(1.143000,0.152400,90.000000,180.000000,0.036000) translate<71.200000,-1.536000,21.700000>}
object{ARC(1.143000,0.152400,270.000000,360.000000,0.036000) translate<71.200000,-1.536000,21.700000>}
object{ARC(1.651000,0.152400,90.000000,180.000000,0.036000) translate<71.200000,-1.536000,21.700000>}
object{ARC(1.651000,0.152400,270.000000,360.000000,0.036000) translate<71.200000,-1.536000,21.700000>}
object{ARC(2.159000,0.152400,90.000000,180.000000,0.036000) translate<71.200000,-1.536000,21.700000>}
object{ARC(2.159000,0.152400,270.000000,360.000000,0.036000) translate<71.200000,-1.536000,21.700000>}
difference{
cylinder{<71.200000,0,21.700000><71.200000,0.036000,21.700000>2.616200 translate<0,-1.536000,0>}
cylinder{<71.200000,-0.1,21.700000><71.200000,0.135000,21.700000>2.463800 translate<0,-1.536000,0>}}
//LED21 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<66.505000,-1.536000,19.060000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<62.695000,-1.536000,19.060000>}
box{<0,0,-0.101600><3.810000,0.036000,0.101600> rotate<0,0.000000,0> translate<62.695000,-1.536000,19.060000> }
object{ARC(3.175000,0.254000,306.869898,593.130102,0.036000) translate<64.600000,-1.536000,21.600000>}
object{ARC(1.143000,0.152400,90.000000,180.000000,0.036000) translate<64.600000,-1.536000,21.600000>}
object{ARC(1.143000,0.152400,270.000000,360.000000,0.036000) translate<64.600000,-1.536000,21.600000>}
object{ARC(1.651000,0.152400,90.000000,180.000000,0.036000) translate<64.600000,-1.536000,21.600000>}
object{ARC(1.651000,0.152400,270.000000,360.000000,0.036000) translate<64.600000,-1.536000,21.600000>}
object{ARC(2.159000,0.152400,90.000000,180.000000,0.036000) translate<64.600000,-1.536000,21.600000>}
object{ARC(2.159000,0.152400,270.000000,360.000000,0.036000) translate<64.600000,-1.536000,21.600000>}
difference{
cylinder{<64.600000,0,21.600000><64.600000,0.036000,21.600000>2.616200 translate<0,-1.536000,0>}
cylinder{<64.600000,-0.1,21.600000><64.600000,0.135000,21.600000>2.463800 translate<0,-1.536000,0>}}
//LED22 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<87.905000,-1.536000,12.560000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<84.095000,-1.536000,12.560000>}
box{<0,0,-0.101600><3.810000,0.036000,0.101600> rotate<0,0.000000,0> translate<84.095000,-1.536000,12.560000> }
object{ARC(3.175000,0.254000,306.869898,593.130102,0.036000) translate<86.000000,-1.536000,15.100000>}
object{ARC(1.143000,0.152400,90.000000,180.000000,0.036000) translate<86.000000,-1.536000,15.100000>}
object{ARC(1.143000,0.152400,270.000000,360.000000,0.036000) translate<86.000000,-1.536000,15.100000>}
object{ARC(1.651000,0.152400,90.000000,180.000000,0.036000) translate<86.000000,-1.536000,15.100000>}
object{ARC(1.651000,0.152400,270.000000,360.000000,0.036000) translate<86.000000,-1.536000,15.100000>}
object{ARC(2.159000,0.152400,90.000000,180.000000,0.036000) translate<86.000000,-1.536000,15.100000>}
object{ARC(2.159000,0.152400,270.000000,360.000000,0.036000) translate<86.000000,-1.536000,15.100000>}
difference{
cylinder{<86.000000,0,15.100000><86.000000,0.036000,15.100000>2.616200 translate<0,-1.536000,0>}
cylinder{<86.000000,-0.1,15.100000><86.000000,0.135000,15.100000>2.463800 translate<0,-1.536000,0>}}
//LED23 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<81.205000,-1.536000,12.560000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<77.395000,-1.536000,12.560000>}
box{<0,0,-0.101600><3.810000,0.036000,0.101600> rotate<0,0.000000,0> translate<77.395000,-1.536000,12.560000> }
object{ARC(3.175000,0.254000,306.869898,593.130102,0.036000) translate<79.300000,-1.536000,15.100000>}
object{ARC(1.143000,0.152400,90.000000,180.000000,0.036000) translate<79.300000,-1.536000,15.100000>}
object{ARC(1.143000,0.152400,270.000000,360.000000,0.036000) translate<79.300000,-1.536000,15.100000>}
object{ARC(1.651000,0.152400,90.000000,180.000000,0.036000) translate<79.300000,-1.536000,15.100000>}
object{ARC(1.651000,0.152400,270.000000,360.000000,0.036000) translate<79.300000,-1.536000,15.100000>}
object{ARC(2.159000,0.152400,90.000000,180.000000,0.036000) translate<79.300000,-1.536000,15.100000>}
object{ARC(2.159000,0.152400,270.000000,360.000000,0.036000) translate<79.300000,-1.536000,15.100000>}
difference{
cylinder{<79.300000,0,15.100000><79.300000,0.036000,15.100000>2.616200 translate<0,-1.536000,0>}
cylinder{<79.300000,-0.1,15.100000><79.300000,0.135000,15.100000>2.463800 translate<0,-1.536000,0>}}
//LED24 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<74.505000,-1.536000,12.660000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<70.695000,-1.536000,12.660000>}
box{<0,0,-0.101600><3.810000,0.036000,0.101600> rotate<0,0.000000,0> translate<70.695000,-1.536000,12.660000> }
object{ARC(3.175000,0.254000,306.869898,593.130102,0.036000) translate<72.600000,-1.536000,15.200000>}
object{ARC(1.143000,0.152400,90.000000,180.000000,0.036000) translate<72.600000,-1.536000,15.200000>}
object{ARC(1.143000,0.152400,270.000000,360.000000,0.036000) translate<72.600000,-1.536000,15.200000>}
object{ARC(1.651000,0.152400,90.000000,180.000000,0.036000) translate<72.600000,-1.536000,15.200000>}
object{ARC(1.651000,0.152400,270.000000,360.000000,0.036000) translate<72.600000,-1.536000,15.200000>}
object{ARC(2.159000,0.152400,90.000000,180.000000,0.036000) translate<72.600000,-1.536000,15.200000>}
object{ARC(2.159000,0.152400,270.000000,360.000000,0.036000) translate<72.600000,-1.536000,15.200000>}
difference{
cylinder{<72.600000,0,15.200000><72.600000,0.036000,15.200000>2.616200 translate<0,-1.536000,0>}
cylinder{<72.600000,-0.1,15.200000><72.600000,0.135000,15.200000>2.463800 translate<0,-1.536000,0>}}
//R1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<12.700000,-1.536000,31.800000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<12.700000,-1.536000,32.181000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<12.700000,-1.536000,32.181000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<13.589000,-1.536000,32.689000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<11.811000,-1.536000,32.689000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<11.811000,-1.536000,38.531000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<13.589000,-1.536000,38.531000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.811000,-1.536000,32.435000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.589000,-1.536000,32.435000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<11.811000,-1.536000,32.435000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.843000,-1.536000,32.689000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.843000,-1.536000,33.070000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<13.843000,-1.536000,33.070000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.716000,-1.536000,33.197000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.843000,-1.536000,33.070000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<13.716000,-1.536000,33.197000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.557000,-1.536000,32.689000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.557000,-1.536000,33.070000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<11.557000,-1.536000,33.070000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.684000,-1.536000,33.197000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.557000,-1.536000,33.070000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<11.557000,-1.536000,33.070000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.716000,-1.536000,38.023000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.843000,-1.536000,38.150000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<13.716000,-1.536000,38.023000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.716000,-1.536000,38.023000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.716000,-1.536000,33.197000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<13.716000,-1.536000,33.197000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.684000,-1.536000,38.023000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.557000,-1.536000,38.150000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<11.557000,-1.536000,38.150000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.684000,-1.536000,38.023000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.684000,-1.536000,33.197000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<11.684000,-1.536000,33.197000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.843000,-1.536000,38.531000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.843000,-1.536000,38.150000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<13.843000,-1.536000,38.150000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.557000,-1.536000,38.531000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.557000,-1.536000,38.150000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<11.557000,-1.536000,38.150000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.811000,-1.536000,38.785000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.589000,-1.536000,38.785000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<11.811000,-1.536000,38.785000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<12.700000,-1.536000,39.039000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<12.700000,-1.536000,39.420000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<12.700000,-1.536000,39.420000> }
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-90.000000,0> translate<12.700000,-1.536000,32.308000>}
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-90.000000,0> translate<12.700000,-1.536000,38.912000>}
//R2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<10.160000,-1.536000,29.260000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<10.160000,-1.536000,29.641000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<10.160000,-1.536000,29.641000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<11.049000,-1.536000,30.149000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<9.271000,-1.536000,30.149000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<9.271000,-1.536000,35.991000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<11.049000,-1.536000,35.991000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.271000,-1.536000,29.895000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.049000,-1.536000,29.895000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<9.271000,-1.536000,29.895000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.303000,-1.536000,30.149000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.303000,-1.536000,30.530000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<11.303000,-1.536000,30.530000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.176000,-1.536000,30.657000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.303000,-1.536000,30.530000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<11.176000,-1.536000,30.657000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.017000,-1.536000,30.149000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.017000,-1.536000,30.530000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<9.017000,-1.536000,30.530000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.144000,-1.536000,30.657000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.017000,-1.536000,30.530000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<9.017000,-1.536000,30.530000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.176000,-1.536000,35.483000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.303000,-1.536000,35.610000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<11.176000,-1.536000,35.483000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.176000,-1.536000,35.483000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.176000,-1.536000,30.657000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<11.176000,-1.536000,30.657000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.144000,-1.536000,35.483000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.017000,-1.536000,35.610000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<9.017000,-1.536000,35.610000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.144000,-1.536000,35.483000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.144000,-1.536000,30.657000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<9.144000,-1.536000,30.657000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.303000,-1.536000,35.991000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.303000,-1.536000,35.610000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<11.303000,-1.536000,35.610000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.017000,-1.536000,35.991000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.017000,-1.536000,35.610000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<9.017000,-1.536000,35.610000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.271000,-1.536000,36.245000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.049000,-1.536000,36.245000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<9.271000,-1.536000,36.245000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<10.160000,-1.536000,36.499000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<10.160000,-1.536000,36.880000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<10.160000,-1.536000,36.880000> }
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-90.000000,0> translate<10.160000,-1.536000,29.768000>}
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-90.000000,0> translate<10.160000,-1.536000,36.372000>}
//R3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<7.620000,-1.536000,26.720000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<7.620000,-1.536000,27.101000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<7.620000,-1.536000,27.101000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<8.509000,-1.536000,27.609000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<6.731000,-1.536000,27.609000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<6.731000,-1.536000,33.451000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<8.509000,-1.536000,33.451000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.731000,-1.536000,27.355000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.509000,-1.536000,27.355000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<6.731000,-1.536000,27.355000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.763000,-1.536000,27.609000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.763000,-1.536000,27.990000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<8.763000,-1.536000,27.990000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.636000,-1.536000,28.117000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.763000,-1.536000,27.990000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<8.636000,-1.536000,28.117000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.477000,-1.536000,27.609000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.477000,-1.536000,27.990000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<6.477000,-1.536000,27.990000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.604000,-1.536000,28.117000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.477000,-1.536000,27.990000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<6.477000,-1.536000,27.990000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.636000,-1.536000,32.943000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.763000,-1.536000,33.070000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<8.636000,-1.536000,32.943000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.636000,-1.536000,32.943000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.636000,-1.536000,28.117000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<8.636000,-1.536000,28.117000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.604000,-1.536000,32.943000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.477000,-1.536000,33.070000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<6.477000,-1.536000,33.070000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.604000,-1.536000,32.943000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.604000,-1.536000,28.117000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<6.604000,-1.536000,28.117000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.763000,-1.536000,33.451000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.763000,-1.536000,33.070000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<8.763000,-1.536000,33.070000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.477000,-1.536000,33.451000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.477000,-1.536000,33.070000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<6.477000,-1.536000,33.070000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.731000,-1.536000,33.705000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.509000,-1.536000,33.705000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<6.731000,-1.536000,33.705000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<7.620000,-1.536000,33.959000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<7.620000,-1.536000,34.340000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<7.620000,-1.536000,34.340000> }
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-90.000000,0> translate<7.620000,-1.536000,27.228000>}
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-90.000000,0> translate<7.620000,-1.536000,33.832000>}
//R4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<23.790000,-1.536000,31.800000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<23.790000,-1.536000,32.181000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<23.790000,-1.536000,32.181000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<24.679000,-1.536000,32.689000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<22.901000,-1.536000,32.689000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<22.901000,-1.536000,38.531000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<24.679000,-1.536000,38.531000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.901000,-1.536000,32.435000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.679000,-1.536000,32.435000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<22.901000,-1.536000,32.435000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.933000,-1.536000,32.689000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.933000,-1.536000,33.070000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<24.933000,-1.536000,33.070000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.806000,-1.536000,33.197000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.933000,-1.536000,33.070000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<24.806000,-1.536000,33.197000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.647000,-1.536000,32.689000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.647000,-1.536000,33.070000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<22.647000,-1.536000,33.070000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.774000,-1.536000,33.197000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.647000,-1.536000,33.070000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<22.647000,-1.536000,33.070000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.806000,-1.536000,38.023000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.933000,-1.536000,38.150000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<24.806000,-1.536000,38.023000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.806000,-1.536000,38.023000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.806000,-1.536000,33.197000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<24.806000,-1.536000,33.197000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.774000,-1.536000,38.023000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.647000,-1.536000,38.150000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<22.647000,-1.536000,38.150000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.774000,-1.536000,38.023000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.774000,-1.536000,33.197000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<22.774000,-1.536000,33.197000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.933000,-1.536000,38.531000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.933000,-1.536000,38.150000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<24.933000,-1.536000,38.150000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.647000,-1.536000,38.531000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.647000,-1.536000,38.150000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<22.647000,-1.536000,38.150000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.901000,-1.536000,38.785000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.679000,-1.536000,38.785000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<22.901000,-1.536000,38.785000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<23.790000,-1.536000,39.039000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<23.790000,-1.536000,39.420000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<23.790000,-1.536000,39.420000> }
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-90.000000,0> translate<23.790000,-1.536000,32.308000>}
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-90.000000,0> translate<23.790000,-1.536000,38.912000>}
//R5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<21.350000,-1.536000,29.260000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<21.350000,-1.536000,29.641000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<21.350000,-1.536000,29.641000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<22.239000,-1.536000,30.149000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<20.461000,-1.536000,30.149000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<20.461000,-1.536000,35.991000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<22.239000,-1.536000,35.991000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.461000,-1.536000,29.895000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.239000,-1.536000,29.895000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<20.461000,-1.536000,29.895000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.493000,-1.536000,30.149000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.493000,-1.536000,30.530000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<22.493000,-1.536000,30.530000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.366000,-1.536000,30.657000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.493000,-1.536000,30.530000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<22.366000,-1.536000,30.657000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.207000,-1.536000,30.149000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.207000,-1.536000,30.530000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<20.207000,-1.536000,30.530000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.334000,-1.536000,30.657000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.207000,-1.536000,30.530000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<20.207000,-1.536000,30.530000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.366000,-1.536000,35.483000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.493000,-1.536000,35.610000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<22.366000,-1.536000,35.483000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.366000,-1.536000,35.483000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.366000,-1.536000,30.657000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<22.366000,-1.536000,30.657000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.334000,-1.536000,35.483000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.207000,-1.536000,35.610000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<20.207000,-1.536000,35.610000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.334000,-1.536000,35.483000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.334000,-1.536000,30.657000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<20.334000,-1.536000,30.657000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.493000,-1.536000,35.991000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.493000,-1.536000,35.610000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<22.493000,-1.536000,35.610000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.207000,-1.536000,35.991000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.207000,-1.536000,35.610000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<20.207000,-1.536000,35.610000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.461000,-1.536000,36.245000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.239000,-1.536000,36.245000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<20.461000,-1.536000,36.245000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<21.350000,-1.536000,36.499000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<21.350000,-1.536000,36.880000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<21.350000,-1.536000,36.880000> }
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-90.000000,0> translate<21.350000,-1.536000,29.768000>}
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-90.000000,0> translate<21.350000,-1.536000,36.372000>}
//R6 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<18.910000,-1.536000,26.720000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<18.910000,-1.536000,27.101000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<18.910000,-1.536000,27.101000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<19.799000,-1.536000,27.609000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<18.021000,-1.536000,27.609000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<18.021000,-1.536000,33.451000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<19.799000,-1.536000,33.451000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.021000,-1.536000,27.355000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.799000,-1.536000,27.355000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<18.021000,-1.536000,27.355000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.053000,-1.536000,27.609000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.053000,-1.536000,27.990000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<20.053000,-1.536000,27.990000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.926000,-1.536000,28.117000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.053000,-1.536000,27.990000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<19.926000,-1.536000,28.117000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.767000,-1.536000,27.609000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.767000,-1.536000,27.990000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<17.767000,-1.536000,27.990000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.894000,-1.536000,28.117000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.767000,-1.536000,27.990000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<17.767000,-1.536000,27.990000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.926000,-1.536000,32.943000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.053000,-1.536000,33.070000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<19.926000,-1.536000,32.943000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.926000,-1.536000,32.943000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.926000,-1.536000,28.117000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<19.926000,-1.536000,28.117000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.894000,-1.536000,32.943000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.767000,-1.536000,33.070000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<17.767000,-1.536000,33.070000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.894000,-1.536000,32.943000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.894000,-1.536000,28.117000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<17.894000,-1.536000,28.117000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.053000,-1.536000,33.451000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.053000,-1.536000,33.070000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<20.053000,-1.536000,33.070000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.767000,-1.536000,33.451000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.767000,-1.536000,33.070000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<17.767000,-1.536000,33.070000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.021000,-1.536000,33.705000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.799000,-1.536000,33.705000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<18.021000,-1.536000,33.705000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<18.910000,-1.536000,33.959000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<18.910000,-1.536000,34.340000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<18.910000,-1.536000,34.340000> }
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-90.000000,0> translate<18.910000,-1.536000,27.228000>}
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-90.000000,0> translate<18.910000,-1.536000,33.832000>}
//R7 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<32.480000,-1.536000,31.800000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<32.480000,-1.536000,32.181000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<32.480000,-1.536000,32.181000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<33.369000,-1.536000,32.689000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<31.591000,-1.536000,32.689000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<31.591000,-1.536000,38.531000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<33.369000,-1.536000,38.531000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.591000,-1.536000,32.435000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.369000,-1.536000,32.435000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<31.591000,-1.536000,32.435000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.623000,-1.536000,32.689000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.623000,-1.536000,33.070000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<33.623000,-1.536000,33.070000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.496000,-1.536000,33.197000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.623000,-1.536000,33.070000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<33.496000,-1.536000,33.197000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.337000,-1.536000,32.689000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.337000,-1.536000,33.070000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<31.337000,-1.536000,33.070000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.464000,-1.536000,33.197000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.337000,-1.536000,33.070000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<31.337000,-1.536000,33.070000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.496000,-1.536000,38.023000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.623000,-1.536000,38.150000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<33.496000,-1.536000,38.023000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.496000,-1.536000,38.023000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.496000,-1.536000,33.197000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<33.496000,-1.536000,33.197000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.464000,-1.536000,38.023000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.337000,-1.536000,38.150000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<31.337000,-1.536000,38.150000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.464000,-1.536000,38.023000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.464000,-1.536000,33.197000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<31.464000,-1.536000,33.197000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.623000,-1.536000,38.531000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.623000,-1.536000,38.150000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<33.623000,-1.536000,38.150000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.337000,-1.536000,38.531000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.337000,-1.536000,38.150000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<31.337000,-1.536000,38.150000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.591000,-1.536000,38.785000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.369000,-1.536000,38.785000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<31.591000,-1.536000,38.785000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<32.480000,-1.536000,39.039000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<32.480000,-1.536000,39.420000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<32.480000,-1.536000,39.420000> }
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-90.000000,0> translate<32.480000,-1.536000,32.308000>}
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-90.000000,0> translate<32.480000,-1.536000,38.912000>}
//R8 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<29.940000,-1.536000,29.260000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<29.940000,-1.536000,29.641000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<29.940000,-1.536000,29.641000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<30.829000,-1.536000,30.149000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<29.051000,-1.536000,30.149000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<29.051000,-1.536000,35.991000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<30.829000,-1.536000,35.991000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.051000,-1.536000,29.895000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.829000,-1.536000,29.895000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<29.051000,-1.536000,29.895000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.083000,-1.536000,30.149000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.083000,-1.536000,30.530000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<31.083000,-1.536000,30.530000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.956000,-1.536000,30.657000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.083000,-1.536000,30.530000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<30.956000,-1.536000,30.657000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.797000,-1.536000,30.149000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.797000,-1.536000,30.530000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<28.797000,-1.536000,30.530000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.924000,-1.536000,30.657000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.797000,-1.536000,30.530000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<28.797000,-1.536000,30.530000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.956000,-1.536000,35.483000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.083000,-1.536000,35.610000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<30.956000,-1.536000,35.483000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.956000,-1.536000,35.483000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.956000,-1.536000,30.657000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<30.956000,-1.536000,30.657000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.924000,-1.536000,35.483000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.797000,-1.536000,35.610000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<28.797000,-1.536000,35.610000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.924000,-1.536000,35.483000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.924000,-1.536000,30.657000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<28.924000,-1.536000,30.657000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.083000,-1.536000,35.991000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.083000,-1.536000,35.610000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<31.083000,-1.536000,35.610000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.797000,-1.536000,35.991000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.797000,-1.536000,35.610000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<28.797000,-1.536000,35.610000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.051000,-1.536000,36.245000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.829000,-1.536000,36.245000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<29.051000,-1.536000,36.245000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<29.940000,-1.536000,36.499000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<29.940000,-1.536000,36.880000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<29.940000,-1.536000,36.880000> }
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-90.000000,0> translate<29.940000,-1.536000,29.768000>}
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-90.000000,0> translate<29.940000,-1.536000,36.372000>}
//R9 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<27.300000,-1.536000,26.720000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<27.300000,-1.536000,27.101000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<27.300000,-1.536000,27.101000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<28.189000,-1.536000,27.609000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<26.411000,-1.536000,27.609000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<26.411000,-1.536000,33.451000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<28.189000,-1.536000,33.451000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.411000,-1.536000,27.355000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.189000,-1.536000,27.355000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<26.411000,-1.536000,27.355000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.443000,-1.536000,27.609000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.443000,-1.536000,27.990000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<28.443000,-1.536000,27.990000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.316000,-1.536000,28.117000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.443000,-1.536000,27.990000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<28.316000,-1.536000,28.117000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.157000,-1.536000,27.609000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.157000,-1.536000,27.990000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<26.157000,-1.536000,27.990000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.284000,-1.536000,28.117000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.157000,-1.536000,27.990000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<26.157000,-1.536000,27.990000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.316000,-1.536000,32.943000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.443000,-1.536000,33.070000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<28.316000,-1.536000,32.943000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.316000,-1.536000,32.943000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.316000,-1.536000,28.117000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<28.316000,-1.536000,28.117000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.284000,-1.536000,32.943000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.157000,-1.536000,33.070000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<26.157000,-1.536000,33.070000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.284000,-1.536000,32.943000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.284000,-1.536000,28.117000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<26.284000,-1.536000,28.117000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.443000,-1.536000,33.451000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.443000,-1.536000,33.070000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<28.443000,-1.536000,33.070000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.157000,-1.536000,33.451000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.157000,-1.536000,33.070000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<26.157000,-1.536000,33.070000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.411000,-1.536000,33.705000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.189000,-1.536000,33.705000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<26.411000,-1.536000,33.705000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<27.300000,-1.536000,33.959000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<27.300000,-1.536000,34.340000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<27.300000,-1.536000,34.340000> }
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-90.000000,0> translate<27.300000,-1.536000,27.228000>}
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-90.000000,0> translate<27.300000,-1.536000,33.832000>}
//R10 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<43.070000,-1.536000,31.800000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<43.070000,-1.536000,32.181000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<43.070000,-1.536000,32.181000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<43.959000,-1.536000,32.689000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<42.181000,-1.536000,32.689000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<42.181000,-1.536000,38.531000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<43.959000,-1.536000,38.531000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.181000,-1.536000,32.435000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.959000,-1.536000,32.435000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<42.181000,-1.536000,32.435000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.213000,-1.536000,32.689000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.213000,-1.536000,33.070000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<44.213000,-1.536000,33.070000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.086000,-1.536000,33.197000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.213000,-1.536000,33.070000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<44.086000,-1.536000,33.197000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.927000,-1.536000,32.689000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.927000,-1.536000,33.070000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<41.927000,-1.536000,33.070000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.054000,-1.536000,33.197000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.927000,-1.536000,33.070000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<41.927000,-1.536000,33.070000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.086000,-1.536000,38.023000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.213000,-1.536000,38.150000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<44.086000,-1.536000,38.023000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.086000,-1.536000,38.023000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.086000,-1.536000,33.197000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<44.086000,-1.536000,33.197000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.054000,-1.536000,38.023000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.927000,-1.536000,38.150000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<41.927000,-1.536000,38.150000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.054000,-1.536000,38.023000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.054000,-1.536000,33.197000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<42.054000,-1.536000,33.197000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.213000,-1.536000,38.531000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.213000,-1.536000,38.150000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<44.213000,-1.536000,38.150000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.927000,-1.536000,38.531000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.927000,-1.536000,38.150000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<41.927000,-1.536000,38.150000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.181000,-1.536000,38.785000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.959000,-1.536000,38.785000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<42.181000,-1.536000,38.785000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<43.070000,-1.536000,39.039000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<43.070000,-1.536000,39.420000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<43.070000,-1.536000,39.420000> }
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-90.000000,0> translate<43.070000,-1.536000,32.308000>}
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-90.000000,0> translate<43.070000,-1.536000,38.912000>}
//R11 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<40.630000,-1.536000,29.260000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<40.630000,-1.536000,29.641000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<40.630000,-1.536000,29.641000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<41.519000,-1.536000,30.149000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<39.741000,-1.536000,30.149000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<39.741000,-1.536000,35.991000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<41.519000,-1.536000,35.991000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.741000,-1.536000,29.895000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.519000,-1.536000,29.895000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<39.741000,-1.536000,29.895000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.773000,-1.536000,30.149000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.773000,-1.536000,30.530000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<41.773000,-1.536000,30.530000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.646000,-1.536000,30.657000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.773000,-1.536000,30.530000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<41.646000,-1.536000,30.657000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.487000,-1.536000,30.149000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.487000,-1.536000,30.530000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<39.487000,-1.536000,30.530000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.614000,-1.536000,30.657000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.487000,-1.536000,30.530000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<39.487000,-1.536000,30.530000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.646000,-1.536000,35.483000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.773000,-1.536000,35.610000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<41.646000,-1.536000,35.483000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.646000,-1.536000,35.483000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.646000,-1.536000,30.657000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<41.646000,-1.536000,30.657000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.614000,-1.536000,35.483000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.487000,-1.536000,35.610000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<39.487000,-1.536000,35.610000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.614000,-1.536000,35.483000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.614000,-1.536000,30.657000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<39.614000,-1.536000,30.657000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.773000,-1.536000,35.991000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.773000,-1.536000,35.610000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<41.773000,-1.536000,35.610000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.487000,-1.536000,35.991000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.487000,-1.536000,35.610000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<39.487000,-1.536000,35.610000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.741000,-1.536000,36.245000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.519000,-1.536000,36.245000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<39.741000,-1.536000,36.245000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<40.630000,-1.536000,36.499000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<40.630000,-1.536000,36.880000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<40.630000,-1.536000,36.880000> }
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-90.000000,0> translate<40.630000,-1.536000,29.768000>}
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-90.000000,0> translate<40.630000,-1.536000,36.372000>}
//R12 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<37.990000,-1.536000,26.720000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<37.990000,-1.536000,27.101000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<37.990000,-1.536000,27.101000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<38.879000,-1.536000,27.609000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<37.101000,-1.536000,27.609000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<37.101000,-1.536000,33.451000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<38.879000,-1.536000,33.451000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.101000,-1.536000,27.355000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.879000,-1.536000,27.355000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<37.101000,-1.536000,27.355000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.133000,-1.536000,27.609000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.133000,-1.536000,27.990000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<39.133000,-1.536000,27.990000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.006000,-1.536000,28.117000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.133000,-1.536000,27.990000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<39.006000,-1.536000,28.117000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.847000,-1.536000,27.609000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.847000,-1.536000,27.990000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<36.847000,-1.536000,27.990000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.974000,-1.536000,28.117000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.847000,-1.536000,27.990000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<36.847000,-1.536000,27.990000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.006000,-1.536000,32.943000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.133000,-1.536000,33.070000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<39.006000,-1.536000,32.943000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.006000,-1.536000,32.943000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.006000,-1.536000,28.117000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<39.006000,-1.536000,28.117000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.974000,-1.536000,32.943000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.847000,-1.536000,33.070000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<36.847000,-1.536000,33.070000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.974000,-1.536000,32.943000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.974000,-1.536000,28.117000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<36.974000,-1.536000,28.117000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.133000,-1.536000,33.451000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.133000,-1.536000,33.070000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<39.133000,-1.536000,33.070000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.847000,-1.536000,33.451000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.847000,-1.536000,33.070000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<36.847000,-1.536000,33.070000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.101000,-1.536000,33.705000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.879000,-1.536000,33.705000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<37.101000,-1.536000,33.705000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<37.990000,-1.536000,33.959000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<37.990000,-1.536000,34.340000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<37.990000,-1.536000,34.340000> }
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-90.000000,0> translate<37.990000,-1.536000,27.228000>}
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-90.000000,0> translate<37.990000,-1.536000,33.832000>}
//R13 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<52.660000,-1.536000,31.800000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<52.660000,-1.536000,32.181000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<52.660000,-1.536000,32.181000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<53.549000,-1.536000,32.689000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<51.771000,-1.536000,32.689000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<51.771000,-1.536000,38.531000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<53.549000,-1.536000,38.531000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.771000,-1.536000,32.435000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.549000,-1.536000,32.435000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<51.771000,-1.536000,32.435000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.803000,-1.536000,32.689000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.803000,-1.536000,33.070000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<53.803000,-1.536000,33.070000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.676000,-1.536000,33.197000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.803000,-1.536000,33.070000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<53.676000,-1.536000,33.197000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.517000,-1.536000,32.689000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.517000,-1.536000,33.070000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<51.517000,-1.536000,33.070000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.644000,-1.536000,33.197000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.517000,-1.536000,33.070000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<51.517000,-1.536000,33.070000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.676000,-1.536000,38.023000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.803000,-1.536000,38.150000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<53.676000,-1.536000,38.023000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.676000,-1.536000,38.023000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.676000,-1.536000,33.197000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<53.676000,-1.536000,33.197000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.644000,-1.536000,38.023000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.517000,-1.536000,38.150000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<51.517000,-1.536000,38.150000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.644000,-1.536000,38.023000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.644000,-1.536000,33.197000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<51.644000,-1.536000,33.197000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.803000,-1.536000,38.531000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.803000,-1.536000,38.150000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<53.803000,-1.536000,38.150000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.517000,-1.536000,38.531000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.517000,-1.536000,38.150000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<51.517000,-1.536000,38.150000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.771000,-1.536000,38.785000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.549000,-1.536000,38.785000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<51.771000,-1.536000,38.785000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<52.660000,-1.536000,39.039000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<52.660000,-1.536000,39.420000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<52.660000,-1.536000,39.420000> }
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-90.000000,0> translate<52.660000,-1.536000,32.308000>}
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-90.000000,0> translate<52.660000,-1.536000,38.912000>}
//R14 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<50.120000,-1.536000,29.260000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<50.120000,-1.536000,29.641000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<50.120000,-1.536000,29.641000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<51.009000,-1.536000,30.149000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<49.231000,-1.536000,30.149000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<49.231000,-1.536000,35.991000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<51.009000,-1.536000,35.991000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.231000,-1.536000,29.895000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.009000,-1.536000,29.895000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<49.231000,-1.536000,29.895000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.263000,-1.536000,30.149000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.263000,-1.536000,30.530000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<51.263000,-1.536000,30.530000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.136000,-1.536000,30.657000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.263000,-1.536000,30.530000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<51.136000,-1.536000,30.657000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.977000,-1.536000,30.149000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.977000,-1.536000,30.530000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<48.977000,-1.536000,30.530000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.104000,-1.536000,30.657000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.977000,-1.536000,30.530000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<48.977000,-1.536000,30.530000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.136000,-1.536000,35.483000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.263000,-1.536000,35.610000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<51.136000,-1.536000,35.483000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.136000,-1.536000,35.483000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.136000,-1.536000,30.657000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<51.136000,-1.536000,30.657000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.104000,-1.536000,35.483000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.977000,-1.536000,35.610000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<48.977000,-1.536000,35.610000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.104000,-1.536000,35.483000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.104000,-1.536000,30.657000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<49.104000,-1.536000,30.657000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.263000,-1.536000,35.991000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.263000,-1.536000,35.610000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<51.263000,-1.536000,35.610000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.977000,-1.536000,35.991000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.977000,-1.536000,35.610000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<48.977000,-1.536000,35.610000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.231000,-1.536000,36.245000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.009000,-1.536000,36.245000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<49.231000,-1.536000,36.245000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<50.120000,-1.536000,36.499000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<50.120000,-1.536000,36.880000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<50.120000,-1.536000,36.880000> }
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-90.000000,0> translate<50.120000,-1.536000,29.768000>}
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-90.000000,0> translate<50.120000,-1.536000,36.372000>}
//R15 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<47.480000,-1.536000,26.820000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<47.480000,-1.536000,27.201000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<47.480000,-1.536000,27.201000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<48.369000,-1.536000,27.709000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<46.591000,-1.536000,27.709000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<46.591000,-1.536000,33.551000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<48.369000,-1.536000,33.551000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.591000,-1.536000,27.455000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.369000,-1.536000,27.455000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<46.591000,-1.536000,27.455000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.623000,-1.536000,27.709000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.623000,-1.536000,28.090000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<48.623000,-1.536000,28.090000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.496000,-1.536000,28.217000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.623000,-1.536000,28.090000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<48.496000,-1.536000,28.217000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.337000,-1.536000,27.709000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.337000,-1.536000,28.090000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<46.337000,-1.536000,28.090000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.464000,-1.536000,28.217000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.337000,-1.536000,28.090000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<46.337000,-1.536000,28.090000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.496000,-1.536000,33.043000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.623000,-1.536000,33.170000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<48.496000,-1.536000,33.043000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.496000,-1.536000,33.043000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.496000,-1.536000,28.217000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<48.496000,-1.536000,28.217000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.464000,-1.536000,33.043000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.337000,-1.536000,33.170000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<46.337000,-1.536000,33.170000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.464000,-1.536000,33.043000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.464000,-1.536000,28.217000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<46.464000,-1.536000,28.217000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.623000,-1.536000,33.551000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.623000,-1.536000,33.170000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<48.623000,-1.536000,33.170000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.337000,-1.536000,33.551000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.337000,-1.536000,33.170000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<46.337000,-1.536000,33.170000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.591000,-1.536000,33.805000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.369000,-1.536000,33.805000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<46.591000,-1.536000,33.805000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<47.480000,-1.536000,34.059000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<47.480000,-1.536000,34.440000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<47.480000,-1.536000,34.440000> }
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-90.000000,0> translate<47.480000,-1.536000,27.328000>}
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-90.000000,0> translate<47.480000,-1.536000,33.932000>}
//R16 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<61.550000,-1.536000,31.800000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<61.550000,-1.536000,32.181000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<61.550000,-1.536000,32.181000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<62.439000,-1.536000,32.689000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<60.661000,-1.536000,32.689000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<60.661000,-1.536000,38.531000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<62.439000,-1.536000,38.531000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.661000,-1.536000,32.435000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.439000,-1.536000,32.435000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<60.661000,-1.536000,32.435000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.693000,-1.536000,32.689000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.693000,-1.536000,33.070000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<62.693000,-1.536000,33.070000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.566000,-1.536000,33.197000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.693000,-1.536000,33.070000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<62.566000,-1.536000,33.197000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.407000,-1.536000,32.689000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.407000,-1.536000,33.070000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<60.407000,-1.536000,33.070000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.534000,-1.536000,33.197000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.407000,-1.536000,33.070000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<60.407000,-1.536000,33.070000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.566000,-1.536000,38.023000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.693000,-1.536000,38.150000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<62.566000,-1.536000,38.023000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.566000,-1.536000,38.023000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.566000,-1.536000,33.197000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<62.566000,-1.536000,33.197000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.534000,-1.536000,38.023000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.407000,-1.536000,38.150000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<60.407000,-1.536000,38.150000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.534000,-1.536000,38.023000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.534000,-1.536000,33.197000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<60.534000,-1.536000,33.197000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.693000,-1.536000,38.531000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.693000,-1.536000,38.150000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<62.693000,-1.536000,38.150000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.407000,-1.536000,38.531000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.407000,-1.536000,38.150000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<60.407000,-1.536000,38.150000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.661000,-1.536000,38.785000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.439000,-1.536000,38.785000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<60.661000,-1.536000,38.785000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<61.550000,-1.536000,39.039000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<61.550000,-1.536000,39.420000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<61.550000,-1.536000,39.420000> }
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-90.000000,0> translate<61.550000,-1.536000,32.308000>}
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-90.000000,0> translate<61.550000,-1.536000,38.912000>}
//R17 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<59.010000,-1.536000,29.260000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<59.010000,-1.536000,29.641000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<59.010000,-1.536000,29.641000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<59.899000,-1.536000,30.149000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<58.121000,-1.536000,30.149000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<58.121000,-1.536000,35.991000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<59.899000,-1.536000,35.991000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.121000,-1.536000,29.895000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.899000,-1.536000,29.895000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<58.121000,-1.536000,29.895000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.153000,-1.536000,30.149000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.153000,-1.536000,30.530000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<60.153000,-1.536000,30.530000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.026000,-1.536000,30.657000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.153000,-1.536000,30.530000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<60.026000,-1.536000,30.657000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.867000,-1.536000,30.149000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.867000,-1.536000,30.530000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<57.867000,-1.536000,30.530000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.994000,-1.536000,30.657000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.867000,-1.536000,30.530000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<57.867000,-1.536000,30.530000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.026000,-1.536000,35.483000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.153000,-1.536000,35.610000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<60.026000,-1.536000,35.483000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.026000,-1.536000,35.483000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.026000,-1.536000,30.657000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<60.026000,-1.536000,30.657000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.994000,-1.536000,35.483000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.867000,-1.536000,35.610000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<57.867000,-1.536000,35.610000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.994000,-1.536000,35.483000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.994000,-1.536000,30.657000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<57.994000,-1.536000,30.657000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.153000,-1.536000,35.991000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.153000,-1.536000,35.610000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<60.153000,-1.536000,35.610000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.867000,-1.536000,35.991000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.867000,-1.536000,35.610000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<57.867000,-1.536000,35.610000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.121000,-1.536000,36.245000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.899000,-1.536000,36.245000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<58.121000,-1.536000,36.245000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<59.010000,-1.536000,36.499000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<59.010000,-1.536000,36.880000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<59.010000,-1.536000,36.880000> }
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-90.000000,0> translate<59.010000,-1.536000,29.768000>}
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-90.000000,0> translate<59.010000,-1.536000,36.372000>}
//R18 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<56.470000,-1.536000,26.720000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<56.470000,-1.536000,27.101000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<56.470000,-1.536000,27.101000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<57.359000,-1.536000,27.609000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<55.581000,-1.536000,27.609000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<55.581000,-1.536000,33.451000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<57.359000,-1.536000,33.451000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.581000,-1.536000,27.355000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.359000,-1.536000,27.355000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<55.581000,-1.536000,27.355000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.613000,-1.536000,27.609000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.613000,-1.536000,27.990000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<57.613000,-1.536000,27.990000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.486000,-1.536000,28.117000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.613000,-1.536000,27.990000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<57.486000,-1.536000,28.117000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.327000,-1.536000,27.609000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.327000,-1.536000,27.990000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<55.327000,-1.536000,27.990000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.454000,-1.536000,28.117000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.327000,-1.536000,27.990000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<55.327000,-1.536000,27.990000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.486000,-1.536000,32.943000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.613000,-1.536000,33.070000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<57.486000,-1.536000,32.943000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.486000,-1.536000,32.943000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.486000,-1.536000,28.117000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<57.486000,-1.536000,28.117000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.454000,-1.536000,32.943000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.327000,-1.536000,33.070000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<55.327000,-1.536000,33.070000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.454000,-1.536000,32.943000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.454000,-1.536000,28.117000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<55.454000,-1.536000,28.117000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.613000,-1.536000,33.451000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.613000,-1.536000,33.070000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<57.613000,-1.536000,33.070000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.327000,-1.536000,33.451000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.327000,-1.536000,33.070000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<55.327000,-1.536000,33.070000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.581000,-1.536000,33.705000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.359000,-1.536000,33.705000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<55.581000,-1.536000,33.705000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<56.470000,-1.536000,33.959000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<56.470000,-1.536000,34.340000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<56.470000,-1.536000,34.340000> }
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-90.000000,0> translate<56.470000,-1.536000,27.228000>}
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-90.000000,0> translate<56.470000,-1.536000,33.832000>}
//R19 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<70.440000,-1.536000,31.800000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<70.440000,-1.536000,32.181000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<70.440000,-1.536000,32.181000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<71.329000,-1.536000,32.689000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<69.551000,-1.536000,32.689000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<69.551000,-1.536000,38.531000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<71.329000,-1.536000,38.531000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.551000,-1.536000,32.435000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.329000,-1.536000,32.435000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<69.551000,-1.536000,32.435000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.583000,-1.536000,32.689000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.583000,-1.536000,33.070000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<71.583000,-1.536000,33.070000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.456000,-1.536000,33.197000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.583000,-1.536000,33.070000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<71.456000,-1.536000,33.197000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.297000,-1.536000,32.689000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.297000,-1.536000,33.070000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<69.297000,-1.536000,33.070000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.424000,-1.536000,33.197000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.297000,-1.536000,33.070000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<69.297000,-1.536000,33.070000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.456000,-1.536000,38.023000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.583000,-1.536000,38.150000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<71.456000,-1.536000,38.023000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.456000,-1.536000,38.023000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.456000,-1.536000,33.197000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<71.456000,-1.536000,33.197000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.424000,-1.536000,38.023000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.297000,-1.536000,38.150000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<69.297000,-1.536000,38.150000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.424000,-1.536000,38.023000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.424000,-1.536000,33.197000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<69.424000,-1.536000,33.197000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.583000,-1.536000,38.531000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.583000,-1.536000,38.150000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<71.583000,-1.536000,38.150000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.297000,-1.536000,38.531000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.297000,-1.536000,38.150000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<69.297000,-1.536000,38.150000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.551000,-1.536000,38.785000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.329000,-1.536000,38.785000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<69.551000,-1.536000,38.785000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<70.440000,-1.536000,39.039000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<70.440000,-1.536000,39.420000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<70.440000,-1.536000,39.420000> }
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-90.000000,0> translate<70.440000,-1.536000,32.308000>}
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-90.000000,0> translate<70.440000,-1.536000,38.912000>}
//R20 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<67.900000,-1.536000,29.260000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<67.900000,-1.536000,29.641000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<67.900000,-1.536000,29.641000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<68.789000,-1.536000,30.149000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<67.011000,-1.536000,30.149000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<67.011000,-1.536000,35.991000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<68.789000,-1.536000,35.991000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.011000,-1.536000,29.895000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.789000,-1.536000,29.895000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<67.011000,-1.536000,29.895000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.043000,-1.536000,30.149000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.043000,-1.536000,30.530000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<69.043000,-1.536000,30.530000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.916000,-1.536000,30.657000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.043000,-1.536000,30.530000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<68.916000,-1.536000,30.657000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.757000,-1.536000,30.149000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.757000,-1.536000,30.530000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<66.757000,-1.536000,30.530000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.884000,-1.536000,30.657000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.757000,-1.536000,30.530000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<66.757000,-1.536000,30.530000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.916000,-1.536000,35.483000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.043000,-1.536000,35.610000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<68.916000,-1.536000,35.483000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.916000,-1.536000,35.483000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.916000,-1.536000,30.657000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<68.916000,-1.536000,30.657000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.884000,-1.536000,35.483000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.757000,-1.536000,35.610000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<66.757000,-1.536000,35.610000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.884000,-1.536000,35.483000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.884000,-1.536000,30.657000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<66.884000,-1.536000,30.657000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.043000,-1.536000,35.991000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.043000,-1.536000,35.610000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<69.043000,-1.536000,35.610000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.757000,-1.536000,35.991000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.757000,-1.536000,35.610000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<66.757000,-1.536000,35.610000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.011000,-1.536000,36.245000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.789000,-1.536000,36.245000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<67.011000,-1.536000,36.245000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<67.900000,-1.536000,36.499000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<67.900000,-1.536000,36.880000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<67.900000,-1.536000,36.880000> }
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-90.000000,0> translate<67.900000,-1.536000,29.768000>}
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-90.000000,0> translate<67.900000,-1.536000,36.372000>}
//R21 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<65.360000,-1.536000,26.720000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<65.360000,-1.536000,27.101000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<65.360000,-1.536000,27.101000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<66.249000,-1.536000,27.609000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<64.471000,-1.536000,27.609000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<64.471000,-1.536000,33.451000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<66.249000,-1.536000,33.451000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.471000,-1.536000,27.355000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.249000,-1.536000,27.355000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<64.471000,-1.536000,27.355000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.503000,-1.536000,27.609000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.503000,-1.536000,27.990000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<66.503000,-1.536000,27.990000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.376000,-1.536000,28.117000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.503000,-1.536000,27.990000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<66.376000,-1.536000,28.117000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.217000,-1.536000,27.609000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.217000,-1.536000,27.990000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<64.217000,-1.536000,27.990000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.344000,-1.536000,28.117000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.217000,-1.536000,27.990000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<64.217000,-1.536000,27.990000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.376000,-1.536000,32.943000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.503000,-1.536000,33.070000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<66.376000,-1.536000,32.943000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.376000,-1.536000,32.943000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.376000,-1.536000,28.117000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<66.376000,-1.536000,28.117000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.344000,-1.536000,32.943000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.217000,-1.536000,33.070000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<64.217000,-1.536000,33.070000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.344000,-1.536000,32.943000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.344000,-1.536000,28.117000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<64.344000,-1.536000,28.117000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.503000,-1.536000,33.451000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.503000,-1.536000,33.070000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<66.503000,-1.536000,33.070000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.217000,-1.536000,33.451000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.217000,-1.536000,33.070000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<64.217000,-1.536000,33.070000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.471000,-1.536000,33.705000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.249000,-1.536000,33.705000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<64.471000,-1.536000,33.705000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<65.360000,-1.536000,33.959000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<65.360000,-1.536000,34.340000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<65.360000,-1.536000,34.340000> }
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-90.000000,0> translate<65.360000,-1.536000,27.228000>}
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-90.000000,0> translate<65.360000,-1.536000,33.832000>}
//R22 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<79.330000,-1.536000,31.800000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<79.330000,-1.536000,32.181000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<79.330000,-1.536000,32.181000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<80.219000,-1.536000,32.689000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<78.441000,-1.536000,32.689000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<78.441000,-1.536000,38.531000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<80.219000,-1.536000,38.531000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.441000,-1.536000,32.435000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.219000,-1.536000,32.435000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<78.441000,-1.536000,32.435000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.473000,-1.536000,32.689000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.473000,-1.536000,33.070000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<80.473000,-1.536000,33.070000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.346000,-1.536000,33.197000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.473000,-1.536000,33.070000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<80.346000,-1.536000,33.197000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.187000,-1.536000,32.689000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.187000,-1.536000,33.070000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<78.187000,-1.536000,33.070000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.314000,-1.536000,33.197000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.187000,-1.536000,33.070000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<78.187000,-1.536000,33.070000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.346000,-1.536000,38.023000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.473000,-1.536000,38.150000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<80.346000,-1.536000,38.023000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.346000,-1.536000,38.023000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.346000,-1.536000,33.197000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<80.346000,-1.536000,33.197000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.314000,-1.536000,38.023000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.187000,-1.536000,38.150000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<78.187000,-1.536000,38.150000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.314000,-1.536000,38.023000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.314000,-1.536000,33.197000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<78.314000,-1.536000,33.197000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.473000,-1.536000,38.531000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.473000,-1.536000,38.150000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<80.473000,-1.536000,38.150000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.187000,-1.536000,38.531000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.187000,-1.536000,38.150000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<78.187000,-1.536000,38.150000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.441000,-1.536000,38.785000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.219000,-1.536000,38.785000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<78.441000,-1.536000,38.785000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<79.330000,-1.536000,39.039000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<79.330000,-1.536000,39.420000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<79.330000,-1.536000,39.420000> }
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-90.000000,0> translate<79.330000,-1.536000,32.308000>}
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-90.000000,0> translate<79.330000,-1.536000,38.912000>}
//R23 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<76.790000,-1.536000,29.260000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<76.790000,-1.536000,29.641000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<76.790000,-1.536000,29.641000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<77.679000,-1.536000,30.149000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<75.901000,-1.536000,30.149000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<75.901000,-1.536000,35.991000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<77.679000,-1.536000,35.991000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.901000,-1.536000,29.895000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.679000,-1.536000,29.895000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<75.901000,-1.536000,29.895000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.933000,-1.536000,30.149000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.933000,-1.536000,30.530000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<77.933000,-1.536000,30.530000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.806000,-1.536000,30.657000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.933000,-1.536000,30.530000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<77.806000,-1.536000,30.657000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.647000,-1.536000,30.149000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.647000,-1.536000,30.530000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<75.647000,-1.536000,30.530000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.774000,-1.536000,30.657000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.647000,-1.536000,30.530000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<75.647000,-1.536000,30.530000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.806000,-1.536000,35.483000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.933000,-1.536000,35.610000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<77.806000,-1.536000,35.483000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.806000,-1.536000,35.483000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.806000,-1.536000,30.657000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<77.806000,-1.536000,30.657000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.774000,-1.536000,35.483000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.647000,-1.536000,35.610000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<75.647000,-1.536000,35.610000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.774000,-1.536000,35.483000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.774000,-1.536000,30.657000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<75.774000,-1.536000,30.657000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.933000,-1.536000,35.991000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.933000,-1.536000,35.610000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<77.933000,-1.536000,35.610000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.647000,-1.536000,35.991000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.647000,-1.536000,35.610000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<75.647000,-1.536000,35.610000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.901000,-1.536000,36.245000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.679000,-1.536000,36.245000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<75.901000,-1.536000,36.245000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<76.790000,-1.536000,36.499000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<76.790000,-1.536000,36.880000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<76.790000,-1.536000,36.880000> }
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-90.000000,0> translate<76.790000,-1.536000,29.768000>}
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-90.000000,0> translate<76.790000,-1.536000,36.372000>}
//R24 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<74.250000,-1.536000,26.720000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<74.250000,-1.536000,27.101000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<74.250000,-1.536000,27.101000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<75.139000,-1.536000,27.609000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<73.361000,-1.536000,27.609000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<73.361000,-1.536000,33.451000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<75.139000,-1.536000,33.451000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.361000,-1.536000,27.355000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.139000,-1.536000,27.355000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<73.361000,-1.536000,27.355000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.393000,-1.536000,27.609000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.393000,-1.536000,27.990000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<75.393000,-1.536000,27.990000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.266000,-1.536000,28.117000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.393000,-1.536000,27.990000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<75.266000,-1.536000,28.117000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.107000,-1.536000,27.609000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.107000,-1.536000,27.990000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<73.107000,-1.536000,27.990000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.234000,-1.536000,28.117000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.107000,-1.536000,27.990000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<73.107000,-1.536000,27.990000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.266000,-1.536000,32.943000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.393000,-1.536000,33.070000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<75.266000,-1.536000,32.943000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.266000,-1.536000,32.943000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.266000,-1.536000,28.117000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<75.266000,-1.536000,28.117000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.234000,-1.536000,32.943000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.107000,-1.536000,33.070000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<73.107000,-1.536000,33.070000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.234000,-1.536000,32.943000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.234000,-1.536000,28.117000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<73.234000,-1.536000,28.117000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.393000,-1.536000,33.451000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.393000,-1.536000,33.070000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<75.393000,-1.536000,33.070000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.107000,-1.536000,33.451000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.107000,-1.536000,33.070000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<73.107000,-1.536000,33.070000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.361000,-1.536000,33.705000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.139000,-1.536000,33.705000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<73.361000,-1.536000,33.705000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<74.250000,-1.536000,33.959000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<74.250000,-1.536000,34.340000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<74.250000,-1.536000,34.340000> }
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-90.000000,0> translate<74.250000,-1.536000,27.228000>}
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-90.000000,0> translate<74.250000,-1.536000,33.832000>}
//RGB silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.810000,-1.536000,33.705000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.810000,-1.536000,34.975000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<3.810000,-1.536000,34.975000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.810000,-1.536000,34.975000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.175000,-1.536000,35.610000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<3.175000,-1.536000,35.610000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.175000,-1.536000,35.610000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.905000,-1.536000,35.610000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<1.905000,-1.536000,35.610000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.905000,-1.536000,35.610000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.270000,-1.536000,34.975000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<1.270000,-1.536000,34.975000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.175000,-1.536000,35.610000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.810000,-1.536000,36.245000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<3.175000,-1.536000,35.610000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.810000,-1.536000,36.245000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.810000,-1.536000,37.515000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<3.810000,-1.536000,37.515000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.810000,-1.536000,37.515000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.175000,-1.536000,38.150000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<3.175000,-1.536000,38.150000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.175000,-1.536000,38.150000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.905000,-1.536000,38.150000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<1.905000,-1.536000,38.150000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.905000,-1.536000,38.150000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.270000,-1.536000,37.515000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<1.270000,-1.536000,37.515000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.270000,-1.536000,37.515000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.270000,-1.536000,36.245000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<1.270000,-1.536000,36.245000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.270000,-1.536000,36.245000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.905000,-1.536000,35.610000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<1.270000,-1.536000,36.245000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.175000,-1.536000,33.070000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.905000,-1.536000,33.070000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<1.905000,-1.536000,33.070000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.810000,-1.536000,33.705000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.175000,-1.536000,33.070000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<3.175000,-1.536000,33.070000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.905000,-1.536000,33.070000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.270000,-1.536000,33.705000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<1.270000,-1.536000,33.705000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.270000,-1.536000,34.975000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.270000,-1.536000,33.705000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<1.270000,-1.536000,33.705000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.175000,-1.536000,38.150000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.810000,-1.536000,38.785000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<3.175000,-1.536000,38.150000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.810000,-1.536000,38.785000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.810000,-1.536000,40.055000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<3.810000,-1.536000,40.055000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.810000,-1.536000,40.055000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.175000,-1.536000,40.690000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<3.175000,-1.536000,40.690000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.175000,-1.536000,40.690000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.905000,-1.536000,40.690000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<1.905000,-1.536000,40.690000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.905000,-1.536000,40.690000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.270000,-1.536000,40.055000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<1.270000,-1.536000,40.055000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.270000,-1.536000,40.055000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.270000,-1.536000,38.785000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<1.270000,-1.536000,38.785000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.270000,-1.536000,38.785000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.905000,-1.536000,38.150000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<1.270000,-1.536000,38.785000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<2.540000,-1.536000,36.880000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<2.540000,-1.536000,34.340000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<2.540000,-1.536000,39.420000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.432300,-1.536000,33.057300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.576275,-1.536000,33.057300>}
box{<0,0,-0.063500><1.143975,0.036000,0.063500> rotate<0,0.000000,0> translate<4.432300,-1.536000,33.057300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.576275,-1.536000,33.057300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.576275,-1.536000,33.629288>}
box{<0,0,-0.063500><0.571987,0.036000,0.063500> rotate<0,90.000000,0> translate<5.576275,-1.536000,33.629288> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.576275,-1.536000,33.629288>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.385613,-1.536000,33.819950>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<5.385613,-1.536000,33.819950> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.385613,-1.536000,33.819950>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.004288,-1.536000,33.819950>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,0.000000,0> translate<5.004288,-1.536000,33.819950> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.004288,-1.536000,33.819950>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.813625,-1.536000,33.629288>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<4.813625,-1.536000,33.629288> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.813625,-1.536000,33.629288>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.813625,-1.536000,33.057300>}
box{<0,0,-0.063500><0.571987,0.036000,0.063500> rotate<0,-90.000000,0> translate<4.813625,-1.536000,33.057300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.813625,-1.536000,33.438625>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.432300,-1.536000,33.819950>}
box{<0,0,-0.063500><0.539275,0.036000,0.063500> rotate<0,44.997030,0> translate<4.432300,-1.536000,33.819950> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.385613,-1.536000,34.989347>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.576275,-1.536000,34.798684>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<5.385613,-1.536000,34.989347> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.576275,-1.536000,34.798684>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.576275,-1.536000,34.417359>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,-90.000000,0> translate<5.576275,-1.536000,34.417359> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.576275,-1.536000,34.417359>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.385613,-1.536000,34.226697>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<5.385613,-1.536000,34.226697> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.385613,-1.536000,34.226697>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.622962,-1.536000,34.226697>}
box{<0,0,-0.063500><0.762650,0.036000,0.063500> rotate<0,0.000000,0> translate<4.622962,-1.536000,34.226697> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.622962,-1.536000,34.226697>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.432300,-1.536000,34.417359>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<4.432300,-1.536000,34.417359> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.432300,-1.536000,34.417359>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.432300,-1.536000,34.798684>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,90.000000,0> translate<4.432300,-1.536000,34.798684> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.432300,-1.536000,34.798684>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.622962,-1.536000,34.989347>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<4.432300,-1.536000,34.798684> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.622962,-1.536000,34.989347>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.004288,-1.536000,34.989347>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,0.000000,0> translate<4.622962,-1.536000,34.989347> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.004288,-1.536000,34.989347>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.004288,-1.536000,34.608022>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,-90.000000,0> translate<5.004288,-1.536000,34.608022> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.432300,-1.536000,35.396094>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.576275,-1.536000,35.396094>}
box{<0,0,-0.063500><1.143975,0.036000,0.063500> rotate<0,0.000000,0> translate<4.432300,-1.536000,35.396094> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.576275,-1.536000,35.396094>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.576275,-1.536000,35.968081>}
box{<0,0,-0.063500><0.571988,0.036000,0.063500> rotate<0,90.000000,0> translate<5.576275,-1.536000,35.968081> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.576275,-1.536000,35.968081>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.385613,-1.536000,36.158744>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<5.385613,-1.536000,36.158744> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.385613,-1.536000,36.158744>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.194950,-1.536000,36.158744>}
box{<0,0,-0.063500><0.190663,0.036000,0.063500> rotate<0,0.000000,0> translate<5.194950,-1.536000,36.158744> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.194950,-1.536000,36.158744>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.004288,-1.536000,35.968081>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<5.004288,-1.536000,35.968081> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.004288,-1.536000,35.968081>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.813625,-1.536000,36.158744>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<4.813625,-1.536000,36.158744> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.813625,-1.536000,36.158744>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.622962,-1.536000,36.158744>}
box{<0,0,-0.063500><0.190663,0.036000,0.063500> rotate<0,0.000000,0> translate<4.622962,-1.536000,36.158744> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.622962,-1.536000,36.158744>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.432300,-1.536000,35.968081>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<4.432300,-1.536000,35.968081> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.432300,-1.536000,35.968081>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.432300,-1.536000,35.396094>}
box{<0,0,-0.063500><0.571988,0.036000,0.063500> rotate<0,-90.000000,0> translate<4.432300,-1.536000,35.396094> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.004288,-1.536000,35.396094>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.004288,-1.536000,35.968081>}
box{<0,0,-0.063500><0.571988,0.036000,0.063500> rotate<0,90.000000,0> translate<5.004288,-1.536000,35.968081> }

texture{col_slk}
}
#end
translate<mac_x_ver,mac_y_ver,mac_z_ver>
rotate<mac_x_rot,mac_y_rot,mac_z_rot>
}//End union
#end

#if(use_file_as_inc=off)
object{  Z_R_G_B_LEDS(-44.770000,0,-20.925000,pcb_rotate_x,pcb_rotate_y,pcb_rotate_z)
#if(pcb_upsidedown=on)
rotate pcb_rotdir*180
#end
}
#end


//Parts not found in 3dpack.dat or 3dusrpac.dat are:
//U$1		3,2
//U$2		3,2
//U$3		3,2
