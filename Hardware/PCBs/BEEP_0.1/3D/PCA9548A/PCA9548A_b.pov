//POVRay-Datei erstellt mit 3d41.ulp v20110101
///home/flexxxv/eagle/BEEP_0.1/PCA9548A.brd
//27.04.13 21:52

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
#local cam_y = 147;
#local cam_z = -78;
#local cam_a = 20;
#local cam_look_x = 0;
#local cam_look_y = -3;
#local cam_look_z = 0;

#local pcb_rotate_x = 180;
#local pcb_rotate_y = 180;
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

#local lgt1_pos_x = 16;
#local lgt1_pos_y = 24;
#local lgt1_pos_z = 18;
#local lgt1_intense = 0.720984;
#local lgt2_pos_x = -16;
#local lgt2_pos_y = 24;
#local lgt2_pos_z = 18;
#local lgt2_intense = 0.720984;
#local lgt3_pos_x = 16;
#local lgt3_pos_y = 24;
#local lgt3_pos_z = -12;
#local lgt3_intense = 0.720984;
#local lgt4_pos_x = -16;
#local lgt4_pos_y = 24;
#local lgt4_pos_z = -12;
#local lgt4_intense = 0.720984;

//Do not change these values
#declare pcb_height = 1.500000;
#declare pcb_cuheight = 0.035000;
#declare pcb_x_size = 42.850000;
#declare pcb_y_size = 34.280000;
#declare pcb_layer1_used = 1;
#declare pcb_layer16_used = 0;
#declare inc_testmode = off;
#declare global_seed=seed(219);
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
	//translate<-21.425000,0,-17.140000>
}
#end

background{col_bgr}
light_source{<lgt1_pos_x,lgt1_pos_y,lgt1_pos_z> White*lgt1_intense shadowless}
light_source{<lgt2_pos_x,lgt2_pos_y,lgt2_pos_z> White*lgt2_intense shadowless}
light_source{<lgt3_pos_x,lgt3_pos_y,lgt3_pos_z> White*lgt3_intense shadowless}
light_source{<lgt4_pos_x,lgt4_pos_y,lgt4_pos_z> White*lgt4_intense}
#end


#macro PCA9548A(mac_x_ver,mac_y_ver,mac_z_ver,mac_x_rot,mac_y_rot,mac_z_rot)
union{
#if(pcb_board = on)
difference{
union{
//Platine
prism{-1.500000,0.000000,8
<0.000000,0.000000><42.850000,0.000000>
<42.850000,0.000000><42.850000,34.280000>
<42.850000,34.280000><0.000000,34.280000>
<0.000000,34.280000><0.000000,0.000000>
texture{col_brd}}
}//End union(PCB)
//Bohrungen(real)/Bauteile
cylinder{<22.100000,1,4.100000><22.100000,-5,4.100000>1.600000 texture{col_hls}}
cylinder{<4.100000,1,30.200000><4.100000,-5,30.200000>1.600000 texture{col_hls}}
cylinder{<38.700000,1,30.100000><38.700000,-5,30.100000>1.600000 texture{col_hls}}
//Bohrungen(real)/Platine
//Bohrungen(real)/Durchkontaktierungen
}//End difference(reale Bohrungen/Durchbrüche)
#end
#if(pcb_parts=on)//Bauteile
union{
#ifndef(pack_A01) #declare global_pack_A01=yes; object {CON_PH_2X2()translate<0,-0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,180> translate<17.280000,-1.500000,25.530000>}#end		//Stiftleiste 2,54mm Raster 2Pin 2Reihen (pinhead.lib) A01  2X02
#ifndef(pack_A2) #declare global_pack_A2=yes; object {CON_PH_1X2()translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,180> translate<26.170000,-1.500000,25.530000>}#end		//Stiftleiste 2,54mm Raster 2Pin 1Reihe (pinhead.lib) A2  1X02
#ifndef(pack_C1) #declare global_pack_C1=yes; object {CAP_SMD_CHIP_0805()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<31.890000,0.000000,27.870000>translate<0,0.035000,0> }#end		//SMD Kondensator 0805 C1 100n C0805
#ifndef(pack_I2C) #declare global_pack_I2C=yes; object {CON_PH_1X2()translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,180> translate<34.660000,-1.500000,20.450000>}#end		//Stiftleiste 2,54mm Raster 2Pin 1Reihe (pinhead.lib) I2C  1X02
#ifndef(pack_IC1) #declare global_pack_IC1=yes; object {IC_SMD_TSSOP24("PCA9548A","",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<19.820000,0.000000,14.100000>translate<0,0.035000,0> }#end		//TSSOP24 IC1 PCA9548A TSSOP24
#ifndef(pack_JP3) #declare global_pack_JP3=yes; object {CON_PH_2X4()translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,180> translate<5.850000,-1.500000,11.560000>}#end		//Stiftleiste 2,54mm Raster 4Pin 2Reihen (pinhead.lib) JP3  2X04
#ifndef(pack_JP4) #declare global_pack_JP4=yes; object {CON_PH_2X4()translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,180> translate<33.790000,-1.500000,11.560000>}#end		//Stiftleiste 2,54mm Raster 4Pin 2Reihen (pinhead.lib) JP4  2X04
#ifndef(pack_POWER) #declare global_pack_POWER=yes; object {CON_PH_1X2()translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,180> translate<14.740000,-1.500000,5.210000>}#end		//Stiftleiste 2,54mm Raster 2Pin 1Reihe (pinhead.lib) POWER  1X02
#ifndef(pack_R1) #declare global_pack_R1=yes; object {RES_DIS_0207_075MM(texture{pigment{DarkBrown}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Black}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Orange}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,180> translate<29.980000,-1.500000,28.070000>}#end		//Diskreter Widerstand 0,3W 7,5MM Raster R1 10k 0207/7
#ifndef(pack_R2) #declare global_pack_R2=yes; object {RES_DIS_0207_075MM(texture{pigment{DarkBrown}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Black}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Orange}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,180> translate<12.200000,-1.500000,28.070000>}#end		//Diskreter Widerstand 0,3W 7,5MM Raster R2 10k 0207/7
#ifndef(pack_R3) #declare global_pack_R3=yes; object {RES_DIS_0207_075MM(texture{pigment{DarkBrown}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Black}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Orange}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,180> translate<21.660000,-1.500000,28.070000>}#end		//Diskreter Widerstand 0,3W 7,5MM Raster R3 10k 0207/7
#ifndef(pack_R4) #declare global_pack_R4=yes; object {RES_SMD_CHIP_0805("103",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<8.390000,0.000000,21.720000>translate<0,0.035000,0> }#end		//SMD Widerstand 0805 R4 10k M0805
#ifndef(pack_RESET) #declare global_pack_RESET=yes; object {CON_PH_1X2()translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,180> translate<4.580000,-1.500000,22.990000>}#end		//Stiftleiste 2,54mm Raster 2Pin 1Reihe (pinhead.lib) RESET  1X02
}//End union
#end
#if(pcb_pads_smds=on)
//Lötaugen&SMD/Bauteile
#ifndef(global_pack_A01) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<18.550000,0,24.260000> texture{col_thl}}
#ifndef(global_pack_A01) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<18.550000,0,26.800000> texture{col_thl}}
#ifndef(global_pack_A01) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<16.010000,0,24.260000> texture{col_thl}}
#ifndef(global_pack_A01) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<16.010000,0,26.800000> texture{col_thl}}
#ifndef(global_pack_A2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<26.170000,0,26.800000> texture{col_thl}}
#ifndef(global_pack_A2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<26.170000,0,24.260000> texture{col_thl}}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<31.890000,0.000000,26.920000>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<31.890000,0.000000,28.820000>}
#ifndef(global_pack_I2C) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<34.660000,0,21.720000> texture{col_thl}}
#ifndef(global_pack_I2C) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<34.660000,0,19.180000> texture{col_thl}}
object{TOOLS_PCB_SMD(1.500000,0.600000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<16.820000,0.000000,17.775000>}
object{TOOLS_PCB_SMD(1.500000,0.400000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<16.820000,0.000000,17.025000>}
object{TOOLS_PCB_SMD(1.500000,0.400000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<22.820000,0.000000,15.725000>}
object{TOOLS_PCB_SMD(1.500000,0.600000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<16.820000,0.000000,10.425000>}
object{TOOLS_PCB_SMD(1.500000,0.400000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<16.820000,0.000000,16.375000>}
object{TOOLS_PCB_SMD(1.500000,0.400000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<16.820000,0.000000,15.075000>}
object{TOOLS_PCB_SMD(1.500000,0.400000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<16.820000,0.000000,13.775000>}
object{TOOLS_PCB_SMD(1.500000,0.400000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<16.820000,0.000000,12.475000>}
object{TOOLS_PCB_SMD(1.500000,0.400000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<16.820000,0.000000,11.175000>}
object{TOOLS_PCB_SMD(1.500000,0.400000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<22.820000,0.000000,11.175000>}
object{TOOLS_PCB_SMD(1.500000,0.400000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<22.820000,0.000000,12.475000>}
object{TOOLS_PCB_SMD(1.500000,0.400000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<22.820000,0.000000,13.775000>}
object{TOOLS_PCB_SMD(1.500000,0.400000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<22.820000,0.000000,15.075000>}
object{TOOLS_PCB_SMD(1.500000,0.400000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<22.820000,0.000000,16.375000>}
object{TOOLS_PCB_SMD(1.500000,0.400000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<16.820000,0.000000,15.725000>}
object{TOOLS_PCB_SMD(1.500000,0.400000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<16.820000,0.000000,14.425000>}
object{TOOLS_PCB_SMD(1.500000,0.400000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<16.820000,0.000000,13.125000>}
object{TOOLS_PCB_SMD(1.500000,0.400000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<16.820000,0.000000,11.825000>}
object{TOOLS_PCB_SMD(1.500000,0.600000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<22.820000,0.000000,10.425000>}
object{TOOLS_PCB_SMD(1.500000,0.400000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<22.820000,0.000000,11.825000>}
object{TOOLS_PCB_SMD(1.500000,0.400000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<22.820000,0.000000,13.125000>}
object{TOOLS_PCB_SMD(1.500000,0.400000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<22.820000,0.000000,14.425000>}
object{TOOLS_PCB_SMD(1.500000,0.400000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<22.820000,0.000000,17.025000>}
object{TOOLS_PCB_SMD(1.500000,0.600000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<22.820000,0.000000,17.775000>}
#ifndef(global_pack_JP3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<7.120000,0,15.370000> texture{col_thl}}
#ifndef(global_pack_JP3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<4.580000,0,15.370000> texture{col_thl}}
#ifndef(global_pack_JP3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<7.120000,0,12.830000> texture{col_thl}}
#ifndef(global_pack_JP3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<4.580000,0,12.830000> texture{col_thl}}
#ifndef(global_pack_JP3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<7.120000,0,10.290000> texture{col_thl}}
#ifndef(global_pack_JP3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<4.580000,0,10.290000> texture{col_thl}}
#ifndef(global_pack_JP3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<7.120000,0,7.750000> texture{col_thl}}
#ifndef(global_pack_JP3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<4.580000,0,7.750000> texture{col_thl}}
#ifndef(global_pack_JP4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<35.060000,0,15.370000> texture{col_thl}}
#ifndef(global_pack_JP4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<32.520000,0,15.370000> texture{col_thl}}
#ifndef(global_pack_JP4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<35.060000,0,12.830000> texture{col_thl}}
#ifndef(global_pack_JP4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<32.520000,0,12.830000> texture{col_thl}}
#ifndef(global_pack_JP4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<35.060000,0,10.290000> texture{col_thl}}
#ifndef(global_pack_JP4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<32.520000,0,10.290000> texture{col_thl}}
#ifndef(global_pack_JP4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<35.060000,0,7.750000> texture{col_thl}}
#ifndef(global_pack_JP4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<32.520000,0,7.750000> texture{col_thl}}
#ifndef(global_pack_POWER) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<13.470000,0,5.210000> texture{col_thl}}
#ifndef(global_pack_POWER) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<16.010000,0,5.210000> texture{col_thl}}
#ifndef(global_pack_R1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<29.980000,0,31.880000> texture{col_thl}}
#ifndef(global_pack_R1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<29.980000,0,24.260000> texture{col_thl}}
#ifndef(global_pack_R2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<12.200000,0,31.880000> texture{col_thl}}
#ifndef(global_pack_R2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<12.200000,0,24.260000> texture{col_thl}}
#ifndef(global_pack_R3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<21.660000,0,31.880000> texture{col_thl}}
#ifndef(global_pack_R3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<21.660000,0,24.260000> texture{col_thl}}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<7.440000,0.000000,21.720000>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<9.340000,0.000000,21.720000>}
#ifndef(global_pack_RESET) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<4.580000,0,24.260000> texture{col_thl}}
#ifndef(global_pack_RESET) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<4.580000,0,21.720000> texture{col_thl}}
//Lötaugen/Durchkontaktierungen
#end
#if(pcb_wires=on)
union{
//Signale
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.040000,0.000000,6.480000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.040000,0.000000,22.990000>}
box{<0,0,-0.304800><16.510000,0.035000,0.304800> rotate<0,90.000000,0> translate<2.040000,0.000000,22.990000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.040000,0.000000,6.480000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.310000,0.000000,5.210000>}
box{<0,0,-0.304800><1.796051,0.035000,0.304800> rotate<0,44.997030,0> translate<2.040000,0.000000,6.480000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.040000,0.000000,22.990000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.310000,0.000000,24.260000>}
box{<0,0,-0.304800><1.796051,0.035000,0.304800> rotate<0,-44.997030,0> translate<2.040000,0.000000,22.990000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.310000,0.000000,24.260000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.580000,0.000000,24.260000>}
box{<0,0,-0.304800><1.270000,0.035000,0.304800> rotate<0,0.000000,0> translate<3.310000,0.000000,24.260000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.580000,0.000000,24.260000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.660000,0.000000,24.260000>}
box{<0,0,-0.203200><1.080000,0.035000,0.203200> rotate<0,0.000000,0> translate<4.580000,0.000000,24.260000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.580000,0.000000,7.750000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.850000,0.000000,9.020000>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,-44.997030,0> translate<4.580000,0.000000,7.750000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.580000,0.000000,10.290000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.850000,0.000000,11.560000>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,-44.997030,0> translate<4.580000,0.000000,10.290000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.580000,0.000000,12.830000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.850000,0.000000,14.100000>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,-44.997030,0> translate<4.580000,0.000000,12.830000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.580000,0.000000,15.370000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.850000,0.000000,16.640000>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,-44.997030,0> translate<4.580000,0.000000,15.370000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.120000,0.000000,19.180000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.120000,0.000000,21.400000>}
box{<0,0,-0.203200><2.220000,0.035000,0.203200> rotate<0,90.000000,0> translate<7.120000,0.000000,21.400000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.580000,0.000000,21.720000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.440000,0.000000,21.720000>}
box{<0,0,-0.203200><2.860000,0.035000,0.203200> rotate<0,0.000000,0> translate<4.580000,0.000000,21.720000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.120000,0.000000,21.400000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.440000,0.000000,21.720000>}
box{<0,0,-0.203200><0.452548,0.035000,0.203200> rotate<0,-44.997030,0> translate<7.120000,0.000000,21.400000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.120000,0.000000,19.180000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.390000,0.000000,17.910000>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,44.997030,0> translate<7.120000,0.000000,19.180000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.340000,0.000000,21.720000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.340000,0.000000,25.210000>}
box{<0,0,-0.203200><3.490000,0.035000,0.203200> rotate<0,90.000000,0> translate<9.340000,0.000000,25.210000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.310000,0.000000,5.210000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.660000,0.000000,5.210000>}
box{<0,0,-0.304800><6.350000,0.035000,0.304800> rotate<0,0.000000,0> translate<3.310000,0.000000,5.210000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.120000,0.000000,7.750000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.930000,0.000000,7.750000>}
box{<0,0,-0.203200><3.810000,0.035000,0.203200> rotate<0,0.000000,0> translate<7.120000,0.000000,7.750000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.850000,0.000000,9.020000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.930000,0.000000,9.020000>}
box{<0,0,-0.203200><5.080000,0.035000,0.203200> rotate<0,0.000000,0> translate<5.850000,0.000000,9.020000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.120000,0.000000,10.290000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.930000,0.000000,10.290000>}
box{<0,0,-0.203200><3.810000,0.035000,0.203200> rotate<0,0.000000,0> translate<7.120000,0.000000,10.290000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.850000,0.000000,11.560000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.930000,0.000000,11.560000>}
box{<0,0,-0.203200><5.080000,0.035000,0.203200> rotate<0,0.000000,0> translate<5.850000,0.000000,11.560000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.120000,0.000000,12.830000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.930000,0.000000,12.830000>}
box{<0,0,-0.203200><3.810000,0.035000,0.203200> rotate<0,0.000000,0> translate<7.120000,0.000000,12.830000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.850000,0.000000,14.100000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.930000,0.000000,14.100000>}
box{<0,0,-0.203200><5.080000,0.035000,0.203200> rotate<0,0.000000,0> translate<5.850000,0.000000,14.100000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.120000,0.000000,15.370000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.930000,0.000000,15.370000>}
box{<0,0,-0.203200><3.810000,0.035000,0.203200> rotate<0,0.000000,0> translate<7.120000,0.000000,15.370000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.850000,0.000000,16.640000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.930000,0.000000,16.640000>}
box{<0,0,-0.203200><5.080000,0.035000,0.203200> rotate<0,0.000000,0> translate<5.850000,0.000000,16.640000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.390000,0.000000,17.910000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.930000,0.000000,17.910000>}
box{<0,0,-0.203200><2.540000,0.035000,0.203200> rotate<0,0.000000,0> translate<8.390000,0.000000,17.910000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.340000,0.000000,25.210000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.930000,0.000000,26.800000>}
box{<0,0,-0.203200><2.248600,0.035000,0.203200> rotate<0,-44.997030,0> translate<9.340000,0.000000,25.210000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.930000,0.000000,15.370000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.225000,0.000000,15.075000>}
box{<0,0,-0.203200><0.417193,0.035000,0.203200> rotate<0,44.997030,0> translate<10.930000,0.000000,15.370000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.930000,0.000000,14.100000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.255000,0.000000,14.425000>}
box{<0,0,-0.203200><0.459619,0.035000,0.203200> rotate<0,-44.997030,0> translate<10.930000,0.000000,14.100000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.930000,0.000000,16.640000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.845000,0.000000,15.725000>}
box{<0,0,-0.203200><1.294005,0.035000,0.203200> rotate<0,44.997030,0> translate<10.930000,0.000000,16.640000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.930000,0.000000,12.830000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.875000,0.000000,13.775000>}
box{<0,0,-0.203200><1.336432,0.035000,0.203200> rotate<0,-44.997030,0> translate<10.930000,0.000000,12.830000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.200000,0.000000,24.260000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.200000,0.000000,19.180000>}
box{<0,0,-0.203200><5.080000,0.035000,0.203200> rotate<0,-90.000000,0> translate<12.200000,0.000000,19.180000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.660000,0.000000,24.260000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.200000,0.000000,30.800000>}
box{<0,0,-0.203200><9.248957,0.035000,0.203200> rotate<0,-44.997030,0> translate<5.660000,0.000000,24.260000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.200000,0.000000,30.800000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.200000,0.000000,31.880000>}
box{<0,0,-0.203200><1.080000,0.035000,0.203200> rotate<0,90.000000,0> translate<12.200000,0.000000,31.880000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.930000,0.000000,17.910000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.465000,0.000000,16.375000>}
box{<0,0,-0.203200><2.170818,0.035000,0.203200> rotate<0,44.997030,0> translate<10.930000,0.000000,17.910000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.930000,0.000000,11.560000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.495000,0.000000,13.125000>}
box{<0,0,-0.203200><2.213244,0.035000,0.203200> rotate<0,-44.997030,0> translate<10.930000,0.000000,11.560000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.930000,0.000000,10.290000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.115000,0.000000,12.475000>}
box{<0,0,-0.203200><3.090057,0.035000,0.203200> rotate<0,-44.997030,0> translate<10.930000,0.000000,10.290000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.660000,0.000000,5.210000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.470000,0.000000,9.020000>}
box{<0,0,-0.304800><5.388154,0.035000,0.304800> rotate<0,-44.997030,0> translate<9.660000,0.000000,5.210000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.470000,0.000000,5.210000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.470000,0.000000,9.020000>}
box{<0,0,-0.304800><3.810000,0.035000,0.304800> rotate<0,90.000000,0> translate<13.470000,0.000000,9.020000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.930000,0.000000,9.020000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.735000,0.000000,11.825000>}
box{<0,0,-0.203200><3.966869,0.035000,0.203200> rotate<0,-44.997030,0> translate<10.930000,0.000000,9.020000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.930000,0.000000,7.750000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.355000,0.000000,11.175000>}
box{<0,0,-0.203200><4.843681,0.035000,0.203200> rotate<0,-44.997030,0> translate<10.930000,0.000000,7.750000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.200000,0.000000,19.180000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.355000,0.000000,17.025000>}
box{<0,0,-0.203200><3.047630,0.035000,0.203200> rotate<0,44.997030,0> translate<12.200000,0.000000,19.180000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.740000,0.000000,19.180000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.740000,0.000000,20.450000>}
box{<0,0,-0.203200><1.270000,0.035000,0.203200> rotate<0,90.000000,0> translate<14.740000,0.000000,20.450000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.470000,0.000000,9.020000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.875000,0.000000,10.425000>}
box{<0,0,-0.304800><1.986970,0.035000,0.304800> rotate<0,-44.997030,0> translate<13.470000,0.000000,9.020000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.000000,0.000000,7.800000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.000000,0.000000,5.220000>}
box{<0,0,-0.203200><2.580000,0.035000,0.203200> rotate<0,-90.000000,0> translate<16.000000,0.000000,5.220000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.000000,0.000000,5.220000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.010000,0.000000,5.210000>}
box{<0,0,-0.203200><0.014142,0.035000,0.203200> rotate<0,44.997030,0> translate<16.000000,0.000000,5.220000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.740000,0.000000,20.450000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.010000,0.000000,21.720000>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,-44.997030,0> translate<14.740000,0.000000,20.450000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.200000,0.000000,24.260000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.010000,0.000000,24.260000>}
box{<0,0,-0.203200><3.810000,0.035000,0.203200> rotate<0,0.000000,0> translate<12.200000,0.000000,24.260000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.930000,0.000000,26.800000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.010000,0.000000,26.800000>}
box{<0,0,-0.203200><5.080000,0.035000,0.203200> rotate<0,0.000000,0> translate<10.930000,0.000000,26.800000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.740000,0.000000,19.180000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.145000,0.000000,17.775000>}
box{<0,0,-0.203200><1.986970,0.035000,0.203200> rotate<0,44.997030,0> translate<14.740000,0.000000,19.180000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.875000,0.000000,10.425000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.820000,0.000000,10.425000>}
box{<0,0,-0.304800><1.945000,0.035000,0.304800> rotate<0,0.000000,0> translate<14.875000,0.000000,10.425000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.355000,0.000000,11.175000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.820000,0.000000,11.175000>}
box{<0,0,-0.203200><2.465000,0.035000,0.203200> rotate<0,0.000000,0> translate<14.355000,0.000000,11.175000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.735000,0.000000,11.825000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.820000,0.000000,11.825000>}
box{<0,0,-0.203200><3.085000,0.035000,0.203200> rotate<0,0.000000,0> translate<13.735000,0.000000,11.825000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.115000,0.000000,12.475000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.820000,0.000000,12.475000>}
box{<0,0,-0.203200><3.705000,0.035000,0.203200> rotate<0,0.000000,0> translate<13.115000,0.000000,12.475000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.495000,0.000000,13.125000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.820000,0.000000,13.125000>}
box{<0,0,-0.203200><4.325000,0.035000,0.203200> rotate<0,0.000000,0> translate<12.495000,0.000000,13.125000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.875000,0.000000,13.775000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.820000,0.000000,13.775000>}
box{<0,0,-0.203200><4.945000,0.035000,0.203200> rotate<0,0.000000,0> translate<11.875000,0.000000,13.775000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.255000,0.000000,14.425000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.820000,0.000000,14.425000>}
box{<0,0,-0.203200><5.565000,0.035000,0.203200> rotate<0,0.000000,0> translate<11.255000,0.000000,14.425000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.225000,0.000000,15.075000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.820000,0.000000,15.075000>}
box{<0,0,-0.203200><5.595000,0.035000,0.203200> rotate<0,0.000000,0> translate<11.225000,0.000000,15.075000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.845000,0.000000,15.725000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.820000,0.000000,15.725000>}
box{<0,0,-0.203200><4.975000,0.035000,0.203200> rotate<0,0.000000,0> translate<11.845000,0.000000,15.725000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.465000,0.000000,16.375000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.820000,0.000000,16.375000>}
box{<0,0,-0.203200><4.355000,0.035000,0.203200> rotate<0,0.000000,0> translate<12.465000,0.000000,16.375000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.355000,0.000000,17.025000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.820000,0.000000,17.025000>}
box{<0,0,-0.203200><2.465000,0.035000,0.203200> rotate<0,0.000000,0> translate<14.355000,0.000000,17.025000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.145000,0.000000,17.775000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.820000,0.000000,17.775000>}
box{<0,0,-0.203200><0.675000,0.035000,0.203200> rotate<0,0.000000,0> translate<16.145000,0.000000,17.775000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.000000,0.000000,7.800000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.200000,0.000000,9.000000>}
box{<0,0,-0.203200><1.697056,0.035000,0.203200> rotate<0,-44.997030,0> translate<16.000000,0.000000,7.800000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.010000,0.000000,21.720000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.280000,0.000000,21.720000>}
box{<0,0,-0.203200><1.270000,0.035000,0.203200> rotate<0,0.000000,0> translate<16.010000,0.000000,21.720000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.280000,0.000000,21.720000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.550000,0.000000,22.990000>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,-44.997030,0> translate<17.280000,0.000000,21.720000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.550000,0.000000,22.990000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.550000,0.000000,24.260000>}
box{<0,0,-0.203200><1.270000,0.035000,0.203200> rotate<0,90.000000,0> translate<18.550000,0.000000,24.260000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.010000,0.000000,26.800000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.550000,0.000000,26.800000>}
box{<0,0,-0.203200><2.540000,0.035000,0.203200> rotate<0,0.000000,0> translate<16.010000,0.000000,26.800000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.550000,0.000000,24.260000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.660000,0.000000,24.260000>}
box{<0,0,-0.203200><3.110000,0.035000,0.203200> rotate<0,0.000000,0> translate<18.550000,0.000000,24.260000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.550000,0.000000,26.800000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.000000,0.000000,26.800000>}
box{<0,0,-0.203200><4.450000,0.035000,0.203200> rotate<0,0.000000,0> translate<18.550000,0.000000,26.800000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.820000,0.000000,17.775000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.495000,0.000000,17.775000>}
box{<0,0,-0.203200><0.675000,0.035000,0.203200> rotate<0,0.000000,0> translate<22.820000,0.000000,17.775000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.000000,0.000000,26.800000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.630000,0.000000,26.170000>}
box{<0,0,-0.203200><0.890955,0.035000,0.203200> rotate<0,44.997030,0> translate<23.000000,0.000000,26.800000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.630000,0.000000,21.720000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.630000,0.000000,26.170000>}
box{<0,0,-0.203200><4.450000,0.035000,0.203200> rotate<0,90.000000,0> translate<23.630000,0.000000,26.170000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.200000,0.000000,9.000000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.100000,0.000000,9.000000>}
box{<0,0,-0.203200><6.900000,0.035000,0.203200> rotate<0,0.000000,0> translate<17.200000,0.000000,9.000000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.820000,0.000000,10.425000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.765000,0.000000,10.425000>}
box{<0,0,-0.203200><1.945000,0.035000,0.203200> rotate<0,0.000000,0> translate<22.820000,0.000000,10.425000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.495000,0.000000,17.775000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.900000,0.000000,19.180000>}
box{<0,0,-0.203200><1.986970,0.035000,0.203200> rotate<0,-44.997030,0> translate<23.495000,0.000000,17.775000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.630000,0.000000,21.720000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.900000,0.000000,20.450000>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,44.997030,0> translate<23.630000,0.000000,21.720000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.900000,0.000000,19.180000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.900000,0.000000,20.450000>}
box{<0,0,-0.203200><1.270000,0.035000,0.203200> rotate<0,90.000000,0> translate<24.900000,0.000000,20.450000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.820000,0.000000,11.175000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.285000,0.000000,11.175000>}
box{<0,0,-0.203200><2.465000,0.035000,0.203200> rotate<0,0.000000,0> translate<22.820000,0.000000,11.175000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.820000,0.000000,11.825000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.905000,0.000000,11.825000>}
box{<0,0,-0.203200><3.085000,0.035000,0.203200> rotate<0,0.000000,0> translate<22.820000,0.000000,11.825000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.000000,0.000000,26.800000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.170000,0.000000,26.800000>}
box{<0,0,-0.203200><3.170000,0.035000,0.203200> rotate<0,0.000000,0> translate<23.000000,0.000000,26.800000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.820000,0.000000,12.475000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.525000,0.000000,12.475000>}
box{<0,0,-0.203200><3.705000,0.035000,0.203200> rotate<0,0.000000,0> translate<22.820000,0.000000,12.475000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.820000,0.000000,13.125000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.145000,0.000000,13.125000>}
box{<0,0,-0.203200><4.325000,0.035000,0.203200> rotate<0,0.000000,0> translate<22.820000,0.000000,13.125000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.820000,0.000000,13.775000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.765000,0.000000,13.775000>}
box{<0,0,-0.203200><4.945000,0.035000,0.203200> rotate<0,0.000000,0> translate<22.820000,0.000000,13.775000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.820000,0.000000,17.025000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.825000,0.000000,17.025000>}
box{<0,0,-0.203200><5.005000,0.035000,0.203200> rotate<0,0.000000,0> translate<22.820000,0.000000,17.025000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.100000,0.000000,9.000000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.890000,0.000000,5.210000>}
box{<0,0,-0.203200><5.359869,0.035000,0.203200> rotate<0,44.997030,0> translate<24.100000,0.000000,9.000000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.820000,0.000000,14.425000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.385000,0.000000,14.425000>}
box{<0,0,-0.203200><5.565000,0.035000,0.203200> rotate<0,0.000000,0> translate<22.820000,0.000000,14.425000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.820000,0.000000,16.375000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.445000,0.000000,16.375000>}
box{<0,0,-0.203200><5.625000,0.035000,0.203200> rotate<0,0.000000,0> translate<22.820000,0.000000,16.375000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.765000,0.000000,10.425000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.710000,0.000000,6.480000>}
box{<0,0,-0.203200><5.579073,0.035000,0.203200> rotate<0,44.997030,0> translate<24.765000,0.000000,10.425000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.285000,0.000000,11.175000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.710000,0.000000,7.750000>}
box{<0,0,-0.203200><4.843681,0.035000,0.203200> rotate<0,44.997030,0> translate<25.285000,0.000000,11.175000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.905000,0.000000,11.825000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.710000,0.000000,9.020000>}
box{<0,0,-0.203200><3.966869,0.035000,0.203200> rotate<0,44.997030,0> translate<25.905000,0.000000,11.825000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.525000,0.000000,12.475000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.710000,0.000000,10.290000>}
box{<0,0,-0.203200><3.090057,0.035000,0.203200> rotate<0,44.997030,0> translate<26.525000,0.000000,12.475000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.145000,0.000000,13.125000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.710000,0.000000,11.560000>}
box{<0,0,-0.203200><2.213244,0.035000,0.203200> rotate<0,44.997030,0> translate<27.145000,0.000000,13.125000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.765000,0.000000,13.775000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.710000,0.000000,12.830000>}
box{<0,0,-0.203200><1.336432,0.035000,0.203200> rotate<0,44.997030,0> translate<27.765000,0.000000,13.775000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.385000,0.000000,14.425000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.710000,0.000000,14.100000>}
box{<0,0,-0.203200><0.459619,0.035000,0.203200> rotate<0,44.997030,0> translate<28.385000,0.000000,14.425000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.170000,0.000000,24.260000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.980000,0.000000,24.260000>}
box{<0,0,-0.203200><3.810000,0.035000,0.203200> rotate<0,0.000000,0> translate<26.170000,0.000000,24.260000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.820000,0.000000,15.725000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.335000,0.000000,15.725000>}
box{<0,0,-0.203200><7.515000,0.035000,0.203200> rotate<0,0.000000,0> translate<22.820000,0.000000,15.725000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.445000,0.000000,16.375000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.250000,0.000000,19.180000>}
box{<0,0,-0.203200><3.966869,0.035000,0.203200> rotate<0,-44.997030,0> translate<28.445000,0.000000,16.375000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.980000,0.000000,31.880000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.320000,0.000000,31.880000>}
box{<0,0,-0.203200><1.340000,0.035000,0.203200> rotate<0,0.000000,0> translate<29.980000,0.000000,31.880000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.335000,0.000000,15.725000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.550000,0.000000,16.940000>}
box{<0,0,-0.203200><1.718269,0.035000,0.203200> rotate<0,-44.997030,0> translate<30.335000,0.000000,15.725000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.320000,0.000000,31.880000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.890000,0.000000,31.310000>}
box{<0,0,-0.203200><0.806102,0.035000,0.203200> rotate<0,44.997030,0> translate<31.320000,0.000000,31.880000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.890000,0.000000,28.820000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.890000,0.000000,31.310000>}
box{<0,0,-0.203200><2.490000,0.035000,0.203200> rotate<0,90.000000,0> translate<31.890000,0.000000,31.310000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.170000,0.000000,26.800000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.990000,0.000000,26.800000>}
box{<0,0,-0.203200><5.820000,0.035000,0.203200> rotate<0,0.000000,0> translate<26.170000,0.000000,26.800000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.890000,0.000000,26.920000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.990000,0.000000,26.800000>}
box{<0,0,-0.203200><0.156205,0.035000,0.203200> rotate<0,50.191116,0> translate<31.890000,0.000000,26.920000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.820000,0.000000,15.075000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.225000,0.000000,15.075000>}
box{<0,0,-0.203200><9.405000,0.035000,0.203200> rotate<0,0.000000,0> translate<22.820000,0.000000,15.075000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.710000,0.000000,7.750000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.520000,0.000000,7.750000>}
box{<0,0,-0.203200><3.810000,0.035000,0.203200> rotate<0,0.000000,0> translate<28.710000,0.000000,7.750000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.710000,0.000000,10.290000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.520000,0.000000,10.290000>}
box{<0,0,-0.203200><3.810000,0.035000,0.203200> rotate<0,0.000000,0> translate<28.710000,0.000000,10.290000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.710000,0.000000,12.830000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.520000,0.000000,12.830000>}
box{<0,0,-0.203200><3.810000,0.035000,0.203200> rotate<0,0.000000,0> translate<28.710000,0.000000,12.830000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.225000,0.000000,15.075000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.520000,0.000000,15.370000>}
box{<0,0,-0.203200><0.417193,0.035000,0.203200> rotate<0,-44.997030,0> translate<32.225000,0.000000,15.075000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.825000,0.000000,17.025000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.520000,0.000000,21.720000>}
box{<0,0,-0.203200><6.639733,0.035000,0.203200> rotate<0,-44.997030,0> translate<27.825000,0.000000,17.025000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.710000,0.000000,6.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.790000,0.000000,6.480000>}
box{<0,0,-0.203200><5.080000,0.035000,0.203200> rotate<0,0.000000,0> translate<28.710000,0.000000,6.480000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.710000,0.000000,9.020000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.790000,0.000000,9.020000>}
box{<0,0,-0.203200><5.080000,0.035000,0.203200> rotate<0,0.000000,0> translate<28.710000,0.000000,9.020000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.710000,0.000000,11.560000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.790000,0.000000,11.560000>}
box{<0,0,-0.203200><5.080000,0.035000,0.203200> rotate<0,0.000000,0> translate<28.710000,0.000000,11.560000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.710000,0.000000,14.100000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.790000,0.000000,14.100000>}
box{<0,0,-0.203200><5.080000,0.035000,0.203200> rotate<0,0.000000,0> translate<28.710000,0.000000,14.100000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.250000,0.000000,19.180000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.660000,0.000000,19.180000>}
box{<0,0,-0.203200><3.410000,0.035000,0.203200> rotate<0,0.000000,0> translate<31.250000,0.000000,19.180000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.520000,0.000000,21.720000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.660000,0.000000,21.720000>}
box{<0,0,-0.203200><2.140000,0.035000,0.203200> rotate<0,0.000000,0> translate<32.520000,0.000000,21.720000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.990000,0.000000,26.800000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.730000,0.000000,26.800000>}
box{<0,0,-0.203200><2.740000,0.035000,0.203200> rotate<0,0.000000,0> translate<31.990000,0.000000,26.800000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.790000,0.000000,6.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.060000,0.000000,7.750000>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,-44.997030,0> translate<33.790000,0.000000,6.480000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.790000,0.000000,9.020000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.060000,0.000000,10.290000>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,-44.997030,0> translate<33.790000,0.000000,9.020000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.790000,0.000000,11.560000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.060000,0.000000,12.830000>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,-44.997030,0> translate<33.790000,0.000000,11.560000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.790000,0.000000,14.100000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.060000,0.000000,15.370000>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,-44.997030,0> translate<33.790000,0.000000,14.100000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.980000,0.000000,24.260000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.430000,0.000000,24.260000>}
box{<0,0,-0.203200><5.450000,0.035000,0.203200> rotate<0,0.000000,0> translate<29.980000,0.000000,24.260000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.550000,0.000000,16.940000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.630000,0.000000,16.940000>}
box{<0,0,-0.203200><5.080000,0.035000,0.203200> rotate<0,0.000000,0> translate<31.550000,0.000000,16.940000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.890000,0.000000,5.210000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.600000,0.000000,5.210000>}
box{<0,0,-0.203200><9.710000,0.035000,0.203200> rotate<0,0.000000,0> translate<27.890000,0.000000,5.210000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.630000,0.000000,16.940000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.600000,0.000000,17.910000>}
box{<0,0,-0.203200><1.371787,0.035000,0.203200> rotate<0,-44.997030,0> translate<36.630000,0.000000,16.940000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.430000,0.000000,24.260000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.600000,0.000000,22.090000>}
box{<0,0,-0.203200><3.068843,0.035000,0.203200> rotate<0,44.997030,0> translate<35.430000,0.000000,24.260000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.600000,0.000000,17.910000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.600000,0.000000,22.090000>}
box{<0,0,-0.203200><4.180000,0.035000,0.203200> rotate<0,90.000000,0> translate<37.600000,0.000000,22.090000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.600000,0.000000,5.210000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.870000,0.000000,6.480000>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,-44.997030,0> translate<37.600000,0.000000,5.210000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.730000,0.000000,26.800000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.870000,0.000000,22.660000>}
box{<0,0,-0.203200><5.854844,0.035000,0.203200> rotate<0,44.997030,0> translate<34.730000,0.000000,26.800000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.870000,0.000000,6.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.870000,0.000000,22.660000>}
box{<0,0,-0.203200><16.180000,0.035000,0.203200> rotate<0,90.000000,0> translate<38.870000,0.000000,22.660000> }
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
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,1.219197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,27.100372>}
box{<0,0,-0.203200><25.881175,0.035000,0.203200> rotate<0,90.000000,0> translate<1.219197,0.000000,27.100372> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,1.219197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.957175,0.000000,1.219197>}
box{<0,0,-0.203200><17.737978,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,1.219197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,1.219200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.957172,0.000000,1.219200>}
box{<0,0,-0.203200><17.737975,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,1.219200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,1.625600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.680091,0.000000,1.625600>}
box{<0,0,-0.203200><17.460894,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,1.625600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,2.032000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.403009,0.000000,2.032000>}
box{<0,0,-0.203200><17.183812,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,2.032000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,2.438400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.196816,0.000000,2.438400>}
box{<0,0,-0.203200><16.977619,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,2.438400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,2.844800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.071459,0.000000,2.844800>}
box{<0,0,-0.203200><16.852262,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,2.844800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,3.251200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.232619,0.000000,3.251200>}
box{<0,0,-0.203200><12.013422,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,3.251200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,3.657600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.537244,0.000000,3.657600>}
box{<0,0,-0.203200><11.318047,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,3.657600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.312825,0.000000,4.064000>}
box{<0,0,-0.203200><11.093628,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,4.470400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.250797,0.000000,4.470400>}
box{<0,0,-0.203200><11.031600,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,4.470400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.250797,0.000000,4.876800>}
box{<0,0,-0.203200><11.031600,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,5.283200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.250800,0.000000,5.283200>}
box{<0,0,-0.203200><11.031603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,5.283200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,5.689600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.250800,0.000000,5.689600>}
box{<0,0,-0.203200><11.031603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,5.689600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.255244,0.000000,6.096000>}
box{<0,0,-0.203200><11.036047,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.371913,0.000000,6.502400>}
box{<0,0,-0.203200><11.152716,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.768831,0.000000,6.908800>}
box{<0,0,-0.203200><2.549634,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.411600,0.000000,7.315200>}
box{<0,0,-0.203200><2.192403,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,7.721600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.411600,0.000000,7.721600>}
box{<0,0,-0.203200><2.192403,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,7.721600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.411600,0.000000,8.128000>}
box{<0,0,-0.203200><2.192403,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.712034,0.000000,8.534400>}
box{<0,0,-0.203200><2.492838,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,8.940800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.908700,0.000000,8.940800>}
box{<0,0,-0.203200><3.689503,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,8.940800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,9.347200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.870431,0.000000,9.347200>}
box{<0,0,-0.203200><2.651234,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,9.347200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.464031,0.000000,9.753600>}
box{<0,0,-0.203200><2.244834,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.411600,0.000000,10.160000>}
box{<0,0,-0.203200><2.192403,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,10.566400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.411600,0.000000,10.566400>}
box{<0,0,-0.203200><2.192403,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,10.566400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.610434,0.000000,10.972800>}
box{<0,0,-0.203200><2.391237,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,11.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.016834,0.000000,11.379200>}
box{<0,0,-0.203200><2.797638,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,11.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,11.785600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.972031,0.000000,11.785600>}
box{<0,0,-0.203200><2.752834,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,11.785600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.565631,0.000000,12.192000>}
box{<0,0,-0.203200><2.346434,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,12.598400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.411600,0.000000,12.598400>}
box{<0,0,-0.203200><2.192403,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,12.598400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,13.004800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.411600,0.000000,13.004800>}
box{<0,0,-0.203200><2.192403,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,13.004800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.508834,0.000000,13.411200>}
box{<0,0,-0.203200><2.289638,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,13.817600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.915234,0.000000,13.817600>}
box{<0,0,-0.203200><2.696038,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,13.817600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.073631,0.000000,14.224000>}
box{<0,0,-0.203200><2.854434,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.667231,0.000000,14.630400>}
box{<0,0,-0.203200><2.448034,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.411600,0.000000,15.036800>}
box{<0,0,-0.203200><2.192403,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.411600,0.000000,15.443200>}
box{<0,0,-0.203200><2.192403,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.411600,0.000000,15.849600>}
box{<0,0,-0.203200><2.192403,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.813634,0.000000,16.256000>}
box{<0,0,-0.203200><2.594438,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.010297,0.000000,16.662400>}
box{<0,0,-0.203200><3.791100,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.416697,0.000000,17.068800>}
box{<0,0,-0.203200><4.197500,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,17.475200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.962694,0.000000,17.475200>}
box{<0,0,-0.203200><6.743497,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,17.475200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.556294,0.000000,17.881600>}
box{<0,0,-0.203200><6.337097,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.149894,0.000000,18.288000>}
box{<0,0,-0.203200><5.930697,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.743494,0.000000,18.694400>}
box{<0,0,-0.203200><5.524297,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,19.100800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.510400,0.000000,19.100800>}
box{<0,0,-0.203200><5.291203,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,19.100800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.510400,0.000000,19.507200>}
box{<0,0,-0.203200><5.291203,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,19.913600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.510400,0.000000,19.913600>}
box{<0,0,-0.203200><5.291203,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,19.913600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.510400,0.000000,20.320000>}
box{<0,0,-0.203200><5.291203,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.163581,0.000000,20.726400>}
box{<0,0,-0.203200><1.944384,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,21.132800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.796556,0.000000,21.132800>}
box{<0,0,-0.203200><1.577359,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,21.132800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,21.539200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.649600,0.000000,21.539200>}
box{<0,0,-0.203200><1.430403,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,21.539200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.649600,0.000000,21.945600>}
box{<0,0,-0.203200><1.430403,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.815119,0.000000,22.352000>}
box{<0,0,-0.203200><1.595922,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,22.758400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.271750,0.000000,22.758400>}
box{<0,0,-0.203200><2.052553,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,22.758400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.281928,0.000000,23.164800>}
box{<0,0,-0.203200><2.062731,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,23.571200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.811428,0.000000,23.571200>}
box{<0,0,-0.203200><1.592231,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,23.571200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,23.977600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.628328,0.000000,23.977600>}
box{<0,0,-0.203200><1.409131,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,23.977600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.603244,0.000000,24.384000>}
box{<0,0,-0.203200><1.384047,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,24.790400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.719912,0.000000,24.790400>}
box{<0,0,-0.203200><1.500716,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,24.790400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,25.196800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.033175,0.000000,25.196800>}
box{<0,0,-0.203200><1.813978,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,25.196800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.871100,0.000000,25.603200>}
box{<0,0,-0.203200><7.651903,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,26.009600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.553278,0.000000,26.009600>}
box{<0,0,-0.203200><2.334081,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,26.009600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.191884,0.000000,26.416000>}
box{<0,0,-0.203200><0.972687,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.567759,0.000000,26.822400>}
box{<0,0,-0.203200><0.348563,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,27.100372>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.966397,0.000000,26.504497>}
box{<0,0,-0.203200><0.955706,0.035000,0.203200> rotate<0,38.569018,0> translate<1.219197,0.000000,27.100372> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.966397,0.000000,26.504497>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.966400,0.000000,26.504497>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,0.000000,0> translate<1.966397,0.000000,26.504497> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.966400,0.000000,26.504497>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.150456,0.000000,26.039788>}
box{<0,0,-0.203200><1.271984,0.035000,0.203200> rotate<0,21.427222,0> translate<1.966400,0.000000,26.504497> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.598797,0.000000,24.310800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.598800,0.000000,24.355953>}
box{<0,0,-0.203200><0.045153,0.035000,0.203200> rotate<0,-89.990095,0> translate<2.598797,0.000000,24.310800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.598797,0.000000,24.310800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.529178,0.000000,24.310800>}
box{<0,0,-0.203200><1.930381,0.035000,0.203200> rotate<0,0.000000,0> translate<2.598797,0.000000,24.310800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.598800,0.000000,24.164044>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.628822,0.000000,23.974500>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,80.994332,0> translate<2.598800,0.000000,24.164044> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.598800,0.000000,24.209194>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.598800,0.000000,24.164044>}
box{<0,0,-0.203200><0.045150,0.035000,0.203200> rotate<0,-90.000000,0> translate<2.598800,0.000000,24.164044> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.598800,0.000000,24.209194>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.529178,0.000000,24.209194>}
box{<0,0,-0.203200><1.930378,0.035000,0.203200> rotate<0,0.000000,0> translate<2.598800,0.000000,24.209194> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.598800,0.000000,24.355953>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.628822,0.000000,24.545497>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,-80.994332,0> translate<2.598800,0.000000,24.355953> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.628822,0.000000,23.974500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.688122,0.000000,23.791988>}
box{<0,0,-0.203200><0.191904,0.035000,0.203200> rotate<0,71.995789,0> translate<2.628822,0.000000,23.974500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.628822,0.000000,24.545497>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.688122,0.000000,24.728009>}
box{<0,0,-0.203200><0.191904,0.035000,0.203200> rotate<0,-71.995789,0> translate<2.628822,0.000000,24.545497> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.649600,0.000000,21.487588>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.827478,0.000000,21.058153>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,67.495479,0> translate<2.649600,0.000000,21.487588> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.649600,0.000000,21.952409>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.649600,0.000000,21.487588>}
box{<0,0,-0.203200><0.464822,0.035000,0.203200> rotate<0,-90.000000,0> translate<2.649600,0.000000,21.487588> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.649600,0.000000,21.952409>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.827478,0.000000,22.381844>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,-67.495479,0> translate<2.649600,0.000000,21.952409> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.688122,0.000000,23.791988>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.775247,0.000000,23.621000>}
box{<0,0,-0.203200><0.191905,0.035000,0.203200> rotate<0,62.995173,0> translate<2.688122,0.000000,23.791988> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.688122,0.000000,24.728009>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.775247,0.000000,24.898997>}
box{<0,0,-0.203200><0.191905,0.035000,0.203200> rotate<0,-62.995173,0> translate<2.688122,0.000000,24.728009> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.775247,0.000000,23.621000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.888047,0.000000,23.465744>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,53.996501,0> translate<2.775247,0.000000,23.621000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.775247,0.000000,24.898997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.888047,0.000000,25.054253>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,-53.996501,0> translate<2.775247,0.000000,24.898997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.827478,0.000000,21.058153>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.156153,0.000000,20.729478>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,44.997030,0> translate<2.827478,0.000000,21.058153> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.827478,0.000000,22.381844>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.156153,0.000000,22.710519>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,-44.997030,0> translate<2.827478,0.000000,22.381844> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.888047,0.000000,23.465744>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.023744,0.000000,23.330047>}
box{<0,0,-0.203200><0.191904,0.035000,0.203200> rotate<0,44.997030,0> translate<2.888047,0.000000,23.465744> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.888047,0.000000,25.054253>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.023744,0.000000,25.189950>}
box{<0,0,-0.203200><0.191904,0.035000,0.203200> rotate<0,-44.997030,0> translate<2.888047,0.000000,25.054253> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.023744,0.000000,23.330047>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.179000,0.000000,23.217247>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,35.997559,0> translate<3.023744,0.000000,23.330047> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.023744,0.000000,25.189950>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.179000,0.000000,25.302750>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,-35.997559,0> translate<3.023744,0.000000,25.189950> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.150456,0.000000,26.039788>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.150459,0.000000,26.039788>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,0.000000,0> translate<3.150456,0.000000,26.039788> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.150459,0.000000,26.039788>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.418884,0.000000,25.944731>}
box{<0,0,-0.203200><1.271982,0.035000,0.203200> rotate<0,4.285474,0> translate<3.150459,0.000000,26.039788> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.156153,0.000000,20.729478>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.585588,0.000000,20.551600>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,22.498581,0> translate<3.156153,0.000000,20.729478> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.156153,0.000000,22.710519>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.585588,0.000000,22.888397>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,-22.498581,0> translate<3.156153,0.000000,22.710519> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.179000,0.000000,23.217247>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.349988,0.000000,23.130122>}
box{<0,0,-0.203200><0.191905,0.035000,0.203200> rotate<0,26.998888,0> translate<3.179000,0.000000,23.217247> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.179000,0.000000,25.302750>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.349988,0.000000,25.389875>}
box{<0,0,-0.203200><0.191905,0.035000,0.203200> rotate<0,-26.998888,0> translate<3.179000,0.000000,25.302750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.349988,0.000000,23.130122>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.532500,0.000000,23.070822>}
box{<0,0,-0.203200><0.191904,0.035000,0.203200> rotate<0,17.998271,0> translate<3.349988,0.000000,23.130122> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.349988,0.000000,25.389875>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.532500,0.000000,25.449175>}
box{<0,0,-0.203200><0.191904,0.035000,0.203200> rotate<0,-17.998271,0> translate<3.349988,0.000000,25.389875> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.411600,0.000000,7.266031>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.096031,0.000000,6.581600>}
box{<0,0,-0.203200><0.967932,0.035000,0.203200> rotate<0,44.997030,0> translate<3.411600,0.000000,7.266031> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.411600,0.000000,8.233966>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.411600,0.000000,7.266031>}
box{<0,0,-0.203200><0.967934,0.035000,0.203200> rotate<0,-90.000000,0> translate<3.411600,0.000000,7.266031> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.411600,0.000000,8.233966>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.096031,0.000000,8.918397>}
box{<0,0,-0.203200><0.967932,0.035000,0.203200> rotate<0,-44.997030,0> translate<3.411600,0.000000,8.233966> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.411600,0.000000,9.806031>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.096031,0.000000,9.121600>}
box{<0,0,-0.203200><0.967932,0.035000,0.203200> rotate<0,44.997030,0> translate<3.411600,0.000000,9.806031> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.411600,0.000000,10.773966>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.411600,0.000000,9.806031>}
box{<0,0,-0.203200><0.967934,0.035000,0.203200> rotate<0,-90.000000,0> translate<3.411600,0.000000,9.806031> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.411600,0.000000,10.773966>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.096031,0.000000,11.458397>}
box{<0,0,-0.203200><0.967932,0.035000,0.203200> rotate<0,-44.997030,0> translate<3.411600,0.000000,10.773966> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.411600,0.000000,12.346031>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.096031,0.000000,11.661600>}
box{<0,0,-0.203200><0.967932,0.035000,0.203200> rotate<0,44.997030,0> translate<3.411600,0.000000,12.346031> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.411600,0.000000,13.313966>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.411600,0.000000,12.346031>}
box{<0,0,-0.203200><0.967934,0.035000,0.203200> rotate<0,-90.000000,0> translate<3.411600,0.000000,12.346031> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.411600,0.000000,13.313966>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.096031,0.000000,13.998397>}
box{<0,0,-0.203200><0.967932,0.035000,0.203200> rotate<0,-44.997030,0> translate<3.411600,0.000000,13.313966> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.411600,0.000000,14.886031>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.096031,0.000000,14.201600>}
box{<0,0,-0.203200><0.967932,0.035000,0.203200> rotate<0,44.997030,0> translate<3.411600,0.000000,14.886031> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.411600,0.000000,15.853966>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.411600,0.000000,14.886031>}
box{<0,0,-0.203200><0.967934,0.035000,0.203200> rotate<0,-90.000000,0> translate<3.411600,0.000000,14.886031> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.411600,0.000000,15.853966>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.096031,0.000000,16.538397>}
box{<0,0,-0.203200><0.967932,0.035000,0.203200> rotate<0,-44.997030,0> translate<3.411600,0.000000,15.853966> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.532500,0.000000,23.070822>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.722044,0.000000,23.040800>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,8.999729,0> translate<3.532500,0.000000,23.070822> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.532500,0.000000,25.449175>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.722044,0.000000,25.479197>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,-8.999729,0> translate<3.532500,0.000000,25.449175> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.585588,0.000000,20.551600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.574409,0.000000,20.551600>}
box{<0,0,-0.203200><1.988822,0.035000,0.203200> rotate<0,0.000000,0> translate<3.585588,0.000000,20.551600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.585588,0.000000,22.888397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.574409,0.000000,22.888397>}
box{<0,0,-0.203200><1.988822,0.035000,0.203200> rotate<0,0.000000,0> translate<3.585588,0.000000,22.888397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.722044,0.000000,23.040800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.529194,0.000000,23.040800>}
box{<0,0,-0.203200><0.807150,0.035000,0.203200> rotate<0,0.000000,0> translate<3.722044,0.000000,23.040800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.722044,0.000000,25.479197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.529194,0.000000,25.479197>}
box{<0,0,-0.203200><0.807150,0.035000,0.203200> rotate<0,0.000000,0> translate<3.722044,0.000000,25.479197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.096031,0.000000,6.581600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.063966,0.000000,6.581600>}
box{<0,0,-0.203200><0.967934,0.035000,0.203200> rotate<0,0.000000,0> translate<4.096031,0.000000,6.581600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.096031,0.000000,8.918397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.886297,0.000000,8.918397>}
box{<0,0,-0.203200><0.790266,0.035000,0.203200> rotate<0,0.000000,0> translate<4.096031,0.000000,8.918397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.096031,0.000000,9.121600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.063966,0.000000,9.121600>}
box{<0,0,-0.203200><0.967934,0.035000,0.203200> rotate<0,0.000000,0> translate<4.096031,0.000000,9.121600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.096031,0.000000,11.458397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.886294,0.000000,11.458397>}
box{<0,0,-0.203200><0.790262,0.035000,0.203200> rotate<0,0.000000,0> translate<4.096031,0.000000,11.458397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.096031,0.000000,11.661600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.063966,0.000000,11.661600>}
box{<0,0,-0.203200><0.967934,0.035000,0.203200> rotate<0,0.000000,0> translate<4.096031,0.000000,11.661600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.096031,0.000000,13.998397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.886294,0.000000,13.998397>}
box{<0,0,-0.203200><0.790262,0.035000,0.203200> rotate<0,0.000000,0> translate<4.096031,0.000000,13.998397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.096031,0.000000,14.201600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.063966,0.000000,14.201600>}
box{<0,0,-0.203200><0.967934,0.035000,0.203200> rotate<0,0.000000,0> translate<4.096031,0.000000,14.201600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.096031,0.000000,16.538397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.886294,0.000000,16.538397>}
box{<0,0,-0.203200><0.790262,0.035000,0.203200> rotate<0,0.000000,0> translate<4.096031,0.000000,16.538397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.418884,0.000000,25.944731>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.418888,0.000000,25.944731>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,0.000000,0> translate<4.418884,0.000000,25.944731> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.418888,0.000000,25.944731>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.658978,0.000000,26.227775>}
box{<0,0,-0.203200><1.271982,0.035000,0.203200> rotate<0,-12.856345,0> translate<4.418888,0.000000,25.944731> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.529178,0.000000,24.310800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.529178,0.000000,24.209194>}
box{<0,0,-0.203200><0.101606,0.035000,0.203200> rotate<0,-90.000000,0> translate<4.529178,0.000000,24.209194> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.529194,0.000000,23.040800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.529194,0.000000,24.209178>}
box{<0,0,-0.203200><1.168378,0.035000,0.203200> rotate<0,90.000000,0> translate<4.529194,0.000000,24.209178> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.529194,0.000000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.630800,0.000000,23.164800>}
box{<0,0,-0.203200><0.101606,0.035000,0.203200> rotate<0,0.000000,0> translate<4.529194,0.000000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.529194,0.000000,23.571200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.630800,0.000000,23.571200>}
box{<0,0,-0.203200><0.101606,0.035000,0.203200> rotate<0,0.000000,0> translate<4.529194,0.000000,23.571200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.529194,0.000000,23.977600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.630800,0.000000,23.977600>}
box{<0,0,-0.203200><0.101606,0.035000,0.203200> rotate<0,0.000000,0> translate<4.529194,0.000000,23.977600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.529194,0.000000,24.209178>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.630800,0.000000,24.209178>}
box{<0,0,-0.203200><0.101606,0.035000,0.203200> rotate<0,0.000000,0> translate<4.529194,0.000000,24.209178> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.529194,0.000000,24.310819>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.529194,0.000000,25.479197>}
box{<0,0,-0.203200><1.168378,0.035000,0.203200> rotate<0,90.000000,0> translate<4.529194,0.000000,25.479197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.529194,0.000000,24.310819>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.630800,0.000000,24.310819>}
box{<0,0,-0.203200><0.101606,0.035000,0.203200> rotate<0,0.000000,0> translate<4.529194,0.000000,24.310819> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.529194,0.000000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.630800,0.000000,24.384000>}
box{<0,0,-0.203200><0.101606,0.035000,0.203200> rotate<0,0.000000,0> translate<4.529194,0.000000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.529194,0.000000,24.790400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.630800,0.000000,24.790400>}
box{<0,0,-0.203200><0.101606,0.035000,0.203200> rotate<0,0.000000,0> translate<4.529194,0.000000,24.790400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.529194,0.000000,25.196800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.630800,0.000000,25.196800>}
box{<0,0,-0.203200><0.101606,0.035000,0.203200> rotate<0,0.000000,0> translate<4.529194,0.000000,25.196800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.630800,0.000000,23.040797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.437953,0.000000,23.040800>}
box{<0,0,-0.203200><0.807153,0.035000,0.203200> rotate<0,-0.000222,0> translate<4.630800,0.000000,23.040797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.630800,0.000000,24.209178>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.630800,0.000000,23.040797>}
box{<0,0,-0.203200><1.168381,0.035000,0.203200> rotate<0,-90.000000,0> translate<4.630800,0.000000,23.040797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.630800,0.000000,25.479194>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.630800,0.000000,24.310819>}
box{<0,0,-0.203200><1.168375,0.035000,0.203200> rotate<0,-90.000000,0> translate<4.630800,0.000000,24.310819> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.630800,0.000000,25.479194>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.437953,0.000000,25.479197>}
box{<0,0,-0.203200><0.807153,0.035000,0.203200> rotate<0,-0.000222,0> translate<4.630800,0.000000,25.479194> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.630819,0.000000,24.209194>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.630819,0.000000,24.310800>}
box{<0,0,-0.203200><0.101606,0.035000,0.203200> rotate<0,90.000000,0> translate<4.630819,0.000000,24.310800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.630819,0.000000,24.209194>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.561197,0.000000,24.209194>}
box{<0,0,-0.203200><1.930378,0.035000,0.203200> rotate<0,0.000000,0> translate<4.630819,0.000000,24.209194> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.630819,0.000000,24.310800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.561194,0.000000,24.310800>}
box{<0,0,-0.203200><1.930375,0.035000,0.203200> rotate<0,0.000000,0> translate<4.630819,0.000000,24.310800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.703094,0.000000,26.009600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.277500,0.000000,26.009600>}
box{<0,0,-0.203200><4.574406,0.035000,0.203200> rotate<0,0.000000,0> translate<4.703094,0.000000,26.009600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.886294,0.000000,11.458397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.504688,0.000000,12.076791>}
box{<0,0,-0.203200><0.874541,0.035000,0.203200> rotate<0,-44.997030,0> translate<4.886294,0.000000,11.458397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.886294,0.000000,13.998397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.504688,0.000000,14.616791>}
box{<0,0,-0.203200><0.874541,0.035000,0.203200> rotate<0,-44.997030,0> translate<4.886294,0.000000,13.998397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.886294,0.000000,16.538397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.504688,0.000000,17.156791>}
box{<0,0,-0.203200><0.874541,0.035000,0.203200> rotate<0,-44.997030,0> translate<4.886294,0.000000,16.538397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.886297,0.000000,8.918397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.504688,0.000000,9.536791>}
box{<0,0,-0.203200><0.874539,0.035000,0.203200> rotate<0,-44.997175,0> translate<4.886297,0.000000,8.918397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.063966,0.000000,6.581600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.748397,0.000000,7.266031>}
box{<0,0,-0.203200><0.967932,0.035000,0.203200> rotate<0,-44.997030,0> translate<5.063966,0.000000,6.581600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.063966,0.000000,9.121600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.748397,0.000000,9.806031>}
box{<0,0,-0.203200><0.967932,0.035000,0.203200> rotate<0,-44.997030,0> translate<5.063966,0.000000,9.121600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.063966,0.000000,11.661600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.748397,0.000000,12.346031>}
box{<0,0,-0.203200><0.967932,0.035000,0.203200> rotate<0,-44.997030,0> translate<5.063966,0.000000,11.661600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.063966,0.000000,14.201600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.748397,0.000000,14.886031>}
box{<0,0,-0.203200><0.967932,0.035000,0.203200> rotate<0,-44.997030,0> translate<5.063966,0.000000,14.201600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.086366,0.000000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.111897,0.000000,14.224000>}
box{<0,0,-0.203200><0.025531,0.035000,0.203200> rotate<0,0.000000,0> translate<5.086366,0.000000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.187966,0.000000,11.785600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.213497,0.000000,11.785600>}
box{<0,0,-0.203200><0.025531,0.035000,0.203200> rotate<0,0.000000,0> translate<5.187966,0.000000,11.785600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.289566,0.000000,9.347200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.315100,0.000000,9.347200>}
box{<0,0,-0.203200><0.025534,0.035000,0.203200> rotate<0,0.000000,0> translate<5.289566,0.000000,9.347200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.391166,0.000000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.308831,0.000000,6.908800>}
box{<0,0,-0.203200><0.917666,0.035000,0.203200> rotate<0,0.000000,0> translate<5.391166,0.000000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.437953,0.000000,23.040800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.627497,0.000000,23.070822>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,-8.999729,0> translate<5.437953,0.000000,23.040800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.437953,0.000000,25.479197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.627497,0.000000,25.449175>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,8.999729,0> translate<5.437953,0.000000,25.479197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.492766,0.000000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.537544,0.000000,14.630400>}
box{<0,0,-0.203200><0.044778,0.035000,0.203200> rotate<0,0.000000,0> translate<5.492766,0.000000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.504688,0.000000,9.536791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.728741,0.000000,9.629597>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<5.504688,0.000000,9.536791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.504688,0.000000,12.076791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.728741,0.000000,12.169597>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<5.504688,0.000000,12.076791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.504688,0.000000,14.616791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.728741,0.000000,14.709597>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<5.504688,0.000000,14.616791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.504688,0.000000,17.156791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.728741,0.000000,17.249597>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<5.504688,0.000000,17.156791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.574409,0.000000,20.551600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.003844,0.000000,20.729478>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,-22.498581,0> translate<5.574409,0.000000,20.551600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.574409,0.000000,22.888397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.003844,0.000000,22.710519>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,22.498581,0> translate<5.574409,0.000000,22.888397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.594366,0.000000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.105631,0.000000,12.192000>}
box{<0,0,-0.203200><0.511266,0.035000,0.203200> rotate<0,0.000000,0> translate<5.594366,0.000000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.627497,0.000000,23.070822>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.810009,0.000000,23.130122>}
box{<0,0,-0.203200><0.191904,0.035000,0.203200> rotate<0,-17.998271,0> translate<5.627497,0.000000,23.070822> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.627497,0.000000,25.449175>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.810009,0.000000,25.389875>}
box{<0,0,-0.203200><0.191904,0.035000,0.203200> rotate<0,17.998271,0> translate<5.627497,0.000000,25.449175> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.658978,0.000000,26.227775>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.658981,0.000000,26.227775>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,0.000000,0> translate<5.658978,0.000000,26.227775> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.658981,0.000000,26.227775>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.760550,0.000000,26.863769>}
box{<0,0,-0.203200><1.271983,0.035000,0.203200> rotate<0,-29.998127,0> translate<5.658981,0.000000,26.227775> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.695966,0.000000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.004031,0.000000,9.753600>}
box{<0,0,-0.203200><0.308066,0.035000,0.203200> rotate<0,0.000000,0> translate<5.695966,0.000000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.728741,0.000000,9.629597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.128038,0.000000,9.629597>}
box{<0,0,-0.203200><0.399297,0.035000,0.203200> rotate<0,0.000000,0> translate<5.728741,0.000000,9.629597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.728741,0.000000,12.169597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.128038,0.000000,12.169597>}
box{<0,0,-0.203200><0.399297,0.035000,0.203200> rotate<0,0.000000,0> translate<5.728741,0.000000,12.169597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.728741,0.000000,14.709597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.128038,0.000000,14.709597>}
box{<0,0,-0.203200><0.399297,0.035000,0.203200> rotate<0,0.000000,0> translate<5.728741,0.000000,14.709597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.728741,0.000000,17.249597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.728300,0.000000,17.249597>}
box{<0,0,-0.203200><4.999559,0.035000,0.203200> rotate<0,0.000000,0> translate<5.728741,0.000000,17.249597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.748397,0.000000,7.266031>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.748397,0.000000,8.056297>}
box{<0,0,-0.203200><0.790266,0.035000,0.203200> rotate<0,90.000000,0> translate<5.748397,0.000000,8.056297> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.748397,0.000000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.951600,0.000000,7.315200>}
box{<0,0,-0.203200><0.203203,0.035000,0.203200> rotate<0,0.000000,0> translate<5.748397,0.000000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.748397,0.000000,7.721600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.951600,0.000000,7.721600>}
box{<0,0,-0.203200><0.203203,0.035000,0.203200> rotate<0,0.000000,0> translate<5.748397,0.000000,7.721600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.748397,0.000000,8.056297>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.102503,0.000000,8.410400>}
box{<0,0,-0.203200><0.500780,0.035000,0.203200> rotate<0,-44.996777,0> translate<5.748397,0.000000,8.056297> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.748397,0.000000,9.806031>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.748397,0.000000,10.596294>}
box{<0,0,-0.203200><0.790263,0.035000,0.203200> rotate<0,90.000000,0> translate<5.748397,0.000000,10.596294> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.748397,0.000000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.951600,0.000000,10.160000>}
box{<0,0,-0.203200><0.203203,0.035000,0.203200> rotate<0,0.000000,0> translate<5.748397,0.000000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.748397,0.000000,10.566400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.951600,0.000000,10.566400>}
box{<0,0,-0.203200><0.203203,0.035000,0.203200> rotate<0,0.000000,0> translate<5.748397,0.000000,10.566400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.748397,0.000000,10.596294>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.102503,0.000000,10.950400>}
box{<0,0,-0.203200><0.500782,0.035000,0.203200> rotate<0,-44.997030,0> translate<5.748397,0.000000,10.596294> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.748397,0.000000,12.346031>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.748397,0.000000,13.136294>}
box{<0,0,-0.203200><0.790262,0.035000,0.203200> rotate<0,90.000000,0> translate<5.748397,0.000000,13.136294> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.748397,0.000000,12.598400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.951600,0.000000,12.598400>}
box{<0,0,-0.203200><0.203203,0.035000,0.203200> rotate<0,0.000000,0> translate<5.748397,0.000000,12.598400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.748397,0.000000,13.004800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.951600,0.000000,13.004800>}
box{<0,0,-0.203200><0.203203,0.035000,0.203200> rotate<0,0.000000,0> translate<5.748397,0.000000,13.004800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.748397,0.000000,13.136294>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.102503,0.000000,13.490400>}
box{<0,0,-0.203200><0.500782,0.035000,0.203200> rotate<0,-44.997030,0> translate<5.748397,0.000000,13.136294> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.748397,0.000000,14.886031>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.748397,0.000000,15.676294>}
box{<0,0,-0.203200><0.790263,0.035000,0.203200> rotate<0,90.000000,0> translate<5.748397,0.000000,15.676294> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.748397,0.000000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.951600,0.000000,15.036800>}
box{<0,0,-0.203200><0.203203,0.035000,0.203200> rotate<0,0.000000,0> translate<5.748397,0.000000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.748397,0.000000,15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.951600,0.000000,15.443200>}
box{<0,0,-0.203200><0.203203,0.035000,0.203200> rotate<0,0.000000,0> translate<5.748397,0.000000,15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.748397,0.000000,15.676294>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.102503,0.000000,16.030400>}
box{<0,0,-0.203200><0.500782,0.035000,0.203200> rotate<0,-44.997030,0> translate<5.748397,0.000000,15.676294> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.810009,0.000000,23.130122>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.980997,0.000000,23.217247>}
box{<0,0,-0.203200><0.191905,0.035000,0.203200> rotate<0,-26.998888,0> translate<5.810009,0.000000,23.130122> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.810009,0.000000,25.389875>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.980997,0.000000,25.302750>}
box{<0,0,-0.203200><0.191905,0.035000,0.203200> rotate<0,26.998888,0> translate<5.810009,0.000000,25.389875> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.820100,0.000000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.951600,0.000000,8.128000>}
box{<0,0,-0.203200><0.131500,0.035000,0.203200> rotate<0,0.000000,0> translate<5.820100,0.000000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.878066,0.000000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.730400,0.000000,23.164800>}
box{<0,0,-0.203200><2.852334,0.035000,0.203200> rotate<0,0.000000,0> translate<5.878066,0.000000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.888250,0.000000,22.758400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.453666,0.000000,22.758400>}
box{<0,0,-0.203200><0.565416,0.035000,0.203200> rotate<0,0.000000,0> translate<5.888250,0.000000,22.758400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.921703,0.000000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.951600,0.000000,15.849600>}
box{<0,0,-0.203200><0.029897,0.035000,0.203200> rotate<0,0.000000,0> translate<5.921703,0.000000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.951600,0.000000,7.266031>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.636031,0.000000,6.581600>}
box{<0,0,-0.203200><0.967932,0.035000,0.203200> rotate<0,44.997030,0> translate<5.951600,0.000000,7.266031> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.951600,0.000000,8.233966>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.951600,0.000000,7.266031>}
box{<0,0,-0.203200><0.967934,0.035000,0.203200> rotate<0,-90.000000,0> translate<5.951600,0.000000,7.266031> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.951600,0.000000,8.233966>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.128038,0.000000,8.410400>}
box{<0,0,-0.203200><0.249518,0.035000,0.203200> rotate<0,-44.996523,0> translate<5.951600,0.000000,8.233966> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.951600,0.000000,9.806031>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.128038,0.000000,9.629597>}
box{<0,0,-0.203200><0.249518,0.035000,0.203200> rotate<0,44.996523,0> translate<5.951600,0.000000,9.806031> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.951600,0.000000,10.773966>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.951600,0.000000,9.806031>}
box{<0,0,-0.203200><0.967934,0.035000,0.203200> rotate<0,-90.000000,0> translate<5.951600,0.000000,9.806031> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.951600,0.000000,10.773966>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.128038,0.000000,10.950400>}
box{<0,0,-0.203200><0.249518,0.035000,0.203200> rotate<0,-44.996523,0> translate<5.951600,0.000000,10.773966> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.951600,0.000000,12.346031>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.128038,0.000000,12.169597>}
box{<0,0,-0.203200><0.249518,0.035000,0.203200> rotate<0,44.996523,0> translate<5.951600,0.000000,12.346031> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.951600,0.000000,13.313966>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.951600,0.000000,12.346031>}
box{<0,0,-0.203200><0.967934,0.035000,0.203200> rotate<0,-90.000000,0> translate<5.951600,0.000000,12.346031> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.951600,0.000000,13.313966>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.128038,0.000000,13.490400>}
box{<0,0,-0.203200><0.249518,0.035000,0.203200> rotate<0,-44.996523,0> translate<5.951600,0.000000,13.313966> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.951600,0.000000,14.886031>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.128038,0.000000,14.709597>}
box{<0,0,-0.203200><0.249518,0.035000,0.203200> rotate<0,44.996523,0> translate<5.951600,0.000000,14.886031> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.951600,0.000000,15.853966>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.951600,0.000000,14.886031>}
box{<0,0,-0.203200><0.967934,0.035000,0.203200> rotate<0,-90.000000,0> translate<5.951600,0.000000,14.886031> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.951600,0.000000,15.853966>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.128038,0.000000,16.030400>}
box{<0,0,-0.203200><0.249518,0.035000,0.203200> rotate<0,-44.996523,0> translate<5.951600,0.000000,15.853966> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.980997,0.000000,23.217247>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.136253,0.000000,23.330047>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,-35.997559,0> translate<5.980997,0.000000,23.217247> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.980997,0.000000,25.302750>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.136253,0.000000,25.189950>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,35.997559,0> translate<5.980997,0.000000,25.302750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.984994,0.000000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.683900,0.000000,26.416000>}
box{<0,0,-0.203200><3.698906,0.035000,0.203200> rotate<0,0.000000,0> translate<5.984994,0.000000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.996412,0.000000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.408863,0.000000,20.726400>}
box{<0,0,-0.203200><0.412450,0.035000,0.203200> rotate<0,0.000000,0> translate<5.996412,0.000000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.003844,0.000000,20.729478>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.332519,0.000000,21.058153>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,-44.997030,0> translate<6.003844,0.000000,20.729478> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.003844,0.000000,22.710519>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.332519,0.000000,22.381844>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,44.997030,0> translate<6.003844,0.000000,22.710519> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.023303,0.000000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.048838,0.000000,13.411200>}
box{<0,0,-0.203200><0.025534,0.035000,0.203200> rotate<0,0.000000,0> translate<6.023303,0.000000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.102503,0.000000,8.410400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.128038,0.000000,8.410400>}
box{<0,0,-0.203200><0.025534,0.035000,0.203200> rotate<0,0.000000,0> translate<6.102503,0.000000,8.410400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.102503,0.000000,10.950400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.128038,0.000000,10.950400>}
box{<0,0,-0.203200><0.025534,0.035000,0.203200> rotate<0,0.000000,0> translate<6.102503,0.000000,10.950400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.102503,0.000000,13.490400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.128038,0.000000,13.490400>}
box{<0,0,-0.203200><0.025534,0.035000,0.203200> rotate<0,0.000000,0> translate<6.102503,0.000000,13.490400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.102503,0.000000,16.030400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.128038,0.000000,16.030400>}
box{<0,0,-0.203200><0.025534,0.035000,0.203200> rotate<0,0.000000,0> translate<6.102503,0.000000,16.030400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.126825,0.000000,25.196800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.730400,0.000000,25.196800>}
box{<0,0,-0.203200><2.603575,0.035000,0.203200> rotate<0,0.000000,0> translate<6.126825,0.000000,25.196800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.136253,0.000000,23.330047>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.271950,0.000000,23.465744>}
box{<0,0,-0.203200><0.191904,0.035000,0.203200> rotate<0,-44.997030,0> translate<6.136253,0.000000,23.330047> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.136253,0.000000,25.189950>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.271950,0.000000,25.054253>}
box{<0,0,-0.203200><0.191904,0.035000,0.203200> rotate<0,44.997030,0> translate<6.136253,0.000000,25.189950> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.271950,0.000000,23.465744>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.384750,0.000000,23.621000>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,-53.996501,0> translate<6.271950,0.000000,23.465744> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.271950,0.000000,25.054253>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.384750,0.000000,24.898997>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,53.996501,0> translate<6.271950,0.000000,25.054253> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.332519,0.000000,21.058153>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.354159,0.000000,21.110400>}
box{<0,0,-0.203200><0.056551,0.035000,0.203200> rotate<0,-67.496237,0> translate<6.332519,0.000000,21.058153> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.332519,0.000000,22.381844>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.354159,0.000000,22.329597>}
box{<0,0,-0.203200><0.056551,0.035000,0.203200> rotate<0,67.496237,0> translate<6.332519,0.000000,22.381844> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.344881,0.000000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.383600,0.000000,22.352000>}
box{<0,0,-0.203200><0.038719,0.035000,0.203200> rotate<0,0.000000,0> translate<6.344881,0.000000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.348566,0.000000,23.571200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.730400,0.000000,23.571200>}
box{<0,0,-0.203200><2.381834,0.035000,0.203200> rotate<0,0.000000,0> translate<6.348566,0.000000,23.571200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.354159,0.000000,21.110400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.383600,0.000000,21.110400>}
box{<0,0,-0.203200><0.029441,0.035000,0.203200> rotate<0,0.000000,0> translate<6.354159,0.000000,21.110400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.354159,0.000000,22.329597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.383600,0.000000,22.329597>}
box{<0,0,-0.203200><0.029441,0.035000,0.203200> rotate<0,0.000000,0> translate<6.354159,0.000000,22.329597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.383600,0.000000,20.751663>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.510400,0.000000,20.624863>}
box{<0,0,-0.203200><0.179322,0.035000,0.203200> rotate<0,44.997030,0> translate<6.383600,0.000000,20.751663> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.383600,0.000000,21.110400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.383600,0.000000,20.751663>}
box{<0,0,-0.203200><0.358738,0.035000,0.203200> rotate<0,-90.000000,0> translate<6.383600,0.000000,20.751663> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.383600,0.000000,22.688334>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.383600,0.000000,22.329597>}
box{<0,0,-0.203200><0.358738,0.035000,0.203200> rotate<0,-90.000000,0> translate<6.383600,0.000000,22.329597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.383600,0.000000,22.688334>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.621663,0.000000,22.926397>}
box{<0,0,-0.203200><0.336671,0.035000,0.203200> rotate<0,-44.997030,0> translate<6.383600,0.000000,22.688334> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.384750,0.000000,23.621000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.471875,0.000000,23.791988>}
box{<0,0,-0.203200><0.191905,0.035000,0.203200> rotate<0,-62.995173,0> translate<6.384750,0.000000,23.621000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.384750,0.000000,24.898997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.471875,0.000000,24.728009>}
box{<0,0,-0.203200><0.191905,0.035000,0.203200> rotate<0,62.995173,0> translate<6.384750,0.000000,24.898997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.440088,0.000000,24.790400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.730400,0.000000,24.790400>}
box{<0,0,-0.203200><2.290313,0.035000,0.203200> rotate<0,0.000000,0> translate<6.440088,0.000000,24.790400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.471875,0.000000,23.791988>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.531175,0.000000,23.974500>}
box{<0,0,-0.203200><0.191904,0.035000,0.203200> rotate<0,-71.995789,0> translate<6.471875,0.000000,23.791988> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.471875,0.000000,24.728009>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.531175,0.000000,24.545497>}
box{<0,0,-0.203200><0.191904,0.035000,0.203200> rotate<0,71.995789,0> translate<6.471875,0.000000,24.728009> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.510400,0.000000,19.058741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.603206,0.000000,18.834688>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<6.510400,0.000000,19.058741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.510400,0.000000,20.624863>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.510400,0.000000,19.058741>}
box{<0,0,-0.203200><1.566122,0.035000,0.203200> rotate<0,-90.000000,0> translate<6.510400,0.000000,19.058741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.531175,0.000000,23.974500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.561197,0.000000,24.164044>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,-80.994332,0> translate<6.531175,0.000000,23.974500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.531175,0.000000,24.545497>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.561197,0.000000,24.355953>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,80.994332,0> translate<6.531175,0.000000,24.545497> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.531666,0.000000,23.977600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.730400,0.000000,23.977600>}
box{<0,0,-0.203200><2.198734,0.035000,0.203200> rotate<0,0.000000,0> translate<6.531666,0.000000,23.977600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.556756,0.000000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.730400,0.000000,24.384000>}
box{<0,0,-0.203200><2.173644,0.035000,0.203200> rotate<0,0.000000,0> translate<6.556756,0.000000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.561194,0.000000,24.310800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.561197,0.000000,24.355953>}
box{<0,0,-0.203200><0.045153,0.035000,0.203200> rotate<0,-89.990095,0> translate<6.561194,0.000000,24.310800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.561197,0.000000,24.164044>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.561197,0.000000,24.209194>}
box{<0,0,-0.203200><0.045150,0.035000,0.203200> rotate<0,90.000000,0> translate<6.561197,0.000000,24.209194> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.603206,0.000000,18.834688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.774688,0.000000,18.663206>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<6.603206,0.000000,18.834688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.621663,0.000000,22.926397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.258334,0.000000,22.926397>}
box{<0,0,-0.203200><1.636672,0.035000,0.203200> rotate<0,0.000000,0> translate<6.621663,0.000000,22.926397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.636031,0.000000,6.581600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.603966,0.000000,6.581600>}
box{<0,0,-0.203200><0.967934,0.035000,0.203200> rotate<0,0.000000,0> translate<6.636031,0.000000,6.581600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.688897,0.000000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.090300,0.000000,26.822400>}
box{<0,0,-0.203200><3.401403,0.035000,0.203200> rotate<0,0.000000,0> translate<6.688897,0.000000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.760550,0.000000,26.863769>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.760553,0.000000,26.863769>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,0.000000,0> translate<6.760550,0.000000,26.863769> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.760553,0.000000,26.863769>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.760553,0.000000,26.863772>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,90.000000,0> translate<6.760553,0.000000,26.863772> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.760553,0.000000,26.863772>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.625725,0.000000,27.796200>}
box{<0,0,-0.203200><1.271985,0.035000,0.203200> rotate<0,-47.139581,0> translate<6.760553,0.000000,26.863772> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.774688,0.000000,18.663206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.044688,0.000000,17.393206>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,44.997030,0> translate<6.774688,0.000000,18.663206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.099250,0.000000,27.228800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.496697,0.000000,27.228800>}
box{<0,0,-0.203200><3.397447,0.035000,0.203200> rotate<0,0.000000,0> translate<7.099250,0.000000,27.228800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.201684,0.000000,33.060800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.625725,0.000000,32.603797>}
box{<0,0,-0.203200><0.623428,0.035000,0.203200> rotate<0,47.139497,0> translate<7.201684,0.000000,33.060800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.201684,0.000000,33.060800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.645116,0.000000,33.060800>}
box{<0,0,-0.203200><28.443431,0.035000,0.203200> rotate<0,0.000000,0> translate<7.201684,0.000000,33.060800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.333816,0.000000,32.918400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.657878,0.000000,32.918400>}
box{<0,0,-0.203200><4.324062,0.035000,0.203200> rotate<0,0.000000,0> translate<7.333816,0.000000,32.918400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.476338,0.000000,27.635200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.192838,0.000000,27.635200>}
box{<0,0,-0.203200><7.716500,0.035000,0.203200> rotate<0,0.000000,0> translate<7.476338,0.000000,27.635200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.603966,0.000000,6.581600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.162766,0.000000,7.140400>}
box{<0,0,-0.203200><0.790263,0.035000,0.203200> rotate<0,-44.997030,0> translate<7.603966,0.000000,6.581600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.625725,0.000000,27.796200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.625725,0.000000,27.796203>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,90.000000,0> translate<7.625725,0.000000,27.796203> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.625725,0.000000,27.796203>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.177619,0.000000,28.942219>}
box{<0,0,-0.203200><1.271982,0.035000,0.203200> rotate<0,-64.281402,0> translate<7.625725,0.000000,27.796203> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.625725,0.000000,32.603794>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.625725,0.000000,32.603797>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,90.000000,0> translate<7.625725,0.000000,32.603797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.625725,0.000000,32.603794>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.177619,0.000000,31.457778>}
box{<0,0,-0.203200><1.271982,0.035000,0.203200> rotate<0,64.281402,0> translate<7.625725,0.000000,32.603794> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.669931,0.000000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.251478,0.000000,32.512000>}
box{<0,0,-0.203200><3.581547,0.035000,0.203200> rotate<0,0.000000,0> translate<7.669931,0.000000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.729597,0.000000,19.432503>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.729597,0.000000,20.513600>}
box{<0,0,-0.203200><1.081097,0.035000,0.203200> rotate<0,90.000000,0> translate<7.729597,0.000000,20.513600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.729597,0.000000,19.432503>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.642503,0.000000,18.519597>}
box{<0,0,-0.203200><1.291044,0.035000,0.203200> rotate<0,44.997030,0> translate<7.729597,0.000000,19.432503> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.729597,0.000000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.590400,0.000000,19.507200>}
box{<0,0,-0.203200><3.860803,0.035000,0.203200> rotate<0,0.000000,0> translate<7.729597,0.000000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.729597,0.000000,19.913600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.590400,0.000000,19.913600>}
box{<0,0,-0.203200><3.860803,0.035000,0.203200> rotate<0,0.000000,0> translate<7.729597,0.000000,19.913600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.729597,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.590400,0.000000,20.320000>}
box{<0,0,-0.203200><3.860803,0.035000,0.203200> rotate<0,0.000000,0> translate<7.729597,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.729597,0.000000,20.513600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.258334,0.000000,20.513600>}
box{<0,0,-0.203200><0.528738,0.035000,0.203200> rotate<0,0.000000,0> translate<7.729597,0.000000,20.513600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.743900,0.000000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.701075,0.000000,28.041600>}
box{<0,0,-0.203200><22.957175,0.035000,0.203200> rotate<0,0.000000,0> translate<7.743900,0.000000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.865644,0.000000,32.105600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.082400,0.000000,32.105600>}
box{<0,0,-0.203200><3.216756,0.035000,0.203200> rotate<0,0.000000,0> translate<7.865644,0.000000,32.105600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.931166,0.000000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.685175,0.000000,6.908800>}
box{<0,0,-0.203200><4.754009,0.035000,0.203200> rotate<0,0.000000,0> translate<7.931166,0.000000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.939612,0.000000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.682800,0.000000,28.448000>}
box{<0,0,-0.203200><22.743188,0.035000,0.203200> rotate<0,0.000000,0> translate<7.939612,0.000000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.044688,0.000000,17.393206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.268741,0.000000,17.300400>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<8.044688,0.000000,17.393206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.061300,0.000000,19.100800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.590400,0.000000,19.100800>}
box{<0,0,-0.203200><3.529100,0.035000,0.203200> rotate<0,0.000000,0> translate<8.061300,0.000000,19.100800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.061356,0.000000,31.699200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.082397,0.000000,31.699200>}
box{<0,0,-0.203200><3.021041,0.035000,0.203200> rotate<0,0.000000,0> translate<8.061356,0.000000,31.699200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.135325,0.000000,28.854400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.768178,0.000000,28.854400>}
box{<0,0,-0.203200><23.632853,0.035000,0.203200> rotate<0,0.000000,0> translate<8.135325,0.000000,28.854400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.162766,0.000000,7.140400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.051256,0.000000,7.140400>}
box{<0,0,-0.203200><2.888491,0.035000,0.203200> rotate<0,0.000000,0> translate<8.162766,0.000000,7.140400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.177619,0.000000,28.942219>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.177619,0.000000,28.942222>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,90.000000,0> translate<8.177619,0.000000,28.942222> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.177619,0.000000,28.942222>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.367197,0.000000,30.199997>}
box{<0,0,-0.203200><1.271982,0.035000,0.203200> rotate<0,-81.423240,0> translate<8.177619,0.000000,28.942222> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.177619,0.000000,31.457775>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.177619,0.000000,31.457778>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,90.000000,0> translate<8.177619,0.000000,31.457778> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.177619,0.000000,31.457775>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.367197,0.000000,30.199997>}
box{<0,0,-0.203200><1.271985,0.035000,0.203200> rotate<0,81.423261,0> translate<8.177619,0.000000,31.457775> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.202488,0.000000,31.292800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.206675,0.000000,31.292800>}
box{<0,0,-0.203200><3.004188,0.035000,0.203200> rotate<0,0.000000,0> translate<8.202488,0.000000,31.292800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.225634,0.000000,29.260800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.682800,0.000000,29.260800>}
box{<0,0,-0.203200><22.457166,0.035000,0.203200> rotate<0,0.000000,0> translate<8.225634,0.000000,29.260800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.258334,0.000000,20.513600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.389997,0.000000,20.645266>}
box{<0,0,-0.203200><0.186201,0.035000,0.203200> rotate<0,-44.997710,0> translate<8.258334,0.000000,20.513600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.258334,0.000000,22.926397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.389997,0.000000,22.794731>}
box{<0,0,-0.203200><0.186201,0.035000,0.203200> rotate<0,44.997710,0> translate<8.258334,0.000000,22.926397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.263741,0.000000,30.886400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.613075,0.000000,30.886400>}
box{<0,0,-0.203200><3.349334,0.035000,0.203200> rotate<0,0.000000,0> translate<8.263741,0.000000,30.886400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.268741,0.000000,17.300400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.677494,0.000000,17.300400>}
box{<0,0,-0.203200><2.408753,0.035000,0.203200> rotate<0,0.000000,0> translate<8.268741,0.000000,17.300400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.286891,0.000000,29.667200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.725925,0.000000,29.667200>}
box{<0,0,-0.203200><22.439034,0.035000,0.203200> rotate<0,0.000000,0> translate<8.286891,0.000000,29.667200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.324994,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.480463,0.000000,30.480000>}
box{<0,0,-0.203200><26.155469,0.035000,0.203200> rotate<0,0.000000,0> translate<8.324994,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.348144,0.000000,30.073600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.480463,0.000000,30.073600>}
box{<0,0,-0.203200><26.132319,0.035000,0.203200> rotate<0,0.000000,0> translate<8.348144,0.000000,30.073600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.389997,0.000000,20.645266>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.521662,0.000000,20.513600>}
box{<0,0,-0.203200><0.186203,0.035000,0.203200> rotate<0,44.997030,0> translate<8.389997,0.000000,20.645266> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.389997,0.000000,22.794731>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.521662,0.000000,22.926397>}
box{<0,0,-0.203200><0.186203,0.035000,0.203200> rotate<0,-44.997030,0> translate<8.389997,0.000000,22.794731> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.467700,0.000000,18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.823494,0.000000,18.694400>}
box{<0,0,-0.203200><3.355794,0.035000,0.203200> rotate<0,0.000000,0> translate<8.467700,0.000000,18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.521662,0.000000,20.513600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.158334,0.000000,20.513600>}
box{<0,0,-0.203200><1.636672,0.035000,0.203200> rotate<0,0.000000,0> translate<8.521662,0.000000,20.513600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.521662,0.000000,22.926397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.730400,0.000000,22.926397>}
box{<0,0,-0.203200><0.208738,0.035000,0.203200> rotate<0,0.000000,0> translate<8.521662,0.000000,22.926397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.642503,0.000000,18.519597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.051256,0.000000,18.519597>}
box{<0,0,-0.203200><2.408753,0.035000,0.203200> rotate<0,0.000000,0> translate<8.642503,0.000000,18.519597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.730400,0.000000,25.331256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.730400,0.000000,22.926397>}
box{<0,0,-0.203200><2.404859,0.035000,0.203200> rotate<0,-90.000000,0> translate<8.730400,0.000000,22.926397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.730400,0.000000,25.331256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.823206,0.000000,25.555309>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<8.730400,0.000000,25.331256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.823206,0.000000,25.555309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.413206,0.000000,27.145306>}
box{<0,0,-0.203200><2.248597,0.035000,0.203200> rotate<0,-44.996974,0> translate<8.823206,0.000000,25.555309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.949597,0.000000,22.926397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.949597,0.000000,24.957494>}
box{<0,0,-0.203200><2.031097,0.035000,0.203200> rotate<0,90.000000,0> translate<9.949597,0.000000,24.957494> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.949597,0.000000,22.926397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.158334,0.000000,22.926397>}
box{<0,0,-0.203200><0.208737,0.035000,0.203200> rotate<0,0.000000,0> translate<9.949597,0.000000,22.926397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.949597,0.000000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.590400,0.000000,23.164800>}
box{<0,0,-0.203200><1.640803,0.035000,0.203200> rotate<0,0.000000,0> translate<9.949597,0.000000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.949597,0.000000,23.571200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.380116,0.000000,23.571200>}
box{<0,0,-0.203200><1.430519,0.035000,0.203200> rotate<0,0.000000,0> translate<9.949597,0.000000,23.571200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.949597,0.000000,23.977600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.133200,0.000000,23.977600>}
box{<0,0,-0.203200><1.183603,0.035000,0.203200> rotate<0,0.000000,0> translate<9.949597,0.000000,23.977600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.949597,0.000000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.133200,0.000000,24.384000>}
box{<0,0,-0.203200><1.183603,0.035000,0.203200> rotate<0,0.000000,0> translate<9.949597,0.000000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.949597,0.000000,24.790400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.221719,0.000000,24.790400>}
box{<0,0,-0.203200><1.272122,0.035000,0.203200> rotate<0,0.000000,0> translate<9.949597,0.000000,24.790400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.949597,0.000000,24.957494>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.182503,0.000000,26.190400>}
box{<0,0,-0.203200><1.743593,0.035000,0.203200> rotate<0,-44.997030,0> translate<9.949597,0.000000,24.957494> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.158334,0.000000,20.513600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.396397,0.000000,20.751663>}
box{<0,0,-0.203200><0.336671,0.035000,0.203200> rotate<0,-44.997030,0> translate<10.158334,0.000000,20.513600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.158334,0.000000,22.926397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.396397,0.000000,22.688334>}
box{<0,0,-0.203200><0.336671,0.035000,0.203200> rotate<0,44.997030,0> translate<10.158334,0.000000,22.926397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.188903,0.000000,25.196800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.628119,0.000000,25.196800>}
box{<0,0,-0.203200><1.439216,0.035000,0.203200> rotate<0,0.000000,0> translate<10.188903,0.000000,25.196800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.326331,0.000000,22.758400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.590400,0.000000,22.758400>}
box{<0,0,-0.203200><1.264069,0.035000,0.203200> rotate<0,0.000000,0> translate<10.326331,0.000000,22.758400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.371134,0.000000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.590400,0.000000,20.726400>}
box{<0,0,-0.203200><1.219266,0.035000,0.203200> rotate<0,0.000000,0> translate<10.371134,0.000000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.396397,0.000000,20.751663>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.396397,0.000000,22.688334>}
box{<0,0,-0.203200><1.936672,0.035000,0.203200> rotate<0,90.000000,0> translate<10.396397,0.000000,22.688334> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.396397,0.000000,21.132800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.590400,0.000000,21.132800>}
box{<0,0,-0.203200><1.194003,0.035000,0.203200> rotate<0,0.000000,0> translate<10.396397,0.000000,21.132800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.396397,0.000000,21.539200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.590400,0.000000,21.539200>}
box{<0,0,-0.203200><1.194003,0.035000,0.203200> rotate<0,0.000000,0> translate<10.396397,0.000000,21.539200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.396397,0.000000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.590400,0.000000,21.945600>}
box{<0,0,-0.203200><1.194003,0.035000,0.203200> rotate<0,0.000000,0> translate<10.396397,0.000000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.396397,0.000000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.590400,0.000000,22.352000>}
box{<0,0,-0.203200><1.194003,0.035000,0.203200> rotate<0,0.000000,0> translate<10.396397,0.000000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.413206,0.000000,27.145309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.413206,0.000000,27.145306>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,-90.000000,0> translate<10.413206,0.000000,27.145306> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.413206,0.000000,27.145309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.584688,0.000000,27.316791>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<10.413206,0.000000,27.145309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.584688,0.000000,27.316791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.808741,0.000000,27.409597>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<10.584688,0.000000,27.316791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.595303,0.000000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.020400,0.000000,25.603200>}
box{<0,0,-0.203200><12.425097,0.035000,0.203200> rotate<0,0.000000,0> translate<10.595303,0.000000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.677494,0.000000,17.300400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.728300,0.000000,17.249597>}
box{<0,0,-0.203200><0.071849,0.035000,0.203200> rotate<0,44.995268,0> translate<10.677494,0.000000,17.300400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.808741,0.000000,27.409597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.967234,0.000000,27.409597>}
box{<0,0,-0.203200><4.158494,0.035000,0.203200> rotate<0,0.000000,0> translate<10.808741,0.000000,27.409597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.001703,0.000000,26.009600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.148031,0.000000,26.009600>}
box{<0,0,-0.203200><4.146328,0.035000,0.203200> rotate<0,0.000000,0> translate<11.001703,0.000000,26.009600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.051256,0.000000,7.140400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.275309,0.000000,7.233206>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<11.051256,0.000000,7.140400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.051256,0.000000,18.519597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.275309,0.000000,18.426791>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<11.051256,0.000000,18.519597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.082397,0.000000,31.879981>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.082400,0.000000,31.417075>}
box{<0,0,-0.203200><0.462906,0.035000,0.203200> rotate<0,89.993674,0> translate<11.082397,0.000000,31.879981> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.082397,0.000000,31.879981>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.199966,0.000000,31.879981>}
box{<0,0,-0.203200><1.117569,0.035000,0.203200> rotate<0,0.000000,0> translate<11.082397,0.000000,31.879981> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.082400,0.000000,31.417075>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.737075,0.000000,30.762400>}
box{<0,0,-0.203200><0.925850,0.035000,0.203200> rotate<0,44.997030,0> translate<11.082400,0.000000,31.417075> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.082400,0.000000,31.880013>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.199966,0.000000,31.880013>}
box{<0,0,-0.203200><1.117566,0.035000,0.203200> rotate<0,0.000000,0> translate<11.082400,0.000000,31.880013> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.082400,0.000000,32.342922>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.082400,0.000000,31.880013>}
box{<0,0,-0.203200><0.462909,0.035000,0.203200> rotate<0,-90.000000,0> translate<11.082400,0.000000,31.880013> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.082400,0.000000,32.342922>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.737075,0.000000,32.997597>}
box{<0,0,-0.203200><0.925850,0.035000,0.203200> rotate<0,-44.997030,0> translate<11.082400,0.000000,32.342922> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.133200,0.000000,23.818116>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.590400,0.000000,23.360919>}
box{<0,0,-0.203200><0.646576,0.035000,0.203200> rotate<0,44.996834,0> translate<11.133200,0.000000,23.818116> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.133200,0.000000,24.701881>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.133200,0.000000,23.818116>}
box{<0,0,-0.203200><0.883766,0.035000,0.203200> rotate<0,-90.000000,0> translate<11.133200,0.000000,23.818116> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.133200,0.000000,24.701881>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.758116,0.000000,25.326797>}
box{<0,0,-0.203200><0.883764,0.035000,0.203200> rotate<0,-44.997030,0> translate<11.133200,0.000000,24.701881> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.182503,0.000000,26.190400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.967234,0.000000,26.190400>}
box{<0,0,-0.203200><3.784731,0.035000,0.203200> rotate<0,0.000000,0> translate<11.182503,0.000000,26.190400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.275309,0.000000,7.233206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.446791,0.000000,7.404688>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<11.275309,0.000000,7.233206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.275309,0.000000,18.426791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.446791,0.000000,18.255309>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<11.275309,0.000000,18.426791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.357303,0.000000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.390400,0.000000,7.315200>}
box{<0,0,-0.203200><4.033097,0.035000,0.203200> rotate<0,0.000000,0> translate<11.357303,0.000000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.414100,0.000000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.229894,0.000000,18.288000>}
box{<0,0,-0.203200><0.815794,0.035000,0.203200> rotate<0,0.000000,0> translate<11.414100,0.000000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.446791,0.000000,7.404688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.607503,0.000000,10.565400>}
box{<0,0,-0.203200><4.469922,0.035000,0.203200> rotate<0,-44.997030,0> translate<11.446791,0.000000,7.404688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.446791,0.000000,18.255309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.717503,0.000000,16.984597>}
box{<0,0,-0.203200><1.797059,0.035000,0.203200> rotate<0,44.997030,0> translate<11.446791,0.000000,18.255309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.590400,0.000000,19.058741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.683206,0.000000,18.834688>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<11.590400,0.000000,19.058741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.590400,0.000000,23.360919>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.590400,0.000000,19.058741>}
box{<0,0,-0.203200><4.302178,0.035000,0.203200> rotate<0,-90.000000,0> translate<11.590400,0.000000,19.058741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.683206,0.000000,18.834688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.854688,0.000000,18.663206>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<11.683206,0.000000,18.834688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.737075,0.000000,30.762400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.199981,0.000000,30.762400>}
box{<0,0,-0.203200><0.462906,0.035000,0.203200> rotate<0,0.000000,0> translate<11.737075,0.000000,30.762400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.737075,0.000000,32.997597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.199981,0.000000,32.997597>}
box{<0,0,-0.203200><0.462906,0.035000,0.203200> rotate<0,0.000000,0> translate<11.737075,0.000000,32.997597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.758116,0.000000,25.326797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.641881,0.000000,25.326797>}
box{<0,0,-0.203200><0.883766,0.035000,0.203200> rotate<0,0.000000,0> translate<11.758116,0.000000,25.326797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.763703,0.000000,7.721600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.390400,0.000000,7.721600>}
box{<0,0,-0.203200><3.626697,0.035000,0.203200> rotate<0,0.000000,0> translate<11.763703,0.000000,7.721600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.820500,0.000000,17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.636294,0.000000,17.881600>}
box{<0,0,-0.203200><0.815794,0.035000,0.203200> rotate<0,0.000000,0> translate<11.820500,0.000000,17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.854688,0.000000,18.663206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.533300,0.000000,16.984597>}
box{<0,0,-0.203200><2.373914,0.035000,0.203200> rotate<0,44.996977,0> translate<11.854688,0.000000,18.663206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.170103,0.000000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.476038,0.000000,8.128000>}
box{<0,0,-0.203200><3.305934,0.035000,0.203200> rotate<0,0.000000,0> translate<12.170103,0.000000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.199966,0.000000,31.880013>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.199966,0.000000,31.879981>}
box{<0,0,-0.203200><0.000031,0.035000,0.203200> rotate<0,-90.000000,0> translate<12.199966,0.000000,31.879981> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.199981,0.000000,30.762400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.199981,0.000000,31.879966>}
box{<0,0,-0.203200><1.117566,0.035000,0.203200> rotate<0,90.000000,0> translate<12.199981,0.000000,31.879966> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.199981,0.000000,30.886400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.200012,0.000000,30.886400>}
box{<0,0,-0.203200><0.000031,0.035000,0.203200> rotate<0,0.000000,0> translate<12.199981,0.000000,30.886400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.199981,0.000000,31.292800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.200012,0.000000,31.292800>}
box{<0,0,-0.203200><0.000031,0.035000,0.203200> rotate<0,0.000000,0> translate<12.199981,0.000000,31.292800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.199981,0.000000,31.699200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.200012,0.000000,31.699200>}
box{<0,0,-0.203200><0.000031,0.035000,0.203200> rotate<0,0.000000,0> translate<12.199981,0.000000,31.699200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.199981,0.000000,31.879966>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.200012,0.000000,31.879966>}
box{<0,0,-0.203200><0.000031,0.035000,0.203200> rotate<0,0.000000,0> translate<12.199981,0.000000,31.879966> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.199981,0.000000,31.880031>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.199981,0.000000,32.997597>}
box{<0,0,-0.203200><1.117566,0.035000,0.203200> rotate<0,90.000000,0> translate<12.199981,0.000000,32.997597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.199981,0.000000,31.880031>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.200012,0.000000,31.880031>}
box{<0,0,-0.203200><0.000031,0.035000,0.203200> rotate<0,0.000000,0> translate<12.199981,0.000000,31.880031> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.199981,0.000000,32.105600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.200012,0.000000,32.105600>}
box{<0,0,-0.203200><0.000031,0.035000,0.203200> rotate<0,0.000000,0> translate<12.199981,0.000000,32.105600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.199981,0.000000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.200012,0.000000,32.512000>}
box{<0,0,-0.203200><0.000031,0.035000,0.203200> rotate<0,0.000000,0> translate<12.199981,0.000000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.199981,0.000000,32.918400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.200012,0.000000,32.918400>}
box{<0,0,-0.203200><0.000031,0.035000,0.203200> rotate<0,0.000000,0> translate<12.199981,0.000000,32.918400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.200012,0.000000,30.762400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.662922,0.000000,30.762400>}
box{<0,0,-0.203200><0.462909,0.035000,0.203200> rotate<0,0.000000,0> translate<12.200012,0.000000,30.762400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.200012,0.000000,31.879966>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.200012,0.000000,30.762400>}
box{<0,0,-0.203200><1.117566,0.035000,0.203200> rotate<0,-90.000000,0> translate<12.200012,0.000000,30.762400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.200012,0.000000,32.997597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.200012,0.000000,31.880031>}
box{<0,0,-0.203200><1.117566,0.035000,0.203200> rotate<0,-90.000000,0> translate<12.200012,0.000000,31.880031> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.200012,0.000000,32.997597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.662922,0.000000,32.997597>}
box{<0,0,-0.203200><0.462909,0.035000,0.203200> rotate<0,0.000000,0> translate<12.200012,0.000000,32.997597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.200031,0.000000,31.879981>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.200031,0.000000,31.880013>}
box{<0,0,-0.203200><0.000031,0.035000,0.203200> rotate<0,90.000000,0> translate<12.200031,0.000000,31.880013> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.200031,0.000000,31.879981>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.317594,0.000000,31.879981>}
box{<0,0,-0.203200><1.117563,0.035000,0.203200> rotate<0,0.000000,0> translate<12.200031,0.000000,31.879981> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.200031,0.000000,31.880013>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.317597,0.000000,31.880013>}
box{<0,0,-0.203200><1.117566,0.035000,0.203200> rotate<0,0.000000,0> translate<12.200031,0.000000,31.880013> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.226900,0.000000,17.475200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.042694,0.000000,17.475200>}
box{<0,0,-0.203200><0.815794,0.035000,0.203200> rotate<0,0.000000,0> translate<12.226900,0.000000,17.475200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.250797,0.000000,5.159194>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.250800,0.000000,4.352044>}
box{<0,0,-0.203200><0.807150,0.035000,0.203200> rotate<0,89.993839,0> translate<12.250797,0.000000,5.159194> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.250797,0.000000,5.159194>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.419178,0.000000,5.159194>}
box{<0,0,-0.203200><1.168381,0.035000,0.203200> rotate<0,0.000000,0> translate<12.250797,0.000000,5.159194> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.250800,0.000000,4.352044>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.280822,0.000000,4.162500>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,80.994332,0> translate<12.250800,0.000000,4.352044> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.250800,0.000000,5.260800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.419178,0.000000,5.260800>}
box{<0,0,-0.203200><1.168378,0.035000,0.203200> rotate<0,0.000000,0> translate<12.250800,0.000000,5.260800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.250800,0.000000,6.067953>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.250800,0.000000,5.260800>}
box{<0,0,-0.203200><0.807153,0.035000,0.203200> rotate<0,-90.000000,0> translate<12.250800,0.000000,5.260800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.250800,0.000000,6.067953>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.280822,0.000000,6.257497>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,-80.994332,0> translate<12.250800,0.000000,6.067953> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.280822,0.000000,4.162500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.340122,0.000000,3.979988>}
box{<0,0,-0.203200><0.191904,0.035000,0.203200> rotate<0,71.995789,0> translate<12.280822,0.000000,4.162500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.280822,0.000000,6.257497>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.340122,0.000000,6.440009>}
box{<0,0,-0.203200><0.191904,0.035000,0.203200> rotate<0,-71.995789,0> translate<12.280822,0.000000,6.257497> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.340122,0.000000,3.979988>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.427247,0.000000,3.809000>}
box{<0,0,-0.203200><0.191905,0.035000,0.203200> rotate<0,62.995173,0> translate<12.340122,0.000000,3.979988> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.340122,0.000000,6.440009>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.427247,0.000000,6.610997>}
box{<0,0,-0.203200><0.191905,0.035000,0.203200> rotate<0,-62.995173,0> translate<12.340122,0.000000,6.440009> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.427247,0.000000,3.809000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.540047,0.000000,3.653744>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,53.996501,0> translate<12.427247,0.000000,3.809000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.427247,0.000000,6.610997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.540047,0.000000,6.766253>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,-53.996501,0> translate<12.427247,0.000000,6.610997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.540047,0.000000,3.653744>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.675744,0.000000,3.518047>}
box{<0,0,-0.203200><0.191904,0.035000,0.203200> rotate<0,44.997030,0> translate<12.540047,0.000000,3.653744> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.540047,0.000000,6.766253>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.675744,0.000000,6.901950>}
box{<0,0,-0.203200><0.191904,0.035000,0.203200> rotate<0,-44.997030,0> translate<12.540047,0.000000,6.766253> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.576503,0.000000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.872300,0.000000,8.534400>}
box{<0,0,-0.203200><3.295797,0.035000,0.203200> rotate<0,0.000000,0> translate<12.576503,0.000000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.633300,0.000000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.449094,0.000000,17.068800>}
box{<0,0,-0.203200><0.815794,0.035000,0.203200> rotate<0,0.000000,0> translate<12.633300,0.000000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.641881,0.000000,25.326797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.099078,0.000000,24.869597>}
box{<0,0,-0.203200><0.646576,0.035000,0.203200> rotate<0,44.997226,0> translate<12.641881,0.000000,25.326797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.662922,0.000000,30.762400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.317597,0.000000,31.417075>}
box{<0,0,-0.203200><0.925850,0.035000,0.203200> rotate<0,-44.997030,0> translate<12.662922,0.000000,30.762400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.662922,0.000000,32.997597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.317597,0.000000,32.342922>}
box{<0,0,-0.203200><0.925850,0.035000,0.203200> rotate<0,44.997030,0> translate<12.662922,0.000000,32.997597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.675744,0.000000,3.518047>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.831000,0.000000,3.405247>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,35.997559,0> translate<12.675744,0.000000,3.518047> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.675744,0.000000,6.901950>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.831000,0.000000,7.014750>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,-35.997559,0> translate<12.675744,0.000000,6.901950> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.717503,0.000000,16.984597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.533300,0.000000,16.984597>}
box{<0,0,-0.203200><0.815797,0.035000,0.203200> rotate<0,0.000000,0> translate<12.717503,0.000000,16.984597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.742119,0.000000,32.918400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.117878,0.000000,32.918400>}
box{<0,0,-0.203200><8.375759,0.035000,0.203200> rotate<0,0.000000,0> translate<12.742119,0.000000,32.918400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.771878,0.000000,25.196800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.294438,0.000000,25.196800>}
box{<0,0,-0.203200><2.522559,0.035000,0.203200> rotate<0,0.000000,0> translate<12.771878,0.000000,25.196800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.786922,0.000000,30.886400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.073075,0.000000,30.886400>}
box{<0,0,-0.203200><8.286153,0.035000,0.203200> rotate<0,0.000000,0> translate<12.786922,0.000000,30.886400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.809597,0.000000,19.432503>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.809597,0.000000,23.360919>}
box{<0,0,-0.203200><3.928416,0.035000,0.203200> rotate<0,90.000000,0> translate<12.809597,0.000000,23.360919> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.809597,0.000000,19.432503>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.607503,0.000000,17.634597>}
box{<0,0,-0.203200><2.542623,0.035000,0.203200> rotate<0,44.997030,0> translate<12.809597,0.000000,19.432503> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.809597,0.000000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.130400,0.000000,19.507200>}
box{<0,0,-0.203200><1.320803,0.035000,0.203200> rotate<0,0.000000,0> translate<12.809597,0.000000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.809597,0.000000,19.913600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.130400,0.000000,19.913600>}
box{<0,0,-0.203200><1.320803,0.035000,0.203200> rotate<0,0.000000,0> translate<12.809597,0.000000,19.913600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.809597,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.130400,0.000000,20.320000>}
box{<0,0,-0.203200><1.320803,0.035000,0.203200> rotate<0,0.000000,0> translate<12.809597,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.809597,0.000000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.194666,0.000000,20.726400>}
box{<0,0,-0.203200><1.385069,0.035000,0.203200> rotate<0,0.000000,0> translate<12.809597,0.000000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.809597,0.000000,21.132800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.560697,0.000000,21.132800>}
box{<0,0,-0.203200><1.751100,0.035000,0.203200> rotate<0,0.000000,0> translate<12.809597,0.000000,21.132800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.809597,0.000000,21.539200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.967097,0.000000,21.539200>}
box{<0,0,-0.203200><2.157500,0.035000,0.203200> rotate<0,0.000000,0> translate<12.809597,0.000000,21.539200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.809597,0.000000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.373497,0.000000,21.945600>}
box{<0,0,-0.203200><2.563900,0.035000,0.203200> rotate<0,0.000000,0> translate<12.809597,0.000000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.809597,0.000000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.049897,0.000000,22.352000>}
box{<0,0,-0.203200><4.240300,0.035000,0.203200> rotate<0,0.000000,0> translate<12.809597,0.000000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.809597,0.000000,22.758400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.456297,0.000000,22.758400>}
box{<0,0,-0.203200><4.646700,0.035000,0.203200> rotate<0,0.000000,0> translate<12.809597,0.000000,22.758400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.809597,0.000000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.452831,0.000000,23.164800>}
box{<0,0,-0.203200><2.643234,0.035000,0.203200> rotate<0,0.000000,0> translate<12.809597,0.000000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.809597,0.000000,23.360919>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.099078,0.000000,23.650400>}
box{<0,0,-0.203200><0.409388,0.035000,0.203200> rotate<0,-44.997030,0> translate<12.809597,0.000000,23.360919> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.831000,0.000000,3.405247>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.001988,0.000000,3.318122>}
box{<0,0,-0.203200><0.191905,0.035000,0.203200> rotate<0,26.998888,0> translate<12.831000,0.000000,3.405247> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.831000,0.000000,7.014750>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.001988,0.000000,7.101875>}
box{<0,0,-0.203200><0.191905,0.035000,0.203200> rotate<0,-26.998888,0> translate<12.831000,0.000000,7.014750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.982903,0.000000,8.940800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.278700,0.000000,8.940800>}
box{<0,0,-0.203200><3.295797,0.035000,0.203200> rotate<0,0.000000,0> translate<12.982903,0.000000,8.940800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.001988,0.000000,3.318122>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.184500,0.000000,3.258822>}
box{<0,0,-0.203200><0.191904,0.035000,0.203200> rotate<0,17.998271,0> translate<13.001988,0.000000,3.318122> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.001988,0.000000,7.101875>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.184500,0.000000,7.161175>}
box{<0,0,-0.203200><0.191904,0.035000,0.203200> rotate<0,-17.998271,0> translate<13.001988,0.000000,7.101875> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.019878,0.000000,23.571200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.046431,0.000000,23.571200>}
box{<0,0,-0.203200><2.026553,0.035000,0.203200> rotate<0,0.000000,0> translate<13.019878,0.000000,23.571200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.099078,0.000000,23.650400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.967234,0.000000,23.650400>}
box{<0,0,-0.203200><1.868156,0.035000,0.203200> rotate<0,0.000000,0> translate<13.099078,0.000000,23.650400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.099078,0.000000,24.869597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.967234,0.000000,24.869597>}
box{<0,0,-0.203200><1.868156,0.035000,0.203200> rotate<0,0.000000,0> translate<13.099078,0.000000,24.869597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.141300,0.000000,19.100800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.130400,0.000000,19.100800>}
box{<0,0,-0.203200><0.989100,0.035000,0.203200> rotate<0,0.000000,0> translate<13.141300,0.000000,19.100800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.148519,0.000000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.711478,0.000000,32.512000>}
box{<0,0,-0.203200><7.562959,0.035000,0.203200> rotate<0,0.000000,0> translate<13.148519,0.000000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.184500,0.000000,3.258822>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.374044,0.000000,3.228800>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,8.999729,0> translate<13.184500,0.000000,3.258822> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.184500,0.000000,7.161175>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.374044,0.000000,7.191197>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,-8.999729,0> translate<13.184500,0.000000,7.161175> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.193322,0.000000,31.292800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.666675,0.000000,31.292800>}
box{<0,0,-0.203200><7.473353,0.035000,0.203200> rotate<0,0.000000,0> translate<13.193322,0.000000,31.292800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.317594,0.000000,31.879981>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.317597,0.000000,31.417075>}
box{<0,0,-0.203200><0.462906,0.035000,0.203200> rotate<0,89.993674,0> translate<13.317594,0.000000,31.879981> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.317597,0.000000,31.699200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.542397,0.000000,31.699200>}
box{<0,0,-0.203200><7.224800,0.035000,0.203200> rotate<0,0.000000,0> translate<13.317597,0.000000,31.699200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.317597,0.000000,31.880013>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.317597,0.000000,32.342922>}
box{<0,0,-0.203200><0.462909,0.035000,0.203200> rotate<0,90.000000,0> translate<13.317597,0.000000,32.342922> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.317597,0.000000,32.105600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.542400,0.000000,32.105600>}
box{<0,0,-0.203200><7.224803,0.035000,0.203200> rotate<0,0.000000,0> translate<13.317597,0.000000,32.105600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.374044,0.000000,3.228800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.419194,0.000000,3.228797>}
box{<0,0,-0.203200><0.045150,0.035000,0.203200> rotate<0,0.003965,0> translate<13.374044,0.000000,3.228800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.374044,0.000000,7.191197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.419194,0.000000,7.191197>}
box{<0,0,-0.203200><0.045150,0.035000,0.203200> rotate<0,0.000000,0> translate<13.374044,0.000000,7.191197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.389303,0.000000,9.347200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.685097,0.000000,9.347200>}
box{<0,0,-0.203200><3.295794,0.035000,0.203200> rotate<0,0.000000,0> translate<13.389303,0.000000,9.347200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.419178,0.000000,5.260800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.419178,0.000000,5.159194>}
box{<0,0,-0.203200><0.101606,0.035000,0.203200> rotate<0,-90.000000,0> translate<13.419178,0.000000,5.159194> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.419194,0.000000,3.228797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.419194,0.000000,5.159178>}
box{<0,0,-0.203200><1.930381,0.035000,0.203200> rotate<0,90.000000,0> translate<13.419194,0.000000,5.159178> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.419194,0.000000,3.251200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.520800,0.000000,3.251200>}
box{<0,0,-0.203200><0.101606,0.035000,0.203200> rotate<0,0.000000,0> translate<13.419194,0.000000,3.251200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.419194,0.000000,3.657600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.520800,0.000000,3.657600>}
box{<0,0,-0.203200><0.101606,0.035000,0.203200> rotate<0,0.000000,0> translate<13.419194,0.000000,3.657600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.419194,0.000000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.520800,0.000000,4.064000>}
box{<0,0,-0.203200><0.101606,0.035000,0.203200> rotate<0,0.000000,0> translate<13.419194,0.000000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.419194,0.000000,4.470400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.520800,0.000000,4.470400>}
box{<0,0,-0.203200><0.101606,0.035000,0.203200> rotate<0,0.000000,0> translate<13.419194,0.000000,4.470400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.419194,0.000000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.520800,0.000000,4.876800>}
box{<0,0,-0.203200><0.101606,0.035000,0.203200> rotate<0,0.000000,0> translate<13.419194,0.000000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.419194,0.000000,5.159178>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.520800,0.000000,5.159178>}
box{<0,0,-0.203200><0.101606,0.035000,0.203200> rotate<0,0.000000,0> translate<13.419194,0.000000,5.159178> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.419194,0.000000,5.260819>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.419194,0.000000,7.191197>}
box{<0,0,-0.203200><1.930378,0.035000,0.203200> rotate<0,90.000000,0> translate<13.419194,0.000000,7.191197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.419194,0.000000,5.260819>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.520800,0.000000,5.260819>}
box{<0,0,-0.203200><0.101606,0.035000,0.203200> rotate<0,0.000000,0> translate<13.419194,0.000000,5.260819> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.419194,0.000000,5.283200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.520800,0.000000,5.283200>}
box{<0,0,-0.203200><0.101606,0.035000,0.203200> rotate<0,0.000000,0> translate<13.419194,0.000000,5.283200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.419194,0.000000,5.689600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.520800,0.000000,5.689600>}
box{<0,0,-0.203200><0.101606,0.035000,0.203200> rotate<0,0.000000,0> translate<13.419194,0.000000,5.689600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.419194,0.000000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.520800,0.000000,6.096000>}
box{<0,0,-0.203200><0.101606,0.035000,0.203200> rotate<0,0.000000,0> translate<13.419194,0.000000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.419194,0.000000,6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.520800,0.000000,6.502400>}
box{<0,0,-0.203200><0.101606,0.035000,0.203200> rotate<0,0.000000,0> translate<13.419194,0.000000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.419194,0.000000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.520800,0.000000,6.908800>}
box{<0,0,-0.203200><0.101606,0.035000,0.203200> rotate<0,0.000000,0> translate<13.419194,0.000000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.520800,0.000000,3.228800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.565953,0.000000,3.228800>}
box{<0,0,-0.203200><0.045153,0.035000,0.203200> rotate<0,0.000000,0> translate<13.520800,0.000000,3.228800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.520800,0.000000,5.159178>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.520800,0.000000,3.228800>}
box{<0,0,-0.203200><1.930378,0.035000,0.203200> rotate<0,-90.000000,0> translate<13.520800,0.000000,3.228800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.520800,0.000000,7.191197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.520800,0.000000,5.260819>}
box{<0,0,-0.203200><1.930378,0.035000,0.203200> rotate<0,-90.000000,0> translate<13.520800,0.000000,5.260819> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.520800,0.000000,7.191197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.565953,0.000000,7.191197>}
box{<0,0,-0.203200><0.045153,0.035000,0.203200> rotate<0,0.000000,0> translate<13.520800,0.000000,7.191197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.520819,0.000000,5.159194>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.520819,0.000000,5.260800>}
box{<0,0,-0.203200><0.101606,0.035000,0.203200> rotate<0,90.000000,0> translate<13.520819,0.000000,5.260800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.520819,0.000000,5.159194>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.689194,0.000000,5.159194>}
box{<0,0,-0.203200><1.168375,0.035000,0.203200> rotate<0,0.000000,0> translate<13.520819,0.000000,5.159194> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.520819,0.000000,5.260800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.689197,0.000000,5.260800>}
box{<0,0,-0.203200><1.168378,0.035000,0.203200> rotate<0,0.000000,0> translate<13.520819,0.000000,5.260800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.547700,0.000000,18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.363494,0.000000,18.694400>}
box{<0,0,-0.203200><0.815794,0.035000,0.203200> rotate<0,0.000000,0> translate<13.547700,0.000000,18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.565953,0.000000,3.228800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.755497,0.000000,3.258822>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,-8.999729,0> translate<13.565953,0.000000,3.228800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.565953,0.000000,7.191197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.755497,0.000000,7.161175>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,8.999729,0> translate<13.565953,0.000000,7.191197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.707375,0.000000,3.251200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.946103,0.000000,3.251200>}
box{<0,0,-0.203200><4.238728,0.035000,0.203200> rotate<0,0.000000,0> translate<13.707375,0.000000,3.251200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.755497,0.000000,3.258822>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.938009,0.000000,3.318122>}
box{<0,0,-0.203200><0.191904,0.035000,0.203200> rotate<0,-17.998271,0> translate<13.755497,0.000000,3.258822> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.755497,0.000000,7.161175>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.938009,0.000000,7.101875>}
box{<0,0,-0.203200><0.191904,0.035000,0.203200> rotate<0,17.998271,0> translate<13.755497,0.000000,7.161175> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.795703,0.000000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.798878,0.000000,9.753600>}
box{<0,0,-0.203200><2.003175,0.035000,0.203200> rotate<0,0.000000,0> translate<13.795703,0.000000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.938009,0.000000,3.318122>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.108997,0.000000,3.405247>}
box{<0,0,-0.203200><0.191905,0.035000,0.203200> rotate<0,-26.998888,0> translate<13.938009,0.000000,3.318122> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.938009,0.000000,7.101875>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.108997,0.000000,7.014750>}
box{<0,0,-0.203200><0.191905,0.035000,0.203200> rotate<0,26.998888,0> translate<13.938009,0.000000,7.101875> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.954100,0.000000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.769894,0.000000,18.288000>}
box{<0,0,-0.203200><0.815794,0.035000,0.203200> rotate<0,0.000000,0> translate<13.954100,0.000000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.108997,0.000000,3.405247>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.264253,0.000000,3.518047>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,-35.997559,0> translate<14.108997,0.000000,3.405247> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.108997,0.000000,7.014750>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.264253,0.000000,6.901950>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,35.997559,0> translate<14.108997,0.000000,7.014750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.130400,0.000000,19.058741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.223206,0.000000,18.834688>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<14.130400,0.000000,19.058741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.130400,0.000000,20.571256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.130400,0.000000,19.058741>}
box{<0,0,-0.203200><1.512516,0.035000,0.203200> rotate<0,-90.000000,0> translate<14.130400,0.000000,19.058741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.130400,0.000000,20.571256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.223206,0.000000,20.795309>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<14.130400,0.000000,20.571256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.202103,0.000000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.612797,0.000000,10.160000>}
box{<0,0,-0.203200><1.410694,0.035000,0.203200> rotate<0,0.000000,0> translate<14.202103,0.000000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.223206,0.000000,18.834688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.394687,0.000000,18.663206>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<14.223206,0.000000,18.834688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.223206,0.000000,20.795309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.493206,0.000000,22.065309>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,-44.997030,0> translate<14.223206,0.000000,20.795309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.254825,0.000000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.294434,0.000000,6.908800>}
box{<0,0,-0.203200><1.039609,0.035000,0.203200> rotate<0,0.000000,0> translate<14.254825,0.000000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.264253,0.000000,3.518047>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.399950,0.000000,3.653744>}
box{<0,0,-0.203200><0.191904,0.035000,0.203200> rotate<0,-44.997030,0> translate<14.264253,0.000000,3.518047> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.264253,0.000000,6.901950>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.399950,0.000000,6.766253>}
box{<0,0,-0.203200><0.191904,0.035000,0.203200> rotate<0,44.997030,0> translate<14.264253,0.000000,6.901950> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.360500,0.000000,17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.176294,0.000000,17.881600>}
box{<0,0,-0.203200><0.815794,0.035000,0.203200> rotate<0,0.000000,0> translate<14.360500,0.000000,17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.394687,0.000000,18.663206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.423300,0.000000,17.634597>}
box{<0,0,-0.203200><1.454676,0.035000,0.203200> rotate<0,44.996943,0> translate<14.394687,0.000000,18.663206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.399950,0.000000,3.653744>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.512750,0.000000,3.809000>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,-53.996501,0> translate<14.399950,0.000000,3.653744> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.399950,0.000000,6.766253>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.512750,0.000000,6.610997>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,53.996501,0> translate<14.399950,0.000000,6.766253> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.402750,0.000000,3.657600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.148031,0.000000,3.657600>}
box{<0,0,-0.203200><0.745281,0.035000,0.203200> rotate<0,0.000000,0> translate<14.402750,0.000000,3.657600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.512750,0.000000,3.809000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.599875,0.000000,3.979988>}
box{<0,0,-0.203200><0.191905,0.035000,0.203200> rotate<0,-62.995173,0> translate<14.512750,0.000000,3.809000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.512750,0.000000,6.610997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.599875,0.000000,6.440009>}
box{<0,0,-0.203200><0.191905,0.035000,0.203200> rotate<0,62.995173,0> translate<14.512750,0.000000,6.610997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.568088,0.000000,6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.965034,0.000000,6.502400>}
box{<0,0,-0.203200><0.396947,0.035000,0.203200> rotate<0,0.000000,0> translate<14.568088,0.000000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.599875,0.000000,3.979988>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.659175,0.000000,4.162500>}
box{<0,0,-0.203200><0.191904,0.035000,0.203200> rotate<0,-71.995789,0> translate<14.599875,0.000000,3.979988> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.599875,0.000000,6.440009>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.659175,0.000000,6.257497>}
box{<0,0,-0.203200><0.191904,0.035000,0.203200> rotate<0,71.995789,0> translate<14.599875,0.000000,6.440009> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.607503,0.000000,10.565400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.612800,0.000000,10.565400>}
box{<0,0,-0.203200><1.005297,0.035000,0.203200> rotate<0,0.000000,0> translate<14.607503,0.000000,10.565400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.607503,0.000000,17.634597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.423300,0.000000,17.634597>}
box{<0,0,-0.203200><0.815797,0.035000,0.203200> rotate<0,0.000000,0> translate<14.607503,0.000000,17.634597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.627169,0.000000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.904388,0.000000,4.064000>}
box{<0,0,-0.203200><0.277219,0.035000,0.203200> rotate<0,0.000000,0> translate<14.627169,0.000000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.659175,0.000000,4.162500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.689197,0.000000,4.352044>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,-80.994332,0> translate<14.659175,0.000000,4.162500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.659175,0.000000,6.257497>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.689197,0.000000,6.067953>}
box{<0,0,-0.203200><0.191907,0.035000,0.203200> rotate<0,80.994332,0> translate<14.659175,0.000000,6.257497> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.684756,0.000000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.841600,0.000000,6.096000>}
box{<0,0,-0.203200><0.156844,0.035000,0.203200> rotate<0,0.000000,0> translate<14.684756,0.000000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.689194,0.000000,5.159194>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.689197,0.000000,4.352044>}
box{<0,0,-0.203200><0.807150,0.035000,0.203200> rotate<0,89.993839,0> translate<14.689194,0.000000,5.159194> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.689197,0.000000,4.470400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.841600,0.000000,4.470400>}
box{<0,0,-0.203200><0.152403,0.035000,0.203200> rotate<0,0.000000,0> translate<14.689197,0.000000,4.470400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.689197,0.000000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.841600,0.000000,4.876800>}
box{<0,0,-0.203200><0.152403,0.035000,0.203200> rotate<0,0.000000,0> translate<14.689197,0.000000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.689197,0.000000,5.260800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.689197,0.000000,6.067953>}
box{<0,0,-0.203200><0.807153,0.035000,0.203200> rotate<0,90.000000,0> translate<14.689197,0.000000,6.067953> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.689197,0.000000,5.283200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.841600,0.000000,5.283200>}
box{<0,0,-0.203200><0.152403,0.035000,0.203200> rotate<0,0.000000,0> translate<14.689197,0.000000,5.283200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.689197,0.000000,5.689600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.841600,0.000000,5.689600>}
box{<0,0,-0.203200><0.152403,0.035000,0.203200> rotate<0,0.000000,0> translate<14.689197,0.000000,5.689600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.841600,0.000000,4.215587>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.019478,0.000000,3.786153>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,67.495479,0> translate<14.841600,0.000000,4.215587> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.841600,0.000000,6.204409>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.841600,0.000000,4.215587>}
box{<0,0,-0.203200><1.988822,0.035000,0.203200> rotate<0,-90.000000,0> translate<14.841600,0.000000,4.215587> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.841600,0.000000,6.204409>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.019478,0.000000,6.633844>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,-67.495479,0> translate<14.841600,0.000000,6.204409> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.967234,0.000000,23.650400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.526031,0.000000,23.091600>}
box{<0,0,-0.203200><0.790260,0.035000,0.203200> rotate<0,44.997190,0> translate<14.967234,0.000000,23.650400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.967234,0.000000,24.869597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.526031,0.000000,25.428397>}
box{<0,0,-0.203200><0.790260,0.035000,0.203200> rotate<0,-44.997190,0> translate<14.967234,0.000000,24.869597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.967234,0.000000,26.190400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.526031,0.000000,25.631600>}
box{<0,0,-0.203200><0.790260,0.035000,0.203200> rotate<0,44.997190,0> translate<14.967234,0.000000,26.190400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.967234,0.000000,27.409597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.526031,0.000000,27.968397>}
box{<0,0,-0.203200><0.790260,0.035000,0.203200> rotate<0,-44.997190,0> translate<14.967234,0.000000,27.409597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.019478,0.000000,3.786153>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.348153,0.000000,3.457478>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,44.997030,0> translate<15.019478,0.000000,3.786153> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.019478,0.000000,6.633844>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.348153,0.000000,6.962519>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,-44.997030,0> translate<15.019478,0.000000,6.633844> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.348153,0.000000,3.457478>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.777588,0.000000,3.279600>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,22.498581,0> translate<15.348153,0.000000,3.457478> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.348153,0.000000,6.962519>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.390400,0.000000,6.980016>}
box{<0,0,-0.203200><0.045727,0.035000,0.203200> rotate<0,-22.495791,0> translate<15.348153,0.000000,6.962519> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.349597,0.000000,19.432503>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.349597,0.000000,20.197494>}
box{<0,0,-0.203200><0.764991,0.035000,0.203200> rotate<0,90.000000,0> translate<15.349597,0.000000,20.197494> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.349597,0.000000,19.432503>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.300703,0.000000,18.481397>}
box{<0,0,-0.203200><1.345067,0.035000,0.203200> rotate<0,44.997030,0> translate<15.349597,0.000000,19.432503> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.349597,0.000000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.290400,0.000000,19.507200>}
box{<0,0,-0.203200><8.940803,0.035000,0.203200> rotate<0,0.000000,0> translate<15.349597,0.000000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.349597,0.000000,19.913600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.290400,0.000000,19.913600>}
box{<0,0,-0.203200><8.940803,0.035000,0.203200> rotate<0,0.000000,0> translate<15.349597,0.000000,19.913600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.349597,0.000000,20.197494>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.262503,0.000000,21.110400>}
box{<0,0,-0.203200><1.291044,0.035000,0.203200> rotate<0,-44.997030,0> translate<15.349597,0.000000,20.197494> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.390400,0.000000,7.921256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.390400,0.000000,6.980016>}
box{<0,0,-0.203200><0.941241,0.035000,0.203200> rotate<0,-90.000000,0> translate<15.390400,0.000000,6.980016> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.390400,0.000000,7.921256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.483206,0.000000,8.145309>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<15.390400,0.000000,7.921256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.472103,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.167894,0.000000,20.320000>}
box{<0,0,-0.203200><8.695791,0.035000,0.203200> rotate<0,0.000000,0> translate<15.472103,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.483206,0.000000,8.145309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.654688,0.000000,8.316791>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<15.483206,0.000000,8.145309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.493206,0.000000,22.065309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.664688,0.000000,22.236791>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<15.493206,0.000000,22.065309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.526031,0.000000,23.091600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.493966,0.000000,23.091600>}
box{<0,0,-0.203200><0.967934,0.035000,0.203200> rotate<0,0.000000,0> translate<15.526031,0.000000,23.091600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.526031,0.000000,25.428397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.493966,0.000000,25.428397>}
box{<0,0,-0.203200><0.967934,0.035000,0.203200> rotate<0,0.000000,0> translate<15.526031,0.000000,25.428397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.526031,0.000000,25.631600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.493966,0.000000,25.631600>}
box{<0,0,-0.203200><0.967934,0.035000,0.203200> rotate<0,0.000000,0> translate<15.526031,0.000000,25.631600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.526031,0.000000,27.968397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.493966,0.000000,27.968397>}
box{<0,0,-0.203200><0.967934,0.035000,0.203200> rotate<0,0.000000,0> translate<15.526031,0.000000,27.968397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.612797,0.000000,10.424981>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.612800,0.000000,10.064806>}
box{<0,0,-0.203200><0.360175,0.035000,0.203200> rotate<0,89.993563,0> translate<15.612797,0.000000,10.424981> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.612797,0.000000,10.424981>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.819966,0.000000,10.424981>}
box{<0,0,-0.203200><1.207169,0.035000,0.203200> rotate<0,0.000000,0> translate<15.612797,0.000000,10.424981> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.612800,0.000000,10.064806>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.643956,0.000000,9.948525>}
box{<0,0,-0.203200><0.120383,0.035000,0.203200> rotate<0,74.995610,0> translate<15.612800,0.000000,10.064806> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.612800,0.000000,10.425013>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.819966,0.000000,10.425013>}
box{<0,0,-0.203200><1.207166,0.035000,0.203200> rotate<0,0.000000,0> translate<15.612800,0.000000,10.425013> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.612800,0.000000,10.565400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.612800,0.000000,10.425013>}
box{<0,0,-0.203200><0.140387,0.035000,0.203200> rotate<0,-90.000000,0> translate<15.612800,0.000000,10.425013> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.643956,0.000000,9.948525>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.704147,0.000000,9.844272>}
box{<0,0,-0.203200><0.120381,0.035000,0.203200> rotate<0,59.996017,0> translate<15.643956,0.000000,9.948525> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.654688,0.000000,8.316791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.654691,0.000000,8.316791>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,0.000000,0> translate<15.654688,0.000000,8.316791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.654691,0.000000,8.316791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.683206,0.000000,9.345306>}
box{<0,0,-0.203200><1.454541,0.035000,0.203200> rotate<0,-44.997030,0> translate<15.654691,0.000000,8.316791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.664688,0.000000,22.236791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.888741,0.000000,22.329597>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<15.664688,0.000000,22.236791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.681300,0.000000,19.100800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.958697,0.000000,19.100800>}
box{<0,0,-0.203200><8.277397,0.035000,0.203200> rotate<0,0.000000,0> translate<15.681300,0.000000,19.100800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.704147,0.000000,9.844272>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.789272,0.000000,9.759147>}
box{<0,0,-0.203200><0.120385,0.035000,0.203200> rotate<0,44.997030,0> translate<15.704147,0.000000,9.844272> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.777588,0.000000,3.279600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.242409,0.000000,3.279600>}
box{<0,0,-0.203200><0.464822,0.035000,0.203200> rotate<0,0.000000,0> translate<15.777588,0.000000,3.279600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.789272,0.000000,9.759147>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.893525,0.000000,9.698956>}
box{<0,0,-0.203200><0.120381,0.035000,0.203200> rotate<0,29.998043,0> translate<15.789272,0.000000,9.759147> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.878503,0.000000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.761494,0.000000,20.726400>}
box{<0,0,-0.203200><7.882991,0.035000,0.203200> rotate<0,0.000000,0> translate<15.878503,0.000000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.888741,0.000000,22.329597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.027494,0.000000,22.329597>}
box{<0,0,-0.203200><1.138753,0.035000,0.203200> rotate<0,0.000000,0> translate<15.888741,0.000000,22.329597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.893525,0.000000,9.698956>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.009806,0.000000,9.667800>}
box{<0,0,-0.203200><0.120383,0.035000,0.203200> rotate<0,14.998451,0> translate<15.893525,0.000000,9.698956> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.009806,0.000000,9.667800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.819981,0.000000,9.667797>}
box{<0,0,-0.203200><0.810175,0.035000,0.203200> rotate<0,0.000221,0> translate<16.009806,0.000000,9.667800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.087700,0.000000,18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.552297,0.000000,18.694400>}
box{<0,0,-0.203200><7.464597,0.035000,0.203200> rotate<0,0.000000,0> translate<16.087700,0.000000,18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.242409,0.000000,3.279600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.671844,0.000000,3.457478>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,-22.498581,0> translate<16.242409,0.000000,3.279600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.262503,0.000000,21.110400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.401256,0.000000,21.110400>}
box{<0,0,-0.203200><1.138753,0.035000,0.203200> rotate<0,0.000000,0> translate<16.262503,0.000000,21.110400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.300703,0.000000,18.481397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.738334,0.000000,18.481397>}
box{<0,0,-0.203200><1.437631,0.035000,0.203200> rotate<0,0.000000,0> translate<16.300703,0.000000,18.481397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.493966,0.000000,23.091600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.178397,0.000000,23.776031>}
box{<0,0,-0.203200><0.967932,0.035000,0.203200> rotate<0,-44.997030,0> translate<16.493966,0.000000,23.091600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.493966,0.000000,25.428397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.178397,0.000000,24.743966>}
box{<0,0,-0.203200><0.967932,0.035000,0.203200> rotate<0,44.997030,0> translate<16.493966,0.000000,25.428397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.493966,0.000000,25.631600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.052763,0.000000,26.190400>}
box{<0,0,-0.203200><0.790260,0.035000,0.203200> rotate<0,-44.997190,0> translate<16.493966,0.000000,25.631600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.493966,0.000000,27.968397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.052763,0.000000,27.409597>}
box{<0,0,-0.203200><0.790260,0.035000,0.203200> rotate<0,44.997190,0> translate<16.493966,0.000000,27.968397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.567166,0.000000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.862697,0.000000,23.164800>}
box{<0,0,-0.203200><1.295531,0.035000,0.203200> rotate<0,0.000000,0> translate<16.567166,0.000000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.609597,0.000000,6.988300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.609597,0.000000,7.547497>}
box{<0,0,-0.203200><0.559197,0.035000,0.203200> rotate<0,90.000000,0> translate<16.609597,0.000000,7.547497> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.609597,0.000000,6.988300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.671844,0.000000,6.962519>}
box{<0,0,-0.203200><0.067375,0.035000,0.203200> rotate<0,22.496748,0> translate<16.609597,0.000000,6.988300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.609597,0.000000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.364122,0.000000,7.315200>}
box{<0,0,-0.203200><2.754525,0.035000,0.203200> rotate<0,0.000000,0> translate<16.609597,0.000000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.609597,0.000000,7.547497>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.452500,0.000000,8.390400>}
box{<0,0,-0.203200><1.192045,0.035000,0.203200> rotate<0,-44.997030,0> translate<16.609597,0.000000,7.547497> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.671844,0.000000,3.457478>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.000519,0.000000,3.786153>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,-44.997030,0> translate<16.671844,0.000000,3.457478> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.671844,0.000000,6.962519>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.000519,0.000000,6.633844>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,44.997030,0> translate<16.671844,0.000000,6.962519> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.683206,0.000000,9.345309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.683206,0.000000,9.345306>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,-90.000000,0> translate<16.683206,0.000000,9.345306> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.683206,0.000000,9.345309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.854688,0.000000,9.516791>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<16.683206,0.000000,9.345309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.725563,0.000000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.908084,0.000000,6.908800>}
box{<0,0,-0.203200><2.182522,0.035000,0.203200> rotate<0,0.000000,0> translate<16.725563,0.000000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.725563,0.000000,25.196800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.834434,0.000000,25.196800>}
box{<0,0,-0.203200><1.108872,0.035000,0.203200> rotate<0,0.000000,0> translate<16.725563,0.000000,25.196800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.783700,0.000000,7.721600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.873731,0.000000,7.721600>}
box{<0,0,-0.203200><3.090031,0.035000,0.203200> rotate<0,0.000000,0> translate<16.783700,0.000000,7.721600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.819966,0.000000,10.425013>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.819966,0.000000,10.424981>}
box{<0,0,-0.203200><0.000031,0.035000,0.203200> rotate<0,-90.000000,0> translate<16.819966,0.000000,10.424981> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.819981,0.000000,9.667797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.819981,0.000000,10.424966>}
box{<0,0,-0.203200><0.757169,0.035000,0.203200> rotate<0,90.000000,0> translate<16.819981,0.000000,10.424966> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.819981,0.000000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.820013,0.000000,9.753600>}
box{<0,0,-0.203200><0.000031,0.035000,0.203200> rotate<0,0.000000,0> translate<16.819981,0.000000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.819981,0.000000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.820013,0.000000,10.160000>}
box{<0,0,-0.203200><0.000031,0.035000,0.203200> rotate<0,0.000000,0> translate<16.819981,0.000000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.819981,0.000000,10.424966>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.820013,0.000000,10.424966>}
box{<0,0,-0.203200><0.000031,0.035000,0.203200> rotate<0,0.000000,0> translate<16.819981,0.000000,10.424966> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.820013,0.000000,9.667800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.630191,0.000000,9.667800>}
box{<0,0,-0.203200><0.810178,0.035000,0.203200> rotate<0,0.000000,0> translate<16.820013,0.000000,9.667800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.820013,0.000000,10.424966>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.820013,0.000000,9.667800>}
box{<0,0,-0.203200><0.757166,0.035000,0.203200> rotate<0,-90.000000,0> translate<16.820013,0.000000,9.667800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.820031,0.000000,10.424981>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.820031,0.000000,10.425013>}
box{<0,0,-0.203200><0.000031,0.035000,0.203200> rotate<0,90.000000,0> translate<16.820031,0.000000,10.425013> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.820031,0.000000,10.424981>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.027194,0.000000,10.424981>}
box{<0,0,-0.203200><1.207163,0.035000,0.203200> rotate<0,0.000000,0> translate<16.820031,0.000000,10.424981> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.820031,0.000000,10.425013>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.027197,0.000000,10.425013>}
box{<0,0,-0.203200><1.207166,0.035000,0.203200> rotate<0,0.000000,0> translate<16.820031,0.000000,10.425013> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.827163,0.000000,27.635200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.732838,0.000000,27.635200>}
box{<0,0,-0.203200><0.905675,0.035000,0.203200> rotate<0,0.000000,0> translate<16.827163,0.000000,27.635200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.854688,0.000000,9.516791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.078741,0.000000,9.609597>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<16.854688,0.000000,9.516791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.871963,0.000000,26.009600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.688031,0.000000,26.009600>}
box{<0,0,-0.203200><0.816069,0.035000,0.203200> rotate<0,0.000000,0> translate<16.871963,0.000000,26.009600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.871966,0.000000,3.657600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.880463,0.000000,3.657600>}
box{<0,0,-0.203200><1.008497,0.035000,0.203200> rotate<0,0.000000,0> translate<16.871966,0.000000,3.657600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.973566,0.000000,23.571200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.586431,0.000000,23.571200>}
box{<0,0,-0.203200><0.612866,0.035000,0.203200> rotate<0,0.000000,0> translate<16.973566,0.000000,23.571200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.000519,0.000000,3.786153>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.178397,0.000000,4.215587>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,-67.495479,0> translate<17.000519,0.000000,3.786153> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.000519,0.000000,6.633844>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.178397,0.000000,6.204409>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,67.495479,0> translate<17.000519,0.000000,6.633844> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.027494,0.000000,22.329597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.927766,0.000000,23.229869>}
box{<0,0,-0.203200><1.273177,0.035000,0.203200> rotate<0,-44.997030,0> translate<17.027494,0.000000,22.329597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.052763,0.000000,26.190400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.507234,0.000000,26.190400>}
box{<0,0,-0.203200><0.454472,0.035000,0.203200> rotate<0,0.000000,0> translate<17.052763,0.000000,26.190400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.052763,0.000000,27.409597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.507234,0.000000,27.409597>}
box{<0,0,-0.203200><0.454472,0.035000,0.203200> rotate<0,0.000000,0> translate<17.052763,0.000000,27.409597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.054966,0.000000,6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.631006,0.000000,6.502400>}
box{<0,0,-0.203200><1.576041,0.035000,0.203200> rotate<0,0.000000,0> translate<17.054966,0.000000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.078741,0.000000,9.609597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.221256,0.000000,9.609597>}
box{<0,0,-0.203200><7.142516,0.035000,0.203200> rotate<0,0.000000,0> translate<17.078741,0.000000,9.609597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.115606,0.000000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.880463,0.000000,4.064000>}
box{<0,0,-0.203200><0.764856,0.035000,0.203200> rotate<0,0.000000,0> translate<17.115606,0.000000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.131963,0.000000,24.790400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.428034,0.000000,24.790400>}
box{<0,0,-0.203200><0.296072,0.035000,0.203200> rotate<0,0.000000,0> translate<17.131963,0.000000,24.790400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.178397,0.000000,4.215587>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.178397,0.000000,6.204409>}
box{<0,0,-0.203200><1.988822,0.035000,0.203200> rotate<0,90.000000,0> translate<17.178397,0.000000,6.204409> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.178397,0.000000,4.470400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.880463,0.000000,4.470400>}
box{<0,0,-0.203200><0.702066,0.035000,0.203200> rotate<0,0.000000,0> translate<17.178397,0.000000,4.470400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.178397,0.000000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.923897,0.000000,4.876800>}
box{<0,0,-0.203200><0.745500,0.035000,0.203200> rotate<0,0.000000,0> translate<17.178397,0.000000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.178397,0.000000,5.283200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.049253,0.000000,5.283200>}
box{<0,0,-0.203200><0.870856,0.035000,0.203200> rotate<0,0.000000,0> translate<17.178397,0.000000,5.283200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.178397,0.000000,5.689600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.174613,0.000000,5.689600>}
box{<0,0,-0.203200><0.996216,0.035000,0.203200> rotate<0,0.000000,0> translate<17.178397,0.000000,5.689600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.178397,0.000000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.353925,0.000000,6.096000>}
box{<0,0,-0.203200><1.175528,0.035000,0.203200> rotate<0,0.000000,0> translate<17.178397,0.000000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.178397,0.000000,23.776031>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.178397,0.000000,24.743966>}
box{<0,0,-0.203200><0.967934,0.035000,0.203200> rotate<0,90.000000,0> translate<17.178397,0.000000,24.743966> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.178397,0.000000,23.977600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.381600,0.000000,23.977600>}
box{<0,0,-0.203200><0.203203,0.035000,0.203200> rotate<0,0.000000,0> translate<17.178397,0.000000,23.977600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.178397,0.000000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.381600,0.000000,24.384000>}
box{<0,0,-0.203200><0.203203,0.035000,0.203200> rotate<0,0.000000,0> translate<17.178397,0.000000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.190100,0.000000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.813597,0.000000,8.128000>}
box{<0,0,-0.203200><3.623497,0.035000,0.203200> rotate<0,0.000000,0> translate<17.190100,0.000000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.381600,0.000000,23.776031>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.927766,0.000000,23.229869>}
box{<0,0,-0.203200><0.772393,0.035000,0.203200> rotate<0,44.996866,0> translate<17.381600,0.000000,23.776031> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.381600,0.000000,24.743966>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.381600,0.000000,23.776031>}
box{<0,0,-0.203200><0.967934,0.035000,0.203200> rotate<0,-90.000000,0> translate<17.381600,0.000000,23.776031> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.381600,0.000000,24.743966>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.066031,0.000000,25.428397>}
box{<0,0,-0.203200><0.967932,0.035000,0.203200> rotate<0,-44.997030,0> translate<17.381600,0.000000,24.743966> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.401256,0.000000,21.110400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.625309,0.000000,21.203206>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<17.401256,0.000000,21.110400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.452500,0.000000,8.390400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.847494,0.000000,8.390400>}
box{<0,0,-0.203200><6.394994,0.035000,0.203200> rotate<0,0.000000,0> translate<17.452500,0.000000,8.390400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.455334,0.000000,21.132800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.355094,0.000000,21.132800>}
box{<0,0,-0.203200><5.899759,0.035000,0.203200> rotate<0,0.000000,0> translate<17.455334,0.000000,21.132800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.507234,0.000000,26.190400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.066031,0.000000,25.631600>}
box{<0,0,-0.203200><0.790260,0.035000,0.203200> rotate<0,44.997190,0> translate<17.507234,0.000000,26.190400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.507234,0.000000,27.409597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.066031,0.000000,27.968397>}
box{<0,0,-0.203200><0.790260,0.035000,0.203200> rotate<0,-44.997190,0> translate<17.507234,0.000000,27.409597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.625309,0.000000,21.203206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.895309,0.000000,22.473206>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,-44.997030,0> translate<17.625309,0.000000,21.203206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.630191,0.000000,9.667800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.746472,0.000000,9.698956>}
box{<0,0,-0.203200><0.120383,0.035000,0.203200> rotate<0,-14.998451,0> translate<17.630191,0.000000,9.667800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.738334,0.000000,18.481397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.976397,0.000000,18.243334>}
box{<0,0,-0.203200><0.336671,0.035000,0.203200> rotate<0,44.997030,0> translate<17.738334,0.000000,18.481397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.746472,0.000000,9.698956>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.850725,0.000000,9.759147>}
box{<0,0,-0.203200><0.120381,0.035000,0.203200> rotate<0,-29.998043,0> translate<17.746472,0.000000,9.698956> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.841116,0.000000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.866663,0.000000,9.753600>}
box{<0,0,-0.203200><4.025547,0.035000,0.203200> rotate<0,0.000000,0> translate<17.841116,0.000000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.850725,0.000000,9.759147>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.935850,0.000000,9.844272>}
box{<0,0,-0.203200><0.120385,0.035000,0.203200> rotate<0,-44.997030,0> translate<17.850725,0.000000,9.759147> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.880463,0.000000,3.464003>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.255384,0.000000,2.248531>}
box{<0,0,-0.203200><1.271982,0.035000,0.203200> rotate<0,72.852401,0> translate<17.880463,0.000000,3.464003> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.880463,0.000000,4.735994>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.880463,0.000000,3.464003>}
box{<0,0,-0.203200><1.271991,0.035000,0.203200> rotate<0,-90.000000,0> translate<17.880463,0.000000,3.464003> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.880463,0.000000,4.735994>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.255384,0.000000,5.951466>}
box{<0,0,-0.203200><1.271982,0.035000,0.203200> rotate<0,-72.852401,0> translate<17.880463,0.000000,4.735994> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.931731,0.000000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.708266,0.000000,18.288000>}
box{<0,0,-0.203200><3.776534,0.035000,0.203200> rotate<0,0.000000,0> translate<17.931731,0.000000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.935850,0.000000,9.844272>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.996041,0.000000,9.948525>}
box{<0,0,-0.203200><0.120381,0.035000,0.203200> rotate<0,-59.996017,0> translate<17.935850,0.000000,9.844272> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.961303,0.000000,21.539200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.045063,0.000000,21.539200>}
box{<0,0,-0.203200><5.083759,0.035000,0.203200> rotate<0,0.000000,0> translate<17.961303,0.000000,21.539200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.976397,0.000000,10.935494>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.976397,0.000000,18.243334>}
box{<0,0,-0.203200><7.307841,0.035000,0.203200> rotate<0,90.000000,0> translate<17.976397,0.000000,18.243334> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.976397,0.000000,10.935494>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.996041,0.000000,10.901472>}
box{<0,0,-0.203200><0.039286,0.035000,0.203200> rotate<0,59.994510,0> translate<17.976397,0.000000,10.935494> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.976397,0.000000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.663600,0.000000,10.972800>}
box{<0,0,-0.203200><3.687203,0.035000,0.203200> rotate<0,0.000000,0> translate<17.976397,0.000000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.976397,0.000000,11.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.663600,0.000000,11.379200>}
box{<0,0,-0.203200><3.687203,0.035000,0.203200> rotate<0,0.000000,0> translate<17.976397,0.000000,11.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.976397,0.000000,11.785600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.663600,0.000000,11.785600>}
box{<0,0,-0.203200><3.687203,0.035000,0.203200> rotate<0,0.000000,0> translate<17.976397,0.000000,11.785600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.976397,0.000000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.663600,0.000000,12.192000>}
box{<0,0,-0.203200><3.687203,0.035000,0.203200> rotate<0,0.000000,0> translate<17.976397,0.000000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.976397,0.000000,12.598400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.663600,0.000000,12.598400>}
box{<0,0,-0.203200><3.687203,0.035000,0.203200> rotate<0,0.000000,0> translate<17.976397,0.000000,12.598400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.976397,0.000000,13.004800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.663600,0.000000,13.004800>}
box{<0,0,-0.203200><3.687203,0.035000,0.203200> rotate<0,0.000000,0> translate<17.976397,0.000000,13.004800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.976397,0.000000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.663600,0.000000,13.411200>}
box{<0,0,-0.203200><3.687203,0.035000,0.203200> rotate<0,0.000000,0> translate<17.976397,0.000000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.976397,0.000000,13.817600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.663600,0.000000,13.817600>}
box{<0,0,-0.203200><3.687203,0.035000,0.203200> rotate<0,0.000000,0> translate<17.976397,0.000000,13.817600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.976397,0.000000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.663600,0.000000,14.224000>}
box{<0,0,-0.203200><3.687203,0.035000,0.203200> rotate<0,0.000000,0> translate<17.976397,0.000000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.976397,0.000000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.663600,0.000000,14.630400>}
box{<0,0,-0.203200><3.687203,0.035000,0.203200> rotate<0,0.000000,0> translate<17.976397,0.000000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.976397,0.000000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.663600,0.000000,15.036800>}
box{<0,0,-0.203200><3.687203,0.035000,0.203200> rotate<0,0.000000,0> translate<17.976397,0.000000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.976397,0.000000,15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.663600,0.000000,15.443200>}
box{<0,0,-0.203200><3.687203,0.035000,0.203200> rotate<0,0.000000,0> translate<17.976397,0.000000,15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.976397,0.000000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.663600,0.000000,15.849600>}
box{<0,0,-0.203200><3.687203,0.035000,0.203200> rotate<0,0.000000,0> translate<17.976397,0.000000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.976397,0.000000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.663600,0.000000,16.256000>}
box{<0,0,-0.203200><3.687203,0.035000,0.203200> rotate<0,0.000000,0> translate<17.976397,0.000000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.976397,0.000000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.663600,0.000000,16.662400>}
box{<0,0,-0.203200><3.687203,0.035000,0.203200> rotate<0,0.000000,0> translate<17.976397,0.000000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.976397,0.000000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.663600,0.000000,17.068800>}
box{<0,0,-0.203200><3.687203,0.035000,0.203200> rotate<0,0.000000,0> translate<17.976397,0.000000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.976397,0.000000,17.475200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.663600,0.000000,17.475200>}
box{<0,0,-0.203200><3.687203,0.035000,0.203200> rotate<0,0.000000,0> translate<17.976397,0.000000,17.475200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.976397,0.000000,17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.663600,0.000000,17.881600>}
box{<0,0,-0.203200><3.687203,0.035000,0.203200> rotate<0,0.000000,0> translate<17.976397,0.000000,17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.996041,0.000000,9.948525>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.027197,0.000000,10.064806>}
box{<0,0,-0.203200><0.120383,0.035000,0.203200> rotate<0,-74.995610,0> translate<17.996041,0.000000,9.948525> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.996041,0.000000,10.901472>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.027197,0.000000,10.785191>}
box{<0,0,-0.203200><0.120383,0.035000,0.203200> rotate<0,74.995610,0> translate<17.996041,0.000000,10.901472> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.027194,0.000000,10.424981>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.027197,0.000000,10.064806>}
box{<0,0,-0.203200><0.360175,0.035000,0.203200> rotate<0,89.993563,0> translate<18.027194,0.000000,10.424981> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.027197,0.000000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.663600,0.000000,10.160000>}
box{<0,0,-0.203200><3.636403,0.035000,0.203200> rotate<0,0.000000,0> translate<18.027197,0.000000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.027197,0.000000,10.425013>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.027197,0.000000,10.785191>}
box{<0,0,-0.203200><0.360178,0.035000,0.203200> rotate<0,90.000000,0> translate<18.027197,0.000000,10.785191> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.027197,0.000000,10.566400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.663600,0.000000,10.566400>}
box{<0,0,-0.203200><3.636403,0.035000,0.203200> rotate<0,0.000000,0> translate<18.027197,0.000000,10.566400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.066031,0.000000,25.428397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.033966,0.000000,25.428397>}
box{<0,0,-0.203200><0.967934,0.035000,0.203200> rotate<0,0.000000,0> translate<18.066031,0.000000,25.428397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.066031,0.000000,25.631600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.033966,0.000000,25.631600>}
box{<0,0,-0.203200><0.967934,0.035000,0.203200> rotate<0,0.000000,0> translate<18.066031,0.000000,25.631600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.066031,0.000000,27.968397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.033966,0.000000,27.968397>}
box{<0,0,-0.203200><0.967934,0.035000,0.203200> rotate<0,0.000000,0> translate<18.066031,0.000000,27.968397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.255384,0.000000,2.248528>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.957175,0.000000,1.219197>}
box{<0,0,-0.203200><1.245806,0.035000,0.203200> rotate<0,55.710439,0> translate<18.255384,0.000000,2.248528> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.255384,0.000000,2.248531>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.255384,0.000000,2.248528>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,-90.000000,0> translate<18.255384,0.000000,2.248528> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.255384,0.000000,5.951469>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.255384,0.000000,5.951466>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,-90.000000,0> translate<18.255384,0.000000,5.951466> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.255384,0.000000,5.951469>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.971919,0.000000,7.002428>}
box{<0,0,-0.203200><1.271982,0.035000,0.203200> rotate<0,-55.710519,0> translate<18.255384,0.000000,5.951469> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.367703,0.000000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.020400,0.000000,21.945600>}
box{<0,0,-0.203200><4.652697,0.035000,0.203200> rotate<0,0.000000,0> translate<18.367703,0.000000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.774103,0.000000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.020400,0.000000,22.352000>}
box{<0,0,-0.203200><4.246297,0.035000,0.203200> rotate<0,0.000000,0> translate<18.774103,0.000000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.895309,0.000000,22.473206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.066791,0.000000,22.644687>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<18.895309,0.000000,22.473206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.971919,0.000000,7.002431>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.971919,0.000000,7.002428>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,-90.000000,0> translate<18.971919,0.000000,7.002428> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.971919,0.000000,7.002431>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.971922,0.000000,7.002431>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,0.000000,0> translate<18.971919,0.000000,7.002431> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.971922,0.000000,7.002431>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.966397,0.000000,7.795500>}
box{<0,0,-0.203200><1.271982,0.035000,0.203200> rotate<0,-38.568932,0> translate<18.971922,0.000000,7.002431> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.033966,0.000000,25.428397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.592766,0.000000,24.869597>}
box{<0,0,-0.203200><0.790263,0.035000,0.203200> rotate<0,44.997030,0> translate<19.033966,0.000000,25.428397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.033966,0.000000,25.631600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.592762,0.000000,26.190400>}
box{<0,0,-0.203200><0.790260,0.035000,0.203200> rotate<0,-44.997190,0> translate<19.033966,0.000000,25.631600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.033966,0.000000,27.968397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.592762,0.000000,27.409597>}
box{<0,0,-0.203200><0.790260,0.035000,0.203200> rotate<0,44.997190,0> translate<19.033966,0.000000,27.968397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.066791,0.000000,22.644687>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.159597,0.000000,22.868741>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<19.066791,0.000000,22.644687> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.113891,0.000000,22.758400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.020400,0.000000,22.758400>}
box{<0,0,-0.203200><3.906509,0.035000,0.203200> rotate<0,0.000000,0> translate<19.113891,0.000000,22.758400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.159597,0.000000,22.868741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.159597,0.000000,23.217231>}
box{<0,0,-0.203200><0.348491,0.035000,0.203200> rotate<0,90.000000,0> translate<19.159597,0.000000,23.217231> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.159597,0.000000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.020400,0.000000,23.164800>}
box{<0,0,-0.203200><3.860803,0.035000,0.203200> rotate<0,0.000000,0> translate<19.159597,0.000000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.159597,0.000000,23.217231>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.592766,0.000000,23.650400>}
box{<0,0,-0.203200><0.612593,0.035000,0.203200> rotate<0,-44.997030,0> translate<19.159597,0.000000,23.217231> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.265563,0.000000,25.196800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.088119,0.000000,25.196800>}
box{<0,0,-0.203200><1.822556,0.035000,0.203200> rotate<0,0.000000,0> translate<19.265563,0.000000,25.196800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.367162,0.000000,27.635200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.590834,0.000000,27.635200>}
box{<0,0,-0.203200><5.223672,0.035000,0.203200> rotate<0,0.000000,0> translate<19.367162,0.000000,27.635200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.411963,0.000000,26.009600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.928294,0.000000,26.009600>}
box{<0,0,-0.203200><3.516331,0.035000,0.203200> rotate<0,0.000000,0> translate<19.411963,0.000000,26.009600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.513566,0.000000,23.571200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.840116,0.000000,23.571200>}
box{<0,0,-0.203200><1.326550,0.035000,0.203200> rotate<0,0.000000,0> translate<19.513566,0.000000,23.571200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.592762,0.000000,26.190400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.747494,0.000000,26.190400>}
box{<0,0,-0.203200><3.154731,0.035000,0.203200> rotate<0,0.000000,0> translate<19.592762,0.000000,26.190400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.592762,0.000000,27.409597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.395838,0.000000,27.409597>}
box{<0,0,-0.203200><4.803075,0.035000,0.203200> rotate<0,0.000000,0> translate<19.592762,0.000000,27.409597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.592766,0.000000,23.650400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.760916,0.000000,23.650400>}
box{<0,0,-0.203200><1.168150,0.035000,0.203200> rotate<0,0.000000,0> translate<19.592766,0.000000,23.650400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.592766,0.000000,24.869597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.760916,0.000000,24.869597>}
box{<0,0,-0.203200><1.168150,0.035000,0.203200> rotate<0,0.000000,0> translate<19.592766,0.000000,24.869597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.966397,0.000000,7.795500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.966400,0.000000,7.795500>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,0.000000,0> translate<19.966397,0.000000,7.795500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.966400,0.000000,7.795500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.150459,0.000000,8.260209>}
box{<0,0,-0.203200><1.271987,0.035000,0.203200> rotate<0,-21.427170,0> translate<19.966400,0.000000,7.795500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.542397,0.000000,31.879981>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.542400,0.000000,31.417075>}
box{<0,0,-0.203200><0.462906,0.035000,0.203200> rotate<0,89.993674,0> translate<20.542397,0.000000,31.879981> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.542397,0.000000,31.879981>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.659966,0.000000,31.879981>}
box{<0,0,-0.203200><1.117569,0.035000,0.203200> rotate<0,0.000000,0> translate<20.542397,0.000000,31.879981> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.542400,0.000000,31.417075>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.197075,0.000000,30.762400>}
box{<0,0,-0.203200><0.925850,0.035000,0.203200> rotate<0,44.997030,0> translate<20.542400,0.000000,31.417075> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.542400,0.000000,31.880013>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.659966,0.000000,31.880013>}
box{<0,0,-0.203200><1.117566,0.035000,0.203200> rotate<0,0.000000,0> translate<20.542400,0.000000,31.880013> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.542400,0.000000,32.342922>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.542400,0.000000,31.880013>}
box{<0,0,-0.203200><0.462909,0.035000,0.203200> rotate<0,-90.000000,0> translate<20.542400,0.000000,31.880013> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.542400,0.000000,32.342922>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.197075,0.000000,32.997597>}
box{<0,0,-0.203200><0.925850,0.035000,0.203200> rotate<0,-44.997030,0> translate<20.542400,0.000000,32.342922> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.760916,0.000000,23.650400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.218116,0.000000,23.193200>}
box{<0,0,-0.203200><0.646578,0.035000,0.203200> rotate<0,44.997030,0> translate<20.760916,0.000000,23.650400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.760916,0.000000,24.869597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.218116,0.000000,25.326797>}
box{<0,0,-0.203200><0.646578,0.035000,0.203200> rotate<0,-44.997030,0> translate<20.760916,0.000000,24.869597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.150459,0.000000,8.260209>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.418884,0.000000,8.355266>}
box{<0,0,-0.203200><1.271982,0.035000,0.203200> rotate<0,-4.285474,0> translate<21.150459,0.000000,8.260209> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.197075,0.000000,30.762400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.659981,0.000000,30.762400>}
box{<0,0,-0.203200><0.462906,0.035000,0.203200> rotate<0,0.000000,0> translate<21.197075,0.000000,30.762400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.197075,0.000000,32.997597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.659981,0.000000,32.997597>}
box{<0,0,-0.203200><0.462906,0.035000,0.203200> rotate<0,0.000000,0> translate<21.197075,0.000000,32.997597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.218116,0.000000,23.193200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.101881,0.000000,23.193200>}
box{<0,0,-0.203200><0.883766,0.035000,0.203200> rotate<0,0.000000,0> translate<21.218116,0.000000,23.193200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.218116,0.000000,25.326797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.101881,0.000000,25.326797>}
box{<0,0,-0.203200><0.883766,0.035000,0.203200> rotate<0,0.000000,0> translate<21.218116,0.000000,25.326797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.659966,0.000000,31.880013>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.659966,0.000000,31.879981>}
box{<0,0,-0.203200><0.000031,0.035000,0.203200> rotate<0,-90.000000,0> translate<21.659966,0.000000,31.879981> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.659981,0.000000,30.762400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.659981,0.000000,31.879966>}
box{<0,0,-0.203200><1.117566,0.035000,0.203200> rotate<0,90.000000,0> translate<21.659981,0.000000,31.879966> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.659981,0.000000,30.886400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.660013,0.000000,30.886400>}
box{<0,0,-0.203200><0.000031,0.035000,0.203200> rotate<0,0.000000,0> translate<21.659981,0.000000,30.886400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.659981,0.000000,31.292800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.660013,0.000000,31.292800>}
box{<0,0,-0.203200><0.000031,0.035000,0.203200> rotate<0,0.000000,0> translate<21.659981,0.000000,31.292800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.659981,0.000000,31.699200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.660013,0.000000,31.699200>}
box{<0,0,-0.203200><0.000031,0.035000,0.203200> rotate<0,0.000000,0> translate<21.659981,0.000000,31.699200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.659981,0.000000,31.879966>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.660013,0.000000,31.879966>}
box{<0,0,-0.203200><0.000031,0.035000,0.203200> rotate<0,0.000000,0> translate<21.659981,0.000000,31.879966> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.659981,0.000000,31.880031>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.659981,0.000000,32.997597>}
box{<0,0,-0.203200><1.117566,0.035000,0.203200> rotate<0,90.000000,0> translate<21.659981,0.000000,32.997597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.659981,0.000000,31.880031>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.660013,0.000000,31.880031>}
box{<0,0,-0.203200><0.000031,0.035000,0.203200> rotate<0,0.000000,0> translate<21.659981,0.000000,31.880031> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.659981,0.000000,32.105600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.660013,0.000000,32.105600>}
box{<0,0,-0.203200><0.000031,0.035000,0.203200> rotate<0,0.000000,0> translate<21.659981,0.000000,32.105600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.659981,0.000000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.660013,0.000000,32.512000>}
box{<0,0,-0.203200><0.000031,0.035000,0.203200> rotate<0,0.000000,0> translate<21.659981,0.000000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.659981,0.000000,32.918400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.660013,0.000000,32.918400>}
box{<0,0,-0.203200><0.000031,0.035000,0.203200> rotate<0,0.000000,0> translate<21.659981,0.000000,32.918400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.660013,0.000000,30.762400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.122922,0.000000,30.762400>}
box{<0,0,-0.203200><0.462909,0.035000,0.203200> rotate<0,0.000000,0> translate<21.660013,0.000000,30.762400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.660013,0.000000,31.879966>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.660013,0.000000,30.762400>}
box{<0,0,-0.203200><1.117566,0.035000,0.203200> rotate<0,-90.000000,0> translate<21.660013,0.000000,30.762400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.660013,0.000000,32.997597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.660013,0.000000,31.880031>}
box{<0,0,-0.203200><1.117566,0.035000,0.203200> rotate<0,-90.000000,0> translate<21.660013,0.000000,31.880031> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.660013,0.000000,32.997597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.122922,0.000000,32.997597>}
box{<0,0,-0.203200><0.462909,0.035000,0.203200> rotate<0,0.000000,0> translate<21.660013,0.000000,32.997597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.660031,0.000000,31.879981>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.660031,0.000000,31.880013>}
box{<0,0,-0.203200><0.000031,0.035000,0.203200> rotate<0,90.000000,0> translate<21.660031,0.000000,31.880013> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.660031,0.000000,31.879981>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.777594,0.000000,31.879981>}
box{<0,0,-0.203200><1.117563,0.035000,0.203200> rotate<0,0.000000,0> translate<21.660031,0.000000,31.879981> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.660031,0.000000,31.880013>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.777597,0.000000,31.880013>}
box{<0,0,-0.203200><1.117566,0.035000,0.203200> rotate<0,0.000000,0> translate<21.660031,0.000000,31.880013> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.663600,0.000000,9.956663>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.901663,0.000000,9.718600>}
box{<0,0,-0.203200><0.336671,0.035000,0.203200> rotate<0,44.997030,0> translate<21.663600,0.000000,9.956663> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.663600,0.000000,18.243334>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.663600,0.000000,9.956663>}
box{<0,0,-0.203200><8.286672,0.035000,0.203200> rotate<0,-90.000000,0> translate<21.663600,0.000000,9.956663> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.663600,0.000000,18.243334>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.901663,0.000000,18.481397>}
box{<0,0,-0.203200><0.336671,0.035000,0.203200> rotate<0,-44.997030,0> translate<21.663600,0.000000,18.243334> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.901663,0.000000,9.718600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.738334,0.000000,9.718600>}
box{<0,0,-0.203200><1.836672,0.035000,0.203200> rotate<0,0.000000,0> translate<21.901663,0.000000,9.718600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.901663,0.000000,18.481397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.339294,0.000000,18.481397>}
box{<0,0,-0.203200><1.437631,0.035000,0.203200> rotate<0,0.000000,0> translate<21.901663,0.000000,18.481397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.101881,0.000000,23.193200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.726797,0.000000,23.818116>}
box{<0,0,-0.203200><0.883764,0.035000,0.203200> rotate<0,-44.997030,0> translate<22.101881,0.000000,23.193200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.101881,0.000000,25.326797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.726797,0.000000,24.701881>}
box{<0,0,-0.203200><0.883764,0.035000,0.203200> rotate<0,44.997030,0> translate<22.101881,0.000000,25.326797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.122922,0.000000,30.762400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.777597,0.000000,31.417075>}
box{<0,0,-0.203200><0.925850,0.035000,0.203200> rotate<0,-44.997030,0> translate<22.122922,0.000000,30.762400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.122922,0.000000,32.997597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.777597,0.000000,32.342922>}
box{<0,0,-0.203200><0.925850,0.035000,0.203200> rotate<0,44.997030,0> translate<22.122922,0.000000,32.997597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.202119,0.000000,32.918400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.437878,0.000000,32.918400>}
box{<0,0,-0.203200><7.235759,0.035000,0.203200> rotate<0,0.000000,0> translate<22.202119,0.000000,32.918400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.231878,0.000000,25.196800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.020400,0.000000,25.196800>}
box{<0,0,-0.203200><0.788522,0.035000,0.203200> rotate<0,0.000000,0> translate<22.231878,0.000000,25.196800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.246922,0.000000,30.886400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.393075,0.000000,30.886400>}
box{<0,0,-0.203200><7.146153,0.035000,0.203200> rotate<0,0.000000,0> translate<22.246922,0.000000,30.886400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.418884,0.000000,8.355266>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.658978,0.000000,8.072222>}
box{<0,0,-0.203200><1.271985,0.035000,0.203200> rotate<0,12.856314,0> translate<22.418884,0.000000,8.355266> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.479881,0.000000,23.571200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.020400,0.000000,23.571200>}
box{<0,0,-0.203200><0.540519,0.035000,0.203200> rotate<0,0.000000,0> translate<22.479881,0.000000,23.571200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.608519,0.000000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.031478,0.000000,32.512000>}
box{<0,0,-0.203200><6.422959,0.035000,0.203200> rotate<0,0.000000,0> translate<22.608519,0.000000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.638278,0.000000,24.790400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.020400,0.000000,24.790400>}
box{<0,0,-0.203200><0.382122,0.035000,0.203200> rotate<0,0.000000,0> translate<22.638278,0.000000,24.790400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.653322,0.000000,31.292800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.986675,0.000000,31.292800>}
box{<0,0,-0.203200><6.333353,0.035000,0.203200> rotate<0,0.000000,0> translate<22.653322,0.000000,31.292800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.726797,0.000000,23.818116>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.726797,0.000000,24.701881>}
box{<0,0,-0.203200><0.883766,0.035000,0.203200> rotate<0,90.000000,0> translate<22.726797,0.000000,24.701881> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.726797,0.000000,23.977600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.020400,0.000000,23.977600>}
box{<0,0,-0.203200><0.293603,0.035000,0.203200> rotate<0,0.000000,0> translate<22.726797,0.000000,23.977600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.726797,0.000000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.020400,0.000000,24.384000>}
box{<0,0,-0.203200><0.293603,0.035000,0.203200> rotate<0,0.000000,0> translate<22.726797,0.000000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.747494,0.000000,26.190400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.020400,0.000000,25.917494>}
box{<0,0,-0.203200><0.385948,0.035000,0.203200> rotate<0,44.997030,0> translate<22.747494,0.000000,26.190400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.777594,0.000000,31.879981>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.777597,0.000000,31.417075>}
box{<0,0,-0.203200><0.462906,0.035000,0.203200> rotate<0,89.993674,0> translate<22.777594,0.000000,31.879981> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.777597,0.000000,31.699200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.862397,0.000000,31.699200>}
box{<0,0,-0.203200><6.084800,0.035000,0.203200> rotate<0,0.000000,0> translate<22.777597,0.000000,31.699200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.777597,0.000000,31.880013>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.777597,0.000000,32.342922>}
box{<0,0,-0.203200><0.462909,0.035000,0.203200> rotate<0,90.000000,0> translate<22.777597,0.000000,32.342922> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.777597,0.000000,32.105600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.862400,0.000000,32.105600>}
box{<0,0,-0.203200><6.084803,0.035000,0.203200> rotate<0,0.000000,0> translate<22.777597,0.000000,32.105600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.020400,0.000000,21.598741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.113206,0.000000,21.374688>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<23.020400,0.000000,21.598741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.020400,0.000000,25.917494>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.020400,0.000000,21.598741>}
box{<0,0,-0.203200><4.318753,0.035000,0.203200> rotate<0,-90.000000,0> translate<23.020400,0.000000,21.598741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.113206,0.000000,21.374688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.284688,0.000000,21.203206>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<23.113206,0.000000,21.374688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.284688,0.000000,21.203206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.290400,0.000000,20.197494>}
box{<0,0,-0.203200><1.422292,0.035000,0.203200> rotate<0,44.997030,0> translate<23.284688,0.000000,21.203206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.339294,0.000000,18.481397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.290400,0.000000,19.432503>}
box{<0,0,-0.203200><1.345067,0.035000,0.203200> rotate<0,-44.997030,0> translate<23.339294,0.000000,18.481397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.414600,0.000000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.109894,0.000000,8.128000>}
box{<0,0,-0.203200><0.695294,0.035000,0.203200> rotate<0,0.000000,0> translate<23.414600,0.000000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.658978,0.000000,8.072222>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.760550,0.000000,7.436228>}
box{<0,0,-0.203200><1.271986,0.035000,0.203200> rotate<0,29.998056,0> translate<23.658978,0.000000,8.072222> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.738334,0.000000,9.718600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.835131,0.000000,9.815400>}
box{<0,0,-0.203200><0.136894,0.035000,0.203200> rotate<0,-44.997955,0> translate<23.738334,0.000000,9.718600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.773331,0.000000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.574294,0.000000,9.753600>}
box{<0,0,-0.203200><0.800963,0.035000,0.203200> rotate<0,0.000000,0> translate<23.773331,0.000000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.835131,0.000000,9.815400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.512494,0.000000,9.815400>}
box{<0,0,-0.203200><0.677363,0.035000,0.203200> rotate<0,0.000000,0> translate<23.835131,0.000000,9.815400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.847494,0.000000,8.390400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.544688,0.000000,4.693206>}
box{<0,0,-0.203200><5.228622,0.035000,0.203200> rotate<0,44.997030,0> translate<23.847494,0.000000,8.390400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.216697,0.000000,17.634597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.245309,0.000000,18.663206>}
box{<0,0,-0.203200><1.454676,0.035000,0.203200> rotate<0,-44.996943,0> translate<24.216697,0.000000,17.634597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.216697,0.000000,17.634597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.572494,0.000000,17.634597>}
box{<0,0,-0.203200><3.355797,0.035000,0.203200> rotate<0,0.000000,0> translate<24.216697,0.000000,17.634597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.221256,0.000000,9.609597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.445309,0.000000,9.516791>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<24.221256,0.000000,9.609597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.239597,0.000000,21.972503>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.239597,0.000000,26.190400>}
box{<0,0,-0.203200><4.217897,0.035000,0.203200> rotate<0,90.000000,0> translate<24.239597,0.000000,26.190400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.239597,0.000000,21.972503>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.416791,0.000000,20.795309>}
box{<0,0,-0.203200><1.664803,0.035000,0.203200> rotate<0,44.997030,0> translate<24.239597,0.000000,21.972503> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.239597,0.000000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.895119,0.000000,22.352000>}
box{<0,0,-0.203200><8.655522,0.035000,0.203200> rotate<0,0.000000,0> translate<24.239597,0.000000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.239597,0.000000,22.758400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.351750,0.000000,22.758400>}
box{<0,0,-0.203200><9.112153,0.035000,0.203200> rotate<0,0.000000,0> translate<24.239597,0.000000,22.758400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.239597,0.000000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.998866,0.000000,23.164800>}
box{<0,0,-0.203200><0.759269,0.035000,0.203200> rotate<0,0.000000,0> translate<24.239597,0.000000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.239597,0.000000,23.571200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.444431,0.000000,23.571200>}
box{<0,0,-0.203200><0.204834,0.035000,0.203200> rotate<0,0.000000,0> translate<24.239597,0.000000,23.571200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.239597,0.000000,23.977600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.260303,0.000000,23.977600>}
box{<0,0,-0.203200><0.020706,0.035000,0.203200> rotate<0,0.000000,0> translate<24.239597,0.000000,23.977600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.239597,0.000000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.239600,0.000000,24.384000>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,0.000000,0> translate<24.239597,0.000000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.239597,0.000000,24.790400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.363034,0.000000,24.790400>}
box{<0,0,-0.203200><0.123438,0.035000,0.203200> rotate<0,0.000000,0> translate<24.239597,0.000000,24.790400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.239597,0.000000,25.196800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.692434,0.000000,25.196800>}
box{<0,0,-0.203200><0.452838,0.035000,0.203200> rotate<0,0.000000,0> translate<24.239597,0.000000,25.196800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.239597,0.000000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.064694,0.000000,25.603200>}
box{<0,0,-0.203200><10.825097,0.035000,0.203200> rotate<0,0.000000,0> translate<24.239597,0.000000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.239597,0.000000,26.009600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.546031,0.000000,26.009600>}
box{<0,0,-0.203200><0.306434,0.035000,0.203200> rotate<0,0.000000,0> translate<24.239597,0.000000,26.009600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.239597,0.000000,26.190400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.395838,0.000000,26.190400>}
box{<0,0,-0.203200><0.156241,0.035000,0.203200> rotate<0,0.000000,0> translate<24.239597,0.000000,26.190400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.239600,0.000000,24.027588>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.417478,0.000000,23.598153>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,67.495479,0> translate<24.239600,0.000000,24.027588> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.239600,0.000000,24.492409>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.239600,0.000000,24.027588>}
box{<0,0,-0.203200><0.464822,0.035000,0.203200> rotate<0,-90.000000,0> translate<24.239600,0.000000,24.027588> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.239600,0.000000,24.492409>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.417478,0.000000,24.921844>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,-67.495479,0> translate<24.239600,0.000000,24.492409> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.266275,0.000000,7.721600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.516294,0.000000,7.721600>}
box{<0,0,-0.203200><0.250019,0.035000,0.203200> rotate<0,0.000000,0> translate<24.266275,0.000000,7.721600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.266500,0.000000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.883500,0.000000,21.945600>}
box{<0,0,-0.203200><7.617000,0.035000,0.203200> rotate<0,0.000000,0> translate<24.266500,0.000000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.290400,0.000000,20.197494>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.290400,0.000000,19.432503>}
box{<0,0,-0.203200><0.764991,0.035000,0.203200> rotate<0,-90.000000,0> translate<24.290400,0.000000,19.432503> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.395838,0.000000,26.190400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.417478,0.000000,26.138153>}
box{<0,0,-0.203200><0.056551,0.035000,0.203200> rotate<0,67.496237,0> translate<24.395838,0.000000,26.190400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.395838,0.000000,27.409597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.417478,0.000000,27.461844>}
box{<0,0,-0.203200><0.056551,0.035000,0.203200> rotate<0,-67.496237,0> translate<24.395838,0.000000,27.409597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.417478,0.000000,23.598153>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.746153,0.000000,23.269478>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,44.997030,0> translate<24.417478,0.000000,23.598153> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.417478,0.000000,24.921844>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.746153,0.000000,25.250519>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,-44.997030,0> translate<24.417478,0.000000,24.921844> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.417478,0.000000,26.138153>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.746153,0.000000,25.809478>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,44.997030,0> translate<24.417478,0.000000,26.138153> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.417478,0.000000,27.461844>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.746153,0.000000,27.790519>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,-44.997030,0> translate<24.417478,0.000000,27.461844> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.445309,0.000000,9.516791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.616791,0.000000,9.345309>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<24.445309,0.000000,9.516791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.463700,0.000000,17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.819500,0.000000,17.881600>}
box{<0,0,-0.203200><3.355800,0.035000,0.203200> rotate<0,0.000000,0> translate<24.463700,0.000000,17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.512494,0.000000,9.815400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.193206,0.000000,6.134688>}
box{<0,0,-0.203200><5.205314,0.035000,0.203200> rotate<0,44.997030,0> translate<24.512494,0.000000,9.815400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.614900,0.000000,9.347200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.980694,0.000000,9.347200>}
box{<0,0,-0.203200><0.365794,0.035000,0.203200> rotate<0,0.000000,0> translate<24.614900,0.000000,9.347200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.616791,0.000000,9.345309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.142503,0.000000,5.819597>}
box{<0,0,-0.203200><4.986110,0.035000,0.203200> rotate<0,44.997030,0> translate<24.616791,0.000000,9.345309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.672900,0.000000,21.539200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.477100,0.000000,21.539200>}
box{<0,0,-0.203200><6.804200,0.035000,0.203200> rotate<0,0.000000,0> translate<24.672900,0.000000,21.539200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.746153,0.000000,23.269478>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.175588,0.000000,23.091600>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,22.498581,0> translate<24.746153,0.000000,23.269478> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.746153,0.000000,25.250519>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.175588,0.000000,25.428397>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,-22.498581,0> translate<24.746153,0.000000,25.250519> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.746153,0.000000,25.809478>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.175588,0.000000,25.631600>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,22.498581,0> translate<24.746153,0.000000,25.809478> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.746153,0.000000,27.790519>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.175588,0.000000,27.968397>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,-22.498581,0> translate<24.746153,0.000000,27.790519> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.760550,0.000000,7.436228>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.625722,0.000000,6.503797>}
box{<0,0,-0.203200><1.271987,0.035000,0.203200> rotate<0,47.139676,0> translate<24.760550,0.000000,7.436228> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.870100,0.000000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.225900,0.000000,18.288000>}
box{<0,0,-0.203200><3.355800,0.035000,0.203200> rotate<0,0.000000,0> translate<24.870100,0.000000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.872850,0.000000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.922694,0.000000,7.315200>}
box{<0,0,-0.203200><0.049844,0.035000,0.203200> rotate<0,0.000000,0> translate<24.872850,0.000000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.021300,0.000000,8.940800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.387094,0.000000,8.940800>}
box{<0,0,-0.203200><0.365794,0.035000,0.203200> rotate<0,0.000000,0> translate<25.021300,0.000000,8.940800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.079300,0.000000,21.132800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.070700,0.000000,21.132800>}
box{<0,0,-0.203200><5.991400,0.035000,0.203200> rotate<0,0.000000,0> translate<25.079300,0.000000,21.132800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.175588,0.000000,23.091600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.164409,0.000000,23.091600>}
box{<0,0,-0.203200><1.988822,0.035000,0.203200> rotate<0,0.000000,0> translate<25.175588,0.000000,23.091600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.175588,0.000000,25.428397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.164409,0.000000,25.428397>}
box{<0,0,-0.203200><1.988822,0.035000,0.203200> rotate<0,0.000000,0> translate<25.175588,0.000000,25.428397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.175588,0.000000,25.631600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.164409,0.000000,25.631600>}
box{<0,0,-0.203200><1.988822,0.035000,0.203200> rotate<0,0.000000,0> translate<25.175588,0.000000,25.631600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.175588,0.000000,27.968397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.164409,0.000000,27.968397>}
box{<0,0,-0.203200><1.988822,0.035000,0.203200> rotate<0,0.000000,0> translate<25.175588,0.000000,27.968397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.183125,0.000000,1.219197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.625725,0.000000,1.696200>}
box{<0,0,-0.203200><0.650712,0.035000,0.203200> rotate<0,-47.139373,0> translate<25.183125,0.000000,1.219197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.183125,0.000000,1.219197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.630800,0.000000,1.219197>}
box{<0,0,-0.203200><16.447675,0.035000,0.203200> rotate<0,0.000000,0> translate<25.183125,0.000000,1.219197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.183125,0.000000,1.219200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.630800,0.000000,1.219200>}
box{<0,0,-0.203200><16.447675,0.035000,0.203200> rotate<0,0.000000,0> translate<25.183125,0.000000,1.219200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.245309,0.000000,18.663206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.416791,0.000000,18.834688>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<25.245309,0.000000,18.663206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.249934,0.000000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.329094,0.000000,6.908800>}
box{<0,0,-0.203200><0.079159,0.035000,0.203200> rotate<0,0.000000,0> translate<25.249934,0.000000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.276503,0.000000,18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.632300,0.000000,18.694400>}
box{<0,0,-0.203200><3.355797,0.035000,0.203200> rotate<0,0.000000,0> translate<25.276503,0.000000,18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.416791,0.000000,18.834688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.509597,0.000000,19.058741>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<25.416791,0.000000,18.834688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.416791,0.000000,20.795309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.509597,0.000000,20.571256>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<25.416791,0.000000,20.795309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.427700,0.000000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.793494,0.000000,8.534400>}
box{<0,0,-0.203200><0.365794,0.035000,0.203200> rotate<0,0.000000,0> translate<25.427700,0.000000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.445334,0.000000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.664300,0.000000,20.726400>}
box{<0,0,-0.203200><5.218966,0.035000,0.203200> rotate<0,0.000000,0> translate<25.445334,0.000000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.509597,0.000000,19.058741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.509597,0.000000,20.571256>}
box{<0,0,-0.203200><1.512516,0.035000,0.203200> rotate<0,90.000000,0> translate<25.509597,0.000000,20.571256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.509597,0.000000,19.100800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.038700,0.000000,19.100800>}
box{<0,0,-0.203200><3.529103,0.035000,0.203200> rotate<0,0.000000,0> translate<25.509597,0.000000,19.100800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.509597,0.000000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.445100,0.000000,19.507200>}
box{<0,0,-0.203200><3.935503,0.035000,0.203200> rotate<0,0.000000,0> translate<25.509597,0.000000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.509597,0.000000,19.913600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.851500,0.000000,19.913600>}
box{<0,0,-0.203200><4.341903,0.035000,0.203200> rotate<0,0.000000,0> translate<25.509597,0.000000,19.913600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.509597,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.257900,0.000000,20.320000>}
box{<0,0,-0.203200><4.748303,0.035000,0.203200> rotate<0,0.000000,0> translate<25.509597,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.560216,0.000000,1.625600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.630800,0.000000,1.625600>}
box{<0,0,-0.203200><16.070584,0.035000,0.203200> rotate<0,0.000000,0> translate<25.560216,0.000000,1.625600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.625722,0.000000,6.503797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.625725,0.000000,6.503797>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,0.000000,0> translate<25.625722,0.000000,6.503797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.625725,0.000000,1.696200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.625725,0.000000,1.696203>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,90.000000,0> translate<25.625725,0.000000,1.696203> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.625725,0.000000,1.696203>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.177619,0.000000,2.842219>}
box{<0,0,-0.203200><1.271982,0.035000,0.203200> rotate<0,-64.281402,0> translate<25.625725,0.000000,1.696203> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.625725,0.000000,6.503794>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.625725,0.000000,6.503797>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,90.000000,0> translate<25.625725,0.000000,6.503797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.625725,0.000000,6.503794>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.177619,0.000000,5.357778>}
box{<0,0,-0.203200><1.271982,0.035000,0.203200> rotate<0,64.281402,0> translate<25.625725,0.000000,6.503794> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.626397,0.000000,6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.735494,0.000000,6.502400>}
box{<0,0,-0.203200><0.109097,0.035000,0.203200> rotate<0,0.000000,0> translate<25.626397,0.000000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.787434,0.000000,2.032000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.630800,0.000000,2.032000>}
box{<0,0,-0.203200><15.843366,0.035000,0.203200> rotate<0,0.000000,0> translate<25.787434,0.000000,2.032000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.822109,0.000000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.141894,0.000000,6.096000>}
box{<0,0,-0.203200><0.319784,0.035000,0.203200> rotate<0,0.000000,0> translate<25.822109,0.000000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.834100,0.000000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.199894,0.000000,8.128000>}
box{<0,0,-0.203200><0.365794,0.035000,0.203200> rotate<0,0.000000,0> translate<25.834100,0.000000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.983147,0.000000,2.438400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.630800,0.000000,2.438400>}
box{<0,0,-0.203200><15.647653,0.035000,0.203200> rotate<0,0.000000,0> translate<25.983147,0.000000,2.438400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.017822,0.000000,5.689600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.548294,0.000000,5.689600>}
box{<0,0,-0.203200><0.530472,0.035000,0.203200> rotate<0,0.000000,0> translate<26.017822,0.000000,5.689600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.177619,0.000000,2.842219>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.177619,0.000000,2.842222>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,90.000000,0> translate<26.177619,0.000000,2.842222> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.177619,0.000000,2.842222>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.367197,0.000000,4.100000>}
box{<0,0,-0.203200><1.271985,0.035000,0.203200> rotate<0,-81.423261,0> translate<26.177619,0.000000,2.842222> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.177619,0.000000,5.357775>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.177619,0.000000,5.357778>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,90.000000,0> translate<26.177619,0.000000,5.357778> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.177619,0.000000,5.357775>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.367197,0.000000,4.100000>}
box{<0,0,-0.203200><1.271982,0.035000,0.203200> rotate<0,81.423240,0> translate<26.177619,0.000000,5.357775> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.178006,0.000000,2.844800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.630800,0.000000,2.844800>}
box{<0,0,-0.203200><15.452794,0.035000,0.203200> rotate<0,0.000000,0> translate<26.178006,0.000000,2.844800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.188859,0.000000,5.283200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.954694,0.000000,5.283200>}
box{<0,0,-0.203200><0.765834,0.035000,0.203200> rotate<0,0.000000,0> translate<26.188859,0.000000,5.283200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.239259,0.000000,3.251200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.630800,0.000000,3.251200>}
box{<0,0,-0.203200><15.391541,0.035000,0.203200> rotate<0,0.000000,0> translate<26.239259,0.000000,3.251200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.240500,0.000000,7.721600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.606294,0.000000,7.721600>}
box{<0,0,-0.203200><0.365794,0.035000,0.203200> rotate<0,0.000000,0> translate<26.240500,0.000000,7.721600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.250116,0.000000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.361094,0.000000,4.876800>}
box{<0,0,-0.203200><1.110978,0.035000,0.203200> rotate<0,0.000000,0> translate<26.250116,0.000000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.300516,0.000000,3.657600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.630800,0.000000,3.657600>}
box{<0,0,-0.203200><15.330284,0.035000,0.203200> rotate<0,0.000000,0> translate<26.300516,0.000000,3.657600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.311369,0.000000,4.470400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.630800,0.000000,4.470400>}
box{<0,0,-0.203200><15.319431,0.035000,0.203200> rotate<0,0.000000,0> translate<26.311369,0.000000,4.470400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.361769,0.000000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.630800,0.000000,4.064000>}
box{<0,0,-0.203200><15.269031,0.035000,0.203200> rotate<0,0.000000,0> translate<26.361769,0.000000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.646900,0.000000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.012694,0.000000,7.315200>}
box{<0,0,-0.203200><0.365794,0.035000,0.203200> rotate<0,0.000000,0> translate<26.646900,0.000000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.053300,0.000000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.419094,0.000000,6.908800>}
box{<0,0,-0.203200><0.365794,0.035000,0.203200> rotate<0,0.000000,0> translate<27.053300,0.000000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.164409,0.000000,23.091600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.593844,0.000000,23.269478>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,-22.498581,0> translate<27.164409,0.000000,23.091600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.164409,0.000000,25.428397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.593844,0.000000,25.250519>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,22.498581,0> translate<27.164409,0.000000,25.428397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.164409,0.000000,25.631600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.593844,0.000000,25.809478>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,-22.498581,0> translate<27.164409,0.000000,25.631600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.164409,0.000000,27.968397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.593844,0.000000,27.790519>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,22.498581,0> translate<27.164409,0.000000,27.968397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.341128,0.000000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.663094,0.000000,23.164800>}
box{<0,0,-0.203200><8.321966,0.035000,0.203200> rotate<0,0.000000,0> translate<27.341128,0.000000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.459700,0.000000,6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.825494,0.000000,6.502400>}
box{<0,0,-0.203200><0.365794,0.035000,0.203200> rotate<0,0.000000,0> translate<27.459700,0.000000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.544688,0.000000,4.693206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.768741,0.000000,4.600400>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<27.544688,0.000000,4.693206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.572494,0.000000,17.634597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.003206,0.000000,22.065306>}
box{<0,0,-0.203200><6.265971,0.035000,0.203200> rotate<0,-44.997010,0> translate<27.572494,0.000000,17.634597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.593844,0.000000,23.269478>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.922519,0.000000,23.598153>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,-44.997030,0> translate<27.593844,0.000000,23.269478> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.593844,0.000000,25.250519>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.922519,0.000000,24.921844>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,44.997030,0> translate<27.593844,0.000000,25.250519> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.593844,0.000000,25.809478>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.922519,0.000000,26.138153>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,-44.997030,0> translate<27.593844,0.000000,25.809478> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.593844,0.000000,27.790519>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.922519,0.000000,27.461844>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,44.997030,0> translate<27.593844,0.000000,27.790519> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.647563,0.000000,25.196800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.408122,0.000000,25.196800>}
box{<0,0,-0.203200><1.760559,0.035000,0.203200> rotate<0,0.000000,0> translate<27.647563,0.000000,25.196800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.749163,0.000000,27.635200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.733600,0.000000,27.635200>}
box{<0,0,-0.203200><2.984438,0.035000,0.203200> rotate<0,0.000000,0> translate<27.749163,0.000000,27.635200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.768741,0.000000,4.600400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.721256,0.000000,4.600400>}
box{<0,0,-0.203200><9.952516,0.035000,0.203200> rotate<0,0.000000,0> translate<27.768741,0.000000,4.600400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.793966,0.000000,26.009600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.825662,0.000000,26.009600>}
box{<0,0,-0.203200><3.031697,0.035000,0.203200> rotate<0,0.000000,0> translate<27.793966,0.000000,26.009600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.866100,0.000000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.231894,0.000000,6.096000>}
box{<0,0,-0.203200><0.365794,0.035000,0.203200> rotate<0,0.000000,0> translate<27.866100,0.000000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.895566,0.000000,23.571200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.160116,0.000000,23.571200>}
box{<0,0,-0.203200><1.264550,0.035000,0.203200> rotate<0,0.000000,0> translate<27.895566,0.000000,23.571200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.922519,0.000000,23.598153>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.944159,0.000000,23.650400>}
box{<0,0,-0.203200><0.056551,0.035000,0.203200> rotate<0,-67.496237,0> translate<27.922519,0.000000,23.598153> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.922519,0.000000,24.921844>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.944159,0.000000,24.869597>}
box{<0,0,-0.203200><0.056551,0.035000,0.203200> rotate<0,67.496237,0> translate<27.922519,0.000000,24.921844> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.922519,0.000000,26.138153>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.944159,0.000000,26.190400>}
box{<0,0,-0.203200><0.056551,0.035000,0.203200> rotate<0,-67.496237,0> translate<27.922519,0.000000,26.138153> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.922519,0.000000,27.461844>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.944159,0.000000,27.409597>}
box{<0,0,-0.203200><0.056551,0.035000,0.203200> rotate<0,67.496237,0> translate<27.922519,0.000000,27.461844> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.944159,0.000000,23.650400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.080919,0.000000,23.650400>}
box{<0,0,-0.203200><1.136759,0.035000,0.203200> rotate<0,0.000000,0> translate<27.944159,0.000000,23.650400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.944159,0.000000,24.869597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.080919,0.000000,24.869597>}
box{<0,0,-0.203200><1.136759,0.035000,0.203200> rotate<0,0.000000,0> translate<27.944159,0.000000,24.869597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.944159,0.000000,26.190400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.733600,0.000000,26.190400>}
box{<0,0,-0.203200><2.789441,0.035000,0.203200> rotate<0,0.000000,0> translate<27.944159,0.000000,26.190400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.944159,0.000000,27.409597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.733600,0.000000,27.409597>}
box{<0,0,-0.203200><2.789441,0.035000,0.203200> rotate<0,0.000000,0> translate<27.944159,0.000000,27.409597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.142503,0.000000,5.819597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.347494,0.000000,5.819597>}
box{<0,0,-0.203200><9.204991,0.035000,0.203200> rotate<0,0.000000,0> translate<28.142503,0.000000,5.819597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.193206,0.000000,6.134688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.364688,0.000000,5.963206>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<28.193206,0.000000,6.134688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.364688,0.000000,5.963206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.588741,0.000000,5.870400>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<28.364688,0.000000,5.963206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.588741,0.000000,5.870400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.911256,0.000000,5.870400>}
box{<0,0,-0.203200><5.322516,0.035000,0.203200> rotate<0,0.000000,0> translate<28.588741,0.000000,5.870400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.862397,0.000000,31.879981>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.862400,0.000000,31.417075>}
box{<0,0,-0.203200><0.462906,0.035000,0.203200> rotate<0,89.993674,0> translate<28.862397,0.000000,31.879981> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.862397,0.000000,31.879981>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.979966,0.000000,31.879981>}
box{<0,0,-0.203200><1.117569,0.035000,0.203200> rotate<0,0.000000,0> translate<28.862397,0.000000,31.879981> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.862400,0.000000,31.417075>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.517075,0.000000,30.762400>}
box{<0,0,-0.203200><0.925850,0.035000,0.203200> rotate<0,44.997030,0> translate<28.862400,0.000000,31.417075> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.862400,0.000000,31.880013>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.979966,0.000000,31.880013>}
box{<0,0,-0.203200><1.117566,0.035000,0.203200> rotate<0,0.000000,0> translate<28.862400,0.000000,31.880013> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.862400,0.000000,32.342922>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.862400,0.000000,31.880013>}
box{<0,0,-0.203200><0.462909,0.035000,0.203200> rotate<0,-90.000000,0> translate<28.862400,0.000000,31.880013> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.862400,0.000000,32.342922>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.517075,0.000000,32.997597>}
box{<0,0,-0.203200><0.925850,0.035000,0.203200> rotate<0,-44.997030,0> translate<28.862400,0.000000,32.342922> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.080919,0.000000,23.650400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.538116,0.000000,23.193200>}
box{<0,0,-0.203200><0.646576,0.035000,0.203200> rotate<0,44.997226,0> translate<29.080919,0.000000,23.650400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.080919,0.000000,24.869597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.538116,0.000000,25.326797>}
box{<0,0,-0.203200><0.646576,0.035000,0.203200> rotate<0,-44.997226,0> translate<29.080919,0.000000,24.869597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.266697,0.000000,16.334597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.082494,0.000000,16.334597>}
box{<0,0,-0.203200><0.815797,0.035000,0.203200> rotate<0,0.000000,0> translate<29.266697,0.000000,16.334597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.266697,0.000000,16.334597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.502503,0.000000,18.570400>}
box{<0,0,-0.203200><3.161905,0.035000,0.203200> rotate<0,-44.996990,0> translate<29.266697,0.000000,16.334597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.517075,0.000000,30.762400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.979981,0.000000,30.762400>}
box{<0,0,-0.203200><0.462906,0.035000,0.203200> rotate<0,0.000000,0> translate<29.517075,0.000000,30.762400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.517075,0.000000,32.997597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.979981,0.000000,32.997597>}
box{<0,0,-0.203200><0.462906,0.035000,0.203200> rotate<0,0.000000,0> translate<29.517075,0.000000,32.997597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.538116,0.000000,23.193200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.421881,0.000000,23.193200>}
box{<0,0,-0.203200><0.883766,0.035000,0.203200> rotate<0,0.000000,0> translate<29.538116,0.000000,23.193200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.538116,0.000000,25.326797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.421881,0.000000,25.326797>}
box{<0,0,-0.203200><0.883766,0.035000,0.203200> rotate<0,0.000000,0> translate<29.538116,0.000000,25.326797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.594500,0.000000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.410297,0.000000,16.662400>}
box{<0,0,-0.203200><0.815797,0.035000,0.203200> rotate<0,0.000000,0> translate<29.594500,0.000000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.979966,0.000000,31.880013>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.979966,0.000000,31.879981>}
box{<0,0,-0.203200><0.000031,0.035000,0.203200> rotate<0,-90.000000,0> translate<29.979966,0.000000,31.879981> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.979981,0.000000,30.762400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.979981,0.000000,31.879966>}
box{<0,0,-0.203200><1.117566,0.035000,0.203200> rotate<0,90.000000,0> translate<29.979981,0.000000,31.879966> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.979981,0.000000,30.886400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.980013,0.000000,30.886400>}
box{<0,0,-0.203200><0.000031,0.035000,0.203200> rotate<0,0.000000,0> translate<29.979981,0.000000,30.886400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.979981,0.000000,31.292800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.980013,0.000000,31.292800>}
box{<0,0,-0.203200><0.000031,0.035000,0.203200> rotate<0,0.000000,0> translate<29.979981,0.000000,31.292800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.979981,0.000000,31.699200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.980013,0.000000,31.699200>}
box{<0,0,-0.203200><0.000031,0.035000,0.203200> rotate<0,0.000000,0> translate<29.979981,0.000000,31.699200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.979981,0.000000,31.879966>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.980013,0.000000,31.879966>}
box{<0,0,-0.203200><0.000031,0.035000,0.203200> rotate<0,0.000000,0> translate<29.979981,0.000000,31.879966> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.979981,0.000000,31.880031>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.979981,0.000000,32.997597>}
box{<0,0,-0.203200><1.117566,0.035000,0.203200> rotate<0,90.000000,0> translate<29.979981,0.000000,32.997597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.979981,0.000000,31.880031>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.980013,0.000000,31.880031>}
box{<0,0,-0.203200><0.000031,0.035000,0.203200> rotate<0,0.000000,0> translate<29.979981,0.000000,31.880031> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.979981,0.000000,32.105600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.980013,0.000000,32.105600>}
box{<0,0,-0.203200><0.000031,0.035000,0.203200> rotate<0,0.000000,0> translate<29.979981,0.000000,32.105600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.979981,0.000000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.980013,0.000000,32.512000>}
box{<0,0,-0.203200><0.000031,0.035000,0.203200> rotate<0,0.000000,0> translate<29.979981,0.000000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.979981,0.000000,32.918400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.980013,0.000000,32.918400>}
box{<0,0,-0.203200><0.000031,0.035000,0.203200> rotate<0,0.000000,0> translate<29.979981,0.000000,32.918400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.980013,0.000000,30.762400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.442922,0.000000,30.762400>}
box{<0,0,-0.203200><0.462909,0.035000,0.203200> rotate<0,0.000000,0> translate<29.980013,0.000000,30.762400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.980013,0.000000,31.879966>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.980013,0.000000,30.762400>}
box{<0,0,-0.203200><1.117566,0.035000,0.203200> rotate<0,-90.000000,0> translate<29.980013,0.000000,30.762400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.980013,0.000000,32.997597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.980013,0.000000,31.880031>}
box{<0,0,-0.203200><1.117566,0.035000,0.203200> rotate<0,-90.000000,0> translate<29.980013,0.000000,31.880031> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.980013,0.000000,32.997597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.442922,0.000000,32.997597>}
box{<0,0,-0.203200><0.462909,0.035000,0.203200> rotate<0,0.000000,0> translate<29.980013,0.000000,32.997597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.980031,0.000000,31.879981>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.980031,0.000000,31.880013>}
box{<0,0,-0.203200><0.000031,0.035000,0.203200> rotate<0,90.000000,0> translate<29.980031,0.000000,31.880013> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.980031,0.000000,31.879981>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.097594,0.000000,31.879981>}
box{<0,0,-0.203200><1.117563,0.035000,0.203200> rotate<0,0.000000,0> translate<29.980031,0.000000,31.879981> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.980031,0.000000,31.880013>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.097597,0.000000,31.880013>}
box{<0,0,-0.203200><1.117566,0.035000,0.203200> rotate<0,0.000000,0> translate<29.980031,0.000000,31.880013> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.000900,0.000000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.816697,0.000000,17.068800>}
box{<0,0,-0.203200><0.815797,0.035000,0.203200> rotate<0,0.000000,0> translate<30.000900,0.000000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.082494,0.000000,16.334597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.033206,0.000000,17.285309>}
box{<0,0,-0.203200><1.344511,0.035000,0.203200> rotate<0,-44.997030,0> translate<30.082494,0.000000,16.334597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.407300,0.000000,17.475200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.249134,0.000000,17.475200>}
box{<0,0,-0.203200><0.841834,0.035000,0.203200> rotate<0,0.000000,0> translate<30.407300,0.000000,17.475200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.421881,0.000000,23.193200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.879078,0.000000,23.650400>}
box{<0,0,-0.203200><0.646576,0.035000,0.203200> rotate<0,-44.997226,0> translate<30.421881,0.000000,23.193200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.421881,0.000000,25.326797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.879078,0.000000,24.869597>}
box{<0,0,-0.203200><0.646576,0.035000,0.203200> rotate<0,44.997226,0> translate<30.421881,0.000000,25.326797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.442922,0.000000,30.762400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.097597,0.000000,31.417075>}
box{<0,0,-0.203200><0.925850,0.035000,0.203200> rotate<0,-44.997030,0> translate<30.442922,0.000000,30.762400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.442922,0.000000,32.997597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.097597,0.000000,32.342922>}
box{<0,0,-0.203200><0.925850,0.035000,0.203200> rotate<0,44.997030,0> translate<30.442922,0.000000,32.997597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.522119,0.000000,32.918400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.514631,0.000000,32.918400>}
box{<0,0,-0.203200><4.992513,0.035000,0.203200> rotate<0,0.000000,0> translate<30.522119,0.000000,32.918400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.551878,0.000000,25.196800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.471094,0.000000,25.196800>}
box{<0,0,-0.203200><4.919216,0.035000,0.203200> rotate<0,0.000000,0> translate<30.551878,0.000000,25.196800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.566922,0.000000,30.886400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.526859,0.000000,30.886400>}
box{<0,0,-0.203200><3.959937,0.035000,0.203200> rotate<0,0.000000,0> translate<30.566922,0.000000,30.886400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.682797,0.000000,28.941800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.682800,0.000000,29.530191>}
box{<0,0,-0.203200><0.588391,0.035000,0.203200> rotate<0,-89.993756,0> translate<30.682797,0.000000,28.941800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.682797,0.000000,28.941800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.768178,0.000000,28.941800>}
box{<0,0,-0.203200><1.085381,0.035000,0.203200> rotate<0,0.000000,0> translate<30.682797,0.000000,28.941800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.682800,0.000000,28.109806>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.713956,0.000000,27.993525>}
box{<0,0,-0.203200><0.120383,0.035000,0.203200> rotate<0,74.995610,0> translate<30.682800,0.000000,28.109806> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.682800,0.000000,28.698194>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.682800,0.000000,28.109806>}
box{<0,0,-0.203200><0.588387,0.035000,0.203200> rotate<0,-90.000000,0> translate<30.682800,0.000000,28.109806> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.682800,0.000000,28.698194>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.768178,0.000000,28.698194>}
box{<0,0,-0.203200><1.085378,0.035000,0.203200> rotate<0,0.000000,0> translate<30.682800,0.000000,28.698194> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.682800,0.000000,29.530191>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.713956,0.000000,29.646472>}
box{<0,0,-0.203200><0.120383,0.035000,0.203200> rotate<0,-74.995610,0> translate<30.682800,0.000000,29.530191> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.713956,0.000000,27.993525>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.774147,0.000000,27.889272>}
box{<0,0,-0.203200><0.120381,0.035000,0.203200> rotate<0,59.996017,0> translate<30.713956,0.000000,27.993525> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.713956,0.000000,29.646472>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.774147,0.000000,29.750725>}
box{<0,0,-0.203200><0.120381,0.035000,0.203200> rotate<0,-59.996017,0> translate<30.713956,0.000000,29.646472> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.733600,0.000000,26.101662>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.971663,0.000000,25.863600>}
box{<0,0,-0.203200><0.336671,0.035000,0.203200> rotate<0,44.997030,0> translate<30.733600,0.000000,26.101662> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.733600,0.000000,26.190400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.733600,0.000000,26.101662>}
box{<0,0,-0.203200><0.088738,0.035000,0.203200> rotate<0,-90.000000,0> translate<30.733600,0.000000,26.101662> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.733600,0.000000,27.738334>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.733600,0.000000,27.409597>}
box{<0,0,-0.203200><0.328737,0.035000,0.203200> rotate<0,-90.000000,0> translate<30.733600,0.000000,27.409597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.733600,0.000000,27.738334>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.829344,0.000000,27.834075>}
box{<0,0,-0.203200><0.135400,0.035000,0.203200> rotate<0,-44.996095,0> translate<30.733600,0.000000,27.738334> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.774147,0.000000,27.889272>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.829344,0.000000,27.834075>}
box{<0,0,-0.203200><0.078060,0.035000,0.203200> rotate<0,44.997030,0> translate<30.774147,0.000000,27.889272> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.774147,0.000000,29.750725>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.859272,0.000000,29.835850>}
box{<0,0,-0.203200><0.120385,0.035000,0.203200> rotate<0,-44.997030,0> translate<30.774147,0.000000,29.750725> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.799878,0.000000,23.571200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.256694,0.000000,23.571200>}
box{<0,0,-0.203200><4.456816,0.035000,0.203200> rotate<0,0.000000,0> translate<30.799878,0.000000,23.571200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.813700,0.000000,17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.709497,0.000000,17.881600>}
box{<0,0,-0.203200><5.895797,0.035000,0.203200> rotate<0,0.000000,0> translate<30.813700,0.000000,17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.859272,0.000000,29.835850>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.963525,0.000000,29.896041>}
box{<0,0,-0.203200><0.120381,0.035000,0.203200> rotate<0,-29.998043,0> translate<30.859272,0.000000,29.835850> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.879078,0.000000,23.650400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.177494,0.000000,23.650400>}
box{<0,0,-0.203200><4.298416,0.035000,0.203200> rotate<0,0.000000,0> translate<30.879078,0.000000,23.650400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.879078,0.000000,24.869597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.551256,0.000000,24.869597>}
box{<0,0,-0.203200><4.672178,0.035000,0.203200> rotate<0,0.000000,0> translate<30.879078,0.000000,24.869597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.928519,0.000000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.237550,0.000000,32.512000>}
box{<0,0,-0.203200><4.309031,0.035000,0.203200> rotate<0,0.000000,0> translate<30.928519,0.000000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.963525,0.000000,29.896041>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.079806,0.000000,29.927197>}
box{<0,0,-0.203200><0.120383,0.035000,0.203200> rotate<0,-14.998451,0> translate<30.963525,0.000000,29.896041> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.971663,0.000000,25.863600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.808334,0.000000,25.863600>}
box{<0,0,-0.203200><1.836672,0.035000,0.203200> rotate<0,0.000000,0> translate<30.971663,0.000000,25.863600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.973322,0.000000,31.292800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.652216,0.000000,31.292800>}
box{<0,0,-0.203200><3.678894,0.035000,0.203200> rotate<0,0.000000,0> translate<30.973322,0.000000,31.292800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.033206,0.000000,17.285309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.204688,0.000000,17.456791>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<31.033206,0.000000,17.285309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.079806,0.000000,29.927197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.768194,0.000000,29.927197>}
box{<0,0,-0.203200><0.688388,0.035000,0.203200> rotate<0,0.000000,0> translate<31.079806,0.000000,29.927197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.097594,0.000000,31.879981>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.097597,0.000000,31.417075>}
box{<0,0,-0.203200><0.462906,0.035000,0.203200> rotate<0,89.993674,0> translate<31.097594,0.000000,31.879981> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.097597,0.000000,31.699200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.777572,0.000000,31.699200>}
box{<0,0,-0.203200><3.679975,0.035000,0.203200> rotate<0,0.000000,0> translate<31.097597,0.000000,31.699200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.097597,0.000000,31.880013>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.097597,0.000000,32.342922>}
box{<0,0,-0.203200><0.462909,0.035000,0.203200> rotate<0,90.000000,0> translate<31.097597,0.000000,32.342922> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.097597,0.000000,32.105600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.960472,0.000000,32.105600>}
box{<0,0,-0.203200><3.862875,0.035000,0.203200> rotate<0,0.000000,0> translate<31.097597,0.000000,32.105600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.204688,0.000000,17.456791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.428741,0.000000,17.549597>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<31.204688,0.000000,17.456791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.220100,0.000000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.137631,0.000000,18.288000>}
box{<0,0,-0.203200><1.917531,0.035000,0.203200> rotate<0,0.000000,0> translate<31.220100,0.000000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.428741,0.000000,17.549597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.377494,0.000000,17.549597>}
box{<0,0,-0.203200><4.948753,0.035000,0.203200> rotate<0,0.000000,0> translate<31.428741,0.000000,17.549597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.451697,0.000000,19.789597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.772503,0.000000,21.110400>}
box{<0,0,-0.203200><1.867900,0.035000,0.203200> rotate<0,-44.996962,0> translate<31.451697,0.000000,19.789597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.451697,0.000000,19.789597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.885838,0.000000,19.789597>}
box{<0,0,-0.203200><1.434141,0.035000,0.203200> rotate<0,0.000000,0> translate<31.451697,0.000000,19.789597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.502503,0.000000,18.570400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.885838,0.000000,18.570400>}
box{<0,0,-0.203200><1.383334,0.035000,0.203200> rotate<0,0.000000,0> translate<31.502503,0.000000,18.570400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.575700,0.000000,19.913600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.979234,0.000000,19.913600>}
box{<0,0,-0.203200><1.403534,0.035000,0.203200> rotate<0,0.000000,0> translate<31.575700,0.000000,19.913600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.768178,0.000000,28.941800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.768178,0.000000,28.698194>}
box{<0,0,-0.203200><0.243606,0.035000,0.203200> rotate<0,-90.000000,0> translate<31.768178,0.000000,28.698194> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.768194,0.000000,28.941819>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.768194,0.000000,29.927197>}
box{<0,0,-0.203200><0.985378,0.035000,0.203200> rotate<0,90.000000,0> translate<31.768194,0.000000,29.927197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.768194,0.000000,28.941819>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.011800,0.000000,28.941819>}
box{<0,0,-0.203200><0.243606,0.035000,0.203200> rotate<0,0.000000,0> translate<31.768194,0.000000,28.941819> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.768194,0.000000,29.260800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.011800,0.000000,29.260800>}
box{<0,0,-0.203200><0.243606,0.035000,0.203200> rotate<0,0.000000,0> translate<31.768194,0.000000,29.260800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.768194,0.000000,29.667200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.011800,0.000000,29.667200>}
box{<0,0,-0.203200><0.243606,0.035000,0.203200> rotate<0,0.000000,0> translate<31.768194,0.000000,29.667200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.982100,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.597034,0.000000,20.320000>}
box{<0,0,-0.203200><1.614934,0.035000,0.203200> rotate<0,0.000000,0> translate<31.982100,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.003206,0.000000,22.065309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.003206,0.000000,22.065306>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,-90.000000,0> translate<32.003206,0.000000,22.065306> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.003206,0.000000,22.065309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.174688,0.000000,22.236791>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<32.003206,0.000000,22.065309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.011800,0.000000,29.927197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.011800,0.000000,28.941819>}
box{<0,0,-0.203200><0.985378,0.035000,0.203200> rotate<0,-90.000000,0> translate<32.011800,0.000000,28.941819> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.011800,0.000000,29.927197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.700191,0.000000,29.927197>}
box{<0,0,-0.203200><0.688391,0.035000,0.203200> rotate<0,0.000000,0> translate<32.011800,0.000000,29.927197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.011819,0.000000,28.698194>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.011819,0.000000,28.941800>}
box{<0,0,-0.203200><0.243606,0.035000,0.203200> rotate<0,90.000000,0> translate<32.011819,0.000000,28.941800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.011819,0.000000,28.698194>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.097197,0.000000,28.698194>}
box{<0,0,-0.203200><1.085378,0.035000,0.203200> rotate<0,0.000000,0> translate<32.011819,0.000000,28.698194> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.011819,0.000000,28.854400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.668497,0.000000,28.854400>}
box{<0,0,-0.203200><2.656678,0.035000,0.203200> rotate<0,0.000000,0> translate<32.011819,0.000000,28.854400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.011819,0.000000,28.941800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.097194,0.000000,28.941800>}
box{<0,0,-0.203200><1.085375,0.035000,0.203200> rotate<0,0.000000,0> translate<32.011819,0.000000,28.941800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.174688,0.000000,22.236791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.398741,0.000000,22.329597>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<32.174688,0.000000,22.236791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.388500,0.000000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.243581,0.000000,20.726400>}
box{<0,0,-0.203200><0.855081,0.035000,0.203200> rotate<0,0.000000,0> translate<32.388500,0.000000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.398741,0.000000,22.329597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.885838,0.000000,22.329597>}
box{<0,0,-0.203200><0.487097,0.035000,0.203200> rotate<0,0.000000,0> translate<32.398741,0.000000,22.329597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.700191,0.000000,29.927197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.816472,0.000000,29.896041>}
box{<0,0,-0.203200><0.120383,0.035000,0.203200> rotate<0,14.998451,0> translate<32.700191,0.000000,29.927197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.772503,0.000000,21.110400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.885838,0.000000,21.110400>}
box{<0,0,-0.203200><0.113334,0.035000,0.203200> rotate<0,0.000000,0> translate<32.772503,0.000000,21.110400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.808334,0.000000,25.863600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.046397,0.000000,26.101662>}
box{<0,0,-0.203200><0.336671,0.035000,0.203200> rotate<0,-44.997030,0> translate<32.808334,0.000000,25.863600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.816472,0.000000,29.896041>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.920725,0.000000,29.835850>}
box{<0,0,-0.203200><0.120381,0.035000,0.203200> rotate<0,29.998043,0> translate<32.816472,0.000000,29.896041> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.885838,0.000000,18.570400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.907478,0.000000,18.518153>}
box{<0,0,-0.203200><0.056551,0.035000,0.203200> rotate<0,67.496237,0> translate<32.885838,0.000000,18.570400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.885838,0.000000,19.789597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.907478,0.000000,19.841844>}
box{<0,0,-0.203200><0.056551,0.035000,0.203200> rotate<0,-67.496237,0> translate<32.885838,0.000000,19.789597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.885838,0.000000,21.110400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.907478,0.000000,21.058153>}
box{<0,0,-0.203200><0.056551,0.035000,0.203200> rotate<0,67.496237,0> translate<32.885838,0.000000,21.110400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.885838,0.000000,22.329597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.907478,0.000000,22.381844>}
box{<0,0,-0.203200><0.056551,0.035000,0.203200> rotate<0,-67.496237,0> translate<32.885838,0.000000,22.329597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.907478,0.000000,18.518153>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.236153,0.000000,18.189478>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,44.997030,0> translate<32.907478,0.000000,18.518153> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.907478,0.000000,19.841844>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.236153,0.000000,20.170519>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,-44.997030,0> translate<32.907478,0.000000,19.841844> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.907478,0.000000,21.058153>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.236153,0.000000,20.729478>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,44.997030,0> translate<32.907478,0.000000,21.058153> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.907478,0.000000,22.381844>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.236153,0.000000,22.710519>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,-44.997030,0> translate<32.907478,0.000000,22.381844> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.920725,0.000000,29.835850>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.005850,0.000000,29.750725>}
box{<0,0,-0.203200><0.120385,0.035000,0.203200> rotate<0,44.997030,0> translate<32.920725,0.000000,29.835850> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.950653,0.000000,27.834075>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.005850,0.000000,27.889272>}
box{<0,0,-0.203200><0.078060,0.035000,0.203200> rotate<0,-44.997030,0> translate<32.950653,0.000000,27.834075> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.950653,0.000000,27.834075>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.046397,0.000000,27.738334>}
box{<0,0,-0.203200><0.135400,0.035000,0.203200> rotate<0,44.996095,0> translate<32.950653,0.000000,27.834075> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.954334,0.000000,26.009600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.658294,0.000000,26.009600>}
box{<0,0,-0.203200><1.703959,0.035000,0.203200> rotate<0,0.000000,0> translate<32.954334,0.000000,26.009600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.005850,0.000000,27.889272>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.066041,0.000000,27.993525>}
box{<0,0,-0.203200><0.120381,0.035000,0.203200> rotate<0,-59.996017,0> translate<33.005850,0.000000,27.889272> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.005850,0.000000,29.750725>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.066041,0.000000,29.646472>}
box{<0,0,-0.203200><0.120381,0.035000,0.203200> rotate<0,59.996017,0> translate<33.005850,0.000000,29.750725> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.046397,0.000000,26.101662>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.046397,0.000000,26.190400>}
box{<0,0,-0.203200><0.088738,0.035000,0.203200> rotate<0,90.000000,0> translate<33.046397,0.000000,26.190400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.046397,0.000000,26.190400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.477494,0.000000,26.190400>}
box{<0,0,-0.203200><1.431097,0.035000,0.203200> rotate<0,0.000000,0> translate<33.046397,0.000000,26.190400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.046397,0.000000,27.409597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.046397,0.000000,27.738334>}
box{<0,0,-0.203200><0.328737,0.035000,0.203200> rotate<0,90.000000,0> translate<33.046397,0.000000,27.738334> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.046397,0.000000,27.409597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.851256,0.000000,27.409597>}
box{<0,0,-0.203200><1.804859,0.035000,0.203200> rotate<0,0.000000,0> translate<33.046397,0.000000,27.409597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.046397,0.000000,27.635200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.273544,0.000000,27.635200>}
box{<0,0,-0.203200><2.227147,0.035000,0.203200> rotate<0,0.000000,0> translate<33.046397,0.000000,27.635200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.054075,0.000000,29.667200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.480463,0.000000,29.667200>}
box{<0,0,-0.203200><1.426387,0.035000,0.203200> rotate<0,0.000000,0> translate<33.054075,0.000000,29.667200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.066041,0.000000,27.993525>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.097197,0.000000,28.109806>}
box{<0,0,-0.203200><0.120383,0.035000,0.203200> rotate<0,-74.995610,0> translate<33.066041,0.000000,27.993525> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.066041,0.000000,29.646472>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.097197,0.000000,29.530191>}
box{<0,0,-0.203200><0.120383,0.035000,0.203200> rotate<0,74.995610,0> translate<33.066041,0.000000,29.646472> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.078919,0.000000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.996466,0.000000,28.041600>}
box{<0,0,-0.203200><1.917547,0.035000,0.203200> rotate<0,0.000000,0> translate<33.078919,0.000000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.097194,0.000000,28.941800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.097197,0.000000,29.530191>}
box{<0,0,-0.203200><0.588391,0.035000,0.203200> rotate<0,-89.993756,0> translate<33.097194,0.000000,28.941800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.097194,0.000000,29.260800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.543141,0.000000,29.260800>}
box{<0,0,-0.203200><1.445947,0.035000,0.203200> rotate<0,0.000000,0> translate<33.097194,0.000000,29.260800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.097197,0.000000,28.109806>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.097197,0.000000,28.698194>}
box{<0,0,-0.203200><0.588387,0.035000,0.203200> rotate<0,90.000000,0> translate<33.097197,0.000000,28.698194> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.097197,0.000000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.793853,0.000000,28.448000>}
box{<0,0,-0.203200><1.696656,0.035000,0.203200> rotate<0,0.000000,0> translate<33.097197,0.000000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.236153,0.000000,18.189478>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.665588,0.000000,18.011600>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,22.498581,0> translate<33.236153,0.000000,18.189478> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.236153,0.000000,20.170519>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.665588,0.000000,20.348397>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,-22.498581,0> translate<33.236153,0.000000,20.170519> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.236153,0.000000,20.729478>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.665588,0.000000,20.551600>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,22.498581,0> translate<33.236153,0.000000,20.729478> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.236153,0.000000,22.710519>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.665588,0.000000,22.888397>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,-22.498581,0> translate<33.236153,0.000000,22.710519> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.511959,0.000000,7.089597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.537497,0.000000,7.089597>}
box{<0,0,-0.203200><0.025537,0.035000,0.203200> rotate<0,0.000000,0> translate<33.511959,0.000000,7.089597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.511959,0.000000,7.089597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.688397,0.000000,7.266031>}
box{<0,0,-0.203200><0.249518,0.035000,0.203200> rotate<0,-44.996523,0> translate<33.511959,0.000000,7.089597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.511959,0.000000,8.410400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.688397,0.000000,8.233966>}
box{<0,0,-0.203200><0.249518,0.035000,0.203200> rotate<0,44.996523,0> translate<33.511959,0.000000,8.410400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.511959,0.000000,8.410400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.911256,0.000000,8.410400>}
box{<0,0,-0.203200><0.399297,0.035000,0.203200> rotate<0,0.000000,0> translate<33.511959,0.000000,8.410400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.511959,0.000000,9.629597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.537494,0.000000,9.629597>}
box{<0,0,-0.203200><0.025534,0.035000,0.203200> rotate<0,0.000000,0> translate<33.511959,0.000000,9.629597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.511959,0.000000,9.629597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.688397,0.000000,9.806031>}
box{<0,0,-0.203200><0.249518,0.035000,0.203200> rotate<0,-44.996523,0> translate<33.511959,0.000000,9.629597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.511959,0.000000,10.950400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.688397,0.000000,10.773966>}
box{<0,0,-0.203200><0.249518,0.035000,0.203200> rotate<0,44.996523,0> translate<33.511959,0.000000,10.950400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.511959,0.000000,10.950400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.911256,0.000000,10.950400>}
box{<0,0,-0.203200><0.399297,0.035000,0.203200> rotate<0,0.000000,0> translate<33.511959,0.000000,10.950400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.511959,0.000000,12.169597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.537494,0.000000,12.169597>}
box{<0,0,-0.203200><0.025534,0.035000,0.203200> rotate<0,0.000000,0> translate<33.511959,0.000000,12.169597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.511959,0.000000,12.169597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.688397,0.000000,12.346031>}
box{<0,0,-0.203200><0.249518,0.035000,0.203200> rotate<0,-44.996523,0> translate<33.511959,0.000000,12.169597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.511959,0.000000,13.490400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.688397,0.000000,13.313966>}
box{<0,0,-0.203200><0.249518,0.035000,0.203200> rotate<0,44.996523,0> translate<33.511959,0.000000,13.490400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.511959,0.000000,13.490400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.911256,0.000000,13.490400>}
box{<0,0,-0.203200><0.399297,0.035000,0.203200> rotate<0,0.000000,0> translate<33.511959,0.000000,13.490400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.534363,0.000000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.559897,0.000000,12.192000>}
box{<0,0,-0.203200><0.025534,0.035000,0.203200> rotate<0,0.000000,0> translate<33.534363,0.000000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.537494,0.000000,9.629597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.891600,0.000000,9.983703>}
box{<0,0,-0.203200><0.500782,0.035000,0.203200> rotate<0,-44.997030,0> translate<33.537494,0.000000,9.629597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.537494,0.000000,12.169597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.891600,0.000000,12.523703>}
box{<0,0,-0.203200><0.500782,0.035000,0.203200> rotate<0,-44.997030,0> translate<33.537494,0.000000,12.169597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.537497,0.000000,7.089597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.891600,0.000000,7.443700>}
box{<0,0,-0.203200><0.500777,0.035000,0.203200> rotate<0,-44.997030,0> translate<33.537497,0.000000,7.089597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.591163,0.000000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.988834,0.000000,13.411200>}
box{<0,0,-0.203200><0.397672,0.035000,0.203200> rotate<0,0.000000,0> translate<33.591163,0.000000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.635963,0.000000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.661497,0.000000,9.753600>}
box{<0,0,-0.203200><0.025534,0.035000,0.203200> rotate<0,0.000000,0> translate<33.635963,0.000000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.665588,0.000000,18.011600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.654409,0.000000,18.011600>}
box{<0,0,-0.203200><1.988822,0.035000,0.203200> rotate<0,0.000000,0> translate<33.665588,0.000000,18.011600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.665588,0.000000,20.348397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.654409,0.000000,20.348397>}
box{<0,0,-0.203200><1.988822,0.035000,0.203200> rotate<0,0.000000,0> translate<33.665588,0.000000,20.348397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.665588,0.000000,20.551600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.654409,0.000000,20.551600>}
box{<0,0,-0.203200><1.988822,0.035000,0.203200> rotate<0,0.000000,0> translate<33.665588,0.000000,20.551600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.665588,0.000000,22.888397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.654409,0.000000,22.888397>}
box{<0,0,-0.203200><1.988822,0.035000,0.203200> rotate<0,0.000000,0> translate<33.665588,0.000000,22.888397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.688397,0.000000,7.266031>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.688397,0.000000,8.233966>}
box{<0,0,-0.203200><0.967934,0.035000,0.203200> rotate<0,90.000000,0> translate<33.688397,0.000000,8.233966> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.688397,0.000000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.763100,0.000000,7.315200>}
box{<0,0,-0.203200><0.074703,0.035000,0.203200> rotate<0,0.000000,0> translate<33.688397,0.000000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.688397,0.000000,7.721600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.891600,0.000000,7.721600>}
box{<0,0,-0.203200><0.203203,0.035000,0.203200> rotate<0,0.000000,0> translate<33.688397,0.000000,7.721600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.688397,0.000000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.891600,0.000000,8.128000>}
box{<0,0,-0.203200><0.203203,0.035000,0.203200> rotate<0,0.000000,0> translate<33.688397,0.000000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.688397,0.000000,9.806031>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.688397,0.000000,10.773966>}
box{<0,0,-0.203200><0.967934,0.035000,0.203200> rotate<0,90.000000,0> translate<33.688397,0.000000,10.773966> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.688397,0.000000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.891600,0.000000,10.160000>}
box{<0,0,-0.203200><0.203203,0.035000,0.203200> rotate<0,0.000000,0> translate<33.688397,0.000000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.688397,0.000000,10.566400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.891600,0.000000,10.566400>}
box{<0,0,-0.203200><0.203203,0.035000,0.203200> rotate<0,0.000000,0> translate<33.688397,0.000000,10.566400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.688397,0.000000,12.346031>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.688397,0.000000,13.313966>}
box{<0,0,-0.203200><0.967934,0.035000,0.203200> rotate<0,90.000000,0> translate<33.688397,0.000000,13.313966> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.688397,0.000000,12.598400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.891600,0.000000,12.598400>}
box{<0,0,-0.203200><0.203203,0.035000,0.203200> rotate<0,0.000000,0> translate<33.688397,0.000000,12.598400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.688397,0.000000,13.004800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.891600,0.000000,13.004800>}
box{<0,0,-0.203200><0.203203,0.035000,0.203200> rotate<0,0.000000,0> translate<33.688397,0.000000,13.004800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.891600,0.000000,8.233966>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.891600,0.000000,7.443700>}
box{<0,0,-0.203200><0.790266,0.035000,0.203200> rotate<0,-90.000000,0> translate<33.891600,0.000000,7.443700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.891600,0.000000,8.233966>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.576031,0.000000,8.918397>}
box{<0,0,-0.203200><0.967932,0.035000,0.203200> rotate<0,-44.997030,0> translate<33.891600,0.000000,8.233966> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.891600,0.000000,10.773966>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.891600,0.000000,9.983703>}
box{<0,0,-0.203200><0.790263,0.035000,0.203200> rotate<0,-90.000000,0> translate<33.891600,0.000000,9.983703> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.891600,0.000000,10.773966>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.576031,0.000000,11.458397>}
box{<0,0,-0.203200><0.967932,0.035000,0.203200> rotate<0,-44.997030,0> translate<33.891600,0.000000,10.773966> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.891600,0.000000,13.313966>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.891600,0.000000,12.523703>}
box{<0,0,-0.203200><0.790262,0.035000,0.203200> rotate<0,-90.000000,0> translate<33.891600,0.000000,12.523703> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.891600,0.000000,13.313966>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.576031,0.000000,13.998397>}
box{<0,0,-0.203200><0.967932,0.035000,0.203200> rotate<0,-44.997030,0> translate<33.891600,0.000000,13.313966> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.911256,0.000000,5.870400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.135309,0.000000,5.963206>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<33.911256,0.000000,5.870400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.911256,0.000000,8.410400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.135309,0.000000,8.503206>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<33.911256,0.000000,8.410400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.911256,0.000000,10.950400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.135309,0.000000,11.043206>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<33.911256,0.000000,10.950400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.911256,0.000000,13.490400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.135309,0.000000,13.583206>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<33.911256,0.000000,13.490400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.965334,0.000000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.090434,0.000000,10.972800>}
box{<0,0,-0.203200><0.125100,0.035000,0.203200> rotate<0,0.000000,0> translate<33.965334,0.000000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.135309,0.000000,5.963206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.306791,0.000000,6.134688>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<34.135309,0.000000,5.963206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.135309,0.000000,8.503206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.753703,0.000000,9.121600>}
box{<0,0,-0.203200><0.874541,0.035000,0.203200> rotate<0,-44.997030,0> translate<34.135309,0.000000,8.503206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.135309,0.000000,11.043206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.753703,0.000000,11.661600>}
box{<0,0,-0.203200><0.874541,0.035000,0.203200> rotate<0,-44.997030,0> translate<34.135309,0.000000,11.043206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.135309,0.000000,13.583206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.753700,0.000000,14.201600>}
box{<0,0,-0.203200><0.874539,0.035000,0.203200> rotate<0,-44.997175,0> translate<34.135309,0.000000,13.583206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.166503,0.000000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.192034,0.000000,8.534400>}
box{<0,0,-0.203200><0.025531,0.035000,0.203200> rotate<0,0.000000,0> translate<34.166503,0.000000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.268103,0.000000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.623897,0.000000,6.096000>}
box{<0,0,-0.203200><3.355794,0.035000,0.203200> rotate<0,0.000000,0> translate<34.268103,0.000000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.306791,0.000000,6.134688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.306791,0.000000,6.134691>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,90.000000,0> translate<34.306791,0.000000,6.134691> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.306791,0.000000,6.134691>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.753700,0.000000,6.581600>}
box{<0,0,-0.203200><0.632025,0.035000,0.203200> rotate<0,-44.997030,0> translate<34.306791,0.000000,6.134691> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.369700,0.000000,13.817600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.395234,0.000000,13.817600>}
box{<0,0,-0.203200><0.025534,0.035000,0.203200> rotate<0,0.000000,0> translate<34.369700,0.000000,13.817600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.471303,0.000000,11.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.496834,0.000000,11.379200>}
box{<0,0,-0.203200><0.025531,0.035000,0.203200> rotate<0,0.000000,0> translate<34.471303,0.000000,11.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.477494,0.000000,26.190400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.260400,0.000000,22.407494>}
box{<0,0,-0.203200><5.349837,0.035000,0.203200> rotate<0,44.997030,0> translate<34.477494,0.000000,26.190400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.480463,0.000000,29.464003>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.855384,0.000000,28.248528>}
box{<0,0,-0.203200><1.271985,0.035000,0.203200> rotate<0,72.852443,0> translate<34.480463,0.000000,29.464003> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.480463,0.000000,30.735994>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.480463,0.000000,29.464003>}
box{<0,0,-0.203200><1.271991,0.035000,0.203200> rotate<0,-90.000000,0> translate<34.480463,0.000000,29.464003> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.480463,0.000000,30.735994>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.855384,0.000000,31.951466>}
box{<0,0,-0.203200><1.271982,0.035000,0.203200> rotate<0,-72.852401,0> translate<34.480463,0.000000,30.735994> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.572903,0.000000,8.940800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.260400,0.000000,8.940800>}
box{<0,0,-0.203200><3.687497,0.035000,0.203200> rotate<0,0.000000,0> translate<34.572903,0.000000,8.940800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.576031,0.000000,8.918397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.543966,0.000000,8.918397>}
box{<0,0,-0.203200><0.967934,0.035000,0.203200> rotate<0,0.000000,0> translate<34.576031,0.000000,8.918397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.576031,0.000000,11.458397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.543966,0.000000,11.458397>}
box{<0,0,-0.203200><0.967934,0.035000,0.203200> rotate<0,0.000000,0> translate<34.576031,0.000000,11.458397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.576031,0.000000,13.998397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.543966,0.000000,13.998397>}
box{<0,0,-0.203200><0.967934,0.035000,0.203200> rotate<0,0.000000,0> translate<34.576031,0.000000,13.998397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.674500,0.000000,6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.030297,0.000000,6.502400>}
box{<0,0,-0.203200><3.355797,0.035000,0.203200> rotate<0,0.000000,0> translate<34.674500,0.000000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.753700,0.000000,6.581600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.543966,0.000000,6.581600>}
box{<0,0,-0.203200><0.790266,0.035000,0.203200> rotate<0,0.000000,0> translate<34.753700,0.000000,6.581600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.753700,0.000000,14.201600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.543966,0.000000,14.201600>}
box{<0,0,-0.203200><0.790266,0.035000,0.203200> rotate<0,0.000000,0> translate<34.753700,0.000000,14.201600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.753703,0.000000,9.121600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.543966,0.000000,9.121600>}
box{<0,0,-0.203200><0.790262,0.035000,0.203200> rotate<0,0.000000,0> translate<34.753703,0.000000,9.121600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.753703,0.000000,11.661600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.543966,0.000000,11.661600>}
box{<0,0,-0.203200><0.790262,0.035000,0.203200> rotate<0,0.000000,0> translate<34.753703,0.000000,11.661600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.851256,0.000000,27.409597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.075309,0.000000,27.316791>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<34.851256,0.000000,27.409597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.855384,0.000000,28.248528>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.571919,0.000000,27.197566>}
box{<0,0,-0.203200><1.271984,0.035000,0.203200> rotate<0,55.710599,0> translate<34.855384,0.000000,28.248528> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.855384,0.000000,31.951469>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.855384,0.000000,31.951466>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,-90.000000,0> translate<34.855384,0.000000,31.951466> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.855384,0.000000,31.951469>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.571919,0.000000,33.002428>}
box{<0,0,-0.203200><1.271982,0.035000,0.203200> rotate<0,-55.710519,0> translate<34.855384,0.000000,31.951469> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.075309,0.000000,27.316791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.246791,0.000000,27.145309>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<35.075309,0.000000,27.316791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.163300,0.000000,27.228800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.550622,0.000000,27.228800>}
box{<0,0,-0.203200><0.387322,0.035000,0.203200> rotate<0,0.000000,0> translate<35.163300,0.000000,27.228800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.177494,0.000000,23.650400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.990400,0.000000,21.837494>}
box{<0,0,-0.203200><2.563837,0.035000,0.203200> rotate<0,44.997030,0> translate<35.177494,0.000000,23.650400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.246791,0.000000,27.145309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.386791,0.000000,23.005309>}
box{<0,0,-0.203200><5.854844,0.035000,0.203200> rotate<0,44.997030,0> translate<35.246791,0.000000,27.145309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.543966,0.000000,6.581600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.228397,0.000000,7.266031>}
box{<0,0,-0.203200><0.967932,0.035000,0.203200> rotate<0,-44.997030,0> translate<35.543966,0.000000,6.581600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.543966,0.000000,8.918397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.228397,0.000000,8.233966>}
box{<0,0,-0.203200><0.967932,0.035000,0.203200> rotate<0,44.997030,0> translate<35.543966,0.000000,8.918397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.543966,0.000000,9.121600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.228397,0.000000,9.806031>}
box{<0,0,-0.203200><0.967932,0.035000,0.203200> rotate<0,-44.997030,0> translate<35.543966,0.000000,9.121600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.543966,0.000000,11.458397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.228397,0.000000,10.773966>}
box{<0,0,-0.203200><0.967932,0.035000,0.203200> rotate<0,44.997030,0> translate<35.543966,0.000000,11.458397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.543966,0.000000,11.661600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.228397,0.000000,12.346031>}
box{<0,0,-0.203200><0.967932,0.035000,0.203200> rotate<0,-44.997030,0> translate<35.543966,0.000000,11.661600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.543966,0.000000,13.998397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.228397,0.000000,13.313966>}
box{<0,0,-0.203200><0.967932,0.035000,0.203200> rotate<0,44.997030,0> translate<35.543966,0.000000,13.998397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.543966,0.000000,14.201600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.228397,0.000000,14.886031>}
box{<0,0,-0.203200><0.967932,0.035000,0.203200> rotate<0,-44.997030,0> translate<35.543966,0.000000,14.201600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.551256,0.000000,24.869597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.775309,0.000000,24.776791>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<35.551256,0.000000,24.869597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.566366,0.000000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.260400,0.000000,14.224000>}
box{<0,0,-0.203200><2.694034,0.035000,0.203200> rotate<0,0.000000,0> translate<35.566366,0.000000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.569700,0.000000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.042366,0.000000,26.822400>}
box{<0,0,-0.203200><0.472666,0.035000,0.203200> rotate<0,0.000000,0> translate<35.569700,0.000000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.571919,0.000000,27.197566>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.571922,0.000000,27.197566>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,0.000000,0> translate<35.571919,0.000000,27.197566> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.571919,0.000000,33.002431>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.571919,0.000000,33.002428>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,-90.000000,0> translate<35.571919,0.000000,33.002428> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.571919,0.000000,33.002431>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.645116,0.000000,33.060800>}
box{<0,0,-0.203200><0.093620,0.035000,0.203200> rotate<0,-38.567060,0> translate<35.571919,0.000000,33.002431> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.571922,0.000000,27.197566>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.566397,0.000000,26.404500>}
box{<0,0,-0.203200><1.271980,0.035000,0.203200> rotate<0,38.568822,0> translate<35.571922,0.000000,27.197566> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.623162,0.000000,11.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.260400,0.000000,11.379200>}
box{<0,0,-0.203200><2.637238,0.035000,0.203200> rotate<0,0.000000,0> translate<35.623162,0.000000,11.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.654409,0.000000,18.011600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.083844,0.000000,18.189478>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,-22.498581,0> translate<35.654409,0.000000,18.011600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.654409,0.000000,20.348397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.083844,0.000000,20.170519>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,22.498581,0> translate<35.654409,0.000000,20.348397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.654409,0.000000,20.551600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.083844,0.000000,20.729478>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,-22.498581,0> translate<35.654409,0.000000,20.551600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.654409,0.000000,22.888397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.083844,0.000000,22.710519>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,22.498581,0> translate<35.654409,0.000000,22.888397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.667966,0.000000,11.785600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.260400,0.000000,11.785600>}
box{<0,0,-0.203200><2.592434,0.035000,0.203200> rotate<0,0.000000,0> translate<35.667966,0.000000,11.785600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.722966,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.990400,0.000000,20.320000>}
box{<0,0,-0.203200><1.267434,0.035000,0.203200> rotate<0,0.000000,0> translate<35.722966,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.724763,0.000000,13.817600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.260400,0.000000,13.817600>}
box{<0,0,-0.203200><2.535637,0.035000,0.203200> rotate<0,0.000000,0> translate<35.724763,0.000000,13.817600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.742456,0.000000,24.790400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.877494,0.000000,24.790400>}
box{<0,0,-0.203200><0.135037,0.035000,0.203200> rotate<0,0.000000,0> translate<35.742456,0.000000,24.790400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.751959,0.000000,16.330400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.228397,0.000000,15.853966>}
box{<0,0,-0.203200><0.673782,0.035000,0.203200> rotate<0,44.996842,0> translate<35.751959,0.000000,16.330400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.751959,0.000000,16.330400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.751256,0.000000,16.330400>}
box{<0,0,-0.203200><0.999297,0.035000,0.203200> rotate<0,0.000000,0> translate<35.751959,0.000000,16.330400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.769566,0.000000,9.347200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.260400,0.000000,9.347200>}
box{<0,0,-0.203200><2.490834,0.035000,0.203200> rotate<0,0.000000,0> translate<35.769566,0.000000,9.347200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.775309,0.000000,24.776791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.946791,0.000000,24.605309>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<35.775309,0.000000,24.776791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.826363,0.000000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.260400,0.000000,16.256000>}
box{<0,0,-0.203200><2.434038,0.035000,0.203200> rotate<0,0.000000,0> translate<35.826363,0.000000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.871166,0.000000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.260400,0.000000,6.908800>}
box{<0,0,-0.203200><2.389234,0.035000,0.203200> rotate<0,0.000000,0> translate<35.871166,0.000000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.927962,0.000000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.260400,0.000000,8.534400>}
box{<0,0,-0.203200><2.332438,0.035000,0.203200> rotate<0,0.000000,0> translate<35.927962,0.000000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.946791,0.000000,24.605309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.116791,0.000000,22.435309>}
box{<0,0,-0.203200><3.068843,0.035000,0.203200> rotate<0,44.997030,0> translate<35.946791,0.000000,24.605309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.968250,0.000000,22.758400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.069494,0.000000,22.758400>}
box{<0,0,-0.203200><0.101244,0.035000,0.203200> rotate<0,0.000000,0> translate<35.968250,0.000000,22.758400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.972766,0.000000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.260400,0.000000,14.630400>}
box{<0,0,-0.203200><2.287634,0.035000,0.203200> rotate<0,0.000000,0> translate<35.972766,0.000000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.976100,0.000000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.551975,0.000000,26.416000>}
box{<0,0,-0.203200><0.575875,0.035000,0.203200> rotate<0,0.000000,0> translate<35.976100,0.000000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.029563,0.000000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.260400,0.000000,10.972800>}
box{<0,0,-0.203200><2.230837,0.035000,0.203200> rotate<0,0.000000,0> translate<36.029563,0.000000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.074366,0.000000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.260400,0.000000,12.192000>}
box{<0,0,-0.203200><2.186034,0.035000,0.203200> rotate<0,0.000000,0> translate<36.074366,0.000000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.076413,0.000000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.990400,0.000000,20.726400>}
box{<0,0,-0.203200><0.913987,0.035000,0.203200> rotate<0,0.000000,0> translate<36.076413,0.000000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.083844,0.000000,18.189478>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.412519,0.000000,18.518153>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,-44.997030,0> translate<36.083844,0.000000,18.189478> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.083844,0.000000,20.170519>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.412519,0.000000,19.841844>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,44.997030,0> translate<36.083844,0.000000,20.170519> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.083844,0.000000,20.729478>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.412519,0.000000,21.058153>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,-44.997030,0> translate<36.083844,0.000000,20.729478> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.083844,0.000000,22.710519>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.412519,0.000000,22.381844>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,44.997030,0> translate<36.083844,0.000000,22.710519> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.131163,0.000000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.260400,0.000000,13.411200>}
box{<0,0,-0.203200><2.129238,0.035000,0.203200> rotate<0,0.000000,0> translate<36.131163,0.000000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.168100,0.000000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.283894,0.000000,24.384000>}
box{<0,0,-0.203200><0.115794,0.035000,0.203200> rotate<0,0.000000,0> translate<36.168100,0.000000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.175966,0.000000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.260400,0.000000,9.753600>}
box{<0,0,-0.203200><2.084434,0.035000,0.203200> rotate<0,0.000000,0> translate<36.175966,0.000000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.182366,0.000000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.990400,0.000000,18.288000>}
box{<0,0,-0.203200><0.808034,0.035000,0.203200> rotate<0,0.000000,0> translate<36.182366,0.000000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.228397,0.000000,7.266031>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.228397,0.000000,8.233966>}
box{<0,0,-0.203200><0.967934,0.035000,0.203200> rotate<0,90.000000,0> translate<36.228397,0.000000,8.233966> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.228397,0.000000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.260400,0.000000,7.315200>}
box{<0,0,-0.203200><2.032003,0.035000,0.203200> rotate<0,0.000000,0> translate<36.228397,0.000000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.228397,0.000000,7.721600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.260400,0.000000,7.721600>}
box{<0,0,-0.203200><2.032003,0.035000,0.203200> rotate<0,0.000000,0> translate<36.228397,0.000000,7.721600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.228397,0.000000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.260400,0.000000,8.128000>}
box{<0,0,-0.203200><2.032003,0.035000,0.203200> rotate<0,0.000000,0> translate<36.228397,0.000000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.228397,0.000000,9.806031>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.228397,0.000000,10.773966>}
box{<0,0,-0.203200><0.967934,0.035000,0.203200> rotate<0,90.000000,0> translate<36.228397,0.000000,10.773966> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.228397,0.000000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.260400,0.000000,10.160000>}
box{<0,0,-0.203200><2.032003,0.035000,0.203200> rotate<0,0.000000,0> translate<36.228397,0.000000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.228397,0.000000,10.566400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.260400,0.000000,10.566400>}
box{<0,0,-0.203200><2.032003,0.035000,0.203200> rotate<0,0.000000,0> translate<36.228397,0.000000,10.566400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.228397,0.000000,12.346031>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.228397,0.000000,13.313966>}
box{<0,0,-0.203200><0.967934,0.035000,0.203200> rotate<0,90.000000,0> translate<36.228397,0.000000,13.313966> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.228397,0.000000,12.598400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.260400,0.000000,12.598400>}
box{<0,0,-0.203200><2.032003,0.035000,0.203200> rotate<0,0.000000,0> translate<36.228397,0.000000,12.598400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.228397,0.000000,13.004800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.260400,0.000000,13.004800>}
box{<0,0,-0.203200><2.032003,0.035000,0.203200> rotate<0,0.000000,0> translate<36.228397,0.000000,13.004800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.228397,0.000000,14.886031>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.228397,0.000000,15.853966>}
box{<0,0,-0.203200><0.967934,0.035000,0.203200> rotate<0,90.000000,0> translate<36.228397,0.000000,15.853966> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.228397,0.000000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.260400,0.000000,15.036800>}
box{<0,0,-0.203200><2.032003,0.035000,0.203200> rotate<0,0.000000,0> translate<36.228397,0.000000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.228397,0.000000,15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.260400,0.000000,15.443200>}
box{<0,0,-0.203200><2.032003,0.035000,0.203200> rotate<0,0.000000,0> translate<36.228397,0.000000,15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.228397,0.000000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.260400,0.000000,15.849600>}
box{<0,0,-0.203200><2.032003,0.035000,0.203200> rotate<0,0.000000,0> translate<36.228397,0.000000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.340763,0.000000,19.913600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.990400,0.000000,19.913600>}
box{<0,0,-0.203200><0.649637,0.035000,0.203200> rotate<0,0.000000,0> translate<36.340763,0.000000,19.913600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.377494,0.000000,17.549597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.990400,0.000000,18.162503>}
box{<0,0,-0.203200><0.866780,0.035000,0.203200> rotate<0,-44.997030,0> translate<36.377494,0.000000,17.549597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.382500,0.000000,26.009600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.572575,0.000000,26.009600>}
box{<0,0,-0.203200><1.190075,0.035000,0.203200> rotate<0,0.000000,0> translate<36.382500,0.000000,26.009600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.412519,0.000000,18.518153>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.590397,0.000000,18.947588>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,-67.495479,0> translate<36.412519,0.000000,18.518153> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.412519,0.000000,19.841844>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.590397,0.000000,19.412409>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,67.495479,0> translate<36.412519,0.000000,19.841844> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.412519,0.000000,21.058153>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.590397,0.000000,21.487588>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,-67.495479,0> translate<36.412519,0.000000,21.058153> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.412519,0.000000,22.381844>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.590397,0.000000,21.952409>}
box{<0,0,-0.203200><0.464817,0.035000,0.203200> rotate<0,67.495479,0> translate<36.412519,0.000000,22.381844> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.424881,0.000000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.475894,0.000000,22.352000>}
box{<0,0,-0.203200><0.051013,0.035000,0.203200> rotate<0,0.000000,0> translate<36.424881,0.000000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.443438,0.000000,21.132800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.990400,0.000000,21.132800>}
box{<0,0,-0.203200><0.546962,0.035000,0.203200> rotate<0,0.000000,0> translate<36.443438,0.000000,21.132800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.485522,0.000000,18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.990400,0.000000,18.694400>}
box{<0,0,-0.203200><0.504878,0.035000,0.203200> rotate<0,0.000000,0> translate<36.485522,0.000000,18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.551134,0.000000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.990400,0.000000,19.507200>}
box{<0,0,-0.203200><0.439266,0.035000,0.203200> rotate<0,0.000000,0> translate<36.551134,0.000000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.566397,0.000000,26.404497>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.750456,0.000000,25.939788>}
box{<0,0,-0.203200><1.271987,0.035000,0.203200> rotate<0,21.427170,0> translate<36.566397,0.000000,26.404497> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.566397,0.000000,26.404500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.566397,0.000000,26.404497>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,-90.000000,0> translate<36.566397,0.000000,26.404497> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.574500,0.000000,23.977600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.690294,0.000000,23.977600>}
box{<0,0,-0.203200><0.115794,0.035000,0.203200> rotate<0,0.000000,0> translate<36.574500,0.000000,23.977600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.590397,0.000000,18.947588>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.590397,0.000000,19.412409>}
box{<0,0,-0.203200><0.464822,0.035000,0.203200> rotate<0,90.000000,0> translate<36.590397,0.000000,19.412409> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.590397,0.000000,19.100800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.990400,0.000000,19.100800>}
box{<0,0,-0.203200><0.400003,0.035000,0.203200> rotate<0,0.000000,0> translate<36.590397,0.000000,19.100800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.590397,0.000000,21.487588>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.590397,0.000000,21.952409>}
box{<0,0,-0.203200><0.464822,0.035000,0.203200> rotate<0,90.000000,0> translate<36.590397,0.000000,21.952409> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.590397,0.000000,21.539200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.990400,0.000000,21.539200>}
box{<0,0,-0.203200><0.400003,0.035000,0.203200> rotate<0,0.000000,0> translate<36.590397,0.000000,21.539200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.590397,0.000000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.882294,0.000000,21.945600>}
box{<0,0,-0.203200><0.291897,0.035000,0.203200> rotate<0,0.000000,0> translate<36.590397,0.000000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.751256,0.000000,16.330400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.975309,0.000000,16.423206>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<36.751256,0.000000,16.330400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.788900,0.000000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.630800,0.000000,25.603200>}
box{<0,0,-0.203200><4.841900,0.035000,0.203200> rotate<0,0.000000,0> translate<36.788900,0.000000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.975309,0.000000,16.423206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.945309,0.000000,17.393206>}
box{<0,0,-0.203200><1.371787,0.035000,0.203200> rotate<0,-44.997030,0> translate<36.975309,0.000000,16.423206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.980900,0.000000,23.571200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.096694,0.000000,23.571200>}
box{<0,0,-0.203200><0.115794,0.035000,0.203200> rotate<0,0.000000,0> translate<36.980900,0.000000,23.571200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.990400,0.000000,21.837494>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.990400,0.000000,18.162503>}
box{<0,0,-0.203200><3.674991,0.035000,0.203200> rotate<0,-90.000000,0> translate<36.990400,0.000000,18.162503> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.195300,0.000000,25.196800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.630800,0.000000,25.196800>}
box{<0,0,-0.203200><4.435500,0.035000,0.203200> rotate<0,0.000000,0> translate<37.195300,0.000000,25.196800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.214503,0.000000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.260400,0.000000,16.662400>}
box{<0,0,-0.203200><1.045897,0.035000,0.203200> rotate<0,0.000000,0> translate<37.214503,0.000000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.347494,0.000000,5.819597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.260400,0.000000,6.732503>}
box{<0,0,-0.203200><1.291044,0.035000,0.203200> rotate<0,-44.997030,0> translate<37.347494,0.000000,5.819597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.387300,0.000000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.503094,0.000000,23.164800>}
box{<0,0,-0.203200><0.115794,0.035000,0.203200> rotate<0,0.000000,0> translate<37.387300,0.000000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.601700,0.000000,24.790400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.630800,0.000000,24.790400>}
box{<0,0,-0.203200><4.029100,0.035000,0.203200> rotate<0,0.000000,0> translate<37.601700,0.000000,24.790400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.620903,0.000000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.260400,0.000000,17.068800>}
box{<0,0,-0.203200><0.639497,0.035000,0.203200> rotate<0,0.000000,0> translate<37.620903,0.000000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.721256,0.000000,4.600400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.945309,0.000000,4.693206>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<37.721256,0.000000,4.600400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.750456,0.000000,25.939788>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.750459,0.000000,25.939788>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,0.000000,0> translate<37.750456,0.000000,25.939788> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.750459,0.000000,25.939788>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.018884,0.000000,25.844731>}
box{<0,0,-0.203200><1.271982,0.035000,0.203200> rotate<0,4.285474,0> translate<37.750459,0.000000,25.939788> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.793700,0.000000,22.758400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.909494,0.000000,22.758400>}
box{<0,0,-0.203200><0.115794,0.035000,0.203200> rotate<0,0.000000,0> translate<37.793700,0.000000,22.758400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.945309,0.000000,4.693206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.116791,0.000000,4.864688>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<37.945309,0.000000,4.693206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.945309,0.000000,17.393206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.116791,0.000000,17.564688>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<37.945309,0.000000,17.393206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.008100,0.000000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.630800,0.000000,24.384000>}
box{<0,0,-0.203200><3.622700,0.035000,0.203200> rotate<0,0.000000,0> translate<38.008100,0.000000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.027303,0.000000,17.475200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.260400,0.000000,17.475200>}
box{<0,0,-0.203200><0.233097,0.035000,0.203200> rotate<0,0.000000,0> translate<38.027303,0.000000,17.475200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.116791,0.000000,4.864688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.116791,0.000000,4.864691>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,90.000000,0> translate<38.116791,0.000000,4.864691> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.116791,0.000000,4.864691>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.215309,0.000000,5.963206>}
box{<0,0,-0.203200><1.553538,0.035000,0.203200> rotate<0,-44.996949,0> translate<38.116791,0.000000,4.864691> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.116791,0.000000,17.564688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.209597,0.000000,17.788741>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<38.116791,0.000000,17.564688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.116791,0.000000,22.435309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.209597,0.000000,22.211256>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<38.116791,0.000000,22.435309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.128900,0.000000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.630800,0.000000,4.876800>}
box{<0,0,-0.203200><3.501900,0.035000,0.203200> rotate<0,0.000000,0> translate<38.128900,0.000000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.151300,0.000000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.260400,0.000000,22.352000>}
box{<0,0,-0.203200><0.109100,0.035000,0.203200> rotate<0,0.000000,0> translate<38.151300,0.000000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.209597,0.000000,17.788741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.209597,0.000000,22.211256>}
box{<0,0,-0.203200><4.422516,0.035000,0.203200> rotate<0,90.000000,0> translate<38.209597,0.000000,22.211256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.209597,0.000000,17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.260400,0.000000,17.881600>}
box{<0,0,-0.203200><0.050803,0.035000,0.203200> rotate<0,0.000000,0> translate<38.209597,0.000000,17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.209597,0.000000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.260400,0.000000,18.288000>}
box{<0,0,-0.203200><0.050803,0.035000,0.203200> rotate<0,0.000000,0> translate<38.209597,0.000000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.209597,0.000000,18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.260400,0.000000,18.694400>}
box{<0,0,-0.203200><0.050803,0.035000,0.203200> rotate<0,0.000000,0> translate<38.209597,0.000000,18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.209597,0.000000,19.100800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.260400,0.000000,19.100800>}
box{<0,0,-0.203200><0.050803,0.035000,0.203200> rotate<0,0.000000,0> translate<38.209597,0.000000,19.100800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.209597,0.000000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.260400,0.000000,19.507200>}
box{<0,0,-0.203200><0.050803,0.035000,0.203200> rotate<0,0.000000,0> translate<38.209597,0.000000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.209597,0.000000,19.913600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.260400,0.000000,19.913600>}
box{<0,0,-0.203200><0.050803,0.035000,0.203200> rotate<0,0.000000,0> translate<38.209597,0.000000,19.913600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.209597,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.260400,0.000000,20.320000>}
box{<0,0,-0.203200><0.050803,0.035000,0.203200> rotate<0,0.000000,0> translate<38.209597,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.209597,0.000000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.260400,0.000000,20.726400>}
box{<0,0,-0.203200><0.050803,0.035000,0.203200> rotate<0,0.000000,0> translate<38.209597,0.000000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.209597,0.000000,21.132800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.260400,0.000000,21.132800>}
box{<0,0,-0.203200><0.050803,0.035000,0.203200> rotate<0,0.000000,0> translate<38.209597,0.000000,21.132800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.209597,0.000000,21.539200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.260400,0.000000,21.539200>}
box{<0,0,-0.203200><0.050803,0.035000,0.203200> rotate<0,0.000000,0> translate<38.209597,0.000000,21.539200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.209597,0.000000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.260400,0.000000,21.945600>}
box{<0,0,-0.203200><0.050803,0.035000,0.203200> rotate<0,0.000000,0> translate<38.209597,0.000000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.260400,0.000000,22.407494>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.260400,0.000000,6.732503>}
box{<0,0,-0.203200><15.674991,0.035000,0.203200> rotate<0,-90.000000,0> translate<38.260400,0.000000,6.732503> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.414500,0.000000,23.977600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.630800,0.000000,23.977600>}
box{<0,0,-0.203200><3.216300,0.035000,0.203200> rotate<0,0.000000,0> translate<38.414500,0.000000,23.977600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.535300,0.000000,5.283200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.630800,0.000000,5.283200>}
box{<0,0,-0.203200><3.095500,0.035000,0.203200> rotate<0,0.000000,0> translate<38.535300,0.000000,5.283200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.820900,0.000000,23.571200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.630800,0.000000,23.571200>}
box{<0,0,-0.203200><2.809900,0.035000,0.203200> rotate<0,0.000000,0> translate<38.820900,0.000000,23.571200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.941700,0.000000,5.689600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.630800,0.000000,5.689600>}
box{<0,0,-0.203200><2.689100,0.035000,0.203200> rotate<0,0.000000,0> translate<38.941700,0.000000,5.689600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.018884,0.000000,25.844731>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.018888,0.000000,25.844731>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,0.000000,0> translate<39.018884,0.000000,25.844731> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.018888,0.000000,25.844731>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.258978,0.000000,26.127775>}
box{<0,0,-0.203200><1.271982,0.035000,0.203200> rotate<0,-12.856345,0> translate<39.018888,0.000000,25.844731> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.215309,0.000000,5.963206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.386791,0.000000,6.134688>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<39.215309,0.000000,5.963206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.227300,0.000000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.630800,0.000000,23.164800>}
box{<0,0,-0.203200><2.403500,0.035000,0.203200> rotate<0,0.000000,0> translate<39.227300,0.000000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.348103,0.000000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.630800,0.000000,6.096000>}
box{<0,0,-0.203200><2.282697,0.035000,0.203200> rotate<0,0.000000,0> translate<39.348103,0.000000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.386791,0.000000,6.134688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.479597,0.000000,6.358741>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<39.386791,0.000000,6.134688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.386791,0.000000,23.005309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.479597,0.000000,22.781256>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<39.386791,0.000000,23.005309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.479597,0.000000,6.358741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.479597,0.000000,22.781256>}
box{<0,0,-0.203200><16.422516,0.035000,0.203200> rotate<0,90.000000,0> translate<39.479597,0.000000,22.781256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.479597,0.000000,6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.630800,0.000000,6.502400>}
box{<0,0,-0.203200><2.151203,0.035000,0.203200> rotate<0,0.000000,0> translate<39.479597,0.000000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.479597,0.000000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.630800,0.000000,6.908800>}
box{<0,0,-0.203200><2.151203,0.035000,0.203200> rotate<0,0.000000,0> translate<39.479597,0.000000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.479597,0.000000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.630800,0.000000,7.315200>}
box{<0,0,-0.203200><2.151203,0.035000,0.203200> rotate<0,0.000000,0> translate<39.479597,0.000000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.479597,0.000000,7.721600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.630800,0.000000,7.721600>}
box{<0,0,-0.203200><2.151203,0.035000,0.203200> rotate<0,0.000000,0> translate<39.479597,0.000000,7.721600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.479597,0.000000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.630800,0.000000,8.128000>}
box{<0,0,-0.203200><2.151203,0.035000,0.203200> rotate<0,0.000000,0> translate<39.479597,0.000000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.479597,0.000000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.630800,0.000000,8.534400>}
box{<0,0,-0.203200><2.151203,0.035000,0.203200> rotate<0,0.000000,0> translate<39.479597,0.000000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.479597,0.000000,8.940800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.630800,0.000000,8.940800>}
box{<0,0,-0.203200><2.151203,0.035000,0.203200> rotate<0,0.000000,0> translate<39.479597,0.000000,8.940800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.479597,0.000000,9.347200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.630800,0.000000,9.347200>}
box{<0,0,-0.203200><2.151203,0.035000,0.203200> rotate<0,0.000000,0> translate<39.479597,0.000000,9.347200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.479597,0.000000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.630800,0.000000,9.753600>}
box{<0,0,-0.203200><2.151203,0.035000,0.203200> rotate<0,0.000000,0> translate<39.479597,0.000000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.479597,0.000000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.630800,0.000000,10.160000>}
box{<0,0,-0.203200><2.151203,0.035000,0.203200> rotate<0,0.000000,0> translate<39.479597,0.000000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.479597,0.000000,10.566400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.630800,0.000000,10.566400>}
box{<0,0,-0.203200><2.151203,0.035000,0.203200> rotate<0,0.000000,0> translate<39.479597,0.000000,10.566400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.479597,0.000000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.630800,0.000000,10.972800>}
box{<0,0,-0.203200><2.151203,0.035000,0.203200> rotate<0,0.000000,0> translate<39.479597,0.000000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.479597,0.000000,11.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.630800,0.000000,11.379200>}
box{<0,0,-0.203200><2.151203,0.035000,0.203200> rotate<0,0.000000,0> translate<39.479597,0.000000,11.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.479597,0.000000,11.785600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.630800,0.000000,11.785600>}
box{<0,0,-0.203200><2.151203,0.035000,0.203200> rotate<0,0.000000,0> translate<39.479597,0.000000,11.785600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.479597,0.000000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.630800,0.000000,12.192000>}
box{<0,0,-0.203200><2.151203,0.035000,0.203200> rotate<0,0.000000,0> translate<39.479597,0.000000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.479597,0.000000,12.598400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.630800,0.000000,12.598400>}
box{<0,0,-0.203200><2.151203,0.035000,0.203200> rotate<0,0.000000,0> translate<39.479597,0.000000,12.598400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.479597,0.000000,13.004800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.630800,0.000000,13.004800>}
box{<0,0,-0.203200><2.151203,0.035000,0.203200> rotate<0,0.000000,0> translate<39.479597,0.000000,13.004800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.479597,0.000000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.630800,0.000000,13.411200>}
box{<0,0,-0.203200><2.151203,0.035000,0.203200> rotate<0,0.000000,0> translate<39.479597,0.000000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.479597,0.000000,13.817600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.630800,0.000000,13.817600>}
box{<0,0,-0.203200><2.151203,0.035000,0.203200> rotate<0,0.000000,0> translate<39.479597,0.000000,13.817600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.479597,0.000000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.630800,0.000000,14.224000>}
box{<0,0,-0.203200><2.151203,0.035000,0.203200> rotate<0,0.000000,0> translate<39.479597,0.000000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.479597,0.000000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.630800,0.000000,14.630400>}
box{<0,0,-0.203200><2.151203,0.035000,0.203200> rotate<0,0.000000,0> translate<39.479597,0.000000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.479597,0.000000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.630800,0.000000,15.036800>}
box{<0,0,-0.203200><2.151203,0.035000,0.203200> rotate<0,0.000000,0> translate<39.479597,0.000000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.479597,0.000000,15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.630800,0.000000,15.443200>}
box{<0,0,-0.203200><2.151203,0.035000,0.203200> rotate<0,0.000000,0> translate<39.479597,0.000000,15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.479597,0.000000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.630800,0.000000,15.849600>}
box{<0,0,-0.203200><2.151203,0.035000,0.203200> rotate<0,0.000000,0> translate<39.479597,0.000000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.479597,0.000000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.630800,0.000000,16.256000>}
box{<0,0,-0.203200><2.151203,0.035000,0.203200> rotate<0,0.000000,0> translate<39.479597,0.000000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.479597,0.000000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.630800,0.000000,16.662400>}
box{<0,0,-0.203200><2.151203,0.035000,0.203200> rotate<0,0.000000,0> translate<39.479597,0.000000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.479597,0.000000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.630800,0.000000,17.068800>}
box{<0,0,-0.203200><2.151203,0.035000,0.203200> rotate<0,0.000000,0> translate<39.479597,0.000000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.479597,0.000000,17.475200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.630800,0.000000,17.475200>}
box{<0,0,-0.203200><2.151203,0.035000,0.203200> rotate<0,0.000000,0> translate<39.479597,0.000000,17.475200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.479597,0.000000,17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.630800,0.000000,17.881600>}
box{<0,0,-0.203200><2.151203,0.035000,0.203200> rotate<0,0.000000,0> translate<39.479597,0.000000,17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.479597,0.000000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.630800,0.000000,18.288000>}
box{<0,0,-0.203200><2.151203,0.035000,0.203200> rotate<0,0.000000,0> translate<39.479597,0.000000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.479597,0.000000,18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.630800,0.000000,18.694400>}
box{<0,0,-0.203200><2.151203,0.035000,0.203200> rotate<0,0.000000,0> translate<39.479597,0.000000,18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.479597,0.000000,19.100800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.630800,0.000000,19.100800>}
box{<0,0,-0.203200><2.151203,0.035000,0.203200> rotate<0,0.000000,0> translate<39.479597,0.000000,19.100800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.479597,0.000000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.630800,0.000000,19.507200>}
box{<0,0,-0.203200><2.151203,0.035000,0.203200> rotate<0,0.000000,0> translate<39.479597,0.000000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.479597,0.000000,19.913600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.630800,0.000000,19.913600>}
box{<0,0,-0.203200><2.151203,0.035000,0.203200> rotate<0,0.000000,0> translate<39.479597,0.000000,19.913600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.479597,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.630800,0.000000,20.320000>}
box{<0,0,-0.203200><2.151203,0.035000,0.203200> rotate<0,0.000000,0> translate<39.479597,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.479597,0.000000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.630800,0.000000,20.726400>}
box{<0,0,-0.203200><2.151203,0.035000,0.203200> rotate<0,0.000000,0> translate<39.479597,0.000000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.479597,0.000000,21.132800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.630800,0.000000,21.132800>}
box{<0,0,-0.203200><2.151203,0.035000,0.203200> rotate<0,0.000000,0> translate<39.479597,0.000000,21.132800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.479597,0.000000,21.539200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.630800,0.000000,21.539200>}
box{<0,0,-0.203200><2.151203,0.035000,0.203200> rotate<0,0.000000,0> translate<39.479597,0.000000,21.539200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.479597,0.000000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.630800,0.000000,21.945600>}
box{<0,0,-0.203200><2.151203,0.035000,0.203200> rotate<0,0.000000,0> translate<39.479597,0.000000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.479597,0.000000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.630800,0.000000,22.352000>}
box{<0,0,-0.203200><2.151203,0.035000,0.203200> rotate<0,0.000000,0> translate<39.479597,0.000000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.479597,0.000000,22.758400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.630800,0.000000,22.758400>}
box{<0,0,-0.203200><2.151203,0.035000,0.203200> rotate<0,0.000000,0> translate<39.479597,0.000000,22.758400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.741219,0.000000,26.009600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.630800,0.000000,26.009600>}
box{<0,0,-0.203200><1.889581,0.035000,0.203200> rotate<0,0.000000,0> translate<39.741219,0.000000,26.009600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.258978,0.000000,26.127775>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.258981,0.000000,26.127775>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,0.000000,0> translate<40.258978,0.000000,26.127775> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.258981,0.000000,26.127775>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.360550,0.000000,26.763769>}
box{<0,0,-0.203200><1.271983,0.035000,0.203200> rotate<0,-29.998127,0> translate<40.258981,0.000000,26.127775> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.758197,0.000000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.630800,0.000000,26.416000>}
box{<0,0,-0.203200><0.872603,0.035000,0.203200> rotate<0,0.000000,0> translate<40.758197,0.000000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.360550,0.000000,26.763769>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.360553,0.000000,26.763769>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,0.000000,0> translate<41.360550,0.000000,26.763769> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.360553,0.000000,26.763769>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.630800,0.000000,27.055028>}
box{<0,0,-0.203200><0.397323,0.035000,0.203200> rotate<0,-47.139992,0> translate<41.360553,0.000000,26.763769> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.414953,0.000000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.630800,0.000000,26.822400>}
box{<0,0,-0.203200><0.215847,0.035000,0.203200> rotate<0,0.000000,0> translate<41.414953,0.000000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.630800,0.000000,27.055028>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.630800,0.000000,1.219197>}
box{<0,0,-0.203200><25.835831,0.035000,0.203200> rotate<0,-90.000000,0> translate<41.630800,0.000000,1.219197> }
texture{col_pol}
}
#end
union{
cylinder{<18.550000,0.038000,24.260000><18.550000,-1.538000,24.260000>0.508000}
cylinder{<18.550000,0.038000,26.800000><18.550000,-1.538000,26.800000>0.508000}
cylinder{<16.010000,0.038000,24.260000><16.010000,-1.538000,24.260000>0.508000}
cylinder{<16.010000,0.038000,26.800000><16.010000,-1.538000,26.800000>0.508000}
cylinder{<26.170000,0.038000,26.800000><26.170000,-1.538000,26.800000>0.508000}
cylinder{<26.170000,0.038000,24.260000><26.170000,-1.538000,24.260000>0.508000}
cylinder{<34.660000,0.038000,21.720000><34.660000,-1.538000,21.720000>0.508000}
cylinder{<34.660000,0.038000,19.180000><34.660000,-1.538000,19.180000>0.508000}
cylinder{<7.120000,0.038000,15.370000><7.120000,-1.538000,15.370000>0.508000}
cylinder{<4.580000,0.038000,15.370000><4.580000,-1.538000,15.370000>0.508000}
cylinder{<7.120000,0.038000,12.830000><7.120000,-1.538000,12.830000>0.508000}
cylinder{<4.580000,0.038000,12.830000><4.580000,-1.538000,12.830000>0.508000}
cylinder{<7.120000,0.038000,10.290000><7.120000,-1.538000,10.290000>0.508000}
cylinder{<4.580000,0.038000,10.290000><4.580000,-1.538000,10.290000>0.508000}
cylinder{<7.120000,0.038000,7.750000><7.120000,-1.538000,7.750000>0.508000}
cylinder{<4.580000,0.038000,7.750000><4.580000,-1.538000,7.750000>0.508000}
cylinder{<35.060000,0.038000,15.370000><35.060000,-1.538000,15.370000>0.508000}
cylinder{<32.520000,0.038000,15.370000><32.520000,-1.538000,15.370000>0.508000}
cylinder{<35.060000,0.038000,12.830000><35.060000,-1.538000,12.830000>0.508000}
cylinder{<32.520000,0.038000,12.830000><32.520000,-1.538000,12.830000>0.508000}
cylinder{<35.060000,0.038000,10.290000><35.060000,-1.538000,10.290000>0.508000}
cylinder{<32.520000,0.038000,10.290000><32.520000,-1.538000,10.290000>0.508000}
cylinder{<35.060000,0.038000,7.750000><35.060000,-1.538000,7.750000>0.508000}
cylinder{<32.520000,0.038000,7.750000><32.520000,-1.538000,7.750000>0.508000}
cylinder{<13.470000,0.038000,5.210000><13.470000,-1.538000,5.210000>0.508000}
cylinder{<16.010000,0.038000,5.210000><16.010000,-1.538000,5.210000>0.508000}
cylinder{<29.980000,0.038000,31.880000><29.980000,-1.538000,31.880000>0.406400}
cylinder{<29.980000,0.038000,24.260000><29.980000,-1.538000,24.260000>0.406400}
cylinder{<12.200000,0.038000,31.880000><12.200000,-1.538000,31.880000>0.406400}
cylinder{<12.200000,0.038000,24.260000><12.200000,-1.538000,24.260000>0.406400}
cylinder{<21.660000,0.038000,31.880000><21.660000,-1.538000,31.880000>0.406400}
cylinder{<21.660000,0.038000,24.260000><21.660000,-1.538000,24.260000>0.406400}
cylinder{<4.580000,0.038000,24.260000><4.580000,-1.538000,24.260000>0.508000}
cylinder{<4.580000,0.038000,21.720000><4.580000,-1.538000,21.720000>0.508000}
//Bohrungen(schnell)/Durchkontaktierungen
//Bohrungen(schnell)/Platine
texture{col_hls}
}
#if(pcb_silkscreen=on)
//Bestückungsdruck
union{
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.854025,-1.536000,3.786544>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.125188,-1.536000,3.515378>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,44.997360,0> translate<4.854025,-1.536000,3.786544> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.125188,-1.536000,3.515378>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.125188,-1.536000,2.973047>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,-90.000000,0> translate<5.125188,-1.536000,2.973047> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.125188,-1.536000,2.973047>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.854025,-1.536000,2.701884>}
box{<0,0,-0.076200><0.383482,0.036000,0.076200> rotate<0,-44.997030,0> translate<4.854025,-1.536000,2.701884> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.854025,-1.536000,2.701884>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.582859,-1.536000,2.701884>}
box{<0,0,-0.076200><0.271166,0.036000,0.076200> rotate<0,0.000000,0> translate<4.582859,-1.536000,2.701884> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.582859,-1.536000,2.701884>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.311694,-1.536000,2.973047>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,44.996700,0> translate<4.311694,-1.536000,2.973047> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.311694,-1.536000,2.973047>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.311694,-1.536000,3.515378>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,90.000000,0> translate<4.311694,-1.536000,3.515378> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.311694,-1.536000,3.515378>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.040528,-1.536000,3.786544>}
box{<0,0,-0.076200><0.383486,0.036000,0.076200> rotate<0,44.997030,0> translate<4.040528,-1.536000,3.786544> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.040528,-1.536000,3.786544>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.769363,-1.536000,3.786544>}
box{<0,0,-0.076200><0.271166,0.036000,0.076200> rotate<0,0.000000,0> translate<3.769363,-1.536000,3.786544> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.769363,-1.536000,3.786544>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.498200,-1.536000,3.515378>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,-44.997360,0> translate<3.498200,-1.536000,3.515378> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.498200,-1.536000,3.515378>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.498200,-1.536000,2.973047>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,-90.000000,0> translate<3.498200,-1.536000,2.973047> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.498200,-1.536000,2.973047>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.769363,-1.536000,2.701884>}
box{<0,0,-0.076200><0.383482,0.036000,0.076200> rotate<0,44.997030,0> translate<3.498200,-1.536000,2.973047> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.125188,-1.536000,4.339041>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.498200,-1.536000,4.339041>}
box{<0,0,-0.076200><1.626987,0.036000,0.076200> rotate<0,0.000000,0> translate<3.498200,-1.536000,4.339041> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.498200,-1.536000,4.339041>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.498200,-1.536000,5.152534>}
box{<0,0,-0.076200><0.813494,0.036000,0.076200> rotate<0,90.000000,0> translate<3.498200,-1.536000,5.152534> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.498200,-1.536000,5.152534>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.769363,-1.536000,5.423700>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,-44.997360,0> translate<3.498200,-1.536000,5.152534> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.769363,-1.536000,5.423700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.854025,-1.536000,5.423700>}
box{<0,0,-0.076200><1.084662,0.036000,0.076200> rotate<0,0.000000,0> translate<3.769363,-1.536000,5.423700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.854025,-1.536000,5.423700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.125188,-1.536000,5.152534>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,44.997360,0> translate<4.854025,-1.536000,5.423700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.125188,-1.536000,5.152534>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.125188,-1.536000,4.339041>}
box{<0,0,-0.076200><0.813494,0.036000,0.076200> rotate<0,-90.000000,0> translate<5.125188,-1.536000,4.339041> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.654025,-1.536000,3.686544>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.925187,-1.536000,3.415378>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,44.997360,0> translate<35.654025,-1.536000,3.686544> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.925187,-1.536000,3.415378>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.925187,-1.536000,2.873047>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,-90.000000,0> translate<35.925187,-1.536000,2.873047> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.925187,-1.536000,2.873047>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.654025,-1.536000,2.601884>}
box{<0,0,-0.076200><0.383482,0.036000,0.076200> rotate<0,-44.997030,0> translate<35.654025,-1.536000,2.601884> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.654025,-1.536000,2.601884>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.382859,-1.536000,2.601884>}
box{<0,0,-0.076200><0.271166,0.036000,0.076200> rotate<0,0.000000,0> translate<35.382859,-1.536000,2.601884> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.382859,-1.536000,2.601884>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.111694,-1.536000,2.873047>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,44.996700,0> translate<35.111694,-1.536000,2.873047> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.111694,-1.536000,2.873047>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.111694,-1.536000,3.415378>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,90.000000,0> translate<35.111694,-1.536000,3.415378> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.111694,-1.536000,3.415378>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.840528,-1.536000,3.686544>}
box{<0,0,-0.076200><0.383486,0.036000,0.076200> rotate<0,44.997030,0> translate<34.840528,-1.536000,3.686544> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.840528,-1.536000,3.686544>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.569363,-1.536000,3.686544>}
box{<0,0,-0.076200><0.271166,0.036000,0.076200> rotate<0,0.000000,0> translate<34.569363,-1.536000,3.686544> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.569363,-1.536000,3.686544>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.298200,-1.536000,3.415378>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,-44.997360,0> translate<34.298200,-1.536000,3.415378> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.298200,-1.536000,3.415378>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.298200,-1.536000,2.873047>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,-90.000000,0> translate<34.298200,-1.536000,2.873047> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.298200,-1.536000,2.873047>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.569363,-1.536000,2.601884>}
box{<0,0,-0.076200><0.383482,0.036000,0.076200> rotate<0,44.997030,0> translate<34.298200,-1.536000,2.873047> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.925187,-1.536000,4.239041>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.298200,-1.536000,4.239041>}
box{<0,0,-0.076200><1.626987,0.036000,0.076200> rotate<0,0.000000,0> translate<34.298200,-1.536000,4.239041> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.298200,-1.536000,4.239041>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.298200,-1.536000,5.052534>}
box{<0,0,-0.076200><0.813494,0.036000,0.076200> rotate<0,90.000000,0> translate<34.298200,-1.536000,5.052534> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.298200,-1.536000,5.052534>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.569363,-1.536000,5.323700>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,-44.997360,0> translate<34.298200,-1.536000,5.052534> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.569363,-1.536000,5.323700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.654025,-1.536000,5.323700>}
box{<0,0,-0.076200><1.084663,0.036000,0.076200> rotate<0,0.000000,0> translate<34.569363,-1.536000,5.323700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.654025,-1.536000,5.323700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.925187,-1.536000,5.052534>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,44.997360,0> translate<35.654025,-1.536000,5.323700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.925187,-1.536000,5.052534>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.925187,-1.536000,4.239041>}
box{<0,0,-0.076200><0.813494,0.036000,0.076200> rotate<0,-90.000000,0> translate<35.925187,-1.536000,4.239041> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.654025,-1.536000,3.686544>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.925188,-1.536000,3.415378>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,44.997360,0> translate<7.654025,-1.536000,3.686544> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.925188,-1.536000,3.415378>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.925188,-1.536000,2.873047>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,-90.000000,0> translate<7.925188,-1.536000,2.873047> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.925188,-1.536000,2.873047>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.654025,-1.536000,2.601884>}
box{<0,0,-0.076200><0.383482,0.036000,0.076200> rotate<0,-44.997030,0> translate<7.654025,-1.536000,2.601884> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.654025,-1.536000,2.601884>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.382859,-1.536000,2.601884>}
box{<0,0,-0.076200><0.271166,0.036000,0.076200> rotate<0,0.000000,0> translate<7.382859,-1.536000,2.601884> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.382859,-1.536000,2.601884>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.111694,-1.536000,2.873047>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,44.996700,0> translate<7.111694,-1.536000,2.873047> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.111694,-1.536000,2.873047>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.111694,-1.536000,3.415378>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,90.000000,0> translate<7.111694,-1.536000,3.415378> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.111694,-1.536000,3.415378>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.840528,-1.536000,3.686544>}
box{<0,0,-0.076200><0.383486,0.036000,0.076200> rotate<0,44.997030,0> translate<6.840528,-1.536000,3.686544> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.840528,-1.536000,3.686544>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.569363,-1.536000,3.686544>}
box{<0,0,-0.076200><0.271166,0.036000,0.076200> rotate<0,0.000000,0> translate<6.569363,-1.536000,3.686544> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.569363,-1.536000,3.686544>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.298200,-1.536000,3.415378>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,-44.997360,0> translate<6.298200,-1.536000,3.415378> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.298200,-1.536000,3.415378>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.298200,-1.536000,2.873047>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,-90.000000,0> translate<6.298200,-1.536000,2.873047> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.298200,-1.536000,2.873047>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.569363,-1.536000,2.601884>}
box{<0,0,-0.076200><0.383482,0.036000,0.076200> rotate<0,44.997030,0> translate<6.298200,-1.536000,2.873047> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.654025,-1.536000,5.323700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.925188,-1.536000,5.052534>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,44.997360,0> translate<7.654025,-1.536000,5.323700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.925188,-1.536000,5.052534>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.925188,-1.536000,4.510203>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,-90.000000,0> translate<7.925188,-1.536000,4.510203> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.925188,-1.536000,4.510203>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.654025,-1.536000,4.239041>}
box{<0,0,-0.076200><0.383482,0.036000,0.076200> rotate<0,-44.997030,0> translate<7.654025,-1.536000,4.239041> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.654025,-1.536000,4.239041>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.569363,-1.536000,4.239041>}
box{<0,0,-0.076200><1.084663,0.036000,0.076200> rotate<0,0.000000,0> translate<6.569363,-1.536000,4.239041> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.569363,-1.536000,4.239041>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.298200,-1.536000,4.510203>}
box{<0,0,-0.076200><0.383482,0.036000,0.076200> rotate<0,44.997030,0> translate<6.298200,-1.536000,4.510203> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.298200,-1.536000,4.510203>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.298200,-1.536000,5.052534>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,90.000000,0> translate<6.298200,-1.536000,5.052534> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.298200,-1.536000,5.052534>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.569363,-1.536000,5.323700>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,-44.997360,0> translate<6.298200,-1.536000,5.052534> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.054025,-1.536000,3.686544>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.325187,-1.536000,3.415378>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,44.997360,0> translate<33.054025,-1.536000,3.686544> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.325187,-1.536000,3.415378>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.325187,-1.536000,2.873047>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,-90.000000,0> translate<33.325187,-1.536000,2.873047> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.325187,-1.536000,2.873047>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.054025,-1.536000,2.601884>}
box{<0,0,-0.076200><0.383482,0.036000,0.076200> rotate<0,-44.997030,0> translate<33.054025,-1.536000,2.601884> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.054025,-1.536000,2.601884>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.782859,-1.536000,2.601884>}
box{<0,0,-0.076200><0.271166,0.036000,0.076200> rotate<0,0.000000,0> translate<32.782859,-1.536000,2.601884> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.782859,-1.536000,2.601884>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.511694,-1.536000,2.873047>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,44.996700,0> translate<32.511694,-1.536000,2.873047> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.511694,-1.536000,2.873047>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.511694,-1.536000,3.415378>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,90.000000,0> translate<32.511694,-1.536000,3.415378> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.511694,-1.536000,3.415378>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.240528,-1.536000,3.686544>}
box{<0,0,-0.076200><0.383486,0.036000,0.076200> rotate<0,44.997030,0> translate<32.240528,-1.536000,3.686544> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.240528,-1.536000,3.686544>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.969363,-1.536000,3.686544>}
box{<0,0,-0.076200><0.271166,0.036000,0.076200> rotate<0,0.000000,0> translate<31.969363,-1.536000,3.686544> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.969363,-1.536000,3.686544>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.698200,-1.536000,3.415378>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,-44.997360,0> translate<31.698200,-1.536000,3.415378> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.698200,-1.536000,3.415378>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.698200,-1.536000,2.873047>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,-90.000000,0> translate<31.698200,-1.536000,2.873047> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.698200,-1.536000,2.873047>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.969363,-1.536000,2.601884>}
box{<0,0,-0.076200><0.383482,0.036000,0.076200> rotate<0,44.997030,0> translate<31.698200,-1.536000,2.873047> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.054025,-1.536000,5.323700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.325187,-1.536000,5.052534>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,44.997360,0> translate<33.054025,-1.536000,5.323700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.325187,-1.536000,5.052534>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.325187,-1.536000,4.510203>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,-90.000000,0> translate<33.325187,-1.536000,4.510203> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.325187,-1.536000,4.510203>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.054025,-1.536000,4.239041>}
box{<0,0,-0.076200><0.383482,0.036000,0.076200> rotate<0,-44.997030,0> translate<33.054025,-1.536000,4.239041> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.054025,-1.536000,4.239041>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.969363,-1.536000,4.239041>}
box{<0,0,-0.076200><1.084663,0.036000,0.076200> rotate<0,0.000000,0> translate<31.969363,-1.536000,4.239041> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.969363,-1.536000,4.239041>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.698200,-1.536000,4.510203>}
box{<0,0,-0.076200><0.383482,0.036000,0.076200> rotate<0,44.997030,0> translate<31.698200,-1.536000,4.510203> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.698200,-1.536000,4.510203>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.698200,-1.536000,5.052534>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,90.000000,0> translate<31.698200,-1.536000,5.052534> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.698200,-1.536000,5.052534>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.969363,-1.536000,5.323700>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,-44.997360,0> translate<31.698200,-1.536000,5.052534> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.360956,-1.536000,14.869363>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.360956,-1.536000,15.954025>}
box{<0,0,-0.076200><1.084663,0.036000,0.076200> rotate<0,90.000000,0> translate<3.360956,-1.536000,15.954025> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.360956,-1.536000,15.954025>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.089794,-1.536000,16.225188>}
box{<0,0,-0.076200><0.383482,0.036000,0.076200> rotate<0,44.997030,0> translate<3.089794,-1.536000,16.225188> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.089794,-1.536000,16.225188>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.547462,-1.536000,16.225188>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,0.000000,0> translate<2.547462,-1.536000,16.225188> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.547462,-1.536000,16.225188>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.276297,-1.536000,15.954025>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,-44.996700,0> translate<2.276297,-1.536000,15.954025> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.276297,-1.536000,15.954025>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.276297,-1.536000,14.869363>}
box{<0,0,-0.076200><1.084663,0.036000,0.076200> rotate<0,-90.000000,0> translate<2.276297,-1.536000,14.869363> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.276297,-1.536000,14.869363>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.547462,-1.536000,14.598200>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,44.996700,0> translate<2.276297,-1.536000,14.869363> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.547462,-1.536000,14.598200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.089794,-1.536000,14.598200>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,0.000000,0> translate<2.547462,-1.536000,14.598200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.089794,-1.536000,14.598200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.360956,-1.536000,14.869363>}
box{<0,0,-0.076200><0.383482,0.036000,0.076200> rotate<0,-44.997030,0> translate<3.089794,-1.536000,14.598200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.360956,-1.536000,14.869363>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.276297,-1.536000,15.954025>}
box{<0,0,-0.076200><1.533942,0.036000,0.076200> rotate<0,44.997113,0> translate<2.276297,-1.536000,15.954025> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.360956,-1.536000,13.182859>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.818628,-1.536000,13.725188>}
box{<0,0,-0.076200><0.766968,0.036000,0.076200> rotate<0,44.997030,0> translate<2.818628,-1.536000,13.725188> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.818628,-1.536000,13.725188>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.818628,-1.536000,12.098200>}
box{<0,0,-0.076200><1.626988,0.036000,0.076200> rotate<0,-90.000000,0> translate<2.818628,-1.536000,12.098200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.360956,-1.536000,12.098200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.276297,-1.536000,12.098200>}
box{<0,0,-0.076200><1.084659,0.036000,0.076200> rotate<0,0.000000,0> translate<2.276297,-1.536000,12.098200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.276297,-1.536000,9.698200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.360956,-1.536000,9.698200>}
box{<0,0,-0.076200><1.084659,0.036000,0.076200> rotate<0,0.000000,0> translate<2.276297,-1.536000,9.698200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.360956,-1.536000,9.698200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.276297,-1.536000,10.782859>}
box{<0,0,-0.076200><1.533940,0.036000,0.076200> rotate<0,44.997030,0> translate<2.276297,-1.536000,10.782859> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.276297,-1.536000,10.782859>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.276297,-1.536000,11.054025>}
box{<0,0,-0.076200><0.271166,0.036000,0.076200> rotate<0,90.000000,0> translate<2.276297,-1.536000,11.054025> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.276297,-1.536000,11.054025>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.547462,-1.536000,11.325188>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,-44.996700,0> translate<2.276297,-1.536000,11.054025> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.547462,-1.536000,11.325188>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.089794,-1.536000,11.325188>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,0.000000,0> translate<2.547462,-1.536000,11.325188> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.089794,-1.536000,11.325188>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.360956,-1.536000,11.054025>}
box{<0,0,-0.076200><0.383482,0.036000,0.076200> rotate<0,44.997030,0> translate<3.089794,-1.536000,11.325188> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.260956,-1.536000,8.354025>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.989794,-1.536000,8.625188>}
box{<0,0,-0.076200><0.383482,0.036000,0.076200> rotate<0,44.997030,0> translate<2.989794,-1.536000,8.625188> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.989794,-1.536000,8.625188>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.447463,-1.536000,8.625188>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,0.000000,0> translate<2.447463,-1.536000,8.625188> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.447463,-1.536000,8.625188>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.176297,-1.536000,8.354025>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,-44.996700,0> translate<2.176297,-1.536000,8.354025> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.176297,-1.536000,8.354025>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.176297,-1.536000,8.082859>}
box{<0,0,-0.076200><0.271166,0.036000,0.076200> rotate<0,-90.000000,0> translate<2.176297,-1.536000,8.082859> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.176297,-1.536000,8.082859>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.447463,-1.536000,7.811694>}
box{<0,0,-0.076200><0.383486,0.036000,0.076200> rotate<0,44.997030,0> translate<2.176297,-1.536000,8.082859> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.447463,-1.536000,7.811694>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.718628,-1.536000,7.811694>}
box{<0,0,-0.076200><0.271166,0.036000,0.076200> rotate<0,0.000000,0> translate<2.447463,-1.536000,7.811694> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.447463,-1.536000,7.811694>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.176297,-1.536000,7.540528>}
box{<0,0,-0.076200><0.383486,0.036000,0.076200> rotate<0,-44.997030,0> translate<2.176297,-1.536000,7.540528> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.176297,-1.536000,7.540528>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.176297,-1.536000,7.269363>}
box{<0,0,-0.076200><0.271166,0.036000,0.076200> rotate<0,-90.000000,0> translate<2.176297,-1.536000,7.269363> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.176297,-1.536000,7.269363>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.447463,-1.536000,6.998200>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,44.996700,0> translate<2.176297,-1.536000,7.269363> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.447463,-1.536000,6.998200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.989794,-1.536000,6.998200>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,0.000000,0> translate<2.447463,-1.536000,6.998200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.989794,-1.536000,6.998200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.260956,-1.536000,7.269363>}
box{<0,0,-0.076200><0.383482,0.036000,0.076200> rotate<0,-44.997030,0> translate<2.989794,-1.536000,6.998200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.447463,-1.536000,6.698200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.447463,-1.536000,8.325188>}
box{<0,0,-0.076200><1.626988,0.036000,0.076200> rotate<0,90.000000,0> translate<37.447463,-1.536000,8.325188> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.447463,-1.536000,8.325188>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.260956,-1.536000,7.511694>}
box{<0,0,-0.076200><1.150454,0.036000,0.076200> rotate<0,44.997030,0> translate<37.447463,-1.536000,8.325188> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.260956,-1.536000,7.511694>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.176297,-1.536000,7.511694>}
box{<0,0,-0.076200><1.084659,0.036000,0.076200> rotate<0,0.000000,0> translate<37.176297,-1.536000,7.511694> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.276297,-1.536000,11.125188>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.360956,-1.536000,11.125188>}
box{<0,0,-0.076200><1.084659,0.036000,0.076200> rotate<0,0.000000,0> translate<37.276297,-1.536000,11.125188> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.360956,-1.536000,11.125188>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.360956,-1.536000,10.311694>}
box{<0,0,-0.076200><0.813494,0.036000,0.076200> rotate<0,-90.000000,0> translate<38.360956,-1.536000,10.311694> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.360956,-1.536000,10.311694>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.818628,-1.536000,10.582859>}
box{<0,0,-0.076200><0.606342,0.036000,0.076200> rotate<0,26.563430,0> translate<37.818628,-1.536000,10.582859> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.818628,-1.536000,10.582859>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.547463,-1.536000,10.582859>}
box{<0,0,-0.076200><0.271166,0.036000,0.076200> rotate<0,0.000000,0> translate<37.547463,-1.536000,10.582859> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.547463,-1.536000,10.582859>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.276297,-1.536000,10.311694>}
box{<0,0,-0.076200><0.383486,0.036000,0.076200> rotate<0,-44.997030,0> translate<37.276297,-1.536000,10.311694> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.276297,-1.536000,10.311694>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.276297,-1.536000,9.769362>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,-90.000000,0> translate<37.276297,-1.536000,9.769362> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.276297,-1.536000,9.769362>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.547463,-1.536000,9.498200>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,44.996700,0> translate<37.276297,-1.536000,9.769362> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.547463,-1.536000,9.498200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.089794,-1.536000,9.498200>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,0.000000,0> translate<37.547463,-1.536000,9.498200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.089794,-1.536000,9.498200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.360956,-1.536000,9.769362>}
box{<0,0,-0.076200><0.383482,0.036000,0.076200> rotate<0,-44.997030,0> translate<38.089794,-1.536000,9.498200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.376297,-1.536000,13.725188>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.918628,-1.536000,13.454025>}
box{<0,0,-0.076200><0.606343,0.036000,0.076200> rotate<0,26.563034,0> translate<37.376297,-1.536000,13.725188> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.918628,-1.536000,13.454025>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.460956,-1.536000,12.911694>}
box{<0,0,-0.076200><0.766970,0.036000,0.076200> rotate<0,44.997195,0> translate<37.918628,-1.536000,13.454025> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.460956,-1.536000,12.911694>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.460956,-1.536000,12.369363>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,-90.000000,0> translate<38.460956,-1.536000,12.369363> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.460956,-1.536000,12.369363>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.189794,-1.536000,12.098200>}
box{<0,0,-0.076200><0.383482,0.036000,0.076200> rotate<0,-44.997030,0> translate<38.189794,-1.536000,12.098200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.189794,-1.536000,12.098200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.647463,-1.536000,12.098200>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,0.000000,0> translate<37.647463,-1.536000,12.098200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.647463,-1.536000,12.098200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.376297,-1.536000,12.369363>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,44.996700,0> translate<37.376297,-1.536000,12.369363> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.376297,-1.536000,12.369363>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.376297,-1.536000,12.640528>}
box{<0,0,-0.076200><0.271166,0.036000,0.076200> rotate<0,90.000000,0> translate<37.376297,-1.536000,12.640528> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.376297,-1.536000,12.640528>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.647463,-1.536000,12.911694>}
box{<0,0,-0.076200><0.383486,0.036000,0.076200> rotate<0,-44.997030,0> translate<37.376297,-1.536000,12.640528> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.647463,-1.536000,12.911694>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.460956,-1.536000,12.911694>}
box{<0,0,-0.076200><0.813494,0.036000,0.076200> rotate<0,0.000000,0> translate<37.647463,-1.536000,12.911694> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.460956,-1.536000,16.225188>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.376297,-1.536000,16.225188>}
box{<0,0,-0.076200><1.084659,0.036000,0.076200> rotate<0,0.000000,0> translate<37.376297,-1.536000,16.225188> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.376297,-1.536000,16.225188>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.376297,-1.536000,15.954025>}
box{<0,0,-0.076200><0.271162,0.036000,0.076200> rotate<0,-90.000000,0> translate<37.376297,-1.536000,15.954025> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.376297,-1.536000,15.954025>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.460956,-1.536000,14.869363>}
box{<0,0,-0.076200><1.533942,0.036000,0.076200> rotate<0,44.997113,0> translate<37.376297,-1.536000,15.954025> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.460956,-1.536000,14.869363>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.460956,-1.536000,14.598200>}
box{<0,0,-0.076200><0.271163,0.036000,0.076200> rotate<0,-90.000000,0> translate<38.460956,-1.536000,14.598200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.250616,-1.536000,22.354025>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.521781,-1.536000,22.625188>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,-44.996700,0> translate<40.250616,-1.536000,22.354025> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.521781,-1.536000,22.625188>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.064113,-1.536000,22.625188>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,0.000000,0> translate<40.521781,-1.536000,22.625188> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.064113,-1.536000,22.625188>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.335275,-1.536000,22.354025>}
box{<0,0,-0.076200><0.383482,0.036000,0.076200> rotate<0,44.997030,0> translate<41.064113,-1.536000,22.625188> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.335275,-1.536000,22.354025>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.335275,-1.536000,22.082859>}
box{<0,0,-0.076200><0.271166,0.036000,0.076200> rotate<0,-90.000000,0> translate<41.335275,-1.536000,22.082859> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.335275,-1.536000,22.082859>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.064113,-1.536000,21.811694>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,-44.997360,0> translate<41.064113,-1.536000,21.811694> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.064113,-1.536000,21.811694>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.521781,-1.536000,21.811694>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,0.000000,0> translate<40.521781,-1.536000,21.811694> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.521781,-1.536000,21.811694>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.250616,-1.536000,21.540528>}
box{<0,0,-0.076200><0.383486,0.036000,0.076200> rotate<0,-44.997030,0> translate<40.250616,-1.536000,21.540528> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.250616,-1.536000,21.540528>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.250616,-1.536000,21.269362>}
box{<0,0,-0.076200><0.271166,0.036000,0.076200> rotate<0,-90.000000,0> translate<40.250616,-1.536000,21.269362> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.250616,-1.536000,21.269362>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.521781,-1.536000,20.998200>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,44.996700,0> translate<40.250616,-1.536000,21.269362> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.521781,-1.536000,20.998200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.064113,-1.536000,20.998200>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,0.000000,0> translate<40.521781,-1.536000,20.998200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.064113,-1.536000,20.998200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.335275,-1.536000,21.269362>}
box{<0,0,-0.076200><0.383482,0.036000,0.076200> rotate<0,-44.997030,0> translate<41.064113,-1.536000,20.998200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.698119,-1.536000,22.625188>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.698119,-1.536000,20.998200>}
box{<0,0,-0.076200><1.626988,0.036000,0.076200> rotate<0,-90.000000,0> translate<39.698119,-1.536000,20.998200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.698119,-1.536000,20.998200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.884625,-1.536000,20.998200>}
box{<0,0,-0.076200><0.813494,0.036000,0.076200> rotate<0,0.000000,0> translate<38.884625,-1.536000,20.998200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.884625,-1.536000,20.998200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.613459,-1.536000,21.269362>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,44.996700,0> translate<38.613459,-1.536000,21.269362> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.613459,-1.536000,21.269362>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.613459,-1.536000,22.354025>}
box{<0,0,-0.076200><1.084663,0.036000,0.076200> rotate<0,90.000000,0> translate<38.613459,-1.536000,22.354025> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.613459,-1.536000,22.354025>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.884625,-1.536000,22.625188>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,-44.996700,0> translate<38.613459,-1.536000,22.354025> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.884625,-1.536000,22.625188>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.698119,-1.536000,22.625188>}
box{<0,0,-0.076200><0.813494,0.036000,0.076200> rotate<0,0.000000,0> translate<38.884625,-1.536000,22.625188> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.060963,-1.536000,20.998200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.060963,-1.536000,22.082859>}
box{<0,0,-0.076200><1.084659,0.036000,0.076200> rotate<0,90.000000,0> translate<38.060963,-1.536000,22.082859> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.060963,-1.536000,22.082859>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.518634,-1.536000,22.625188>}
box{<0,0,-0.076200><0.766968,0.036000,0.076200> rotate<0,44.997030,0> translate<37.518634,-1.536000,22.625188> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.518634,-1.536000,22.625188>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.976303,-1.536000,22.082859>}
box{<0,0,-0.076200><0.766970,0.036000,0.076200> rotate<0,-44.996865,0> translate<36.976303,-1.536000,22.082859> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.976303,-1.536000,22.082859>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.976303,-1.536000,20.998200>}
box{<0,0,-0.076200><1.084659,0.036000,0.076200> rotate<0,-90.000000,0> translate<36.976303,-1.536000,20.998200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.060963,-1.536000,21.811694>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.976303,-1.536000,21.811694>}
box{<0,0,-0.076200><1.084659,0.036000,0.076200> rotate<0,0.000000,0> translate<36.976303,-1.536000,21.811694> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.250616,-1.536000,19.754025>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.521781,-1.536000,20.025188>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,-44.996700,0> translate<40.250616,-1.536000,19.754025> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.521781,-1.536000,20.025188>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.064113,-1.536000,20.025188>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,0.000000,0> translate<40.521781,-1.536000,20.025188> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.064113,-1.536000,20.025188>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.335275,-1.536000,19.754025>}
box{<0,0,-0.076200><0.383482,0.036000,0.076200> rotate<0,44.997030,0> translate<41.064113,-1.536000,20.025188> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.335275,-1.536000,19.754025>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.335275,-1.536000,19.482859>}
box{<0,0,-0.076200><0.271166,0.036000,0.076200> rotate<0,-90.000000,0> translate<41.335275,-1.536000,19.482859> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.335275,-1.536000,19.482859>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.064113,-1.536000,19.211694>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,-44.997360,0> translate<41.064113,-1.536000,19.211694> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.064113,-1.536000,19.211694>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.521781,-1.536000,19.211694>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,0.000000,0> translate<40.521781,-1.536000,19.211694> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.521781,-1.536000,19.211694>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.250616,-1.536000,18.940528>}
box{<0,0,-0.076200><0.383486,0.036000,0.076200> rotate<0,-44.997030,0> translate<40.250616,-1.536000,18.940528> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.250616,-1.536000,18.940528>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.250616,-1.536000,18.669363>}
box{<0,0,-0.076200><0.271166,0.036000,0.076200> rotate<0,-90.000000,0> translate<40.250616,-1.536000,18.669363> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.250616,-1.536000,18.669363>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.521781,-1.536000,18.398200>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,44.996700,0> translate<40.250616,-1.536000,18.669363> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.521781,-1.536000,18.398200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.064113,-1.536000,18.398200>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,0.000000,0> translate<40.521781,-1.536000,18.398200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.064113,-1.536000,18.398200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.335275,-1.536000,18.669363>}
box{<0,0,-0.076200><0.383482,0.036000,0.076200> rotate<0,-44.997030,0> translate<41.064113,-1.536000,18.398200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.613459,-1.536000,19.754025>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.884625,-1.536000,20.025188>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,-44.996700,0> translate<38.613459,-1.536000,19.754025> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.884625,-1.536000,20.025188>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.426956,-1.536000,20.025188>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,0.000000,0> translate<38.884625,-1.536000,20.025188> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.426956,-1.536000,20.025188>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.698119,-1.536000,19.754025>}
box{<0,0,-0.076200><0.383482,0.036000,0.076200> rotate<0,44.997030,0> translate<39.426956,-1.536000,20.025188> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.698119,-1.536000,19.754025>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.698119,-1.536000,18.669363>}
box{<0,0,-0.076200><1.084663,0.036000,0.076200> rotate<0,-90.000000,0> translate<39.698119,-1.536000,18.669363> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.698119,-1.536000,18.669363>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.426956,-1.536000,18.398200>}
box{<0,0,-0.076200><0.383482,0.036000,0.076200> rotate<0,-44.997030,0> translate<39.426956,-1.536000,18.398200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.426956,-1.536000,18.398200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.884625,-1.536000,18.398200>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,0.000000,0> translate<38.884625,-1.536000,18.398200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.884625,-1.536000,18.398200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.613459,-1.536000,18.669363>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,44.996700,0> translate<38.613459,-1.536000,18.669363> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.060963,-1.536000,20.025188>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.060963,-1.536000,18.398200>}
box{<0,0,-0.076200><1.626988,0.036000,0.076200> rotate<0,-90.000000,0> translate<38.060963,-1.536000,18.398200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.060963,-1.536000,18.398200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.976303,-1.536000,18.398200>}
box{<0,0,-0.076200><1.084659,0.036000,0.076200> rotate<0,0.000000,0> translate<36.976303,-1.536000,18.398200> }
//A01 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.820000,-1.536000,23.625000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.185000,-1.536000,22.990000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<19.185000,-1.536000,22.990000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.915000,-1.536000,22.990000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.280000,-1.536000,23.625000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<17.280000,-1.536000,23.625000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.280000,-1.536000,23.625000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.645000,-1.536000,22.990000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<16.645000,-1.536000,22.990000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.375000,-1.536000,22.990000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.740000,-1.536000,23.625000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<14.740000,-1.536000,23.625000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.820000,-1.536000,23.625000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.820000,-1.536000,27.435000>}
box{<0,0,-0.076200><3.810000,0.036000,0.076200> rotate<0,90.000000,0> translate<19.820000,-1.536000,27.435000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.820000,-1.536000,27.435000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.185000,-1.536000,28.070000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<19.185000,-1.536000,28.070000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.185000,-1.536000,28.070000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.915000,-1.536000,28.070000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<17.915000,-1.536000,28.070000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.915000,-1.536000,28.070000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.280000,-1.536000,27.435000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<17.280000,-1.536000,27.435000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.280000,-1.536000,27.435000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.645000,-1.536000,28.070000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<16.645000,-1.536000,28.070000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.645000,-1.536000,28.070000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.375000,-1.536000,28.070000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<15.375000,-1.536000,28.070000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.375000,-1.536000,28.070000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.740000,-1.536000,27.435000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<14.740000,-1.536000,27.435000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.280000,-1.536000,27.435000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.280000,-1.536000,23.625000>}
box{<0,0,-0.076200><3.810000,0.036000,0.076200> rotate<0,-90.000000,0> translate<17.280000,-1.536000,23.625000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.740000,-1.536000,27.435000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.740000,-1.536000,23.625000>}
box{<0,0,-0.076200><3.810000,0.036000,0.076200> rotate<0,-90.000000,0> translate<14.740000,-1.536000,23.625000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.645000,-1.536000,22.990000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.375000,-1.536000,22.990000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<15.375000,-1.536000,22.990000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.185000,-1.536000,22.990000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.915000,-1.536000,22.990000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<17.915000,-1.536000,22.990000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<18.550000,-1.536000,24.260000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<18.550000,-1.536000,26.800000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<16.010000,-1.536000,26.800000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<16.010000,-1.536000,24.260000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.756500,-1.536000,21.368500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.756500,-1.536000,22.131150>}
box{<0,0,-0.063500><0.762650,0.036000,0.063500> rotate<0,90.000000,0> translate<18.756500,-1.536000,22.131150> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.756500,-1.536000,22.131150>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.375175,-1.536000,22.512475>}
box{<0,0,-0.063500><0.539275,0.036000,0.063500> rotate<0,44.997030,0> translate<18.375175,-1.536000,22.512475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.375175,-1.536000,22.512475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.993850,-1.536000,22.131150>}
box{<0,0,-0.063500><0.539275,0.036000,0.063500> rotate<0,-44.997030,0> translate<17.993850,-1.536000,22.131150> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.993850,-1.536000,22.131150>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.993850,-1.536000,21.368500>}
box{<0,0,-0.063500><0.762650,0.036000,0.063500> rotate<0,-90.000000,0> translate<17.993850,-1.536000,21.368500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.756500,-1.536000,21.940487>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.993850,-1.536000,21.940487>}
box{<0,0,-0.063500><0.762650,0.036000,0.063500> rotate<0,0.000000,0> translate<17.993850,-1.536000,21.940487> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.587103,-1.536000,21.559162>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.587103,-1.536000,22.321813>}
box{<0,0,-0.063500><0.762650,0.036000,0.063500> rotate<0,90.000000,0> translate<17.587103,-1.536000,22.321813> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.587103,-1.536000,22.321813>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.396441,-1.536000,22.512475>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<17.396441,-1.536000,22.512475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.396441,-1.536000,22.512475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.015116,-1.536000,22.512475>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,0.000000,0> translate<17.015116,-1.536000,22.512475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.015116,-1.536000,22.512475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.824453,-1.536000,22.321813>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<16.824453,-1.536000,22.321813> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.824453,-1.536000,22.321813>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.824453,-1.536000,21.559162>}
box{<0,0,-0.063500><0.762650,0.036000,0.063500> rotate<0,-90.000000,0> translate<16.824453,-1.536000,21.559162> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.824453,-1.536000,21.559162>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.015116,-1.536000,21.368500>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<16.824453,-1.536000,21.559162> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.015116,-1.536000,21.368500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.396441,-1.536000,21.368500>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,0.000000,0> translate<17.015116,-1.536000,21.368500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.396441,-1.536000,21.368500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.587103,-1.536000,21.559162>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<17.396441,-1.536000,21.368500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.587103,-1.536000,21.559162>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.824453,-1.536000,22.321813>}
box{<0,0,-0.063500><1.078550,0.036000,0.063500> rotate<0,44.997030,0> translate<16.824453,-1.536000,22.321813> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.417706,-1.536000,22.131150>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.036381,-1.536000,22.512475>}
box{<0,0,-0.063500><0.539275,0.036000,0.063500> rotate<0,44.997030,0> translate<16.036381,-1.536000,22.512475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.036381,-1.536000,22.512475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.036381,-1.536000,21.368500>}
box{<0,0,-0.063500><1.143975,0.036000,0.063500> rotate<0,-90.000000,0> translate<16.036381,-1.536000,21.368500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.417706,-1.536000,21.368500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.655056,-1.536000,21.368500>}
box{<0,0,-0.063500><0.762650,0.036000,0.063500> rotate<0,0.000000,0> translate<15.655056,-1.536000,21.368500> }
//A2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.900000,-1.536000,27.435000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.900000,-1.536000,26.165000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<24.900000,-1.536000,26.165000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.900000,-1.536000,26.165000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.535000,-1.536000,25.530000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<24.900000,-1.536000,26.165000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.535000,-1.536000,25.530000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.805000,-1.536000,25.530000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<25.535000,-1.536000,25.530000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.805000,-1.536000,25.530000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.440000,-1.536000,26.165000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<26.805000,-1.536000,25.530000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.535000,-1.536000,28.070000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.805000,-1.536000,28.070000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<25.535000,-1.536000,28.070000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.900000,-1.536000,27.435000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.535000,-1.536000,28.070000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<24.900000,-1.536000,27.435000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.805000,-1.536000,28.070000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.440000,-1.536000,27.435000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<26.805000,-1.536000,28.070000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.440000,-1.536000,26.165000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.440000,-1.536000,27.435000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<27.440000,-1.536000,27.435000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.535000,-1.536000,25.530000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.900000,-1.536000,24.895000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<24.900000,-1.536000,24.895000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.900000,-1.536000,24.895000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.900000,-1.536000,23.625000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<24.900000,-1.536000,23.625000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.900000,-1.536000,23.625000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.535000,-1.536000,22.990000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<24.900000,-1.536000,23.625000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.535000,-1.536000,22.990000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.805000,-1.536000,22.990000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<25.535000,-1.536000,22.990000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.805000,-1.536000,22.990000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.440000,-1.536000,23.625000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<26.805000,-1.536000,22.990000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.440000,-1.536000,23.625000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.440000,-1.536000,24.895000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<27.440000,-1.536000,24.895000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.440000,-1.536000,24.895000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.805000,-1.536000,25.530000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<26.805000,-1.536000,25.530000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<26.170000,-1.536000,26.800000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<26.170000,-1.536000,24.260000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<27.022700,-1.536000,21.362300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<27.022700,-1.536000,22.124950>}
box{<0,0,-0.063500><0.762650,0.036000,0.063500> rotate<0,90.000000,0> translate<27.022700,-1.536000,22.124950> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<27.022700,-1.536000,22.124950>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.641375,-1.536000,22.506275>}
box{<0,0,-0.063500><0.539275,0.036000,0.063500> rotate<0,44.997030,0> translate<26.641375,-1.536000,22.506275> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.641375,-1.536000,22.506275>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.260050,-1.536000,22.124950>}
box{<0,0,-0.063500><0.539275,0.036000,0.063500> rotate<0,-44.997030,0> translate<26.260050,-1.536000,22.124950> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.260050,-1.536000,22.124950>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.260050,-1.536000,21.362300>}
box{<0,0,-0.063500><0.762650,0.036000,0.063500> rotate<0,-90.000000,0> translate<26.260050,-1.536000,21.362300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<27.022700,-1.536000,21.934287>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.260050,-1.536000,21.934287>}
box{<0,0,-0.063500><0.762650,0.036000,0.063500> rotate<0,0.000000,0> translate<26.260050,-1.536000,21.934287> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.090653,-1.536000,21.362300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.853303,-1.536000,21.362300>}
box{<0,0,-0.063500><0.762650,0.036000,0.063500> rotate<0,0.000000,0> translate<25.090653,-1.536000,21.362300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.853303,-1.536000,21.362300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.090653,-1.536000,22.124950>}
box{<0,0,-0.063500><1.078550,0.036000,0.063500> rotate<0,44.997030,0> translate<25.090653,-1.536000,22.124950> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.090653,-1.536000,22.124950>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.090653,-1.536000,22.315613>}
box{<0,0,-0.063500><0.190662,0.036000,0.063500> rotate<0,90.000000,0> translate<25.090653,-1.536000,22.315613> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.090653,-1.536000,22.315613>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.281316,-1.536000,22.506275>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<25.090653,-1.536000,22.315613> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.281316,-1.536000,22.506275>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.662641,-1.536000,22.506275>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,0.000000,0> translate<25.281316,-1.536000,22.506275> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.662641,-1.536000,22.506275>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.853303,-1.536000,22.315613>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<25.662641,-1.536000,22.506275> }
//C1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.230000,0.000000,27.489000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.230000,0.000000,28.251000>}
box{<0,0,-0.050800><0.762000,0.036000,0.050800> rotate<0,90.000000,0> translate<31.230000,0.000000,28.251000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.550000,0.000000,27.514000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.550000,0.000000,28.251000>}
box{<0,0,-0.050800><0.737000,0.036000,0.050800> rotate<0,90.000000,0> translate<32.550000,0.000000,28.251000> }
box{<-0.375050,0,-0.725050><0.375050,0.036000,0.725050> rotate<0,-90.000000,0> translate<31.888850,0.000000,27.152850>}
box{<-0.375050,0,-0.725050><0.375050,0.036000,0.725050> rotate<0,-90.000000,0> translate<31.888850,0.000000,28.600650>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.594703,0.000000,31.030397>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.399803,0.000000,30.835497>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<31.399803,0.000000,30.835497> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.399803,0.000000,30.835497>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.399803,0.000000,30.445697>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,-90.000000,0> translate<31.399803,0.000000,30.445697> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.399803,0.000000,30.445697>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.594703,0.000000,30.250800>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,44.996571,0> translate<31.399803,0.000000,30.445697> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.594703,0.000000,30.250800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.374303,0.000000,30.250800>}
box{<0,0,-0.050800><0.779600,0.036000,0.050800> rotate<0,0.000000,0> translate<31.594703,0.000000,30.250800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.374303,0.000000,30.250800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.569200,0.000000,30.445697>}
box{<0,0,-0.050800><0.275626,0.036000,0.050800> rotate<0,-44.997030,0> translate<32.374303,0.000000,30.250800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.569200,0.000000,30.445697>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.569200,0.000000,30.835497>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,90.000000,0> translate<32.569200,0.000000,30.835497> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.569200,0.000000,30.835497>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.374303,0.000000,31.030397>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,44.997489,0> translate<32.374303,0.000000,31.030397> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.789603,0.000000,31.420197>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.399803,0.000000,31.809994>}
box{<0,0,-0.050800><0.551258,0.036000,0.050800> rotate<0,44.996801,0> translate<31.399803,0.000000,31.809994> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.399803,0.000000,31.809994>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.569200,0.000000,31.809994>}
box{<0,0,-0.050800><1.169397,0.036000,0.050800> rotate<0,0.000000,0> translate<31.399803,0.000000,31.809994> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.569200,0.000000,31.420197>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.569200,0.000000,32.199794>}
box{<0,0,-0.050800><0.779597,0.036000,0.050800> rotate<0,90.000000,0> translate<32.569200,0.000000,32.199794> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.599603,0.000000,26.650800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.209803,0.000000,27.040597>}
box{<0,0,-0.050800><0.551258,0.036000,0.050800> rotate<0,44.996801,0> translate<33.209803,0.000000,27.040597> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.209803,0.000000,27.040597>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.379200,0.000000,27.040597>}
box{<0,0,-0.050800><1.169397,0.036000,0.050800> rotate<0,0.000000,0> translate<33.209803,0.000000,27.040597> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.379200,0.000000,26.650800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.379200,0.000000,27.430397>}
box{<0,0,-0.050800><0.779597,0.036000,0.050800> rotate<0,90.000000,0> translate<34.379200,0.000000,27.430397> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.184303,0.000000,27.820197>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.404703,0.000000,27.820197>}
box{<0,0,-0.050800><0.779600,0.036000,0.050800> rotate<0,0.000000,0> translate<33.404703,0.000000,27.820197> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.404703,0.000000,27.820197>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.209803,0.000000,28.015094>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,44.996571,0> translate<33.209803,0.000000,28.015094> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.209803,0.000000,28.015094>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.209803,0.000000,28.404894>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,90.000000,0> translate<33.209803,0.000000,28.404894> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.209803,0.000000,28.404894>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.404703,0.000000,28.599794>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<33.209803,0.000000,28.404894> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.404703,0.000000,28.599794>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.184303,0.000000,28.599794>}
box{<0,0,-0.050800><0.779600,0.036000,0.050800> rotate<0,0.000000,0> translate<33.404703,0.000000,28.599794> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.184303,0.000000,28.599794>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.379200,0.000000,28.404894>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,44.997489,0> translate<34.184303,0.000000,28.599794> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.379200,0.000000,28.404894>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.379200,0.000000,28.015094>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,-90.000000,0> translate<34.379200,0.000000,28.015094> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.379200,0.000000,28.015094>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.184303,0.000000,27.820197>}
box{<0,0,-0.050800><0.275626,0.036000,0.050800> rotate<0,-44.997030,0> translate<34.184303,0.000000,27.820197> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.184303,0.000000,27.820197>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.404703,0.000000,28.599794>}
box{<0,0,-0.050800><1.102519,0.036000,0.050800> rotate<0,44.996915,0> translate<33.404703,0.000000,28.599794> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.184303,0.000000,28.989594>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.404703,0.000000,28.989594>}
box{<0,0,-0.050800><0.779600,0.036000,0.050800> rotate<0,0.000000,0> translate<33.404703,0.000000,28.989594> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.404703,0.000000,28.989594>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.209803,0.000000,29.184491>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,44.996571,0> translate<33.209803,0.000000,29.184491> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.209803,0.000000,29.184491>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.209803,0.000000,29.574291>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,90.000000,0> translate<33.209803,0.000000,29.574291> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.209803,0.000000,29.574291>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.404703,0.000000,29.769191>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<33.209803,0.000000,29.574291> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.404703,0.000000,29.769191>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.184303,0.000000,29.769191>}
box{<0,0,-0.050800><0.779600,0.036000,0.050800> rotate<0,0.000000,0> translate<33.404703,0.000000,29.769191> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.184303,0.000000,29.769191>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.379200,0.000000,29.574291>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,44.997489,0> translate<34.184303,0.000000,29.769191> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.379200,0.000000,29.574291>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.379200,0.000000,29.184491>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,-90.000000,0> translate<34.379200,0.000000,29.184491> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.379200,0.000000,29.184491>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.184303,0.000000,28.989594>}
box{<0,0,-0.050800><0.275626,0.036000,0.050800> rotate<0,-44.997030,0> translate<34.184303,0.000000,28.989594> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.184303,0.000000,28.989594>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.404703,0.000000,29.769191>}
box{<0,0,-0.050800><1.102519,0.036000,0.050800> rotate<0,44.996915,0> translate<33.404703,0.000000,29.769191> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.379200,0.000000,30.158991>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.599603,0.000000,30.158991>}
box{<0,0,-0.050800><0.779597,0.036000,0.050800> rotate<0,0.000000,0> translate<33.599603,0.000000,30.158991> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.599603,0.000000,30.158991>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.599603,0.000000,30.743688>}
box{<0,0,-0.050800><0.584697,0.036000,0.050800> rotate<0,90.000000,0> translate<33.599603,0.000000,30.743688> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.599603,0.000000,30.743688>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.794503,0.000000,30.938588>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<33.599603,0.000000,30.743688> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.794503,0.000000,30.938588>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.379200,0.000000,30.938588>}
box{<0,0,-0.050800><0.584697,0.036000,0.050800> rotate<0,0.000000,0> translate<33.794503,0.000000,30.938588> }
//I2C silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.390000,-1.536000,22.355000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.390000,-1.536000,21.085000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<33.390000,-1.536000,21.085000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.390000,-1.536000,21.085000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.025000,-1.536000,20.450000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<33.390000,-1.536000,21.085000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.025000,-1.536000,20.450000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.295000,-1.536000,20.450000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<34.025000,-1.536000,20.450000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.295000,-1.536000,20.450000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.930000,-1.536000,21.085000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<35.295000,-1.536000,20.450000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.025000,-1.536000,22.990000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.295000,-1.536000,22.990000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<34.025000,-1.536000,22.990000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.390000,-1.536000,22.355000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.025000,-1.536000,22.990000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<33.390000,-1.536000,22.355000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.295000,-1.536000,22.990000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.930000,-1.536000,22.355000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<35.295000,-1.536000,22.990000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.930000,-1.536000,21.085000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.930000,-1.536000,22.355000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<35.930000,-1.536000,22.355000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.025000,-1.536000,20.450000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.390000,-1.536000,19.815000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<33.390000,-1.536000,19.815000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.390000,-1.536000,19.815000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.390000,-1.536000,18.545000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<33.390000,-1.536000,18.545000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.390000,-1.536000,18.545000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.025000,-1.536000,17.910000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<33.390000,-1.536000,18.545000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.025000,-1.536000,17.910000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.295000,-1.536000,17.910000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<34.025000,-1.536000,17.910000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.295000,-1.536000,17.910000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.930000,-1.536000,18.545000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<35.295000,-1.536000,17.910000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.930000,-1.536000,18.545000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.930000,-1.536000,19.815000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<35.930000,-1.536000,19.815000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.930000,-1.536000,19.815000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.295000,-1.536000,20.450000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<35.295000,-1.536000,20.450000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<34.660000,-1.536000,21.720000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<34.660000,-1.536000,19.180000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<31.624700,-1.536000,18.911303>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<31.624700,-1.536000,19.292628>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,90.000000,0> translate<31.624700,-1.536000,19.292628> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<31.624700,-1.536000,19.101966>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<32.768675,-1.536000,19.101966>}
box{<0,0,-0.063500><1.143975,0.036000,0.063500> rotate<0,0.000000,0> translate<31.624700,-1.536000,19.101966> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<32.768675,-1.536000,18.911303>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<32.768675,-1.536000,19.292628>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,90.000000,0> translate<32.768675,-1.536000,19.292628> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<31.624700,-1.536000,20.453550>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<31.624700,-1.536000,19.690900>}
box{<0,0,-0.063500><0.762650,0.036000,0.063500> rotate<0,-90.000000,0> translate<31.624700,-1.536000,19.690900> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<31.624700,-1.536000,19.690900>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<32.387350,-1.536000,20.453550>}
box{<0,0,-0.063500><1.078550,0.036000,0.063500> rotate<0,-44.997030,0> translate<31.624700,-1.536000,19.690900> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<32.387350,-1.536000,20.453550>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<32.578012,-1.536000,20.453550>}
box{<0,0,-0.063500><0.190662,0.036000,0.063500> rotate<0,0.000000,0> translate<32.387350,-1.536000,20.453550> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<32.578012,-1.536000,20.453550>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<32.768675,-1.536000,20.262888>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<32.578012,-1.536000,20.453550> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<32.768675,-1.536000,20.262888>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<32.768675,-1.536000,19.881563>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,-90.000000,0> translate<32.768675,-1.536000,19.881563> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<32.768675,-1.536000,19.881563>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<32.578012,-1.536000,19.690900>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<32.578012,-1.536000,19.690900> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<32.578012,-1.536000,21.622947>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<32.768675,-1.536000,21.432284>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<32.578012,-1.536000,21.622947> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<32.768675,-1.536000,21.432284>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<32.768675,-1.536000,21.050959>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,-90.000000,0> translate<32.768675,-1.536000,21.050959> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<32.768675,-1.536000,21.050959>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<32.578012,-1.536000,20.860297>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<32.578012,-1.536000,20.860297> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<32.578012,-1.536000,20.860297>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<31.815363,-1.536000,20.860297>}
box{<0,0,-0.063500><0.762650,0.036000,0.063500> rotate<0,0.000000,0> translate<31.815363,-1.536000,20.860297> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<31.815363,-1.536000,20.860297>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<31.624700,-1.536000,21.050959>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<31.624700,-1.536000,21.050959> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<31.624700,-1.536000,21.050959>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<31.624700,-1.536000,21.432284>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,90.000000,0> translate<31.624700,-1.536000,21.432284> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<31.624700,-1.536000,21.432284>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<31.815363,-1.536000,21.622947>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<31.624700,-1.536000,21.432284> }
//IC1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.620000,0.000000,18.000000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.020000,0.000000,18.000000>}
box{<0,0,-0.063500><4.400000,0.036000,0.063500> rotate<0,0.000000,0> translate<17.620000,0.000000,18.000000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.020000,0.000000,18.000000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.020000,0.000000,10.200000>}
box{<0,0,-0.063500><7.800000,0.036000,0.063500> rotate<0,-90.000000,0> translate<22.020000,0.000000,10.200000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.020000,0.000000,10.200000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.620000,0.000000,10.200000>}
box{<0,0,-0.063500><4.400000,0.036000,0.063500> rotate<0,0.000000,0> translate<17.620000,0.000000,10.200000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.620000,0.000000,10.200000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.620000,0.000000,18.000000>}
box{<0,0,-0.063500><7.800000,0.036000,0.063500> rotate<0,90.000000,0> translate<17.620000,0.000000,18.000000> }
difference{
cylinder{<18.420000,0,17.100000><18.420000,0.036000,17.100000>0.487763 translate<0,0.000000,0>}
cylinder{<18.420000,-0.1,17.100000><18.420000,0.135000,17.100000>0.360763 translate<0,0.000000,0>}}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.788000,0.000000,18.346400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<18.093059,0.000000,18.346400>}
box{<0,0,-0.050800><0.305059,0.036000,0.050800> rotate<0,0.000000,0> translate<17.788000,0.000000,18.346400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.940528,0.000000,18.346400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.940528,0.000000,19.261581>}
box{<0,0,-0.050800><0.915181,0.036000,0.050800> rotate<0,90.000000,0> translate<17.940528,0.000000,19.261581> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.788000,0.000000,19.261581>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<18.093059,0.000000,19.261581>}
box{<0,0,-0.050800><0.305059,0.036000,0.050800> rotate<0,0.000000,0> translate<17.788000,0.000000,19.261581> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.021797,0.000000,19.109050>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<18.869269,0.000000,19.261581>}
box{<0,0,-0.050800><0.215710,0.036000,0.050800> rotate<0,44.997617,0> translate<18.869269,0.000000,19.261581> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<18.869269,0.000000,19.261581>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<18.564206,0.000000,19.261581>}
box{<0,0,-0.050800><0.305062,0.036000,0.050800> rotate<0,0.000000,0> translate<18.564206,0.000000,19.261581> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<18.564206,0.000000,19.261581>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<18.411678,0.000000,19.109050>}
box{<0,0,-0.050800><0.215710,0.036000,0.050800> rotate<0,-44.997617,0> translate<18.411678,0.000000,19.109050> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<18.411678,0.000000,19.109050>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<18.411678,0.000000,18.498928>}
box{<0,0,-0.050800><0.610122,0.036000,0.050800> rotate<0,-90.000000,0> translate<18.411678,0.000000,18.498928> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<18.411678,0.000000,18.498928>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<18.564206,0.000000,18.346400>}
box{<0,0,-0.050800><0.215707,0.036000,0.050800> rotate<0,44.997030,0> translate<18.411678,0.000000,18.498928> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<18.564206,0.000000,18.346400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<18.869269,0.000000,18.346400>}
box{<0,0,-0.050800><0.305062,0.036000,0.050800> rotate<0,0.000000,0> translate<18.564206,0.000000,18.346400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<18.869269,0.000000,18.346400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.021797,0.000000,18.498928>}
box{<0,0,-0.050800><0.215707,0.036000,0.050800> rotate<0,-44.997030,0> translate<18.869269,0.000000,18.346400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.347197,0.000000,18.956519>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.652256,0.000000,19.261581>}
box{<0,0,-0.050800><0.431421,0.036000,0.050800> rotate<0,-44.997324,0> translate<19.347197,0.000000,18.956519> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.652256,0.000000,19.261581>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.652256,0.000000,18.346400>}
box{<0,0,-0.050800><0.915181,0.036000,0.050800> rotate<0,-90.000000,0> translate<19.652256,0.000000,18.346400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.347197,0.000000,18.346400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.957316,0.000000,18.346400>}
box{<0,0,-0.050800><0.610119,0.036000,0.050800> rotate<0,0.000000,0> translate<19.347197,0.000000,18.346400> }
//JP3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.755000,-1.536000,16.640000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.390000,-1.536000,16.005000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<7.755000,-1.536000,16.640000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.390000,-1.536000,14.735000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.755000,-1.536000,14.100000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<7.755000,-1.536000,14.100000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.755000,-1.536000,14.100000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.390000,-1.536000,13.465000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<7.755000,-1.536000,14.100000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.390000,-1.536000,12.195000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.755000,-1.536000,11.560000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<7.755000,-1.536000,11.560000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.755000,-1.536000,11.560000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.390000,-1.536000,10.925000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<7.755000,-1.536000,11.560000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.390000,-1.536000,9.655000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.755000,-1.536000,9.020000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<7.755000,-1.536000,9.020000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.755000,-1.536000,16.640000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.945000,-1.536000,16.640000>}
box{<0,0,-0.076200><3.810000,0.036000,0.076200> rotate<0,0.000000,0> translate<3.945000,-1.536000,16.640000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.945000,-1.536000,16.640000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.310000,-1.536000,16.005000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<3.310000,-1.536000,16.005000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.310000,-1.536000,16.005000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.310000,-1.536000,14.735000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<3.310000,-1.536000,14.735000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.310000,-1.536000,14.735000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.945000,-1.536000,14.100000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<3.310000,-1.536000,14.735000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.945000,-1.536000,14.100000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.310000,-1.536000,13.465000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<3.310000,-1.536000,13.465000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.310000,-1.536000,13.465000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.310000,-1.536000,12.195000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<3.310000,-1.536000,12.195000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.310000,-1.536000,12.195000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.945000,-1.536000,11.560000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<3.310000,-1.536000,12.195000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.945000,-1.536000,11.560000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.310000,-1.536000,10.925000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<3.310000,-1.536000,10.925000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.310000,-1.536000,10.925000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.310000,-1.536000,9.655000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<3.310000,-1.536000,9.655000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.310000,-1.536000,9.655000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.945000,-1.536000,9.020000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<3.310000,-1.536000,9.655000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.945000,-1.536000,14.100000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.755000,-1.536000,14.100000>}
box{<0,0,-0.076200><3.810000,0.036000,0.076200> rotate<0,0.000000,0> translate<3.945000,-1.536000,14.100000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.945000,-1.536000,11.560000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.755000,-1.536000,11.560000>}
box{<0,0,-0.076200><3.810000,0.036000,0.076200> rotate<0,0.000000,0> translate<3.945000,-1.536000,11.560000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.945000,-1.536000,9.020000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.755000,-1.536000,9.020000>}
box{<0,0,-0.076200><3.810000,0.036000,0.076200> rotate<0,0.000000,0> translate<3.945000,-1.536000,9.020000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.390000,-1.536000,10.925000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.390000,-1.536000,9.655000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<8.390000,-1.536000,9.655000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.390000,-1.536000,13.465000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.390000,-1.536000,12.195000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<8.390000,-1.536000,12.195000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.390000,-1.536000,16.005000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.390000,-1.536000,14.735000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<8.390000,-1.536000,14.735000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.755000,-1.536000,9.020000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.390000,-1.536000,8.385000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<7.755000,-1.536000,9.020000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.390000,-1.536000,7.115000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.755000,-1.536000,6.480000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<7.755000,-1.536000,6.480000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.945000,-1.536000,9.020000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.310000,-1.536000,8.385000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<3.310000,-1.536000,8.385000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.310000,-1.536000,8.385000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.310000,-1.536000,7.115000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<3.310000,-1.536000,7.115000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.310000,-1.536000,7.115000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.945000,-1.536000,6.480000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<3.310000,-1.536000,7.115000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.945000,-1.536000,6.480000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.755000,-1.536000,6.480000>}
box{<0,0,-0.076200><3.810000,0.036000,0.076200> rotate<0,0.000000,0> translate<3.945000,-1.536000,6.480000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.390000,-1.536000,8.385000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.390000,-1.536000,7.115000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<8.390000,-1.536000,7.115000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<7.120000,-1.536000,15.370000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<4.580000,-1.536000,15.370000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<4.580000,-1.536000,12.830000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<7.120000,-1.536000,12.830000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<4.580000,-1.536000,10.290000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<7.120000,-1.536000,10.290000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<4.580000,-1.536000,7.750000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<7.120000,-1.536000,7.750000>}
//JP4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.695000,-1.536000,16.640000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.330000,-1.536000,16.005000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<35.695000,-1.536000,16.640000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.330000,-1.536000,14.735000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.695000,-1.536000,14.100000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<35.695000,-1.536000,14.100000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.695000,-1.536000,14.100000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.330000,-1.536000,13.465000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<35.695000,-1.536000,14.100000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.330000,-1.536000,12.195000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.695000,-1.536000,11.560000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<35.695000,-1.536000,11.560000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.695000,-1.536000,11.560000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.330000,-1.536000,10.925000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<35.695000,-1.536000,11.560000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.330000,-1.536000,9.655000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.695000,-1.536000,9.020000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<35.695000,-1.536000,9.020000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.695000,-1.536000,16.640000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.885000,-1.536000,16.640000>}
box{<0,0,-0.076200><3.810000,0.036000,0.076200> rotate<0,0.000000,0> translate<31.885000,-1.536000,16.640000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.885000,-1.536000,16.640000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.250000,-1.536000,16.005000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<31.250000,-1.536000,16.005000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.250000,-1.536000,16.005000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.250000,-1.536000,14.735000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<31.250000,-1.536000,14.735000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.250000,-1.536000,14.735000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.885000,-1.536000,14.100000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<31.250000,-1.536000,14.735000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.885000,-1.536000,14.100000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.250000,-1.536000,13.465000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<31.250000,-1.536000,13.465000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.250000,-1.536000,13.465000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.250000,-1.536000,12.195000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<31.250000,-1.536000,12.195000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.250000,-1.536000,12.195000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.885000,-1.536000,11.560000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<31.250000,-1.536000,12.195000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.885000,-1.536000,11.560000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.250000,-1.536000,10.925000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<31.250000,-1.536000,10.925000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.250000,-1.536000,10.925000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.250000,-1.536000,9.655000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<31.250000,-1.536000,9.655000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.250000,-1.536000,9.655000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.885000,-1.536000,9.020000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<31.250000,-1.536000,9.655000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.885000,-1.536000,14.100000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.695000,-1.536000,14.100000>}
box{<0,0,-0.076200><3.810000,0.036000,0.076200> rotate<0,0.000000,0> translate<31.885000,-1.536000,14.100000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.885000,-1.536000,11.560000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.695000,-1.536000,11.560000>}
box{<0,0,-0.076200><3.810000,0.036000,0.076200> rotate<0,0.000000,0> translate<31.885000,-1.536000,11.560000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.885000,-1.536000,9.020000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.695000,-1.536000,9.020000>}
box{<0,0,-0.076200><3.810000,0.036000,0.076200> rotate<0,0.000000,0> translate<31.885000,-1.536000,9.020000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.330000,-1.536000,10.925000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.330000,-1.536000,9.655000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<36.330000,-1.536000,9.655000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.330000,-1.536000,13.465000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.330000,-1.536000,12.195000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<36.330000,-1.536000,12.195000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.330000,-1.536000,16.005000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.330000,-1.536000,14.735000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<36.330000,-1.536000,14.735000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.695000,-1.536000,9.020000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.330000,-1.536000,8.385000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<35.695000,-1.536000,9.020000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.330000,-1.536000,7.115000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.695000,-1.536000,6.480000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<35.695000,-1.536000,6.480000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.885000,-1.536000,9.020000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.250000,-1.536000,8.385000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<31.250000,-1.536000,8.385000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.250000,-1.536000,8.385000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.250000,-1.536000,7.115000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<31.250000,-1.536000,7.115000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.250000,-1.536000,7.115000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.885000,-1.536000,6.480000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<31.250000,-1.536000,7.115000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.885000,-1.536000,6.480000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.695000,-1.536000,6.480000>}
box{<0,0,-0.076200><3.810000,0.036000,0.076200> rotate<0,0.000000,0> translate<31.885000,-1.536000,6.480000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.330000,-1.536000,8.385000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.330000,-1.536000,7.115000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<36.330000,-1.536000,7.115000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<35.060000,-1.536000,15.370000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<32.520000,-1.536000,15.370000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<32.520000,-1.536000,12.830000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<35.060000,-1.536000,12.830000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<32.520000,-1.536000,10.290000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<35.060000,-1.536000,10.290000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<32.520000,-1.536000,7.750000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<35.060000,-1.536000,7.750000>}
//POWER silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.835000,-1.536000,3.940000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.105000,-1.536000,3.940000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<12.835000,-1.536000,3.940000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.105000,-1.536000,3.940000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.740000,-1.536000,4.575000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<14.105000,-1.536000,3.940000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.740000,-1.536000,4.575000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.740000,-1.536000,5.845000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<14.740000,-1.536000,5.845000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.740000,-1.536000,5.845000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.105000,-1.536000,6.480000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<14.105000,-1.536000,6.480000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.200000,-1.536000,4.575000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.200000,-1.536000,5.845000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<12.200000,-1.536000,5.845000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.835000,-1.536000,3.940000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.200000,-1.536000,4.575000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<12.200000,-1.536000,4.575000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.200000,-1.536000,5.845000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.835000,-1.536000,6.480000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<12.200000,-1.536000,5.845000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.105000,-1.536000,6.480000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.835000,-1.536000,6.480000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<12.835000,-1.536000,6.480000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.740000,-1.536000,4.575000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.375000,-1.536000,3.940000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<14.740000,-1.536000,4.575000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.375000,-1.536000,3.940000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.645000,-1.536000,3.940000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<15.375000,-1.536000,3.940000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.645000,-1.536000,3.940000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.280000,-1.536000,4.575000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<16.645000,-1.536000,3.940000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.280000,-1.536000,4.575000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.280000,-1.536000,5.845000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<17.280000,-1.536000,5.845000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.280000,-1.536000,5.845000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.645000,-1.536000,6.480000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<16.645000,-1.536000,6.480000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.645000,-1.536000,6.480000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.375000,-1.536000,6.480000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<15.375000,-1.536000,6.480000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.375000,-1.536000,6.480000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.740000,-1.536000,5.845000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<14.740000,-1.536000,5.845000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<13.470000,-1.536000,5.210000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<16.010000,-1.536000,5.210000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.307297,-1.536000,2.174700>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.307297,-1.536000,3.318675>}
box{<0,0,-0.063500><1.143975,0.036000,0.063500> rotate<0,90.000000,0> translate<17.307297,-1.536000,3.318675> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.307297,-1.536000,3.318675>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.735309,-1.536000,3.318675>}
box{<0,0,-0.063500><0.571988,0.036000,0.063500> rotate<0,0.000000,0> translate<16.735309,-1.536000,3.318675> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.735309,-1.536000,3.318675>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.544647,-1.536000,3.128013>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<16.544647,-1.536000,3.128013> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.544647,-1.536000,3.128013>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.544647,-1.536000,2.746688>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,-90.000000,0> translate<16.544647,-1.536000,2.746688> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.544647,-1.536000,2.746688>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.735309,-1.536000,2.556025>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<16.544647,-1.536000,2.746688> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.735309,-1.536000,2.556025>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.307297,-1.536000,2.556025>}
box{<0,0,-0.063500><0.571988,0.036000,0.063500> rotate<0,0.000000,0> translate<16.735309,-1.536000,2.556025> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.565913,-1.536000,3.318675>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.947237,-1.536000,3.318675>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,0.000000,0> translate<15.565913,-1.536000,3.318675> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.947237,-1.536000,3.318675>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.137900,-1.536000,3.128013>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<15.947237,-1.536000,3.318675> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.137900,-1.536000,3.128013>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.137900,-1.536000,2.365363>}
box{<0,0,-0.063500><0.762650,0.036000,0.063500> rotate<0,-90.000000,0> translate<16.137900,-1.536000,2.365363> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.137900,-1.536000,2.365363>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.947237,-1.536000,2.174700>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<15.947237,-1.536000,2.174700> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.947237,-1.536000,2.174700>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.565913,-1.536000,2.174700>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,0.000000,0> translate<15.565913,-1.536000,2.174700> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.565913,-1.536000,2.174700>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.375250,-1.536000,2.365363>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<15.375250,-1.536000,2.365363> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.375250,-1.536000,2.365363>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.375250,-1.536000,3.128013>}
box{<0,0,-0.063500><0.762650,0.036000,0.063500> rotate<0,90.000000,0> translate<15.375250,-1.536000,3.128013> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.375250,-1.536000,3.128013>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.565913,-1.536000,3.318675>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<15.375250,-1.536000,3.128013> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.968503,-1.536000,3.318675>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.968503,-1.536000,2.174700>}
box{<0,0,-0.063500><1.143975,0.036000,0.063500> rotate<0,-90.000000,0> translate<14.968503,-1.536000,2.174700> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.968503,-1.536000,2.174700>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.587178,-1.536000,2.556025>}
box{<0,0,-0.063500><0.539275,0.036000,0.063500> rotate<0,44.997030,0> translate<14.587178,-1.536000,2.556025> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.587178,-1.536000,2.556025>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.205853,-1.536000,2.174700>}
box{<0,0,-0.063500><0.539275,0.036000,0.063500> rotate<0,-44.997030,0> translate<14.205853,-1.536000,2.174700> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.205853,-1.536000,2.174700>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.205853,-1.536000,3.318675>}
box{<0,0,-0.063500><1.143975,0.036000,0.063500> rotate<0,90.000000,0> translate<14.205853,-1.536000,3.318675> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.036456,-1.536000,3.318675>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.799106,-1.536000,3.318675>}
box{<0,0,-0.063500><0.762650,0.036000,0.063500> rotate<0,0.000000,0> translate<13.036456,-1.536000,3.318675> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.799106,-1.536000,3.318675>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.799106,-1.536000,2.174700>}
box{<0,0,-0.063500><1.143975,0.036000,0.063500> rotate<0,-90.000000,0> translate<13.799106,-1.536000,2.174700> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.799106,-1.536000,2.174700>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.036456,-1.536000,2.174700>}
box{<0,0,-0.063500><0.762650,0.036000,0.063500> rotate<0,0.000000,0> translate<13.036456,-1.536000,2.174700> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.799106,-1.536000,2.746688>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.417781,-1.536000,2.746688>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,0.000000,0> translate<13.417781,-1.536000,2.746688> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.629709,-1.536000,2.174700>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.629709,-1.536000,3.318675>}
box{<0,0,-0.063500><1.143975,0.036000,0.063500> rotate<0,90.000000,0> translate<12.629709,-1.536000,3.318675> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.629709,-1.536000,3.318675>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.057722,-1.536000,3.318675>}
box{<0,0,-0.063500><0.571988,0.036000,0.063500> rotate<0,0.000000,0> translate<12.057722,-1.536000,3.318675> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.057722,-1.536000,3.318675>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.867059,-1.536000,3.128013>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<11.867059,-1.536000,3.128013> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.867059,-1.536000,3.128013>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.867059,-1.536000,2.746688>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,-90.000000,0> translate<11.867059,-1.536000,2.746688> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.867059,-1.536000,2.746688>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.057722,-1.536000,2.556025>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<11.867059,-1.536000,2.746688> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.057722,-1.536000,2.556025>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.629709,-1.536000,2.556025>}
box{<0,0,-0.063500><0.571988,0.036000,0.063500> rotate<0,0.000000,0> translate<12.057722,-1.536000,2.556025> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.248384,-1.536000,2.556025>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.867059,-1.536000,2.174700>}
box{<0,0,-0.063500><0.539275,0.036000,0.063500> rotate<0,-44.997030,0> translate<11.867059,-1.536000,2.174700> }
//R1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<29.980000,-1.536000,31.880000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<29.980000,-1.536000,31.499000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,-90.000000,0> translate<29.980000,-1.536000,31.499000> }
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<29.091000,-1.536000,30.991000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<30.869000,-1.536000,30.991000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<30.869000,-1.536000,25.149000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<29.091000,-1.536000,25.149000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.869000,-1.536000,31.245000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.091000,-1.536000,31.245000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<29.091000,-1.536000,31.245000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.837000,-1.536000,30.991000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.837000,-1.536000,30.610000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<28.837000,-1.536000,30.610000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.964000,-1.536000,30.483000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.837000,-1.536000,30.610000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<28.837000,-1.536000,30.610000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.123000,-1.536000,30.991000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.123000,-1.536000,30.610000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<31.123000,-1.536000,30.610000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.996000,-1.536000,30.483000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.123000,-1.536000,30.610000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<30.996000,-1.536000,30.483000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.964000,-1.536000,25.657000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.837000,-1.536000,25.530000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<28.837000,-1.536000,25.530000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.964000,-1.536000,25.657000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.964000,-1.536000,30.483000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,90.000000,0> translate<28.964000,-1.536000,30.483000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.996000,-1.536000,25.657000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.123000,-1.536000,25.530000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<30.996000,-1.536000,25.657000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.996000,-1.536000,25.657000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.996000,-1.536000,30.483000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,90.000000,0> translate<30.996000,-1.536000,30.483000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.837000,-1.536000,25.149000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.837000,-1.536000,25.530000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<28.837000,-1.536000,25.530000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.123000,-1.536000,25.149000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.123000,-1.536000,25.530000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<31.123000,-1.536000,25.530000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.869000,-1.536000,24.895000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.091000,-1.536000,24.895000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<29.091000,-1.536000,24.895000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<29.980000,-1.536000,24.641000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<29.980000,-1.536000,24.260000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,-90.000000,0> translate<29.980000,-1.536000,24.260000> }
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-270.000000,0> translate<29.980000,-1.536000,31.372000>}
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-270.000000,0> translate<29.980000,-1.536000,24.768000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<27.676500,-1.536000,28.834703>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<28.820475,-1.536000,28.834703>}
box{<0,0,-0.063500><1.143975,0.036000,0.063500> rotate<0,0.000000,0> translate<27.676500,-1.536000,28.834703> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<28.820475,-1.536000,28.834703>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<28.820475,-1.536000,29.406691>}
box{<0,0,-0.063500><0.571988,0.036000,0.063500> rotate<0,90.000000,0> translate<28.820475,-1.536000,29.406691> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<28.820475,-1.536000,29.406691>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<28.629812,-1.536000,29.597353>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<28.629812,-1.536000,29.597353> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<28.629812,-1.536000,29.597353>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<28.248488,-1.536000,29.597353>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,0.000000,0> translate<28.248488,-1.536000,29.597353> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<28.248488,-1.536000,29.597353>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<28.057825,-1.536000,29.406691>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<28.057825,-1.536000,29.406691> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<28.057825,-1.536000,29.406691>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<28.057825,-1.536000,28.834703>}
box{<0,0,-0.063500><0.571988,0.036000,0.063500> rotate<0,-90.000000,0> translate<28.057825,-1.536000,28.834703> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<28.057825,-1.536000,29.216028>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<27.676500,-1.536000,29.597353>}
box{<0,0,-0.063500><0.539275,0.036000,0.063500> rotate<0,44.997030,0> translate<27.676500,-1.536000,29.597353> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<28.439150,-1.536000,30.004100>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<28.820475,-1.536000,30.385425>}
box{<0,0,-0.063500><0.539275,0.036000,0.063500> rotate<0,-44.997030,0> translate<28.439150,-1.536000,30.004100> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<28.820475,-1.536000,30.385425>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<27.676500,-1.536000,30.385425>}
box{<0,0,-0.063500><1.143975,0.036000,0.063500> rotate<0,0.000000,0> translate<27.676500,-1.536000,30.385425> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<27.676500,-1.536000,30.004100>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<27.676500,-1.536000,30.766750>}
box{<0,0,-0.063500><0.762650,0.036000,0.063500> rotate<0,90.000000,0> translate<27.676500,-1.536000,30.766750> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<30.094950,-1.536000,27.106203>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<30.476275,-1.536000,27.487528>}
box{<0,0,-0.063500><0.539275,0.036000,0.063500> rotate<0,-44.997030,0> translate<30.094950,-1.536000,27.106203> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<30.476275,-1.536000,27.487528>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.332300,-1.536000,27.487528>}
box{<0,0,-0.063500><1.143975,0.036000,0.063500> rotate<0,0.000000,0> translate<29.332300,-1.536000,27.487528> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.332300,-1.536000,27.106203>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.332300,-1.536000,27.868853>}
box{<0,0,-0.063500><0.762650,0.036000,0.063500> rotate<0,90.000000,0> translate<29.332300,-1.536000,27.868853> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.522963,-1.536000,28.275600>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<30.285613,-1.536000,28.275600>}
box{<0,0,-0.063500><0.762650,0.036000,0.063500> rotate<0,0.000000,0> translate<29.522963,-1.536000,28.275600> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<30.285613,-1.536000,28.275600>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<30.476275,-1.536000,28.466263>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<30.285613,-1.536000,28.275600> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<30.476275,-1.536000,28.466263>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<30.476275,-1.536000,28.847588>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,90.000000,0> translate<30.476275,-1.536000,28.847588> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<30.476275,-1.536000,28.847588>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<30.285613,-1.536000,29.038250>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<30.285613,-1.536000,29.038250> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<30.285613,-1.536000,29.038250>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.522963,-1.536000,29.038250>}
box{<0,0,-0.063500><0.762650,0.036000,0.063500> rotate<0,0.000000,0> translate<29.522963,-1.536000,29.038250> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.522963,-1.536000,29.038250>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.332300,-1.536000,28.847588>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<29.332300,-1.536000,28.847588> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.332300,-1.536000,28.847588>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.332300,-1.536000,28.466263>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,-90.000000,0> translate<29.332300,-1.536000,28.466263> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.332300,-1.536000,28.466263>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.522963,-1.536000,28.275600>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<29.332300,-1.536000,28.466263> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.522963,-1.536000,28.275600>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<30.285613,-1.536000,29.038250>}
box{<0,0,-0.063500><1.078550,0.036000,0.063500> rotate<0,-44.997030,0> translate<29.522963,-1.536000,28.275600> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.332300,-1.536000,29.444997>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<30.476275,-1.536000,29.444997>}
box{<0,0,-0.063500><1.143975,0.036000,0.063500> rotate<0,0.000000,0> translate<29.332300,-1.536000,29.444997> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.332300,-1.536000,30.016984>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.713625,-1.536000,29.444997>}
box{<0,0,-0.063500><0.687443,0.036000,0.063500> rotate<0,56.306216,0> translate<29.332300,-1.536000,30.016984> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.713625,-1.536000,29.444997>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<30.094950,-1.536000,30.016984>}
box{<0,0,-0.063500><0.687443,0.036000,0.063500> rotate<0,-56.306216,0> translate<29.713625,-1.536000,29.444997> }
//R2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<12.200000,-1.536000,31.880000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<12.200000,-1.536000,31.499000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,-90.000000,0> translate<12.200000,-1.536000,31.499000> }
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<11.311000,-1.536000,30.991000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<13.089000,-1.536000,30.991000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<13.089000,-1.536000,25.149000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<11.311000,-1.536000,25.149000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.089000,-1.536000,31.245000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.311000,-1.536000,31.245000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<11.311000,-1.536000,31.245000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.057000,-1.536000,30.991000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.057000,-1.536000,30.610000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<11.057000,-1.536000,30.610000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.184000,-1.536000,30.483000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.057000,-1.536000,30.610000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<11.057000,-1.536000,30.610000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.343000,-1.536000,30.991000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.343000,-1.536000,30.610000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<13.343000,-1.536000,30.610000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.216000,-1.536000,30.483000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.343000,-1.536000,30.610000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<13.216000,-1.536000,30.483000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.184000,-1.536000,25.657000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.057000,-1.536000,25.530000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<11.057000,-1.536000,25.530000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.184000,-1.536000,25.657000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.184000,-1.536000,30.483000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,90.000000,0> translate<11.184000,-1.536000,30.483000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.216000,-1.536000,25.657000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.343000,-1.536000,25.530000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<13.216000,-1.536000,25.657000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.216000,-1.536000,25.657000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.216000,-1.536000,30.483000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,90.000000,0> translate<13.216000,-1.536000,30.483000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.057000,-1.536000,25.149000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.057000,-1.536000,25.530000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<11.057000,-1.536000,25.530000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.343000,-1.536000,25.149000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.343000,-1.536000,25.530000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<13.343000,-1.536000,25.530000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.089000,-1.536000,24.895000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.311000,-1.536000,24.895000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<11.311000,-1.536000,24.895000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<12.200000,-1.536000,24.641000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<12.200000,-1.536000,24.260000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,-90.000000,0> translate<12.200000,-1.536000,24.260000> }
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-270.000000,0> translate<12.200000,-1.536000,31.372000>}
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-270.000000,0> translate<12.200000,-1.536000,24.768000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.796500,-1.536000,28.634703>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.940475,-1.536000,28.634703>}
box{<0,0,-0.063500><1.143975,0.036000,0.063500> rotate<0,0.000000,0> translate<13.796500,-1.536000,28.634703> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.940475,-1.536000,28.634703>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.940475,-1.536000,29.206691>}
box{<0,0,-0.063500><0.571987,0.036000,0.063500> rotate<0,90.000000,0> translate<14.940475,-1.536000,29.206691> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.940475,-1.536000,29.206691>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.749813,-1.536000,29.397353>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<14.749813,-1.536000,29.397353> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.749813,-1.536000,29.397353>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.368488,-1.536000,29.397353>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,0.000000,0> translate<14.368488,-1.536000,29.397353> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.368488,-1.536000,29.397353>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.177825,-1.536000,29.206691>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<14.177825,-1.536000,29.206691> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.177825,-1.536000,29.206691>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.177825,-1.536000,28.634703>}
box{<0,0,-0.063500><0.571987,0.036000,0.063500> rotate<0,-90.000000,0> translate<14.177825,-1.536000,28.634703> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.177825,-1.536000,29.016028>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.796500,-1.536000,29.397353>}
box{<0,0,-0.063500><0.539275,0.036000,0.063500> rotate<0,44.997030,0> translate<13.796500,-1.536000,29.397353> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.796500,-1.536000,30.566750>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.796500,-1.536000,29.804100>}
box{<0,0,-0.063500><0.762650,0.036000,0.063500> rotate<0,-90.000000,0> translate<13.796500,-1.536000,29.804100> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.796500,-1.536000,29.804100>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.559150,-1.536000,30.566750>}
box{<0,0,-0.063500><1.078550,0.036000,0.063500> rotate<0,-44.997030,0> translate<13.796500,-1.536000,29.804100> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.559150,-1.536000,30.566750>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.749813,-1.536000,30.566750>}
box{<0,0,-0.063500><0.190663,0.036000,0.063500> rotate<0,0.000000,0> translate<14.559150,-1.536000,30.566750> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.749813,-1.536000,30.566750>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.940475,-1.536000,30.376088>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<14.749813,-1.536000,30.566750> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.940475,-1.536000,30.376088>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.940475,-1.536000,29.994763>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,-90.000000,0> translate<14.940475,-1.536000,29.994763> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.940475,-1.536000,29.994763>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.749813,-1.536000,29.804100>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<14.749813,-1.536000,29.804100> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.314950,-1.536000,27.106203>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.696275,-1.536000,27.487528>}
box{<0,0,-0.063500><0.539275,0.036000,0.063500> rotate<0,-44.997030,0> translate<12.314950,-1.536000,27.106203> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.696275,-1.536000,27.487528>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.552300,-1.536000,27.487528>}
box{<0,0,-0.063500><1.143975,0.036000,0.063500> rotate<0,0.000000,0> translate<11.552300,-1.536000,27.487528> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.552300,-1.536000,27.106203>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.552300,-1.536000,27.868853>}
box{<0,0,-0.063500><0.762650,0.036000,0.063500> rotate<0,90.000000,0> translate<11.552300,-1.536000,27.868853> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.742963,-1.536000,28.275600>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.505612,-1.536000,28.275600>}
box{<0,0,-0.063500><0.762650,0.036000,0.063500> rotate<0,0.000000,0> translate<11.742963,-1.536000,28.275600> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.505612,-1.536000,28.275600>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.696275,-1.536000,28.466263>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<12.505612,-1.536000,28.275600> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.696275,-1.536000,28.466263>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.696275,-1.536000,28.847588>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,90.000000,0> translate<12.696275,-1.536000,28.847588> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.696275,-1.536000,28.847588>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.505612,-1.536000,29.038250>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<12.505612,-1.536000,29.038250> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.505612,-1.536000,29.038250>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.742963,-1.536000,29.038250>}
box{<0,0,-0.063500><0.762650,0.036000,0.063500> rotate<0,0.000000,0> translate<11.742963,-1.536000,29.038250> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.742963,-1.536000,29.038250>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.552300,-1.536000,28.847588>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<11.552300,-1.536000,28.847588> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.552300,-1.536000,28.847588>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.552300,-1.536000,28.466263>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,-90.000000,0> translate<11.552300,-1.536000,28.466263> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.552300,-1.536000,28.466263>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.742963,-1.536000,28.275600>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<11.552300,-1.536000,28.466263> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.742963,-1.536000,28.275600>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.505612,-1.536000,29.038250>}
box{<0,0,-0.063500><1.078550,0.036000,0.063500> rotate<0,-44.997030,0> translate<11.742963,-1.536000,28.275600> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.552300,-1.536000,29.444997>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.696275,-1.536000,29.444997>}
box{<0,0,-0.063500><1.143975,0.036000,0.063500> rotate<0,0.000000,0> translate<11.552300,-1.536000,29.444997> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.552300,-1.536000,30.016984>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.933625,-1.536000,29.444997>}
box{<0,0,-0.063500><0.687443,0.036000,0.063500> rotate<0,56.306216,0> translate<11.552300,-1.536000,30.016984> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.933625,-1.536000,29.444997>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.314950,-1.536000,30.016984>}
box{<0,0,-0.063500><0.687443,0.036000,0.063500> rotate<0,-56.306216,0> translate<11.933625,-1.536000,29.444997> }
//R3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<21.660000,-1.536000,31.880000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<21.660000,-1.536000,31.499000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,-90.000000,0> translate<21.660000,-1.536000,31.499000> }
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<20.771000,-1.536000,30.991000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<22.549000,-1.536000,30.991000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<22.549000,-1.536000,25.149000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<20.771000,-1.536000,25.149000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.549000,-1.536000,31.245000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.771000,-1.536000,31.245000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<20.771000,-1.536000,31.245000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.517000,-1.536000,30.991000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.517000,-1.536000,30.610000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<20.517000,-1.536000,30.610000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.644000,-1.536000,30.483000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.517000,-1.536000,30.610000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<20.517000,-1.536000,30.610000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.803000,-1.536000,30.991000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.803000,-1.536000,30.610000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<22.803000,-1.536000,30.610000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.676000,-1.536000,30.483000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.803000,-1.536000,30.610000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<22.676000,-1.536000,30.483000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.644000,-1.536000,25.657000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.517000,-1.536000,25.530000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<20.517000,-1.536000,25.530000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.644000,-1.536000,25.657000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.644000,-1.536000,30.483000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,90.000000,0> translate<20.644000,-1.536000,30.483000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.676000,-1.536000,25.657000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.803000,-1.536000,25.530000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<22.676000,-1.536000,25.657000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.676000,-1.536000,25.657000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.676000,-1.536000,30.483000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,90.000000,0> translate<22.676000,-1.536000,30.483000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.517000,-1.536000,25.149000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.517000,-1.536000,25.530000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<20.517000,-1.536000,25.530000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.803000,-1.536000,25.149000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.803000,-1.536000,25.530000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<22.803000,-1.536000,25.530000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.549000,-1.536000,24.895000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.771000,-1.536000,24.895000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<20.771000,-1.536000,24.895000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<21.660000,-1.536000,24.641000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<21.660000,-1.536000,24.260000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,-90.000000,0> translate<21.660000,-1.536000,24.260000> }
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-270.000000,0> translate<21.660000,-1.536000,31.372000>}
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-270.000000,0> translate<21.660000,-1.536000,24.768000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.156500,-1.536000,28.734703>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.300475,-1.536000,28.734703>}
box{<0,0,-0.063500><1.143975,0.036000,0.063500> rotate<0,0.000000,0> translate<23.156500,-1.536000,28.734703> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.300475,-1.536000,28.734703>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.300475,-1.536000,29.306691>}
box{<0,0,-0.063500><0.571987,0.036000,0.063500> rotate<0,90.000000,0> translate<24.300475,-1.536000,29.306691> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.300475,-1.536000,29.306691>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.109813,-1.536000,29.497353>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<24.109813,-1.536000,29.497353> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.109813,-1.536000,29.497353>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.728487,-1.536000,29.497353>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,0.000000,0> translate<23.728487,-1.536000,29.497353> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.728487,-1.536000,29.497353>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.537825,-1.536000,29.306691>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<23.537825,-1.536000,29.306691> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.537825,-1.536000,29.306691>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.537825,-1.536000,28.734703>}
box{<0,0,-0.063500><0.571987,0.036000,0.063500> rotate<0,-90.000000,0> translate<23.537825,-1.536000,28.734703> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.537825,-1.536000,29.116028>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.156500,-1.536000,29.497353>}
box{<0,0,-0.063500><0.539275,0.036000,0.063500> rotate<0,44.997030,0> translate<23.156500,-1.536000,29.497353> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.109813,-1.536000,29.904100>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.300475,-1.536000,30.094763>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<24.109813,-1.536000,29.904100> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.300475,-1.536000,30.094763>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.300475,-1.536000,30.476088>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,90.000000,0> translate<24.300475,-1.536000,30.476088> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.300475,-1.536000,30.476088>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.109813,-1.536000,30.666750>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<24.109813,-1.536000,30.666750> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.109813,-1.536000,30.666750>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.919150,-1.536000,30.666750>}
box{<0,0,-0.063500><0.190662,0.036000,0.063500> rotate<0,0.000000,0> translate<23.919150,-1.536000,30.666750> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.919150,-1.536000,30.666750>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.728487,-1.536000,30.476088>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<23.728487,-1.536000,30.476088> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.728487,-1.536000,30.476088>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.728487,-1.536000,30.285425>}
box{<0,0,-0.063500><0.190663,0.036000,0.063500> rotate<0,-90.000000,0> translate<23.728487,-1.536000,30.285425> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.728487,-1.536000,30.476088>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.537825,-1.536000,30.666750>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<23.537825,-1.536000,30.666750> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.537825,-1.536000,30.666750>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.347162,-1.536000,30.666750>}
box{<0,0,-0.063500><0.190663,0.036000,0.063500> rotate<0,0.000000,0> translate<23.347162,-1.536000,30.666750> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.347162,-1.536000,30.666750>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.156500,-1.536000,30.476088>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<23.156500,-1.536000,30.476088> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.156500,-1.536000,30.476088>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.156500,-1.536000,30.094763>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,-90.000000,0> translate<23.156500,-1.536000,30.094763> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.156500,-1.536000,30.094763>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.347162,-1.536000,29.904100>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<23.156500,-1.536000,30.094763> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.774950,-1.536000,27.106203>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.156275,-1.536000,27.487528>}
box{<0,0,-0.063500><0.539275,0.036000,0.063500> rotate<0,-44.997030,0> translate<21.774950,-1.536000,27.106203> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.156275,-1.536000,27.487528>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.012300,-1.536000,27.487528>}
box{<0,0,-0.063500><1.143975,0.036000,0.063500> rotate<0,0.000000,0> translate<21.012300,-1.536000,27.487528> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.012300,-1.536000,27.106203>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.012300,-1.536000,27.868853>}
box{<0,0,-0.063500><0.762650,0.036000,0.063500> rotate<0,90.000000,0> translate<21.012300,-1.536000,27.868853> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.202963,-1.536000,28.275600>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.965613,-1.536000,28.275600>}
box{<0,0,-0.063500><0.762650,0.036000,0.063500> rotate<0,0.000000,0> translate<21.202963,-1.536000,28.275600> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.965613,-1.536000,28.275600>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.156275,-1.536000,28.466263>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<21.965613,-1.536000,28.275600> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.156275,-1.536000,28.466263>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.156275,-1.536000,28.847588>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,90.000000,0> translate<22.156275,-1.536000,28.847588> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.156275,-1.536000,28.847588>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.965613,-1.536000,29.038250>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<21.965613,-1.536000,29.038250> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.965613,-1.536000,29.038250>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.202963,-1.536000,29.038250>}
box{<0,0,-0.063500><0.762650,0.036000,0.063500> rotate<0,0.000000,0> translate<21.202963,-1.536000,29.038250> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.202963,-1.536000,29.038250>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.012300,-1.536000,28.847588>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<21.012300,-1.536000,28.847588> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.012300,-1.536000,28.847588>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.012300,-1.536000,28.466263>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,-90.000000,0> translate<21.012300,-1.536000,28.466263> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.012300,-1.536000,28.466263>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.202963,-1.536000,28.275600>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<21.012300,-1.536000,28.466263> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.202963,-1.536000,28.275600>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.965613,-1.536000,29.038250>}
box{<0,0,-0.063500><1.078550,0.036000,0.063500> rotate<0,-44.997030,0> translate<21.202963,-1.536000,28.275600> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.012300,-1.536000,29.444997>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.156275,-1.536000,29.444997>}
box{<0,0,-0.063500><1.143975,0.036000,0.063500> rotate<0,0.000000,0> translate<21.012300,-1.536000,29.444997> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.012300,-1.536000,30.016984>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.393625,-1.536000,29.444997>}
box{<0,0,-0.063500><0.687443,0.036000,0.063500> rotate<0,56.306216,0> translate<21.012300,-1.536000,30.016984> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.393625,-1.536000,29.444997>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.774950,-1.536000,30.016984>}
box{<0,0,-0.063500><0.687443,0.036000,0.063500> rotate<0,-56.306216,0> translate<21.393625,-1.536000,29.444997> }
//R4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.101200,0.000000,22.355000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.678800,0.000000,22.355000>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,0.000000,0> translate<7.678800,0.000000,22.355000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.101200,0.000000,21.085000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.678800,0.000000,21.085000>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,0.000000,0> translate<7.678800,0.000000,21.085000> }
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-0.000000,0> translate<7.526400,0.000000,21.720000>}
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-0.000000,0> translate<9.253600,0.000000,21.720000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.170800,0.000000,23.040800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.170800,0.000000,24.210197>}
box{<0,0,-0.050800><1.169397,0.036000,0.050800> rotate<0,90.000000,0> translate<7.170800,0.000000,24.210197> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.170800,0.000000,24.210197>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.755497,0.000000,24.210197>}
box{<0,0,-0.050800><0.584697,0.036000,0.050800> rotate<0,0.000000,0> translate<7.170800,0.000000,24.210197> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.755497,0.000000,24.210197>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.950397,0.000000,24.015297>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,44.997030,0> translate<7.755497,0.000000,24.210197> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.950397,0.000000,24.015297>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.950397,0.000000,23.625497>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,-90.000000,0> translate<7.950397,0.000000,23.625497> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.950397,0.000000,23.625497>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.755497,0.000000,23.430597>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<7.755497,0.000000,23.430597> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.755497,0.000000,23.430597>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.170800,0.000000,23.430597>}
box{<0,0,-0.050800><0.584697,0.036000,0.050800> rotate<0,0.000000,0> translate<7.170800,0.000000,23.430597> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.560597,0.000000,23.430597>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.950397,0.000000,23.040800>}
box{<0,0,-0.050800><0.551258,0.036000,0.050800> rotate<0,44.996801,0> translate<7.560597,0.000000,23.430597> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.924894,0.000000,23.040800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.924894,0.000000,24.210197>}
box{<0,0,-0.050800><1.169397,0.036000,0.050800> rotate<0,90.000000,0> translate<8.924894,0.000000,24.210197> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.924894,0.000000,24.210197>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.340197,0.000000,23.625497>}
box{<0,0,-0.050800><0.826888,0.036000,0.050800> rotate<0,-44.997183,0> translate<8.340197,0.000000,23.625497> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.340197,0.000000,23.625497>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.119794,0.000000,23.625497>}
box{<0,0,-0.050800><0.779597,0.036000,0.050800> rotate<0,0.000000,0> translate<8.340197,0.000000,23.625497> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.170800,0.000000,20.010397>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.560597,0.000000,20.400197>}
box{<0,0,-0.050800><0.551258,0.036000,0.050800> rotate<0,-44.997260,0> translate<7.170800,0.000000,20.010397> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.560597,0.000000,20.400197>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.560597,0.000000,19.230800>}
box{<0,0,-0.050800><1.169397,0.036000,0.050800> rotate<0,-90.000000,0> translate<7.560597,0.000000,19.230800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.170800,0.000000,19.230800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.950397,0.000000,19.230800>}
box{<0,0,-0.050800><0.779597,0.036000,0.050800> rotate<0,0.000000,0> translate<7.170800,0.000000,19.230800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.340197,0.000000,19.425697>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.340197,0.000000,20.205297>}
box{<0,0,-0.050800><0.779600,0.036000,0.050800> rotate<0,90.000000,0> translate<8.340197,0.000000,20.205297> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.340197,0.000000,20.205297>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.535094,0.000000,20.400197>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,-44.997489,0> translate<8.340197,0.000000,20.205297> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.535094,0.000000,20.400197>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.924894,0.000000,20.400197>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<8.535094,0.000000,20.400197> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.924894,0.000000,20.400197>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.119794,0.000000,20.205297>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,44.997030,0> translate<8.924894,0.000000,20.400197> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.119794,0.000000,20.205297>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.119794,0.000000,19.425697>}
box{<0,0,-0.050800><0.779600,0.036000,0.050800> rotate<0,-90.000000,0> translate<9.119794,0.000000,19.425697> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.119794,0.000000,19.425697>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.924894,0.000000,19.230800>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,-44.996571,0> translate<8.924894,0.000000,19.230800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.924894,0.000000,19.230800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.535094,0.000000,19.230800>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<8.535094,0.000000,19.230800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.535094,0.000000,19.230800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.340197,0.000000,19.425697>}
box{<0,0,-0.050800><0.275626,0.036000,0.050800> rotate<0,44.997030,0> translate<8.340197,0.000000,19.425697> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.340197,0.000000,19.425697>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.119794,0.000000,20.205297>}
box{<0,0,-0.050800><1.102519,0.036000,0.050800> rotate<0,-44.997145,0> translate<8.340197,0.000000,19.425697> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.509594,0.000000,19.230800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.509594,0.000000,20.400197>}
box{<0,0,-0.050800><1.169397,0.036000,0.050800> rotate<0,90.000000,0> translate<9.509594,0.000000,20.400197> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.094291,0.000000,19.230800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.509594,0.000000,19.620597>}
box{<0,0,-0.050800><0.702718,0.036000,0.050800> rotate<0,33.687773,0> translate<9.509594,0.000000,19.620597> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.509594,0.000000,19.620597>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.094291,0.000000,20.010397>}
box{<0,0,-0.050800><0.702719,0.036000,0.050800> rotate<0,-33.687985,0> translate<9.509594,0.000000,19.620597> }
//RESET silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.310000,-1.536000,24.895000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.310000,-1.536000,23.625000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<3.310000,-1.536000,23.625000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.310000,-1.536000,23.625000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.945000,-1.536000,22.990000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<3.310000,-1.536000,23.625000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.945000,-1.536000,22.990000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.215000,-1.536000,22.990000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<3.945000,-1.536000,22.990000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.215000,-1.536000,22.990000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.850000,-1.536000,23.625000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<5.215000,-1.536000,22.990000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.945000,-1.536000,25.530000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.215000,-1.536000,25.530000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<3.945000,-1.536000,25.530000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.310000,-1.536000,24.895000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.945000,-1.536000,25.530000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<3.310000,-1.536000,24.895000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.215000,-1.536000,25.530000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.850000,-1.536000,24.895000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<5.215000,-1.536000,25.530000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.850000,-1.536000,23.625000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.850000,-1.536000,24.895000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<5.850000,-1.536000,24.895000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.945000,-1.536000,22.990000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.310000,-1.536000,22.355000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<3.310000,-1.536000,22.355000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.310000,-1.536000,22.355000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.310000,-1.536000,21.085000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<3.310000,-1.536000,21.085000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.310000,-1.536000,21.085000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.945000,-1.536000,20.450000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<3.310000,-1.536000,21.085000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.945000,-1.536000,20.450000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.215000,-1.536000,20.450000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<3.945000,-1.536000,20.450000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.215000,-1.536000,20.450000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.850000,-1.536000,21.085000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<5.215000,-1.536000,20.450000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.850000,-1.536000,21.085000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.850000,-1.536000,22.355000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<5.850000,-1.536000,22.355000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.850000,-1.536000,22.355000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.215000,-1.536000,22.990000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<5.215000,-1.536000,22.990000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<4.580000,-1.536000,24.260000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<4.580000,-1.536000,21.720000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<1.844700,-1.536000,19.722703>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.988675,-1.536000,19.722703>}
box{<0,0,-0.063500><1.143975,0.036000,0.063500> rotate<0,0.000000,0> translate<1.844700,-1.536000,19.722703> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.988675,-1.536000,19.722703>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.988675,-1.536000,20.294691>}
box{<0,0,-0.063500><0.571987,0.036000,0.063500> rotate<0,90.000000,0> translate<2.988675,-1.536000,20.294691> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.988675,-1.536000,20.294691>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.798013,-1.536000,20.485353>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<2.798013,-1.536000,20.485353> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.798013,-1.536000,20.485353>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.416688,-1.536000,20.485353>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,0.000000,0> translate<2.416688,-1.536000,20.485353> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.416688,-1.536000,20.485353>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.226025,-1.536000,20.294691>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<2.226025,-1.536000,20.294691> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.226025,-1.536000,20.294691>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.226025,-1.536000,19.722703>}
box{<0,0,-0.063500><0.571987,0.036000,0.063500> rotate<0,-90.000000,0> translate<2.226025,-1.536000,19.722703> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.226025,-1.536000,20.104028>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<1.844700,-1.536000,20.485353>}
box{<0,0,-0.063500><0.539275,0.036000,0.063500> rotate<0,44.997030,0> translate<1.844700,-1.536000,20.485353> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.988675,-1.536000,21.654750>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.988675,-1.536000,20.892100>}
box{<0,0,-0.063500><0.762650,0.036000,0.063500> rotate<0,-90.000000,0> translate<2.988675,-1.536000,20.892100> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.988675,-1.536000,20.892100>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<1.844700,-1.536000,20.892100>}
box{<0,0,-0.063500><1.143975,0.036000,0.063500> rotate<0,0.000000,0> translate<1.844700,-1.536000,20.892100> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<1.844700,-1.536000,20.892100>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<1.844700,-1.536000,21.654750>}
box{<0,0,-0.063500><0.762650,0.036000,0.063500> rotate<0,90.000000,0> translate<1.844700,-1.536000,21.654750> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.416688,-1.536000,20.892100>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.416688,-1.536000,21.273425>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,90.000000,0> translate<2.416688,-1.536000,21.273425> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.798013,-1.536000,22.824147>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.988675,-1.536000,22.633484>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<2.798013,-1.536000,22.824147> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.988675,-1.536000,22.633484>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.988675,-1.536000,22.252159>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,-90.000000,0> translate<2.988675,-1.536000,22.252159> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.988675,-1.536000,22.252159>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.798013,-1.536000,22.061497>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<2.798013,-1.536000,22.061497> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.798013,-1.536000,22.061497>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.607350,-1.536000,22.061497>}
box{<0,0,-0.063500><0.190662,0.036000,0.063500> rotate<0,0.000000,0> translate<2.607350,-1.536000,22.061497> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.607350,-1.536000,22.061497>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.416688,-1.536000,22.252159>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<2.416688,-1.536000,22.252159> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.416688,-1.536000,22.252159>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.416688,-1.536000,22.633484>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,90.000000,0> translate<2.416688,-1.536000,22.633484> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.416688,-1.536000,22.633484>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.226025,-1.536000,22.824147>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<2.226025,-1.536000,22.824147> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.226025,-1.536000,22.824147>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.035363,-1.536000,22.824147>}
box{<0,0,-0.063500><0.190662,0.036000,0.063500> rotate<0,0.000000,0> translate<2.035363,-1.536000,22.824147> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.035363,-1.536000,22.824147>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<1.844700,-1.536000,22.633484>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<1.844700,-1.536000,22.633484> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<1.844700,-1.536000,22.633484>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<1.844700,-1.536000,22.252159>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,-90.000000,0> translate<1.844700,-1.536000,22.252159> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<1.844700,-1.536000,22.252159>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.035363,-1.536000,22.061497>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<1.844700,-1.536000,22.252159> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.988675,-1.536000,23.993544>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.988675,-1.536000,23.230894>}
box{<0,0,-0.063500><0.762650,0.036000,0.063500> rotate<0,-90.000000,0> translate<2.988675,-1.536000,23.230894> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.988675,-1.536000,23.230894>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<1.844700,-1.536000,23.230894>}
box{<0,0,-0.063500><1.143975,0.036000,0.063500> rotate<0,0.000000,0> translate<1.844700,-1.536000,23.230894> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<1.844700,-1.536000,23.230894>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<1.844700,-1.536000,23.993544>}
box{<0,0,-0.063500><0.762650,0.036000,0.063500> rotate<0,90.000000,0> translate<1.844700,-1.536000,23.993544> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.416688,-1.536000,23.230894>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.416688,-1.536000,23.612219>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,90.000000,0> translate<2.416688,-1.536000,23.612219> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<1.844700,-1.536000,24.781616>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.988675,-1.536000,24.781616>}
box{<0,0,-0.063500><1.143975,0.036000,0.063500> rotate<0,0.000000,0> translate<1.844700,-1.536000,24.781616> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.988675,-1.536000,24.400291>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.988675,-1.536000,25.162941>}
box{<0,0,-0.063500><0.762650,0.036000,0.063500> rotate<0,90.000000,0> translate<2.988675,-1.536000,25.162941> }

texture{col_slk}
}
#end
translate<mac_x_ver,mac_y_ver,mac_z_ver>
rotate<mac_x_rot,mac_y_rot,mac_z_rot>
}//End union
#end

#if(use_file_as_inc=off)
object{  PCA9548A(-21.425000,0,-17.140000,pcb_rotate_x,pcb_rotate_y,pcb_rotate_z)
#if(pcb_upsidedown=on)
rotate pcb_rotdir*180
#end
}
#end


//Parts not found in 3dpack.dat or 3dusrpac.dat are:
//U$2		3,2
//U$3		3,2
//U$4		3,2
