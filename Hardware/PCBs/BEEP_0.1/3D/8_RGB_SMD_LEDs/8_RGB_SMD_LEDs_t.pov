//POVRay-Datei erstellt mit 3d41.ulp v20110101
///home/flexxxv/eagle/BEEP_0.1/8_RGB_SMD_LEDs.brd
//29.04.13 01:28

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
#local cam_y = 271;
#local cam_z = -81;
#local cam_a = 20;
#local cam_look_x = 0;
#local cam_look_y = -3;
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

#local lgt1_pos_x = 32;
#local lgt1_pos_y = 48;
#local lgt1_pos_z = 18;
#local lgt1_intense = 0.743157;
#local lgt2_pos_x = -32;
#local lgt2_pos_y = 48;
#local lgt2_pos_z = 18;
#local lgt2_intense = 0.743157;
#local lgt3_pos_x = 32;
#local lgt3_pos_y = 48;
#local lgt3_pos_z = -12;
#local lgt3_intense = 0.743157;
#local lgt4_pos_x = -32;
#local lgt4_pos_y = 48;
#local lgt4_pos_z = -12;
#local lgt4_intense = 0.743157;

//Do not change these values
#declare pcb_height = 1.500000;
#declare pcb_cuheight = 0.035000;
#declare pcb_x_size = 84.740000;
#declare pcb_y_size = 35.650000;
#declare pcb_layer1_used = 1;
#declare pcb_layer16_used = 0;
#declare inc_testmode = off;
#declare global_seed=seed(162);
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
	//translate<-42.370000,0,-17.825000>
}
#end

background{col_bgr}
light_source{<lgt1_pos_x,lgt1_pos_y,lgt1_pos_z> White*lgt1_intense shadowless}
light_source{<lgt2_pos_x,lgt2_pos_y,lgt2_pos_z> White*lgt2_intense shadowless}
light_source{<lgt3_pos_x,lgt3_pos_y,lgt3_pos_z> White*lgt3_intense shadowless}
light_source{<lgt4_pos_x,lgt4_pos_y,lgt4_pos_z> White*lgt4_intense}
#end


#macro Z_RGB_SMD_LEDS(mac_x_ver,mac_y_ver,mac_z_ver,mac_x_rot,mac_y_rot,mac_z_rot)
union{
#if(pcb_board = on)
difference{
union{
//Platine
prism{-1.500000,0.000000,8
<0.000000,0.000000><84.740000,0.100000>
<84.740000,0.100000><84.740000,35.650000>
<84.740000,35.650000><0.000000,35.550000>
<0.000000,35.550000><0.000000,0.000000>
texture{col_brd}}
}//End union(PCB)
//Bohrungen(real)/Bauteile
cylinder{<4.100000,1,4.100000><4.100000,-5,4.100000>1.600000 texture{col_hls}}
cylinder{<80.600000,1,4.200000><80.600000,-5,4.200000>1.600000 texture{col_hls}}
cylinder{<80.600000,1,31.500000><80.600000,-5,31.500000>1.600000 texture{col_hls}}
//Bohrungen(real)/Platine
//Bohrungen(real)/Durchkontaktierungen
}//End difference(reale Bohrungen/Durchbrüche)
#end
#if(pcb_parts=on)//Bauteile
union{
#ifndef(pack_JP1) #declare global_pack_JP1=yes; object {CON_PH_1X8()translate<0,-0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,180> translate<41.890000,-1.500000,1.960000>}#end		//Stiftleiste 2,54mm Raster 8Pin 1Reihe (pinhead.lib) JP1  1X08
#ifndef(pack_R1) #declare global_pack_R1=yes; object {RES_DIS_0207_075MM(texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,180> translate<12.700000,-1.500000,29.210000>}#end		//Diskreter Widerstand 0,3W 7,5MM Raster R1  0207/7
#ifndef(pack_R2) #declare global_pack_R2=yes; object {RES_DIS_0207_075MM(texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,180> translate<10.160000,-1.500000,26.670000>}#end		//Diskreter Widerstand 0,3W 7,5MM Raster R2  0207/7
#ifndef(pack_R3) #declare global_pack_R3=yes; object {RES_DIS_0207_075MM(texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,180> translate<7.620000,-1.500000,24.130000>}#end		//Diskreter Widerstand 0,3W 7,5MM Raster R3  0207/7
#ifndef(pack_R4) #declare global_pack_R4=yes; object {RES_DIS_0207_075MM(texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,180> translate<21.590000,-1.500000,29.210000>}#end		//Diskreter Widerstand 0,3W 7,5MM Raster R4  0207/7
#ifndef(pack_R5) #declare global_pack_R5=yes; object {RES_DIS_0207_075MM(texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,180> translate<19.050000,-1.500000,26.670000>}#end		//Diskreter Widerstand 0,3W 7,5MM Raster R5  0207/7
#ifndef(pack_R6) #declare global_pack_R6=yes; object {RES_DIS_0207_075MM(texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,180> translate<16.510000,-1.500000,24.130000>}#end		//Diskreter Widerstand 0,3W 7,5MM Raster R6  0207/7
#ifndef(pack_R7) #declare global_pack_R7=yes; object {RES_DIS_0207_075MM(texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,180> translate<30.480000,-1.500000,29.210000>}#end		//Diskreter Widerstand 0,3W 7,5MM Raster R7  0207/7
#ifndef(pack_R8) #declare global_pack_R8=yes; object {RES_DIS_0207_075MM(texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,180> translate<27.940000,-1.500000,26.670000>}#end		//Diskreter Widerstand 0,3W 7,5MM Raster R8  0207/7
#ifndef(pack_R9) #declare global_pack_R9=yes; object {RES_DIS_0207_075MM(texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,180> translate<25.400000,-1.500000,24.130000>}#end		//Diskreter Widerstand 0,3W 7,5MM Raster R9  0207/7
#ifndef(pack_R10) #declare global_pack_R10=yes; object {RES_DIS_0207_075MM(texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,180> translate<39.370000,-1.500000,29.210000>}#end		//Diskreter Widerstand 0,3W 7,5MM Raster R10  0207/7
#ifndef(pack_R11) #declare global_pack_R11=yes; object {RES_DIS_0207_075MM(texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,180> translate<36.830000,-1.500000,26.670000>}#end		//Diskreter Widerstand 0,3W 7,5MM Raster R11  0207/7
#ifndef(pack_R12) #declare global_pack_R12=yes; object {RES_DIS_0207_075MM(texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,180> translate<34.290000,-1.500000,24.130000>}#end		//Diskreter Widerstand 0,3W 7,5MM Raster R12  0207/7
#ifndef(pack_R13) #declare global_pack_R13=yes; object {RES_DIS_0207_075MM(texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,180> translate<48.260000,-1.500000,29.210000>}#end		//Diskreter Widerstand 0,3W 7,5MM Raster R13  0207/7
#ifndef(pack_R14) #declare global_pack_R14=yes; object {RES_DIS_0207_075MM(texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,180> translate<45.720000,-1.500000,26.670000>}#end		//Diskreter Widerstand 0,3W 7,5MM Raster R14  0207/7
#ifndef(pack_R15) #declare global_pack_R15=yes; object {RES_DIS_0207_075MM(texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,180> translate<43.180000,-1.500000,24.130000>}#end		//Diskreter Widerstand 0,3W 7,5MM Raster R15  0207/7
#ifndef(pack_R16) #declare global_pack_R16=yes; object {RES_DIS_0207_075MM(texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,180> translate<57.150000,-1.500000,29.210000>}#end		//Diskreter Widerstand 0,3W 7,5MM Raster R16  0207/7
#ifndef(pack_R17) #declare global_pack_R17=yes; object {RES_DIS_0207_075MM(texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,180> translate<54.610000,-1.500000,26.670000>}#end		//Diskreter Widerstand 0,3W 7,5MM Raster R17  0207/7
#ifndef(pack_R18) #declare global_pack_R18=yes; object {RES_DIS_0207_075MM(texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,180> translate<52.070000,-1.500000,24.130000>}#end		//Diskreter Widerstand 0,3W 7,5MM Raster R18  0207/7
#ifndef(pack_R19) #declare global_pack_R19=yes; object {RES_DIS_0207_075MM(texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,180> translate<66.040000,-1.500000,29.210000>}#end		//Diskreter Widerstand 0,3W 7,5MM Raster R19  0207/7
#ifndef(pack_R20) #declare global_pack_R20=yes; object {RES_DIS_0207_075MM(texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,180> translate<63.500000,-1.500000,26.670000>}#end		//Diskreter Widerstand 0,3W 7,5MM Raster R20  0207/7
#ifndef(pack_R21) #declare global_pack_R21=yes; object {RES_DIS_0207_075MM(texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,180> translate<60.960000,-1.500000,24.130000>}#end		//Diskreter Widerstand 0,3W 7,5MM Raster R21  0207/7
#ifndef(pack_R22) #declare global_pack_R22=yes; object {RES_DIS_0207_075MM(texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,180> translate<74.930000,-1.500000,29.210000>}#end		//Diskreter Widerstand 0,3W 7,5MM Raster R22  0207/7
#ifndef(pack_R23) #declare global_pack_R23=yes; object {RES_DIS_0207_075MM(texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,180> translate<72.390000,-1.500000,26.670000>}#end		//Diskreter Widerstand 0,3W 7,5MM Raster R23  0207/7
#ifndef(pack_R24) #declare global_pack_R24=yes; object {RES_DIS_0207_075MM(texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,180> translate<69.850000,-1.500000,24.130000>}#end		//Diskreter Widerstand 0,3W 7,5MM Raster R24  0207/7
#ifndef(pack_RGB) #declare global_pack_RGB=yes; object {CON_PH_1X3()translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,180> translate<2.540000,-1.500000,30.480000>}#end		//Stiftleiste 2,54mm Raster 3Pin 1Reihe (pinhead.lib) RGB  1X03
}//End union
#end
#if(pcb_pads_smds=on)
//Lötaugen&SMD/Bauteile
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<50.780000,0,1.960000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<48.240000,0,1.960000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<45.700000,0,1.960000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<43.160000,0,1.960000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<40.620000,0,1.960000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<38.080000,0,1.960000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<35.540000,0,1.960000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<33.000000,0,1.960000> texture{col_thl}}
object{TOOLS_PCB_SMD(1.400000,3.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<8.360000,0.000000,16.670000>}
object{TOOLS_PCB_SMD(1.400000,3.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<8.360000,0.000000,11.270000>}
object{TOOLS_PCB_SMD(1.000000,3.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<10.160000,0.000000,16.670000>}
object{TOOLS_PCB_SMD(1.000000,3.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<10.160000,0.000000,11.270000>}
object{TOOLS_PCB_SMD(1.400000,3.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<11.960000,0.000000,16.670000>}
object{TOOLS_PCB_SMD(1.400000,3.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<11.960000,0.000000,11.270000>}
object{TOOLS_PCB_SMD(1.400000,3.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<17.250000,0.000000,16.670000>}
object{TOOLS_PCB_SMD(1.400000,3.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<17.250000,0.000000,11.270000>}
object{TOOLS_PCB_SMD(1.000000,3.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<19.050000,0.000000,16.670000>}
object{TOOLS_PCB_SMD(1.000000,3.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<19.050000,0.000000,11.270000>}
object{TOOLS_PCB_SMD(1.400000,3.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<20.850000,0.000000,16.670000>}
object{TOOLS_PCB_SMD(1.400000,3.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<20.850000,0.000000,11.270000>}
object{TOOLS_PCB_SMD(1.400000,3.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<26.140000,0.000000,16.670000>}
object{TOOLS_PCB_SMD(1.400000,3.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<26.140000,0.000000,11.270000>}
object{TOOLS_PCB_SMD(1.000000,3.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<27.940000,0.000000,16.670000>}
object{TOOLS_PCB_SMD(1.000000,3.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<27.940000,0.000000,11.270000>}
object{TOOLS_PCB_SMD(1.400000,3.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<29.740000,0.000000,16.670000>}
object{TOOLS_PCB_SMD(1.400000,3.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<29.740000,0.000000,11.270000>}
object{TOOLS_PCB_SMD(1.400000,3.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<35.030000,0.000000,16.670000>}
object{TOOLS_PCB_SMD(1.400000,3.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<35.030000,0.000000,11.270000>}
object{TOOLS_PCB_SMD(1.000000,3.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<36.830000,0.000000,16.670000>}
object{TOOLS_PCB_SMD(1.000000,3.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<36.830000,0.000000,11.270000>}
object{TOOLS_PCB_SMD(1.400000,3.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<38.630000,0.000000,16.670000>}
object{TOOLS_PCB_SMD(1.400000,3.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<38.630000,0.000000,11.270000>}
object{TOOLS_PCB_SMD(1.400000,3.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<43.920000,0.000000,16.670000>}
object{TOOLS_PCB_SMD(1.400000,3.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<43.920000,0.000000,11.270000>}
object{TOOLS_PCB_SMD(1.000000,3.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<45.720000,0.000000,16.670000>}
object{TOOLS_PCB_SMD(1.000000,3.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<45.720000,0.000000,11.270000>}
object{TOOLS_PCB_SMD(1.400000,3.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<47.520000,0.000000,16.670000>}
object{TOOLS_PCB_SMD(1.400000,3.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<47.520000,0.000000,11.270000>}
object{TOOLS_PCB_SMD(1.400000,3.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<52.810000,0.000000,16.670000>}
object{TOOLS_PCB_SMD(1.400000,3.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<52.810000,0.000000,11.270000>}
object{TOOLS_PCB_SMD(1.000000,3.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<54.610000,0.000000,16.670000>}
object{TOOLS_PCB_SMD(1.000000,3.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<54.610000,0.000000,11.270000>}
object{TOOLS_PCB_SMD(1.400000,3.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<56.410000,0.000000,16.670000>}
object{TOOLS_PCB_SMD(1.400000,3.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<56.410000,0.000000,11.270000>}
object{TOOLS_PCB_SMD(1.400000,3.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<61.700000,0.000000,16.670000>}
object{TOOLS_PCB_SMD(1.400000,3.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<61.700000,0.000000,11.270000>}
object{TOOLS_PCB_SMD(1.000000,3.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<63.500000,0.000000,16.670000>}
object{TOOLS_PCB_SMD(1.000000,3.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<63.500000,0.000000,11.270000>}
object{TOOLS_PCB_SMD(1.400000,3.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<65.300000,0.000000,16.670000>}
object{TOOLS_PCB_SMD(1.400000,3.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<65.300000,0.000000,11.270000>}
object{TOOLS_PCB_SMD(1.400000,3.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<70.590000,0.000000,16.670000>}
object{TOOLS_PCB_SMD(1.400000,3.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<70.590000,0.000000,11.270000>}
object{TOOLS_PCB_SMD(1.000000,3.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<72.390000,0.000000,16.670000>}
object{TOOLS_PCB_SMD(1.000000,3.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<72.390000,0.000000,11.270000>}
object{TOOLS_PCB_SMD(1.400000,3.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<74.190000,0.000000,16.670000>}
object{TOOLS_PCB_SMD(1.400000,3.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<74.190000,0.000000,11.270000>}
#ifndef(global_pack_R1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<12.700000,0,25.400000> texture{col_thl}}
#ifndef(global_pack_R1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<12.700000,0,33.020000> texture{col_thl}}
#ifndef(global_pack_R2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<10.160000,0,22.860000> texture{col_thl}}
#ifndef(global_pack_R2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<10.160000,0,30.480000> texture{col_thl}}
#ifndef(global_pack_R3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<7.620000,0,20.320000> texture{col_thl}}
#ifndef(global_pack_R3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<7.620000,0,27.940000> texture{col_thl}}
#ifndef(global_pack_R4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<21.590000,0,25.400000> texture{col_thl}}
#ifndef(global_pack_R4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<21.590000,0,33.020000> texture{col_thl}}
#ifndef(global_pack_R5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<19.050000,0,22.860000> texture{col_thl}}
#ifndef(global_pack_R5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<19.050000,0,30.480000> texture{col_thl}}
#ifndef(global_pack_R6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<16.510000,0,20.320000> texture{col_thl}}
#ifndef(global_pack_R6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<16.510000,0,27.940000> texture{col_thl}}
#ifndef(global_pack_R7) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<30.480000,0,25.400000> texture{col_thl}}
#ifndef(global_pack_R7) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<30.480000,0,33.020000> texture{col_thl}}
#ifndef(global_pack_R8) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<27.940000,0,22.860000> texture{col_thl}}
#ifndef(global_pack_R8) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<27.940000,0,30.480000> texture{col_thl}}
#ifndef(global_pack_R9) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<25.400000,0,20.320000> texture{col_thl}}
#ifndef(global_pack_R9) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<25.400000,0,27.940000> texture{col_thl}}
#ifndef(global_pack_R10) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<39.370000,0,25.400000> texture{col_thl}}
#ifndef(global_pack_R10) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<39.370000,0,33.020000> texture{col_thl}}
#ifndef(global_pack_R11) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<36.830000,0,22.860000> texture{col_thl}}
#ifndef(global_pack_R11) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<36.830000,0,30.480000> texture{col_thl}}
#ifndef(global_pack_R12) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<34.290000,0,20.320000> texture{col_thl}}
#ifndef(global_pack_R12) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<34.290000,0,27.940000> texture{col_thl}}
#ifndef(global_pack_R13) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<48.260000,0,25.400000> texture{col_thl}}
#ifndef(global_pack_R13) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<48.260000,0,33.020000> texture{col_thl}}
#ifndef(global_pack_R14) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<45.720000,0,22.860000> texture{col_thl}}
#ifndef(global_pack_R14) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<45.720000,0,30.480000> texture{col_thl}}
#ifndef(global_pack_R15) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<43.180000,0,20.320000> texture{col_thl}}
#ifndef(global_pack_R15) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<43.180000,0,27.940000> texture{col_thl}}
#ifndef(global_pack_R16) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<57.150000,0,25.400000> texture{col_thl}}
#ifndef(global_pack_R16) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<57.150000,0,33.020000> texture{col_thl}}
#ifndef(global_pack_R17) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<54.610000,0,22.860000> texture{col_thl}}
#ifndef(global_pack_R17) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<54.610000,0,30.480000> texture{col_thl}}
#ifndef(global_pack_R18) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<52.070000,0,20.320000> texture{col_thl}}
#ifndef(global_pack_R18) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<52.070000,0,27.940000> texture{col_thl}}
#ifndef(global_pack_R19) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<66.040000,0,25.400000> texture{col_thl}}
#ifndef(global_pack_R19) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<66.040000,0,33.020000> texture{col_thl}}
#ifndef(global_pack_R20) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<63.500000,0,22.860000> texture{col_thl}}
#ifndef(global_pack_R20) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<63.500000,0,30.480000> texture{col_thl}}
#ifndef(global_pack_R21) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<60.960000,0,20.320000> texture{col_thl}}
#ifndef(global_pack_R21) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<60.960000,0,27.940000> texture{col_thl}}
#ifndef(global_pack_R22) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<74.930000,0,25.400000> texture{col_thl}}
#ifndef(global_pack_R22) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<74.930000,0,33.020000> texture{col_thl}}
#ifndef(global_pack_R23) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<72.390000,0,22.860000> texture{col_thl}}
#ifndef(global_pack_R23) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<72.390000,0,30.480000> texture{col_thl}}
#ifndef(global_pack_R24) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<69.850000,0,20.320000> texture{col_thl}}
#ifndef(global_pack_R24) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<69.850000,0,27.940000> texture{col_thl}}
#ifndef(global_pack_RGB) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<2.540000,0,27.940000> texture{col_thl}}
#ifndef(global_pack_RGB) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<2.540000,0,30.480000> texture{col_thl}}
#ifndef(global_pack_RGB) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<2.540000,0,33.020000> texture{col_thl}}
//Lötaugen/Durchkontaktierungen
#end
#if(pcb_wires=on)
union{
//Signale
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<2.540000,0.000000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<7.620000,0.000000,27.940000>}
box{<0,0,-0.508000><5.080000,0.035000,0.508000> rotate<0,0.000000,0> translate<2.540000,0.000000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<7.620000,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<8.360000,0.000000,19.580000>}
box{<0,0,-0.508000><1.046518,0.035000,0.508000> rotate<0,44.997030,0> translate<7.620000,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<8.360000,0.000000,16.670000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<8.360000,0.000000,19.580000>}
box{<0,0,-0.508000><2.910000,0.035000,0.508000> rotate<0,90.000000,0> translate<8.360000,0.000000,19.580000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<8.360000,0.000000,11.270000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<10.160000,0.000000,11.270000>}
box{<0,0,-0.508000><1.800000,0.035000,0.508000> rotate<0,0.000000,0> translate<8.360000,0.000000,11.270000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<10.160000,0.000000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<10.160000,0.000000,11.270000>}
box{<0,0,-0.508000><1.110000,0.035000,0.508000> rotate<0,90.000000,0> translate<10.160000,0.000000,11.270000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<10.160000,0.000000,16.670000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<10.160000,0.000000,22.860000>}
box{<0,0,-0.508000><6.190000,0.035000,0.508000> rotate<0,90.000000,0> translate<10.160000,0.000000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<2.540000,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<10.160000,0.000000,30.480000>}
box{<0,0,-0.508000><7.620000,0.035000,0.508000> rotate<0,0.000000,0> translate<2.540000,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<10.160000,0.000000,11.270000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<11.960000,0.000000,11.270000>}
box{<0,0,-0.508000><1.800000,0.035000,0.508000> rotate<0,0.000000,0> translate<10.160000,0.000000,11.270000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<11.960000,0.000000,16.670000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<11.960000,0.000000,24.660000>}
box{<0,0,-0.508000><7.990000,0.035000,0.508000> rotate<0,90.000000,0> translate<11.960000,0.000000,24.660000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<11.960000,0.000000,24.660000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,0.000000,25.400000>}
box{<0,0,-0.508000><1.046518,0.035000,0.508000> rotate<0,-44.997030,0> translate<11.960000,0.000000,24.660000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<2.540000,0.000000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,0.000000,33.020000>}
box{<0,0,-0.508000><10.160000,0.035000,0.508000> rotate<0,0.000000,0> translate<2.540000,0.000000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<7.620000,0.000000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<16.510000,0.000000,27.940000>}
box{<0,0,-0.508000><8.890000,0.035000,0.508000> rotate<0,0.000000,0> translate<7.620000,0.000000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<16.510000,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<17.250000,0.000000,19.580000>}
box{<0,0,-0.508000><1.046518,0.035000,0.508000> rotate<0,44.997030,0> translate<16.510000,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<17.250000,0.000000,16.670000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<17.250000,0.000000,19.580000>}
box{<0,0,-0.508000><2.910000,0.035000,0.508000> rotate<0,90.000000,0> translate<17.250000,0.000000,19.580000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<10.160000,0.000000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<17.660000,0.000000,2.660000>}
box{<0,0,-0.508000><10.606602,0.035000,0.508000> rotate<0,44.997030,0> translate<10.160000,0.000000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<17.660000,0.000000,2.660000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<17.780000,0.000000,2.540000>}
box{<0,0,-0.508000><0.169706,0.035000,0.508000> rotate<0,44.997030,0> translate<17.660000,0.000000,2.660000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<17.780000,0.000000,2.540000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<18.360000,0.000000,1.960000>}
box{<0,0,-0.508000><0.820244,0.035000,0.508000> rotate<0,44.997030,0> translate<17.780000,0.000000,2.540000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<17.250000,0.000000,11.270000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<19.050000,0.000000,11.270000>}
box{<0,0,-0.508000><1.800000,0.035000,0.508000> rotate<0,0.000000,0> translate<17.250000,0.000000,11.270000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<19.050000,0.000000,8.890000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<19.050000,0.000000,11.270000>}
box{<0,0,-0.508000><2.380000,0.035000,0.508000> rotate<0,90.000000,0> translate<19.050000,0.000000,11.270000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<19.050000,0.000000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<19.050000,0.000000,16.670000>}
box{<0,0,-0.508000><6.190000,0.035000,0.508000> rotate<0,-90.000000,0> translate<19.050000,0.000000,16.670000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<10.160000,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<19.050000,0.000000,30.480000>}
box{<0,0,-0.508000><8.890000,0.035000,0.508000> rotate<0,0.000000,0> translate<10.160000,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<19.050000,0.000000,11.270000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<20.850000,0.000000,11.270000>}
box{<0,0,-0.508000><1.800000,0.035000,0.508000> rotate<0,0.000000,0> translate<19.050000,0.000000,11.270000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<20.850000,0.000000,16.670000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<20.850000,0.000000,24.660000>}
box{<0,0,-0.508000><7.990000,0.035000,0.508000> rotate<0,90.000000,0> translate<20.850000,0.000000,24.660000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<20.850000,0.000000,24.660000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<21.590000,0.000000,25.400000>}
box{<0,0,-0.508000><1.046518,0.035000,0.508000> rotate<0,-44.997030,0> translate<20.850000,0.000000,24.660000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.700000,0.000000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<21.590000,0.000000,33.020000>}
box{<0,0,-0.508000><8.890000,0.035000,0.508000> rotate<0,0.000000,0> translate<12.700000,0.000000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<19.050000,0.000000,8.890000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<22.860000,0.000000,5.080000>}
box{<0,0,-0.508000><5.388154,0.035000,0.508000> rotate<0,44.997030,0> translate<19.050000,0.000000,8.890000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<16.510000,0.000000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<25.400000,0.000000,27.940000>}
box{<0,0,-0.508000><8.890000,0.035000,0.508000> rotate<0,0.000000,0> translate<16.510000,0.000000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<25.400000,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<26.140000,0.000000,19.580000>}
box{<0,0,-0.508000><1.046518,0.035000,0.508000> rotate<0,44.997030,0> translate<25.400000,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<26.140000,0.000000,16.670000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<26.140000,0.000000,19.580000>}
box{<0,0,-0.508000><2.910000,0.035000,0.508000> rotate<0,90.000000,0> translate<26.140000,0.000000,19.580000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<26.140000,0.000000,11.270000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<27.940000,0.000000,11.270000>}
box{<0,0,-0.508000><1.800000,0.035000,0.508000> rotate<0,0.000000,0> translate<26.140000,0.000000,11.270000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<27.940000,0.000000,8.890000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<27.940000,0.000000,11.270000>}
box{<0,0,-0.508000><2.380000,0.035000,0.508000> rotate<0,90.000000,0> translate<27.940000,0.000000,11.270000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<27.940000,0.000000,16.670000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<27.940000,0.000000,22.860000>}
box{<0,0,-0.508000><6.190000,0.035000,0.508000> rotate<0,90.000000,0> translate<27.940000,0.000000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<19.050000,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<27.940000,0.000000,30.480000>}
box{<0,0,-0.508000><8.890000,0.035000,0.508000> rotate<0,0.000000,0> translate<19.050000,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<27.940000,0.000000,8.890000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<29.210000,0.000000,7.620000>}
box{<0,0,-0.508000><1.796051,0.035000,0.508000> rotate<0,44.997030,0> translate<27.940000,0.000000,8.890000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<27.940000,0.000000,11.270000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<29.740000,0.000000,11.270000>}
box{<0,0,-0.508000><1.800000,0.035000,0.508000> rotate<0,0.000000,0> translate<27.940000,0.000000,11.270000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<29.740000,0.000000,16.670000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<29.740000,0.000000,24.660000>}
box{<0,0,-0.508000><7.990000,0.035000,0.508000> rotate<0,90.000000,0> translate<29.740000,0.000000,24.660000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<29.740000,0.000000,24.660000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<30.480000,0.000000,25.400000>}
box{<0,0,-0.508000><1.046518,0.035000,0.508000> rotate<0,-44.997030,0> translate<29.740000,0.000000,24.660000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<21.590000,0.000000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<30.480000,0.000000,33.020000>}
box{<0,0,-0.508000><8.890000,0.035000,0.508000> rotate<0,0.000000,0> translate<21.590000,0.000000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<18.360000,0.000000,1.960000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<33.000000,0.000000,1.960000>}
box{<0,0,-0.508000><14.640000,0.035000,0.508000> rotate<0,0.000000,0> translate<18.360000,0.000000,1.960000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<22.860000,0.000000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<34.290000,0.000000,5.080000>}
box{<0,0,-0.508000><11.430000,0.035000,0.508000> rotate<0,0.000000,0> translate<22.860000,0.000000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<29.210000,0.000000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<34.290000,0.000000,7.620000>}
box{<0,0,-0.508000><5.080000,0.035000,0.508000> rotate<0,0.000000,0> translate<29.210000,0.000000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<25.400000,0.000000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<34.290000,0.000000,27.940000>}
box{<0,0,-0.508000><8.890000,0.035000,0.508000> rotate<0,0.000000,0> translate<25.400000,0.000000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<34.290000,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<35.030000,0.000000,19.580000>}
box{<0,0,-0.508000><1.046518,0.035000,0.508000> rotate<0,44.997030,0> translate<34.290000,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<35.030000,0.000000,16.670000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<35.030000,0.000000,19.580000>}
box{<0,0,-0.508000><2.910000,0.035000,0.508000> rotate<0,90.000000,0> translate<35.030000,0.000000,19.580000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<35.540000,0.000000,1.960000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<35.540000,0.000000,3.790000>}
box{<0,0,-0.508000><1.830000,0.035000,0.508000> rotate<0,90.000000,0> translate<35.540000,0.000000,3.790000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<34.290000,0.000000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<35.560000,0.000000,3.810000>}
box{<0,0,-0.508000><1.796051,0.035000,0.508000> rotate<0,44.997030,0> translate<34.290000,0.000000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<35.540000,0.000000,3.790000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<35.560000,0.000000,3.810000>}
box{<0,0,-0.508000><0.028284,0.035000,0.508000> rotate<0,-44.997030,0> translate<35.540000,0.000000,3.790000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<35.030000,0.000000,11.270000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<36.830000,0.000000,11.270000>}
box{<0,0,-0.508000><1.800000,0.035000,0.508000> rotate<0,0.000000,0> translate<35.030000,0.000000,11.270000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<36.830000,0.000000,8.890000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<36.830000,0.000000,11.270000>}
box{<0,0,-0.508000><2.380000,0.035000,0.508000> rotate<0,90.000000,0> translate<36.830000,0.000000,11.270000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<36.830000,0.000000,16.670000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<36.830000,0.000000,22.860000>}
box{<0,0,-0.508000><6.190000,0.035000,0.508000> rotate<0,90.000000,0> translate<36.830000,0.000000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<27.940000,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<36.830000,0.000000,30.480000>}
box{<0,0,-0.508000><8.890000,0.035000,0.508000> rotate<0,0.000000,0> translate<27.940000,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<38.080000,0.000000,1.960000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<38.080000,0.000000,3.790000>}
box{<0,0,-0.508000><1.830000,0.035000,0.508000> rotate<0,90.000000,0> translate<38.080000,0.000000,3.790000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<34.290000,0.000000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<38.100000,0.000000,3.810000>}
box{<0,0,-0.508000><5.388154,0.035000,0.508000> rotate<0,44.997030,0> translate<34.290000,0.000000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<38.080000,0.000000,3.790000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<38.100000,0.000000,3.810000>}
box{<0,0,-0.508000><0.028284,0.035000,0.508000> rotate<0,-44.997030,0> translate<38.080000,0.000000,3.790000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<36.830000,0.000000,11.270000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<38.630000,0.000000,11.270000>}
box{<0,0,-0.508000><1.800000,0.035000,0.508000> rotate<0,0.000000,0> translate<36.830000,0.000000,11.270000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<38.630000,0.000000,16.670000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<38.630000,0.000000,24.660000>}
box{<0,0,-0.508000><7.990000,0.035000,0.508000> rotate<0,90.000000,0> translate<38.630000,0.000000,24.660000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<38.630000,0.000000,24.660000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<39.370000,0.000000,25.400000>}
box{<0,0,-0.508000><1.046518,0.035000,0.508000> rotate<0,-44.997030,0> translate<38.630000,0.000000,24.660000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<30.480000,0.000000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<39.370000,0.000000,33.020000>}
box{<0,0,-0.508000><8.890000,0.035000,0.508000> rotate<0,0.000000,0> translate<30.480000,0.000000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<40.620000,0.000000,1.960000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<40.620000,0.000000,5.060000>}
box{<0,0,-0.508000><3.100000,0.035000,0.508000> rotate<0,90.000000,0> translate<40.620000,0.000000,5.060000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<36.830000,0.000000,8.890000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<40.640000,0.000000,5.080000>}
box{<0,0,-0.508000><5.388154,0.035000,0.508000> rotate<0,44.997030,0> translate<36.830000,0.000000,8.890000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<40.620000,0.000000,5.060000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<40.640000,0.000000,5.080000>}
box{<0,0,-0.508000><0.028284,0.035000,0.508000> rotate<0,-44.997030,0> translate<40.620000,0.000000,5.060000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<43.160000,0.000000,1.960000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<43.160000,0.000000,5.060000>}
box{<0,0,-0.508000><3.100000,0.035000,0.508000> rotate<0,90.000000,0> translate<43.160000,0.000000,5.060000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<34.290000,0.000000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<43.180000,0.000000,27.940000>}
box{<0,0,-0.508000><8.890000,0.035000,0.508000> rotate<0,0.000000,0> translate<34.290000,0.000000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<43.180000,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<43.920000,0.000000,19.580000>}
box{<0,0,-0.508000><1.046518,0.035000,0.508000> rotate<0,44.997030,0> translate<43.180000,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<43.920000,0.000000,16.670000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<43.920000,0.000000,19.580000>}
box{<0,0,-0.508000><2.910000,0.035000,0.508000> rotate<0,90.000000,0> translate<43.920000,0.000000,19.580000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<45.700000,0.000000,1.960000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<45.700000,0.000000,3.790000>}
box{<0,0,-0.508000><1.830000,0.035000,0.508000> rotate<0,90.000000,0> translate<45.700000,0.000000,3.790000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<43.160000,0.000000,5.060000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<45.720000,0.000000,7.620000>}
box{<0,0,-0.508000><3.620387,0.035000,0.508000> rotate<0,-44.997030,0> translate<43.160000,0.000000,5.060000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<43.920000,0.000000,11.270000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<45.720000,0.000000,11.270000>}
box{<0,0,-0.508000><1.800000,0.035000,0.508000> rotate<0,0.000000,0> translate<43.920000,0.000000,11.270000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<45.720000,0.000000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<45.720000,0.000000,11.270000>}
box{<0,0,-0.508000><3.650000,0.035000,0.508000> rotate<0,90.000000,0> translate<45.720000,0.000000,11.270000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<45.720000,0.000000,16.670000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<45.720000,0.000000,22.860000>}
box{<0,0,-0.508000><6.190000,0.035000,0.508000> rotate<0,90.000000,0> translate<45.720000,0.000000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<36.830000,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<45.720000,0.000000,30.480000>}
box{<0,0,-0.508000><8.890000,0.035000,0.508000> rotate<0,0.000000,0> translate<36.830000,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<45.720000,0.000000,11.270000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<47.520000,0.000000,11.270000>}
box{<0,0,-0.508000><1.800000,0.035000,0.508000> rotate<0,0.000000,0> translate<45.720000,0.000000,11.270000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<47.520000,0.000000,16.670000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<47.520000,0.000000,24.660000>}
box{<0,0,-0.508000><7.990000,0.035000,0.508000> rotate<0,90.000000,0> translate<47.520000,0.000000,24.660000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<48.240000,0.000000,1.960000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<48.240000,0.000000,3.790000>}
box{<0,0,-0.508000><1.830000,0.035000,0.508000> rotate<0,90.000000,0> translate<48.240000,0.000000,3.790000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<47.520000,0.000000,24.660000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<48.260000,0.000000,25.400000>}
box{<0,0,-0.508000><1.046518,0.035000,0.508000> rotate<0,-44.997030,0> translate<47.520000,0.000000,24.660000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<39.370000,0.000000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<48.260000,0.000000,33.020000>}
box{<0,0,-0.508000><8.890000,0.035000,0.508000> rotate<0,0.000000,0> translate<39.370000,0.000000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<48.240000,0.000000,3.790000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<49.530000,0.000000,5.080000>}
box{<0,0,-0.508000><1.824335,0.035000,0.508000> rotate<0,-44.997030,0> translate<48.240000,0.000000,3.790000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<45.700000,0.000000,3.790000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<49.530000,0.000000,7.620000>}
box{<0,0,-0.508000><5.416438,0.035000,0.508000> rotate<0,-44.997030,0> translate<45.700000,0.000000,3.790000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<43.180000,0.000000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<52.070000,0.000000,27.940000>}
box{<0,0,-0.508000><8.890000,0.035000,0.508000> rotate<0,0.000000,0> translate<43.180000,0.000000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<52.070000,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<52.810000,0.000000,19.580000>}
box{<0,0,-0.508000><1.046518,0.035000,0.508000> rotate<0,44.997030,0> translate<52.070000,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<52.810000,0.000000,16.670000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<52.810000,0.000000,19.580000>}
box{<0,0,-0.508000><2.910000,0.035000,0.508000> rotate<0,90.000000,0> translate<52.810000,0.000000,19.580000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<49.530000,0.000000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<53.340000,0.000000,7.620000>}
box{<0,0,-0.508000><3.810000,0.035000,0.508000> rotate<0,0.000000,0> translate<49.530000,0.000000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<53.340000,0.000000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<54.610000,0.000000,8.890000>}
box{<0,0,-0.508000><1.796051,0.035000,0.508000> rotate<0,-44.997030,0> translate<53.340000,0.000000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<52.810000,0.000000,11.270000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<54.610000,0.000000,11.270000>}
box{<0,0,-0.508000><1.800000,0.035000,0.508000> rotate<0,0.000000,0> translate<52.810000,0.000000,11.270000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<54.610000,0.000000,8.890000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<54.610000,0.000000,11.270000>}
box{<0,0,-0.508000><2.380000,0.035000,0.508000> rotate<0,90.000000,0> translate<54.610000,0.000000,11.270000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<54.610000,0.000000,16.670000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<54.610000,0.000000,22.860000>}
box{<0,0,-0.508000><6.190000,0.035000,0.508000> rotate<0,90.000000,0> translate<54.610000,0.000000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<45.720000,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<54.610000,0.000000,30.480000>}
box{<0,0,-0.508000><8.890000,0.035000,0.508000> rotate<0,0.000000,0> translate<45.720000,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<54.610000,0.000000,11.270000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<56.410000,0.000000,11.270000>}
box{<0,0,-0.508000><1.800000,0.035000,0.508000> rotate<0,0.000000,0> translate<54.610000,0.000000,11.270000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<56.410000,0.000000,16.670000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<56.410000,0.000000,24.660000>}
box{<0,0,-0.508000><7.990000,0.035000,0.508000> rotate<0,90.000000,0> translate<56.410000,0.000000,24.660000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<56.410000,0.000000,24.660000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<57.150000,0.000000,25.400000>}
box{<0,0,-0.508000><1.046518,0.035000,0.508000> rotate<0,-44.997030,0> translate<56.410000,0.000000,24.660000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<48.260000,0.000000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<57.150000,0.000000,33.020000>}
box{<0,0,-0.508000><8.890000,0.035000,0.508000> rotate<0,0.000000,0> translate<48.260000,0.000000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<49.530000,0.000000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<59.690000,0.000000,5.080000>}
box{<0,0,-0.508000><10.160000,0.035000,0.508000> rotate<0,0.000000,0> translate<49.530000,0.000000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<52.070000,0.000000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<60.960000,0.000000,27.940000>}
box{<0,0,-0.508000><8.890000,0.035000,0.508000> rotate<0,0.000000,0> translate<52.070000,0.000000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<60.960000,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<61.700000,0.000000,19.580000>}
box{<0,0,-0.508000><1.046518,0.035000,0.508000> rotate<0,44.997030,0> translate<60.960000,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<61.700000,0.000000,16.670000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<61.700000,0.000000,19.580000>}
box{<0,0,-0.508000><2.910000,0.035000,0.508000> rotate<0,90.000000,0> translate<61.700000,0.000000,19.580000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<59.690000,0.000000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<63.500000,0.000000,8.890000>}
box{<0,0,-0.508000><5.388154,0.035000,0.508000> rotate<0,-44.997030,0> translate<59.690000,0.000000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<61.700000,0.000000,11.270000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<63.500000,0.000000,11.270000>}
box{<0,0,-0.508000><1.800000,0.035000,0.508000> rotate<0,0.000000,0> translate<61.700000,0.000000,11.270000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<63.500000,0.000000,8.890000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<63.500000,0.000000,11.270000>}
box{<0,0,-0.508000><2.380000,0.035000,0.508000> rotate<0,90.000000,0> translate<63.500000,0.000000,11.270000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<63.500000,0.000000,16.670000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<63.500000,0.000000,22.860000>}
box{<0,0,-0.508000><6.190000,0.035000,0.508000> rotate<0,90.000000,0> translate<63.500000,0.000000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<54.610000,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<63.500000,0.000000,30.480000>}
box{<0,0,-0.508000><8.890000,0.035000,0.508000> rotate<0,0.000000,0> translate<54.610000,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<63.500000,0.000000,11.270000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<65.300000,0.000000,11.270000>}
box{<0,0,-0.508000><1.800000,0.035000,0.508000> rotate<0,0.000000,0> translate<63.500000,0.000000,11.270000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<65.300000,0.000000,16.670000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<65.300000,0.000000,24.660000>}
box{<0,0,-0.508000><7.990000,0.035000,0.508000> rotate<0,90.000000,0> translate<65.300000,0.000000,24.660000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<50.780000,0.000000,1.960000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<65.460000,0.000000,1.960000>}
box{<0,0,-0.508000><14.680000,0.035000,0.508000> rotate<0,0.000000,0> translate<50.780000,0.000000,1.960000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<65.300000,0.000000,24.660000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<66.040000,0.000000,25.400000>}
box{<0,0,-0.508000><1.046518,0.035000,0.508000> rotate<0,-44.997030,0> translate<65.300000,0.000000,24.660000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<57.150000,0.000000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<66.040000,0.000000,33.020000>}
box{<0,0,-0.508000><8.890000,0.035000,0.508000> rotate<0,0.000000,0> translate<57.150000,0.000000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<60.960000,0.000000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<69.850000,0.000000,27.940000>}
box{<0,0,-0.508000><8.890000,0.035000,0.508000> rotate<0,0.000000,0> translate<60.960000,0.000000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<69.850000,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<70.590000,0.000000,19.580000>}
box{<0,0,-0.508000><1.046518,0.035000,0.508000> rotate<0,44.997030,0> translate<69.850000,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<70.590000,0.000000,16.670000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<70.590000,0.000000,19.580000>}
box{<0,0,-0.508000><2.910000,0.035000,0.508000> rotate<0,90.000000,0> translate<70.590000,0.000000,19.580000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<65.460000,0.000000,1.960000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<72.390000,0.000000,8.890000>}
box{<0,0,-0.508000><9.800500,0.035000,0.508000> rotate<0,-44.997030,0> translate<65.460000,0.000000,1.960000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<70.590000,0.000000,11.270000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<72.390000,0.000000,11.270000>}
box{<0,0,-0.508000><1.800000,0.035000,0.508000> rotate<0,0.000000,0> translate<70.590000,0.000000,11.270000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<72.390000,0.000000,8.890000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<72.390000,0.000000,11.270000>}
box{<0,0,-0.508000><2.380000,0.035000,0.508000> rotate<0,90.000000,0> translate<72.390000,0.000000,11.270000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<72.390000,0.000000,16.670000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<72.390000,0.000000,22.860000>}
box{<0,0,-0.508000><6.190000,0.035000,0.508000> rotate<0,90.000000,0> translate<72.390000,0.000000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<63.500000,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<72.390000,0.000000,30.480000>}
box{<0,0,-0.508000><8.890000,0.035000,0.508000> rotate<0,0.000000,0> translate<63.500000,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<72.390000,0.000000,11.270000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<74.190000,0.000000,11.270000>}
box{<0,0,-0.508000><1.800000,0.035000,0.508000> rotate<0,0.000000,0> translate<72.390000,0.000000,11.270000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<74.190000,0.000000,16.670000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<74.190000,0.000000,24.660000>}
box{<0,0,-0.508000><7.990000,0.035000,0.508000> rotate<0,90.000000,0> translate<74.190000,0.000000,24.660000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<74.190000,0.000000,24.660000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<74.930000,0.000000,25.400000>}
box{<0,0,-0.508000><1.046518,0.035000,0.508000> rotate<0,-44.997030,0> translate<74.190000,0.000000,24.660000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<66.040000,0.000000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<74.930000,0.000000,33.020000>}
box{<0,0,-0.508000><8.890000,0.035000,0.508000> rotate<0,0.000000,0> translate<66.040000,0.000000,33.020000> }
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
cylinder{<50.780000,0.038000,1.960000><50.780000,-1.538000,1.960000>0.508000}
cylinder{<48.240000,0.038000,1.960000><48.240000,-1.538000,1.960000>0.508000}
cylinder{<45.700000,0.038000,1.960000><45.700000,-1.538000,1.960000>0.508000}
cylinder{<43.160000,0.038000,1.960000><43.160000,-1.538000,1.960000>0.508000}
cylinder{<40.620000,0.038000,1.960000><40.620000,-1.538000,1.960000>0.508000}
cylinder{<38.080000,0.038000,1.960000><38.080000,-1.538000,1.960000>0.508000}
cylinder{<35.540000,0.038000,1.960000><35.540000,-1.538000,1.960000>0.508000}
cylinder{<33.000000,0.038000,1.960000><33.000000,-1.538000,1.960000>0.508000}
cylinder{<12.700000,0.038000,25.400000><12.700000,-1.538000,25.400000>0.406400}
cylinder{<12.700000,0.038000,33.020000><12.700000,-1.538000,33.020000>0.406400}
cylinder{<10.160000,0.038000,22.860000><10.160000,-1.538000,22.860000>0.406400}
cylinder{<10.160000,0.038000,30.480000><10.160000,-1.538000,30.480000>0.406400}
cylinder{<7.620000,0.038000,20.320000><7.620000,-1.538000,20.320000>0.406400}
cylinder{<7.620000,0.038000,27.940000><7.620000,-1.538000,27.940000>0.406400}
cylinder{<21.590000,0.038000,25.400000><21.590000,-1.538000,25.400000>0.406400}
cylinder{<21.590000,0.038000,33.020000><21.590000,-1.538000,33.020000>0.406400}
cylinder{<19.050000,0.038000,22.860000><19.050000,-1.538000,22.860000>0.406400}
cylinder{<19.050000,0.038000,30.480000><19.050000,-1.538000,30.480000>0.406400}
cylinder{<16.510000,0.038000,20.320000><16.510000,-1.538000,20.320000>0.406400}
cylinder{<16.510000,0.038000,27.940000><16.510000,-1.538000,27.940000>0.406400}
cylinder{<30.480000,0.038000,25.400000><30.480000,-1.538000,25.400000>0.406400}
cylinder{<30.480000,0.038000,33.020000><30.480000,-1.538000,33.020000>0.406400}
cylinder{<27.940000,0.038000,22.860000><27.940000,-1.538000,22.860000>0.406400}
cylinder{<27.940000,0.038000,30.480000><27.940000,-1.538000,30.480000>0.406400}
cylinder{<25.400000,0.038000,20.320000><25.400000,-1.538000,20.320000>0.406400}
cylinder{<25.400000,0.038000,27.940000><25.400000,-1.538000,27.940000>0.406400}
cylinder{<39.370000,0.038000,25.400000><39.370000,-1.538000,25.400000>0.406400}
cylinder{<39.370000,0.038000,33.020000><39.370000,-1.538000,33.020000>0.406400}
cylinder{<36.830000,0.038000,22.860000><36.830000,-1.538000,22.860000>0.406400}
cylinder{<36.830000,0.038000,30.480000><36.830000,-1.538000,30.480000>0.406400}
cylinder{<34.290000,0.038000,20.320000><34.290000,-1.538000,20.320000>0.406400}
cylinder{<34.290000,0.038000,27.940000><34.290000,-1.538000,27.940000>0.406400}
cylinder{<48.260000,0.038000,25.400000><48.260000,-1.538000,25.400000>0.406400}
cylinder{<48.260000,0.038000,33.020000><48.260000,-1.538000,33.020000>0.406400}
cylinder{<45.720000,0.038000,22.860000><45.720000,-1.538000,22.860000>0.406400}
cylinder{<45.720000,0.038000,30.480000><45.720000,-1.538000,30.480000>0.406400}
cylinder{<43.180000,0.038000,20.320000><43.180000,-1.538000,20.320000>0.406400}
cylinder{<43.180000,0.038000,27.940000><43.180000,-1.538000,27.940000>0.406400}
cylinder{<57.150000,0.038000,25.400000><57.150000,-1.538000,25.400000>0.406400}
cylinder{<57.150000,0.038000,33.020000><57.150000,-1.538000,33.020000>0.406400}
cylinder{<54.610000,0.038000,22.860000><54.610000,-1.538000,22.860000>0.406400}
cylinder{<54.610000,0.038000,30.480000><54.610000,-1.538000,30.480000>0.406400}
cylinder{<52.070000,0.038000,20.320000><52.070000,-1.538000,20.320000>0.406400}
cylinder{<52.070000,0.038000,27.940000><52.070000,-1.538000,27.940000>0.406400}
cylinder{<66.040000,0.038000,25.400000><66.040000,-1.538000,25.400000>0.406400}
cylinder{<66.040000,0.038000,33.020000><66.040000,-1.538000,33.020000>0.406400}
cylinder{<63.500000,0.038000,22.860000><63.500000,-1.538000,22.860000>0.406400}
cylinder{<63.500000,0.038000,30.480000><63.500000,-1.538000,30.480000>0.406400}
cylinder{<60.960000,0.038000,20.320000><60.960000,-1.538000,20.320000>0.406400}
cylinder{<60.960000,0.038000,27.940000><60.960000,-1.538000,27.940000>0.406400}
cylinder{<74.930000,0.038000,25.400000><74.930000,-1.538000,25.400000>0.406400}
cylinder{<74.930000,0.038000,33.020000><74.930000,-1.538000,33.020000>0.406400}
cylinder{<72.390000,0.038000,22.860000><72.390000,-1.538000,22.860000>0.406400}
cylinder{<72.390000,0.038000,30.480000><72.390000,-1.538000,30.480000>0.406400}
cylinder{<69.850000,0.038000,20.320000><69.850000,-1.538000,20.320000>0.406400}
cylinder{<69.850000,0.038000,27.940000><69.850000,-1.538000,27.940000>0.406400}
cylinder{<2.540000,0.038000,27.940000><2.540000,-1.538000,27.940000>0.508000}
cylinder{<2.540000,0.038000,30.480000><2.540000,-1.538000,30.480000>0.508000}
cylinder{<2.540000,0.038000,33.020000><2.540000,-1.538000,33.020000>0.508000}
//Bohrungen(schnell)/Durchkontaktierungen
//Bohrungen(schnell)/Platine
texture{col_hls}
}
#if(pcb_silkscreen=on)
//Bestückungsdruck
union{
//JP1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.175000,-1.536000,3.230000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.905000,-1.536000,3.230000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<34.905000,-1.536000,3.230000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.905000,-1.536000,3.230000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.270000,-1.536000,2.595000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<34.270000,-1.536000,2.595000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.270000,-1.536000,2.595000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.270000,-1.536000,1.325000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<34.270000,-1.536000,1.325000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.270000,-1.536000,1.325000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.905000,-1.536000,0.690000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<34.270000,-1.536000,1.325000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.350000,-1.536000,2.595000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.715000,-1.536000,3.230000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<38.715000,-1.536000,3.230000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.715000,-1.536000,3.230000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.445000,-1.536000,3.230000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<37.445000,-1.536000,3.230000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.445000,-1.536000,3.230000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.810000,-1.536000,2.595000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<36.810000,-1.536000,2.595000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.810000,-1.536000,2.595000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.810000,-1.536000,1.325000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<36.810000,-1.536000,1.325000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.810000,-1.536000,1.325000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.445000,-1.536000,0.690000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<36.810000,-1.536000,1.325000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.445000,-1.536000,0.690000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.715000,-1.536000,0.690000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<37.445000,-1.536000,0.690000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.715000,-1.536000,0.690000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.350000,-1.536000,1.325000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<38.715000,-1.536000,0.690000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.175000,-1.536000,3.230000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.810000,-1.536000,2.595000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<36.175000,-1.536000,3.230000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.810000,-1.536000,1.325000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.175000,-1.536000,0.690000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<36.175000,-1.536000,0.690000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.905000,-1.536000,0.690000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.175000,-1.536000,0.690000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<34.905000,-1.536000,0.690000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.795000,-1.536000,3.230000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.525000,-1.536000,3.230000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<42.525000,-1.536000,3.230000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.525000,-1.536000,3.230000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.890000,-1.536000,2.595000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<41.890000,-1.536000,2.595000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.890000,-1.536000,2.595000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.890000,-1.536000,1.325000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<41.890000,-1.536000,1.325000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.890000,-1.536000,1.325000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.525000,-1.536000,0.690000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<41.890000,-1.536000,1.325000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.890000,-1.536000,2.595000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.255000,-1.536000,3.230000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<41.255000,-1.536000,3.230000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.255000,-1.536000,3.230000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.985000,-1.536000,3.230000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<39.985000,-1.536000,3.230000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.985000,-1.536000,3.230000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.350000,-1.536000,2.595000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<39.350000,-1.536000,2.595000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.350000,-1.536000,2.595000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.350000,-1.536000,1.325000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<39.350000,-1.536000,1.325000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.350000,-1.536000,1.325000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.985000,-1.536000,0.690000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<39.350000,-1.536000,1.325000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.985000,-1.536000,0.690000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.255000,-1.536000,0.690000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<39.985000,-1.536000,0.690000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.255000,-1.536000,0.690000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.890000,-1.536000,1.325000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<41.255000,-1.536000,0.690000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.970000,-1.536000,2.595000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.335000,-1.536000,3.230000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<46.335000,-1.536000,3.230000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.335000,-1.536000,3.230000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.065000,-1.536000,3.230000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<45.065000,-1.536000,3.230000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.065000,-1.536000,3.230000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.430000,-1.536000,2.595000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<44.430000,-1.536000,2.595000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.430000,-1.536000,2.595000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.430000,-1.536000,1.325000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<44.430000,-1.536000,1.325000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.430000,-1.536000,1.325000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.065000,-1.536000,0.690000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<44.430000,-1.536000,1.325000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.065000,-1.536000,0.690000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.335000,-1.536000,0.690000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<45.065000,-1.536000,0.690000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.335000,-1.536000,0.690000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.970000,-1.536000,1.325000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<46.335000,-1.536000,0.690000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.795000,-1.536000,3.230000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.430000,-1.536000,2.595000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<43.795000,-1.536000,3.230000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.430000,-1.536000,1.325000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.795000,-1.536000,0.690000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<43.795000,-1.536000,0.690000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.525000,-1.536000,0.690000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.795000,-1.536000,0.690000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<42.525000,-1.536000,0.690000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.415000,-1.536000,3.230000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.145000,-1.536000,3.230000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<50.145000,-1.536000,3.230000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.145000,-1.536000,3.230000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.510000,-1.536000,2.595000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<49.510000,-1.536000,2.595000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.510000,-1.536000,2.595000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.510000,-1.536000,1.325000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<49.510000,-1.536000,1.325000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.510000,-1.536000,1.325000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.145000,-1.536000,0.690000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<49.510000,-1.536000,1.325000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.510000,-1.536000,2.595000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.875000,-1.536000,3.230000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<48.875000,-1.536000,3.230000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.875000,-1.536000,3.230000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.605000,-1.536000,3.230000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<47.605000,-1.536000,3.230000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.605000,-1.536000,3.230000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.970000,-1.536000,2.595000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<46.970000,-1.536000,2.595000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.970000,-1.536000,2.595000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.970000,-1.536000,1.325000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<46.970000,-1.536000,1.325000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.970000,-1.536000,1.325000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.605000,-1.536000,0.690000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<46.970000,-1.536000,1.325000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.605000,-1.536000,0.690000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.875000,-1.536000,0.690000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<47.605000,-1.536000,0.690000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.875000,-1.536000,0.690000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.510000,-1.536000,1.325000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<48.875000,-1.536000,0.690000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.050000,-1.536000,2.595000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.050000,-1.536000,1.325000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<52.050000,-1.536000,1.325000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.415000,-1.536000,3.230000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.050000,-1.536000,2.595000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<51.415000,-1.536000,3.230000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.050000,-1.536000,1.325000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.415000,-1.536000,0.690000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<51.415000,-1.536000,0.690000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.145000,-1.536000,0.690000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.415000,-1.536000,0.690000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<50.145000,-1.536000,0.690000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.635000,-1.536000,3.230000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.365000,-1.536000,3.230000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<32.365000,-1.536000,3.230000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.365000,-1.536000,3.230000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.730000,-1.536000,2.595000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<31.730000,-1.536000,2.595000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.730000,-1.536000,2.595000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.730000,-1.536000,1.325000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<31.730000,-1.536000,1.325000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.730000,-1.536000,1.325000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.365000,-1.536000,0.690000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<31.730000,-1.536000,1.325000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.635000,-1.536000,3.230000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.270000,-1.536000,2.595000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<33.635000,-1.536000,3.230000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.270000,-1.536000,1.325000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.635000,-1.536000,0.690000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<33.635000,-1.536000,0.690000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.365000,-1.536000,0.690000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.635000,-1.536000,0.690000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<32.365000,-1.536000,0.690000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<35.540000,-1.536000,1.960000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<38.080000,-1.536000,1.960000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<40.620000,-1.536000,1.960000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<43.160000,-1.536000,1.960000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<45.700000,-1.536000,1.960000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<48.240000,-1.536000,1.960000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<50.780000,-1.536000,1.960000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<33.000000,-1.536000,1.960000>}
//LED1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.660000,0.000000,16.470000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.660000,0.000000,11.470000>}
box{<0,0,-0.063500><5.000000,0.036000,0.063500> rotate<0,-90.000000,0> translate<7.660000,0.000000,11.470000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.660000,0.000000,11.470000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.660000,0.000000,11.470000>}
box{<0,0,-0.063500><5.000000,0.036000,0.063500> rotate<0,0.000000,0> translate<7.660000,0.000000,11.470000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.660000,0.000000,11.470000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.660000,0.000000,16.470000>}
box{<0,0,-0.063500><5.000000,0.036000,0.063500> rotate<0,90.000000,0> translate<12.660000,0.000000,16.470000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.660000,0.000000,16.470000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.660000,0.000000,16.470000>}
box{<0,0,-0.063500><5.000000,0.036000,0.063500> rotate<0,0.000000,0> translate<7.660000,0.000000,16.470000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<5.909803,0.000000,12.743203>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.079200,0.000000,12.743203>}
box{<0,0,-0.050800><1.169397,0.036000,0.050800> rotate<0,0.000000,0> translate<5.909803,0.000000,12.743203> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.079200,0.000000,12.743203>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.079200,0.000000,13.522800>}
box{<0,0,-0.050800><0.779597,0.036000,0.050800> rotate<0,90.000000,0> translate<7.079200,0.000000,13.522800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<5.909803,0.000000,14.692197>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<5.909803,0.000000,13.912600>}
box{<0,0,-0.050800><0.779597,0.036000,0.050800> rotate<0,-90.000000,0> translate<5.909803,0.000000,13.912600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<5.909803,0.000000,13.912600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.079200,0.000000,13.912600>}
box{<0,0,-0.050800><1.169397,0.036000,0.050800> rotate<0,0.000000,0> translate<5.909803,0.000000,13.912600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.079200,0.000000,13.912600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.079200,0.000000,14.692197>}
box{<0,0,-0.050800><0.779597,0.036000,0.050800> rotate<0,90.000000,0> translate<7.079200,0.000000,14.692197> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.494503,0.000000,13.912600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.494503,0.000000,14.302397>}
box{<0,0,-0.050800><0.389797,0.036000,0.050800> rotate<0,90.000000,0> translate<6.494503,0.000000,14.302397> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<5.909803,0.000000,15.081997>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.079200,0.000000,15.081997>}
box{<0,0,-0.050800><1.169397,0.036000,0.050800> rotate<0,0.000000,0> translate<5.909803,0.000000,15.081997> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.079200,0.000000,15.081997>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.079200,0.000000,15.666694>}
box{<0,0,-0.050800><0.584697,0.036000,0.050800> rotate<0,90.000000,0> translate<7.079200,0.000000,15.666694> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.079200,0.000000,15.666694>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.884303,0.000000,15.861594>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,44.997489,0> translate<6.884303,0.000000,15.861594> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.884303,0.000000,15.861594>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.104703,0.000000,15.861594>}
box{<0,0,-0.050800><0.779600,0.036000,0.050800> rotate<0,0.000000,0> translate<6.104703,0.000000,15.861594> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.104703,0.000000,15.861594>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<5.909803,0.000000,15.666694>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<5.909803,0.000000,15.666694> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<5.909803,0.000000,15.666694>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<5.909803,0.000000,15.081997>}
box{<0,0,-0.050800><0.584697,0.036000,0.050800> rotate<0,-90.000000,0> translate<5.909803,0.000000,15.081997> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.299603,0.000000,16.251394>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<5.909803,0.000000,16.641191>}
box{<0,0,-0.050800><0.551258,0.036000,0.050800> rotate<0,44.996801,0> translate<5.909803,0.000000,16.641191> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<5.909803,0.000000,16.641191>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.079200,0.000000,16.641191>}
box{<0,0,-0.050800><1.169397,0.036000,0.050800> rotate<0,0.000000,0> translate<5.909803,0.000000,16.641191> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.079200,0.000000,16.251394>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.079200,0.000000,17.030991>}
box{<0,0,-0.050800><0.779597,0.036000,0.050800> rotate<0,90.000000,0> translate<7.079200,0.000000,17.030991> }
//LED2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.550000,0.000000,16.470000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.550000,0.000000,11.470000>}
box{<0,0,-0.063500><5.000000,0.036000,0.063500> rotate<0,-90.000000,0> translate<16.550000,0.000000,11.470000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.550000,0.000000,11.470000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.550000,0.000000,11.470000>}
box{<0,0,-0.063500><5.000000,0.036000,0.063500> rotate<0,0.000000,0> translate<16.550000,0.000000,11.470000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.550000,0.000000,11.470000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.550000,0.000000,16.470000>}
box{<0,0,-0.063500><5.000000,0.036000,0.063500> rotate<0,90.000000,0> translate<21.550000,0.000000,16.470000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.550000,0.000000,16.470000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.550000,0.000000,16.470000>}
box{<0,0,-0.063500><5.000000,0.036000,0.063500> rotate<0,0.000000,0> translate<16.550000,0.000000,16.470000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.799803,0.000000,12.743203>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.969200,0.000000,12.743203>}
box{<0,0,-0.050800><1.169397,0.036000,0.050800> rotate<0,0.000000,0> translate<14.799803,0.000000,12.743203> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.969200,0.000000,12.743203>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.969200,0.000000,13.522800>}
box{<0,0,-0.050800><0.779597,0.036000,0.050800> rotate<0,90.000000,0> translate<15.969200,0.000000,13.522800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.799803,0.000000,14.692197>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.799803,0.000000,13.912600>}
box{<0,0,-0.050800><0.779597,0.036000,0.050800> rotate<0,-90.000000,0> translate<14.799803,0.000000,13.912600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.799803,0.000000,13.912600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.969200,0.000000,13.912600>}
box{<0,0,-0.050800><1.169397,0.036000,0.050800> rotate<0,0.000000,0> translate<14.799803,0.000000,13.912600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.969200,0.000000,13.912600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.969200,0.000000,14.692197>}
box{<0,0,-0.050800><0.779597,0.036000,0.050800> rotate<0,90.000000,0> translate<15.969200,0.000000,14.692197> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.384503,0.000000,13.912600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.384503,0.000000,14.302397>}
box{<0,0,-0.050800><0.389797,0.036000,0.050800> rotate<0,90.000000,0> translate<15.384503,0.000000,14.302397> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.799803,0.000000,15.081997>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.969200,0.000000,15.081997>}
box{<0,0,-0.050800><1.169397,0.036000,0.050800> rotate<0,0.000000,0> translate<14.799803,0.000000,15.081997> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.969200,0.000000,15.081997>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.969200,0.000000,15.666694>}
box{<0,0,-0.050800><0.584697,0.036000,0.050800> rotate<0,90.000000,0> translate<15.969200,0.000000,15.666694> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.969200,0.000000,15.666694>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.774303,0.000000,15.861594>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,44.997489,0> translate<15.774303,0.000000,15.861594> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.774303,0.000000,15.861594>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.994703,0.000000,15.861594>}
box{<0,0,-0.050800><0.779600,0.036000,0.050800> rotate<0,0.000000,0> translate<14.994703,0.000000,15.861594> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.994703,0.000000,15.861594>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.799803,0.000000,15.666694>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<14.799803,0.000000,15.666694> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.799803,0.000000,15.666694>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.799803,0.000000,15.081997>}
box{<0,0,-0.050800><0.584697,0.036000,0.050800> rotate<0,-90.000000,0> translate<14.799803,0.000000,15.081997> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.969200,0.000000,17.030991>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.969200,0.000000,16.251394>}
box{<0,0,-0.050800><0.779597,0.036000,0.050800> rotate<0,-90.000000,0> translate<15.969200,0.000000,16.251394> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.969200,0.000000,16.251394>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.189603,0.000000,17.030991>}
box{<0,0,-0.050800><1.102516,0.036000,0.050800> rotate<0,44.997030,0> translate<15.189603,0.000000,17.030991> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.189603,0.000000,17.030991>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.994703,0.000000,17.030991>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,0.000000,0> translate<14.994703,0.000000,17.030991> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.994703,0.000000,17.030991>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.799803,0.000000,16.836091>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<14.799803,0.000000,16.836091> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.799803,0.000000,16.836091>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.799803,0.000000,16.446291>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,-90.000000,0> translate<14.799803,0.000000,16.446291> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.799803,0.000000,16.446291>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.994703,0.000000,16.251394>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,44.996571,0> translate<14.799803,0.000000,16.446291> }
//LED3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.440000,0.000000,16.470000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.440000,0.000000,11.470000>}
box{<0,0,-0.063500><5.000000,0.036000,0.063500> rotate<0,-90.000000,0> translate<25.440000,0.000000,11.470000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.440000,0.000000,11.470000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<30.440000,0.000000,11.470000>}
box{<0,0,-0.063500><5.000000,0.036000,0.063500> rotate<0,0.000000,0> translate<25.440000,0.000000,11.470000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<30.440000,0.000000,11.470000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<30.440000,0.000000,16.470000>}
box{<0,0,-0.063500><5.000000,0.036000,0.063500> rotate<0,90.000000,0> translate<30.440000,0.000000,16.470000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<30.440000,0.000000,16.470000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.440000,0.000000,16.470000>}
box{<0,0,-0.063500><5.000000,0.036000,0.063500> rotate<0,0.000000,0> translate<25.440000,0.000000,16.470000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.689803,0.000000,12.743203>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.859200,0.000000,12.743203>}
box{<0,0,-0.050800><1.169397,0.036000,0.050800> rotate<0,0.000000,0> translate<23.689803,0.000000,12.743203> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.859200,0.000000,12.743203>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.859200,0.000000,13.522800>}
box{<0,0,-0.050800><0.779597,0.036000,0.050800> rotate<0,90.000000,0> translate<24.859200,0.000000,13.522800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.689803,0.000000,14.692197>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.689803,0.000000,13.912600>}
box{<0,0,-0.050800><0.779597,0.036000,0.050800> rotate<0,-90.000000,0> translate<23.689803,0.000000,13.912600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.689803,0.000000,13.912600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.859200,0.000000,13.912600>}
box{<0,0,-0.050800><1.169397,0.036000,0.050800> rotate<0,0.000000,0> translate<23.689803,0.000000,13.912600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.859200,0.000000,13.912600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.859200,0.000000,14.692197>}
box{<0,0,-0.050800><0.779597,0.036000,0.050800> rotate<0,90.000000,0> translate<24.859200,0.000000,14.692197> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.274503,0.000000,13.912600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.274503,0.000000,14.302397>}
box{<0,0,-0.050800><0.389797,0.036000,0.050800> rotate<0,90.000000,0> translate<24.274503,0.000000,14.302397> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.689803,0.000000,15.081997>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.859200,0.000000,15.081997>}
box{<0,0,-0.050800><1.169397,0.036000,0.050800> rotate<0,0.000000,0> translate<23.689803,0.000000,15.081997> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.859200,0.000000,15.081997>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.859200,0.000000,15.666694>}
box{<0,0,-0.050800><0.584697,0.036000,0.050800> rotate<0,90.000000,0> translate<24.859200,0.000000,15.666694> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.859200,0.000000,15.666694>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.664303,0.000000,15.861594>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,44.997489,0> translate<24.664303,0.000000,15.861594> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.664303,0.000000,15.861594>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.884703,0.000000,15.861594>}
box{<0,0,-0.050800><0.779600,0.036000,0.050800> rotate<0,0.000000,0> translate<23.884703,0.000000,15.861594> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.884703,0.000000,15.861594>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.689803,0.000000,15.666694>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<23.689803,0.000000,15.666694> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.689803,0.000000,15.666694>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.689803,0.000000,15.081997>}
box{<0,0,-0.050800><0.584697,0.036000,0.050800> rotate<0,-90.000000,0> translate<23.689803,0.000000,15.081997> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.884703,0.000000,16.251394>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.689803,0.000000,16.446291>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,44.996571,0> translate<23.689803,0.000000,16.446291> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.689803,0.000000,16.446291>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.689803,0.000000,16.836091>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,90.000000,0> translate<23.689803,0.000000,16.836091> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.689803,0.000000,16.836091>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.884703,0.000000,17.030991>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<23.689803,0.000000,16.836091> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.884703,0.000000,17.030991>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.079603,0.000000,17.030991>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,0.000000,0> translate<23.884703,0.000000,17.030991> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.079603,0.000000,17.030991>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.274503,0.000000,16.836091>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,44.997030,0> translate<24.079603,0.000000,17.030991> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.274503,0.000000,16.836091>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.274503,0.000000,16.641191>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,-90.000000,0> translate<24.274503,0.000000,16.641191> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.274503,0.000000,16.836091>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.469403,0.000000,17.030991>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<24.274503,0.000000,16.836091> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.469403,0.000000,17.030991>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.664303,0.000000,17.030991>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,0.000000,0> translate<24.469403,0.000000,17.030991> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.664303,0.000000,17.030991>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.859200,0.000000,16.836091>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,44.997489,0> translate<24.664303,0.000000,17.030991> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.859200,0.000000,16.836091>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.859200,0.000000,16.446291>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,-90.000000,0> translate<24.859200,0.000000,16.446291> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.859200,0.000000,16.446291>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.664303,0.000000,16.251394>}
box{<0,0,-0.050800><0.275626,0.036000,0.050800> rotate<0,-44.997030,0> translate<24.664303,0.000000,16.251394> }
//LED4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<34.330000,0.000000,16.470000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<34.330000,0.000000,11.470000>}
box{<0,0,-0.063500><5.000000,0.036000,0.063500> rotate<0,-90.000000,0> translate<34.330000,0.000000,11.470000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<34.330000,0.000000,11.470000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<39.330000,0.000000,11.470000>}
box{<0,0,-0.063500><5.000000,0.036000,0.063500> rotate<0,0.000000,0> translate<34.330000,0.000000,11.470000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<39.330000,0.000000,11.470000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<39.330000,0.000000,16.470000>}
box{<0,0,-0.063500><5.000000,0.036000,0.063500> rotate<0,90.000000,0> translate<39.330000,0.000000,16.470000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<39.330000,0.000000,16.470000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<34.330000,0.000000,16.470000>}
box{<0,0,-0.063500><5.000000,0.036000,0.063500> rotate<0,0.000000,0> translate<34.330000,0.000000,16.470000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.579803,0.000000,12.743203>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.749200,0.000000,12.743203>}
box{<0,0,-0.050800><1.169397,0.036000,0.050800> rotate<0,0.000000,0> translate<32.579803,0.000000,12.743203> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.749200,0.000000,12.743203>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.749200,0.000000,13.522800>}
box{<0,0,-0.050800><0.779597,0.036000,0.050800> rotate<0,90.000000,0> translate<33.749200,0.000000,13.522800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.579803,0.000000,14.692197>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.579803,0.000000,13.912600>}
box{<0,0,-0.050800><0.779597,0.036000,0.050800> rotate<0,-90.000000,0> translate<32.579803,0.000000,13.912600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.579803,0.000000,13.912600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.749200,0.000000,13.912600>}
box{<0,0,-0.050800><1.169397,0.036000,0.050800> rotate<0,0.000000,0> translate<32.579803,0.000000,13.912600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.749200,0.000000,13.912600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.749200,0.000000,14.692197>}
box{<0,0,-0.050800><0.779597,0.036000,0.050800> rotate<0,90.000000,0> translate<33.749200,0.000000,14.692197> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.164503,0.000000,13.912600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.164503,0.000000,14.302397>}
box{<0,0,-0.050800><0.389797,0.036000,0.050800> rotate<0,90.000000,0> translate<33.164503,0.000000,14.302397> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.579803,0.000000,15.081997>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.749200,0.000000,15.081997>}
box{<0,0,-0.050800><1.169397,0.036000,0.050800> rotate<0,0.000000,0> translate<32.579803,0.000000,15.081997> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.749200,0.000000,15.081997>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.749200,0.000000,15.666694>}
box{<0,0,-0.050800><0.584697,0.036000,0.050800> rotate<0,90.000000,0> translate<33.749200,0.000000,15.666694> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.749200,0.000000,15.666694>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.554303,0.000000,15.861594>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,44.997489,0> translate<33.554303,0.000000,15.861594> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.554303,0.000000,15.861594>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.774703,0.000000,15.861594>}
box{<0,0,-0.050800><0.779600,0.036000,0.050800> rotate<0,0.000000,0> translate<32.774703,0.000000,15.861594> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.774703,0.000000,15.861594>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.579803,0.000000,15.666694>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<32.579803,0.000000,15.666694> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.579803,0.000000,15.666694>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.579803,0.000000,15.081997>}
box{<0,0,-0.050800><0.584697,0.036000,0.050800> rotate<0,-90.000000,0> translate<32.579803,0.000000,15.081997> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.749200,0.000000,16.836091>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.579803,0.000000,16.836091>}
box{<0,0,-0.050800><1.169397,0.036000,0.050800> rotate<0,0.000000,0> translate<32.579803,0.000000,16.836091> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.579803,0.000000,16.836091>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.164503,0.000000,16.251394>}
box{<0,0,-0.050800><0.826888,0.036000,0.050800> rotate<0,44.996877,0> translate<32.579803,0.000000,16.836091> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.164503,0.000000,16.251394>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.164503,0.000000,17.030991>}
box{<0,0,-0.050800><0.779597,0.036000,0.050800> rotate<0,90.000000,0> translate<33.164503,0.000000,17.030991> }
//LED5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<43.220000,0.000000,16.470000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<43.220000,0.000000,11.470000>}
box{<0,0,-0.063500><5.000000,0.036000,0.063500> rotate<0,-90.000000,0> translate<43.220000,0.000000,11.470000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<43.220000,0.000000,11.470000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.220000,0.000000,11.470000>}
box{<0,0,-0.063500><5.000000,0.036000,0.063500> rotate<0,0.000000,0> translate<43.220000,0.000000,11.470000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.220000,0.000000,11.470000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.220000,0.000000,16.470000>}
box{<0,0,-0.063500><5.000000,0.036000,0.063500> rotate<0,90.000000,0> translate<48.220000,0.000000,16.470000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.220000,0.000000,16.470000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<43.220000,0.000000,16.470000>}
box{<0,0,-0.063500><5.000000,0.036000,0.063500> rotate<0,0.000000,0> translate<43.220000,0.000000,16.470000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.469803,0.000000,12.743203>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<42.639200,0.000000,12.743203>}
box{<0,0,-0.050800><1.169397,0.036000,0.050800> rotate<0,0.000000,0> translate<41.469803,0.000000,12.743203> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<42.639200,0.000000,12.743203>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<42.639200,0.000000,13.522800>}
box{<0,0,-0.050800><0.779597,0.036000,0.050800> rotate<0,90.000000,0> translate<42.639200,0.000000,13.522800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.469803,0.000000,14.692197>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.469803,0.000000,13.912600>}
box{<0,0,-0.050800><0.779597,0.036000,0.050800> rotate<0,-90.000000,0> translate<41.469803,0.000000,13.912600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.469803,0.000000,13.912600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<42.639200,0.000000,13.912600>}
box{<0,0,-0.050800><1.169397,0.036000,0.050800> rotate<0,0.000000,0> translate<41.469803,0.000000,13.912600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<42.639200,0.000000,13.912600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<42.639200,0.000000,14.692197>}
box{<0,0,-0.050800><0.779597,0.036000,0.050800> rotate<0,90.000000,0> translate<42.639200,0.000000,14.692197> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<42.054503,0.000000,13.912600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<42.054503,0.000000,14.302397>}
box{<0,0,-0.050800><0.389797,0.036000,0.050800> rotate<0,90.000000,0> translate<42.054503,0.000000,14.302397> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.469803,0.000000,15.081997>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<42.639200,0.000000,15.081997>}
box{<0,0,-0.050800><1.169397,0.036000,0.050800> rotate<0,0.000000,0> translate<41.469803,0.000000,15.081997> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<42.639200,0.000000,15.081997>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<42.639200,0.000000,15.666694>}
box{<0,0,-0.050800><0.584697,0.036000,0.050800> rotate<0,90.000000,0> translate<42.639200,0.000000,15.666694> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<42.639200,0.000000,15.666694>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<42.444303,0.000000,15.861594>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,44.997489,0> translate<42.444303,0.000000,15.861594> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<42.444303,0.000000,15.861594>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.664703,0.000000,15.861594>}
box{<0,0,-0.050800><0.779600,0.036000,0.050800> rotate<0,0.000000,0> translate<41.664703,0.000000,15.861594> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.664703,0.000000,15.861594>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.469803,0.000000,15.666694>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<41.469803,0.000000,15.666694> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.469803,0.000000,15.666694>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.469803,0.000000,15.081997>}
box{<0,0,-0.050800><0.584697,0.036000,0.050800> rotate<0,-90.000000,0> translate<41.469803,0.000000,15.081997> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.469803,0.000000,17.030991>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.469803,0.000000,16.251394>}
box{<0,0,-0.050800><0.779597,0.036000,0.050800> rotate<0,-90.000000,0> translate<41.469803,0.000000,16.251394> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.469803,0.000000,16.251394>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<42.054503,0.000000,16.251394>}
box{<0,0,-0.050800><0.584700,0.036000,0.050800> rotate<0,0.000000,0> translate<41.469803,0.000000,16.251394> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<42.054503,0.000000,16.251394>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.859603,0.000000,16.641191>}
box{<0,0,-0.050800><0.435807,0.036000,0.050800> rotate<0,63.430579,0> translate<41.859603,0.000000,16.641191> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.859603,0.000000,16.641191>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.859603,0.000000,16.836091>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,90.000000,0> translate<41.859603,0.000000,16.836091> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.859603,0.000000,16.836091>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<42.054503,0.000000,17.030991>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<41.859603,0.000000,16.836091> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<42.054503,0.000000,17.030991>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<42.444303,0.000000,17.030991>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<42.054503,0.000000,17.030991> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<42.444303,0.000000,17.030991>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<42.639200,0.000000,16.836091>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,44.997489,0> translate<42.444303,0.000000,17.030991> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<42.639200,0.000000,16.836091>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<42.639200,0.000000,16.446291>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,-90.000000,0> translate<42.639200,0.000000,16.446291> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<42.639200,0.000000,16.446291>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<42.444303,0.000000,16.251394>}
box{<0,0,-0.050800><0.275626,0.036000,0.050800> rotate<0,-44.997030,0> translate<42.444303,0.000000,16.251394> }
//LED6 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.110000,0.000000,16.470000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.110000,0.000000,11.470000>}
box{<0,0,-0.063500><5.000000,0.036000,0.063500> rotate<0,-90.000000,0> translate<52.110000,0.000000,11.470000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.110000,0.000000,11.470000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<57.110000,0.000000,11.470000>}
box{<0,0,-0.063500><5.000000,0.036000,0.063500> rotate<0,0.000000,0> translate<52.110000,0.000000,11.470000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<57.110000,0.000000,11.470000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<57.110000,0.000000,16.470000>}
box{<0,0,-0.063500><5.000000,0.036000,0.063500> rotate<0,90.000000,0> translate<57.110000,0.000000,16.470000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<57.110000,0.000000,16.470000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.110000,0.000000,16.470000>}
box{<0,0,-0.063500><5.000000,0.036000,0.063500> rotate<0,0.000000,0> translate<52.110000,0.000000,16.470000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<50.359803,0.000000,12.743203>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<51.529200,0.000000,12.743203>}
box{<0,0,-0.050800><1.169397,0.036000,0.050800> rotate<0,0.000000,0> translate<50.359803,0.000000,12.743203> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<51.529200,0.000000,12.743203>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<51.529200,0.000000,13.522800>}
box{<0,0,-0.050800><0.779597,0.036000,0.050800> rotate<0,90.000000,0> translate<51.529200,0.000000,13.522800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<50.359803,0.000000,14.692197>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<50.359803,0.000000,13.912600>}
box{<0,0,-0.050800><0.779597,0.036000,0.050800> rotate<0,-90.000000,0> translate<50.359803,0.000000,13.912600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<50.359803,0.000000,13.912600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<51.529200,0.000000,13.912600>}
box{<0,0,-0.050800><1.169397,0.036000,0.050800> rotate<0,0.000000,0> translate<50.359803,0.000000,13.912600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<51.529200,0.000000,13.912600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<51.529200,0.000000,14.692197>}
box{<0,0,-0.050800><0.779597,0.036000,0.050800> rotate<0,90.000000,0> translate<51.529200,0.000000,14.692197> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<50.944503,0.000000,13.912600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<50.944503,0.000000,14.302397>}
box{<0,0,-0.050800><0.389797,0.036000,0.050800> rotate<0,90.000000,0> translate<50.944503,0.000000,14.302397> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<50.359803,0.000000,15.081997>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<51.529200,0.000000,15.081997>}
box{<0,0,-0.050800><1.169397,0.036000,0.050800> rotate<0,0.000000,0> translate<50.359803,0.000000,15.081997> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<51.529200,0.000000,15.081997>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<51.529200,0.000000,15.666694>}
box{<0,0,-0.050800><0.584697,0.036000,0.050800> rotate<0,90.000000,0> translate<51.529200,0.000000,15.666694> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<51.529200,0.000000,15.666694>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<51.334303,0.000000,15.861594>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,44.997489,0> translate<51.334303,0.000000,15.861594> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<51.334303,0.000000,15.861594>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<50.554703,0.000000,15.861594>}
box{<0,0,-0.050800><0.779600,0.036000,0.050800> rotate<0,0.000000,0> translate<50.554703,0.000000,15.861594> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<50.554703,0.000000,15.861594>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<50.359803,0.000000,15.666694>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<50.359803,0.000000,15.666694> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<50.359803,0.000000,15.666694>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<50.359803,0.000000,15.081997>}
box{<0,0,-0.050800><0.584697,0.036000,0.050800> rotate<0,-90.000000,0> translate<50.359803,0.000000,15.081997> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<50.359803,0.000000,17.030991>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<50.554703,0.000000,16.641191>}
box{<0,0,-0.050800><0.435810,0.036000,0.050800> rotate<0,63.430762,0> translate<50.359803,0.000000,17.030991> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<50.554703,0.000000,16.641191>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<50.944503,0.000000,16.251394>}
box{<0,0,-0.050800><0.551258,0.036000,0.050800> rotate<0,44.996801,0> translate<50.554703,0.000000,16.641191> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<50.944503,0.000000,16.251394>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<51.334303,0.000000,16.251394>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<50.944503,0.000000,16.251394> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<51.334303,0.000000,16.251394>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<51.529200,0.000000,16.446291>}
box{<0,0,-0.050800><0.275626,0.036000,0.050800> rotate<0,-44.997030,0> translate<51.334303,0.000000,16.251394> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<51.529200,0.000000,16.446291>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<51.529200,0.000000,16.836091>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,90.000000,0> translate<51.529200,0.000000,16.836091> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<51.529200,0.000000,16.836091>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<51.334303,0.000000,17.030991>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,44.997489,0> translate<51.334303,0.000000,17.030991> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<51.334303,0.000000,17.030991>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<51.139403,0.000000,17.030991>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,0.000000,0> translate<51.139403,0.000000,17.030991> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<51.139403,0.000000,17.030991>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<50.944503,0.000000,16.836091>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<50.944503,0.000000,16.836091> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<50.944503,0.000000,16.836091>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<50.944503,0.000000,16.251394>}
box{<0,0,-0.050800><0.584697,0.036000,0.050800> rotate<0,-90.000000,0> translate<50.944503,0.000000,16.251394> }
//LED7 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<61.000000,0.000000,16.470000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<61.000000,0.000000,11.470000>}
box{<0,0,-0.063500><5.000000,0.036000,0.063500> rotate<0,-90.000000,0> translate<61.000000,0.000000,11.470000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<61.000000,0.000000,11.470000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<66.000000,0.000000,11.470000>}
box{<0,0,-0.063500><5.000000,0.036000,0.063500> rotate<0,0.000000,0> translate<61.000000,0.000000,11.470000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<66.000000,0.000000,11.470000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<66.000000,0.000000,16.470000>}
box{<0,0,-0.063500><5.000000,0.036000,0.063500> rotate<0,90.000000,0> translate<66.000000,0.000000,16.470000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<66.000000,0.000000,16.470000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<61.000000,0.000000,16.470000>}
box{<0,0,-0.063500><5.000000,0.036000,0.063500> rotate<0,0.000000,0> translate<61.000000,0.000000,16.470000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<59.249803,0.000000,12.743203>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<60.419200,0.000000,12.743203>}
box{<0,0,-0.050800><1.169397,0.036000,0.050800> rotate<0,0.000000,0> translate<59.249803,0.000000,12.743203> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<60.419200,0.000000,12.743203>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<60.419200,0.000000,13.522800>}
box{<0,0,-0.050800><0.779597,0.036000,0.050800> rotate<0,90.000000,0> translate<60.419200,0.000000,13.522800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<59.249803,0.000000,14.692197>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<59.249803,0.000000,13.912600>}
box{<0,0,-0.050800><0.779597,0.036000,0.050800> rotate<0,-90.000000,0> translate<59.249803,0.000000,13.912600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<59.249803,0.000000,13.912600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<60.419200,0.000000,13.912600>}
box{<0,0,-0.050800><1.169397,0.036000,0.050800> rotate<0,0.000000,0> translate<59.249803,0.000000,13.912600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<60.419200,0.000000,13.912600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<60.419200,0.000000,14.692197>}
box{<0,0,-0.050800><0.779597,0.036000,0.050800> rotate<0,90.000000,0> translate<60.419200,0.000000,14.692197> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<59.834503,0.000000,13.912600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<59.834503,0.000000,14.302397>}
box{<0,0,-0.050800><0.389797,0.036000,0.050800> rotate<0,90.000000,0> translate<59.834503,0.000000,14.302397> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<59.249803,0.000000,15.081997>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<60.419200,0.000000,15.081997>}
box{<0,0,-0.050800><1.169397,0.036000,0.050800> rotate<0,0.000000,0> translate<59.249803,0.000000,15.081997> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<60.419200,0.000000,15.081997>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<60.419200,0.000000,15.666694>}
box{<0,0,-0.050800><0.584697,0.036000,0.050800> rotate<0,90.000000,0> translate<60.419200,0.000000,15.666694> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<60.419200,0.000000,15.666694>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<60.224303,0.000000,15.861594>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,44.997489,0> translate<60.224303,0.000000,15.861594> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<60.224303,0.000000,15.861594>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<59.444703,0.000000,15.861594>}
box{<0,0,-0.050800><0.779600,0.036000,0.050800> rotate<0,0.000000,0> translate<59.444703,0.000000,15.861594> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<59.444703,0.000000,15.861594>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<59.249803,0.000000,15.666694>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<59.249803,0.000000,15.666694> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<59.249803,0.000000,15.666694>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<59.249803,0.000000,15.081997>}
box{<0,0,-0.050800><0.584697,0.036000,0.050800> rotate<0,-90.000000,0> translate<59.249803,0.000000,15.081997> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<59.249803,0.000000,16.251394>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<59.249803,0.000000,17.030991>}
box{<0,0,-0.050800><0.779597,0.036000,0.050800> rotate<0,90.000000,0> translate<59.249803,0.000000,17.030991> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<59.249803,0.000000,17.030991>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<59.444703,0.000000,17.030991>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,0.000000,0> translate<59.249803,0.000000,17.030991> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<59.444703,0.000000,17.030991>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<60.224303,0.000000,16.251394>}
box{<0,0,-0.050800><1.102519,0.036000,0.050800> rotate<0,44.996915,0> translate<59.444703,0.000000,17.030991> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<60.224303,0.000000,16.251394>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<60.419200,0.000000,16.251394>}
box{<0,0,-0.050800><0.194897,0.036000,0.050800> rotate<0,0.000000,0> translate<60.224303,0.000000,16.251394> }
//LED8 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<69.890000,0.000000,16.470000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<69.890000,0.000000,11.470000>}
box{<0,0,-0.063500><5.000000,0.036000,0.063500> rotate<0,-90.000000,0> translate<69.890000,0.000000,11.470000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<69.890000,0.000000,11.470000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<74.890000,0.000000,11.470000>}
box{<0,0,-0.063500><5.000000,0.036000,0.063500> rotate<0,0.000000,0> translate<69.890000,0.000000,11.470000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<74.890000,0.000000,11.470000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<74.890000,0.000000,16.470000>}
box{<0,0,-0.063500><5.000000,0.036000,0.063500> rotate<0,90.000000,0> translate<74.890000,0.000000,16.470000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<74.890000,0.000000,16.470000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<69.890000,0.000000,16.470000>}
box{<0,0,-0.063500><5.000000,0.036000,0.063500> rotate<0,0.000000,0> translate<69.890000,0.000000,16.470000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<68.139803,0.000000,12.743203>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<69.309200,0.000000,12.743203>}
box{<0,0,-0.050800><1.169397,0.036000,0.050800> rotate<0,0.000000,0> translate<68.139803,0.000000,12.743203> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<69.309200,0.000000,12.743203>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<69.309200,0.000000,13.522800>}
box{<0,0,-0.050800><0.779597,0.036000,0.050800> rotate<0,90.000000,0> translate<69.309200,0.000000,13.522800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<68.139803,0.000000,14.692197>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<68.139803,0.000000,13.912600>}
box{<0,0,-0.050800><0.779597,0.036000,0.050800> rotate<0,-90.000000,0> translate<68.139803,0.000000,13.912600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<68.139803,0.000000,13.912600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<69.309200,0.000000,13.912600>}
box{<0,0,-0.050800><1.169397,0.036000,0.050800> rotate<0,0.000000,0> translate<68.139803,0.000000,13.912600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<69.309200,0.000000,13.912600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<69.309200,0.000000,14.692197>}
box{<0,0,-0.050800><0.779597,0.036000,0.050800> rotate<0,90.000000,0> translate<69.309200,0.000000,14.692197> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<68.724503,0.000000,13.912600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<68.724503,0.000000,14.302397>}
box{<0,0,-0.050800><0.389797,0.036000,0.050800> rotate<0,90.000000,0> translate<68.724503,0.000000,14.302397> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<68.139803,0.000000,15.081997>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<69.309200,0.000000,15.081997>}
box{<0,0,-0.050800><1.169397,0.036000,0.050800> rotate<0,0.000000,0> translate<68.139803,0.000000,15.081997> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<69.309200,0.000000,15.081997>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<69.309200,0.000000,15.666694>}
box{<0,0,-0.050800><0.584697,0.036000,0.050800> rotate<0,90.000000,0> translate<69.309200,0.000000,15.666694> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<69.309200,0.000000,15.666694>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<69.114303,0.000000,15.861594>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,44.997489,0> translate<69.114303,0.000000,15.861594> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<69.114303,0.000000,15.861594>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<68.334703,0.000000,15.861594>}
box{<0,0,-0.050800><0.779600,0.036000,0.050800> rotate<0,0.000000,0> translate<68.334703,0.000000,15.861594> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<68.334703,0.000000,15.861594>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<68.139803,0.000000,15.666694>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<68.139803,0.000000,15.666694> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<68.139803,0.000000,15.666694>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<68.139803,0.000000,15.081997>}
box{<0,0,-0.050800><0.584697,0.036000,0.050800> rotate<0,-90.000000,0> translate<68.139803,0.000000,15.081997> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<68.334703,0.000000,16.251394>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<68.139803,0.000000,16.446291>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,44.996571,0> translate<68.139803,0.000000,16.446291> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<68.139803,0.000000,16.446291>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<68.139803,0.000000,16.836091>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,90.000000,0> translate<68.139803,0.000000,16.836091> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<68.139803,0.000000,16.836091>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<68.334703,0.000000,17.030991>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<68.139803,0.000000,16.836091> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<68.334703,0.000000,17.030991>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<68.529603,0.000000,17.030991>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,0.000000,0> translate<68.334703,0.000000,17.030991> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<68.529603,0.000000,17.030991>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<68.724503,0.000000,16.836091>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,44.997030,0> translate<68.529603,0.000000,17.030991> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<68.724503,0.000000,16.836091>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<68.919403,0.000000,17.030991>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<68.724503,0.000000,16.836091> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<68.919403,0.000000,17.030991>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<69.114303,0.000000,17.030991>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,0.000000,0> translate<68.919403,0.000000,17.030991> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<69.114303,0.000000,17.030991>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<69.309200,0.000000,16.836091>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,44.997489,0> translate<69.114303,0.000000,17.030991> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<69.309200,0.000000,16.836091>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<69.309200,0.000000,16.446291>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,-90.000000,0> translate<69.309200,0.000000,16.446291> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<69.309200,0.000000,16.446291>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<69.114303,0.000000,16.251394>}
box{<0,0,-0.050800><0.275626,0.036000,0.050800> rotate<0,-44.997030,0> translate<69.114303,0.000000,16.251394> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<69.114303,0.000000,16.251394>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<68.919403,0.000000,16.251394>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,0.000000,0> translate<68.919403,0.000000,16.251394> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<68.919403,0.000000,16.251394>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<68.724503,0.000000,16.446291>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,44.996571,0> translate<68.724503,0.000000,16.446291> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<68.724503,0.000000,16.446291>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<68.529603,0.000000,16.251394>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,-44.996571,0> translate<68.529603,0.000000,16.251394> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<68.529603,0.000000,16.251394>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<68.334703,0.000000,16.251394>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,0.000000,0> translate<68.334703,0.000000,16.251394> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<68.724503,0.000000,16.446291>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<68.724503,0.000000,16.836091>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,90.000000,0> translate<68.724503,0.000000,16.836091> }
//R1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<12.700000,-1.536000,25.400000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<12.700000,-1.536000,25.781000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<12.700000,-1.536000,25.781000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<13.589000,-1.536000,26.289000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<11.811000,-1.536000,26.289000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<11.811000,-1.536000,32.131000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<13.589000,-1.536000,32.131000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.811000,-1.536000,26.035000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.589000,-1.536000,26.035000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<11.811000,-1.536000,26.035000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.843000,-1.536000,26.289000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.843000,-1.536000,26.670000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<13.843000,-1.536000,26.670000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.716000,-1.536000,26.797000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.843000,-1.536000,26.670000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<13.716000,-1.536000,26.797000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.557000,-1.536000,26.289000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.557000,-1.536000,26.670000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<11.557000,-1.536000,26.670000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.684000,-1.536000,26.797000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.557000,-1.536000,26.670000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<11.557000,-1.536000,26.670000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.716000,-1.536000,31.623000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.843000,-1.536000,31.750000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<13.716000,-1.536000,31.623000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.716000,-1.536000,31.623000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.716000,-1.536000,26.797000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<13.716000,-1.536000,26.797000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.684000,-1.536000,31.623000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.557000,-1.536000,31.750000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<11.557000,-1.536000,31.750000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.684000,-1.536000,31.623000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.684000,-1.536000,26.797000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<11.684000,-1.536000,26.797000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.843000,-1.536000,32.131000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.843000,-1.536000,31.750000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<13.843000,-1.536000,31.750000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.557000,-1.536000,32.131000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.557000,-1.536000,31.750000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<11.557000,-1.536000,31.750000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.811000,-1.536000,32.385000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.589000,-1.536000,32.385000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<11.811000,-1.536000,32.385000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<12.700000,-1.536000,32.639000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<12.700000,-1.536000,33.020000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<12.700000,-1.536000,33.020000> }
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-90.000000,0> translate<12.700000,-1.536000,25.908000>}
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-90.000000,0> translate<12.700000,-1.536000,32.512000>}
//R2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<10.160000,-1.536000,22.860000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<10.160000,-1.536000,23.241000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<10.160000,-1.536000,23.241000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<11.049000,-1.536000,23.749000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<9.271000,-1.536000,23.749000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<9.271000,-1.536000,29.591000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<11.049000,-1.536000,29.591000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.271000,-1.536000,23.495000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.049000,-1.536000,23.495000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<9.271000,-1.536000,23.495000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.303000,-1.536000,23.749000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.303000,-1.536000,24.130000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<11.303000,-1.536000,24.130000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.176000,-1.536000,24.257000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.303000,-1.536000,24.130000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<11.176000,-1.536000,24.257000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.017000,-1.536000,23.749000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.017000,-1.536000,24.130000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<9.017000,-1.536000,24.130000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.144000,-1.536000,24.257000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.017000,-1.536000,24.130000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<9.017000,-1.536000,24.130000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.176000,-1.536000,29.083000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.303000,-1.536000,29.210000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<11.176000,-1.536000,29.083000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.176000,-1.536000,29.083000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.176000,-1.536000,24.257000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<11.176000,-1.536000,24.257000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.144000,-1.536000,29.083000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.017000,-1.536000,29.210000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<9.017000,-1.536000,29.210000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.144000,-1.536000,29.083000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.144000,-1.536000,24.257000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<9.144000,-1.536000,24.257000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.303000,-1.536000,29.591000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.303000,-1.536000,29.210000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<11.303000,-1.536000,29.210000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.017000,-1.536000,29.591000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.017000,-1.536000,29.210000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<9.017000,-1.536000,29.210000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.271000,-1.536000,29.845000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.049000,-1.536000,29.845000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<9.271000,-1.536000,29.845000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<10.160000,-1.536000,30.099000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<10.160000,-1.536000,30.480000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<10.160000,-1.536000,30.480000> }
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-90.000000,0> translate<10.160000,-1.536000,23.368000>}
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-90.000000,0> translate<10.160000,-1.536000,29.972000>}
//R3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<7.620000,-1.536000,20.320000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<7.620000,-1.536000,20.701000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<7.620000,-1.536000,20.701000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<8.509000,-1.536000,21.209000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<6.731000,-1.536000,21.209000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<6.731000,-1.536000,27.051000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<8.509000,-1.536000,27.051000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.731000,-1.536000,20.955000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.509000,-1.536000,20.955000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<6.731000,-1.536000,20.955000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.763000,-1.536000,21.209000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.763000,-1.536000,21.590000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<8.763000,-1.536000,21.590000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.636000,-1.536000,21.717000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.763000,-1.536000,21.590000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<8.636000,-1.536000,21.717000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.477000,-1.536000,21.209000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.477000,-1.536000,21.590000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<6.477000,-1.536000,21.590000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.604000,-1.536000,21.717000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.477000,-1.536000,21.590000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<6.477000,-1.536000,21.590000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.636000,-1.536000,26.543000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.763000,-1.536000,26.670000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<8.636000,-1.536000,26.543000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.636000,-1.536000,26.543000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.636000,-1.536000,21.717000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<8.636000,-1.536000,21.717000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.604000,-1.536000,26.543000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.477000,-1.536000,26.670000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<6.477000,-1.536000,26.670000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.604000,-1.536000,26.543000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.604000,-1.536000,21.717000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<6.604000,-1.536000,21.717000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.763000,-1.536000,27.051000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.763000,-1.536000,26.670000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<8.763000,-1.536000,26.670000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.477000,-1.536000,27.051000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.477000,-1.536000,26.670000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<6.477000,-1.536000,26.670000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.731000,-1.536000,27.305000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.509000,-1.536000,27.305000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<6.731000,-1.536000,27.305000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<7.620000,-1.536000,27.559000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<7.620000,-1.536000,27.940000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<7.620000,-1.536000,27.940000> }
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-90.000000,0> translate<7.620000,-1.536000,20.828000>}
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-90.000000,0> translate<7.620000,-1.536000,27.432000>}
//R4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<21.590000,-1.536000,25.400000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<21.590000,-1.536000,25.781000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<21.590000,-1.536000,25.781000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<22.479000,-1.536000,26.289000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<20.701000,-1.536000,26.289000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<20.701000,-1.536000,32.131000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<22.479000,-1.536000,32.131000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.701000,-1.536000,26.035000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.479000,-1.536000,26.035000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<20.701000,-1.536000,26.035000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.733000,-1.536000,26.289000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.733000,-1.536000,26.670000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<22.733000,-1.536000,26.670000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.606000,-1.536000,26.797000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.733000,-1.536000,26.670000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<22.606000,-1.536000,26.797000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.447000,-1.536000,26.289000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.447000,-1.536000,26.670000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<20.447000,-1.536000,26.670000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.574000,-1.536000,26.797000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.447000,-1.536000,26.670000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<20.447000,-1.536000,26.670000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.606000,-1.536000,31.623000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.733000,-1.536000,31.750000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<22.606000,-1.536000,31.623000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.606000,-1.536000,31.623000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.606000,-1.536000,26.797000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<22.606000,-1.536000,26.797000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.574000,-1.536000,31.623000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.447000,-1.536000,31.750000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<20.447000,-1.536000,31.750000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.574000,-1.536000,31.623000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.574000,-1.536000,26.797000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<20.574000,-1.536000,26.797000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.733000,-1.536000,32.131000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.733000,-1.536000,31.750000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<22.733000,-1.536000,31.750000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.447000,-1.536000,32.131000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.447000,-1.536000,31.750000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<20.447000,-1.536000,31.750000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.701000,-1.536000,32.385000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.479000,-1.536000,32.385000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<20.701000,-1.536000,32.385000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<21.590000,-1.536000,32.639000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<21.590000,-1.536000,33.020000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<21.590000,-1.536000,33.020000> }
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-90.000000,0> translate<21.590000,-1.536000,25.908000>}
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-90.000000,0> translate<21.590000,-1.536000,32.512000>}
//R5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<19.050000,-1.536000,22.860000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<19.050000,-1.536000,23.241000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<19.050000,-1.536000,23.241000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<19.939000,-1.536000,23.749000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<18.161000,-1.536000,23.749000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<18.161000,-1.536000,29.591000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<19.939000,-1.536000,29.591000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.161000,-1.536000,23.495000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.939000,-1.536000,23.495000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<18.161000,-1.536000,23.495000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.193000,-1.536000,23.749000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.193000,-1.536000,24.130000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<20.193000,-1.536000,24.130000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.066000,-1.536000,24.257000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.193000,-1.536000,24.130000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<20.066000,-1.536000,24.257000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.907000,-1.536000,23.749000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.907000,-1.536000,24.130000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<17.907000,-1.536000,24.130000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.034000,-1.536000,24.257000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.907000,-1.536000,24.130000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<17.907000,-1.536000,24.130000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.066000,-1.536000,29.083000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.193000,-1.536000,29.210000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<20.066000,-1.536000,29.083000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.066000,-1.536000,29.083000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.066000,-1.536000,24.257000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<20.066000,-1.536000,24.257000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.034000,-1.536000,29.083000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.907000,-1.536000,29.210000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<17.907000,-1.536000,29.210000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.034000,-1.536000,29.083000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.034000,-1.536000,24.257000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<18.034000,-1.536000,24.257000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.193000,-1.536000,29.591000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.193000,-1.536000,29.210000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<20.193000,-1.536000,29.210000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.907000,-1.536000,29.591000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.907000,-1.536000,29.210000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<17.907000,-1.536000,29.210000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.161000,-1.536000,29.845000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.939000,-1.536000,29.845000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<18.161000,-1.536000,29.845000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<19.050000,-1.536000,30.099000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<19.050000,-1.536000,30.480000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<19.050000,-1.536000,30.480000> }
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-90.000000,0> translate<19.050000,-1.536000,23.368000>}
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-90.000000,0> translate<19.050000,-1.536000,29.972000>}
//R6 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<16.510000,-1.536000,20.320000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<16.510000,-1.536000,20.701000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<16.510000,-1.536000,20.701000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<17.399000,-1.536000,21.209000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<15.621000,-1.536000,21.209000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<15.621000,-1.536000,27.051000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<17.399000,-1.536000,27.051000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.621000,-1.536000,20.955000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.399000,-1.536000,20.955000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<15.621000,-1.536000,20.955000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.653000,-1.536000,21.209000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.653000,-1.536000,21.590000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<17.653000,-1.536000,21.590000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.526000,-1.536000,21.717000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.653000,-1.536000,21.590000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<17.526000,-1.536000,21.717000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.367000,-1.536000,21.209000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.367000,-1.536000,21.590000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<15.367000,-1.536000,21.590000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.494000,-1.536000,21.717000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.367000,-1.536000,21.590000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<15.367000,-1.536000,21.590000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.526000,-1.536000,26.543000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.653000,-1.536000,26.670000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<17.526000,-1.536000,26.543000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.526000,-1.536000,26.543000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.526000,-1.536000,21.717000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<17.526000,-1.536000,21.717000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.494000,-1.536000,26.543000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.367000,-1.536000,26.670000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<15.367000,-1.536000,26.670000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.494000,-1.536000,26.543000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.494000,-1.536000,21.717000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<15.494000,-1.536000,21.717000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.653000,-1.536000,27.051000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.653000,-1.536000,26.670000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<17.653000,-1.536000,26.670000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.367000,-1.536000,27.051000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.367000,-1.536000,26.670000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<15.367000,-1.536000,26.670000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.621000,-1.536000,27.305000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.399000,-1.536000,27.305000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<15.621000,-1.536000,27.305000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<16.510000,-1.536000,27.559000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<16.510000,-1.536000,27.940000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<16.510000,-1.536000,27.940000> }
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-90.000000,0> translate<16.510000,-1.536000,20.828000>}
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-90.000000,0> translate<16.510000,-1.536000,27.432000>}
//R7 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<30.480000,-1.536000,25.400000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<30.480000,-1.536000,25.781000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<30.480000,-1.536000,25.781000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<31.369000,-1.536000,26.289000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<29.591000,-1.536000,26.289000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<29.591000,-1.536000,32.131000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<31.369000,-1.536000,32.131000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.591000,-1.536000,26.035000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.369000,-1.536000,26.035000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<29.591000,-1.536000,26.035000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.623000,-1.536000,26.289000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.623000,-1.536000,26.670000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<31.623000,-1.536000,26.670000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.496000,-1.536000,26.797000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.623000,-1.536000,26.670000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<31.496000,-1.536000,26.797000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.337000,-1.536000,26.289000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.337000,-1.536000,26.670000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<29.337000,-1.536000,26.670000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.464000,-1.536000,26.797000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.337000,-1.536000,26.670000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<29.337000,-1.536000,26.670000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.496000,-1.536000,31.623000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.623000,-1.536000,31.750000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<31.496000,-1.536000,31.623000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.496000,-1.536000,31.623000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.496000,-1.536000,26.797000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<31.496000,-1.536000,26.797000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.464000,-1.536000,31.623000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.337000,-1.536000,31.750000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<29.337000,-1.536000,31.750000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.464000,-1.536000,31.623000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.464000,-1.536000,26.797000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<29.464000,-1.536000,26.797000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.623000,-1.536000,32.131000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.623000,-1.536000,31.750000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<31.623000,-1.536000,31.750000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.337000,-1.536000,32.131000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.337000,-1.536000,31.750000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<29.337000,-1.536000,31.750000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.591000,-1.536000,32.385000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.369000,-1.536000,32.385000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<29.591000,-1.536000,32.385000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<30.480000,-1.536000,32.639000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<30.480000,-1.536000,33.020000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<30.480000,-1.536000,33.020000> }
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-90.000000,0> translate<30.480000,-1.536000,25.908000>}
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-90.000000,0> translate<30.480000,-1.536000,32.512000>}
//R8 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<27.940000,-1.536000,22.860000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<27.940000,-1.536000,23.241000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<27.940000,-1.536000,23.241000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<28.829000,-1.536000,23.749000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<27.051000,-1.536000,23.749000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<27.051000,-1.536000,29.591000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<28.829000,-1.536000,29.591000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.051000,-1.536000,23.495000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.829000,-1.536000,23.495000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<27.051000,-1.536000,23.495000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.083000,-1.536000,23.749000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.083000,-1.536000,24.130000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<29.083000,-1.536000,24.130000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.956000,-1.536000,24.257000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.083000,-1.536000,24.130000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<28.956000,-1.536000,24.257000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.797000,-1.536000,23.749000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.797000,-1.536000,24.130000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<26.797000,-1.536000,24.130000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.924000,-1.536000,24.257000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.797000,-1.536000,24.130000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<26.797000,-1.536000,24.130000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.956000,-1.536000,29.083000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.083000,-1.536000,29.210000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<28.956000,-1.536000,29.083000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.956000,-1.536000,29.083000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.956000,-1.536000,24.257000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<28.956000,-1.536000,24.257000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.924000,-1.536000,29.083000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.797000,-1.536000,29.210000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<26.797000,-1.536000,29.210000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.924000,-1.536000,29.083000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.924000,-1.536000,24.257000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<26.924000,-1.536000,24.257000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.083000,-1.536000,29.591000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.083000,-1.536000,29.210000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<29.083000,-1.536000,29.210000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.797000,-1.536000,29.591000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.797000,-1.536000,29.210000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<26.797000,-1.536000,29.210000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.051000,-1.536000,29.845000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.829000,-1.536000,29.845000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<27.051000,-1.536000,29.845000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<27.940000,-1.536000,30.099000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<27.940000,-1.536000,30.480000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<27.940000,-1.536000,30.480000> }
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-90.000000,0> translate<27.940000,-1.536000,23.368000>}
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-90.000000,0> translate<27.940000,-1.536000,29.972000>}
//R9 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<25.400000,-1.536000,20.320000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<25.400000,-1.536000,20.701000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<25.400000,-1.536000,20.701000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<26.289000,-1.536000,21.209000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<24.511000,-1.536000,21.209000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<24.511000,-1.536000,27.051000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<26.289000,-1.536000,27.051000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.511000,-1.536000,20.955000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.289000,-1.536000,20.955000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<24.511000,-1.536000,20.955000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.543000,-1.536000,21.209000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.543000,-1.536000,21.590000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<26.543000,-1.536000,21.590000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.416000,-1.536000,21.717000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.543000,-1.536000,21.590000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<26.416000,-1.536000,21.717000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.257000,-1.536000,21.209000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.257000,-1.536000,21.590000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<24.257000,-1.536000,21.590000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.384000,-1.536000,21.717000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.257000,-1.536000,21.590000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<24.257000,-1.536000,21.590000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.416000,-1.536000,26.543000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.543000,-1.536000,26.670000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<26.416000,-1.536000,26.543000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.416000,-1.536000,26.543000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.416000,-1.536000,21.717000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<26.416000,-1.536000,21.717000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.384000,-1.536000,26.543000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.257000,-1.536000,26.670000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<24.257000,-1.536000,26.670000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.384000,-1.536000,26.543000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.384000,-1.536000,21.717000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<24.384000,-1.536000,21.717000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.543000,-1.536000,27.051000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.543000,-1.536000,26.670000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<26.543000,-1.536000,26.670000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.257000,-1.536000,27.051000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.257000,-1.536000,26.670000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<24.257000,-1.536000,26.670000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.511000,-1.536000,27.305000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.289000,-1.536000,27.305000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<24.511000,-1.536000,27.305000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<25.400000,-1.536000,27.559000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<25.400000,-1.536000,27.940000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<25.400000,-1.536000,27.940000> }
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-90.000000,0> translate<25.400000,-1.536000,20.828000>}
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-90.000000,0> translate<25.400000,-1.536000,27.432000>}
//R10 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<39.370000,-1.536000,25.400000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<39.370000,-1.536000,25.781000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<39.370000,-1.536000,25.781000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<40.259000,-1.536000,26.289000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<38.481000,-1.536000,26.289000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<38.481000,-1.536000,32.131000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<40.259000,-1.536000,32.131000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.481000,-1.536000,26.035000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.259000,-1.536000,26.035000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<38.481000,-1.536000,26.035000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.513000,-1.536000,26.289000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.513000,-1.536000,26.670000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<40.513000,-1.536000,26.670000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.386000,-1.536000,26.797000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.513000,-1.536000,26.670000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<40.386000,-1.536000,26.797000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.227000,-1.536000,26.289000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.227000,-1.536000,26.670000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<38.227000,-1.536000,26.670000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.354000,-1.536000,26.797000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.227000,-1.536000,26.670000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<38.227000,-1.536000,26.670000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.386000,-1.536000,31.623000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.513000,-1.536000,31.750000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<40.386000,-1.536000,31.623000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.386000,-1.536000,31.623000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.386000,-1.536000,26.797000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<40.386000,-1.536000,26.797000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.354000,-1.536000,31.623000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.227000,-1.536000,31.750000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<38.227000,-1.536000,31.750000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.354000,-1.536000,31.623000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.354000,-1.536000,26.797000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<38.354000,-1.536000,26.797000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.513000,-1.536000,32.131000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.513000,-1.536000,31.750000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<40.513000,-1.536000,31.750000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.227000,-1.536000,32.131000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.227000,-1.536000,31.750000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<38.227000,-1.536000,31.750000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.481000,-1.536000,32.385000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.259000,-1.536000,32.385000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<38.481000,-1.536000,32.385000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<39.370000,-1.536000,32.639000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<39.370000,-1.536000,33.020000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<39.370000,-1.536000,33.020000> }
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-90.000000,0> translate<39.370000,-1.536000,25.908000>}
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-90.000000,0> translate<39.370000,-1.536000,32.512000>}
//R11 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<36.830000,-1.536000,22.860000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<36.830000,-1.536000,23.241000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<36.830000,-1.536000,23.241000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<37.719000,-1.536000,23.749000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<35.941000,-1.536000,23.749000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<35.941000,-1.536000,29.591000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<37.719000,-1.536000,29.591000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.941000,-1.536000,23.495000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.719000,-1.536000,23.495000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<35.941000,-1.536000,23.495000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.973000,-1.536000,23.749000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.973000,-1.536000,24.130000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<37.973000,-1.536000,24.130000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.846000,-1.536000,24.257000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.973000,-1.536000,24.130000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<37.846000,-1.536000,24.257000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.687000,-1.536000,23.749000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.687000,-1.536000,24.130000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<35.687000,-1.536000,24.130000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.814000,-1.536000,24.257000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.687000,-1.536000,24.130000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<35.687000,-1.536000,24.130000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.846000,-1.536000,29.083000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.973000,-1.536000,29.210000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<37.846000,-1.536000,29.083000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.846000,-1.536000,29.083000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.846000,-1.536000,24.257000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<37.846000,-1.536000,24.257000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.814000,-1.536000,29.083000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.687000,-1.536000,29.210000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<35.687000,-1.536000,29.210000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.814000,-1.536000,29.083000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.814000,-1.536000,24.257000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<35.814000,-1.536000,24.257000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.973000,-1.536000,29.591000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.973000,-1.536000,29.210000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<37.973000,-1.536000,29.210000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.687000,-1.536000,29.591000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.687000,-1.536000,29.210000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<35.687000,-1.536000,29.210000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.941000,-1.536000,29.845000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.719000,-1.536000,29.845000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<35.941000,-1.536000,29.845000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<36.830000,-1.536000,30.099000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<36.830000,-1.536000,30.480000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<36.830000,-1.536000,30.480000> }
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-90.000000,0> translate<36.830000,-1.536000,23.368000>}
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-90.000000,0> translate<36.830000,-1.536000,29.972000>}
//R12 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<34.290000,-1.536000,20.320000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<34.290000,-1.536000,20.701000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<34.290000,-1.536000,20.701000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<35.179000,-1.536000,21.209000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<33.401000,-1.536000,21.209000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<33.401000,-1.536000,27.051000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<35.179000,-1.536000,27.051000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.401000,-1.536000,20.955000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.179000,-1.536000,20.955000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<33.401000,-1.536000,20.955000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.433000,-1.536000,21.209000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.433000,-1.536000,21.590000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<35.433000,-1.536000,21.590000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.306000,-1.536000,21.717000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.433000,-1.536000,21.590000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<35.306000,-1.536000,21.717000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.147000,-1.536000,21.209000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.147000,-1.536000,21.590000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<33.147000,-1.536000,21.590000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.274000,-1.536000,21.717000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.147000,-1.536000,21.590000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<33.147000,-1.536000,21.590000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.306000,-1.536000,26.543000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.433000,-1.536000,26.670000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<35.306000,-1.536000,26.543000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.306000,-1.536000,26.543000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.306000,-1.536000,21.717000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<35.306000,-1.536000,21.717000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.274000,-1.536000,26.543000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.147000,-1.536000,26.670000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<33.147000,-1.536000,26.670000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.274000,-1.536000,26.543000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.274000,-1.536000,21.717000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<33.274000,-1.536000,21.717000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.433000,-1.536000,27.051000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.433000,-1.536000,26.670000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<35.433000,-1.536000,26.670000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.147000,-1.536000,27.051000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.147000,-1.536000,26.670000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<33.147000,-1.536000,26.670000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.401000,-1.536000,27.305000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.179000,-1.536000,27.305000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<33.401000,-1.536000,27.305000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<34.290000,-1.536000,27.559000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<34.290000,-1.536000,27.940000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<34.290000,-1.536000,27.940000> }
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-90.000000,0> translate<34.290000,-1.536000,20.828000>}
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-90.000000,0> translate<34.290000,-1.536000,27.432000>}
//R13 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<48.260000,-1.536000,25.400000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<48.260000,-1.536000,25.781000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<48.260000,-1.536000,25.781000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<49.149000,-1.536000,26.289000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<47.371000,-1.536000,26.289000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<47.371000,-1.536000,32.131000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<49.149000,-1.536000,32.131000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.371000,-1.536000,26.035000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.149000,-1.536000,26.035000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<47.371000,-1.536000,26.035000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.403000,-1.536000,26.289000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.403000,-1.536000,26.670000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<49.403000,-1.536000,26.670000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.276000,-1.536000,26.797000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.403000,-1.536000,26.670000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<49.276000,-1.536000,26.797000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.117000,-1.536000,26.289000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.117000,-1.536000,26.670000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<47.117000,-1.536000,26.670000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.244000,-1.536000,26.797000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.117000,-1.536000,26.670000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<47.117000,-1.536000,26.670000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.276000,-1.536000,31.623000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.403000,-1.536000,31.750000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<49.276000,-1.536000,31.623000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.276000,-1.536000,31.623000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.276000,-1.536000,26.797000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<49.276000,-1.536000,26.797000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.244000,-1.536000,31.623000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.117000,-1.536000,31.750000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<47.117000,-1.536000,31.750000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.244000,-1.536000,31.623000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.244000,-1.536000,26.797000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<47.244000,-1.536000,26.797000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.403000,-1.536000,32.131000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.403000,-1.536000,31.750000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<49.403000,-1.536000,31.750000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.117000,-1.536000,32.131000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.117000,-1.536000,31.750000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<47.117000,-1.536000,31.750000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.371000,-1.536000,32.385000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.149000,-1.536000,32.385000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<47.371000,-1.536000,32.385000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<48.260000,-1.536000,32.639000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<48.260000,-1.536000,33.020000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<48.260000,-1.536000,33.020000> }
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-90.000000,0> translate<48.260000,-1.536000,25.908000>}
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-90.000000,0> translate<48.260000,-1.536000,32.512000>}
//R14 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<45.720000,-1.536000,22.860000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<45.720000,-1.536000,23.241000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<45.720000,-1.536000,23.241000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<46.609000,-1.536000,23.749000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<44.831000,-1.536000,23.749000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<44.831000,-1.536000,29.591000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<46.609000,-1.536000,29.591000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.831000,-1.536000,23.495000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.609000,-1.536000,23.495000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<44.831000,-1.536000,23.495000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.863000,-1.536000,23.749000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.863000,-1.536000,24.130000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<46.863000,-1.536000,24.130000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.736000,-1.536000,24.257000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.863000,-1.536000,24.130000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<46.736000,-1.536000,24.257000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.577000,-1.536000,23.749000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.577000,-1.536000,24.130000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<44.577000,-1.536000,24.130000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.704000,-1.536000,24.257000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.577000,-1.536000,24.130000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<44.577000,-1.536000,24.130000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.736000,-1.536000,29.083000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.863000,-1.536000,29.210000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<46.736000,-1.536000,29.083000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.736000,-1.536000,29.083000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.736000,-1.536000,24.257000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<46.736000,-1.536000,24.257000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.704000,-1.536000,29.083000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.577000,-1.536000,29.210000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<44.577000,-1.536000,29.210000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.704000,-1.536000,29.083000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.704000,-1.536000,24.257000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<44.704000,-1.536000,24.257000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.863000,-1.536000,29.591000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.863000,-1.536000,29.210000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<46.863000,-1.536000,29.210000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.577000,-1.536000,29.591000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.577000,-1.536000,29.210000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<44.577000,-1.536000,29.210000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.831000,-1.536000,29.845000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.609000,-1.536000,29.845000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<44.831000,-1.536000,29.845000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<45.720000,-1.536000,30.099000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<45.720000,-1.536000,30.480000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<45.720000,-1.536000,30.480000> }
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-90.000000,0> translate<45.720000,-1.536000,23.368000>}
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-90.000000,0> translate<45.720000,-1.536000,29.972000>}
//R15 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<43.180000,-1.536000,20.320000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<43.180000,-1.536000,20.701000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<43.180000,-1.536000,20.701000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<44.069000,-1.536000,21.209000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<42.291000,-1.536000,21.209000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<42.291000,-1.536000,27.051000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<44.069000,-1.536000,27.051000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.291000,-1.536000,20.955000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.069000,-1.536000,20.955000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<42.291000,-1.536000,20.955000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.323000,-1.536000,21.209000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.323000,-1.536000,21.590000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<44.323000,-1.536000,21.590000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.196000,-1.536000,21.717000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.323000,-1.536000,21.590000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<44.196000,-1.536000,21.717000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.037000,-1.536000,21.209000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.037000,-1.536000,21.590000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<42.037000,-1.536000,21.590000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.164000,-1.536000,21.717000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.037000,-1.536000,21.590000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<42.037000,-1.536000,21.590000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.196000,-1.536000,26.543000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.323000,-1.536000,26.670000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<44.196000,-1.536000,26.543000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.196000,-1.536000,26.543000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.196000,-1.536000,21.717000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<44.196000,-1.536000,21.717000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.164000,-1.536000,26.543000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.037000,-1.536000,26.670000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<42.037000,-1.536000,26.670000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.164000,-1.536000,26.543000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.164000,-1.536000,21.717000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<42.164000,-1.536000,21.717000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.323000,-1.536000,27.051000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.323000,-1.536000,26.670000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<44.323000,-1.536000,26.670000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.037000,-1.536000,27.051000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.037000,-1.536000,26.670000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<42.037000,-1.536000,26.670000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.291000,-1.536000,27.305000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.069000,-1.536000,27.305000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<42.291000,-1.536000,27.305000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<43.180000,-1.536000,27.559000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<43.180000,-1.536000,27.940000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<43.180000,-1.536000,27.940000> }
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-90.000000,0> translate<43.180000,-1.536000,20.828000>}
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-90.000000,0> translate<43.180000,-1.536000,27.432000>}
//R16 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<57.150000,-1.536000,25.400000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<57.150000,-1.536000,25.781000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<57.150000,-1.536000,25.781000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<58.039000,-1.536000,26.289000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<56.261000,-1.536000,26.289000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<56.261000,-1.536000,32.131000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<58.039000,-1.536000,32.131000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.261000,-1.536000,26.035000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.039000,-1.536000,26.035000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<56.261000,-1.536000,26.035000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.293000,-1.536000,26.289000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.293000,-1.536000,26.670000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<58.293000,-1.536000,26.670000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.166000,-1.536000,26.797000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.293000,-1.536000,26.670000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<58.166000,-1.536000,26.797000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.007000,-1.536000,26.289000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.007000,-1.536000,26.670000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<56.007000,-1.536000,26.670000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.134000,-1.536000,26.797000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.007000,-1.536000,26.670000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<56.007000,-1.536000,26.670000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.166000,-1.536000,31.623000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.293000,-1.536000,31.750000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<58.166000,-1.536000,31.623000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.166000,-1.536000,31.623000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.166000,-1.536000,26.797000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<58.166000,-1.536000,26.797000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.134000,-1.536000,31.623000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.007000,-1.536000,31.750000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<56.007000,-1.536000,31.750000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.134000,-1.536000,31.623000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.134000,-1.536000,26.797000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<56.134000,-1.536000,26.797000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.293000,-1.536000,32.131000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.293000,-1.536000,31.750000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<58.293000,-1.536000,31.750000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.007000,-1.536000,32.131000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.007000,-1.536000,31.750000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<56.007000,-1.536000,31.750000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.261000,-1.536000,32.385000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.039000,-1.536000,32.385000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<56.261000,-1.536000,32.385000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<57.150000,-1.536000,32.639000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<57.150000,-1.536000,33.020000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<57.150000,-1.536000,33.020000> }
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-90.000000,0> translate<57.150000,-1.536000,25.908000>}
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-90.000000,0> translate<57.150000,-1.536000,32.512000>}
//R17 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<54.610000,-1.536000,22.860000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<54.610000,-1.536000,23.241000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<54.610000,-1.536000,23.241000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<55.499000,-1.536000,23.749000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<53.721000,-1.536000,23.749000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<53.721000,-1.536000,29.591000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<55.499000,-1.536000,29.591000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.721000,-1.536000,23.495000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.499000,-1.536000,23.495000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<53.721000,-1.536000,23.495000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.753000,-1.536000,23.749000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.753000,-1.536000,24.130000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<55.753000,-1.536000,24.130000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.626000,-1.536000,24.257000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.753000,-1.536000,24.130000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<55.626000,-1.536000,24.257000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.467000,-1.536000,23.749000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.467000,-1.536000,24.130000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<53.467000,-1.536000,24.130000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.594000,-1.536000,24.257000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.467000,-1.536000,24.130000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<53.467000,-1.536000,24.130000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.626000,-1.536000,29.083000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.753000,-1.536000,29.210000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<55.626000,-1.536000,29.083000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.626000,-1.536000,29.083000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.626000,-1.536000,24.257000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<55.626000,-1.536000,24.257000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.594000,-1.536000,29.083000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.467000,-1.536000,29.210000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<53.467000,-1.536000,29.210000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.594000,-1.536000,29.083000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.594000,-1.536000,24.257000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<53.594000,-1.536000,24.257000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.753000,-1.536000,29.591000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.753000,-1.536000,29.210000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<55.753000,-1.536000,29.210000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.467000,-1.536000,29.591000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.467000,-1.536000,29.210000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<53.467000,-1.536000,29.210000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.721000,-1.536000,29.845000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.499000,-1.536000,29.845000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<53.721000,-1.536000,29.845000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<54.610000,-1.536000,30.099000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<54.610000,-1.536000,30.480000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<54.610000,-1.536000,30.480000> }
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-90.000000,0> translate<54.610000,-1.536000,23.368000>}
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-90.000000,0> translate<54.610000,-1.536000,29.972000>}
//R18 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<52.070000,-1.536000,20.320000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<52.070000,-1.536000,20.701000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<52.070000,-1.536000,20.701000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<52.959000,-1.536000,21.209000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<51.181000,-1.536000,21.209000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<51.181000,-1.536000,27.051000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<52.959000,-1.536000,27.051000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.181000,-1.536000,20.955000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.959000,-1.536000,20.955000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<51.181000,-1.536000,20.955000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.213000,-1.536000,21.209000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.213000,-1.536000,21.590000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<53.213000,-1.536000,21.590000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.086000,-1.536000,21.717000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.213000,-1.536000,21.590000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<53.086000,-1.536000,21.717000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.927000,-1.536000,21.209000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.927000,-1.536000,21.590000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<50.927000,-1.536000,21.590000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.054000,-1.536000,21.717000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.927000,-1.536000,21.590000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<50.927000,-1.536000,21.590000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.086000,-1.536000,26.543000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.213000,-1.536000,26.670000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<53.086000,-1.536000,26.543000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.086000,-1.536000,26.543000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.086000,-1.536000,21.717000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<53.086000,-1.536000,21.717000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.054000,-1.536000,26.543000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.927000,-1.536000,26.670000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<50.927000,-1.536000,26.670000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.054000,-1.536000,26.543000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.054000,-1.536000,21.717000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<51.054000,-1.536000,21.717000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.213000,-1.536000,27.051000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.213000,-1.536000,26.670000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<53.213000,-1.536000,26.670000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.927000,-1.536000,27.051000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.927000,-1.536000,26.670000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<50.927000,-1.536000,26.670000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.181000,-1.536000,27.305000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.959000,-1.536000,27.305000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<51.181000,-1.536000,27.305000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<52.070000,-1.536000,27.559000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<52.070000,-1.536000,27.940000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<52.070000,-1.536000,27.940000> }
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-90.000000,0> translate<52.070000,-1.536000,20.828000>}
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-90.000000,0> translate<52.070000,-1.536000,27.432000>}
//R19 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<66.040000,-1.536000,25.400000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<66.040000,-1.536000,25.781000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<66.040000,-1.536000,25.781000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<66.929000,-1.536000,26.289000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<65.151000,-1.536000,26.289000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<65.151000,-1.536000,32.131000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<66.929000,-1.536000,32.131000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.151000,-1.536000,26.035000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.929000,-1.536000,26.035000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<65.151000,-1.536000,26.035000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.183000,-1.536000,26.289000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.183000,-1.536000,26.670000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<67.183000,-1.536000,26.670000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.056000,-1.536000,26.797000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.183000,-1.536000,26.670000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<67.056000,-1.536000,26.797000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.897000,-1.536000,26.289000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.897000,-1.536000,26.670000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<64.897000,-1.536000,26.670000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.024000,-1.536000,26.797000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.897000,-1.536000,26.670000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<64.897000,-1.536000,26.670000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.056000,-1.536000,31.623000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.183000,-1.536000,31.750000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<67.056000,-1.536000,31.623000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.056000,-1.536000,31.623000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.056000,-1.536000,26.797000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<67.056000,-1.536000,26.797000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.024000,-1.536000,31.623000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.897000,-1.536000,31.750000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<64.897000,-1.536000,31.750000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.024000,-1.536000,31.623000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.024000,-1.536000,26.797000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<65.024000,-1.536000,26.797000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.183000,-1.536000,32.131000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.183000,-1.536000,31.750000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<67.183000,-1.536000,31.750000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.897000,-1.536000,32.131000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.897000,-1.536000,31.750000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<64.897000,-1.536000,31.750000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.151000,-1.536000,32.385000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.929000,-1.536000,32.385000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<65.151000,-1.536000,32.385000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<66.040000,-1.536000,32.639000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<66.040000,-1.536000,33.020000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<66.040000,-1.536000,33.020000> }
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-90.000000,0> translate<66.040000,-1.536000,25.908000>}
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-90.000000,0> translate<66.040000,-1.536000,32.512000>}
//R20 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<63.500000,-1.536000,22.860000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<63.500000,-1.536000,23.241000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<63.500000,-1.536000,23.241000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<64.389000,-1.536000,23.749000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<62.611000,-1.536000,23.749000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<62.611000,-1.536000,29.591000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<64.389000,-1.536000,29.591000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.611000,-1.536000,23.495000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.389000,-1.536000,23.495000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<62.611000,-1.536000,23.495000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.643000,-1.536000,23.749000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.643000,-1.536000,24.130000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<64.643000,-1.536000,24.130000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.516000,-1.536000,24.257000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.643000,-1.536000,24.130000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<64.516000,-1.536000,24.257000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.357000,-1.536000,23.749000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.357000,-1.536000,24.130000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<62.357000,-1.536000,24.130000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.484000,-1.536000,24.257000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.357000,-1.536000,24.130000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<62.357000,-1.536000,24.130000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.516000,-1.536000,29.083000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.643000,-1.536000,29.210000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<64.516000,-1.536000,29.083000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.516000,-1.536000,29.083000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.516000,-1.536000,24.257000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<64.516000,-1.536000,24.257000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.484000,-1.536000,29.083000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.357000,-1.536000,29.210000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<62.357000,-1.536000,29.210000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.484000,-1.536000,29.083000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.484000,-1.536000,24.257000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<62.484000,-1.536000,24.257000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.643000,-1.536000,29.591000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.643000,-1.536000,29.210000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<64.643000,-1.536000,29.210000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.357000,-1.536000,29.591000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.357000,-1.536000,29.210000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<62.357000,-1.536000,29.210000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.611000,-1.536000,29.845000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.389000,-1.536000,29.845000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<62.611000,-1.536000,29.845000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<63.500000,-1.536000,30.099000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<63.500000,-1.536000,30.480000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<63.500000,-1.536000,30.480000> }
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-90.000000,0> translate<63.500000,-1.536000,23.368000>}
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-90.000000,0> translate<63.500000,-1.536000,29.972000>}
//R21 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<60.960000,-1.536000,20.320000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<60.960000,-1.536000,20.701000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<60.960000,-1.536000,20.701000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<61.849000,-1.536000,21.209000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<60.071000,-1.536000,21.209000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<60.071000,-1.536000,27.051000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<61.849000,-1.536000,27.051000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.071000,-1.536000,20.955000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.849000,-1.536000,20.955000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<60.071000,-1.536000,20.955000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.103000,-1.536000,21.209000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.103000,-1.536000,21.590000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<62.103000,-1.536000,21.590000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.976000,-1.536000,21.717000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.103000,-1.536000,21.590000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<61.976000,-1.536000,21.717000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.817000,-1.536000,21.209000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.817000,-1.536000,21.590000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<59.817000,-1.536000,21.590000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.944000,-1.536000,21.717000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.817000,-1.536000,21.590000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<59.817000,-1.536000,21.590000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.976000,-1.536000,26.543000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.103000,-1.536000,26.670000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<61.976000,-1.536000,26.543000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.976000,-1.536000,26.543000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.976000,-1.536000,21.717000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<61.976000,-1.536000,21.717000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.944000,-1.536000,26.543000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.817000,-1.536000,26.670000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<59.817000,-1.536000,26.670000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.944000,-1.536000,26.543000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.944000,-1.536000,21.717000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<59.944000,-1.536000,21.717000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.103000,-1.536000,27.051000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.103000,-1.536000,26.670000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<62.103000,-1.536000,26.670000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.817000,-1.536000,27.051000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.817000,-1.536000,26.670000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<59.817000,-1.536000,26.670000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.071000,-1.536000,27.305000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.849000,-1.536000,27.305000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<60.071000,-1.536000,27.305000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<60.960000,-1.536000,27.559000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<60.960000,-1.536000,27.940000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<60.960000,-1.536000,27.940000> }
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-90.000000,0> translate<60.960000,-1.536000,20.828000>}
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-90.000000,0> translate<60.960000,-1.536000,27.432000>}
//R22 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<74.930000,-1.536000,25.400000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<74.930000,-1.536000,25.781000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<74.930000,-1.536000,25.781000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<75.819000,-1.536000,26.289000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<74.041000,-1.536000,26.289000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<74.041000,-1.536000,32.131000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<75.819000,-1.536000,32.131000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.041000,-1.536000,26.035000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.819000,-1.536000,26.035000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<74.041000,-1.536000,26.035000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.073000,-1.536000,26.289000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.073000,-1.536000,26.670000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<76.073000,-1.536000,26.670000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.946000,-1.536000,26.797000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.073000,-1.536000,26.670000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<75.946000,-1.536000,26.797000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.787000,-1.536000,26.289000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.787000,-1.536000,26.670000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<73.787000,-1.536000,26.670000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.914000,-1.536000,26.797000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.787000,-1.536000,26.670000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<73.787000,-1.536000,26.670000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.946000,-1.536000,31.623000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.073000,-1.536000,31.750000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<75.946000,-1.536000,31.623000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.946000,-1.536000,31.623000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.946000,-1.536000,26.797000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<75.946000,-1.536000,26.797000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.914000,-1.536000,31.623000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.787000,-1.536000,31.750000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<73.787000,-1.536000,31.750000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.914000,-1.536000,31.623000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.914000,-1.536000,26.797000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<73.914000,-1.536000,26.797000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.073000,-1.536000,32.131000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.073000,-1.536000,31.750000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<76.073000,-1.536000,31.750000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.787000,-1.536000,32.131000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.787000,-1.536000,31.750000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<73.787000,-1.536000,31.750000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.041000,-1.536000,32.385000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.819000,-1.536000,32.385000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<74.041000,-1.536000,32.385000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<74.930000,-1.536000,32.639000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<74.930000,-1.536000,33.020000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<74.930000,-1.536000,33.020000> }
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-90.000000,0> translate<74.930000,-1.536000,25.908000>}
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-90.000000,0> translate<74.930000,-1.536000,32.512000>}
//R23 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<72.390000,-1.536000,22.860000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<72.390000,-1.536000,23.241000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<72.390000,-1.536000,23.241000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<73.279000,-1.536000,23.749000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<71.501000,-1.536000,23.749000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<71.501000,-1.536000,29.591000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<73.279000,-1.536000,29.591000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.501000,-1.536000,23.495000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.279000,-1.536000,23.495000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<71.501000,-1.536000,23.495000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.533000,-1.536000,23.749000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.533000,-1.536000,24.130000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<73.533000,-1.536000,24.130000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.406000,-1.536000,24.257000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.533000,-1.536000,24.130000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<73.406000,-1.536000,24.257000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.247000,-1.536000,23.749000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.247000,-1.536000,24.130000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<71.247000,-1.536000,24.130000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.374000,-1.536000,24.257000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.247000,-1.536000,24.130000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<71.247000,-1.536000,24.130000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.406000,-1.536000,29.083000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.533000,-1.536000,29.210000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<73.406000,-1.536000,29.083000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.406000,-1.536000,29.083000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.406000,-1.536000,24.257000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<73.406000,-1.536000,24.257000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.374000,-1.536000,29.083000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.247000,-1.536000,29.210000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<71.247000,-1.536000,29.210000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.374000,-1.536000,29.083000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.374000,-1.536000,24.257000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<71.374000,-1.536000,24.257000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.533000,-1.536000,29.591000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.533000,-1.536000,29.210000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<73.533000,-1.536000,29.210000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.247000,-1.536000,29.591000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.247000,-1.536000,29.210000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<71.247000,-1.536000,29.210000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.501000,-1.536000,29.845000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.279000,-1.536000,29.845000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<71.501000,-1.536000,29.845000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<72.390000,-1.536000,30.099000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<72.390000,-1.536000,30.480000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<72.390000,-1.536000,30.480000> }
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-90.000000,0> translate<72.390000,-1.536000,23.368000>}
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-90.000000,0> translate<72.390000,-1.536000,29.972000>}
//R24 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<69.850000,-1.536000,20.320000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<69.850000,-1.536000,20.701000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<69.850000,-1.536000,20.701000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<70.739000,-1.536000,21.209000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<68.961000,-1.536000,21.209000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<68.961000,-1.536000,27.051000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<70.739000,-1.536000,27.051000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.961000,-1.536000,20.955000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.739000,-1.536000,20.955000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<68.961000,-1.536000,20.955000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.993000,-1.536000,21.209000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.993000,-1.536000,21.590000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<70.993000,-1.536000,21.590000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.866000,-1.536000,21.717000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.993000,-1.536000,21.590000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<70.866000,-1.536000,21.717000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.707000,-1.536000,21.209000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.707000,-1.536000,21.590000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<68.707000,-1.536000,21.590000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.834000,-1.536000,21.717000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.707000,-1.536000,21.590000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<68.707000,-1.536000,21.590000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.866000,-1.536000,26.543000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.993000,-1.536000,26.670000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<70.866000,-1.536000,26.543000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.866000,-1.536000,26.543000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.866000,-1.536000,21.717000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<70.866000,-1.536000,21.717000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.834000,-1.536000,26.543000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.707000,-1.536000,26.670000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<68.707000,-1.536000,26.670000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.834000,-1.536000,26.543000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.834000,-1.536000,21.717000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<68.834000,-1.536000,21.717000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.993000,-1.536000,27.051000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.993000,-1.536000,26.670000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<70.993000,-1.536000,26.670000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.707000,-1.536000,27.051000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.707000,-1.536000,26.670000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<68.707000,-1.536000,26.670000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.961000,-1.536000,27.305000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.739000,-1.536000,27.305000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<68.961000,-1.536000,27.305000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<69.850000,-1.536000,27.559000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<69.850000,-1.536000,27.940000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<69.850000,-1.536000,27.940000> }
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-90.000000,0> translate<69.850000,-1.536000,20.828000>}
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-90.000000,0> translate<69.850000,-1.536000,27.432000>}
//RGB silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.810000,-1.536000,27.305000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.810000,-1.536000,28.575000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<3.810000,-1.536000,28.575000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.810000,-1.536000,28.575000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.175000,-1.536000,29.210000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<3.175000,-1.536000,29.210000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.175000,-1.536000,29.210000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.905000,-1.536000,29.210000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<1.905000,-1.536000,29.210000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.905000,-1.536000,29.210000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.270000,-1.536000,28.575000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<1.270000,-1.536000,28.575000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.175000,-1.536000,29.210000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.810000,-1.536000,29.845000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<3.175000,-1.536000,29.210000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.810000,-1.536000,29.845000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.810000,-1.536000,31.115000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<3.810000,-1.536000,31.115000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.810000,-1.536000,31.115000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.175000,-1.536000,31.750000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<3.175000,-1.536000,31.750000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.175000,-1.536000,31.750000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.905000,-1.536000,31.750000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<1.905000,-1.536000,31.750000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.905000,-1.536000,31.750000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.270000,-1.536000,31.115000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<1.270000,-1.536000,31.115000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.270000,-1.536000,31.115000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.270000,-1.536000,29.845000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<1.270000,-1.536000,29.845000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.270000,-1.536000,29.845000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.905000,-1.536000,29.210000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<1.270000,-1.536000,29.845000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.175000,-1.536000,26.670000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.905000,-1.536000,26.670000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<1.905000,-1.536000,26.670000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.810000,-1.536000,27.305000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.175000,-1.536000,26.670000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<3.175000,-1.536000,26.670000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.905000,-1.536000,26.670000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.270000,-1.536000,27.305000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<1.270000,-1.536000,27.305000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.270000,-1.536000,28.575000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.270000,-1.536000,27.305000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<1.270000,-1.536000,27.305000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.175000,-1.536000,31.750000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.810000,-1.536000,32.385000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<3.175000,-1.536000,31.750000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.810000,-1.536000,32.385000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.810000,-1.536000,33.655000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<3.810000,-1.536000,33.655000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.810000,-1.536000,33.655000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.175000,-1.536000,34.290000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<3.175000,-1.536000,34.290000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.175000,-1.536000,34.290000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.905000,-1.536000,34.290000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<1.905000,-1.536000,34.290000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.905000,-1.536000,34.290000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.270000,-1.536000,33.655000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<1.270000,-1.536000,33.655000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.270000,-1.536000,33.655000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.270000,-1.536000,32.385000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<1.270000,-1.536000,32.385000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.270000,-1.536000,32.385000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.905000,-1.536000,31.750000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<1.270000,-1.536000,32.385000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<2.540000,-1.536000,30.480000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<2.540000,-1.536000,27.940000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<2.540000,-1.536000,33.020000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.432300,-1.536000,26.657300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.576275,-1.536000,26.657300>}
box{<0,0,-0.063500><1.143975,0.036000,0.063500> rotate<0,0.000000,0> translate<4.432300,-1.536000,26.657300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.576275,-1.536000,26.657300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.576275,-1.536000,27.229288>}
box{<0,0,-0.063500><0.571987,0.036000,0.063500> rotate<0,90.000000,0> translate<5.576275,-1.536000,27.229288> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.576275,-1.536000,27.229288>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.385613,-1.536000,27.419950>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<5.385613,-1.536000,27.419950> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.385613,-1.536000,27.419950>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.004288,-1.536000,27.419950>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,0.000000,0> translate<5.004288,-1.536000,27.419950> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.004288,-1.536000,27.419950>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.813625,-1.536000,27.229288>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<4.813625,-1.536000,27.229288> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.813625,-1.536000,27.229288>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.813625,-1.536000,26.657300>}
box{<0,0,-0.063500><0.571987,0.036000,0.063500> rotate<0,-90.000000,0> translate<4.813625,-1.536000,26.657300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.813625,-1.536000,27.038625>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.432300,-1.536000,27.419950>}
box{<0,0,-0.063500><0.539275,0.036000,0.063500> rotate<0,44.997030,0> translate<4.432300,-1.536000,27.419950> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.385613,-1.536000,28.589347>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.576275,-1.536000,28.398684>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<5.385613,-1.536000,28.589347> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.576275,-1.536000,28.398684>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.576275,-1.536000,28.017359>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,-90.000000,0> translate<5.576275,-1.536000,28.017359> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.576275,-1.536000,28.017359>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.385613,-1.536000,27.826697>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<5.385613,-1.536000,27.826697> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.385613,-1.536000,27.826697>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.622962,-1.536000,27.826697>}
box{<0,0,-0.063500><0.762650,0.036000,0.063500> rotate<0,0.000000,0> translate<4.622962,-1.536000,27.826697> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.622962,-1.536000,27.826697>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.432300,-1.536000,28.017359>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<4.432300,-1.536000,28.017359> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.432300,-1.536000,28.017359>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.432300,-1.536000,28.398684>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,90.000000,0> translate<4.432300,-1.536000,28.398684> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.432300,-1.536000,28.398684>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.622962,-1.536000,28.589347>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<4.432300,-1.536000,28.398684> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.622962,-1.536000,28.589347>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.004288,-1.536000,28.589347>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,0.000000,0> translate<4.622962,-1.536000,28.589347> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.004288,-1.536000,28.589347>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.004288,-1.536000,28.208022>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,-90.000000,0> translate<5.004288,-1.536000,28.208022> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.432300,-1.536000,28.996094>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.576275,-1.536000,28.996094>}
box{<0,0,-0.063500><1.143975,0.036000,0.063500> rotate<0,0.000000,0> translate<4.432300,-1.536000,28.996094> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.576275,-1.536000,28.996094>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.576275,-1.536000,29.568081>}
box{<0,0,-0.063500><0.571988,0.036000,0.063500> rotate<0,90.000000,0> translate<5.576275,-1.536000,29.568081> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.576275,-1.536000,29.568081>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.385613,-1.536000,29.758744>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<5.385613,-1.536000,29.758744> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.385613,-1.536000,29.758744>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.194950,-1.536000,29.758744>}
box{<0,0,-0.063500><0.190663,0.036000,0.063500> rotate<0,0.000000,0> translate<5.194950,-1.536000,29.758744> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.194950,-1.536000,29.758744>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.004288,-1.536000,29.568081>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<5.004288,-1.536000,29.568081> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.004288,-1.536000,29.568081>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.813625,-1.536000,29.758744>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<4.813625,-1.536000,29.758744> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.813625,-1.536000,29.758744>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.622962,-1.536000,29.758744>}
box{<0,0,-0.063500><0.190663,0.036000,0.063500> rotate<0,0.000000,0> translate<4.622962,-1.536000,29.758744> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.622962,-1.536000,29.758744>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.432300,-1.536000,29.568081>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<4.432300,-1.536000,29.568081> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.432300,-1.536000,29.568081>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.432300,-1.536000,28.996094>}
box{<0,0,-0.063500><0.571988,0.036000,0.063500> rotate<0,-90.000000,0> translate<4.432300,-1.536000,28.996094> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.004288,-1.536000,28.996094>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.004288,-1.536000,29.568081>}
box{<0,0,-0.063500><0.571988,0.036000,0.063500> rotate<0,90.000000,0> translate<5.004288,-1.536000,29.568081> }

texture{col_slk}
}
#end
translate<mac_x_ver,mac_y_ver,mac_z_ver>
rotate<mac_x_rot,mac_y_rot,mac_z_rot>
}//End union
#end

#if(use_file_as_inc=off)
object{  Z_RGB_SMD_LEDS(-42.370000,0,-17.825000,pcb_rotate_x,pcb_rotate_y,pcb_rotate_z)
#if(pcb_upsidedown=on)
rotate pcb_rotdir*180
#end
}
#end


//Parts not found in 3dpack.dat or 3dusrpac.dat are:
//LED1	F503605050	5050LED
//LED2	F503605050	5050LED
//LED3	F503605050	5050LED
//LED4	F503605050	5050LED
//LED5	F503605050	5050LED
//LED6	F503605050	5050LED
//LED7	F503605050	5050LED
//LED8	F503605050	5050LED
//U$1		3,2
//U$2		3,2
//U$3		3,2
