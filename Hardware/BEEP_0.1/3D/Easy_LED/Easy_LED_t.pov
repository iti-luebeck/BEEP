//POVRay-Datei erstellt mit 3d41.ulp v20110101
///home/flexxxv/eagle/BEEP_0.1/Easy_LED.brd
//29.04.13 01:52

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
#local cam_y = 150;
#local cam_z = -75;
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

#local lgt1_pos_x = 17;
#local lgt1_pos_y = 26;
#local lgt1_pos_z = 17;
#local lgt1_intense = 0.722110;
#local lgt2_pos_x = -17;
#local lgt2_pos_y = 26;
#local lgt2_pos_z = 17;
#local lgt2_intense = 0.722110;
#local lgt3_pos_x = 17;
#local lgt3_pos_y = 26;
#local lgt3_pos_z = -11;
#local lgt3_intense = 0.722110;
#local lgt4_pos_x = -17;
#local lgt4_pos_y = 26;
#local lgt4_pos_z = -11;
#local lgt4_intense = 0.722110;

//Do not change these values
#declare pcb_height = 1.500000;
#declare pcb_cuheight = 0.035000;
#declare pcb_x_size = 46.900000;
#declare pcb_y_size = 33.000000;
#declare pcb_layer1_used = 1;
#declare pcb_layer16_used = 0;
#declare inc_testmode = off;
#declare global_seed=seed(894);
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
	//translate<-23.450000,0,-16.500000>
}
#end

background{col_bgr}
light_source{<lgt1_pos_x,lgt1_pos_y,lgt1_pos_z> White*lgt1_intense shadowless}
light_source{<lgt2_pos_x,lgt2_pos_y,lgt2_pos_z> White*lgt2_intense shadowless}
light_source{<lgt3_pos_x,lgt3_pos_y,lgt3_pos_z> White*lgt3_intense shadowless}
light_source{<lgt4_pos_x,lgt4_pos_y,lgt4_pos_z> White*lgt4_intense}
#end


#macro EASY_LED(mac_x_ver,mac_y_ver,mac_z_ver,mac_x_rot,mac_y_rot,mac_z_rot)
union{
#if(pcb_board = on)
difference{
union{
//Platine
prism{-1.500000,0.000000,8
<0.000000,0.000000><46.900000,0.000000>
<46.900000,0.000000><46.900000,33.000000>
<46.900000,33.000000><0.000000,33.000000>
<0.000000,33.000000><0.000000,0.000000>
texture{col_brd}}
}//End union(PCB)
//Bohrungen(real)/Bauteile
cylinder{<25.000000,1,4.400000><25.000000,-5,4.400000>1.600000 texture{col_hls}}
cylinder{<40.000000,1,28.900000><40.000000,-5,28.900000>1.600000 texture{col_hls}}
cylinder{<17.300000,1,29.000000><17.300000,-5,29.000000>1.600000 texture{col_hls}}
//Bohrungen(real)/Platine
//Bohrungen(real)/Durchkontaktierungen
}//End difference(reale Bohrungen/Durchbrüche)
#end
#if(pcb_parts=on)//Bauteile
union{
#ifndef(pack_IC1) #declare global_pack_IC1=yes; object {IC_SMD_SO18W("","",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<33.010000,0.000000,14.350000>translate<0,0.035000,0> }#end		//SMD IC SO18-Wide Package IC1  SOP18
#ifndef(pack_IC2) #declare global_pack_IC2=yes; object {IC_SMD_SO16("74HC238D","",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<19.980000,0.000000,16.290000>translate<0,0.035000,0> }#end		//SMD IC SO16 Package IC2 74HC238D SO16
#ifndef(pack_JP1) #declare global_pack_JP1=yes; object {CON_PH_1X8()translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,180> translate<43.400000,-1.500000,14.700000>}#end		//Stiftleiste 2,54mm Raster 8Pin 1Reihe (pinhead.lib) JP1  1X08
#ifndef(pack_JP2) #declare global_pack_JP2=yes; object {CON_PH_1X3()translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,180> translate<5.710000,-1.500000,20.100000>}#end		//Stiftleiste 2,54mm Raster 3Pin 1Reihe (pinhead.lib) JP2  1X03
#ifndef(pack_JP3) #declare global_pack_JP3=yes; object {CON_PH_1X3()translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,180> translate<5.710000,-1.500000,9.940000>}#end		//Stiftleiste 2,54mm Raster 3Pin 1Reihe (pinhead.lib) JP3  1X03
#ifndef(pack_PWR) #declare global_pack_PWR=yes; object {CON_PH_1X2()translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,180> translate<5.710000,-1.500000,27.720000>}#end		//Stiftleiste 2,54mm Raster 2Pin 1Reihe (pinhead.lib) PWR  1X02
#ifndef(pack_R1) #declare global_pack_R1=yes; object {RES_DIS_0207_075MM(texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,180> translate<12.930000,-1.500000,8.240000>}#end		//Diskreter Widerstand 0,3W 7,5MM Raster R1  0207/7
#ifndef(pack_R2) #declare global_pack_R2=yes; object {RES_SMD_CHIP_0805("0R0",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<9.820000,0.000000,9.940000>translate<0,0.035000,0> }#end		//SMD Widerstand 0805 R2  M0805
#ifndef(pack_R3) #declare global_pack_R3=yes; object {RES_SMD_CHIP_0805("0R0",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<9.790000,0.000000,15.020000>translate<0,0.035000,0> }#end		//SMD Widerstand 0805 R3  M0805
}//End union
#end
#if(pcb_pads_smds=on)
//Lötaugen&SMD/Bauteile
object{TOOLS_PCB_SMD(0.600000,1.800000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<28.535000,0.000000,19.430000>}
object{TOOLS_PCB_SMD(0.600000,1.800000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<28.535000,0.000000,18.160000>}
object{TOOLS_PCB_SMD(0.600000,1.800000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<28.535000,0.000000,16.890000>}
object{TOOLS_PCB_SMD(0.600000,1.800000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<28.535000,0.000000,15.620000>}
object{TOOLS_PCB_SMD(0.600000,1.800000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<28.535000,0.000000,14.350000>}
object{TOOLS_PCB_SMD(0.600000,1.800000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<28.535000,0.000000,13.080000>}
object{TOOLS_PCB_SMD(0.600000,1.800000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<28.535000,0.000000,11.810000>}
object{TOOLS_PCB_SMD(0.600000,1.800000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<28.535000,0.000000,10.540000>}
object{TOOLS_PCB_SMD(0.600000,1.800000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<28.535000,0.000000,9.270000>}
object{TOOLS_PCB_SMD(0.600000,1.800000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<37.485000,0.000000,9.270000>}
object{TOOLS_PCB_SMD(0.600000,1.800000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<37.510000,0.000000,10.540000>}
object{TOOLS_PCB_SMD(0.600000,1.800000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<37.510000,0.000000,11.810000>}
object{TOOLS_PCB_SMD(0.600000,1.800000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<37.510000,0.000000,13.080000>}
object{TOOLS_PCB_SMD(0.600000,1.800000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<37.510000,0.000000,14.350000>}
object{TOOLS_PCB_SMD(0.600000,1.800000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<37.510000,0.000000,15.620000>}
object{TOOLS_PCB_SMD(0.600000,1.800000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<37.510000,0.000000,16.890000>}
object{TOOLS_PCB_SMD(0.600000,1.800000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<37.510000,0.000000,18.160000>}
object{TOOLS_PCB_SMD(0.600000,1.800000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<37.510000,0.000000,19.430000>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<16.906600,0.000000,20.735000>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<16.906600,0.000000,19.465000>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<16.906600,0.000000,18.195000>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<16.906600,0.000000,16.925000>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<16.906600,0.000000,15.655000>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<16.906600,0.000000,14.385000>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<16.906600,0.000000,13.115000>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<16.906600,0.000000,11.845000>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<23.053400,0.000000,11.845000>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<23.053400,0.000000,13.115000>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<23.053400,0.000000,14.385000>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<23.053400,0.000000,15.655000>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<23.053400,0.000000,16.925000>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<23.053400,0.000000,18.195000>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<23.053400,0.000000,19.465000>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<23.053400,0.000000,20.735000>}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<43.400000,0,23.590000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<43.400000,0,21.050000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<43.400000,0,18.510000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<43.400000,0,15.970000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<43.400000,0,13.430000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<43.400000,0,10.890000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<43.400000,0,8.350000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<43.400000,0,5.810000> texture{col_thl}}
#ifndef(global_pack_JP2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<5.710000,0,17.560000> texture{col_thl}}
#ifndef(global_pack_JP2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<5.710000,0,20.100000> texture{col_thl}}
#ifndef(global_pack_JP2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<5.710000,0,22.640000> texture{col_thl}}
#ifndef(global_pack_JP3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<5.710000,0,7.400000> texture{col_thl}}
#ifndef(global_pack_JP3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<5.710000,0,9.940000> texture{col_thl}}
#ifndef(global_pack_JP3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<5.710000,0,12.480000> texture{col_thl}}
#ifndef(global_pack_PWR) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<5.710000,0,28.990000> texture{col_thl}}
#ifndef(global_pack_PWR) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<5.710000,0,26.450000> texture{col_thl}}
#ifndef(global_pack_R1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<12.930000,0,12.050000> texture{col_thl}}
#ifndef(global_pack_R1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<12.930000,0,4.430000> texture{col_thl}}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<9.820000,0.000000,8.990000>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<9.820000,0.000000,10.890000>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<9.790000,0.000000,15.970000>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<9.790000,0.000000,14.070000>}
//Lötaugen/Durchkontaktierungen
#end
#if(pcb_wires=on)
union{
//Signale
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.100000,0.000000,5.400000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.100000,0.000000,27.100000>}
box{<0,0,-0.203200><21.700000,0.035000,0.203200> rotate<0,90.000000,0> translate<2.100000,0.000000,27.100000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.100000,0.000000,5.400000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.070000,0.000000,4.430000>}
box{<0,0,-0.203200><1.371787,0.035000,0.203200> rotate<0,44.997030,0> translate<2.100000,0.000000,5.400000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.100000,0.000000,6.300000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.100000,0.000000,16.000000>}
box{<0,0,-0.304800><9.700000,0.035000,0.304800> rotate<0,90.000000,0> translate<3.100000,0.000000,16.000000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.100000,0.000000,9.600000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.100000,0.000000,16.000000>}
box{<0,0,-0.203200><6.400000,0.035000,0.203200> rotate<0,90.000000,0> translate<3.100000,0.000000,16.000000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.100000,0.000000,16.000000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.100000,0.000000,16.200000>}
box{<0,0,-0.203200><0.200000,0.035000,0.203200> rotate<0,90.000000,0> translate<3.100000,0.000000,16.200000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.100000,0.000000,16.200000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.100000,0.000000,23.840000>}
box{<0,0,-0.304800><7.640000,0.035000,0.304800> rotate<0,90.000000,0> translate<3.100000,0.000000,23.840000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.100000,0.000000,6.300000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.900000,0.000000,5.500000>}
box{<0,0,-0.304800><1.131371,0.035000,0.304800> rotate<0,44.997030,0> translate<3.100000,0.000000,6.300000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.100000,0.000000,9.600000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.000000,0.000000,8.700000>}
box{<0,0,-0.203200><1.272792,0.035000,0.203200> rotate<0,44.997030,0> translate<3.100000,0.000000,9.600000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.100000,0.000000,27.100000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.000000,0.000000,29.000000>}
box{<0,0,-0.203200><2.687006,0.035000,0.203200> rotate<0,-44.997030,0> translate<2.100000,0.000000,27.100000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.100000,0.000000,16.200000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.300000,0.000000,15.000000>}
box{<0,0,-0.203200><1.697056,0.035000,0.203200> rotate<0,44.997030,0> translate<3.100000,0.000000,16.200000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.000000,0.000000,29.000000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.700000,0.000000,29.000000>}
box{<0,0,-0.203200><1.700000,0.035000,0.203200> rotate<0,0.000000,0> translate<4.000000,0.000000,29.000000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.100000,0.000000,23.840000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.710000,0.000000,26.450000>}
box{<0,0,-0.304800><3.691097,0.035000,0.304800> rotate<0,-44.997030,0> translate<3.100000,0.000000,23.840000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.700000,0.000000,29.000000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.710000,0.000000,28.990000>}
box{<0,0,-0.304800><0.014142,0.035000,0.304800> rotate<0,44.997030,0> translate<5.700000,0.000000,29.000000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.710000,0.000000,28.990000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.720000,0.000000,29.000000>}
box{<0,0,-0.304800><0.014142,0.035000,0.304800> rotate<0,-44.997030,0> translate<5.710000,0.000000,28.990000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.710000,0.000000,17.560000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.750000,0.000000,17.600000>}
box{<0,0,-0.304800><0.056569,0.035000,0.304800> rotate<0,-44.997030,0> translate<5.710000,0.000000,17.560000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.710000,0.000000,26.450000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.760000,0.000000,26.500000>}
box{<0,0,-0.304800><0.070711,0.035000,0.304800> rotate<0,-44.997030,0> translate<5.710000,0.000000,26.450000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.710000,0.000000,22.640000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.770000,0.000000,22.700000>}
box{<0,0,-0.304800><0.084853,0.035000,0.304800> rotate<0,-44.997030,0> translate<5.710000,0.000000,22.640000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.710000,0.000000,20.100000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.810000,0.000000,20.200000>}
box{<0,0,-0.304800><0.141421,0.035000,0.304800> rotate<0,-44.997030,0> translate<5.710000,0.000000,20.100000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.710000,0.000000,9.940000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.980000,0.000000,9.940000>}
box{<0,0,-0.203200><1.270000,0.035000,0.203200> rotate<0,0.000000,0> translate<5.710000,0.000000,9.940000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.710000,0.000000,12.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.380000,0.000000,12.480000>}
box{<0,0,-0.203200><1.670000,0.035000,0.203200> rotate<0,0.000000,0> translate<5.710000,0.000000,12.480000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.000000,0.000000,8.700000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.400000,0.000000,8.700000>}
box{<0,0,-0.203200><3.400000,0.035000,0.203200> rotate<0,0.000000,0> translate<4.000000,0.000000,8.700000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.720000,0.000000,29.000000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.400000,0.000000,29.000000>}
box{<0,0,-0.304800><1.680000,0.035000,0.304800> rotate<0,0.000000,0> translate<5.720000,0.000000,29.000000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.300000,0.000000,15.000000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.500000,0.000000,15.000000>}
box{<0,0,-0.203200><3.200000,0.035000,0.203200> rotate<0,0.000000,0> translate<4.300000,0.000000,15.000000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.750000,0.000000,17.600000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.600000,0.000000,17.600000>}
box{<0,0,-0.304800><1.850000,0.035000,0.304800> rotate<0,0.000000,0> translate<5.750000,0.000000,17.600000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.400000,0.000000,8.700000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.690000,0.000000,8.990000>}
box{<0,0,-0.203200><0.410122,0.035000,0.203200> rotate<0,-44.997030,0> translate<7.400000,0.000000,8.700000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.760000,0.000000,26.500000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.800000,0.000000,26.500000>}
box{<0,0,-0.304800><2.040000,0.035000,0.304800> rotate<0,0.000000,0> translate<5.760000,0.000000,26.500000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.600000,0.000000,17.600000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.195000,0.000000,18.195000>}
box{<0,0,-0.304800><0.841457,0.035000,0.304800> rotate<0,-44.997030,0> translate<7.600000,0.000000,17.600000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.980000,0.000000,9.940000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.250000,0.000000,11.210000>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,-44.997030,0> translate<6.980000,0.000000,9.940000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.500000,0.000000,15.000000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.470000,0.000000,15.970000>}
box{<0,0,-0.203200><1.371787,0.035000,0.203200> rotate<0,-44.997030,0> translate<7.500000,0.000000,15.000000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.380000,0.000000,12.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.900000,0.000000,14.000000>}
box{<0,0,-0.203200><2.149605,0.035000,0.203200> rotate<0,-44.997030,0> translate<7.380000,0.000000,12.480000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.250000,0.000000,11.210000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.200000,0.000000,11.210000>}
box{<0,0,-0.203200><0.950000,0.035000,0.203200> rotate<0,0.000000,0> translate<8.250000,0.000000,11.210000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.770000,0.000000,22.700000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.500000,0.000000,22.700000>}
box{<0,0,-0.304800><3.730000,0.035000,0.304800> rotate<0,0.000000,0> translate<5.770000,0.000000,22.700000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.810000,0.000000,20.200000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.700000,0.000000,20.200000>}
box{<0,0,-0.304800><3.890000,0.035000,0.304800> rotate<0,0.000000,0> translate<5.810000,0.000000,20.200000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.900000,0.000000,14.000000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.720000,0.000000,14.000000>}
box{<0,0,-0.203200><0.820000,0.035000,0.203200> rotate<0,0.000000,0> translate<8.900000,0.000000,14.000000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.720000,0.000000,14.000000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.790000,0.000000,14.070000>}
box{<0,0,-0.304800><0.098995,0.035000,0.304800> rotate<0,-44.997030,0> translate<9.720000,0.000000,14.000000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.470000,0.000000,15.970000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.790000,0.000000,15.970000>}
box{<0,0,-0.203200><1.320000,0.035000,0.203200> rotate<0,0.000000,0> translate<8.470000,0.000000,15.970000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.690000,0.000000,8.990000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.820000,0.000000,8.990000>}
box{<0,0,-0.203200><2.130000,0.035000,0.203200> rotate<0,0.000000,0> translate<7.690000,0.000000,8.990000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.200000,0.000000,11.210000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.820000,0.000000,10.890000>}
box{<0,0,-0.203200><0.697711,0.035000,0.203200> rotate<0,27.297771,0> translate<9.200000,0.000000,11.210000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.820000,0.000000,10.890000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.830000,0.000000,11.200000>}
box{<0,0,-0.304800><0.310161,0.035000,0.304800> rotate<0,-88.146572,0> translate<9.820000,0.000000,10.890000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.790000,0.000000,14.070000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.860000,0.000000,14.000000>}
box{<0,0,-0.304800><0.098995,0.035000,0.304800> rotate<0,44.997030,0> translate<9.790000,0.000000,14.070000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.830000,0.000000,11.200000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.900000,0.000000,11.200000>}
box{<0,0,-0.304800><0.070000,0.035000,0.304800> rotate<0,0.000000,0> translate<9.830000,0.000000,11.200000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.700000,0.000000,20.200000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.435000,0.000000,19.465000>}
box{<0,0,-0.304800><1.039447,0.035000,0.304800> rotate<0,44.997030,0> translate<9.700000,0.000000,20.200000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.710000,0.000000,7.400000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.600000,0.000000,7.400000>}
box{<0,0,-0.203200><4.890000,0.035000,0.203200> rotate<0,0.000000,0> translate<5.710000,0.000000,7.400000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.900000,0.000000,5.500000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.800000,0.000000,5.500000>}
box{<0,0,-0.304800><6.900000,0.035000,0.304800> rotate<0,0.000000,0> translate<3.900000,0.000000,5.500000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.860000,0.000000,14.000000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.900000,0.000000,14.000000>}
box{<0,0,-0.203200><1.040000,0.035000,0.203200> rotate<0,0.000000,0> translate<9.860000,0.000000,14.000000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.600000,0.000000,7.400000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.400000,0.000000,8.200000>}
box{<0,0,-0.203200><1.131371,0.035000,0.203200> rotate<0,-44.997030,0> translate<10.600000,0.000000,7.400000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.400000,0.000000,10.520000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.400000,0.000000,8.200000>}
box{<0,0,-0.203200><2.320000,0.035000,0.203200> rotate<0,-90.000000,0> translate<11.400000,0.000000,8.200000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.500000,0.000000,22.700000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.465000,0.000000,20.735000>}
box{<0,0,-0.304800><2.778930,0.035000,0.304800> rotate<0,44.997030,0> translate<9.500000,0.000000,22.700000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.800000,0.000000,26.500000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.700000,0.000000,22.600000>}
box{<0,0,-0.304800><5.515433,0.035000,0.304800> rotate<0,44.997030,0> translate<7.800000,0.000000,26.500000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.400000,0.000000,29.000000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.800000,0.000000,23.600000>}
box{<0,0,-0.304800><7.636753,0.035000,0.304800> rotate<0,44.997030,0> translate<7.400000,0.000000,29.000000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.070000,0.000000,4.430000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.930000,0.000000,4.430000>}
box{<0,0,-0.203200><9.860000,0.035000,0.203200> rotate<0,0.000000,0> translate<3.070000,0.000000,4.430000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.400000,0.000000,10.520000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.930000,0.000000,12.050000>}
box{<0,0,-0.203200><2.163747,0.035000,0.203200> rotate<0,-44.997030,0> translate<11.400000,0.000000,10.520000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.930000,0.000000,12.050000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.930000,0.000000,12.530000>}
box{<0,0,-0.203200><0.480000,0.035000,0.203200> rotate<0,90.000000,0> translate<12.930000,0.000000,12.530000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.900000,0.000000,14.000000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.825000,0.000000,16.925000>}
box{<0,0,-0.203200><4.136575,0.035000,0.203200> rotate<0,-44.997030,0> translate<10.900000,0.000000,14.000000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.900000,0.000000,11.200000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.355000,0.000000,15.655000>}
box{<0,0,-0.203200><6.300321,0.035000,0.203200> rotate<0,-44.997030,0> translate<9.900000,0.000000,11.200000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.800000,0.000000,5.500000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.570000,0.000000,9.270000>}
box{<0,0,-0.304800><5.331585,0.035000,0.304800> rotate<0,-44.997030,0> translate<10.800000,0.000000,5.500000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.700000,0.000000,11.100000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.700000,0.000000,12.800000>}
box{<0,0,-0.304800><1.700000,0.035000,0.304800> rotate<0,90.000000,0> translate<14.700000,0.000000,12.800000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.930000,0.000000,12.530000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.785000,0.000000,14.385000>}
box{<0,0,-0.203200><2.623366,0.035000,0.203200> rotate<0,-44.997030,0> translate<12.930000,0.000000,12.530000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.700000,0.000000,12.800000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.000000,0.000000,13.100000>}
box{<0,0,-0.304800><0.424264,0.035000,0.304800> rotate<0,-44.997030,0> translate<14.700000,0.000000,12.800000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.700000,0.000000,11.100000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.260000,0.000000,10.540000>}
box{<0,0,-0.304800><0.791960,0.035000,0.304800> rotate<0,44.997030,0> translate<14.700000,0.000000,11.100000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.000000,0.000000,13.100000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.591600,0.000000,13.100000>}
box{<0,0,-0.304800><1.591600,0.035000,0.304800> rotate<0,0.000000,0> translate<15.000000,0.000000,13.100000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.591600,0.000000,13.100000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.906600,0.000000,13.115000>}
box{<0,0,-0.304800><0.315357,0.035000,0.304800> rotate<0,-2.726131,0> translate<16.591600,0.000000,13.100000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.785000,0.000000,14.385000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.906600,0.000000,14.385000>}
box{<0,0,-0.203200><2.121600,0.035000,0.203200> rotate<0,0.000000,0> translate<14.785000,0.000000,14.385000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.355000,0.000000,15.655000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.906600,0.000000,15.655000>}
box{<0,0,-0.203200><2.551600,0.035000,0.203200> rotate<0,0.000000,0> translate<14.355000,0.000000,15.655000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.825000,0.000000,16.925000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.906600,0.000000,16.925000>}
box{<0,0,-0.203200><3.081600,0.035000,0.203200> rotate<0,0.000000,0> translate<13.825000,0.000000,16.925000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.195000,0.000000,18.195000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.906600,0.000000,18.195000>}
box{<0,0,-0.304800><8.711600,0.035000,0.304800> rotate<0,0.000000,0> translate<8.195000,0.000000,18.195000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.435000,0.000000,19.465000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.906600,0.000000,19.465000>}
box{<0,0,-0.304800><6.471600,0.035000,0.304800> rotate<0,0.000000,0> translate<10.435000,0.000000,19.465000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.465000,0.000000,20.735000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.906600,0.000000,20.735000>}
box{<0,0,-0.304800><5.441600,0.035000,0.304800> rotate<0,0.000000,0> translate<11.465000,0.000000,20.735000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.700000,0.000000,22.600000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.500000,0.000000,22.600000>}
box{<0,0,-0.304800><5.800000,0.035000,0.304800> rotate<0,0.000000,0> translate<11.700000,0.000000,22.600000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.906600,0.000000,11.845000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.045000,0.000000,11.845000>}
box{<0,0,-0.304800><1.138400,0.035000,0.304800> rotate<0,0.000000,0> translate<16.906600,0.000000,11.845000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.045000,0.000000,11.845000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.700000,0.000000,12.500000>}
box{<0,0,-0.304800><0.926310,0.035000,0.304800> rotate<0,-44.997030,0> translate<18.045000,0.000000,11.845000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.500000,0.000000,22.600000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.700000,0.000000,21.400000>}
box{<0,0,-0.304800><1.697056,0.035000,0.304800> rotate<0,44.997030,0> translate<17.500000,0.000000,22.600000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.700000,0.000000,12.500000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.700000,0.000000,21.400000>}
box{<0,0,-0.304800><8.900000,0.035000,0.304800> rotate<0,90.000000,0> translate<18.700000,0.000000,21.400000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.788400,0.000000,19.430000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.053400,0.000000,19.465000>}
box{<0,0,-0.304800><0.267301,0.035000,0.304800> rotate<0,-7.523324,0> translate<22.788400,0.000000,19.430000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.800000,0.000000,23.600000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.000000,0.000000,23.600000>}
box{<0,0,-0.304800><11.200000,0.035000,0.304800> rotate<0,0.000000,0> translate<12.800000,0.000000,23.600000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.053400,0.000000,20.735000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.335000,0.000000,20.735000>}
box{<0,0,-0.304800><1.281600,0.035000,0.304800> rotate<0,0.000000,0> translate<23.053400,0.000000,20.735000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.335000,0.000000,20.735000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.000000,0.000000,21.400000>}
box{<0,0,-0.304800><0.940452,0.035000,0.304800> rotate<0,-44.997030,0> translate<24.335000,0.000000,20.735000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.000000,0.000000,23.600000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.000000,0.000000,22.600000>}
box{<0,0,-0.304800><1.414214,0.035000,0.304800> rotate<0,44.997030,0> translate<24.000000,0.000000,23.600000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.000000,0.000000,21.400000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.000000,0.000000,22.600000>}
box{<0,0,-0.304800><1.200000,0.035000,0.304800> rotate<0,90.000000,0> translate<25.000000,0.000000,22.600000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.000000,0.000000,21.400000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.600000,0.000000,20.800000>}
box{<0,0,-0.304800><0.848528,0.035000,0.304800> rotate<0,44.997030,0> translate<25.000000,0.000000,21.400000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.053400,0.000000,11.845000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.500000,0.000000,11.845000>}
box{<0,0,-0.304800><5.446600,0.035000,0.304800> rotate<0,0.000000,0> translate<23.053400,0.000000,11.845000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.053400,0.000000,13.115000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.500000,0.000000,13.115000>}
box{<0,0,-0.304800><5.446600,0.035000,0.304800> rotate<0,0.000000,0> translate<23.053400,0.000000,13.115000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.053400,0.000000,14.385000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.500000,0.000000,14.385000>}
box{<0,0,-0.304800><5.446600,0.035000,0.304800> rotate<0,0.000000,0> translate<23.053400,0.000000,14.385000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.053400,0.000000,15.655000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.500000,0.000000,15.655000>}
box{<0,0,-0.304800><5.446600,0.035000,0.304800> rotate<0,0.000000,0> translate<23.053400,0.000000,15.655000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.053400,0.000000,16.925000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.500000,0.000000,16.925000>}
box{<0,0,-0.304800><5.446600,0.035000,0.304800> rotate<0,0.000000,0> translate<23.053400,0.000000,16.925000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.053400,0.000000,18.195000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.500000,0.000000,18.195000>}
box{<0,0,-0.304800><5.446600,0.035000,0.304800> rotate<0,0.000000,0> translate<23.053400,0.000000,18.195000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.570000,0.000000,9.270000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.535000,0.000000,9.270000>}
box{<0,0,-0.304800><13.965000,0.035000,0.304800> rotate<0,0.000000,0> translate<14.570000,0.000000,9.270000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.260000,0.000000,10.540000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.535000,0.000000,10.540000>}
box{<0,0,-0.304800><13.275000,0.035000,0.304800> rotate<0,0.000000,0> translate<15.260000,0.000000,10.540000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.500000,0.000000,11.845000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.535000,0.000000,11.810000>}
box{<0,0,-0.304800><0.049497,0.035000,0.304800> rotate<0,44.997030,0> translate<28.500000,0.000000,11.845000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.500000,0.000000,13.115000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.535000,0.000000,13.080000>}
box{<0,0,-0.304800><0.049497,0.035000,0.304800> rotate<0,44.997030,0> translate<28.500000,0.000000,13.115000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.500000,0.000000,14.385000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.535000,0.000000,14.350000>}
box{<0,0,-0.304800><0.049497,0.035000,0.304800> rotate<0,44.997030,0> translate<28.500000,0.000000,14.385000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.500000,0.000000,15.655000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.535000,0.000000,15.620000>}
box{<0,0,-0.304800><0.049497,0.035000,0.304800> rotate<0,44.997030,0> translate<28.500000,0.000000,15.655000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.500000,0.000000,16.925000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.535000,0.000000,16.890000>}
box{<0,0,-0.304800><0.049497,0.035000,0.304800> rotate<0,44.997030,0> translate<28.500000,0.000000,16.925000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.500000,0.000000,18.195000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.535000,0.000000,18.160000>}
box{<0,0,-0.304800><0.049497,0.035000,0.304800> rotate<0,44.997030,0> translate<28.500000,0.000000,18.195000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.788400,0.000000,19.430000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.535000,0.000000,19.430000>}
box{<0,0,-0.304800><5.746600,0.035000,0.304800> rotate<0,0.000000,0> translate<22.788400,0.000000,19.430000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.600000,0.000000,20.800000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.200000,0.000000,20.800000>}
box{<0,0,-0.304800><8.600000,0.035000,0.304800> rotate<0,0.000000,0> translate<25.600000,0.000000,20.800000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.200000,0.000000,20.800000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.500000,0.000000,19.500000>}
box{<0,0,-0.304800><1.838478,0.035000,0.304800> rotate<0,44.997030,0> translate<34.200000,0.000000,20.800000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.500000,0.000000,9.800000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.500000,0.000000,19.500000>}
box{<0,0,-0.304800><9.700000,0.035000,0.304800> rotate<0,90.000000,0> translate<35.500000,0.000000,19.500000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.500000,0.000000,9.800000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.030000,0.000000,9.270000>}
box{<0,0,-0.304800><0.749533,0.035000,0.304800> rotate<0,44.997030,0> translate<35.500000,0.000000,9.800000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.030000,0.000000,9.270000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.485000,0.000000,9.270000>}
box{<0,0,-0.304800><1.455000,0.035000,0.304800> rotate<0,0.000000,0> translate<36.030000,0.000000,9.270000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.510000,0.000000,10.540000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.460000,0.000000,10.540000>}
box{<0,0,-0.304800><0.950000,0.035000,0.304800> rotate<0,0.000000,0> translate<37.510000,0.000000,10.540000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.510000,0.000000,19.430000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.530000,0.000000,19.430000>}
box{<0,0,-0.304800><1.020000,0.035000,0.304800> rotate<0,0.000000,0> translate<37.510000,0.000000,19.430000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.510000,0.000000,11.810000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.790000,0.000000,11.810000>}
box{<0,0,-0.304800><1.280000,0.035000,0.304800> rotate<0,0.000000,0> translate<37.510000,0.000000,11.810000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.510000,0.000000,18.160000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.160000,0.000000,18.160000>}
box{<0,0,-0.304800><1.650000,0.035000,0.304800> rotate<0,0.000000,0> translate<37.510000,0.000000,18.160000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.510000,0.000000,13.080000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.180000,0.000000,13.080000>}
box{<0,0,-0.304800><1.670000,0.035000,0.304800> rotate<0,0.000000,0> translate<37.510000,0.000000,13.080000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.180000,0.000000,13.080000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.200000,0.000000,13.100000>}
box{<0,0,-0.304800><0.028284,0.035000,0.304800> rotate<0,-44.997030,0> translate<39.180000,0.000000,13.080000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.300000,0.000000,9.700000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.300000,0.000000,8.300000>}
box{<0,0,-0.304800><1.400000,0.035000,0.304800> rotate<0,-90.000000,0> translate<39.300000,0.000000,8.300000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.460000,0.000000,10.540000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.300000,0.000000,9.700000>}
box{<0,0,-0.304800><1.187939,0.035000,0.304800> rotate<0,44.997030,0> translate<38.460000,0.000000,10.540000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.510000,0.000000,16.890000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.590000,0.000000,16.890000>}
box{<0,0,-0.304800><2.080000,0.035000,0.304800> rotate<0,0.000000,0> translate<37.510000,0.000000,16.890000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.510000,0.000000,14.350000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.750000,0.000000,14.350000>}
box{<0,0,-0.304800><2.240000,0.035000,0.304800> rotate<0,0.000000,0> translate<37.510000,0.000000,14.350000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.510000,0.000000,15.620000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.880000,0.000000,15.620000>}
box{<0,0,-0.304800><2.370000,0.035000,0.304800> rotate<0,0.000000,0> translate<37.510000,0.000000,15.620000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.880000,0.000000,15.620000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.900000,0.000000,15.600000>}
box{<0,0,-0.304800><0.028284,0.035000,0.304800> rotate<0,44.997030,0> translate<39.880000,0.000000,15.620000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.900000,0.000000,15.600000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.270000,0.000000,15.970000>}
box{<0,0,-0.304800><0.523259,0.035000,0.304800> rotate<0,-44.997030,0> translate<39.900000,0.000000,15.600000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.790000,0.000000,11.810000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.600000,0.000000,10.000000>}
box{<0,0,-0.304800><2.559727,0.035000,0.304800> rotate<0,44.997030,0> translate<38.790000,0.000000,11.810000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.600000,0.000000,9.200000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.600000,0.000000,10.000000>}
box{<0,0,-0.304800><0.800000,0.035000,0.304800> rotate<0,90.000000,0> translate<40.600000,0.000000,10.000000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.750000,0.000000,14.350000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.670000,0.000000,13.430000>}
box{<0,0,-0.304800><1.301076,0.035000,0.304800> rotate<0,44.997030,0> translate<39.750000,0.000000,14.350000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.590000,0.000000,16.890000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.210000,0.000000,18.510000>}
box{<0,0,-0.304800><2.291026,0.035000,0.304800> rotate<0,-44.997030,0> translate<39.590000,0.000000,16.890000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.200000,0.000000,13.100000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.410000,0.000000,10.890000>}
box{<0,0,-0.304800><3.125412,0.035000,0.304800> rotate<0,44.997030,0> translate<39.200000,0.000000,13.100000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.600000,0.000000,9.200000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.450000,0.000000,8.350000>}
box{<0,0,-0.304800><1.202082,0.035000,0.304800> rotate<0,44.997030,0> translate<40.600000,0.000000,9.200000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.300000,0.000000,8.300000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.800000,0.000000,5.800000>}
box{<0,0,-0.304800><3.535534,0.035000,0.304800> rotate<0,44.997030,0> translate<39.300000,0.000000,8.300000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.160000,0.000000,18.160000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.050000,0.000000,21.050000>}
box{<0,0,-0.304800><4.087077,0.035000,0.304800> rotate<0,-44.997030,0> translate<39.160000,0.000000,18.160000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.530000,0.000000,19.430000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.690000,0.000000,23.590000>}
box{<0,0,-0.304800><5.883128,0.035000,0.304800> rotate<0,-44.997030,0> translate<38.530000,0.000000,19.430000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.800000,0.000000,5.800000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.390000,0.000000,5.800000>}
box{<0,0,-0.304800><1.590000,0.035000,0.304800> rotate<0,0.000000,0> translate<41.800000,0.000000,5.800000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.390000,0.000000,5.800000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.400000,0.000000,5.810000>}
box{<0,0,-0.304800><0.014142,0.035000,0.304800> rotate<0,-44.997030,0> translate<43.390000,0.000000,5.800000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.450000,0.000000,8.350000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.400000,0.000000,8.350000>}
box{<0,0,-0.304800><1.950000,0.035000,0.304800> rotate<0,0.000000,0> translate<41.450000,0.000000,8.350000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.410000,0.000000,10.890000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.400000,0.000000,10.890000>}
box{<0,0,-0.304800><1.990000,0.035000,0.304800> rotate<0,0.000000,0> translate<41.410000,0.000000,10.890000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.670000,0.000000,13.430000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.400000,0.000000,13.430000>}
box{<0,0,-0.304800><2.730000,0.035000,0.304800> rotate<0,0.000000,0> translate<40.670000,0.000000,13.430000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.270000,0.000000,15.970000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.400000,0.000000,15.970000>}
box{<0,0,-0.304800><3.130000,0.035000,0.304800> rotate<0,0.000000,0> translate<40.270000,0.000000,15.970000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.210000,0.000000,18.510000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.400000,0.000000,18.510000>}
box{<0,0,-0.304800><2.190000,0.035000,0.304800> rotate<0,0.000000,0> translate<41.210000,0.000000,18.510000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.050000,0.000000,21.050000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.400000,0.000000,21.050000>}
box{<0,0,-0.304800><1.350000,0.035000,0.304800> rotate<0,0.000000,0> translate<42.050000,0.000000,21.050000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.690000,0.000000,23.590000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.400000,0.000000,23.590000>}
box{<0,0,-0.304800><0.710000,0.035000,0.304800> rotate<0,0.000000,0> translate<42.690000,0.000000,23.590000> }
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
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320797,0.000000,1.320797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320797,0.000000,31.679200>}
box{<0,0,-0.304800><30.358403,0.035000,0.304800> rotate<0,90.000000,0> translate<1.320797,0.000000,31.679200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320797,0.000000,1.320797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.932450,0.000000,1.320797>}
box{<0,0,-0.304800><20.611653,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320797,0.000000,1.320797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320797,0.000000,1.828800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.524494,0.000000,1.828800>}
box{<0,0,-0.304800><20.203697,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320797,0.000000,1.828800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320797,0.000000,2.438400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.108875,0.000000,2.438400>}
box{<0,0,-0.304800><19.788078,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320797,0.000000,2.438400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320797,0.000000,3.048000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.896181,0.000000,3.048000>}
box{<0,0,-0.304800><19.575384,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320797,0.000000,3.048000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320797,0.000000,3.657600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.050031,0.000000,3.657600>}
box{<0,0,-0.304800><10.729234,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320797,0.000000,3.657600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320797,0.000000,4.267200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.227009,0.000000,4.267200>}
box{<0,0,-0.304800><0.906213,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320797,0.000000,4.267200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320797,0.000000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.617409,0.000000,4.876800>}
box{<0,0,-0.304800><0.296612,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320797,0.000000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320797,0.000000,5.486400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.388800,0.000000,5.486400>}
box{<0,0,-0.304800><0.068003,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320797,0.000000,5.486400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320797,0.000000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.388800,0.000000,6.096000>}
box{<0,0,-0.304800><0.068003,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320797,0.000000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320797,0.000000,6.705600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.388800,0.000000,6.705600>}
box{<0,0,-0.304800><0.068003,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320797,0.000000,6.705600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320797,0.000000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.388800,0.000000,7.315200>}
box{<0,0,-0.304800><0.068003,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320797,0.000000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320797,0.000000,7.924800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.388800,0.000000,7.924800>}
box{<0,0,-0.304800><0.068003,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320797,0.000000,7.924800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320797,0.000000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.388800,0.000000,8.534400>}
box{<0,0,-0.304800><0.068003,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320797,0.000000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320797,0.000000,9.144000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.388800,0.000000,9.144000>}
box{<0,0,-0.304800><0.068003,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320797,0.000000,9.144000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320797,0.000000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.388800,0.000000,9.753600>}
box{<0,0,-0.304800><0.068003,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320797,0.000000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320797,0.000000,10.363200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.388800,0.000000,10.363200>}
box{<0,0,-0.304800><0.068003,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320797,0.000000,10.363200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320797,0.000000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.388800,0.000000,10.972800>}
box{<0,0,-0.304800><0.068003,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320797,0.000000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320797,0.000000,11.582400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.388800,0.000000,11.582400>}
box{<0,0,-0.304800><0.068003,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320797,0.000000,11.582400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320797,0.000000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.388800,0.000000,12.192000>}
box{<0,0,-0.304800><0.068003,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320797,0.000000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320797,0.000000,12.801600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.388800,0.000000,12.801600>}
box{<0,0,-0.304800><0.068003,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320797,0.000000,12.801600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320797,0.000000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.388800,0.000000,13.411200>}
box{<0,0,-0.304800><0.068003,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320797,0.000000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320797,0.000000,14.020800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.388800,0.000000,14.020800>}
box{<0,0,-0.304800><0.068003,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320797,0.000000,14.020800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320797,0.000000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.388800,0.000000,14.630400>}
box{<0,0,-0.304800><0.068003,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320797,0.000000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320797,0.000000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.388800,0.000000,15.240000>}
box{<0,0,-0.304800><0.068003,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320797,0.000000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320797,0.000000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.388800,0.000000,15.849600>}
box{<0,0,-0.304800><0.068003,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320797,0.000000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320797,0.000000,16.459200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.388800,0.000000,16.459200>}
box{<0,0,-0.304800><0.068003,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320797,0.000000,16.459200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320797,0.000000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.388800,0.000000,17.068800>}
box{<0,0,-0.304800><0.068003,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320797,0.000000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320797,0.000000,17.678400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.388800,0.000000,17.678400>}
box{<0,0,-0.304800><0.068003,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320797,0.000000,17.678400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320797,0.000000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.388800,0.000000,18.288000>}
box{<0,0,-0.304800><0.068003,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320797,0.000000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320797,0.000000,18.897600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.388800,0.000000,18.897600>}
box{<0,0,-0.304800><0.068003,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320797,0.000000,18.897600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320797,0.000000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.388800,0.000000,19.507200>}
box{<0,0,-0.304800><0.068003,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320797,0.000000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320797,0.000000,20.116800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.388800,0.000000,20.116800>}
box{<0,0,-0.304800><0.068003,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320797,0.000000,20.116800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320797,0.000000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.388800,0.000000,20.726400>}
box{<0,0,-0.304800><0.068003,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320797,0.000000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320797,0.000000,21.336000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.388800,0.000000,21.336000>}
box{<0,0,-0.304800><0.068003,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320797,0.000000,21.336000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320797,0.000000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.388800,0.000000,21.945600>}
box{<0,0,-0.304800><0.068003,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320797,0.000000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320797,0.000000,22.555200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.388800,0.000000,22.555200>}
box{<0,0,-0.304800><0.068003,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320797,0.000000,22.555200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320797,0.000000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.388800,0.000000,23.164800>}
box{<0,0,-0.304800><0.068003,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320797,0.000000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320797,0.000000,23.774400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.388800,0.000000,23.774400>}
box{<0,0,-0.304800><0.068003,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320797,0.000000,23.774400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320797,0.000000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.388800,0.000000,24.384000>}
box{<0,0,-0.304800><0.068003,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320797,0.000000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320797,0.000000,24.993600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.388800,0.000000,24.993600>}
box{<0,0,-0.304800><0.068003,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320797,0.000000,24.993600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320797,0.000000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.388800,0.000000,25.603200>}
box{<0,0,-0.304800><0.068003,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320797,0.000000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320797,0.000000,26.212800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.388800,0.000000,26.212800>}
box{<0,0,-0.304800><0.068003,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320797,0.000000,26.212800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320797,0.000000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.388800,0.000000,26.822400>}
box{<0,0,-0.304800><0.068003,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320797,0.000000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320797,0.000000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.467722,0.000000,27.432000>}
box{<0,0,-0.304800><0.146925,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320797,0.000000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320797,0.000000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.035813,0.000000,28.041600>}
box{<0,0,-0.304800><0.715016,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320797,0.000000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320797,0.000000,28.651200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.645412,0.000000,28.651200>}
box{<0,0,-0.304800><1.324616,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320797,0.000000,28.651200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320797,0.000000,29.260800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.255013,0.000000,29.260800>}
box{<0,0,-0.304800><1.934216,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320797,0.000000,29.260800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320797,0.000000,29.870400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.032350,0.000000,29.870400>}
box{<0,0,-0.304800><2.711553,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320797,0.000000,29.870400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320797,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.235669,0.000000,30.480000>}
box{<0,0,-0.304800><11.914872,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320797,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320797,0.000000,31.089600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.496150,0.000000,31.089600>}
box{<0,0,-0.304800><12.175353,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320797,0.000000,31.089600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320797,0.000000,31.679200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.753766,0.000000,31.679200>}
box{<0,0,-0.304800><8.432969,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320797,0.000000,31.679200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.388800,0.000000,5.258531>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.497072,0.000000,4.997138>}
box{<0,0,-0.304800><0.282930,0.035000,0.304800> rotate<0,67.495725,0> translate<1.388800,0.000000,5.258531> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.388800,0.000000,27.241466>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.388800,0.000000,5.258531>}
box{<0,0,-0.304800><21.982934,0.035000,0.304800> rotate<0,-90.000000,0> translate<1.388800,0.000000,5.258531> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.388800,0.000000,27.241466>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.497072,0.000000,27.502859>}
box{<0,0,-0.304800><0.282930,0.035000,0.304800> rotate<0,-67.495725,0> translate<1.388800,0.000000,27.241466> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.497072,0.000000,4.997138>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.467072,0.000000,4.027138>}
box{<0,0,-0.304800><1.371787,0.035000,0.304800> rotate<0,44.997030,0> translate<1.497072,0.000000,4.997138> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.497072,0.000000,27.502859>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.397072,0.000000,29.402859>}
box{<0,0,-0.304800><2.687006,0.035000,0.304800> rotate<0,-44.997030,0> translate<1.497072,0.000000,27.502859> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.467072,0.000000,4.027138>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.667137,0.000000,3.827072>}
box{<0,0,-0.304800><0.282936,0.035000,0.304800> rotate<0,44.997030,0> translate<2.467072,0.000000,4.027138> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.667137,0.000000,3.827072>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.928531,0.000000,3.718800>}
box{<0,0,-0.304800><0.282930,0.035000,0.304800> rotate<0,22.498335,0> translate<2.667137,0.000000,3.827072> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.811197,0.000000,5.694587>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.811197,0.000000,26.805409>}
box{<0,0,-0.304800><21.110822,0.035000,0.304800> rotate<0,90.000000,0> translate<2.811197,0.000000,26.805409> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.811197,0.000000,5.694587>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.364588,0.000000,5.141197>}
box{<0,0,-0.304800><0.782613,0.035000,0.304800> rotate<0,44.997030,0> translate<2.811197,0.000000,5.694587> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.811197,0.000000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.002297,0.000000,6.096000>}
box{<0,0,-0.304800><18.191100,0.035000,0.304800> rotate<0,0.000000,0> translate<2.811197,0.000000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.811197,0.000000,6.705600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.860991,0.000000,6.705600>}
box{<0,0,-0.304800><1.049794,0.035000,0.304800> rotate<0,0.000000,0> translate<2.811197,0.000000,6.705600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.811197,0.000000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.678000,0.000000,7.315200>}
box{<0,0,-0.304800><0.866803,0.035000,0.304800> rotate<0,0.000000,0> translate<2.811197,0.000000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.811197,0.000000,7.924800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.790744,0.000000,7.924800>}
box{<0,0,-0.304800><0.979547,0.035000,0.304800> rotate<0,0.000000,0> translate<2.811197,0.000000,7.924800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.811197,0.000000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.368022,0.000000,8.534400>}
box{<0,0,-0.304800><1.556825,0.035000,0.304800> rotate<0,0.000000,0> translate<2.811197,0.000000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.811197,0.000000,9.144000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.947947,0.000000,9.144000>}
box{<0,0,-0.304800><1.136750,0.035000,0.304800> rotate<0,0.000000,0> translate<2.811197,0.000000,9.144000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.811197,0.000000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.678000,0.000000,9.753600>}
box{<0,0,-0.304800><0.866803,0.035000,0.304800> rotate<0,0.000000,0> translate<2.811197,0.000000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.811197,0.000000,10.363200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.748659,0.000000,10.363200>}
box{<0,0,-0.304800><0.937463,0.035000,0.304800> rotate<0,0.000000,0> translate<2.811197,0.000000,10.363200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.811197,0.000000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.184750,0.000000,10.972800>}
box{<0,0,-0.304800><1.373553,0.035000,0.304800> rotate<0,0.000000,0> translate<2.811197,0.000000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.811197,0.000000,11.582400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.049547,0.000000,11.582400>}
box{<0,0,-0.304800><1.238350,0.035000,0.304800> rotate<0,0.000000,0> translate<2.811197,0.000000,11.582400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.811197,0.000000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.692653,0.000000,12.192000>}
box{<0,0,-0.304800><0.881456,0.035000,0.304800> rotate<0,0.000000,0> translate<2.811197,0.000000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.811197,0.000000,12.801600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.706575,0.000000,12.801600>}
box{<0,0,-0.304800><0.895378,0.035000,0.304800> rotate<0,0.000000,0> translate<2.811197,0.000000,12.801600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.811197,0.000000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.083150,0.000000,13.411200>}
box{<0,0,-0.304800><1.271953,0.035000,0.304800> rotate<0,0.000000,0> translate<2.811197,0.000000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.811197,0.000000,14.020800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.915013,0.000000,14.020800>}
box{<0,0,-0.304800><5.103816,0.035000,0.304800> rotate<0,0.000000,0> translate<2.811197,0.000000,14.020800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.811197,0.000000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.482000,0.000000,14.630400>}
box{<0,0,-0.304800><5.670803,0.035000,0.304800> rotate<0,0.000000,0> translate<2.811197,0.000000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.811197,0.000000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.432922,0.000000,15.240000>}
box{<0,0,-0.304800><5.621725,0.035000,0.304800> rotate<0,0.000000,0> translate<2.811197,0.000000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.811197,0.000000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.431200,0.000000,15.849600>}
box{<0,0,-0.304800><5.620003,0.035000,0.304800> rotate<0,0.000000,0> translate<2.811197,0.000000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.811197,0.000000,16.459200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.286894,0.000000,16.459200>}
box{<0,0,-0.304800><1.475697,0.035000,0.304800> rotate<0,0.000000,0> translate<2.811197,0.000000,16.459200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.811197,0.000000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.776822,0.000000,17.068800>}
box{<0,0,-0.304800><0.965625,0.035000,0.304800> rotate<0,0.000000,0> translate<2.811197,0.000000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.811197,0.000000,17.678400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.678000,0.000000,17.678400>}
box{<0,0,-0.304800><0.866803,0.035000,0.304800> rotate<0,0.000000,0> translate<2.811197,0.000000,17.678400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.811197,0.000000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.879950,0.000000,18.288000>}
box{<0,0,-0.304800><1.068753,0.035000,0.304800> rotate<0,0.000000,0> translate<2.811197,0.000000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.811197,0.000000,18.897600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.532178,0.000000,18.897600>}
box{<0,0,-0.304800><1.720981,0.035000,0.304800> rotate<0,0.000000,0> translate<2.811197,0.000000,18.897600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.811197,0.000000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.818906,0.000000,19.507200>}
box{<0,0,-0.304800><1.007709,0.035000,0.304800> rotate<0,0.000000,0> translate<2.811197,0.000000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.811197,0.000000,20.116800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.678000,0.000000,20.116800>}
box{<0,0,-0.304800><0.866803,0.035000,0.304800> rotate<0,0.000000,0> translate<2.811197,0.000000,20.116800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.811197,0.000000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.832828,0.000000,20.726400>}
box{<0,0,-0.304800><1.021631,0.035000,0.304800> rotate<0,0.000000,0> translate<2.811197,0.000000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.811197,0.000000,21.336000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.613303,0.000000,21.336000>}
box{<0,0,-0.304800><1.802106,0.035000,0.304800> rotate<0,0.000000,0> translate<2.811197,0.000000,21.336000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.811197,0.000000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.860991,0.000000,21.945600>}
box{<0,0,-0.304800><1.049794,0.035000,0.304800> rotate<0,0.000000,0> translate<2.811197,0.000000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.811197,0.000000,22.555200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.678000,0.000000,22.555200>}
box{<0,0,-0.304800><0.866803,0.035000,0.304800> rotate<0,0.000000,0> translate<2.811197,0.000000,22.555200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.811197,0.000000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.790744,0.000000,23.164800>}
box{<0,0,-0.304800><0.979547,0.035000,0.304800> rotate<0,0.000000,0> translate<2.811197,0.000000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.811197,0.000000,23.774400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.368022,0.000000,23.774400>}
box{<0,0,-0.304800><1.556825,0.035000,0.304800> rotate<0,0.000000,0> translate<2.811197,0.000000,23.774400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.811197,0.000000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.866525,0.000000,24.384000>}
box{<0,0,-0.304800><8.055328,0.035000,0.304800> rotate<0,0.000000,0> translate<2.811197,0.000000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.811197,0.000000,24.993600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.256925,0.000000,24.993600>}
box{<0,0,-0.304800><7.445728,0.035000,0.304800> rotate<0,0.000000,0> translate<2.811197,0.000000,24.993600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.811197,0.000000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.930634,0.000000,25.603200>}
box{<0,0,-0.304800><1.119438,0.035000,0.304800> rotate<0,0.000000,0> translate<2.811197,0.000000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.811197,0.000000,26.212800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.648303,0.000000,26.212800>}
box{<0,0,-0.304800><0.837106,0.035000,0.304800> rotate<0,0.000000,0> translate<2.811197,0.000000,26.212800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.811197,0.000000,26.805409>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.073866,0.000000,28.068081>}
box{<0,0,-0.304800><1.785685,0.035000,0.304800> rotate<0,-44.997101,0> translate<2.811197,0.000000,26.805409> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.828184,0.000000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.680231,0.000000,26.822400>}
box{<0,0,-0.304800><0.852047,0.035000,0.304800> rotate<0,0.000000,0> translate<2.828184,0.000000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.928531,0.000000,3.718800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.988831,0.000000,3.718800>}
box{<0,0,-0.304800><9.060300,0.035000,0.304800> rotate<0,0.000000,0> translate<2.928531,0.000000,3.718800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.019384,0.000000,5.486400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.334034,0.000000,5.486400>}
box{<0,0,-0.304800><9.314650,0.035000,0.304800> rotate<0,0.000000,0> translate<3.019384,0.000000,5.486400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.364588,0.000000,5.141197>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.988831,0.000000,5.141197>}
box{<0,0,-0.304800><8.624244,0.035000,0.304800> rotate<0,0.000000,0> translate<3.364588,0.000000,5.141197> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.397072,0.000000,29.402859>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.597138,0.000000,29.602925>}
box{<0,0,-0.304800><0.282936,0.035000,0.304800> rotate<0,-44.997030,0> translate<3.397072,0.000000,29.402859> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.437784,0.000000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.062109,0.000000,27.432000>}
box{<0,0,-0.304800><0.624325,0.035000,0.304800> rotate<0,0.000000,0> translate<3.437784,0.000000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.597138,0.000000,29.602925>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.858531,0.000000,29.711197>}
box{<0,0,-0.304800><0.282930,0.035000,0.304800> rotate<0,-22.498335,0> translate<3.597138,0.000000,29.602925> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.627197,0.000000,26.450012>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.627200,0.000000,26.553950>}
box{<0,0,-0.304800><0.103938,0.035000,0.304800> rotate<0,-89.992338,0> translate<3.627197,0.000000,26.450012> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.627197,0.000000,26.450012>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.709966,0.000000,26.450012>}
box{<0,0,-0.304800><2.082769,0.035000,0.304800> rotate<0,0.000000,0> translate<3.627197,0.000000,26.450012> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.627200,0.000000,26.346047>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.659722,0.000000,26.140709>}
box{<0,0,-0.304800><0.207897,0.035000,0.304800> rotate<0,80.994760,0> translate<3.627200,0.000000,26.346047> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.627200,0.000000,26.449981>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.627200,0.000000,26.346047>}
box{<0,0,-0.304800><0.103934,0.035000,0.304800> rotate<0,-90.000000,0> translate<3.627200,0.000000,26.346047> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.627200,0.000000,26.449981>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.709966,0.000000,26.449981>}
box{<0,0,-0.304800><2.082766,0.035000,0.304800> rotate<0,0.000000,0> translate<3.627200,0.000000,26.449981> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.627200,0.000000,26.553950>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.659722,0.000000,26.759288>}
box{<0,0,-0.304800><0.207897,0.035000,0.304800> rotate<0,-80.994760,0> translate<3.627200,0.000000,26.553950> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.659722,0.000000,26.140709>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.723966,0.000000,25.942988>}
box{<0,0,-0.304800><0.207897,0.035000,0.304800> rotate<0,71.995243,0> translate<3.659722,0.000000,26.140709> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.659722,0.000000,26.759288>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.723966,0.000000,26.957009>}
box{<0,0,-0.304800><0.207897,0.035000,0.304800> rotate<0,-71.995243,0> translate<3.659722,0.000000,26.759288> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.678000,0.000000,7.147378>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.871347,0.000000,6.680600>}
box{<0,0,-0.304800><0.505237,0.035000,0.304800> rotate<0,67.495436,0> translate<3.678000,0.000000,7.147378> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.678000,0.000000,7.652619>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.678000,0.000000,7.147378>}
box{<0,0,-0.304800><0.505241,0.035000,0.304800> rotate<0,-90.000000,0> translate<3.678000,0.000000,7.147378> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.678000,0.000000,7.652619>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.871347,0.000000,8.119397>}
box{<0,0,-0.304800><0.505237,0.035000,0.304800> rotate<0,-67.495436,0> translate<3.678000,0.000000,7.652619> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.678000,0.000000,9.687378>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.871347,0.000000,9.220600>}
box{<0,0,-0.304800><0.505237,0.035000,0.304800> rotate<0,67.495436,0> translate<3.678000,0.000000,9.687378> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.678000,0.000000,10.192619>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.678000,0.000000,9.687378>}
box{<0,0,-0.304800><0.505241,0.035000,0.304800> rotate<0,-90.000000,0> translate<3.678000,0.000000,9.687378> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.678000,0.000000,10.192619>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.871347,0.000000,10.659397>}
box{<0,0,-0.304800><0.505237,0.035000,0.304800> rotate<0,-67.495436,0> translate<3.678000,0.000000,10.192619> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.678000,0.000000,12.227378>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.871347,0.000000,11.760600>}
box{<0,0,-0.304800><0.505237,0.035000,0.304800> rotate<0,67.495436,0> translate<3.678000,0.000000,12.227378> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.678000,0.000000,12.732619>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.678000,0.000000,12.227378>}
box{<0,0,-0.304800><0.505241,0.035000,0.304800> rotate<0,-90.000000,0> translate<3.678000,0.000000,12.227378> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.678000,0.000000,12.732619>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.871347,0.000000,13.199397>}
box{<0,0,-0.304800><0.505237,0.035000,0.304800> rotate<0,-67.495436,0> translate<3.678000,0.000000,12.732619> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.678000,0.000000,17.307378>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.871347,0.000000,16.840600>}
box{<0,0,-0.304800><0.505237,0.035000,0.304800> rotate<0,67.495436,0> translate<3.678000,0.000000,17.307378> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.678000,0.000000,17.812619>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.678000,0.000000,17.307378>}
box{<0,0,-0.304800><0.505241,0.035000,0.304800> rotate<0,-90.000000,0> translate<3.678000,0.000000,17.307378> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.678000,0.000000,17.812619>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.871347,0.000000,18.279397>}
box{<0,0,-0.304800><0.505237,0.035000,0.304800> rotate<0,-67.495436,0> translate<3.678000,0.000000,17.812619> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.678000,0.000000,19.847378>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.871347,0.000000,19.380600>}
box{<0,0,-0.304800><0.505237,0.035000,0.304800> rotate<0,67.495436,0> translate<3.678000,0.000000,19.847378> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.678000,0.000000,20.352619>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.678000,0.000000,19.847378>}
box{<0,0,-0.304800><0.505241,0.035000,0.304800> rotate<0,-90.000000,0> translate<3.678000,0.000000,19.847378> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.678000,0.000000,20.352619>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.871347,0.000000,20.819397>}
box{<0,0,-0.304800><0.505237,0.035000,0.304800> rotate<0,-67.495436,0> translate<3.678000,0.000000,20.352619> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.678000,0.000000,22.387378>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.871347,0.000000,21.920600>}
box{<0,0,-0.304800><0.505237,0.035000,0.304800> rotate<0,67.495436,0> translate<3.678000,0.000000,22.387378> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.678000,0.000000,22.892619>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.678000,0.000000,22.387378>}
box{<0,0,-0.304800><0.505241,0.035000,0.304800> rotate<0,-90.000000,0> translate<3.678000,0.000000,22.387378> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.678000,0.000000,22.892619>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.871347,0.000000,23.359397>}
box{<0,0,-0.304800><0.505237,0.035000,0.304800> rotate<0,-67.495436,0> translate<3.678000,0.000000,22.892619> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.723966,0.000000,25.942988>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.818350,0.000000,25.757747>}
box{<0,0,-0.304800><0.207900,0.035000,0.304800> rotate<0,62.995950,0> translate<3.723966,0.000000,25.942988> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.723966,0.000000,26.957009>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.818350,0.000000,27.142250>}
box{<0,0,-0.304800><0.207900,0.035000,0.304800> rotate<0,-62.995950,0> translate<3.723966,0.000000,26.957009> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.818350,0.000000,25.757747>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.940550,0.000000,25.589556>}
box{<0,0,-0.304800><0.207896,0.035000,0.304800> rotate<0,53.995910,0> translate<3.818350,0.000000,25.757747> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.818350,0.000000,27.142250>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.940550,0.000000,27.310441>}
box{<0,0,-0.304800><0.207896,0.035000,0.304800> rotate<0,-53.995910,0> translate<3.818350,0.000000,27.142250> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.858531,0.000000,29.711197>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.873147,0.000000,29.711197>}
box{<0,0,-0.304800><0.014616,0.035000,0.304800> rotate<0,0.000000,0> translate<3.858531,0.000000,29.711197> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.871347,0.000000,6.680600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.228600,0.000000,6.323347>}
box{<0,0,-0.304800><0.505232,0.035000,0.304800> rotate<0,44.997030,0> translate<3.871347,0.000000,6.680600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.871347,0.000000,8.119397>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.228600,0.000000,8.476650>}
box{<0,0,-0.304800><0.505232,0.035000,0.304800> rotate<0,-44.997030,0> translate<3.871347,0.000000,8.119397> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.871347,0.000000,9.220600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.228600,0.000000,8.863347>}
box{<0,0,-0.304800><0.505232,0.035000,0.304800> rotate<0,44.997030,0> translate<3.871347,0.000000,9.220600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.871347,0.000000,10.659397>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.228600,0.000000,11.016650>}
box{<0,0,-0.304800><0.505232,0.035000,0.304800> rotate<0,-44.997030,0> translate<3.871347,0.000000,10.659397> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.871347,0.000000,11.760600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.228600,0.000000,11.403347>}
box{<0,0,-0.304800><0.505232,0.035000,0.304800> rotate<0,44.997030,0> translate<3.871347,0.000000,11.760600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.871347,0.000000,13.199397>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.228600,0.000000,13.556650>}
box{<0,0,-0.304800><0.505232,0.035000,0.304800> rotate<0,-44.997030,0> translate<3.871347,0.000000,13.199397> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.871347,0.000000,16.840600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.228600,0.000000,16.483347>}
box{<0,0,-0.304800><0.505232,0.035000,0.304800> rotate<0,44.997030,0> translate<3.871347,0.000000,16.840600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.871347,0.000000,18.279397>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.228600,0.000000,18.636650>}
box{<0,0,-0.304800><0.505232,0.035000,0.304800> rotate<0,-44.997030,0> translate<3.871347,0.000000,18.279397> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.871347,0.000000,19.380600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.228600,0.000000,19.023347>}
box{<0,0,-0.304800><0.505232,0.035000,0.304800> rotate<0,44.997030,0> translate<3.871347,0.000000,19.380600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.871347,0.000000,20.819397>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.228600,0.000000,21.176650>}
box{<0,0,-0.304800><0.505232,0.035000,0.304800> rotate<0,-44.997030,0> translate<3.871347,0.000000,20.819397> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.871347,0.000000,21.920600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.228600,0.000000,21.563347>}
box{<0,0,-0.304800><0.505232,0.035000,0.304800> rotate<0,44.997030,0> translate<3.871347,0.000000,21.920600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.871347,0.000000,23.359397>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.228600,0.000000,23.716650>}
box{<0,0,-0.304800><0.505232,0.035000,0.304800> rotate<0,-44.997030,0> translate<3.871347,0.000000,23.359397> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.873147,0.000000,29.711197>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.228600,0.000000,30.066650>}
box{<0,0,-0.304800><0.502687,0.035000,0.304800> rotate<0,-44.997030,0> translate<3.873147,0.000000,29.711197> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.940550,0.000000,25.589556>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.087556,0.000000,25.442550>}
box{<0,0,-0.304800><0.207898,0.035000,0.304800> rotate<0,44.997030,0> translate<3.940550,0.000000,25.589556> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.940550,0.000000,27.310441>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.087556,0.000000,27.457447>}
box{<0,0,-0.304800><0.207898,0.035000,0.304800> rotate<0,-44.997030,0> translate<3.940550,0.000000,27.310441> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.047384,0.000000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.100347,0.000000,28.041600>}
box{<0,0,-0.304800><0.052963,0.035000,0.304800> rotate<0,0.000000,0> translate<4.047384,0.000000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.073866,0.000000,28.068081>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.228600,0.000000,27.913347>}
box{<0,0,-0.304800><0.218827,0.035000,0.304800> rotate<0,44.997030,0> translate<4.073866,0.000000,28.068081> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.087556,0.000000,25.442550>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.255747,0.000000,25.320350>}
box{<0,0,-0.304800><0.207896,0.035000,0.304800> rotate<0,35.998150,0> translate<4.087556,0.000000,25.442550> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.087556,0.000000,27.457447>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.255747,0.000000,27.579647>}
box{<0,0,-0.304800><0.207896,0.035000,0.304800> rotate<0,-35.998150,0> translate<4.087556,0.000000,27.457447> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.228600,0.000000,6.323347>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.695378,0.000000,6.130000>}
box{<0,0,-0.304800><0.505237,0.035000,0.304800> rotate<0,22.498625,0> translate<4.228600,0.000000,6.323347> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.228600,0.000000,8.476650>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.695378,0.000000,8.669997>}
box{<0,0,-0.304800><0.505237,0.035000,0.304800> rotate<0,-22.498625,0> translate<4.228600,0.000000,8.476650> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.228600,0.000000,8.863347>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.695378,0.000000,8.670000>}
box{<0,0,-0.304800><0.505237,0.035000,0.304800> rotate<0,22.498625,0> translate<4.228600,0.000000,8.863347> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.228600,0.000000,11.016650>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.695378,0.000000,11.209997>}
box{<0,0,-0.304800><0.505237,0.035000,0.304800> rotate<0,-22.498625,0> translate<4.228600,0.000000,11.016650> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.228600,0.000000,11.403347>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.695378,0.000000,11.210000>}
box{<0,0,-0.304800><0.505237,0.035000,0.304800> rotate<0,22.498625,0> translate<4.228600,0.000000,11.403347> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.228600,0.000000,13.556650>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.695378,0.000000,13.749997>}
box{<0,0,-0.304800><0.505237,0.035000,0.304800> rotate<0,-22.498625,0> translate<4.228600,0.000000,13.556650> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.228600,0.000000,16.483347>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.695378,0.000000,16.290000>}
box{<0,0,-0.304800><0.505237,0.035000,0.304800> rotate<0,22.498625,0> translate<4.228600,0.000000,16.483347> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.228600,0.000000,18.636650>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.695378,0.000000,18.829997>}
box{<0,0,-0.304800><0.505237,0.035000,0.304800> rotate<0,-22.498625,0> translate<4.228600,0.000000,18.636650> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.228600,0.000000,19.023347>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.695378,0.000000,18.830000>}
box{<0,0,-0.304800><0.505237,0.035000,0.304800> rotate<0,22.498625,0> translate<4.228600,0.000000,19.023347> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.228600,0.000000,21.176650>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.695378,0.000000,21.369997>}
box{<0,0,-0.304800><0.505237,0.035000,0.304800> rotate<0,-22.498625,0> translate<4.228600,0.000000,21.176650> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.228600,0.000000,21.563347>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.695378,0.000000,21.370000>}
box{<0,0,-0.304800><0.505237,0.035000,0.304800> rotate<0,22.498625,0> translate<4.228600,0.000000,21.563347> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.228600,0.000000,23.716650>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.695378,0.000000,23.909997>}
box{<0,0,-0.304800><0.505237,0.035000,0.304800> rotate<0,-22.498625,0> translate<4.228600,0.000000,23.716650> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.228600,0.000000,27.913347>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.647791,0.000000,27.739713>}
box{<0,0,-0.304800><0.453729,0.035000,0.304800> rotate<0,22.498507,0> translate<4.228600,0.000000,27.913347> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.228600,0.000000,30.066650>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.695378,0.000000,30.259997>}
box{<0,0,-0.304800><0.505237,0.035000,0.304800> rotate<0,-22.498625,0> translate<4.228600,0.000000,30.066650> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.255747,0.000000,25.320350>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.440988,0.000000,25.225966>}
box{<0,0,-0.304800><0.207900,0.035000,0.304800> rotate<0,26.998111,0> translate<4.255747,0.000000,25.320350> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.255747,0.000000,27.579647>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.440988,0.000000,27.674031>}
box{<0,0,-0.304800><0.207900,0.035000,0.304800> rotate<0,-26.998111,0> translate<4.255747,0.000000,27.579647> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.440988,0.000000,25.225966>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.638709,0.000000,25.161722>}
box{<0,0,-0.304800><0.207897,0.035000,0.304800> rotate<0,17.998817,0> translate<4.440988,0.000000,25.225966> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.440988,0.000000,27.674031>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.638709,0.000000,27.738275>}
box{<0,0,-0.304800><0.207897,0.035000,0.304800> rotate<0,-17.998817,0> translate<4.440988,0.000000,27.674031> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.638709,0.000000,25.161722>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.844047,0.000000,25.129200>}
box{<0,0,-0.304800><0.207897,0.035000,0.304800> rotate<0,8.999300,0> translate<4.638709,0.000000,25.161722> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.638709,0.000000,27.738275>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.647791,0.000000,27.739713>}
box{<0,0,-0.304800><0.009194,0.035000,0.304800> rotate<0,-8.994306,0> translate<4.638709,0.000000,27.738275> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.695378,0.000000,6.130000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.724619,0.000000,6.130000>}
box{<0,0,-0.304800><2.029241,0.035000,0.304800> rotate<0,0.000000,0> translate<4.695378,0.000000,6.130000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.695378,0.000000,8.669997>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.724619,0.000000,8.669997>}
box{<0,0,-0.304800><2.029241,0.035000,0.304800> rotate<0,0.000000,0> translate<4.695378,0.000000,8.669997> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.695378,0.000000,8.670000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.724619,0.000000,8.670000>}
box{<0,0,-0.304800><2.029241,0.035000,0.304800> rotate<0,0.000000,0> translate<4.695378,0.000000,8.670000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.695378,0.000000,11.209997>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.724619,0.000000,11.209997>}
box{<0,0,-0.304800><2.029241,0.035000,0.304800> rotate<0,0.000000,0> translate<4.695378,0.000000,11.209997> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.695378,0.000000,11.210000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.724619,0.000000,11.210000>}
box{<0,0,-0.304800><2.029241,0.035000,0.304800> rotate<0,0.000000,0> translate<4.695378,0.000000,11.210000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.695378,0.000000,13.749997>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.724619,0.000000,13.749997>}
box{<0,0,-0.304800><2.029241,0.035000,0.304800> rotate<0,0.000000,0> translate<4.695378,0.000000,13.749997> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.695378,0.000000,16.290000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.724619,0.000000,16.290000>}
box{<0,0,-0.304800><2.029241,0.035000,0.304800> rotate<0,0.000000,0> translate<4.695378,0.000000,16.290000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.695378,0.000000,18.829997>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.724619,0.000000,18.829997>}
box{<0,0,-0.304800><2.029241,0.035000,0.304800> rotate<0,0.000000,0> translate<4.695378,0.000000,18.829997> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.695378,0.000000,18.830000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.724619,0.000000,18.830000>}
box{<0,0,-0.304800><2.029241,0.035000,0.304800> rotate<0,0.000000,0> translate<4.695378,0.000000,18.830000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.695378,0.000000,21.369997>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.724619,0.000000,21.369997>}
box{<0,0,-0.304800><2.029241,0.035000,0.304800> rotate<0,0.000000,0> translate<4.695378,0.000000,21.369997> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.695378,0.000000,21.370000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.724619,0.000000,21.370000>}
box{<0,0,-0.304800><2.029241,0.035000,0.304800> rotate<0,0.000000,0> translate<4.695378,0.000000,21.370000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.695378,0.000000,23.909997>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.724619,0.000000,23.909997>}
box{<0,0,-0.304800><2.029241,0.035000,0.304800> rotate<0,0.000000,0> translate<4.695378,0.000000,23.909997> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.695378,0.000000,30.259997>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.724619,0.000000,30.259997>}
box{<0,0,-0.304800><2.029241,0.035000,0.304800> rotate<0,0.000000,0> translate<4.695378,0.000000,30.259997> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.844047,0.000000,25.129200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.709981,0.000000,25.129197>}
box{<0,0,-0.304800><0.865934,0.035000,0.304800> rotate<0,0.000207,0> translate<4.844047,0.000000,25.129200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.709966,0.000000,26.450012>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.709966,0.000000,26.449981>}
box{<0,0,-0.304800><0.000031,0.035000,0.304800> rotate<0,-90.000000,0> translate<5.709966,0.000000,26.449981> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.709981,0.000000,25.129197>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.709981,0.000000,26.449966>}
box{<0,0,-0.304800><1.320769,0.035000,0.304800> rotate<0,90.000000,0> translate<5.709981,0.000000,26.449966> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.709981,0.000000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.710013,0.000000,25.603200>}
box{<0,0,-0.304800><0.000031,0.035000,0.304800> rotate<0,0.000000,0> translate<5.709981,0.000000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.709981,0.000000,26.212800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.710013,0.000000,26.212800>}
box{<0,0,-0.304800><0.000031,0.035000,0.304800> rotate<0,0.000000,0> translate<5.709981,0.000000,26.212800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.709981,0.000000,26.449966>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.710013,0.000000,26.449966>}
box{<0,0,-0.304800><0.000031,0.035000,0.304800> rotate<0,0.000000,0> translate<5.709981,0.000000,26.449966> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.710013,0.000000,25.129200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.575950,0.000000,25.129200>}
box{<0,0,-0.304800><0.865938,0.035000,0.304800> rotate<0,0.000000,0> translate<5.710013,0.000000,25.129200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.710013,0.000000,26.449966>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.710013,0.000000,25.129200>}
box{<0,0,-0.304800><1.320766,0.035000,0.304800> rotate<0,-90.000000,0> translate<5.710013,0.000000,25.129200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.710031,0.000000,26.449981>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.710031,0.000000,26.450012>}
box{<0,0,-0.304800><0.000031,0.035000,0.304800> rotate<0,90.000000,0> translate<5.710031,0.000000,26.450012> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.710031,0.000000,26.449981>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.792797,0.000000,26.449981>}
box{<0,0,-0.304800><2.082766,0.035000,0.304800> rotate<0,0.000000,0> translate<5.710031,0.000000,26.449981> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.710031,0.000000,26.450012>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.792794,0.000000,26.450012>}
box{<0,0,-0.304800><2.082763,0.035000,0.304800> rotate<0,0.000000,0> translate<5.710031,0.000000,26.450012> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.575950,0.000000,25.129200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.781288,0.000000,25.161722>}
box{<0,0,-0.304800><0.207897,0.035000,0.304800> rotate<0,-8.999300,0> translate<6.575950,0.000000,25.129200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.724619,0.000000,6.130000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.191397,0.000000,6.323347>}
box{<0,0,-0.304800><0.505237,0.035000,0.304800> rotate<0,-22.498625,0> translate<6.724619,0.000000,6.130000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.724619,0.000000,8.669997>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.191397,0.000000,8.476650>}
box{<0,0,-0.304800><0.505237,0.035000,0.304800> rotate<0,22.498625,0> translate<6.724619,0.000000,8.669997> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.724619,0.000000,8.670000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.191397,0.000000,8.863347>}
box{<0,0,-0.304800><0.505237,0.035000,0.304800> rotate<0,-22.498625,0> translate<6.724619,0.000000,8.670000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.724619,0.000000,11.209997>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.092025,0.000000,11.057809>}
box{<0,0,-0.304800><0.397679,0.035000,0.304800> rotate<0,22.498894,0> translate<6.724619,0.000000,11.209997> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.724619,0.000000,11.210000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.191397,0.000000,11.403347>}
box{<0,0,-0.304800><0.505237,0.035000,0.304800> rotate<0,-22.498625,0> translate<6.724619,0.000000,11.210000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.724619,0.000000,13.749997>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.191397,0.000000,13.556650>}
box{<0,0,-0.304800><0.505237,0.035000,0.304800> rotate<0,22.498625,0> translate<6.724619,0.000000,13.749997> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.724619,0.000000,16.290000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.191397,0.000000,16.483347>}
box{<0,0,-0.304800><0.505237,0.035000,0.304800> rotate<0,-22.498625,0> translate<6.724619,0.000000,16.290000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.724619,0.000000,18.829997>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.191397,0.000000,18.636650>}
box{<0,0,-0.304800><0.505237,0.035000,0.304800> rotate<0,22.498625,0> translate<6.724619,0.000000,18.829997> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.724619,0.000000,18.830000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.191397,0.000000,19.023347>}
box{<0,0,-0.304800><0.505237,0.035000,0.304800> rotate<0,-22.498625,0> translate<6.724619,0.000000,18.830000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.724619,0.000000,21.369997>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.191397,0.000000,21.176650>}
box{<0,0,-0.304800><0.505237,0.035000,0.304800> rotate<0,22.498625,0> translate<6.724619,0.000000,21.369997> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.724619,0.000000,21.370000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.191397,0.000000,21.563347>}
box{<0,0,-0.304800><0.505237,0.035000,0.304800> rotate<0,-22.498625,0> translate<6.724619,0.000000,21.370000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.724619,0.000000,23.909997>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.191397,0.000000,23.716650>}
box{<0,0,-0.304800><0.505237,0.035000,0.304800> rotate<0,22.498625,0> translate<6.724619,0.000000,23.909997> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.724619,0.000000,30.259997>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.191397,0.000000,30.066650>}
box{<0,0,-0.304800><0.505237,0.035000,0.304800> rotate<0,22.498625,0> translate<6.724619,0.000000,30.259997> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.772206,0.000000,27.739713>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.781288,0.000000,27.738275>}
box{<0,0,-0.304800><0.009194,0.035000,0.304800> rotate<0,8.994306,0> translate<6.772206,0.000000,27.739713> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.772206,0.000000,27.739713>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.191397,0.000000,27.913347>}
box{<0,0,-0.304800><0.453729,0.035000,0.304800> rotate<0,-22.498507,0> translate<6.772206,0.000000,27.739713> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.781288,0.000000,25.161722>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.979009,0.000000,25.225966>}
box{<0,0,-0.304800><0.207897,0.035000,0.304800> rotate<0,-17.998817,0> translate<6.781288,0.000000,25.161722> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.781288,0.000000,27.738275>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.979009,0.000000,27.674031>}
box{<0,0,-0.304800><0.207897,0.035000,0.304800> rotate<0,17.998817,0> translate<6.781288,0.000000,27.738275> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.806697,0.000000,21.336000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.714525,0.000000,21.336000>}
box{<0,0,-0.304800><2.907828,0.035000,0.304800> rotate<0,0.000000,0> translate<6.806697,0.000000,21.336000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.887816,0.000000,18.897600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.767284,0.000000,18.897600>}
box{<0,0,-0.304800><0.879469,0.035000,0.304800> rotate<0,0.000000,0> translate<6.887816,0.000000,18.897600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.979009,0.000000,25.225966>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.164250,0.000000,25.320350>}
box{<0,0,-0.304800><0.207900,0.035000,0.304800> rotate<0,-26.998111,0> translate<6.979009,0.000000,25.225966> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.979009,0.000000,27.674031>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.164250,0.000000,27.579647>}
box{<0,0,-0.304800><0.207900,0.035000,0.304800> rotate<0,26.998111,0> translate<6.979009,0.000000,27.674031> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.051978,0.000000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.461200,0.000000,8.534400>}
box{<0,0,-0.304800><1.409222,0.035000,0.304800> rotate<0,0.000000,0> translate<7.051978,0.000000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.051978,0.000000,23.774400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.476125,0.000000,23.774400>}
box{<0,0,-0.304800><4.424147,0.035000,0.304800> rotate<0,0.000000,0> translate<7.051978,0.000000,23.774400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.092025,0.000000,11.057809>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.647072,0.000000,11.612859>}
box{<0,0,-0.304800><0.784957,0.035000,0.304800> rotate<0,-44.997191,0> translate<7.092025,0.000000,11.057809> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.133100,0.000000,16.459200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.431200,0.000000,16.459200>}
box{<0,0,-0.304800><1.298100,0.035000,0.304800> rotate<0,0.000000,0> translate<7.133100,0.000000,16.459200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.164250,0.000000,25.320350>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.332441,0.000000,25.442550>}
box{<0,0,-0.304800><0.207896,0.035000,0.304800> rotate<0,-35.998150,0> translate<7.164250,0.000000,25.320350> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.164250,0.000000,27.579647>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.332441,0.000000,27.457447>}
box{<0,0,-0.304800><0.207896,0.035000,0.304800> rotate<0,35.998150,0> translate<7.164250,0.000000,27.579647> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.191397,0.000000,6.323347>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.548650,0.000000,6.680600>}
box{<0,0,-0.304800><0.505232,0.035000,0.304800> rotate<0,-44.997030,0> translate<7.191397,0.000000,6.323347> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.191397,0.000000,8.476650>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.548650,0.000000,8.119397>}
box{<0,0,-0.304800><0.505232,0.035000,0.304800> rotate<0,44.997030,0> translate<7.191397,0.000000,8.476650> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.191397,0.000000,8.863347>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.548650,0.000000,9.220600>}
box{<0,0,-0.304800><0.505232,0.035000,0.304800> rotate<0,-44.997030,0> translate<7.191397,0.000000,8.863347> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.191397,0.000000,11.403347>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.548650,0.000000,11.760600>}
box{<0,0,-0.304800><0.505232,0.035000,0.304800> rotate<0,-44.997030,0> translate<7.191397,0.000000,11.403347> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.191397,0.000000,13.556650>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.321128,0.000000,13.426916>}
box{<0,0,-0.304800><0.183470,0.035000,0.304800> rotate<0,44.997720,0> translate<7.191397,0.000000,13.556650> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.191397,0.000000,16.483347>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.495247,0.000000,16.787200>}
box{<0,0,-0.304800><0.429711,0.035000,0.304800> rotate<0,-44.997325,0> translate<7.191397,0.000000,16.483347> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.191397,0.000000,18.636650>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.339288,0.000000,18.488756>}
box{<0,0,-0.304800><0.209151,0.035000,0.304800> rotate<0,44.997635,0> translate<7.191397,0.000000,18.636650> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.191397,0.000000,19.023347>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.548650,0.000000,19.380600>}
box{<0,0,-0.304800><0.505232,0.035000,0.304800> rotate<0,-44.997030,0> translate<7.191397,0.000000,19.023347> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.191397,0.000000,21.176650>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.355250,0.000000,21.012797>}
box{<0,0,-0.304800><0.231723,0.035000,0.304800> rotate<0,44.997030,0> translate<7.191397,0.000000,21.176650> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.191397,0.000000,21.563347>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.515250,0.000000,21.887200>}
box{<0,0,-0.304800><0.457997,0.035000,0.304800> rotate<0,-44.997030,0> translate<7.191397,0.000000,21.563347> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.191397,0.000000,23.716650>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.395250,0.000000,23.512797>}
box{<0,0,-0.304800><0.288292,0.035000,0.304800> rotate<0,44.997030,0> translate<7.191397,0.000000,23.716650> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.191397,0.000000,27.913347>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.264288,0.000000,27.986241>}
box{<0,0,-0.304800><0.103085,0.035000,0.304800> rotate<0,-44.998258,0> translate<7.191397,0.000000,27.913347> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.191397,0.000000,30.066650>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.445250,0.000000,29.812797>}
box{<0,0,-0.304800><0.359003,0.035000,0.304800> rotate<0,44.997030,0> translate<7.191397,0.000000,30.066650> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.264288,0.000000,27.986241>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.339584,0.000000,22.910941>}
box{<0,0,-0.304800><7.177556,0.035000,0.304800> rotate<0,44.997048,0> translate<7.264288,0.000000,27.986241> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.321128,0.000000,13.426916>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.297072,0.000000,14.402859>}
box{<0,0,-0.304800><1.380193,0.035000,0.304800> rotate<0,-44.997030,0> translate<7.321128,0.000000,13.426916> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.332441,0.000000,25.442550>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.479447,0.000000,25.589556>}
box{<0,0,-0.304800><0.207898,0.035000,0.304800> rotate<0,-44.997030,0> translate<7.332441,0.000000,25.442550> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.332441,0.000000,27.457447>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.479447,0.000000,27.310441>}
box{<0,0,-0.304800><0.207898,0.035000,0.304800> rotate<0,44.997030,0> translate<7.332441,0.000000,27.457447> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.339288,0.000000,18.488756>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.734584,0.000000,18.884056>}
box{<0,0,-0.304800><0.559036,0.035000,0.304800> rotate<0,-44.997257,0> translate<7.339288,0.000000,18.488756> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.355250,0.000000,21.012797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.861675,0.000000,21.012797>}
box{<0,0,-0.304800><2.506425,0.035000,0.304800> rotate<0,0.000000,0> translate<7.355250,0.000000,21.012797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.357888,0.000000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.818525,0.000000,27.432000>}
box{<0,0,-0.304800><0.460637,0.035000,0.304800> rotate<0,0.000000,0> translate<7.357888,0.000000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.370450,0.000000,11.582400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.616616,0.000000,11.582400>}
box{<0,0,-0.304800><0.246166,0.035000,0.304800> rotate<0,0.000000,0> translate<7.370450,0.000000,11.582400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.387647,0.000000,29.870400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.047634,0.000000,29.870400>}
box{<0,0,-0.304800><5.659988,0.035000,0.304800> rotate<0,0.000000,0> translate<7.387647,0.000000,29.870400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.395250,0.000000,23.512797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.661675,0.000000,23.512797>}
box{<0,0,-0.304800><2.266425,0.035000,0.304800> rotate<0,0.000000,0> translate<7.395250,0.000000,23.512797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.445250,0.000000,29.812797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.561675,0.000000,29.812797>}
box{<0,0,-0.304800><0.116425,0.035000,0.304800> rotate<0,0.000000,0> translate<7.445250,0.000000,29.812797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.472050,0.000000,9.144000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.461200,0.000000,9.144000>}
box{<0,0,-0.304800><0.989150,0.035000,0.304800> rotate<0,0.000000,0> translate<7.472050,0.000000,9.144000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.479447,0.000000,25.589556>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.601647,0.000000,25.757747>}
box{<0,0,-0.304800><0.207896,0.035000,0.304800> rotate<0,-53.995910,0> translate<7.479447,0.000000,25.589556> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.479447,0.000000,27.310441>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.601647,0.000000,27.142250>}
box{<0,0,-0.304800><0.207896,0.035000,0.304800> rotate<0,53.995910,0> translate<7.479447,0.000000,27.310441> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.489359,0.000000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.647325,0.000000,25.603200>}
box{<0,0,-0.304800><2.157966,0.035000,0.304800> rotate<0,0.000000,0> translate<7.489359,0.000000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.495247,0.000000,16.787200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.761675,0.000000,16.787200>}
box{<0,0,-0.304800><0.266428,0.035000,0.304800> rotate<0,0.000000,0> translate<7.495247,0.000000,16.787200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.515250,0.000000,21.887200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.163325,0.000000,21.887200>}
box{<0,0,-0.304800><1.648075,0.035000,0.304800> rotate<0,0.000000,0> translate<7.515250,0.000000,21.887200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.548650,0.000000,6.680600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.552047,0.000000,6.688800>}
box{<0,0,-0.304800><0.008876,0.035000,0.304800> rotate<0,-67.493614,0> translate<7.548650,0.000000,6.680600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.548650,0.000000,8.119397>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.552047,0.000000,8.111197>}
box{<0,0,-0.304800><0.008876,0.035000,0.304800> rotate<0,67.493614,0> translate<7.548650,0.000000,8.119397> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.548650,0.000000,9.220600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.741997,0.000000,9.687378>}
box{<0,0,-0.304800><0.505237,0.035000,0.304800> rotate<0,-67.495436,0> translate<7.548650,0.000000,9.220600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.548650,0.000000,11.760600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.558378,0.000000,11.784091>}
box{<0,0,-0.304800><0.025425,0.035000,0.304800> rotate<0,-67.499731,0> translate<7.548650,0.000000,11.760600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.548650,0.000000,19.380600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.551381,0.000000,19.387200>}
box{<0,0,-0.304800><0.007143,0.035000,0.304800> rotate<0,-67.514512,0> translate<7.548650,0.000000,19.380600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.551381,0.000000,19.387200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.363325,0.000000,19.387200>}
box{<0,0,-0.304800><1.811944,0.035000,0.304800> rotate<0,0.000000,0> translate<7.551381,0.000000,19.387200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.552047,0.000000,6.688800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.741466,0.000000,6.688800>}
box{<0,0,-0.304800><3.189419,0.035000,0.304800> rotate<0,0.000000,0> translate<7.552047,0.000000,6.688800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.552047,0.000000,8.111197>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.506853,0.000000,8.111197>}
box{<0,0,-0.304800><0.954806,0.035000,0.304800> rotate<0,0.000000,0> translate<7.552047,0.000000,8.111197> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.558378,0.000000,11.784091>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.782859,0.000000,11.877072>}
box{<0,0,-0.304800><0.242976,0.035000,0.304800> rotate<0,-22.498095,0> translate<7.558378,0.000000,11.784091> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.561675,0.000000,29.812797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.860413,0.000000,29.689056>}
box{<0,0,-0.304800><0.323351,0.035000,0.304800> rotate<0,22.498433,0> translate<7.561675,0.000000,29.812797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.601647,0.000000,25.757747>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.696031,0.000000,25.942988>}
box{<0,0,-0.304800><0.207900,0.035000,0.304800> rotate<0,-62.995950,0> translate<7.601647,0.000000,25.757747> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.601647,0.000000,27.142250>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.696031,0.000000,26.957009>}
box{<0,0,-0.304800><0.207900,0.035000,0.304800> rotate<0,62.995950,0> translate<7.601647,0.000000,27.142250> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.647072,0.000000,11.612859>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.847138,0.000000,11.812925>}
box{<0,0,-0.304800><0.282936,0.035000,0.304800> rotate<0,-44.997030,0> translate<7.647072,0.000000,11.612859> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.696031,0.000000,25.942988>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.760275,0.000000,26.140709>}
box{<0,0,-0.304800><0.207897,0.035000,0.304800> rotate<0,-71.995243,0> translate<7.696031,0.000000,25.942988> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.696031,0.000000,26.957009>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.760275,0.000000,26.759288>}
box{<0,0,-0.304800><0.207897,0.035000,0.304800> rotate<0,71.995243,0> translate<7.696031,0.000000,26.957009> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.734584,0.000000,18.884056>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.033322,0.000000,19.007797>}
box{<0,0,-0.304800><0.323351,0.035000,0.304800> rotate<0,-22.498433,0> translate<7.734584,0.000000,18.884056> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.739769,0.000000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.428125,0.000000,26.822400>}
box{<0,0,-0.304800><0.688356,0.035000,0.304800> rotate<0,0.000000,0> translate<7.739769,0.000000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.741997,0.000000,9.687378>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.741997,0.000000,9.696209>}
box{<0,0,-0.304800><0.008831,0.035000,0.304800> rotate<0,90.000000,0> translate<7.741997,0.000000,9.696209> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.741997,0.000000,9.696209>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.512000,0.000000,10.466216>}
box{<0,0,-0.304800><1.088951,0.035000,0.304800> rotate<0,-44.997146,0> translate<7.741997,0.000000,9.696209> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.760275,0.000000,26.140709>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.792797,0.000000,26.346047>}
box{<0,0,-0.304800><0.207897,0.035000,0.304800> rotate<0,-80.994760,0> translate<7.760275,0.000000,26.140709> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.760275,0.000000,26.759288>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.792797,0.000000,26.553950>}
box{<0,0,-0.304800><0.207897,0.035000,0.304800> rotate<0,80.994760,0> translate<7.760275,0.000000,26.759288> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.761675,0.000000,16.787200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.060412,0.000000,16.910941>}
box{<0,0,-0.304800><0.323351,0.035000,0.304800> rotate<0,-22.498433,0> translate<7.761675,0.000000,16.787200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.771691,0.000000,26.212800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.037725,0.000000,26.212800>}
box{<0,0,-0.304800><1.266034,0.035000,0.304800> rotate<0,0.000000,0> translate<7.771691,0.000000,26.212800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.782859,0.000000,11.877072>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.817787,0.000000,12.912000>}
box{<0,0,-0.304800><1.463609,0.035000,0.304800> rotate<0,-44.997030,0> translate<7.782859,0.000000,11.877072> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.792794,0.000000,26.450012>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.792797,0.000000,26.553950>}
box{<0,0,-0.304800><0.103938,0.035000,0.304800> rotate<0,-89.992338,0> translate<7.792794,0.000000,26.450012> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.792797,0.000000,26.346047>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.792797,0.000000,26.449981>}
box{<0,0,-0.304800><0.103934,0.035000,0.304800> rotate<0,90.000000,0> translate<7.792797,0.000000,26.449981> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.799384,0.000000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.471928,0.000000,9.753600>}
box{<0,0,-0.304800><0.672544,0.035000,0.304800> rotate<0,0.000000,0> translate<7.799384,0.000000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.847138,0.000000,11.812925>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.108531,0.000000,11.921197>}
box{<0,0,-0.304800><0.282930,0.035000,0.304800> rotate<0,-22.498335,0> translate<7.847138,0.000000,11.812925> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.860413,0.000000,29.689056>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.089056,0.000000,29.460413>}
box{<0,0,-0.304800><0.323351,0.035000,0.304800> rotate<0,44.997030,0> translate<7.860413,0.000000,29.689056> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.033322,0.000000,19.007797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.742731,0.000000,19.007797>}
box{<0,0,-0.304800><1.709409,0.035000,0.304800> rotate<0,0.000000,0> translate<8.033322,0.000000,19.007797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.060412,0.000000,16.910941>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.289056,0.000000,17.139584>}
box{<0,0,-0.304800><0.323351,0.035000,0.304800> rotate<0,-44.997030,0> translate<8.060412,0.000000,16.910941> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.089056,0.000000,29.460413>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.136672,0.000000,24.412797>}
box{<0,0,-0.304800><7.138406,0.035000,0.304800> rotate<0,44.997030,0> translate<8.089056,0.000000,29.460413> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.097788,0.000000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.886216,0.000000,12.192000>}
box{<0,0,-0.304800><1.788428,0.035000,0.304800> rotate<0,0.000000,0> translate<8.097788,0.000000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.108531,0.000000,11.921197>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.682781,0.000000,11.921197>}
box{<0,0,-0.304800><0.574250,0.035000,0.304800> rotate<0,0.000000,0> translate<8.108531,0.000000,11.921197> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.218272,0.000000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.649747,0.000000,17.068800>}
box{<0,0,-0.304800><0.431475,0.035000,0.304800> rotate<0,0.000000,0> translate<8.218272,0.000000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.288669,0.000000,29.260800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.979997,0.000000,29.260800>}
box{<0,0,-0.304800><4.691328,0.035000,0.304800> rotate<0,0.000000,0> translate<8.288669,0.000000,29.260800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.289056,0.000000,17.139584>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.531672,0.000000,17.382200>}
box{<0,0,-0.304800><0.343110,0.035000,0.304800> rotate<0,-44.997030,0> translate<8.289056,0.000000,17.139584> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.297072,0.000000,14.402859>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.482000,0.000000,14.587788>}
box{<0,0,-0.304800><0.261528,0.035000,0.304800> rotate<0,-44.997030,0> translate<8.297072,0.000000,14.402859> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.408984,0.000000,10.363200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.512000,0.000000,10.363200>}
box{<0,0,-0.304800><0.103016,0.035000,0.304800> rotate<0,0.000000,0> translate<8.408984,0.000000,10.363200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.431197,0.000000,15.990200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.431200,0.000000,16.693566>}
box{<0,0,-0.304800><0.703366,0.035000,0.304800> rotate<0,-89.993806,0> translate<8.431197,0.000000,15.990200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.431197,0.000000,15.990200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.769778,0.000000,15.990200>}
box{<0,0,-0.304800><1.338581,0.035000,0.304800> rotate<0,0.000000,0> translate<8.431197,0.000000,15.990200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.431200,0.000000,15.246431>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.469281,0.000000,15.104309>}
box{<0,0,-0.304800><0.147135,0.035000,0.304800> rotate<0,74.995122,0> translate<8.431200,0.000000,15.246431> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.431200,0.000000,15.949794>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.431200,0.000000,15.246431>}
box{<0,0,-0.304800><0.703363,0.035000,0.304800> rotate<0,-90.000000,0> translate<8.431200,0.000000,15.246431> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.431200,0.000000,15.949794>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.769778,0.000000,15.949794>}
box{<0,0,-0.304800><1.338578,0.035000,0.304800> rotate<0,0.000000,0> translate<8.431200,0.000000,15.949794> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.431200,0.000000,16.693566>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.469281,0.000000,16.835688>}
box{<0,0,-0.304800><0.147135,0.035000,0.304800> rotate<0,-74.995122,0> translate<8.431200,0.000000,16.693566> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.461197,0.000000,9.010200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.461200,0.000000,9.713566>}
box{<0,0,-0.304800><0.703366,0.035000,0.304800> rotate<0,-89.993806,0> translate<8.461197,0.000000,9.010200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.461197,0.000000,9.010200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.799778,0.000000,9.010200>}
box{<0,0,-0.304800><1.338581,0.035000,0.304800> rotate<0,0.000000,0> translate<8.461197,0.000000,9.010200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.461200,0.000000,8.266431>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.499281,0.000000,8.124309>}
box{<0,0,-0.304800><0.147135,0.035000,0.304800> rotate<0,74.995122,0> translate<8.461200,0.000000,8.266431> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.461200,0.000000,8.969794>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.461200,0.000000,8.266431>}
box{<0,0,-0.304800><0.703363,0.035000,0.304800> rotate<0,-90.000000,0> translate<8.461200,0.000000,8.266431> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.461200,0.000000,8.969794>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.799778,0.000000,8.969794>}
box{<0,0,-0.304800><1.338578,0.035000,0.304800> rotate<0,0.000000,0> translate<8.461200,0.000000,8.969794> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.461200,0.000000,9.713566>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.499281,0.000000,9.855688>}
box{<0,0,-0.304800><0.147135,0.035000,0.304800> rotate<0,-74.995122,0> translate<8.461200,0.000000,9.713566> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.469281,0.000000,15.104309>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.537584,0.000000,14.986003>}
box{<0,0,-0.304800><0.136608,0.035000,0.304800> rotate<0,59.996411,0> translate<8.469281,0.000000,15.104309> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.469281,0.000000,16.835688>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.542847,0.000000,16.963109>}
box{<0,0,-0.304800><0.147133,0.035000,0.304800> rotate<0,-59.996522,0> translate<8.469281,0.000000,16.835688> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.482000,0.000000,14.930419>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.482000,0.000000,14.587788>}
box{<0,0,-0.304800><0.342631,0.035000,0.304800> rotate<0,-90.000000,0> translate<8.482000,0.000000,14.587788> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.482000,0.000000,14.930419>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.537584,0.000000,14.986003>}
box{<0,0,-0.304800><0.078608,0.035000,0.304800> rotate<0,-44.997030,0> translate<8.482000,0.000000,14.930419> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.499281,0.000000,8.124309>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.506853,0.000000,8.111197>}
box{<0,0,-0.304800><0.015142,0.035000,0.304800> rotate<0,59.991552,0> translate<8.499281,0.000000,8.124309> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.499281,0.000000,9.855688>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.567588,0.000000,9.973994>}
box{<0,0,-0.304800><0.136609,0.035000,0.304800> rotate<0,-59.995276,0> translate<8.499281,0.000000,9.855688> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.512000,0.000000,10.029578>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.567588,0.000000,9.973994>}
box{<0,0,-0.304800><0.078610,0.035000,0.304800> rotate<0,44.995420,0> translate<8.512000,0.000000,10.029578> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.512000,0.000000,10.466216>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.512000,0.000000,10.029578>}
box{<0,0,-0.304800><0.436637,0.035000,0.304800> rotate<0,-90.000000,0> translate<8.512000,0.000000,10.029578> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.531672,0.000000,17.382200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.276416,0.000000,17.382200>}
box{<0,0,-0.304800><4.744744,0.035000,0.304800> rotate<0,0.000000,0> translate<8.531672,0.000000,17.382200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.542847,0.000000,16.963109>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.646888,0.000000,17.067150>}
box{<0,0,-0.304800><0.147136,0.035000,0.304800> rotate<0,-44.997030,0> translate<8.542847,0.000000,16.963109> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.646888,0.000000,17.067150>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.774309,0.000000,17.140716>}
box{<0,0,-0.304800><0.147133,0.035000,0.304800> rotate<0,-29.997538,0> translate<8.646888,0.000000,17.067150> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.682781,0.000000,11.921197>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.809578,0.000000,12.047997>}
box{<0,0,-0.304800><0.179320,0.035000,0.304800> rotate<0,-44.997736,0> translate<8.682781,0.000000,11.921197> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.707388,0.000000,12.801600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.495816,0.000000,12.801600>}
box{<0,0,-0.304800><1.788428,0.035000,0.304800> rotate<0,0.000000,0> translate<8.707388,0.000000,12.801600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.774309,0.000000,17.140716>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.916431,0.000000,17.178797>}
box{<0,0,-0.304800><0.147135,0.035000,0.304800> rotate<0,-14.998938,0> translate<8.774309,0.000000,17.140716> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.809578,0.000000,12.047997>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.742209,0.000000,12.047997>}
box{<0,0,-0.304800><0.932631,0.035000,0.304800> rotate<0,0.000000,0> translate<8.809578,0.000000,12.047997> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.817787,0.000000,12.912000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.606216,0.000000,12.912000>}
box{<0,0,-0.304800><1.788428,0.035000,0.304800> rotate<0,0.000000,0> translate<8.817787,0.000000,12.912000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.898269,0.000000,28.651200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.979997,0.000000,28.651200>}
box{<0,0,-0.304800><4.081728,0.035000,0.304800> rotate<0,0.000000,0> translate<8.898269,0.000000,28.651200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.916431,0.000000,17.178797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.769794,0.000000,17.178794>}
box{<0,0,-0.304800><0.853363,0.035000,0.304800> rotate<0,0.000210,0> translate<8.916431,0.000000,17.178797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.163325,0.000000,21.887200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.772731,0.000000,20.277797>}
box{<0,0,-0.304800><2.276042,0.035000,0.304800> rotate<0,44.996975,0> translate<9.163325,0.000000,21.887200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.363325,0.000000,19.387200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.742731,0.000000,19.007797>}
box{<0,0,-0.304800><0.536559,0.035000,0.304800> rotate<0,44.996794,0> translate<9.363325,0.000000,19.387200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.507869,0.000000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.074772,0.000000,28.041600>}
box{<0,0,-0.304800><3.566903,0.035000,0.304800> rotate<0,0.000000,0> translate<9.507869,0.000000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.661675,0.000000,23.512797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.960413,0.000000,23.389056>}
box{<0,0,-0.304800><0.323351,0.035000,0.304800> rotate<0,22.498433,0> translate<9.661675,0.000000,23.512797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.742209,0.000000,12.047997>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.606216,0.000000,12.912000>}
box{<0,0,-0.304800><1.221887,0.035000,0.304800> rotate<0,-44.996927,0> translate<9.742209,0.000000,12.047997> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.753766,0.000000,31.679200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.892116,0.000000,31.670378>}
box{<0,0,-0.304800><4.138359,0.035000,0.304800> rotate<0,0.122131,0> translate<9.753766,0.000000,31.679200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.769778,0.000000,15.990200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.769778,0.000000,15.949794>}
box{<0,0,-0.304800><0.040406,0.035000,0.304800> rotate<0,-90.000000,0> translate<9.769778,0.000000,15.949794> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.769794,0.000000,15.990219>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.769794,0.000000,17.178794>}
box{<0,0,-0.304800><1.188575,0.035000,0.304800> rotate<0,90.000000,0> translate<9.769794,0.000000,17.178794> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.769794,0.000000,15.990219>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.810200,0.000000,15.990219>}
box{<0,0,-0.304800><0.040406,0.035000,0.304800> rotate<0,0.000000,0> translate<9.769794,0.000000,15.990219> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.769794,0.000000,16.459200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.810200,0.000000,16.459200>}
box{<0,0,-0.304800><0.040406,0.035000,0.304800> rotate<0,0.000000,0> translate<9.769794,0.000000,16.459200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.769794,0.000000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.810200,0.000000,17.068800>}
box{<0,0,-0.304800><0.040406,0.035000,0.304800> rotate<0,0.000000,0> translate<9.769794,0.000000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.799778,0.000000,9.010200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.799778,0.000000,8.969794>}
box{<0,0,-0.304800><0.040406,0.035000,0.304800> rotate<0,-90.000000,0> translate<9.799778,0.000000,8.969794> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.810200,0.000000,17.178797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.810200,0.000000,15.990219>}
box{<0,0,-0.304800><1.188578,0.035000,0.304800> rotate<0,-90.000000,0> translate<9.810200,0.000000,15.990219> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.810200,0.000000,17.178797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.663566,0.000000,17.178797>}
box{<0,0,-0.304800><0.853366,0.035000,0.304800> rotate<0,0.000000,0> translate<9.810200,0.000000,17.178797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.810219,0.000000,15.949794>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.810219,0.000000,15.990200>}
box{<0,0,-0.304800><0.040406,0.035000,0.304800> rotate<0,90.000000,0> translate<9.810219,0.000000,15.990200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.810219,0.000000,15.949794>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.148797,0.000000,15.949794>}
box{<0,0,-0.304800><1.338578,0.035000,0.304800> rotate<0,0.000000,0> translate<9.810219,0.000000,15.949794> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.810219,0.000000,15.990200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.148794,0.000000,15.990200>}
box{<0,0,-0.304800><1.338575,0.035000,0.304800> rotate<0,0.000000,0> translate<9.810219,0.000000,15.990200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.861675,0.000000,21.012797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.160412,0.000000,20.889056>}
box{<0,0,-0.304800><0.323351,0.035000,0.304800> rotate<0,22.498433,0> translate<9.861675,0.000000,21.012797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.960413,0.000000,23.389056>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.189056,0.000000,23.160412>}
box{<0,0,-0.304800><0.323351,0.035000,0.304800> rotate<0,44.997030,0> translate<9.960413,0.000000,23.389056> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.117469,0.000000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.262809,0.000000,27.432000>}
box{<0,0,-0.304800><3.145341,0.035000,0.304800> rotate<0,0.000000,0> translate<10.117469,0.000000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.160412,0.000000,20.889056>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.389056,0.000000,20.660412>}
box{<0,0,-0.304800><0.323351,0.035000,0.304800> rotate<0,44.997030,0> translate<10.160412,0.000000,20.889056> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.184669,0.000000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.085725,0.000000,23.164800>}
box{<0,0,-0.304800><1.901056,0.035000,0.304800> rotate<0,0.000000,0> translate<10.184669,0.000000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.189056,0.000000,23.160412>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.801672,0.000000,21.547797>}
box{<0,0,-0.304800><2.280583,0.035000,0.304800> rotate<0,44.997030,0> translate<10.189056,0.000000,23.160412> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.323069,0.000000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.324125,0.000000,20.726400>}
box{<0,0,-0.304800><0.001056,0.035000,0.304800> rotate<0,0.000000,0> translate<10.323069,0.000000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.389056,0.000000,20.660412>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.771672,0.000000,20.277797>}
box{<0,0,-0.304800><0.541100,0.035000,0.304800> rotate<0,44.997030,0> translate<10.389056,0.000000,20.660412> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.663566,0.000000,17.178797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.805688,0.000000,17.140716>}
box{<0,0,-0.304800><0.147135,0.035000,0.304800> rotate<0,14.998938,0> translate<10.663566,0.000000,17.178797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.727069,0.000000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.556141,0.000000,26.822400>}
box{<0,0,-0.304800><2.829072,0.035000,0.304800> rotate<0,0.000000,0> translate<10.727069,0.000000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.741466,0.000000,6.688800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.002859,0.000000,6.797072>}
box{<0,0,-0.304800><0.282930,0.035000,0.304800> rotate<0,-22.498335,0> translate<10.741466,0.000000,6.688800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.771672,0.000000,20.277797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.772731,0.000000,20.277797>}
box{<0,0,-0.304800><0.001059,0.035000,0.304800> rotate<0,0.000000,0> translate<10.771672,0.000000,20.277797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.782022,0.000000,6.705600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.343416,0.000000,6.705600>}
box{<0,0,-0.304800><10.561394,0.035000,0.304800> rotate<0,0.000000,0> translate<10.782022,0.000000,6.705600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.794269,0.000000,22.555200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.895325,0.000000,22.555200>}
box{<0,0,-0.304800><13.101056,0.035000,0.304800> rotate<0,0.000000,0> translate<10.794269,0.000000,22.555200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.805688,0.000000,17.140716>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.933109,0.000000,17.067150>}
box{<0,0,-0.304800><0.147133,0.035000,0.304800> rotate<0,29.997538,0> translate<10.805688,0.000000,17.140716> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.930253,0.000000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.963016,0.000000,17.068800>}
box{<0,0,-0.304800><2.032763,0.035000,0.304800> rotate<0,0.000000,0> translate<10.930253,0.000000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.933109,0.000000,17.067150>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.037150,0.000000,16.963109>}
box{<0,0,-0.304800><0.147136,0.035000,0.304800> rotate<0,44.997030,0> translate<10.933109,0.000000,17.067150> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.002859,0.000000,6.797072>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.202925,0.000000,6.997138>}
box{<0,0,-0.304800><0.282936,0.035000,0.304800> rotate<0,-44.997030,0> translate<11.002859,0.000000,6.797072> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.037150,0.000000,16.963109>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.110716,0.000000,16.835688>}
box{<0,0,-0.304800><0.147133,0.035000,0.304800> rotate<0,59.996522,0> translate<11.037150,0.000000,16.963109> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.110716,0.000000,16.835688>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.148797,0.000000,16.693566>}
box{<0,0,-0.304800><0.147135,0.035000,0.304800> rotate<0,74.995122,0> translate<11.110716,0.000000,16.835688> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.148794,0.000000,15.990200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.148797,0.000000,16.693566>}
box{<0,0,-0.304800><0.703366,0.035000,0.304800> rotate<0,-89.993806,0> translate<11.148794,0.000000,15.990200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.148794,0.000000,16.459200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.353416,0.000000,16.459200>}
box{<0,0,-0.304800><1.204622,0.035000,0.304800> rotate<0,0.000000,0> translate<11.148794,0.000000,16.459200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.148797,0.000000,15.254581>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.148797,0.000000,15.949794>}
box{<0,0,-0.304800><0.695213,0.035000,0.304800> rotate<0,90.000000,0> translate<11.148797,0.000000,15.949794> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.148797,0.000000,15.254581>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.276416,0.000000,17.382200>}
box{<0,0,-0.304800><3.008907,0.035000,0.304800> rotate<0,-44.997030,0> translate<11.148797,0.000000,15.254581> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.148797,0.000000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.743816,0.000000,15.849600>}
box{<0,0,-0.304800><0.595019,0.035000,0.304800> rotate<0,0.000000,0> translate<11.148797,0.000000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.202925,0.000000,6.997138>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.202925,0.000000,6.997141>}
box{<0,0,-0.304800><0.000003,0.035000,0.304800> rotate<0,90.000000,0> translate<11.202925,0.000000,6.997141> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.202925,0.000000,6.997141>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.002925,0.000000,7.797138>}
box{<0,0,-0.304800><1.131369,0.035000,0.304800> rotate<0,-44.996918,0> translate<11.202925,0.000000,6.997141> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.336669,0.000000,26.212800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.971759,0.000000,26.212800>}
box{<0,0,-0.304800><2.635091,0.035000,0.304800> rotate<0,0.000000,0> translate<11.336669,0.000000,26.212800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.403869,0.000000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.187200,0.000000,21.945600>}
box{<0,0,-0.304800><12.783331,0.035000,0.304800> rotate<0,0.000000,0> translate<11.403869,0.000000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.520984,0.000000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.759034,0.000000,7.315200>}
box{<0,0,-0.304800><10.238050,0.035000,0.304800> rotate<0,0.000000,0> translate<11.520984,0.000000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.801672,0.000000,21.547797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.654778,0.000000,21.547797>}
box{<0,0,-0.304800><3.853106,0.035000,0.304800> rotate<0,0.000000,0> translate<11.801672,0.000000,21.547797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.946269,0.000000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.630700,0.000000,25.603200>}
box{<0,0,-0.304800><2.684431,0.035000,0.304800> rotate<0,0.000000,0> translate<11.946269,0.000000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.988831,0.000000,3.718800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.446031,0.000000,3.261600>}
box{<0,0,-0.304800><0.646578,0.035000,0.304800> rotate<0,44.997030,0> translate<11.988831,0.000000,3.718800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.988831,0.000000,5.141197>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.446031,0.000000,5.598397>}
box{<0,0,-0.304800><0.646578,0.035000,0.304800> rotate<0,-44.997030,0> translate<11.988831,0.000000,5.141197> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.002925,0.000000,7.797138>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.111197,0.000000,8.058531>}
box{<0,0,-0.304800><0.282930,0.035000,0.304800> rotate<0,-67.495725,0> translate<12.002925,0.000000,7.797138> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.055803,0.000000,7.924800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.491212,0.000000,7.924800>}
box{<0,0,-0.304800><10.435409,0.035000,0.304800> rotate<0,0.000000,0> translate<12.055803,0.000000,7.924800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.111197,0.000000,8.058531>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.111197,0.000000,10.225409>}
box{<0,0,-0.304800><2.166878,0.035000,0.304800> rotate<0,90.000000,0> translate<12.111197,0.000000,10.225409> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.111197,0.000000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.709703,0.000000,8.534400>}
box{<0,0,-0.304800><11.598506,0.035000,0.304800> rotate<0,0.000000,0> translate<12.111197,0.000000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.111197,0.000000,9.144000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.076200,0.000000,9.144000>}
box{<0,0,-0.304800><14.965003,0.035000,0.304800> rotate<0,0.000000,0> translate<12.111197,0.000000,9.144000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.111197,0.000000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.034584,0.000000,9.753600>}
box{<0,0,-0.304800><2.923388,0.035000,0.304800> rotate<0,0.000000,0> translate<12.111197,0.000000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.111197,0.000000,10.225409>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.767384,0.000000,10.881600>}
box{<0,0,-0.304800><0.927991,0.035000,0.304800> rotate<0,-44.997167,0> translate<12.111197,0.000000,10.225409> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.248984,0.000000,10.363200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.287325,0.000000,10.363200>}
box{<0,0,-0.304800><2.038341,0.035000,0.304800> rotate<0,0.000000,0> translate<12.248984,0.000000,10.363200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.339584,0.000000,22.910941>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.638322,0.000000,22.787200>}
box{<0,0,-0.304800><0.323351,0.035000,0.304800> rotate<0,22.498433,0> translate<12.339584,0.000000,22.910941> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.446031,0.000000,3.261600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.413966,0.000000,3.261600>}
box{<0,0,-0.304800><0.967934,0.035000,0.304800> rotate<0,0.000000,0> translate<12.446031,0.000000,3.261600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.446031,0.000000,5.598397>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.413966,0.000000,5.598397>}
box{<0,0,-0.304800><0.967934,0.035000,0.304800> rotate<0,0.000000,0> translate<12.446031,0.000000,5.598397> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.555869,0.000000,24.993600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.683553,0.000000,24.993600>}
box{<0,0,-0.304800><3.127684,0.035000,0.304800> rotate<0,0.000000,0> translate<12.555869,0.000000,24.993600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.638322,0.000000,22.787200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.663325,0.000000,22.787200>}
box{<0,0,-0.304800><11.025003,0.035000,0.304800> rotate<0,0.000000,0> translate<12.638322,0.000000,22.787200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.767384,0.000000,10.881600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.413966,0.000000,10.881600>}
box{<0,0,-0.304800><0.646581,0.035000,0.304800> rotate<0,0.000000,0> translate<12.767384,0.000000,10.881600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.979997,0.000000,28.348863>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.363847,0.000000,27.104450>}
box{<0,0,-0.304800><1.302269,0.035000,0.304800> rotate<0,72.852352,0> translate<12.979997,0.000000,28.348863> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.979997,0.000000,29.651134>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.979997,0.000000,28.348863>}
box{<0,0,-0.304800><1.302272,0.035000,0.304800> rotate<0,-90.000000,0> translate<12.979997,0.000000,28.348863> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.979997,0.000000,29.651134>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.363847,0.000000,30.895547>}
box{<0,0,-0.304800><1.302269,0.035000,0.304800> rotate<0,-72.852352,0> translate<12.979997,0.000000,29.651134> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.136672,0.000000,24.412797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.161675,0.000000,24.412797>}
box{<0,0,-0.304800><11.025003,0.035000,0.304800> rotate<0,0.000000,0> translate<13.136672,0.000000,24.412797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.363847,0.000000,27.104447>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.097441,0.000000,26.028462>}
box{<0,0,-0.304800><1.302268,0.035000,0.304800> rotate<0,55.710608,0> translate<13.363847,0.000000,27.104447> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.363847,0.000000,27.104450>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.363847,0.000000,27.104447>}
box{<0,0,-0.304800><0.000003,0.035000,0.304800> rotate<0,-90.000000,0> translate<13.363847,0.000000,27.104447> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.363847,0.000000,30.895550>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.363847,0.000000,30.895547>}
box{<0,0,-0.304800><0.000003,0.035000,0.304800> rotate<0,-90.000000,0> translate<13.363847,0.000000,30.895547> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.363847,0.000000,30.895550>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.892116,0.000000,31.670378>}
box{<0,0,-0.304800><0.937777,0.035000,0.304800> rotate<0,-55.710615,0> translate<13.363847,0.000000,30.895550> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.413966,0.000000,3.261600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.098397,0.000000,3.946031>}
box{<0,0,-0.304800><0.967932,0.035000,0.304800> rotate<0,-44.997030,0> translate<13.413966,0.000000,3.261600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.413966,0.000000,5.598397>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.098397,0.000000,4.913966>}
box{<0,0,-0.304800><0.967932,0.035000,0.304800> rotate<0,44.997030,0> translate<13.413966,0.000000,5.598397> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.413966,0.000000,10.881600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.887200,0.000000,11.354838>}
box{<0,0,-0.304800><0.669257,0.035000,0.304800> rotate<0,-44.997219,0> translate<13.413966,0.000000,10.881600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.505163,0.000000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.887200,0.000000,10.972800>}
box{<0,0,-0.304800><0.382037,0.035000,0.304800> rotate<0,0.000000,0> translate<13.505163,0.000000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.525963,0.000000,5.486400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.814259,0.000000,5.486400>}
box{<0,0,-0.304800><7.288297,0.035000,0.304800> rotate<0,0.000000,0> translate<13.525963,0.000000,5.486400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.809966,0.000000,3.657600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.708147,0.000000,3.657600>}
box{<0,0,-0.304800><6.898181,0.035000,0.304800> rotate<0,0.000000,0> translate<13.809966,0.000000,3.657600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.887200,0.000000,10.938322>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.010941,0.000000,10.639584>}
box{<0,0,-0.304800><0.323351,0.035000,0.304800> rotate<0,67.495627,0> translate<13.887200,0.000000,10.938322> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.887200,0.000000,11.354838>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.887200,0.000000,10.938322>}
box{<0,0,-0.304800><0.416516,0.035000,0.304800> rotate<0,-90.000000,0> translate<13.887200,0.000000,10.938322> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.010941,0.000000,10.639584>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.239584,0.000000,10.410941>}
box{<0,0,-0.304800><0.323351,0.035000,0.304800> rotate<0,44.997030,0> translate<14.010941,0.000000,10.639584> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.097441,0.000000,26.028459>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.097444,0.000000,26.028459>}
box{<0,0,-0.304800><0.000003,0.035000,0.304800> rotate<0,0.000000,0> translate<14.097441,0.000000,26.028459> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.097441,0.000000,26.028462>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.097441,0.000000,26.028459>}
box{<0,0,-0.304800><0.000003,0.035000,0.304800> rotate<0,-90.000000,0> translate<14.097441,0.000000,26.028459> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.097444,0.000000,26.028459>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.115597,0.000000,25.216506>}
box{<0,0,-0.304800><1.302269,0.035000,0.304800> rotate<0,38.568990,0> translate<14.097444,0.000000,26.028459> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.098397,0.000000,3.946031>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.098397,0.000000,4.913966>}
box{<0,0,-0.304800><0.967934,0.035000,0.304800> rotate<0,90.000000,0> translate<14.098397,0.000000,4.913966> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.098397,0.000000,4.267200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.679997,0.000000,4.267200>}
box{<0,0,-0.304800><6.581600,0.035000,0.304800> rotate<0,0.000000,0> translate<14.098397,0.000000,4.267200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.098397,0.000000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.679997,0.000000,4.876800>}
box{<0,0,-0.304800><6.581600,0.035000,0.304800> rotate<0,0.000000,0> translate<14.098397,0.000000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.239584,0.000000,10.410941>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.799584,0.000000,9.850941>}
box{<0,0,-0.304800><0.791960,0.035000,0.304800> rotate<0,44.997030,0> translate<14.239584,0.000000,10.410941> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.799584,0.000000,9.850941>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.098322,0.000000,9.727200>}
box{<0,0,-0.304800><0.323351,0.035000,0.304800> rotate<0,22.498433,0> translate<14.799584,0.000000,9.850941> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.098322,0.000000,9.727200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.098613,0.000000,9.727200>}
box{<0,0,-0.304800><12.000291,0.035000,0.304800> rotate<0,0.000000,0> translate<15.098322,0.000000,9.727200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.115597,0.000000,25.216506>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.115600,0.000000,25.216506>}
box{<0,0,-0.304800><0.000003,0.035000,0.304800> rotate<0,0.000000,0> translate<15.115597,0.000000,25.216506> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.115600,0.000000,25.216506>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.327847,0.000000,24.740734>}
box{<0,0,-0.304800><1.302268,0.035000,0.304800> rotate<0,21.427159,0> translate<15.115600,0.000000,25.216506> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.654778,0.000000,21.547797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.680178,0.000000,21.573197>}
box{<0,0,-0.304800><0.035921,0.035000,0.304800> rotate<0,-44.997030,0> translate<15.654778,0.000000,21.547797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.680178,0.000000,21.573197>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.133019,0.000000,21.573197>}
box{<0,0,-0.304800><2.452841,0.035000,0.304800> rotate<0,0.000000,0> translate<15.680178,0.000000,21.573197> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.327847,0.000000,24.740734>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.327850,0.000000,24.740734>}
box{<0,0,-0.304800><0.000003,0.035000,0.304800> rotate<0,0.000000,0> translate<16.327847,0.000000,24.740734> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.327850,0.000000,24.740734>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.626478,0.000000,24.643416>}
box{<0,0,-0.304800><1.302270,0.035000,0.304800> rotate<0,4.285433,0> translate<16.327850,0.000000,24.740734> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.906631,0.000000,11.844981>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.906631,0.000000,11.845013>}
box{<0,0,-0.304800><0.000031,0.035000,0.304800> rotate<0,90.000000,0> translate<16.906631,0.000000,11.845013> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.906631,0.000000,11.844981>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.481397,0.000000,11.844981>}
box{<0,0,-0.304800><1.574766,0.035000,0.304800> rotate<0,0.000000,0> translate<16.906631,0.000000,11.844981> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.906631,0.000000,11.845013>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.481397,0.000000,11.845013>}
box{<0,0,-0.304800><1.574766,0.035000,0.304800> rotate<0,0.000000,0> translate<16.906631,0.000000,11.845013> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.626478,0.000000,24.643416>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.626481,0.000000,24.643416>}
box{<0,0,-0.304800><0.000003,0.035000,0.304800> rotate<0,0.000000,0> translate<17.626478,0.000000,24.643416> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.626481,0.000000,24.643416>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.896097,0.000000,24.933200>}
box{<0,0,-0.304800><1.302267,0.035000,0.304800> rotate<0,-12.856418,0> translate<17.626481,0.000000,24.643416> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.133019,0.000000,21.573197>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.430597,0.000000,21.275619>}
box{<0,0,-0.304800><0.420839,0.035000,0.304800> rotate<0,44.997030,0> translate<18.133019,0.000000,21.573197> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.336216,0.000000,13.749997>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.430597,0.000000,13.655619>}
box{<0,0,-0.304800><0.133473,0.035000,0.304800> rotate<0,44.996082,0> translate<18.336216,0.000000,13.749997> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.336216,0.000000,13.749997>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.430597,0.000000,13.844378>}
box{<0,0,-0.304800><0.133475,0.035000,0.304800> rotate<0,-44.997030,0> translate<18.336216,0.000000,13.749997> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.336216,0.000000,15.020000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.430597,0.000000,14.925619>}
box{<0,0,-0.304800><0.133475,0.035000,0.304800> rotate<0,44.997030,0> translate<18.336216,0.000000,15.020000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.336216,0.000000,15.020000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.430597,0.000000,15.114378>}
box{<0,0,-0.304800><0.133473,0.035000,0.304800> rotate<0,-44.996082,0> translate<18.336216,0.000000,15.020000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.336216,0.000000,16.290000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.430597,0.000000,16.195619>}
box{<0,0,-0.304800><0.133475,0.035000,0.304800> rotate<0,44.997030,0> translate<18.336216,0.000000,16.290000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.336216,0.000000,16.290000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.430597,0.000000,16.384378>}
box{<0,0,-0.304800><0.133473,0.035000,0.304800> rotate<0,-44.996082,0> translate<18.336216,0.000000,16.290000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.336216,0.000000,17.560000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.430597,0.000000,17.465619>}
box{<0,0,-0.304800><0.133475,0.035000,0.304800> rotate<0,44.997030,0> translate<18.336216,0.000000,17.560000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.336216,0.000000,17.560000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.430597,0.000000,17.654378>}
box{<0,0,-0.304800><0.133473,0.035000,0.304800> rotate<0,-44.996082,0> translate<18.336216,0.000000,17.560000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.336216,0.000000,18.830000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.430597,0.000000,18.735619>}
box{<0,0,-0.304800><0.133475,0.035000,0.304800> rotate<0,44.997030,0> translate<18.336216,0.000000,18.830000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.336216,0.000000,18.830000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.430597,0.000000,18.924378>}
box{<0,0,-0.304800><0.133473,0.035000,0.304800> rotate<0,-44.996082,0> translate<18.336216,0.000000,18.830000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.336216,0.000000,20.100000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.430597,0.000000,20.005619>}
box{<0,0,-0.304800><0.133475,0.035000,0.304800> rotate<0,44.997030,0> translate<18.336216,0.000000,20.100000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.336216,0.000000,20.100000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.430597,0.000000,20.194378>}
box{<0,0,-0.304800><0.133473,0.035000,0.304800> rotate<0,-44.996082,0> translate<18.336216,0.000000,20.100000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.353016,0.000000,20.116800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.606978,0.000000,20.116800>}
box{<0,0,-0.304800><3.253963,0.035000,0.304800> rotate<0,0.000000,0> translate<18.353016,0.000000,20.116800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.370216,0.000000,21.336000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.589781,0.000000,21.336000>}
box{<0,0,-0.304800><3.219566,0.035000,0.304800> rotate<0,0.000000,0> translate<18.370216,0.000000,21.336000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.371497,0.000000,12.515281>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.430597,0.000000,12.574378>}
box{<0,0,-0.304800><0.083578,0.035000,0.304800> rotate<0,-44.995515,0> translate<18.371497,0.000000,12.515281> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.371497,0.000000,12.515281>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.443316,0.000000,12.390887>}
box{<0,0,-0.304800><0.143638,0.035000,0.304800> rotate<0,59.996045,0> translate<18.371497,0.000000,12.515281> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.403816,0.000000,18.897600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.556178,0.000000,18.897600>}
box{<0,0,-0.304800><3.152363,0.035000,0.304800> rotate<0,0.000000,0> translate<18.403816,0.000000,18.897600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.430597,0.000000,12.574378>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.430597,0.000000,13.655619>}
box{<0,0,-0.304800><1.081241,0.035000,0.304800> rotate<0,90.000000,0> translate<18.430597,0.000000,13.655619> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.430597,0.000000,12.801600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.529400,0.000000,12.801600>}
box{<0,0,-0.304800><3.098803,0.035000,0.304800> rotate<0,0.000000,0> translate<18.430597,0.000000,12.801600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.430597,0.000000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.529400,0.000000,13.411200>}
box{<0,0,-0.304800><3.098803,0.035000,0.304800> rotate<0,0.000000,0> translate<18.430597,0.000000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.430597,0.000000,13.844378>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.430597,0.000000,14.925619>}
box{<0,0,-0.304800><1.081241,0.035000,0.304800> rotate<0,90.000000,0> translate<18.430597,0.000000,14.925619> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.430597,0.000000,14.020800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.529400,0.000000,14.020800>}
box{<0,0,-0.304800><3.098803,0.035000,0.304800> rotate<0,0.000000,0> translate<18.430597,0.000000,14.020800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.430597,0.000000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.529400,0.000000,14.630400>}
box{<0,0,-0.304800><3.098803,0.035000,0.304800> rotate<0,0.000000,0> translate<18.430597,0.000000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.430597,0.000000,15.114378>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.430597,0.000000,16.195619>}
box{<0,0,-0.304800><1.081241,0.035000,0.304800> rotate<0,90.000000,0> translate<18.430597,0.000000,16.195619> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.430597,0.000000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.529400,0.000000,15.240000>}
box{<0,0,-0.304800><3.098803,0.035000,0.304800> rotate<0,0.000000,0> translate<18.430597,0.000000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.430597,0.000000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.529400,0.000000,15.849600>}
box{<0,0,-0.304800><3.098803,0.035000,0.304800> rotate<0,0.000000,0> translate<18.430597,0.000000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.430597,0.000000,16.384378>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.430597,0.000000,17.465619>}
box{<0,0,-0.304800><1.081241,0.035000,0.304800> rotate<0,90.000000,0> translate<18.430597,0.000000,17.465619> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.430597,0.000000,16.459200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.529400,0.000000,16.459200>}
box{<0,0,-0.304800><3.098803,0.035000,0.304800> rotate<0,0.000000,0> translate<18.430597,0.000000,16.459200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.430597,0.000000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.529400,0.000000,17.068800>}
box{<0,0,-0.304800><3.098803,0.035000,0.304800> rotate<0,0.000000,0> translate<18.430597,0.000000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.430597,0.000000,17.654378>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.430597,0.000000,18.735619>}
box{<0,0,-0.304800><1.081241,0.035000,0.304800> rotate<0,90.000000,0> translate<18.430597,0.000000,18.735619> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.430597,0.000000,17.678400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.529400,0.000000,17.678400>}
box{<0,0,-0.304800><3.098803,0.035000,0.304800> rotate<0,0.000000,0> translate<18.430597,0.000000,17.678400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.430597,0.000000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.529400,0.000000,18.288000>}
box{<0,0,-0.304800><3.098803,0.035000,0.304800> rotate<0,0.000000,0> translate<18.430597,0.000000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.430597,0.000000,18.924378>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.430597,0.000000,20.005619>}
box{<0,0,-0.304800><1.081241,0.035000,0.304800> rotate<0,90.000000,0> translate<18.430597,0.000000,20.005619> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.430597,0.000000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.529400,0.000000,19.507200>}
box{<0,0,-0.304800><3.098803,0.035000,0.304800> rotate<0,0.000000,0> translate<18.430597,0.000000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.430597,0.000000,20.194378>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.430597,0.000000,21.275619>}
box{<0,0,-0.304800><1.081241,0.035000,0.304800> rotate<0,90.000000,0> translate<18.430597,0.000000,21.275619> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.430597,0.000000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.529400,0.000000,20.726400>}
box{<0,0,-0.304800><3.098803,0.035000,0.304800> rotate<0,0.000000,0> translate<18.430597,0.000000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.443316,0.000000,12.390887>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.481397,0.000000,12.248766>}
box{<0,0,-0.304800><0.147135,0.035000,0.304800> rotate<0,74.995122,0> translate<18.443316,0.000000,12.390887> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.457700,0.000000,11.352797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.481397,0.000000,11.441231>}
box{<0,0,-0.304800><0.091554,0.035000,0.304800> rotate<0,-74.994473,0> translate<18.457700,0.000000,11.352797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.457700,0.000000,11.352797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.529400,0.000000,11.352797>}
box{<0,0,-0.304800><3.071700,0.035000,0.304800> rotate<0,0.000000,0> translate<18.457700,0.000000,11.352797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.481397,0.000000,11.441231>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.481397,0.000000,11.844981>}
box{<0,0,-0.304800><0.403750,0.035000,0.304800> rotate<0,90.000000,0> translate<18.481397,0.000000,11.844981> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.481397,0.000000,11.582400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.529400,0.000000,11.582400>}
box{<0,0,-0.304800><3.048003,0.035000,0.304800> rotate<0,0.000000,0> translate<18.481397,0.000000,11.582400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.481397,0.000000,11.845013>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.481397,0.000000,12.248766>}
box{<0,0,-0.304800><0.403753,0.035000,0.304800> rotate<0,90.000000,0> translate<18.481397,0.000000,12.248766> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.481397,0.000000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.529400,0.000000,12.192000>}
box{<0,0,-0.304800><3.048003,0.035000,0.304800> rotate<0,0.000000,0> translate<18.481397,0.000000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.896097,0.000000,24.933200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.896100,0.000000,24.933200>}
box{<0,0,-0.304800><0.000003,0.035000,0.304800> rotate<0,0.000000,0> translate<18.896097,0.000000,24.933200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.896100,0.000000,24.933200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.023897,0.000000,25.584334>}
box{<0,0,-0.304800><1.302268,0.035000,0.304800> rotate<0,-29.998041,0> translate<18.896100,0.000000,24.933200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.000716,0.000000,24.993600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.128756,0.000000,24.993600>}
box{<0,0,-0.304800><19.128041,0.035000,0.304800> rotate<0,0.000000,0> translate<19.000716,0.000000,24.993600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.023897,0.000000,25.584334>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.023900,0.000000,25.584334>}
box{<0,0,-0.304800><0.000003,0.035000,0.304800> rotate<0,0.000000,0> translate<20.023897,0.000000,25.584334> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.023900,0.000000,25.584334>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.909669,0.000000,26.538966>}
box{<0,0,-0.304800><1.302270,0.035000,0.304800> rotate<0,-47.139733,0> translate<20.023900,0.000000,25.584334> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.041403,0.000000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.205303,0.000000,25.603200>}
box{<0,0,-0.304800><17.163900,0.035000,0.304800> rotate<0,0.000000,0> translate<20.041403,0.000000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.607028,0.000000,26.212800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.603578,0.000000,26.212800>}
box{<0,0,-0.304800><15.996550,0.035000,0.304800> rotate<0,0.000000,0> translate<20.607028,0.000000,26.212800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.679997,0.000000,3.748862>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.063847,0.000000,2.504450>}
box{<0,0,-0.304800><1.302269,0.035000,0.304800> rotate<0,72.852352,0> translate<20.679997,0.000000,3.748862> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.679997,0.000000,5.051134>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.679997,0.000000,3.748862>}
box{<0,0,-0.304800><1.302272,0.035000,0.304800> rotate<0,-90.000000,0> translate<20.679997,0.000000,3.748862> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.679997,0.000000,5.051134>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.063847,0.000000,6.295547>}
box{<0,0,-0.304800><1.302269,0.035000,0.304800> rotate<0,-72.852352,0> translate<20.679997,0.000000,5.051134> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.728947,0.000000,31.655800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.909669,0.000000,31.461031>}
box{<0,0,-0.304800><0.265698,0.035000,0.304800> rotate<0,47.139290,0> translate<20.728947,0.000000,31.655800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.728947,0.000000,31.655800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.627244,0.000000,31.621903>}
box{<0,0,-0.304800><15.898333,0.035000,0.304800> rotate<0,0.122153,0> translate<20.728947,0.000000,31.655800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.909669,0.000000,26.538966>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.909669,0.000000,26.538969>}
box{<0,0,-0.304800><0.000003,0.035000,0.304800> rotate<0,90.000000,0> translate<20.909669,0.000000,26.538969> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.909669,0.000000,26.538969>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.474703,0.000000,27.712272>}
box{<0,0,-0.304800><1.302269,0.035000,0.304800> rotate<0,-64.281417,0> translate<20.909669,0.000000,26.538969> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.909669,0.000000,31.461028>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.909669,0.000000,31.461031>}
box{<0,0,-0.304800><0.000003,0.035000,0.304800> rotate<0,90.000000,0> translate<20.909669,0.000000,31.461031> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.909669,0.000000,31.461028>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.474703,0.000000,30.287725>}
box{<0,0,-0.304800><1.302269,0.035000,0.304800> rotate<0,64.281417,0> translate<20.909669,0.000000,31.461028> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.046159,0.000000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.187963,0.000000,26.822400>}
box{<0,0,-0.304800><15.141803,0.035000,0.304800> rotate<0,0.000000,0> translate<21.046159,0.000000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.063847,0.000000,2.504447>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.797441,0.000000,1.428462>}
box{<0,0,-0.304800><1.302268,0.035000,0.304800> rotate<0,55.710608,0> translate<21.063847,0.000000,2.504447> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.063847,0.000000,2.504450>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.063847,0.000000,2.504447>}
box{<0,0,-0.304800><0.000003,0.035000,0.304800> rotate<0,-90.000000,0> translate<21.063847,0.000000,2.504447> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.063847,0.000000,6.295550>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.063847,0.000000,6.295547>}
box{<0,0,-0.304800><0.000003,0.035000,0.304800> rotate<0,-90.000000,0> translate<21.063847,0.000000,6.295547> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.063847,0.000000,6.295550>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.797441,0.000000,7.371534>}
box{<0,0,-0.304800><1.302268,0.035000,0.304800> rotate<0,-55.710608,0> translate<21.063847,0.000000,6.295550> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.088541,0.000000,31.089600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.264328,0.000000,31.089600>}
box{<0,0,-0.304800><15.175787,0.035000,0.304800> rotate<0,0.000000,0> translate<21.088541,0.000000,31.089600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.339728,0.000000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.931963,0.000000,27.432000>}
box{<0,0,-0.304800><14.592234,0.035000,0.304800> rotate<0,0.000000,0> translate<21.339728,0.000000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.382109,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.966516,0.000000,30.480000>}
box{<0,0,-0.304800><14.584406,0.035000,0.304800> rotate<0,0.000000,0> translate<21.382109,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.474703,0.000000,27.712272>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.474703,0.000000,27.712275>}
box{<0,0,-0.304800><0.000003,0.035000,0.304800> rotate<0,90.000000,0> translate<21.474703,0.000000,27.712275> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.474703,0.000000,27.712275>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.668797,0.000000,28.999997>}
box{<0,0,-0.304800><1.302267,0.035000,0.304800> rotate<0,-81.423158,0> translate<21.474703,0.000000,27.712275> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.474703,0.000000,30.287722>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.474703,0.000000,30.287725>}
box{<0,0,-0.304800><0.000003,0.035000,0.304800> rotate<0,90.000000,0> translate<21.474703,0.000000,30.287725> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.474703,0.000000,30.287722>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.668797,0.000000,28.999997>}
box{<0,0,-0.304800><1.302270,0.035000,0.304800> rotate<0,81.423179,0> translate<21.474703,0.000000,30.287722> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.524341,0.000000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.743928,0.000000,28.041600>}
box{<0,0,-0.304800><14.219588,0.035000,0.304800> rotate<0,0.000000,0> translate<21.524341,0.000000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.529400,0.000000,12.385619>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.529400,0.000000,11.352797>}
box{<0,0,-0.304800><1.032822,0.035000,0.304800> rotate<0,-90.000000,0> translate<21.529400,0.000000,11.352797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.529400,0.000000,12.385619>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.623781,0.000000,12.480000>}
box{<0,0,-0.304800><0.133475,0.035000,0.304800> rotate<0,-44.997030,0> translate<21.529400,0.000000,12.385619> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.529400,0.000000,12.574378>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.623781,0.000000,12.480000>}
box{<0,0,-0.304800><0.133473,0.035000,0.304800> rotate<0,44.996082,0> translate<21.529400,0.000000,12.574378> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.529400,0.000000,13.655619>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.529400,0.000000,12.574378>}
box{<0,0,-0.304800><1.081241,0.035000,0.304800> rotate<0,-90.000000,0> translate<21.529400,0.000000,12.574378> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.529400,0.000000,13.655619>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.623781,0.000000,13.750000>}
box{<0,0,-0.304800><0.133475,0.035000,0.304800> rotate<0,-44.997030,0> translate<21.529400,0.000000,13.655619> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.529400,0.000000,13.844378>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.623781,0.000000,13.750000>}
box{<0,0,-0.304800><0.133473,0.035000,0.304800> rotate<0,44.996082,0> translate<21.529400,0.000000,13.844378> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.529400,0.000000,14.925619>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.529400,0.000000,13.844378>}
box{<0,0,-0.304800><1.081241,0.035000,0.304800> rotate<0,-90.000000,0> translate<21.529400,0.000000,13.844378> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.529400,0.000000,14.925619>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.623781,0.000000,15.019997>}
box{<0,0,-0.304800><0.133473,0.035000,0.304800> rotate<0,-44.996082,0> translate<21.529400,0.000000,14.925619> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.529400,0.000000,15.114378>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.623781,0.000000,15.019997>}
box{<0,0,-0.304800><0.133475,0.035000,0.304800> rotate<0,44.997030,0> translate<21.529400,0.000000,15.114378> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.529400,0.000000,16.195619>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.529400,0.000000,15.114378>}
box{<0,0,-0.304800><1.081241,0.035000,0.304800> rotate<0,-90.000000,0> translate<21.529400,0.000000,15.114378> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.529400,0.000000,16.195619>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.623781,0.000000,16.290000>}
box{<0,0,-0.304800><0.133475,0.035000,0.304800> rotate<0,-44.997030,0> translate<21.529400,0.000000,16.195619> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.529400,0.000000,16.384378>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.623781,0.000000,16.290000>}
box{<0,0,-0.304800><0.133473,0.035000,0.304800> rotate<0,44.996082,0> translate<21.529400,0.000000,16.384378> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.529400,0.000000,17.465619>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.529400,0.000000,16.384378>}
box{<0,0,-0.304800><1.081241,0.035000,0.304800> rotate<0,-90.000000,0> translate<21.529400,0.000000,16.384378> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.529400,0.000000,17.465619>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.623781,0.000000,17.560000>}
box{<0,0,-0.304800><0.133475,0.035000,0.304800> rotate<0,-44.997030,0> translate<21.529400,0.000000,17.465619> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.529400,0.000000,17.654378>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.623781,0.000000,17.560000>}
box{<0,0,-0.304800><0.133473,0.035000,0.304800> rotate<0,44.996082,0> translate<21.529400,0.000000,17.654378> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.529400,0.000000,18.735619>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.529400,0.000000,17.654378>}
box{<0,0,-0.304800><1.081241,0.035000,0.304800> rotate<0,-90.000000,0> translate<21.529400,0.000000,17.654378> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.529400,0.000000,18.735619>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.623781,0.000000,18.830000>}
box{<0,0,-0.304800><0.133475,0.035000,0.304800> rotate<0,-44.997030,0> translate<21.529400,0.000000,18.735619> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.529400,0.000000,18.924378>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.623781,0.000000,18.830000>}
box{<0,0,-0.304800><0.133473,0.035000,0.304800> rotate<0,44.996082,0> translate<21.529400,0.000000,18.924378> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.529400,0.000000,20.005619>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.529400,0.000000,18.924378>}
box{<0,0,-0.304800><1.081241,0.035000,0.304800> rotate<0,-90.000000,0> translate<21.529400,0.000000,18.924378> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.529400,0.000000,20.005619>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.623781,0.000000,20.100000>}
box{<0,0,-0.304800><0.133475,0.035000,0.304800> rotate<0,-44.997030,0> translate<21.529400,0.000000,20.005619> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.529400,0.000000,20.194378>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.623781,0.000000,20.100000>}
box{<0,0,-0.304800><0.133473,0.035000,0.304800> rotate<0,44.996082,0> translate<21.529400,0.000000,20.194378> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.529400,0.000000,21.275619>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.529400,0.000000,20.194378>}
box{<0,0,-0.304800><1.081241,0.035000,0.304800> rotate<0,-90.000000,0> translate<21.529400,0.000000,20.194378> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.529400,0.000000,21.275619>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.826978,0.000000,21.573197>}
box{<0,0,-0.304800><0.420839,0.035000,0.304800> rotate<0,-44.997030,0> translate<21.529400,0.000000,21.275619> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.537606,0.000000,29.870400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.778478,0.000000,29.870400>}
box{<0,0,-0.304800><14.240872,0.035000,0.304800> rotate<0,0.000000,0> translate<21.537606,0.000000,29.870400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.616222,0.000000,28.651200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.679997,0.000000,28.651200>}
box{<0,0,-0.304800><14.063775,0.035000,0.304800> rotate<0,0.000000,0> translate<21.616222,0.000000,28.651200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.629487,0.000000,29.260800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.679997,0.000000,29.260800>}
box{<0,0,-0.304800><14.050509,0.035000,0.304800> rotate<0,0.000000,0> translate<21.629487,0.000000,29.260800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.797441,0.000000,1.428459>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.797444,0.000000,1.428459>}
box{<0,0,-0.304800><0.000003,0.035000,0.304800> rotate<0,0.000000,0> translate<21.797441,0.000000,1.428459> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.797441,0.000000,1.428462>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.797441,0.000000,1.428459>}
box{<0,0,-0.304800><0.000003,0.035000,0.304800> rotate<0,-90.000000,0> translate<21.797441,0.000000,1.428459> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.797441,0.000000,7.371538>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.797441,0.000000,7.371534>}
box{<0,0,-0.304800><0.000003,0.035000,0.304800> rotate<0,-90.000000,0> translate<21.797441,0.000000,7.371534> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.797441,0.000000,7.371538>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.797444,0.000000,7.371538>}
box{<0,0,-0.304800><0.000003,0.035000,0.304800> rotate<0,0.000000,0> translate<21.797441,0.000000,7.371538> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.797444,0.000000,1.428459>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.932450,0.000000,1.320797>}
box{<0,0,-0.304800><0.172679,0.035000,0.304800> rotate<0,38.568522,0> translate<21.797444,0.000000,1.428459> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.797444,0.000000,7.371538>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.815597,0.000000,8.183491>}
box{<0,0,-0.304800><1.302269,0.035000,0.304800> rotate<0,-38.568990,0> translate<21.797444,0.000000,7.371538> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.826978,0.000000,21.573197>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.023725,0.000000,21.573197>}
box{<0,0,-0.304800><2.196747,0.035000,0.304800> rotate<0,0.000000,0> translate<21.826978,0.000000,21.573197> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.815597,0.000000,8.183491>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.815600,0.000000,8.183491>}
box{<0,0,-0.304800><0.000003,0.035000,0.304800> rotate<0,0.000000,0> translate<22.815597,0.000000,8.183491> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.815600,0.000000,8.183491>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.027847,0.000000,8.659263>}
box{<0,0,-0.304800><1.302268,0.035000,0.304800> rotate<0,-21.427159,0> translate<22.815600,0.000000,8.183491> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.663325,0.000000,22.787200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.187200,0.000000,22.263325>}
box{<0,0,-0.304800><0.740871,0.035000,0.304800> rotate<0,44.997030,0> translate<23.663325,0.000000,22.787200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.023725,0.000000,21.573197>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.187200,0.000000,21.736672>}
box{<0,0,-0.304800><0.231189,0.035000,0.304800> rotate<0,-44.997030,0> translate<24.023725,0.000000,21.573197> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.027847,0.000000,8.659263>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.027850,0.000000,8.659263>}
box{<0,0,-0.304800><0.000003,0.035000,0.304800> rotate<0,0.000000,0> translate<24.027847,0.000000,8.659263> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.027850,0.000000,8.659263>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.326478,0.000000,8.756581>}
box{<0,0,-0.304800><1.302270,0.035000,0.304800> rotate<0,-4.285433,0> translate<24.027850,0.000000,8.659263> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.161675,0.000000,24.412797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.460413,0.000000,24.289056>}
box{<0,0,-0.304800><0.323351,0.035000,0.304800> rotate<0,22.498433,0> translate<24.161675,0.000000,24.412797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.187200,0.000000,22.263325>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.187200,0.000000,21.736672>}
box{<0,0,-0.304800><0.526653,0.035000,0.304800> rotate<0,-90.000000,0> translate<24.187200,0.000000,21.736672> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.231200,0.000000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.635950,0.000000,24.384000>}
box{<0,0,-0.304800><17.404750,0.035000,0.304800> rotate<0,0.000000,0> translate<24.231200,0.000000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.460413,0.000000,24.289056>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.689056,0.000000,24.060413>}
box{<0,0,-0.304800><0.323351,0.035000,0.304800> rotate<0,44.997030,0> translate<24.460413,0.000000,24.289056> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.689056,0.000000,24.060413>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.689056,0.000000,23.060413>}
box{<0,0,-0.304800><1.414214,0.035000,0.304800> rotate<0,44.997030,0> translate<24.689056,0.000000,24.060413> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.975069,0.000000,23.774400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.368000,0.000000,23.774400>}
box{<0,0,-0.304800><16.392931,0.035000,0.304800> rotate<0,0.000000,0> translate<24.975069,0.000000,23.774400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.326478,0.000000,8.756581>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.326481,0.000000,8.756581>}
box{<0,0,-0.304800><0.000003,0.035000,0.304800> rotate<0,0.000000,0> translate<25.326478,0.000000,8.756581> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.326481,0.000000,8.756581>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.596097,0.000000,8.466797>}
box{<0,0,-0.304800><1.302267,0.035000,0.304800> rotate<0,12.856418,0> translate<25.326481,0.000000,8.756581> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.584669,0.000000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.115331,0.000000,23.164800>}
box{<0,0,-0.304800><15.530663,0.035000,0.304800> rotate<0,0.000000,0> translate<25.584669,0.000000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.689056,0.000000,23.060413>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.812797,0.000000,22.761675>}
box{<0,0,-0.304800><0.323351,0.035000,0.304800> rotate<0,67.495627,0> translate<25.689056,0.000000,23.060413> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.812797,0.000000,21.736669>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.812797,0.000000,22.761675>}
box{<0,0,-0.304800><1.025006,0.035000,0.304800> rotate<0,90.000000,0> translate<25.812797,0.000000,22.761675> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.812797,0.000000,21.736669>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.936672,0.000000,21.612797>}
box{<0,0,-0.304800><0.175183,0.035000,0.304800> rotate<0,44.996308,0> translate<25.812797,0.000000,21.736669> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.812797,0.000000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.896131,0.000000,21.945600>}
box{<0,0,-0.304800><14.083334,0.035000,0.304800> rotate<0,0.000000,0> translate<25.812797,0.000000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.812797,0.000000,22.555200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.505731,0.000000,22.555200>}
box{<0,0,-0.304800><14.692934,0.035000,0.304800> rotate<0,0.000000,0> translate<25.812797,0.000000,22.555200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.936672,0.000000,21.612797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.361675,0.000000,21.612797>}
box{<0,0,-0.304800><8.425003,0.035000,0.304800> rotate<0,0.000000,0> translate<25.936672,0.000000,21.612797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.299913,0.000000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.280334,0.000000,8.534400>}
box{<0,0,-0.304800><0.980422,0.035000,0.304800> rotate<0,0.000000,0> translate<26.299913,0.000000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.596097,0.000000,8.466797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.596100,0.000000,8.466797>}
box{<0,0,-0.304800><0.000003,0.035000,0.304800> rotate<0,0.000000,0> translate<26.596097,0.000000,8.466797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.596100,0.000000,8.466797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.723897,0.000000,7.815663>}
box{<0,0,-0.304800><1.302268,0.035000,0.304800> rotate<0,29.998041,0> translate<26.596100,0.000000,8.466797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.076200,0.000000,8.896431>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.114281,0.000000,8.754309>}
box{<0,0,-0.304800><0.147135,0.035000,0.304800> rotate<0,74.995122,0> translate<27.076200,0.000000,8.896431> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.076200,0.000000,9.269981>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.076200,0.000000,8.896431>}
box{<0,0,-0.304800><0.373550,0.035000,0.304800> rotate<0,-90.000000,0> translate<27.076200,0.000000,8.896431> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.076200,0.000000,9.269981>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.534966,0.000000,9.269981>}
box{<0,0,-0.304800><1.458766,0.035000,0.304800> rotate<0,0.000000,0> translate<27.076200,0.000000,9.269981> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.076200,0.000000,9.270012>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.534966,0.000000,9.270012>}
box{<0,0,-0.304800><1.458766,0.035000,0.304800> rotate<0,0.000000,0> translate<27.076200,0.000000,9.270012> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.076200,0.000000,9.643566>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.076200,0.000000,9.270012>}
box{<0,0,-0.304800><0.373553,0.035000,0.304800> rotate<0,-90.000000,0> translate<27.076200,0.000000,9.270012> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.076200,0.000000,9.643566>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.098613,0.000000,9.727200>}
box{<0,0,-0.304800><0.086585,0.035000,0.304800> rotate<0,-74.993301,0> translate<27.076200,0.000000,9.643566> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.114281,0.000000,8.754309>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.187847,0.000000,8.626888>}
box{<0,0,-0.304800><0.147133,0.035000,0.304800> rotate<0,59.996522,0> translate<27.114281,0.000000,8.754309> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.187847,0.000000,8.626888>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.291888,0.000000,8.522847>}
box{<0,0,-0.304800><0.147136,0.035000,0.304800> rotate<0,44.997030,0> translate<27.187847,0.000000,8.626888> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.291888,0.000000,8.522847>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.419309,0.000000,8.449281>}
box{<0,0,-0.304800><0.147133,0.035000,0.304800> rotate<0,29.997538,0> translate<27.291888,0.000000,8.522847> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.419309,0.000000,8.449281>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.561431,0.000000,8.411200>}
box{<0,0,-0.304800><0.147135,0.035000,0.304800> rotate<0,14.998938,0> translate<27.419309,0.000000,8.449281> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.534866,0.000000,7.924800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.575641,0.000000,7.924800>}
box{<0,0,-0.304800><11.040775,0.035000,0.304800> rotate<0,0.000000,0> translate<27.534866,0.000000,7.924800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.561431,0.000000,8.411200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.534981,0.000000,8.411200>}
box{<0,0,-0.304800><0.973550,0.035000,0.304800> rotate<0,0.000000,0> translate<27.561431,0.000000,8.411200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.723897,0.000000,7.815663>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.723900,0.000000,7.815663>}
box{<0,0,-0.304800><0.000003,0.035000,0.304800> rotate<0,0.000000,0> translate<27.723897,0.000000,7.815663> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.723900,0.000000,7.815663>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.609669,0.000000,6.861031>}
box{<0,0,-0.304800><1.302270,0.035000,0.304800> rotate<0,47.139733,0> translate<27.723900,0.000000,7.815663> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.036088,0.000000,1.320797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.609669,0.000000,1.938966>}
box{<0,0,-0.304800><0.843284,0.035000,0.304800> rotate<0,-47.139523,0> translate<28.036088,0.000000,1.320797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.036088,0.000000,1.320797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.579200,0.000000,1.320797>}
box{<0,0,-0.304800><17.543112,0.035000,0.304800> rotate<0,0.000000,0> translate<28.036088,0.000000,1.320797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.188263,0.000000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.135325,0.000000,7.315200>}
box{<0,0,-0.304800><10.947063,0.035000,0.304800> rotate<0,0.000000,0> translate<28.188263,0.000000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.507447,0.000000,1.828800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.579200,0.000000,1.828800>}
box{<0,0,-0.304800><17.071753,0.035000,0.304800> rotate<0,0.000000,0> translate<28.507447,0.000000,1.828800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.534966,0.000000,9.270012>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.534966,0.000000,9.269981>}
box{<0,0,-0.304800><0.000031,0.035000,0.304800> rotate<0,-90.000000,0> translate<28.534966,0.000000,9.269981> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.534981,0.000000,8.411200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.534981,0.000000,9.269966>}
box{<0,0,-0.304800><0.858766,0.035000,0.304800> rotate<0,90.000000,0> translate<28.534981,0.000000,9.269966> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.534981,0.000000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.535013,0.000000,8.534400>}
box{<0,0,-0.304800><0.000031,0.035000,0.304800> rotate<0,0.000000,0> translate<28.534981,0.000000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.534981,0.000000,9.144000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.535013,0.000000,9.144000>}
box{<0,0,-0.304800><0.000031,0.035000,0.304800> rotate<0,0.000000,0> translate<28.534981,0.000000,9.144000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.534981,0.000000,9.269966>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.535013,0.000000,9.269966>}
box{<0,0,-0.304800><0.000031,0.035000,0.304800> rotate<0,0.000000,0> translate<28.534981,0.000000,9.269966> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.535013,0.000000,8.411200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.508566,0.000000,8.411200>}
box{<0,0,-0.304800><0.973553,0.035000,0.304800> rotate<0,0.000000,0> translate<28.535013,0.000000,8.411200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.535013,0.000000,9.269966>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.535013,0.000000,8.411200>}
box{<0,0,-0.304800><0.858766,0.035000,0.304800> rotate<0,-90.000000,0> translate<28.535013,0.000000,8.411200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.535031,0.000000,9.269981>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.535031,0.000000,9.270012>}
box{<0,0,-0.304800><0.000031,0.035000,0.304800> rotate<0,90.000000,0> translate<28.535031,0.000000,9.270012> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.535031,0.000000,9.269981>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.993797,0.000000,9.269981>}
box{<0,0,-0.304800><1.458766,0.035000,0.304800> rotate<0,0.000000,0> translate<28.535031,0.000000,9.269981> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.535031,0.000000,9.270012>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.993797,0.000000,9.270012>}
box{<0,0,-0.304800><1.458766,0.035000,0.304800> rotate<0,0.000000,0> translate<28.535031,0.000000,9.270012> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.609669,0.000000,1.938966>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.609669,0.000000,1.938969>}
box{<0,0,-0.304800><0.000003,0.035000,0.304800> rotate<0,90.000000,0> translate<28.609669,0.000000,1.938969> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.609669,0.000000,1.938969>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.174703,0.000000,3.112272>}
box{<0,0,-0.304800><1.302269,0.035000,0.304800> rotate<0,-64.281417,0> translate<28.609669,0.000000,1.938969> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.609669,0.000000,6.861028>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.609669,0.000000,6.861031>}
box{<0,0,-0.304800><0.000003,0.035000,0.304800> rotate<0,90.000000,0> translate<28.609669,0.000000,6.861031> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.609669,0.000000,6.861028>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.174703,0.000000,5.687725>}
box{<0,0,-0.304800><1.302269,0.035000,0.304800> rotate<0,64.281417,0> translate<28.609669,0.000000,6.861028> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.684522,0.000000,6.705600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.744925,0.000000,6.705600>}
box{<0,0,-0.304800><11.060403,0.035000,0.304800> rotate<0,0.000000,0> translate<28.684522,0.000000,6.705600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.850181,0.000000,2.438400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.579200,0.000000,2.438400>}
box{<0,0,-0.304800><16.729019,0.035000,0.304800> rotate<0,0.000000,0> translate<28.850181,0.000000,2.438400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.978091,0.000000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.354525,0.000000,6.096000>}
box{<0,0,-0.304800><11.376434,0.035000,0.304800> rotate<0,0.000000,0> translate<28.978091,0.000000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.143750,0.000000,3.048000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.579200,0.000000,3.048000>}
box{<0,0,-0.304800><16.435450,0.035000,0.304800> rotate<0,0.000000,0> translate<29.143750,0.000000,3.048000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.174703,0.000000,3.112272>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.174703,0.000000,3.112275>}
box{<0,0,-0.304800><0.000003,0.035000,0.304800> rotate<0,90.000000,0> translate<29.174703,0.000000,3.112275> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.174703,0.000000,3.112275>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.368797,0.000000,4.399997>}
box{<0,0,-0.304800><1.302267,0.035000,0.304800> rotate<0,-81.423158,0> translate<29.174703,0.000000,3.112275> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.174703,0.000000,5.687722>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.174703,0.000000,5.687725>}
box{<0,0,-0.304800><0.000003,0.035000,0.304800> rotate<0,90.000000,0> translate<29.174703,0.000000,5.687725> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.174703,0.000000,5.687722>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.368797,0.000000,4.399997>}
box{<0,0,-0.304800><1.302270,0.035000,0.304800> rotate<0,81.423179,0> translate<29.174703,0.000000,5.687722> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.205050,0.000000,5.486400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.964125,0.000000,5.486400>}
box{<0,0,-0.304800><11.759075,0.035000,0.304800> rotate<0,0.000000,0> translate<29.205050,0.000000,5.486400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.256897,0.000000,3.657600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.579200,0.000000,3.657600>}
box{<0,0,-0.304800><16.322303,0.035000,0.304800> rotate<0,0.000000,0> translate<29.256897,0.000000,3.657600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.296931,0.000000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.775147,0.000000,4.876800>}
box{<0,0,-0.304800><12.478216,0.035000,0.304800> rotate<0,0.000000,0> translate<29.296931,0.000000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.348778,0.000000,4.267200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.579200,0.000000,4.267200>}
box{<0,0,-0.304800><16.230422,0.035000,0.304800> rotate<0,0.000000,0> translate<29.348778,0.000000,4.267200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.508566,0.000000,8.411200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.650688,0.000000,8.449281>}
box{<0,0,-0.304800><0.147135,0.035000,0.304800> rotate<0,-14.998938,0> translate<29.508566,0.000000,8.411200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.650688,0.000000,8.449281>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.778109,0.000000,8.522847>}
box{<0,0,-0.304800><0.147133,0.035000,0.304800> rotate<0,-29.997538,0> translate<29.650688,0.000000,8.449281> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.778109,0.000000,8.522847>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.882150,0.000000,8.626888>}
box{<0,0,-0.304800><0.147136,0.035000,0.304800> rotate<0,-44.997030,0> translate<29.778109,0.000000,8.522847> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.789663,0.000000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.681944,0.000000,8.534400>}
box{<0,0,-0.304800><5.892281,0.035000,0.304800> rotate<0,0.000000,0> translate<29.789663,0.000000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.818416,0.000000,11.175000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.942997,0.000000,11.050419>}
box{<0,0,-0.304800><0.176184,0.035000,0.304800> rotate<0,44.997030,0> translate<29.818416,0.000000,11.175000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.818416,0.000000,11.175000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.942997,0.000000,11.299578>}
box{<0,0,-0.304800><0.176182,0.035000,0.304800> rotate<0,-44.996312,0> translate<29.818416,0.000000,11.175000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.818416,0.000000,12.445000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.942997,0.000000,12.320419>}
box{<0,0,-0.304800><0.176184,0.035000,0.304800> rotate<0,44.997030,0> translate<29.818416,0.000000,12.445000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.818416,0.000000,12.445000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.942997,0.000000,12.569578>}
box{<0,0,-0.304800><0.176182,0.035000,0.304800> rotate<0,-44.996312,0> translate<29.818416,0.000000,12.445000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.818416,0.000000,13.715000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.942997,0.000000,13.590419>}
box{<0,0,-0.304800><0.176184,0.035000,0.304800> rotate<0,44.997030,0> translate<29.818416,0.000000,13.715000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.818416,0.000000,13.715000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.942997,0.000000,13.839578>}
box{<0,0,-0.304800><0.176182,0.035000,0.304800> rotate<0,-44.996312,0> translate<29.818416,0.000000,13.715000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.818416,0.000000,14.985000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.942997,0.000000,14.860419>}
box{<0,0,-0.304800><0.176184,0.035000,0.304800> rotate<0,44.997030,0> translate<29.818416,0.000000,14.985000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.818416,0.000000,14.985000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.942997,0.000000,15.109578>}
box{<0,0,-0.304800><0.176182,0.035000,0.304800> rotate<0,-44.996312,0> translate<29.818416,0.000000,14.985000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.818416,0.000000,16.255000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.942997,0.000000,16.130419>}
box{<0,0,-0.304800><0.176184,0.035000,0.304800> rotate<0,44.997030,0> translate<29.818416,0.000000,16.255000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.818416,0.000000,16.255000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.942997,0.000000,16.379578>}
box{<0,0,-0.304800><0.176182,0.035000,0.304800> rotate<0,-44.996312,0> translate<29.818416,0.000000,16.255000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.818416,0.000000,17.525000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.942997,0.000000,17.400419>}
box{<0,0,-0.304800><0.176184,0.035000,0.304800> rotate<0,44.997030,0> translate<29.818416,0.000000,17.525000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.818416,0.000000,17.525000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.942997,0.000000,17.649578>}
box{<0,0,-0.304800><0.176182,0.035000,0.304800> rotate<0,-44.996312,0> translate<29.818416,0.000000,17.525000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.818416,0.000000,18.795000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.942997,0.000000,18.670419>}
box{<0,0,-0.304800><0.176184,0.035000,0.304800> rotate<0,44.997030,0> translate<29.818416,0.000000,18.795000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.818416,0.000000,18.795000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.942997,0.000000,18.919578>}
box{<0,0,-0.304800><0.176182,0.035000,0.304800> rotate<0,-44.996312,0> translate<29.818416,0.000000,18.795000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.854337,0.000000,9.940922>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.882150,0.000000,9.913109>}
box{<0,0,-0.304800><0.039333,0.035000,0.304800> rotate<0,44.997030,0> translate<29.854337,0.000000,9.940922> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.854337,0.000000,9.940922>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.942997,0.000000,10.029578>}
box{<0,0,-0.304800><0.125381,0.035000,0.304800> rotate<0,-44.996020,0> translate<29.854337,0.000000,9.940922> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.882150,0.000000,8.626888>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.955716,0.000000,8.754309>}
box{<0,0,-0.304800><0.147133,0.035000,0.304800> rotate<0,-59.996522,0> translate<29.882150,0.000000,8.626888> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.882150,0.000000,9.913109>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.955716,0.000000,9.785687>}
box{<0,0,-0.304800><0.147133,0.035000,0.304800> rotate<0,59.996522,0> translate<29.882150,0.000000,9.913109> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.896213,0.000000,19.987200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.942997,0.000000,19.940419>}
box{<0,0,-0.304800><0.066161,0.035000,0.304800> rotate<0,44.995117,0> translate<29.896213,0.000000,19.987200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.896213,0.000000,19.987200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.863325,0.000000,19.987200>}
box{<0,0,-0.304800><3.967113,0.035000,0.304800> rotate<0,0.000000,0> translate<29.896213,0.000000,19.987200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.921016,0.000000,18.897600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.687200,0.000000,18.897600>}
box{<0,0,-0.304800><4.766184,0.035000,0.304800> rotate<0,0.000000,0> translate<29.921016,0.000000,18.897600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.942997,0.000000,10.029578>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.942997,0.000000,11.050419>}
box{<0,0,-0.304800><1.020841,0.035000,0.304800> rotate<0,90.000000,0> translate<29.942997,0.000000,11.050419> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.942997,0.000000,10.363200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.687200,0.000000,10.363200>}
box{<0,0,-0.304800><4.744203,0.035000,0.304800> rotate<0,0.000000,0> translate<29.942997,0.000000,10.363200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.942997,0.000000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.687200,0.000000,10.972800>}
box{<0,0,-0.304800><4.744203,0.035000,0.304800> rotate<0,0.000000,0> translate<29.942997,0.000000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.942997,0.000000,11.299578>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.942997,0.000000,12.320419>}
box{<0,0,-0.304800><1.020841,0.035000,0.304800> rotate<0,90.000000,0> translate<29.942997,0.000000,12.320419> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.942997,0.000000,11.582400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.687200,0.000000,11.582400>}
box{<0,0,-0.304800><4.744203,0.035000,0.304800> rotate<0,0.000000,0> translate<29.942997,0.000000,11.582400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.942997,0.000000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.687200,0.000000,12.192000>}
box{<0,0,-0.304800><4.744203,0.035000,0.304800> rotate<0,0.000000,0> translate<29.942997,0.000000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.942997,0.000000,12.569578>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.942997,0.000000,13.590419>}
box{<0,0,-0.304800><1.020841,0.035000,0.304800> rotate<0,90.000000,0> translate<29.942997,0.000000,13.590419> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.942997,0.000000,12.801600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.687200,0.000000,12.801600>}
box{<0,0,-0.304800><4.744203,0.035000,0.304800> rotate<0,0.000000,0> translate<29.942997,0.000000,12.801600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.942997,0.000000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.687200,0.000000,13.411200>}
box{<0,0,-0.304800><4.744203,0.035000,0.304800> rotate<0,0.000000,0> translate<29.942997,0.000000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.942997,0.000000,13.839578>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.942997,0.000000,14.860419>}
box{<0,0,-0.304800><1.020841,0.035000,0.304800> rotate<0,90.000000,0> translate<29.942997,0.000000,14.860419> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.942997,0.000000,14.020800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.687200,0.000000,14.020800>}
box{<0,0,-0.304800><4.744203,0.035000,0.304800> rotate<0,0.000000,0> translate<29.942997,0.000000,14.020800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.942997,0.000000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.687200,0.000000,14.630400>}
box{<0,0,-0.304800><4.744203,0.035000,0.304800> rotate<0,0.000000,0> translate<29.942997,0.000000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.942997,0.000000,15.109578>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.942997,0.000000,16.130419>}
box{<0,0,-0.304800><1.020841,0.035000,0.304800> rotate<0,90.000000,0> translate<29.942997,0.000000,16.130419> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.942997,0.000000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.687200,0.000000,15.240000>}
box{<0,0,-0.304800><4.744203,0.035000,0.304800> rotate<0,0.000000,0> translate<29.942997,0.000000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.942997,0.000000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.687200,0.000000,15.849600>}
box{<0,0,-0.304800><4.744203,0.035000,0.304800> rotate<0,0.000000,0> translate<29.942997,0.000000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.942997,0.000000,16.379578>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.942997,0.000000,17.400419>}
box{<0,0,-0.304800><1.020841,0.035000,0.304800> rotate<0,90.000000,0> translate<29.942997,0.000000,17.400419> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.942997,0.000000,16.459200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.687200,0.000000,16.459200>}
box{<0,0,-0.304800><4.744203,0.035000,0.304800> rotate<0,0.000000,0> translate<29.942997,0.000000,16.459200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.942997,0.000000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.687200,0.000000,17.068800>}
box{<0,0,-0.304800><4.744203,0.035000,0.304800> rotate<0,0.000000,0> translate<29.942997,0.000000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.942997,0.000000,17.649578>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.942997,0.000000,18.670419>}
box{<0,0,-0.304800><1.020841,0.035000,0.304800> rotate<0,90.000000,0> translate<29.942997,0.000000,18.670419> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.942997,0.000000,17.678400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.687200,0.000000,17.678400>}
box{<0,0,-0.304800><4.744203,0.035000,0.304800> rotate<0,0.000000,0> translate<29.942997,0.000000,17.678400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.942997,0.000000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.687200,0.000000,18.288000>}
box{<0,0,-0.304800><4.744203,0.035000,0.304800> rotate<0,0.000000,0> translate<29.942997,0.000000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.942997,0.000000,18.919578>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.942997,0.000000,19.940419>}
box{<0,0,-0.304800><1.020841,0.035000,0.304800> rotate<0,90.000000,0> translate<29.942997,0.000000,19.940419> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.942997,0.000000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.343325,0.000000,19.507200>}
box{<0,0,-0.304800><4.400328,0.035000,0.304800> rotate<0,0.000000,0> translate<29.942997,0.000000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.955716,0.000000,8.754309>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.993797,0.000000,8.896431>}
box{<0,0,-0.304800><0.147135,0.035000,0.304800> rotate<0,-74.995122,0> translate<29.955716,0.000000,8.754309> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.955716,0.000000,9.785687>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.993797,0.000000,9.643566>}
box{<0,0,-0.304800><0.147135,0.035000,0.304800> rotate<0,74.995122,0> translate<29.955716,0.000000,9.785687> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.964316,0.000000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.687200,0.000000,9.753600>}
box{<0,0,-0.304800><4.722884,0.035000,0.304800> rotate<0,0.000000,0> translate<29.964316,0.000000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.993797,0.000000,8.896431>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.993797,0.000000,9.269981>}
box{<0,0,-0.304800><0.373550,0.035000,0.304800> rotate<0,90.000000,0> translate<29.993797,0.000000,9.269981> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.993797,0.000000,9.144000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.006525,0.000000,9.144000>}
box{<0,0,-0.304800><5.012728,0.035000,0.304800> rotate<0,0.000000,0> translate<29.993797,0.000000,9.144000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.993797,0.000000,9.270012>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.993797,0.000000,9.643566>}
box{<0,0,-0.304800><0.373553,0.035000,0.304800> rotate<0,90.000000,0> translate<29.993797,0.000000,9.643566> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.863325,0.000000,19.987200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.687200,0.000000,19.163325>}
box{<0,0,-0.304800><1.165135,0.035000,0.304800> rotate<0,44.997030,0> translate<33.863325,0.000000,19.987200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.361675,0.000000,21.612797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.660412,0.000000,21.489056>}
box{<0,0,-0.304800><0.323351,0.035000,0.304800> rotate<0,22.498433,0> translate<34.361675,0.000000,21.612797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.660412,0.000000,21.489056>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.155525,0.000000,19.993941>}
box{<0,0,-0.304800><2.114411,0.035000,0.304800> rotate<0,44.997090,0> translate<34.660412,0.000000,21.489056> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.687200,0.000000,9.638322>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.810941,0.000000,9.339584>}
box{<0,0,-0.304800><0.323351,0.035000,0.304800> rotate<0,67.495627,0> translate<34.687200,0.000000,9.638322> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.687200,0.000000,19.163325>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.687200,0.000000,9.638322>}
box{<0,0,-0.304800><9.525003,0.035000,0.304800> rotate<0,-90.000000,0> translate<34.687200,0.000000,9.638322> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.810941,0.000000,9.339584>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.039584,0.000000,9.110941>}
box{<0,0,-0.304800><0.323351,0.035000,0.304800> rotate<0,44.997030,0> translate<34.810941,0.000000,9.339584> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.813469,0.000000,21.336000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.286531,0.000000,21.336000>}
box{<0,0,-0.304800><4.473063,0.035000,0.304800> rotate<0,0.000000,0> translate<34.813469,0.000000,21.336000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.039584,0.000000,9.110941>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.569584,0.000000,8.580941>}
box{<0,0,-0.304800><0.749533,0.035000,0.304800> rotate<0,44.997030,0> translate<35.039584,0.000000,9.110941> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.423069,0.000000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.676931,0.000000,20.726400>}
box{<0,0,-0.304800><3.253863,0.035000,0.304800> rotate<0,0.000000,0> translate<35.423069,0.000000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.569584,0.000000,8.580941>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.868322,0.000000,8.457200>}
box{<0,0,-0.304800><0.323351,0.035000,0.304800> rotate<0,22.498433,0> translate<35.569584,0.000000,8.580941> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.679997,0.000000,28.248863>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.063847,0.000000,27.004447>}
box{<0,0,-0.304800><1.302272,0.035000,0.304800> rotate<0,72.852393,0> translate<35.679997,0.000000,28.248863> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.679997,0.000000,29.551134>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.679997,0.000000,28.248863>}
box{<0,0,-0.304800><1.302272,0.035000,0.304800> rotate<0,-90.000000,0> translate<35.679997,0.000000,28.248863> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.679997,0.000000,29.551134>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.063847,0.000000,30.795547>}
box{<0,0,-0.304800><1.302269,0.035000,0.304800> rotate<0,-72.852352,0> translate<35.679997,0.000000,29.551134> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.868322,0.000000,8.457200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.646675,0.000000,8.457200>}
box{<0,0,-0.304800><1.778353,0.035000,0.304800> rotate<0,0.000000,0> translate<35.868322,0.000000,8.457200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.032669,0.000000,20.116800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.278384,0.000000,20.116800>}
box{<0,0,-0.304800><0.245716,0.035000,0.304800> rotate<0,0.000000,0> translate<36.032669,0.000000,20.116800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.063847,0.000000,27.004447>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.797441,0.000000,25.928459>}
box{<0,0,-0.304800><1.302271,0.035000,0.304800> rotate<0,55.710685,0> translate<36.063847,0.000000,27.004447> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.063847,0.000000,30.795550>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.063847,0.000000,30.795547>}
box{<0,0,-0.304800><0.000003,0.035000,0.304800> rotate<0,-90.000000,0> translate<36.063847,0.000000,30.795547> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.063847,0.000000,30.795550>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.627244,0.000000,31.621903>}
box{<0,0,-0.304800><1.000138,0.035000,0.304800> rotate<0,-55.710663,0> translate<36.063847,0.000000,30.795550> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.155525,0.000000,19.993941>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.399578,0.000000,20.237997>}
box{<0,0,-0.304800><0.345145,0.035000,0.304800> rotate<0,-44.997397,0> translate<36.155525,0.000000,19.993941> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.399578,0.000000,20.237997>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.336738,0.000000,20.237997>}
box{<0,0,-0.304800><0.937159,0.035000,0.304800> rotate<0,0.000000,0> translate<36.399578,0.000000,20.237997> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.797441,0.000000,25.928459>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.797444,0.000000,25.928459>}
box{<0,0,-0.304800><0.000003,0.035000,0.304800> rotate<0,0.000000,0> translate<36.797441,0.000000,25.928459> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.797444,0.000000,25.928459>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.815597,0.000000,25.116509>}
box{<0,0,-0.304800><1.302267,0.035000,0.304800> rotate<0,38.568882,0> translate<36.797444,0.000000,25.928459> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.336738,0.000000,20.237997>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.348322,0.000000,20.242797>}
box{<0,0,-0.304800><0.012539,0.035000,0.304800> rotate<0,-22.505247,0> translate<37.336738,0.000000,20.237997> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.348322,0.000000,20.242797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.193325,0.000000,20.242797>}
box{<0,0,-0.304800><0.845003,0.035000,0.304800> rotate<0,0.000000,0> translate<37.348322,0.000000,20.242797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.646675,0.000000,8.457200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.658262,0.000000,8.462000>}
box{<0,0,-0.304800><0.012542,0.035000,0.304800> rotate<0,-22.499783,0> translate<37.646675,0.000000,8.457200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.658262,0.000000,8.462000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.487200,0.000000,8.462000>}
box{<0,0,-0.304800><0.828938,0.035000,0.304800> rotate<0,0.000000,0> translate<37.658262,0.000000,8.462000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.815597,0.000000,25.116506>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.027847,0.000000,24.640734>}
box{<0,0,-0.304800><1.302271,0.035000,0.304800> rotate<0,21.427108,0> translate<37.815597,0.000000,25.116506> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.815597,0.000000,25.116509>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.815597,0.000000,25.116506>}
box{<0,0,-0.304800><0.000003,0.035000,0.304800> rotate<0,-90.000000,0> translate<37.815597,0.000000,25.116506> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.193325,0.000000,20.242797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.368000,0.000000,23.417469>}
box{<0,0,-0.304800><4.489666,0.035000,0.304800> rotate<0,-44.997002,0> translate<38.193325,0.000000,20.242797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.487200,0.000000,8.138322>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.610941,0.000000,7.839584>}
box{<0,0,-0.304800><0.323351,0.035000,0.304800> rotate<0,67.495627,0> translate<38.487200,0.000000,8.138322> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.487200,0.000000,8.462000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.487200,0.000000,8.138322>}
box{<0,0,-0.304800><0.323678,0.035000,0.304800> rotate<0,-90.000000,0> translate<38.487200,0.000000,8.138322> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.610941,0.000000,7.839584>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.110941,0.000000,5.339584>}
box{<0,0,-0.304800><3.535534,0.035000,0.304800> rotate<0,44.997030,0> translate<38.610941,0.000000,7.839584> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.027847,0.000000,24.640734>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.027850,0.000000,24.640734>}
box{<0,0,-0.304800><0.000003,0.035000,0.304800> rotate<0,0.000000,0> translate<39.027847,0.000000,24.640734> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.027850,0.000000,24.640734>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.326478,0.000000,24.543416>}
box{<0,0,-0.304800><1.302270,0.035000,0.304800> rotate<0,4.285433,0> translate<39.027850,0.000000,24.640734> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.326478,0.000000,24.543416>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.326481,0.000000,24.543416>}
box{<0,0,-0.304800><0.000003,0.035000,0.304800> rotate<0,0.000000,0> translate<40.326478,0.000000,24.543416> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.326481,0.000000,24.543416>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.596097,0.000000,24.833200>}
box{<0,0,-0.304800><1.302267,0.035000,0.304800> rotate<0,-12.856418,0> translate<40.326481,0.000000,24.543416> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.344934,0.000000,14.904531>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.360413,0.000000,14.910941>}
box{<0,0,-0.304800><0.016753,0.035000,0.304800> rotate<0,-22.492593,0> translate<40.344934,0.000000,14.904531> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.344934,0.000000,14.904531>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.439056,0.000000,14.810412>}
box{<0,0,-0.304800><0.133106,0.035000,0.304800> rotate<0,44.996079,0> translate<40.344934,0.000000,14.904531> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.360413,0.000000,14.910941>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.589056,0.000000,15.139584>}
box{<0,0,-0.304800><0.323351,0.035000,0.304800> rotate<0,-44.997030,0> translate<40.360413,0.000000,14.910941> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.439056,0.000000,14.810412>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.006672,0.000000,14.242797>}
box{<0,0,-0.304800><0.802730,0.035000,0.304800> rotate<0,44.997030,0> translate<40.439056,0.000000,14.810412> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.589056,0.000000,15.139584>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.606672,0.000000,15.157200>}
box{<0,0,-0.304800><0.024912,0.035000,0.304800> rotate<0,-44.997030,0> translate<40.589056,0.000000,15.139584> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.606672,0.000000,15.157200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.654750,0.000000,15.157200>}
box{<0,0,-0.304800><1.048078,0.035000,0.304800> rotate<0,0.000000,0> translate<40.606672,0.000000,15.157200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.619069,0.000000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.217359,0.000000,14.630400>}
box{<0,0,-0.304800><1.598291,0.035000,0.304800> rotate<0,0.000000,0> translate<40.619069,0.000000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.632266,0.000000,16.782797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.546672,0.000000,17.697200>}
box{<0,0,-0.304800><1.293164,0.035000,0.304800> rotate<0,-44.996932,0> translate<40.632266,0.000000,16.782797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.632266,0.000000,16.782797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.654750,0.000000,16.782797>}
box{<0,0,-0.304800><1.022484,0.035000,0.304800> rotate<0,0.000000,0> translate<40.632266,0.000000,16.782797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.832266,0.000000,12.617200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.654750,0.000000,12.617200>}
box{<0,0,-0.304800><0.822484,0.035000,0.304800> rotate<0,0.000000,0> translate<40.832266,0.000000,12.617200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.832266,0.000000,12.617200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.700709,0.000000,11.748756>}
box{<0,0,-0.304800><1.228165,0.035000,0.304800> rotate<0,44.997030,0> translate<40.832266,0.000000,12.617200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.918269,0.000000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.972075,0.000000,17.068800>}
box{<0,0,-0.304800><1.053806,0.035000,0.304800> rotate<0,0.000000,0> translate<40.918269,0.000000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.006672,0.000000,14.242797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.654750,0.000000,14.242797>}
box{<0,0,-0.304800><0.648078,0.035000,0.304800> rotate<0,0.000000,0> translate<41.006672,0.000000,14.242797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.110941,0.000000,5.339584>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.339584,0.000000,5.110941>}
box{<0,0,-0.304800><0.323351,0.035000,0.304800> rotate<0,44.997030,0> translate<41.110941,0.000000,5.339584> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.158487,0.000000,7.590981>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.288322,0.000000,7.537200>}
box{<0,0,-0.304800><0.140533,0.035000,0.304800> rotate<0,22.499303,0> translate<41.158487,0.000000,7.590981> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.158487,0.000000,7.590981>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.890709,0.000000,6.858756>}
box{<0,0,-0.304800><1.035520,0.035000,0.304800> rotate<0,44.997152,0> translate<41.158487,0.000000,7.590981> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.257466,0.000000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.308122,0.000000,12.192000>}
box{<0,0,-0.304800><1.050656,0.035000,0.304800> rotate<0,0.000000,0> translate<41.257466,0.000000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.288322,0.000000,7.537200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.654750,0.000000,7.537200>}
box{<0,0,-0.304800><0.366428,0.035000,0.304800> rotate<0,0.000000,0> translate<41.288322,0.000000,7.537200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.339584,0.000000,5.110941>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.638322,0.000000,4.987200>}
box{<0,0,-0.304800><0.323351,0.035000,0.304800> rotate<0,22.498433,0> translate<41.339584,0.000000,5.110941> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.368000,0.000000,23.842619>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.368000,0.000000,23.417469>}
box{<0,0,-0.304800><0.425150,0.035000,0.304800> rotate<0,-90.000000,0> translate<41.368000,0.000000,23.417469> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.368000,0.000000,23.842619>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.561347,0.000000,24.309397>}
box{<0,0,-0.304800><0.505237,0.035000,0.304800> rotate<0,-67.495436,0> translate<41.368000,0.000000,23.842619> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.412797,0.000000,9.536672>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.412797,0.000000,10.077200>}
box{<0,0,-0.304800><0.540528,0.035000,0.304800> rotate<0,90.000000,0> translate<41.412797,0.000000,10.077200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.412797,0.000000,9.536672>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.720709,0.000000,9.228756>}
box{<0,0,-0.304800><0.435456,0.035000,0.304800> rotate<0,44.997321,0> translate<41.412797,0.000000,9.536672> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.412797,0.000000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.062841,0.000000,9.753600>}
box{<0,0,-0.304800><0.650044,0.035000,0.304800> rotate<0,0.000000,0> translate<41.412797,0.000000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.412797,0.000000,10.077200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.654750,0.000000,10.077200>}
box{<0,0,-0.304800><0.241953,0.035000,0.304800> rotate<0,0.000000,0> translate<41.412797,0.000000,10.077200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.434269,0.000000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.876747,0.000000,7.315200>}
box{<0,0,-0.304800><0.442478,0.035000,0.304800> rotate<0,0.000000,0> translate<41.434269,0.000000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.472266,0.000000,19.322797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.654750,0.000000,19.322797>}
box{<0,0,-0.304800><0.182484,0.035000,0.304800> rotate<0,0.000000,0> translate<41.472266,0.000000,19.322797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.472266,0.000000,19.322797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.063003,0.000000,19.913534>}
box{<0,0,-0.304800><0.835429,0.035000,0.304800> rotate<0,-44.997030,0> translate<41.472266,0.000000,19.322797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.527869,0.000000,17.678400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.673547,0.000000,17.678400>}
box{<0,0,-0.304800><0.145678,0.035000,0.304800> rotate<0,0.000000,0> translate<41.527869,0.000000,17.678400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.546672,0.000000,17.697200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.654750,0.000000,17.697200>}
box{<0,0,-0.304800><0.108078,0.035000,0.304800> rotate<0,0.000000,0> translate<41.546672,0.000000,17.697200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.561347,0.000000,24.309397>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.918600,0.000000,24.666650>}
box{<0,0,-0.304800><0.505232,0.035000,0.304800> rotate<0,-44.997030,0> translate<41.561347,0.000000,24.309397> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.596097,0.000000,24.833200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.596100,0.000000,24.833200>}
box{<0,0,-0.304800><0.000003,0.035000,0.304800> rotate<0,0.000000,0> translate<41.596097,0.000000,24.833200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.596100,0.000000,24.833200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.723897,0.000000,25.484334>}
box{<0,0,-0.304800><1.302268,0.035000,0.304800> rotate<0,-29.998041,0> translate<41.596100,0.000000,24.833200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.638322,0.000000,4.987200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.664750,0.000000,4.987200>}
box{<0,0,-0.304800><0.026428,0.035000,0.304800> rotate<0,0.000000,0> translate<41.638322,0.000000,4.987200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.654750,0.000000,7.537200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.918600,0.000000,7.273347>}
box{<0,0,-0.304800><0.373142,0.035000,0.304800> rotate<0,44.997369,0> translate<41.654750,0.000000,7.537200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.654750,0.000000,10.077200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.918600,0.000000,9.813347>}
box{<0,0,-0.304800><0.373142,0.035000,0.304800> rotate<0,44.997369,0> translate<41.654750,0.000000,10.077200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.654750,0.000000,12.617200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.918600,0.000000,12.353347>}
box{<0,0,-0.304800><0.373142,0.035000,0.304800> rotate<0,44.997369,0> translate<41.654750,0.000000,12.617200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.654750,0.000000,14.242797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.918600,0.000000,14.506650>}
box{<0,0,-0.304800><0.373142,0.035000,0.304800> rotate<0,-44.997369,0> translate<41.654750,0.000000,14.242797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.654750,0.000000,15.157200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.918600,0.000000,14.893347>}
box{<0,0,-0.304800><0.373142,0.035000,0.304800> rotate<0,44.997369,0> translate<41.654750,0.000000,15.157200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.654750,0.000000,16.782797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.918600,0.000000,17.046650>}
box{<0,0,-0.304800><0.373142,0.035000,0.304800> rotate<0,-44.997369,0> translate<41.654750,0.000000,16.782797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.654750,0.000000,17.697200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.918600,0.000000,17.433347>}
box{<0,0,-0.304800><0.373142,0.035000,0.304800> rotate<0,44.997369,0> translate<41.654750,0.000000,17.697200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.654750,0.000000,19.322797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.918600,0.000000,19.586650>}
box{<0,0,-0.304800><0.373142,0.035000,0.304800> rotate<0,-44.997369,0> translate<41.654750,0.000000,19.322797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.656669,0.000000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.839153,0.000000,19.507200>}
box{<0,0,-0.304800><0.182484,0.035000,0.304800> rotate<0,0.000000,0> translate<41.656669,0.000000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.664750,0.000000,4.987200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.918600,0.000000,4.733347>}
box{<0,0,-0.304800><0.359000,0.035000,0.304800> rotate<0,44.997383,0> translate<41.664750,0.000000,4.987200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.700709,0.000000,11.748756>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.918600,0.000000,11.966650>}
box{<0,0,-0.304800><0.308146,0.035000,0.304800> rotate<0,-44.997441,0> translate<41.700709,0.000000,11.748756> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.720709,0.000000,9.228756>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.918600,0.000000,9.426650>}
box{<0,0,-0.304800><0.279862,0.035000,0.304800> rotate<0,-44.997483,0> translate<41.720709,0.000000,9.228756> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.873919,0.000000,24.993600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.579200,0.000000,24.993600>}
box{<0,0,-0.304800><3.705281,0.035000,0.304800> rotate<0,0.000000,0> translate<41.873919,0.000000,24.993600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.890709,0.000000,6.858756>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.918600,0.000000,6.886650>}
box{<0,0,-0.304800><0.039446,0.035000,0.304800> rotate<0,-45.000240,0> translate<41.890709,0.000000,6.858756> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.918600,0.000000,4.733347>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.385378,0.000000,4.540000>}
box{<0,0,-0.304800><0.505237,0.035000,0.304800> rotate<0,22.498625,0> translate<41.918600,0.000000,4.733347> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.918600,0.000000,6.886650>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.385378,0.000000,7.079997>}
box{<0,0,-0.304800><0.505237,0.035000,0.304800> rotate<0,-22.498625,0> translate<41.918600,0.000000,6.886650> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.918600,0.000000,7.273347>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.385378,0.000000,7.080000>}
box{<0,0,-0.304800><0.505237,0.035000,0.304800> rotate<0,22.498625,0> translate<41.918600,0.000000,7.273347> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.918600,0.000000,9.426650>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.385378,0.000000,9.619997>}
box{<0,0,-0.304800><0.505237,0.035000,0.304800> rotate<0,-22.498625,0> translate<41.918600,0.000000,9.426650> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.918600,0.000000,9.813347>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.385378,0.000000,9.620000>}
box{<0,0,-0.304800><0.505237,0.035000,0.304800> rotate<0,22.498625,0> translate<41.918600,0.000000,9.813347> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.918600,0.000000,11.966650>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.385378,0.000000,12.159997>}
box{<0,0,-0.304800><0.505237,0.035000,0.304800> rotate<0,-22.498625,0> translate<41.918600,0.000000,11.966650> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.918600,0.000000,12.353347>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.385378,0.000000,12.160000>}
box{<0,0,-0.304800><0.505237,0.035000,0.304800> rotate<0,22.498625,0> translate<41.918600,0.000000,12.353347> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.918600,0.000000,14.506650>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.385378,0.000000,14.699997>}
box{<0,0,-0.304800><0.505237,0.035000,0.304800> rotate<0,-22.498625,0> translate<41.918600,0.000000,14.506650> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.918600,0.000000,14.893347>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.385378,0.000000,14.700000>}
box{<0,0,-0.304800><0.505237,0.035000,0.304800> rotate<0,22.498625,0> translate<41.918600,0.000000,14.893347> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.918600,0.000000,17.046650>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.385378,0.000000,17.239997>}
box{<0,0,-0.304800><0.505237,0.035000,0.304800> rotate<0,-22.498625,0> translate<41.918600,0.000000,17.046650> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.918600,0.000000,17.433347>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.385378,0.000000,17.240000>}
box{<0,0,-0.304800><0.505237,0.035000,0.304800> rotate<0,22.498625,0> translate<41.918600,0.000000,17.433347> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.918600,0.000000,19.586650>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.385378,0.000000,19.779997>}
box{<0,0,-0.304800><0.505237,0.035000,0.304800> rotate<0,-22.498625,0> translate<41.918600,0.000000,19.586650> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.918600,0.000000,24.666650>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.385378,0.000000,24.859997>}
box{<0,0,-0.304800><0.505237,0.035000,0.304800> rotate<0,-22.498625,0> translate<41.918600,0.000000,24.666650> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.063003,0.000000,19.913534>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.385378,0.000000,19.780000>}
box{<0,0,-0.304800><0.348937,0.035000,0.304800> rotate<0,22.498861,0> translate<42.063003,0.000000,19.913534> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.385378,0.000000,4.540000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.414619,0.000000,4.540000>}
box{<0,0,-0.304800><2.029241,0.035000,0.304800> rotate<0,0.000000,0> translate<42.385378,0.000000,4.540000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.385378,0.000000,7.079997>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.414619,0.000000,7.079997>}
box{<0,0,-0.304800><2.029241,0.035000,0.304800> rotate<0,0.000000,0> translate<42.385378,0.000000,7.079997> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.385378,0.000000,7.080000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.414619,0.000000,7.080000>}
box{<0,0,-0.304800><2.029241,0.035000,0.304800> rotate<0,0.000000,0> translate<42.385378,0.000000,7.080000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.385378,0.000000,9.619997>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.414619,0.000000,9.619997>}
box{<0,0,-0.304800><2.029241,0.035000,0.304800> rotate<0,0.000000,0> translate<42.385378,0.000000,9.619997> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.385378,0.000000,9.620000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.414619,0.000000,9.620000>}
box{<0,0,-0.304800><2.029241,0.035000,0.304800> rotate<0,0.000000,0> translate<42.385378,0.000000,9.620000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.385378,0.000000,12.159997>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.414619,0.000000,12.159997>}
box{<0,0,-0.304800><2.029241,0.035000,0.304800> rotate<0,0.000000,0> translate<42.385378,0.000000,12.159997> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.385378,0.000000,12.160000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.414619,0.000000,12.160000>}
box{<0,0,-0.304800><2.029241,0.035000,0.304800> rotate<0,0.000000,0> translate<42.385378,0.000000,12.160000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.385378,0.000000,14.699997>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.414619,0.000000,14.699997>}
box{<0,0,-0.304800><2.029241,0.035000,0.304800> rotate<0,0.000000,0> translate<42.385378,0.000000,14.699997> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.385378,0.000000,14.700000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.414619,0.000000,14.700000>}
box{<0,0,-0.304800><2.029241,0.035000,0.304800> rotate<0,0.000000,0> translate<42.385378,0.000000,14.700000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.385378,0.000000,17.239997>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.414619,0.000000,17.239997>}
box{<0,0,-0.304800><2.029241,0.035000,0.304800> rotate<0,0.000000,0> translate<42.385378,0.000000,17.239997> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.385378,0.000000,17.240000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.414619,0.000000,17.240000>}
box{<0,0,-0.304800><2.029241,0.035000,0.304800> rotate<0,0.000000,0> translate<42.385378,0.000000,17.240000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.385378,0.000000,19.779997>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.414619,0.000000,19.779997>}
box{<0,0,-0.304800><2.029241,0.035000,0.304800> rotate<0,0.000000,0> translate<42.385378,0.000000,19.779997> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.385378,0.000000,19.780000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.414619,0.000000,19.780000>}
box{<0,0,-0.304800><2.029241,0.035000,0.304800> rotate<0,0.000000,0> translate<42.385378,0.000000,19.780000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.385378,0.000000,24.859997>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.414619,0.000000,24.859997>}
box{<0,0,-0.304800><2.029241,0.035000,0.304800> rotate<0,0.000000,0> translate<42.385378,0.000000,24.859997> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.569466,0.000000,22.319997>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.569469,0.000000,22.320000>}
box{<0,0,-0.304800><0.000004,0.035000,0.304800> rotate<0,-44.997030,0> translate<42.569466,0.000000,22.319997> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.569466,0.000000,22.319997>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.414619,0.000000,22.319997>}
box{<0,0,-0.304800><1.845153,0.035000,0.304800> rotate<0,0.000000,0> translate<42.569466,0.000000,22.319997> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.569469,0.000000,22.320000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.414619,0.000000,22.320000>}
box{<0,0,-0.304800><1.845150,0.035000,0.304800> rotate<0,0.000000,0> translate<42.569469,0.000000,22.320000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.723897,0.000000,25.484334>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.723900,0.000000,25.484334>}
box{<0,0,-0.304800><0.000003,0.035000,0.304800> rotate<0,0.000000,0> translate<42.723897,0.000000,25.484334> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.723900,0.000000,25.484334>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.609669,0.000000,26.438966>}
box{<0,0,-0.304800><1.302270,0.035000,0.304800> rotate<0,-47.139733,0> translate<42.723900,0.000000,25.484334> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.834191,0.000000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.579200,0.000000,25.603200>}
box{<0,0,-0.304800><2.745009,0.035000,0.304800> rotate<0,0.000000,0> translate<42.834191,0.000000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.380975,0.000000,31.607503>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.609669,0.000000,31.361031>}
box{<0,0,-0.304800><0.336228,0.035000,0.304800> rotate<0,47.139587,0> translate<43.380975,0.000000,31.607503> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.380975,0.000000,31.607503>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.579200,0.000000,31.602816>}
box{<0,0,-0.304800><2.198230,0.035000,0.304800> rotate<0,0.122169,0> translate<43.380975,0.000000,31.607503> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.399816,0.000000,26.212800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.579200,0.000000,26.212800>}
box{<0,0,-0.304800><2.179384,0.035000,0.304800> rotate<0,0.000000,0> translate<43.399816,0.000000,26.212800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.609669,0.000000,26.438966>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.609669,0.000000,26.438969>}
box{<0,0,-0.304800><0.000003,0.035000,0.304800> rotate<0,90.000000,0> translate<43.609669,0.000000,26.438969> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.609669,0.000000,26.438969>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.174703,0.000000,27.612272>}
box{<0,0,-0.304800><1.302269,0.035000,0.304800> rotate<0,-64.281417,0> translate<43.609669,0.000000,26.438969> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.609669,0.000000,31.361028>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.609669,0.000000,31.361031>}
box{<0,0,-0.304800><0.000003,0.035000,0.304800> rotate<0,90.000000,0> translate<43.609669,0.000000,31.361031> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.609669,0.000000,31.361028>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.174703,0.000000,30.187725>}
box{<0,0,-0.304800><1.302269,0.035000,0.304800> rotate<0,64.281417,0> translate<43.609669,0.000000,31.361028> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.740384,0.000000,31.089600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.579200,0.000000,31.089600>}
box{<0,0,-0.304800><1.838816,0.035000,0.304800> rotate<0,0.000000,0> translate<43.740384,0.000000,31.089600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.794319,0.000000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.579200,0.000000,26.822400>}
box{<0,0,-0.304800><1.784881,0.035000,0.304800> rotate<0,0.000000,0> translate<43.794319,0.000000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.033953,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.579200,0.000000,30.480000>}
box{<0,0,-0.304800><1.545247,0.035000,0.304800> rotate<0,0.000000,0> translate<44.033953,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.087888,0.000000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.579200,0.000000,27.432000>}
box{<0,0,-0.304800><1.491312,0.035000,0.304800> rotate<0,0.000000,0> translate<44.087888,0.000000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.174703,0.000000,27.612272>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.174703,0.000000,27.612275>}
box{<0,0,-0.304800><0.000003,0.035000,0.304800> rotate<0,90.000000,0> translate<44.174703,0.000000,27.612275> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.174703,0.000000,27.612275>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.368797,0.000000,28.900000>}
box{<0,0,-0.304800><1.302270,0.035000,0.304800> rotate<0,-81.423179,0> translate<44.174703,0.000000,27.612275> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.174703,0.000000,30.187722>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.174703,0.000000,30.187725>}
box{<0,0,-0.304800><0.000003,0.035000,0.304800> rotate<0,90.000000,0> translate<44.174703,0.000000,30.187725> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.174703,0.000000,30.187722>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.368797,0.000000,28.900000>}
box{<0,0,-0.304800><1.302267,0.035000,0.304800> rotate<0,81.423158,0> translate<44.174703,0.000000,30.187722> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.222534,0.000000,29.870400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.579200,0.000000,29.870400>}
box{<0,0,-0.304800><1.356666,0.035000,0.304800> rotate<0,0.000000,0> translate<44.222534,0.000000,29.870400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.239413,0.000000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.579200,0.000000,28.041600>}
box{<0,0,-0.304800><1.339787,0.035000,0.304800> rotate<0,0.000000,0> translate<44.239413,0.000000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.314416,0.000000,29.260800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.579200,0.000000,29.260800>}
box{<0,0,-0.304800><1.264784,0.035000,0.304800> rotate<0,0.000000,0> translate<44.314416,0.000000,29.260800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.331294,0.000000,28.651200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.579200,0.000000,28.651200>}
box{<0,0,-0.304800><1.247906,0.035000,0.304800> rotate<0,0.000000,0> translate<44.331294,0.000000,28.651200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.414619,0.000000,4.540000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.881397,0.000000,4.733347>}
box{<0,0,-0.304800><0.505237,0.035000,0.304800> rotate<0,-22.498625,0> translate<44.414619,0.000000,4.540000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.414619,0.000000,7.079997>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.881397,0.000000,6.886650>}
box{<0,0,-0.304800><0.505237,0.035000,0.304800> rotate<0,22.498625,0> translate<44.414619,0.000000,7.079997> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.414619,0.000000,7.080000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.881397,0.000000,7.273347>}
box{<0,0,-0.304800><0.505237,0.035000,0.304800> rotate<0,-22.498625,0> translate<44.414619,0.000000,7.080000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.414619,0.000000,9.619997>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.881397,0.000000,9.426650>}
box{<0,0,-0.304800><0.505237,0.035000,0.304800> rotate<0,22.498625,0> translate<44.414619,0.000000,9.619997> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.414619,0.000000,9.620000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.881397,0.000000,9.813347>}
box{<0,0,-0.304800><0.505237,0.035000,0.304800> rotate<0,-22.498625,0> translate<44.414619,0.000000,9.620000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.414619,0.000000,12.159997>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.881397,0.000000,11.966650>}
box{<0,0,-0.304800><0.505237,0.035000,0.304800> rotate<0,22.498625,0> translate<44.414619,0.000000,12.159997> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.414619,0.000000,12.160000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.881397,0.000000,12.353347>}
box{<0,0,-0.304800><0.505237,0.035000,0.304800> rotate<0,-22.498625,0> translate<44.414619,0.000000,12.160000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.414619,0.000000,14.699997>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.881397,0.000000,14.506650>}
box{<0,0,-0.304800><0.505237,0.035000,0.304800> rotate<0,22.498625,0> translate<44.414619,0.000000,14.699997> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.414619,0.000000,14.700000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.881397,0.000000,14.893347>}
box{<0,0,-0.304800><0.505237,0.035000,0.304800> rotate<0,-22.498625,0> translate<44.414619,0.000000,14.700000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.414619,0.000000,17.239997>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.881397,0.000000,17.046650>}
box{<0,0,-0.304800><0.505237,0.035000,0.304800> rotate<0,22.498625,0> translate<44.414619,0.000000,17.239997> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.414619,0.000000,17.240000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.881397,0.000000,17.433347>}
box{<0,0,-0.304800><0.505237,0.035000,0.304800> rotate<0,-22.498625,0> translate<44.414619,0.000000,17.240000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.414619,0.000000,19.779997>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.881397,0.000000,19.586650>}
box{<0,0,-0.304800><0.505237,0.035000,0.304800> rotate<0,22.498625,0> translate<44.414619,0.000000,19.779997> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.414619,0.000000,19.780000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.881397,0.000000,19.973347>}
box{<0,0,-0.304800><0.505237,0.035000,0.304800> rotate<0,-22.498625,0> translate<44.414619,0.000000,19.780000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.414619,0.000000,22.319997>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.881397,0.000000,22.126650>}
box{<0,0,-0.304800><0.505237,0.035000,0.304800> rotate<0,22.498625,0> translate<44.414619,0.000000,22.319997> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.414619,0.000000,22.320000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.881397,0.000000,22.513347>}
box{<0,0,-0.304800><0.505237,0.035000,0.304800> rotate<0,-22.498625,0> translate<44.414619,0.000000,22.320000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.414619,0.000000,24.859997>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.881397,0.000000,24.666650>}
box{<0,0,-0.304800><0.505237,0.035000,0.304800> rotate<0,22.498625,0> translate<44.414619,0.000000,24.859997> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.491872,0.000000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.579200,0.000000,12.192000>}
box{<0,0,-0.304800><1.087328,0.035000,0.304800> rotate<0,0.000000,0> translate<44.491872,0.000000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.582641,0.000000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.579200,0.000000,14.630400>}
box{<0,0,-0.304800><0.996559,0.035000,0.304800> rotate<0,0.000000,0> translate<44.582641,0.000000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.737153,0.000000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.579200,0.000000,9.753600>}
box{<0,0,-0.304800><0.842047,0.035000,0.304800> rotate<0,0.000000,0> translate<44.737153,0.000000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.827925,0.000000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.579200,0.000000,17.068800>}
box{<0,0,-0.304800><0.751275,0.035000,0.304800> rotate<0,0.000000,0> translate<44.827925,0.000000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.881397,0.000000,4.733347>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.238650,0.000000,5.090600>}
box{<0,0,-0.304800><0.505232,0.035000,0.304800> rotate<0,-44.997030,0> translate<44.881397,0.000000,4.733347> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.881397,0.000000,6.886650>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.238650,0.000000,6.529397>}
box{<0,0,-0.304800><0.505232,0.035000,0.304800> rotate<0,44.997030,0> translate<44.881397,0.000000,6.886650> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.881397,0.000000,7.273347>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.238650,0.000000,7.630600>}
box{<0,0,-0.304800><0.505232,0.035000,0.304800> rotate<0,-44.997030,0> translate<44.881397,0.000000,7.273347> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.881397,0.000000,9.426650>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.238650,0.000000,9.069397>}
box{<0,0,-0.304800><0.505232,0.035000,0.304800> rotate<0,44.997030,0> translate<44.881397,0.000000,9.426650> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.881397,0.000000,9.813347>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.238650,0.000000,10.170600>}
box{<0,0,-0.304800><0.505232,0.035000,0.304800> rotate<0,-44.997030,0> translate<44.881397,0.000000,9.813347> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.881397,0.000000,11.966650>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.238650,0.000000,11.609397>}
box{<0,0,-0.304800><0.505232,0.035000,0.304800> rotate<0,44.997030,0> translate<44.881397,0.000000,11.966650> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.881397,0.000000,12.353347>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.238650,0.000000,12.710600>}
box{<0,0,-0.304800><0.505232,0.035000,0.304800> rotate<0,-44.997030,0> translate<44.881397,0.000000,12.353347> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.881397,0.000000,14.506650>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.238650,0.000000,14.149397>}
box{<0,0,-0.304800><0.505232,0.035000,0.304800> rotate<0,44.997030,0> translate<44.881397,0.000000,14.506650> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.881397,0.000000,14.893347>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.238650,0.000000,15.250600>}
box{<0,0,-0.304800><0.505232,0.035000,0.304800> rotate<0,-44.997030,0> translate<44.881397,0.000000,14.893347> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.881397,0.000000,17.046650>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.238650,0.000000,16.689397>}
box{<0,0,-0.304800><0.505232,0.035000,0.304800> rotate<0,44.997030,0> translate<44.881397,0.000000,17.046650> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.881397,0.000000,17.433347>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.238650,0.000000,17.790600>}
box{<0,0,-0.304800><0.505232,0.035000,0.304800> rotate<0,-44.997030,0> translate<44.881397,0.000000,17.433347> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.881397,0.000000,19.586650>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.238650,0.000000,19.229397>}
box{<0,0,-0.304800><0.505232,0.035000,0.304800> rotate<0,44.997030,0> translate<44.881397,0.000000,19.586650> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.881397,0.000000,19.973347>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.238650,0.000000,20.330600>}
box{<0,0,-0.304800><0.505232,0.035000,0.304800> rotate<0,-44.997030,0> translate<44.881397,0.000000,19.973347> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.881397,0.000000,22.126650>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.238650,0.000000,21.769397>}
box{<0,0,-0.304800><0.505232,0.035000,0.304800> rotate<0,44.997030,0> translate<44.881397,0.000000,22.126650> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.881397,0.000000,22.513347>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.238650,0.000000,22.870600>}
box{<0,0,-0.304800><0.505232,0.035000,0.304800> rotate<0,-44.997030,0> translate<44.881397,0.000000,22.513347> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.881397,0.000000,24.666650>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.238650,0.000000,24.309397>}
box{<0,0,-0.304800><0.505232,0.035000,0.304800> rotate<0,44.997030,0> translate<44.881397,0.000000,24.666650> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.923250,0.000000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.579200,0.000000,7.315200>}
box{<0,0,-0.304800><0.655950,0.035000,0.304800> rotate<0,0.000000,0> translate<44.923250,0.000000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.923250,0.000000,22.555200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.579200,0.000000,22.555200>}
box{<0,0,-0.304800><0.655950,0.035000,0.304800> rotate<0,0.000000,0> translate<44.923250,0.000000,22.555200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.960847,0.000000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.579200,0.000000,19.507200>}
box{<0,0,-0.304800><0.618353,0.035000,0.304800> rotate<0,0.000000,0> translate<44.960847,0.000000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.024850,0.000000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.579200,0.000000,4.876800>}
box{<0,0,-0.304800><0.554350,0.035000,0.304800> rotate<0,0.000000,0> translate<45.024850,0.000000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.024850,0.000000,20.116800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.579200,0.000000,20.116800>}
box{<0,0,-0.304800><0.554350,0.035000,0.304800> rotate<0,0.000000,0> translate<45.024850,0.000000,20.116800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.062447,0.000000,6.705600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.579200,0.000000,6.705600>}
box{<0,0,-0.304800><0.516753,0.035000,0.304800> rotate<0,0.000000,0> translate<45.062447,0.000000,6.705600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.062447,0.000000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.579200,0.000000,21.945600>}
box{<0,0,-0.304800><0.516753,0.035000,0.304800> rotate<0,0.000000,0> translate<45.062447,0.000000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.126450,0.000000,17.678400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.579200,0.000000,17.678400>}
box{<0,0,-0.304800><0.452750,0.035000,0.304800> rotate<0,0.000000,0> translate<45.126450,0.000000,17.678400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.164047,0.000000,9.144000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.579200,0.000000,9.144000>}
box{<0,0,-0.304800><0.415153,0.035000,0.304800> rotate<0,0.000000,0> translate<45.164047,0.000000,9.144000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.164047,0.000000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.579200,0.000000,24.384000>}
box{<0,0,-0.304800><0.415153,0.035000,0.304800> rotate<0,0.000000,0> translate<45.164047,0.000000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.228050,0.000000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.579200,0.000000,15.240000>}
box{<0,0,-0.304800><0.351150,0.035000,0.304800> rotate<0,0.000000,0> translate<45.228050,0.000000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.238650,0.000000,5.090600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.431997,0.000000,5.557378>}
box{<0,0,-0.304800><0.505237,0.035000,0.304800> rotate<0,-67.495436,0> translate<45.238650,0.000000,5.090600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.238650,0.000000,6.529397>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.431997,0.000000,6.062619>}
box{<0,0,-0.304800><0.505237,0.035000,0.304800> rotate<0,67.495436,0> translate<45.238650,0.000000,6.529397> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.238650,0.000000,7.630600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.431997,0.000000,8.097378>}
box{<0,0,-0.304800><0.505237,0.035000,0.304800> rotate<0,-67.495436,0> translate<45.238650,0.000000,7.630600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.238650,0.000000,9.069397>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.431997,0.000000,8.602619>}
box{<0,0,-0.304800><0.505237,0.035000,0.304800> rotate<0,67.495436,0> translate<45.238650,0.000000,9.069397> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.238650,0.000000,10.170600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.431997,0.000000,10.637378>}
box{<0,0,-0.304800><0.505237,0.035000,0.304800> rotate<0,-67.495436,0> translate<45.238650,0.000000,10.170600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.238650,0.000000,11.609397>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.431997,0.000000,11.142619>}
box{<0,0,-0.304800><0.505237,0.035000,0.304800> rotate<0,67.495436,0> translate<45.238650,0.000000,11.609397> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.238650,0.000000,12.710600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.431997,0.000000,13.177378>}
box{<0,0,-0.304800><0.505237,0.035000,0.304800> rotate<0,-67.495436,0> translate<45.238650,0.000000,12.710600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.238650,0.000000,14.149397>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.431997,0.000000,13.682619>}
box{<0,0,-0.304800><0.505237,0.035000,0.304800> rotate<0,67.495436,0> translate<45.238650,0.000000,14.149397> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.238650,0.000000,15.250600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.431997,0.000000,15.717378>}
box{<0,0,-0.304800><0.505237,0.035000,0.304800> rotate<0,-67.495436,0> translate<45.238650,0.000000,15.250600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.238650,0.000000,16.689397>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.431997,0.000000,16.222619>}
box{<0,0,-0.304800><0.505237,0.035000,0.304800> rotate<0,67.495436,0> translate<45.238650,0.000000,16.689397> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.238650,0.000000,17.790600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.431997,0.000000,18.257378>}
box{<0,0,-0.304800><0.505237,0.035000,0.304800> rotate<0,-67.495436,0> translate<45.238650,0.000000,17.790600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.238650,0.000000,19.229397>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.431997,0.000000,18.762619>}
box{<0,0,-0.304800><0.505237,0.035000,0.304800> rotate<0,67.495436,0> translate<45.238650,0.000000,19.229397> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.238650,0.000000,20.330600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.431997,0.000000,20.797378>}
box{<0,0,-0.304800><0.505237,0.035000,0.304800> rotate<0,-67.495436,0> translate<45.238650,0.000000,20.330600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.238650,0.000000,21.769397>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.431997,0.000000,21.302619>}
box{<0,0,-0.304800><0.505237,0.035000,0.304800> rotate<0,67.495436,0> translate<45.238650,0.000000,21.769397> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.238650,0.000000,22.870600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.431997,0.000000,23.337378>}
box{<0,0,-0.304800><0.505237,0.035000,0.304800> rotate<0,-67.495436,0> translate<45.238650,0.000000,22.870600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.238650,0.000000,24.309397>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.431997,0.000000,23.842619>}
box{<0,0,-0.304800><0.505237,0.035000,0.304800> rotate<0,67.495436,0> translate<45.238650,0.000000,24.309397> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.249834,0.000000,11.582400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.579200,0.000000,11.582400>}
box{<0,0,-0.304800><0.329366,0.035000,0.304800> rotate<0,0.000000,0> translate<45.249834,0.000000,11.582400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.276341,0.000000,12.801600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.579200,0.000000,12.801600>}
box{<0,0,-0.304800><0.302859,0.035000,0.304800> rotate<0,0.000000,0> translate<45.276341,0.000000,12.801600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.291919,0.000000,14.020800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.579200,0.000000,14.020800>}
box{<0,0,-0.304800><0.287281,0.035000,0.304800> rotate<0,0.000000,0> translate<45.291919,0.000000,14.020800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.318425,0.000000,10.363200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.579200,0.000000,10.363200>}
box{<0,0,-0.304800><0.260775,0.035000,0.304800> rotate<0,0.000000,0> translate<45.318425,0.000000,10.363200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.334003,0.000000,16.459200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.579200,0.000000,16.459200>}
box{<0,0,-0.304800><0.245197,0.035000,0.304800> rotate<0,0.000000,0> translate<45.334003,0.000000,16.459200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.360509,0.000000,7.924800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.579200,0.000000,7.924800>}
box{<0,0,-0.304800><0.218691,0.035000,0.304800> rotate<0,0.000000,0> translate<45.360509,0.000000,7.924800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.360509,0.000000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.579200,0.000000,23.164800>}
box{<0,0,-0.304800><0.218691,0.035000,0.304800> rotate<0,0.000000,0> translate<45.360509,0.000000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.376088,0.000000,18.897600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.579200,0.000000,18.897600>}
box{<0,0,-0.304800><0.203112,0.035000,0.304800> rotate<0,0.000000,0> translate<45.376088,0.000000,18.897600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.402594,0.000000,5.486400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.579200,0.000000,5.486400>}
box{<0,0,-0.304800><0.176606,0.035000,0.304800> rotate<0,0.000000,0> translate<45.402594,0.000000,5.486400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.402594,0.000000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.579200,0.000000,20.726400>}
box{<0,0,-0.304800><0.176606,0.035000,0.304800> rotate<0,0.000000,0> translate<45.402594,0.000000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.418172,0.000000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.579200,0.000000,6.096000>}
box{<0,0,-0.304800><0.161028,0.035000,0.304800> rotate<0,0.000000,0> translate<45.418172,0.000000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.418172,0.000000,21.336000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.579200,0.000000,21.336000>}
box{<0,0,-0.304800><0.161028,0.035000,0.304800> rotate<0,0.000000,0> translate<45.418172,0.000000,21.336000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.431997,0.000000,5.557378>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.431997,0.000000,6.062619>}
box{<0,0,-0.304800><0.505241,0.035000,0.304800> rotate<0,90.000000,0> translate<45.431997,0.000000,6.062619> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.431997,0.000000,8.097378>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.431997,0.000000,8.602619>}
box{<0,0,-0.304800><0.505241,0.035000,0.304800> rotate<0,90.000000,0> translate<45.431997,0.000000,8.602619> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.431997,0.000000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.579200,0.000000,8.534400>}
box{<0,0,-0.304800><0.147203,0.035000,0.304800> rotate<0,0.000000,0> translate<45.431997,0.000000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.431997,0.000000,10.637378>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.431997,0.000000,11.142619>}
box{<0,0,-0.304800><0.505241,0.035000,0.304800> rotate<0,90.000000,0> translate<45.431997,0.000000,11.142619> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.431997,0.000000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.579200,0.000000,10.972800>}
box{<0,0,-0.304800><0.147203,0.035000,0.304800> rotate<0,0.000000,0> translate<45.431997,0.000000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.431997,0.000000,13.177378>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.431997,0.000000,13.682619>}
box{<0,0,-0.304800><0.505241,0.035000,0.304800> rotate<0,90.000000,0> translate<45.431997,0.000000,13.682619> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.431997,0.000000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.579200,0.000000,13.411200>}
box{<0,0,-0.304800><0.147203,0.035000,0.304800> rotate<0,0.000000,0> translate<45.431997,0.000000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.431997,0.000000,15.717378>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.431997,0.000000,16.222619>}
box{<0,0,-0.304800><0.505241,0.035000,0.304800> rotate<0,90.000000,0> translate<45.431997,0.000000,16.222619> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.431997,0.000000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.579200,0.000000,15.849600>}
box{<0,0,-0.304800><0.147203,0.035000,0.304800> rotate<0,0.000000,0> translate<45.431997,0.000000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.431997,0.000000,18.257378>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.431997,0.000000,18.762619>}
box{<0,0,-0.304800><0.505241,0.035000,0.304800> rotate<0,90.000000,0> translate<45.431997,0.000000,18.762619> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.431997,0.000000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.579200,0.000000,18.288000>}
box{<0,0,-0.304800><0.147203,0.035000,0.304800> rotate<0,0.000000,0> translate<45.431997,0.000000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.431997,0.000000,20.797378>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.431997,0.000000,21.302619>}
box{<0,0,-0.304800><0.505241,0.035000,0.304800> rotate<0,90.000000,0> translate<45.431997,0.000000,21.302619> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.431997,0.000000,23.337378>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.431997,0.000000,23.842619>}
box{<0,0,-0.304800><0.505241,0.035000,0.304800> rotate<0,90.000000,0> translate<45.431997,0.000000,23.842619> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.431997,0.000000,23.774400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.579200,0.000000,23.774400>}
box{<0,0,-0.304800><0.147203,0.035000,0.304800> rotate<0,0.000000,0> translate<45.431997,0.000000,23.774400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.579200,0.000000,31.602816>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.579200,0.000000,1.320797>}
box{<0,0,-0.304800><30.282019,0.035000,0.304800> rotate<0,-90.000000,0> translate<45.579200,0.000000,1.320797> }
texture{col_pol}
}
#end
union{
cylinder{<43.400000,0.038000,23.590000><43.400000,-1.538000,23.590000>0.508000}
cylinder{<43.400000,0.038000,21.050000><43.400000,-1.538000,21.050000>0.508000}
cylinder{<43.400000,0.038000,18.510000><43.400000,-1.538000,18.510000>0.508000}
cylinder{<43.400000,0.038000,15.970000><43.400000,-1.538000,15.970000>0.508000}
cylinder{<43.400000,0.038000,13.430000><43.400000,-1.538000,13.430000>0.508000}
cylinder{<43.400000,0.038000,10.890000><43.400000,-1.538000,10.890000>0.508000}
cylinder{<43.400000,0.038000,8.350000><43.400000,-1.538000,8.350000>0.508000}
cylinder{<43.400000,0.038000,5.810000><43.400000,-1.538000,5.810000>0.508000}
cylinder{<5.710000,0.038000,17.560000><5.710000,-1.538000,17.560000>0.508000}
cylinder{<5.710000,0.038000,20.100000><5.710000,-1.538000,20.100000>0.508000}
cylinder{<5.710000,0.038000,22.640000><5.710000,-1.538000,22.640000>0.508000}
cylinder{<5.710000,0.038000,7.400000><5.710000,-1.538000,7.400000>0.508000}
cylinder{<5.710000,0.038000,9.940000><5.710000,-1.538000,9.940000>0.508000}
cylinder{<5.710000,0.038000,12.480000><5.710000,-1.538000,12.480000>0.508000}
cylinder{<5.710000,0.038000,28.990000><5.710000,-1.538000,28.990000>0.508000}
cylinder{<5.710000,0.038000,26.450000><5.710000,-1.538000,26.450000>0.508000}
cylinder{<12.930000,0.038000,12.050000><12.930000,-1.538000,12.050000>0.406400}
cylinder{<12.930000,0.038000,4.430000><12.930000,-1.538000,4.430000>0.406400}
//Bohrungen(schnell)/Durchkontaktierungen
//Bohrungen(schnell)/Platine
texture{col_hls}
}
#if(pcb_silkscreen=on)
//Bestückungsdruck
union{
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.760956,-1.536000,23.058363>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.760956,-1.536000,24.143025>}
box{<0,0,-0.076200><1.084663,0.036000,0.076200> rotate<0,90.000000,0> translate<41.760956,-1.536000,24.143025> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.760956,-1.536000,24.143025>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.489794,-1.536000,24.414188>}
box{<0,0,-0.076200><0.383482,0.036000,0.076200> rotate<0,44.997030,0> translate<41.489794,-1.536000,24.414188> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.489794,-1.536000,24.414188>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.947463,-1.536000,24.414188>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,0.000000,0> translate<40.947463,-1.536000,24.414188> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.947463,-1.536000,24.414188>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.676297,-1.536000,24.143025>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,-44.996700,0> translate<40.676297,-1.536000,24.143025> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.676297,-1.536000,24.143025>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.676297,-1.536000,23.058363>}
box{<0,0,-0.076200><1.084663,0.036000,0.076200> rotate<0,-90.000000,0> translate<40.676297,-1.536000,23.058363> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.676297,-1.536000,23.058363>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.947463,-1.536000,22.787200>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,44.996700,0> translate<40.676297,-1.536000,23.058363> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.947463,-1.536000,22.787200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.489794,-1.536000,22.787200>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,0.000000,0> translate<40.947463,-1.536000,22.787200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.489794,-1.536000,22.787200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.760956,-1.536000,23.058363>}
box{<0,0,-0.076200><0.383482,0.036000,0.076200> rotate<0,-44.997030,0> translate<41.489794,-1.536000,22.787200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.760956,-1.536000,23.058363>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.676297,-1.536000,24.143025>}
box{<0,0,-0.076200><1.533942,0.036000,0.076200> rotate<0,44.997113,0> translate<40.676297,-1.536000,24.143025> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.760956,-1.536000,6.714188>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.676297,-1.536000,6.714188>}
box{<0,0,-0.076200><1.084659,0.036000,0.076200> rotate<0,0.000000,0> translate<40.676297,-1.536000,6.714188> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.676297,-1.536000,6.714188>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.676297,-1.536000,6.443025>}
box{<0,0,-0.076200><0.271162,0.036000,0.076200> rotate<0,-90.000000,0> translate<40.676297,-1.536000,6.443025> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.676297,-1.536000,6.443025>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.760956,-1.536000,5.358363>}
box{<0,0,-0.076200><1.533942,0.036000,0.076200> rotate<0,44.997113,0> translate<40.676297,-1.536000,6.443025> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.760956,-1.536000,5.358363>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.760956,-1.536000,5.087200>}
box{<0,0,-0.076200><0.271162,0.036000,0.076200> rotate<0,-90.000000,0> translate<41.760956,-1.536000,5.087200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.460956,-1.536000,21.987200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.460956,-1.536000,23.071859>}
box{<0,0,-0.076200><1.084659,0.036000,0.076200> rotate<0,90.000000,0> translate<9.460956,-1.536000,23.071859> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.460956,-1.536000,23.071859>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.918628,-1.536000,23.614187>}
box{<0,0,-0.076200><0.766968,0.036000,0.076200> rotate<0,44.997030,0> translate<8.918628,-1.536000,23.614187> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.918628,-1.536000,23.614187>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.376297,-1.536000,23.071859>}
box{<0,0,-0.076200><0.766970,0.036000,0.076200> rotate<0,-44.996865,0> translate<8.376297,-1.536000,23.071859> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.376297,-1.536000,23.071859>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.376297,-1.536000,21.987200>}
box{<0,0,-0.076200><1.084659,0.036000,0.076200> rotate<0,-90.000000,0> translate<8.376297,-1.536000,21.987200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.460956,-1.536000,22.800694>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.376297,-1.536000,22.800694>}
box{<0,0,-0.076200><1.084659,0.036000,0.076200> rotate<0,0.000000,0> translate<8.376297,-1.536000,22.800694> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.560956,-1.536000,19.387200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.560956,-1.536000,21.014188>}
box{<0,0,-0.076200><1.626988,0.036000,0.076200> rotate<0,90.000000,0> translate<9.560956,-1.536000,21.014188> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.560956,-1.536000,21.014188>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.747463,-1.536000,21.014188>}
box{<0,0,-0.076200><0.813494,0.036000,0.076200> rotate<0,0.000000,0> translate<8.747463,-1.536000,21.014188> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.747463,-1.536000,21.014188>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.476297,-1.536000,20.743025>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,-44.996700,0> translate<8.476297,-1.536000,20.743025> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.476297,-1.536000,20.743025>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.476297,-1.536000,20.471859>}
box{<0,0,-0.076200><0.271166,0.036000,0.076200> rotate<0,-90.000000,0> translate<8.476297,-1.536000,20.471859> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.476297,-1.536000,20.471859>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.747463,-1.536000,20.200694>}
box{<0,0,-0.076200><0.383486,0.036000,0.076200> rotate<0,44.997030,0> translate<8.476297,-1.536000,20.471859> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.747463,-1.536000,20.200694>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.476297,-1.536000,19.929528>}
box{<0,0,-0.076200><0.383486,0.036000,0.076200> rotate<0,-44.997030,0> translate<8.476297,-1.536000,19.929528> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.476297,-1.536000,19.929528>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.476297,-1.536000,19.658363>}
box{<0,0,-0.076200><0.271166,0.036000,0.076200> rotate<0,-90.000000,0> translate<8.476297,-1.536000,19.658363> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.476297,-1.536000,19.658363>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.747463,-1.536000,19.387200>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,44.996700,0> translate<8.476297,-1.536000,19.658363> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.747463,-1.536000,19.387200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.560956,-1.536000,19.387200>}
box{<0,0,-0.076200><0.813494,0.036000,0.076200> rotate<0,0.000000,0> translate<8.747463,-1.536000,19.387200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.560956,-1.536000,20.200694>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.747463,-1.536000,20.200694>}
box{<0,0,-0.076200><0.813494,0.036000,0.076200> rotate<0,0.000000,0> translate<8.747463,-1.536000,20.200694> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.576297,-1.536000,18.443025>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.847463,-1.536000,18.714188>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,-44.996700,0> translate<8.576297,-1.536000,18.443025> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.847463,-1.536000,18.714188>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.389794,-1.536000,18.714188>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,0.000000,0> translate<8.847463,-1.536000,18.714188> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.389794,-1.536000,18.714188>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.660956,-1.536000,18.443025>}
box{<0,0,-0.076200><0.383482,0.036000,0.076200> rotate<0,44.997030,0> translate<9.389794,-1.536000,18.714188> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.660956,-1.536000,18.443025>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.660956,-1.536000,17.358363>}
box{<0,0,-0.076200><1.084663,0.036000,0.076200> rotate<0,-90.000000,0> translate<9.660956,-1.536000,17.358363> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.660956,-1.536000,17.358363>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.389794,-1.536000,17.087200>}
box{<0,0,-0.076200><0.383482,0.036000,0.076200> rotate<0,-44.997030,0> translate<9.389794,-1.536000,17.087200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.389794,-1.536000,17.087200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.847463,-1.536000,17.087200>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,0.000000,0> translate<8.847463,-1.536000,17.087200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.847463,-1.536000,17.087200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.576297,-1.536000,17.358363>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,44.996700,0> translate<8.576297,-1.536000,17.358363> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.750616,-1.536000,26.943025>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.021781,-1.536000,27.214188>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,-44.996700,0> translate<11.750616,-1.536000,26.943025> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.021781,-1.536000,27.214188>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.564113,-1.536000,27.214188>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,0.000000,0> translate<12.021781,-1.536000,27.214188> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.564113,-1.536000,27.214188>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.835275,-1.536000,26.943025>}
box{<0,0,-0.076200><0.383482,0.036000,0.076200> rotate<0,44.997030,0> translate<12.564113,-1.536000,27.214188> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.835275,-1.536000,26.943025>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.835275,-1.536000,25.858363>}
box{<0,0,-0.076200><1.084663,0.036000,0.076200> rotate<0,-90.000000,0> translate<12.835275,-1.536000,25.858363> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.835275,-1.536000,25.858363>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.564113,-1.536000,25.587200>}
box{<0,0,-0.076200><0.383482,0.036000,0.076200> rotate<0,-44.997030,0> translate<12.564113,-1.536000,25.587200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.564113,-1.536000,25.587200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.021781,-1.536000,25.587200>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,0.000000,0> translate<12.021781,-1.536000,25.587200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.021781,-1.536000,25.587200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.750616,-1.536000,25.858363>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,44.996700,0> translate<11.750616,-1.536000,25.858363> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.750616,-1.536000,25.858363>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.750616,-1.536000,26.400694>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,90.000000,0> translate<11.750616,-1.536000,26.400694> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.750616,-1.536000,26.400694>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.292947,-1.536000,26.400694>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,0.000000,0> translate<11.750616,-1.536000,26.400694> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.198119,-1.536000,25.587200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.198119,-1.536000,27.214188>}
box{<0,0,-0.076200><1.626987,0.036000,0.076200> rotate<0,90.000000,0> translate<11.198119,-1.536000,27.214188> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.198119,-1.536000,27.214188>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.113459,-1.536000,25.587200>}
box{<0,0,-0.076200><1.955396,0.036000,0.076200> rotate<0,-56.306191,0> translate<10.113459,-1.536000,25.587200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.113459,-1.536000,25.587200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.113459,-1.536000,27.214188>}
box{<0,0,-0.076200><1.626987,0.036000,0.076200> rotate<0,90.000000,0> translate<10.113459,-1.536000,27.214188> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.560963,-1.536000,27.214188>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.560963,-1.536000,25.587200>}
box{<0,0,-0.076200><1.626987,0.036000,0.076200> rotate<0,-90.000000,0> translate<9.560963,-1.536000,25.587200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.560963,-1.536000,25.587200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.747469,-1.536000,25.587200>}
box{<0,0,-0.076200><0.813494,0.036000,0.076200> rotate<0,0.000000,0> translate<8.747469,-1.536000,25.587200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.747469,-1.536000,25.587200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.476303,-1.536000,25.858363>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,44.996700,0> translate<8.476303,-1.536000,25.858363> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.476303,-1.536000,25.858363>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.476303,-1.536000,26.943025>}
box{<0,0,-0.076200><1.084663,0.036000,0.076200> rotate<0,90.000000,0> translate<8.476303,-1.536000,26.943025> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.476303,-1.536000,26.943025>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.747469,-1.536000,27.214188>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,-44.996700,0> translate<8.476303,-1.536000,26.943025> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.747469,-1.536000,27.214188>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.560963,-1.536000,27.214188>}
box{<0,0,-0.076200><0.813494,0.036000,0.076200> rotate<0,0.000000,0> translate<8.747469,-1.536000,27.214188> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.835275,-1.536000,29.814188>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.835275,-1.536000,28.729528>}
box{<0,0,-0.076200><1.084659,0.036000,0.076200> rotate<0,-90.000000,0> translate<12.835275,-1.536000,28.729528> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.835275,-1.536000,28.729528>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.292947,-1.536000,28.187200>}
box{<0,0,-0.076200><0.766968,0.036000,0.076200> rotate<0,-44.997030,0> translate<12.292947,-1.536000,28.187200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.292947,-1.536000,28.187200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.750616,-1.536000,28.729528>}
box{<0,0,-0.076200><0.766970,0.036000,0.076200> rotate<0,44.996865,0> translate<11.750616,-1.536000,28.729528> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.750616,-1.536000,28.729528>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.750616,-1.536000,29.814188>}
box{<0,0,-0.076200><1.084659,0.036000,0.076200> rotate<0,90.000000,0> translate<11.750616,-1.536000,29.814188> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.113459,-1.536000,29.543025>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.384625,-1.536000,29.814188>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,-44.996700,0> translate<10.113459,-1.536000,29.543025> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.384625,-1.536000,29.814188>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.926956,-1.536000,29.814188>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,0.000000,0> translate<10.384625,-1.536000,29.814188> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.926956,-1.536000,29.814188>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.198119,-1.536000,29.543025>}
box{<0,0,-0.076200><0.383482,0.036000,0.076200> rotate<0,44.997030,0> translate<10.926956,-1.536000,29.814188> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.198119,-1.536000,29.543025>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.198119,-1.536000,28.458362>}
box{<0,0,-0.076200><1.084663,0.036000,0.076200> rotate<0,-90.000000,0> translate<11.198119,-1.536000,28.458362> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.198119,-1.536000,28.458362>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.926956,-1.536000,28.187200>}
box{<0,0,-0.076200><0.383482,0.036000,0.076200> rotate<0,-44.997030,0> translate<10.926956,-1.536000,28.187200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.926956,-1.536000,28.187200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.384625,-1.536000,28.187200>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,0.000000,0> translate<10.384625,-1.536000,28.187200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.384625,-1.536000,28.187200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.113459,-1.536000,28.458362>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,44.996700,0> translate<10.113459,-1.536000,28.458362> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.476303,-1.536000,29.543025>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.747469,-1.536000,29.814188>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,-44.996700,0> translate<8.476303,-1.536000,29.543025> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.747469,-1.536000,29.814188>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.289800,-1.536000,29.814188>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,0.000000,0> translate<8.747469,-1.536000,29.814188> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.289800,-1.536000,29.814188>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.560963,-1.536000,29.543025>}
box{<0,0,-0.076200><0.383482,0.036000,0.076200> rotate<0,44.997030,0> translate<9.289800,-1.536000,29.814188> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.560963,-1.536000,29.543025>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.560963,-1.536000,28.458362>}
box{<0,0,-0.076200><1.084663,0.036000,0.076200> rotate<0,-90.000000,0> translate<9.560963,-1.536000,28.458362> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.560963,-1.536000,28.458362>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.289800,-1.536000,28.187200>}
box{<0,0,-0.076200><0.383482,0.036000,0.076200> rotate<0,-44.997030,0> translate<9.289800,-1.536000,28.187200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.289800,-1.536000,28.187200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.747469,-1.536000,28.187200>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,0.000000,0> translate<8.747469,-1.536000,28.187200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.747469,-1.536000,28.187200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.476303,-1.536000,28.458362>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,44.996700,0> translate<8.476303,-1.536000,28.458362> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.939141,-1.536000,13.143025>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.210306,-1.536000,13.414188>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,-44.996700,0> translate<10.939141,-1.536000,13.143025> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.210306,-1.536000,13.414188>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.752638,-1.536000,13.414188>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,0.000000,0> translate<11.210306,-1.536000,13.414188> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.752638,-1.536000,13.414188>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.023800,-1.536000,13.143025>}
box{<0,0,-0.076200><0.383482,0.036000,0.076200> rotate<0,44.997030,0> translate<11.752638,-1.536000,13.414188> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.023800,-1.536000,13.143025>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.023800,-1.536000,12.058363>}
box{<0,0,-0.076200><1.084663,0.036000,0.076200> rotate<0,-90.000000,0> translate<12.023800,-1.536000,12.058363> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.023800,-1.536000,12.058363>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.752638,-1.536000,11.787200>}
box{<0,0,-0.076200><0.383482,0.036000,0.076200> rotate<0,-44.997030,0> translate<11.752638,-1.536000,11.787200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.752638,-1.536000,11.787200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.210306,-1.536000,11.787200>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,0.000000,0> translate<11.210306,-1.536000,11.787200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.210306,-1.536000,11.787200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.939141,-1.536000,12.058363>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,44.996700,0> translate<10.939141,-1.536000,12.058363> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.939141,-1.536000,12.058363>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.939141,-1.536000,12.600694>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,90.000000,0> translate<10.939141,-1.536000,12.600694> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.939141,-1.536000,12.600694>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.481472,-1.536000,12.600694>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,0.000000,0> translate<10.939141,-1.536000,12.600694> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.301984,-1.536000,11.787200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.386644,-1.536000,11.787200>}
box{<0,0,-0.076200><1.084659,0.036000,0.076200> rotate<0,0.000000,0> translate<9.301984,-1.536000,11.787200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.386644,-1.536000,11.787200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.301984,-1.536000,12.871859>}
box{<0,0,-0.076200><1.533940,0.036000,0.076200> rotate<0,44.997030,0> translate<9.301984,-1.536000,12.871859> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.301984,-1.536000,12.871859>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.301984,-1.536000,13.143025>}
box{<0,0,-0.076200><0.271166,0.036000,0.076200> rotate<0,90.000000,0> translate<9.301984,-1.536000,13.143025> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.301984,-1.536000,13.143025>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.573150,-1.536000,13.414188>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,-44.996700,0> translate<9.301984,-1.536000,13.143025> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.573150,-1.536000,13.414188>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.115481,-1.536000,13.414188>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,0.000000,0> translate<9.573150,-1.536000,13.414188> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.115481,-1.536000,13.414188>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.386644,-1.536000,13.143025>}
box{<0,0,-0.076200><0.383482,0.036000,0.076200> rotate<0,44.997030,0> translate<10.115481,-1.536000,13.414188> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.749488,-1.536000,11.787200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.749488,-1.536000,12.871859>}
box{<0,0,-0.076200><1.084659,0.036000,0.076200> rotate<0,90.000000,0> translate<8.749488,-1.536000,12.871859> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.749488,-1.536000,12.871859>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.207159,-1.536000,13.414188>}
box{<0,0,-0.076200><0.766968,0.036000,0.076200> rotate<0,44.997030,0> translate<8.207159,-1.536000,13.414188> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.207159,-1.536000,13.414188>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.664828,-1.536000,12.871859>}
box{<0,0,-0.076200><0.766970,0.036000,0.076200> rotate<0,-44.996865,0> translate<7.664828,-1.536000,12.871859> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.664828,-1.536000,12.871859>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.664828,-1.536000,11.787200>}
box{<0,0,-0.076200><1.084659,0.036000,0.076200> rotate<0,-90.000000,0> translate<7.664828,-1.536000,11.787200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.749488,-1.536000,12.600694>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.664828,-1.536000,12.600694>}
box{<0,0,-0.076200><1.084659,0.036000,0.076200> rotate<0,0.000000,0> translate<7.664828,-1.536000,12.600694> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.939141,-1.536000,10.343025>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.210306,-1.536000,10.614187>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,-44.996700,0> translate<10.939141,-1.536000,10.343025> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.210306,-1.536000,10.614187>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.752638,-1.536000,10.614187>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,0.000000,0> translate<11.210306,-1.536000,10.614187> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.752638,-1.536000,10.614187>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.023800,-1.536000,10.343025>}
box{<0,0,-0.076200><0.383482,0.036000,0.076200> rotate<0,44.997030,0> translate<11.752638,-1.536000,10.614187> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.023800,-1.536000,10.343025>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.023800,-1.536000,9.258363>}
box{<0,0,-0.076200><1.084663,0.036000,0.076200> rotate<0,-90.000000,0> translate<12.023800,-1.536000,9.258363> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.023800,-1.536000,9.258363>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.752638,-1.536000,8.987200>}
box{<0,0,-0.076200><0.383482,0.036000,0.076200> rotate<0,-44.997030,0> translate<11.752638,-1.536000,8.987200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.752638,-1.536000,8.987200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.210306,-1.536000,8.987200>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,0.000000,0> translate<11.210306,-1.536000,8.987200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.210306,-1.536000,8.987200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.939141,-1.536000,9.258363>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,44.996700,0> translate<10.939141,-1.536000,9.258363> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.939141,-1.536000,9.258363>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.939141,-1.536000,9.800694>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,90.000000,0> translate<10.939141,-1.536000,9.800694> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.939141,-1.536000,9.800694>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.481472,-1.536000,9.800694>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,0.000000,0> translate<10.939141,-1.536000,9.800694> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.301984,-1.536000,8.987200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.386644,-1.536000,8.987200>}
box{<0,0,-0.076200><1.084659,0.036000,0.076200> rotate<0,0.000000,0> translate<9.301984,-1.536000,8.987200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.386644,-1.536000,8.987200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.301984,-1.536000,10.071859>}
box{<0,0,-0.076200><1.533940,0.036000,0.076200> rotate<0,44.997030,0> translate<9.301984,-1.536000,10.071859> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.301984,-1.536000,10.071859>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.301984,-1.536000,10.343025>}
box{<0,0,-0.076200><0.271166,0.036000,0.076200> rotate<0,90.000000,0> translate<9.301984,-1.536000,10.343025> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.301984,-1.536000,10.343025>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.573150,-1.536000,10.614187>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,-44.996700,0> translate<9.301984,-1.536000,10.343025> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.573150,-1.536000,10.614187>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.115481,-1.536000,10.614187>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,0.000000,0> translate<9.573150,-1.536000,10.614187> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.115481,-1.536000,10.614187>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.386644,-1.536000,10.343025>}
box{<0,0,-0.076200><0.383482,0.036000,0.076200> rotate<0,44.997030,0> translate<10.115481,-1.536000,10.614187> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.749488,-1.536000,8.987200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.749488,-1.536000,10.614187>}
box{<0,0,-0.076200><1.626988,0.036000,0.076200> rotate<0,90.000000,0> translate<8.749488,-1.536000,10.614187> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.749488,-1.536000,10.614187>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.935994,-1.536000,10.614187>}
box{<0,0,-0.076200><0.813494,0.036000,0.076200> rotate<0,0.000000,0> translate<7.935994,-1.536000,10.614187> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.935994,-1.536000,10.614187>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.664828,-1.536000,10.343025>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,-44.996700,0> translate<7.664828,-1.536000,10.343025> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.664828,-1.536000,10.343025>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.664828,-1.536000,10.071859>}
box{<0,0,-0.076200><0.271166,0.036000,0.076200> rotate<0,-90.000000,0> translate<7.664828,-1.536000,10.071859> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.664828,-1.536000,10.071859>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.935994,-1.536000,9.800694>}
box{<0,0,-0.076200><0.383486,0.036000,0.076200> rotate<0,44.997030,0> translate<7.664828,-1.536000,10.071859> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.935994,-1.536000,9.800694>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.664828,-1.536000,9.529528>}
box{<0,0,-0.076200><0.383486,0.036000,0.076200> rotate<0,-44.997030,0> translate<7.664828,-1.536000,9.529528> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.664828,-1.536000,9.529528>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.664828,-1.536000,9.258363>}
box{<0,0,-0.076200><0.271166,0.036000,0.076200> rotate<0,-90.000000,0> translate<7.664828,-1.536000,9.258363> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.664828,-1.536000,9.258363>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.935994,-1.536000,8.987200>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,44.996700,0> translate<7.664828,-1.536000,9.258363> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.935994,-1.536000,8.987200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.749488,-1.536000,8.987200>}
box{<0,0,-0.076200><0.813494,0.036000,0.076200> rotate<0,0.000000,0> translate<7.935994,-1.536000,8.987200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.749488,-1.536000,9.800694>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.935994,-1.536000,9.800694>}
box{<0,0,-0.076200><0.813494,0.036000,0.076200> rotate<0,0.000000,0> translate<7.935994,-1.536000,9.800694> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.939141,-1.536000,7.843025>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.210306,-1.536000,8.114187>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,-44.996700,0> translate<10.939141,-1.536000,7.843025> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.210306,-1.536000,8.114187>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.752638,-1.536000,8.114187>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,0.000000,0> translate<11.210306,-1.536000,8.114187> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.752638,-1.536000,8.114187>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.023800,-1.536000,7.843025>}
box{<0,0,-0.076200><0.383482,0.036000,0.076200> rotate<0,44.997030,0> translate<11.752638,-1.536000,8.114187> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.023800,-1.536000,7.843025>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.023800,-1.536000,6.758363>}
box{<0,0,-0.076200><1.084663,0.036000,0.076200> rotate<0,-90.000000,0> translate<12.023800,-1.536000,6.758363> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.023800,-1.536000,6.758363>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.752638,-1.536000,6.487200>}
box{<0,0,-0.076200><0.383482,0.036000,0.076200> rotate<0,-44.997030,0> translate<11.752638,-1.536000,6.487200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.752638,-1.536000,6.487200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.210306,-1.536000,6.487200>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,0.000000,0> translate<11.210306,-1.536000,6.487200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.210306,-1.536000,6.487200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.939141,-1.536000,6.758363>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,44.996700,0> translate<10.939141,-1.536000,6.758363> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.939141,-1.536000,6.758363>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.939141,-1.536000,7.300694>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,90.000000,0> translate<10.939141,-1.536000,7.300694> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.939141,-1.536000,7.300694>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.481472,-1.536000,7.300694>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,0.000000,0> translate<10.939141,-1.536000,7.300694> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.386644,-1.536000,7.571859>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.844316,-1.536000,8.114187>}
box{<0,0,-0.076200><0.766968,0.036000,0.076200> rotate<0,44.997030,0> translate<9.844316,-1.536000,8.114187> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.844316,-1.536000,8.114187>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.844316,-1.536000,6.487200>}
box{<0,0,-0.076200><1.626987,0.036000,0.076200> rotate<0,-90.000000,0> translate<9.844316,-1.536000,6.487200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.386644,-1.536000,6.487200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.301984,-1.536000,6.487200>}
box{<0,0,-0.076200><1.084659,0.036000,0.076200> rotate<0,0.000000,0> translate<9.301984,-1.536000,6.487200> }
//IC1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.720000,0.000000,8.730000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.300000,0.000000,8.730000>}
box{<0,0,-0.101600><7.420000,0.036000,0.101600> rotate<0,0.000000,0> translate<29.300000,0.000000,8.730000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.300000,0.000000,8.730000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.300000,0.000000,19.970000>}
box{<0,0,-0.101600><11.240000,0.036000,0.101600> rotate<0,90.000000,0> translate<29.300000,0.000000,19.970000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.300000,0.000000,19.970000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.840000,0.000000,19.970000>}
box{<0,0,-0.101600><2.540000,0.036000,0.101600> rotate<0,0.000000,0> translate<29.300000,0.000000,19.970000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.840000,0.000000,19.970000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.545000,0.000000,19.970000>}
box{<0,0,-0.101600><1.705000,0.036000,0.101600> rotate<0,0.000000,0> translate<31.840000,0.000000,19.970000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.545000,0.000000,19.970000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.720000,0.000000,19.970000>}
box{<0,0,-0.101600><3.175000,0.036000,0.101600> rotate<0,0.000000,0> translate<33.545000,0.000000,19.970000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.720000,0.000000,19.970000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.720000,0.000000,8.730000>}
box{<0,0,-0.101600><11.240000,0.036000,0.101600> rotate<0,-90.000000,0> translate<36.720000,0.000000,8.730000> }
object{ARC(0.853891,0.203200,183.269531,356.730469,0.036000) translate<32.692500,0.000000,20.018700>}
box{<-0.249900,0,-0.664950><0.249900,0.036000,0.664950> rotate<0,-270.000000,0> translate<28.610050,0.000000,19.430000>}
box{<-0.249900,0,-0.664950><0.249900,0.036000,0.664950> rotate<0,-270.000000,0> translate<28.610050,0.000000,18.160000>}
box{<-0.249900,0,-0.664950><0.249900,0.036000,0.664950> rotate<0,-270.000000,0> translate<28.610050,0.000000,16.890000>}
box{<-0.249900,0,-0.664950><0.249900,0.036000,0.664950> rotate<0,-270.000000,0> translate<28.610050,0.000000,15.620000>}
box{<-0.249900,0,-0.664950><0.249900,0.036000,0.664950> rotate<0,-270.000000,0> translate<28.610050,0.000000,14.350000>}
box{<-0.249900,0,-0.664950><0.249900,0.036000,0.664950> rotate<0,-270.000000,0> translate<28.610050,0.000000,13.080000>}
box{<-0.249900,0,-0.664950><0.249900,0.036000,0.664950> rotate<0,-270.000000,0> translate<28.610050,0.000000,11.810000>}
box{<-0.249900,0,-0.664950><0.249900,0.036000,0.664950> rotate<0,-270.000000,0> translate<28.610050,0.000000,10.540000>}
box{<-0.249900,0,-0.664950><0.249900,0.036000,0.664950> rotate<0,-270.000000,0> translate<28.610050,0.000000,9.270000>}
box{<-0.249900,0,-0.664900><0.249900,0.036000,0.664900> rotate<0,-90.000000,0> translate<37.409900,0.000000,9.270000>}
box{<-0.249900,0,-0.664950><0.249900,0.036000,0.664950> rotate<0,-270.000000,0> translate<37.434950,0.000000,10.540000>}
box{<-0.249900,0,-0.664950><0.249900,0.036000,0.664950> rotate<0,-270.000000,0> translate<37.434950,0.000000,11.810000>}
box{<-0.249900,0,-0.664950><0.249900,0.036000,0.664950> rotate<0,-270.000000,0> translate<37.434950,0.000000,13.080000>}
box{<-0.249900,0,-0.664950><0.249900,0.036000,0.664950> rotate<0,-270.000000,0> translate<37.434950,0.000000,14.350000>}
box{<-0.249900,0,-0.664950><0.249900,0.036000,0.664950> rotate<0,-270.000000,0> translate<37.434950,0.000000,15.620000>}
box{<-0.249900,0,-0.664950><0.249900,0.036000,0.664950> rotate<0,-270.000000,0> translate<37.434950,0.000000,16.890000>}
box{<-0.249900,0,-0.664950><0.249900,0.036000,0.664950> rotate<0,-270.000000,0> translate<37.434950,0.000000,18.160000>}
box{<-0.249900,0,-0.664950><0.249900,0.036000,0.664950> rotate<0,-270.000000,0> translate<37.434950,0.000000,19.430000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<29.885800,0.000000,20.750800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<30.275597,0.000000,20.750800>}
box{<0,0,-0.050800><0.389797,0.036000,0.050800> rotate<0,0.000000,0> translate<29.885800,0.000000,20.750800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<30.080697,0.000000,20.750800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<30.080697,0.000000,21.920197>}
box{<0,0,-0.050800><1.169397,0.036000,0.050800> rotate<0,90.000000,0> translate<30.080697,0.000000,21.920197> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<29.885800,0.000000,21.920197>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<30.275597,0.000000,21.920197>}
box{<0,0,-0.050800><0.389797,0.036000,0.050800> rotate<0,0.000000,0> translate<29.885800,0.000000,21.920197> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.444994,0.000000,21.725297>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.250094,0.000000,21.920197>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,44.997030,0> translate<31.250094,0.000000,21.920197> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.250094,0.000000,21.920197>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<30.860294,0.000000,21.920197>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<30.860294,0.000000,21.920197> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<30.860294,0.000000,21.920197>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<30.665397,0.000000,21.725297>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,-44.997489,0> translate<30.665397,0.000000,21.725297> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<30.665397,0.000000,21.725297>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<30.665397,0.000000,20.945697>}
box{<0,0,-0.050800><0.779600,0.036000,0.050800> rotate<0,-90.000000,0> translate<30.665397,0.000000,20.945697> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<30.665397,0.000000,20.945697>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<30.860294,0.000000,20.750800>}
box{<0,0,-0.050800><0.275626,0.036000,0.050800> rotate<0,44.997030,0> translate<30.665397,0.000000,20.945697> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<30.860294,0.000000,20.750800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.250094,0.000000,20.750800>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<30.860294,0.000000,20.750800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.250094,0.000000,20.750800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.444994,0.000000,20.945697>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,-44.996571,0> translate<31.250094,0.000000,20.750800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.834794,0.000000,21.530397>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.224591,0.000000,21.920197>}
box{<0,0,-0.050800><0.551258,0.036000,0.050800> rotate<0,-44.997260,0> translate<31.834794,0.000000,21.530397> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.224591,0.000000,21.920197>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.224591,0.000000,20.750800>}
box{<0,0,-0.050800><1.169397,0.036000,0.050800> rotate<0,-90.000000,0> translate<32.224591,0.000000,20.750800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.834794,0.000000,20.750800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.614391,0.000000,20.750800>}
box{<0,0,-0.050800><0.779597,0.036000,0.050800> rotate<0,0.000000,0> translate<31.834794,0.000000,20.750800> }
//IC2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.935800,0.000000,11.591000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.935800,0.000000,20.989000>}
box{<0,0,-0.076200><9.398000,0.036000,0.076200> rotate<0,90.000000,0> translate<21.935800,0.000000,20.989000> }
object{ARC(0.381000,0.152400,180.000000,270.000000,0.036000) translate<18.405200,0.000000,11.591000>}
object{ARC(0.381000,0.152400,0.000000,90.000000,0.036000) translate<21.554800,0.000000,20.989000>}
object{ARC(0.381000,0.152400,270.000000,360.000000,0.036000) translate<21.554800,0.000000,11.591000>}
object{ARC(0.381000,0.152400,90.000000,180.000000,0.036000) translate<18.405200,0.000000,20.989000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.024200,0.000000,20.989000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.024200,0.000000,11.591000>}
box{<0,0,-0.076200><9.398000,0.036000,0.076200> rotate<0,-90.000000,0> translate<18.024200,0.000000,11.591000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.405200,0.000000,11.210000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.554800,0.000000,11.210000>}
box{<0,0,-0.076200><3.149600,0.036000,0.076200> rotate<0,0.000000,0> translate<18.405200,0.000000,11.210000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.554800,0.000000,21.370000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.488000,0.000000,21.370000>}
box{<0,0,-0.076200><1.066800,0.036000,0.076200> rotate<0,0.000000,0> translate<20.488000,0.000000,21.370000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.488000,0.000000,21.370000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.472000,0.000000,21.370000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,0.000000,0> translate<19.472000,0.000000,21.370000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.472000,0.000000,21.370000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.405200,0.000000,21.370000>}
box{<0,0,-0.076200><1.066800,0.036000,0.076200> rotate<0,0.000000,0> translate<18.405200,0.000000,21.370000> }
object{ARC(0.508000,0.152400,180.000000,360.000000,0.036000) translate<19.980000,0.000000,21.370000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<18.379800,0.000000,21.370000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<18.379800,0.000000,11.210000>}
box{<0,0,-0.025400><10.160000,0.036000,0.025400> rotate<0,-90.000000,0> translate<18.379800,0.000000,11.210000> }
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-270.000000,0> translate<22.507300,0.000000,16.925000>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-270.000000,0> translate<17.452700,0.000000,20.735000>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-270.000000,0> translate<17.452700,0.000000,19.465000>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-270.000000,0> translate<17.478100,0.000000,18.195000>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-270.000000,0> translate<17.452700,0.000000,16.925000>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-270.000000,0> translate<22.507300,0.000000,18.195000>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-270.000000,0> translate<22.507300,0.000000,19.465000>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-270.000000,0> translate<22.507300,0.000000,20.735000>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-270.000000,0> translate<17.452700,0.000000,15.655000>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-270.000000,0> translate<17.452700,0.000000,14.385000>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-270.000000,0> translate<17.452700,0.000000,13.115000>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-270.000000,0> translate<17.452700,0.000000,11.845000>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-270.000000,0> translate<22.507300,0.000000,15.655000>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-270.000000,0> translate<22.507300,0.000000,14.385000>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-270.000000,0> translate<22.507300,0.000000,13.115000>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-270.000000,0> translate<22.507300,0.000000,11.845000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.407525,0.000000,11.062306>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.407525,0.000000,11.824956>}
box{<0,0,-0.063500><0.762650,0.036000,0.063500> rotate<0,90.000000,0> translate<19.407525,0.000000,11.824956> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.407525,0.000000,11.824956>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.598188,0.000000,11.824956>}
box{<0,0,-0.063500><0.190663,0.036000,0.063500> rotate<0,0.000000,0> translate<19.407525,0.000000,11.824956> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.598188,0.000000,11.824956>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.360838,0.000000,11.062306>}
box{<0,0,-0.063500><1.078550,0.036000,0.063500> rotate<0,44.997030,0> translate<19.598188,0.000000,11.824956> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.360838,0.000000,11.062306>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.551500,0.000000,11.062306>}
box{<0,0,-0.063500><0.190662,0.036000,0.063500> rotate<0,0.000000,0> translate<20.360838,0.000000,11.062306> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.551500,0.000000,12.803691>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.407525,0.000000,12.803691>}
box{<0,0,-0.063500><1.143975,0.036000,0.063500> rotate<0,0.000000,0> translate<19.407525,0.000000,12.803691> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.407525,0.000000,12.803691>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.979513,0.000000,12.231703>}
box{<0,0,-0.063500><0.808912,0.036000,0.063500> rotate<0,44.997030,0> translate<19.407525,0.000000,12.803691> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.979513,0.000000,12.231703>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.979513,0.000000,12.994353>}
box{<0,0,-0.063500><0.762650,0.036000,0.063500> rotate<0,90.000000,0> translate<19.979513,0.000000,12.994353> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.551500,0.000000,13.401100>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.407525,0.000000,13.401100>}
box{<0,0,-0.063500><1.143975,0.036000,0.063500> rotate<0,0.000000,0> translate<19.407525,0.000000,13.401100> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.979513,0.000000,13.401100>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.979513,0.000000,14.163750>}
box{<0,0,-0.063500><0.762650,0.036000,0.063500> rotate<0,90.000000,0> translate<19.979513,0.000000,14.163750> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.407525,0.000000,14.163750>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.551500,0.000000,14.163750>}
box{<0,0,-0.063500><1.143975,0.036000,0.063500> rotate<0,0.000000,0> translate<19.407525,0.000000,14.163750> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.598188,0.000000,15.333147>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.407525,0.000000,15.142484>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<19.407525,0.000000,15.142484> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.407525,0.000000,15.142484>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.407525,0.000000,14.761159>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,-90.000000,0> translate<19.407525,0.000000,14.761159> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.407525,0.000000,14.761159>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.598188,0.000000,14.570497>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<19.407525,0.000000,14.761159> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.598188,0.000000,14.570497>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.360838,0.000000,14.570497>}
box{<0,0,-0.063500><0.762650,0.036000,0.063500> rotate<0,0.000000,0> translate<19.598188,0.000000,14.570497> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.360838,0.000000,14.570497>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.551500,0.000000,14.761159>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<20.360838,0.000000,14.570497> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.551500,0.000000,14.761159>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.551500,0.000000,15.142484>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,90.000000,0> translate<20.551500,0.000000,15.142484> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.551500,0.000000,15.142484>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.360838,0.000000,15.333147>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<20.360838,0.000000,15.333147> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.551500,0.000000,16.502544>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.551500,0.000000,15.739894>}
box{<0,0,-0.063500><0.762650,0.036000,0.063500> rotate<0,-90.000000,0> translate<20.551500,0.000000,15.739894> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.551500,0.000000,15.739894>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.788850,0.000000,16.502544>}
box{<0,0,-0.063500><1.078550,0.036000,0.063500> rotate<0,44.997030,0> translate<19.788850,0.000000,16.502544> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.788850,0.000000,16.502544>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.598188,0.000000,16.502544>}
box{<0,0,-0.063500><0.190662,0.036000,0.063500> rotate<0,0.000000,0> translate<19.598188,0.000000,16.502544> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.598188,0.000000,16.502544>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.407525,0.000000,16.311881>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<19.407525,0.000000,16.311881> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.407525,0.000000,16.311881>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.407525,0.000000,15.930556>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,-90.000000,0> translate<19.407525,0.000000,15.930556> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.407525,0.000000,15.930556>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.598188,0.000000,15.739894>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<19.407525,0.000000,15.930556> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.598188,0.000000,16.909291>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.407525,0.000000,17.099953>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<19.407525,0.000000,17.099953> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.407525,0.000000,17.099953>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.407525,0.000000,17.481278>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,90.000000,0> translate<19.407525,0.000000,17.481278> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.407525,0.000000,17.481278>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.598188,0.000000,17.671941>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<19.407525,0.000000,17.481278> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.598188,0.000000,17.671941>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.788850,0.000000,17.671941>}
box{<0,0,-0.063500><0.190662,0.036000,0.063500> rotate<0,0.000000,0> translate<19.598188,0.000000,17.671941> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.788850,0.000000,17.671941>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.979513,0.000000,17.481278>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<19.788850,0.000000,17.671941> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.979513,0.000000,17.481278>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.979513,0.000000,17.290616>}
box{<0,0,-0.063500><0.190662,0.036000,0.063500> rotate<0,-90.000000,0> translate<19.979513,0.000000,17.290616> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.979513,0.000000,17.481278>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.170175,0.000000,17.671941>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<19.979513,0.000000,17.481278> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.170175,0.000000,17.671941>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.360838,0.000000,17.671941>}
box{<0,0,-0.063500><0.190663,0.036000,0.063500> rotate<0,0.000000,0> translate<20.170175,0.000000,17.671941> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.360838,0.000000,17.671941>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.551500,0.000000,17.481278>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<20.360838,0.000000,17.671941> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.551500,0.000000,17.481278>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.551500,0.000000,17.099953>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,-90.000000,0> translate<20.551500,0.000000,17.099953> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.551500,0.000000,17.099953>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.360838,0.000000,16.909291>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<20.360838,0.000000,16.909291> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.598188,0.000000,18.078688>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.407525,0.000000,18.269350>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<19.407525,0.000000,18.269350> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.407525,0.000000,18.269350>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.407525,0.000000,18.650675>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,90.000000,0> translate<19.407525,0.000000,18.650675> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.407525,0.000000,18.650675>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.598188,0.000000,18.841338>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<19.407525,0.000000,18.650675> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.598188,0.000000,18.841338>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.788850,0.000000,18.841338>}
box{<0,0,-0.063500><0.190662,0.036000,0.063500> rotate<0,0.000000,0> translate<19.598188,0.000000,18.841338> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.788850,0.000000,18.841338>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.979513,0.000000,18.650675>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<19.788850,0.000000,18.841338> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.979513,0.000000,18.650675>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.170175,0.000000,18.841338>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<19.979513,0.000000,18.650675> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.170175,0.000000,18.841338>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.360838,0.000000,18.841338>}
box{<0,0,-0.063500><0.190663,0.036000,0.063500> rotate<0,0.000000,0> translate<20.170175,0.000000,18.841338> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.360838,0.000000,18.841338>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.551500,0.000000,18.650675>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<20.360838,0.000000,18.841338> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.551500,0.000000,18.650675>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.551500,0.000000,18.269350>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,-90.000000,0> translate<20.551500,0.000000,18.269350> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.551500,0.000000,18.269350>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.360838,0.000000,18.078688>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<20.360838,0.000000,18.078688> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.360838,0.000000,18.078688>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.170175,0.000000,18.078688>}
box{<0,0,-0.063500><0.190663,0.036000,0.063500> rotate<0,0.000000,0> translate<20.170175,0.000000,18.078688> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.170175,0.000000,18.078688>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.979513,0.000000,18.269350>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<19.979513,0.000000,18.269350> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.979513,0.000000,18.269350>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.788850,0.000000,18.078688>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<19.788850,0.000000,18.078688> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.788850,0.000000,18.078688>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.598188,0.000000,18.078688>}
box{<0,0,-0.063500><0.190662,0.036000,0.063500> rotate<0,0.000000,0> translate<19.598188,0.000000,18.078688> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.979513,0.000000,18.269350>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.979513,0.000000,18.650675>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,90.000000,0> translate<19.979513,0.000000,18.650675> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.407525,0.000000,19.248084>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.551500,0.000000,19.248084>}
box{<0,0,-0.063500><1.143975,0.036000,0.063500> rotate<0,0.000000,0> translate<19.407525,0.000000,19.248084> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.551500,0.000000,19.248084>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.551500,0.000000,19.820072>}
box{<0,0,-0.063500><0.571987,0.036000,0.063500> rotate<0,90.000000,0> translate<20.551500,0.000000,19.820072> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.551500,0.000000,19.820072>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.360838,0.000000,20.010734>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<20.360838,0.000000,20.010734> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.360838,0.000000,20.010734>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.598188,0.000000,20.010734>}
box{<0,0,-0.063500><0.762650,0.036000,0.063500> rotate<0,0.000000,0> translate<19.598188,0.000000,20.010734> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.598188,0.000000,20.010734>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.407525,0.000000,19.820072>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<19.407525,0.000000,19.820072> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.407525,0.000000,19.820072>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.407525,0.000000,19.248084>}
box{<0,0,-0.063500><0.571987,0.036000,0.063500> rotate<0,-90.000000,0> translate<19.407525,0.000000,19.248084> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.265500,0.000000,21.814500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.646825,0.000000,21.814500>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,0.000000,0> translate<18.265500,0.000000,21.814500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.456163,0.000000,21.814500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.456163,0.000000,22.958475>}
box{<0,0,-0.063500><1.143975,0.036000,0.063500> rotate<0,90.000000,0> translate<18.456163,0.000000,22.958475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.265500,0.000000,22.958475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.646825,0.000000,22.958475>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,0.000000,0> translate<18.265500,0.000000,22.958475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.807747,0.000000,22.767813>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.617084,0.000000,22.958475>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<19.617084,0.000000,22.958475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.617084,0.000000,22.958475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.235759,0.000000,22.958475>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,0.000000,0> translate<19.235759,0.000000,22.958475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.235759,0.000000,22.958475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.045097,0.000000,22.767813>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<19.045097,0.000000,22.767813> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.045097,0.000000,22.767813>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.045097,0.000000,22.005163>}
box{<0,0,-0.063500><0.762650,0.036000,0.063500> rotate<0,-90.000000,0> translate<19.045097,0.000000,22.005163> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.045097,0.000000,22.005163>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.235759,0.000000,21.814500>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<19.045097,0.000000,22.005163> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.235759,0.000000,21.814500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.617084,0.000000,21.814500>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,0.000000,0> translate<19.235759,0.000000,21.814500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.617084,0.000000,21.814500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.807747,0.000000,22.005163>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<19.617084,0.000000,21.814500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.977144,0.000000,21.814500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.214494,0.000000,21.814500>}
box{<0,0,-0.063500><0.762650,0.036000,0.063500> rotate<0,0.000000,0> translate<20.214494,0.000000,21.814500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.214494,0.000000,21.814500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.977144,0.000000,22.577150>}
box{<0,0,-0.063500><1.078550,0.036000,0.063500> rotate<0,-44.997030,0> translate<20.214494,0.000000,21.814500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.977144,0.000000,22.577150>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.977144,0.000000,22.767813>}
box{<0,0,-0.063500><0.190663,0.036000,0.063500> rotate<0,90.000000,0> translate<20.977144,0.000000,22.767813> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.977144,0.000000,22.767813>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.786481,0.000000,22.958475>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<20.786481,0.000000,22.958475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.786481,0.000000,22.958475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.405156,0.000000,22.958475>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,0.000000,0> translate<20.405156,0.000000,22.958475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.405156,0.000000,22.958475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.214494,0.000000,22.767813>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<20.214494,0.000000,22.767813> }
//JP1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.130000,-1.536000,8.985000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.130000,-1.536000,7.715000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<42.130000,-1.536000,7.715000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.130000,-1.536000,7.715000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.765000,-1.536000,7.080000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<42.130000,-1.536000,7.715000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.765000,-1.536000,7.080000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.035000,-1.536000,7.080000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<42.765000,-1.536000,7.080000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.035000,-1.536000,7.080000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.670000,-1.536000,7.715000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<44.035000,-1.536000,7.080000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.765000,-1.536000,12.160000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.130000,-1.536000,11.525000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<42.130000,-1.536000,11.525000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.130000,-1.536000,11.525000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.130000,-1.536000,10.255000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<42.130000,-1.536000,10.255000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.130000,-1.536000,10.255000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.765000,-1.536000,9.620000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<42.130000,-1.536000,10.255000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.765000,-1.536000,9.620000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.035000,-1.536000,9.620000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<42.765000,-1.536000,9.620000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.035000,-1.536000,9.620000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.670000,-1.536000,10.255000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<44.035000,-1.536000,9.620000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.670000,-1.536000,10.255000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.670000,-1.536000,11.525000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<44.670000,-1.536000,11.525000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.670000,-1.536000,11.525000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.035000,-1.536000,12.160000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<44.035000,-1.536000,12.160000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.130000,-1.536000,8.985000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.765000,-1.536000,9.620000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<42.130000,-1.536000,8.985000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.035000,-1.536000,9.620000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.670000,-1.536000,8.985000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<44.035000,-1.536000,9.620000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.670000,-1.536000,7.715000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.670000,-1.536000,8.985000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<44.670000,-1.536000,8.985000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.130000,-1.536000,16.605000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.130000,-1.536000,15.335000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<42.130000,-1.536000,15.335000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.130000,-1.536000,15.335000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.765000,-1.536000,14.700000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<42.130000,-1.536000,15.335000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.765000,-1.536000,14.700000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.035000,-1.536000,14.700000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<42.765000,-1.536000,14.700000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.035000,-1.536000,14.700000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.670000,-1.536000,15.335000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<44.035000,-1.536000,14.700000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.765000,-1.536000,14.700000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.130000,-1.536000,14.065000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<42.130000,-1.536000,14.065000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.130000,-1.536000,14.065000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.130000,-1.536000,12.795000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<42.130000,-1.536000,12.795000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.130000,-1.536000,12.795000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.765000,-1.536000,12.160000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<42.130000,-1.536000,12.795000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.765000,-1.536000,12.160000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.035000,-1.536000,12.160000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<42.765000,-1.536000,12.160000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.035000,-1.536000,12.160000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.670000,-1.536000,12.795000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<44.035000,-1.536000,12.160000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.670000,-1.536000,12.795000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.670000,-1.536000,14.065000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<44.670000,-1.536000,14.065000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.670000,-1.536000,14.065000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.035000,-1.536000,14.700000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<44.035000,-1.536000,14.700000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.765000,-1.536000,19.780000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.130000,-1.536000,19.145000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<42.130000,-1.536000,19.145000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.130000,-1.536000,19.145000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.130000,-1.536000,17.875000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<42.130000,-1.536000,17.875000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.130000,-1.536000,17.875000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.765000,-1.536000,17.240000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<42.130000,-1.536000,17.875000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.765000,-1.536000,17.240000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.035000,-1.536000,17.240000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<42.765000,-1.536000,17.240000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.035000,-1.536000,17.240000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.670000,-1.536000,17.875000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<44.035000,-1.536000,17.240000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.670000,-1.536000,17.875000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.670000,-1.536000,19.145000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<44.670000,-1.536000,19.145000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.670000,-1.536000,19.145000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.035000,-1.536000,19.780000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<44.035000,-1.536000,19.780000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.130000,-1.536000,16.605000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.765000,-1.536000,17.240000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<42.130000,-1.536000,16.605000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.035000,-1.536000,17.240000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.670000,-1.536000,16.605000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<44.035000,-1.536000,17.240000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.670000,-1.536000,15.335000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.670000,-1.536000,16.605000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<44.670000,-1.536000,16.605000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.130000,-1.536000,24.225000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.130000,-1.536000,22.955000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<42.130000,-1.536000,22.955000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.130000,-1.536000,22.955000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.765000,-1.536000,22.320000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<42.130000,-1.536000,22.955000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.765000,-1.536000,22.320000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.035000,-1.536000,22.320000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<42.765000,-1.536000,22.320000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.035000,-1.536000,22.320000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.670000,-1.536000,22.955000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<44.035000,-1.536000,22.320000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.765000,-1.536000,22.320000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.130000,-1.536000,21.685000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<42.130000,-1.536000,21.685000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.130000,-1.536000,21.685000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.130000,-1.536000,20.415000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<42.130000,-1.536000,20.415000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.130000,-1.536000,20.415000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.765000,-1.536000,19.780000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<42.130000,-1.536000,20.415000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.765000,-1.536000,19.780000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.035000,-1.536000,19.780000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<42.765000,-1.536000,19.780000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.035000,-1.536000,19.780000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.670000,-1.536000,20.415000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<44.035000,-1.536000,19.780000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.670000,-1.536000,20.415000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.670000,-1.536000,21.685000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<44.670000,-1.536000,21.685000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.670000,-1.536000,21.685000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.035000,-1.536000,22.320000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<44.035000,-1.536000,22.320000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.765000,-1.536000,24.860000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.035000,-1.536000,24.860000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<42.765000,-1.536000,24.860000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.130000,-1.536000,24.225000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.765000,-1.536000,24.860000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<42.130000,-1.536000,24.225000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.035000,-1.536000,24.860000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.670000,-1.536000,24.225000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<44.035000,-1.536000,24.860000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.670000,-1.536000,22.955000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.670000,-1.536000,24.225000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<44.670000,-1.536000,24.225000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.130000,-1.536000,6.445000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.130000,-1.536000,5.175000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<42.130000,-1.536000,5.175000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.130000,-1.536000,5.175000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.765000,-1.536000,4.540000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<42.130000,-1.536000,5.175000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.765000,-1.536000,4.540000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.035000,-1.536000,4.540000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<42.765000,-1.536000,4.540000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.035000,-1.536000,4.540000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.670000,-1.536000,5.175000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<44.035000,-1.536000,4.540000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.130000,-1.536000,6.445000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.765000,-1.536000,7.080000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<42.130000,-1.536000,6.445000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.035000,-1.536000,7.080000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.670000,-1.536000,6.445000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<44.035000,-1.536000,7.080000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.670000,-1.536000,5.175000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.670000,-1.536000,6.445000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<44.670000,-1.536000,6.445000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<43.400000,-1.536000,8.350000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<43.400000,-1.536000,10.890000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<43.400000,-1.536000,13.430000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<43.400000,-1.536000,15.970000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<43.400000,-1.536000,18.510000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<43.400000,-1.536000,21.050000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<43.400000,-1.536000,23.590000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<43.400000,-1.536000,5.810000>}
//JP2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.980000,-1.536000,16.925000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.980000,-1.536000,18.195000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<6.980000,-1.536000,18.195000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.980000,-1.536000,18.195000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.345000,-1.536000,18.830000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<6.345000,-1.536000,18.830000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.345000,-1.536000,18.830000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.075000,-1.536000,18.830000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<5.075000,-1.536000,18.830000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.075000,-1.536000,18.830000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.440000,-1.536000,18.195000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<4.440000,-1.536000,18.195000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.345000,-1.536000,18.830000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.980000,-1.536000,19.465000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<6.345000,-1.536000,18.830000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.980000,-1.536000,19.465000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.980000,-1.536000,20.735000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<6.980000,-1.536000,20.735000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.980000,-1.536000,20.735000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.345000,-1.536000,21.370000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<6.345000,-1.536000,21.370000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.345000,-1.536000,21.370000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.075000,-1.536000,21.370000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<5.075000,-1.536000,21.370000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.075000,-1.536000,21.370000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.440000,-1.536000,20.735000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<4.440000,-1.536000,20.735000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.440000,-1.536000,20.735000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.440000,-1.536000,19.465000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<4.440000,-1.536000,19.465000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.440000,-1.536000,19.465000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.075000,-1.536000,18.830000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<4.440000,-1.536000,19.465000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.345000,-1.536000,16.290000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.075000,-1.536000,16.290000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<5.075000,-1.536000,16.290000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.980000,-1.536000,16.925000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.345000,-1.536000,16.290000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<6.345000,-1.536000,16.290000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.075000,-1.536000,16.290000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.440000,-1.536000,16.925000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<4.440000,-1.536000,16.925000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.440000,-1.536000,18.195000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.440000,-1.536000,16.925000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<4.440000,-1.536000,16.925000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.345000,-1.536000,21.370000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.980000,-1.536000,22.005000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<6.345000,-1.536000,21.370000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.980000,-1.536000,22.005000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.980000,-1.536000,23.275000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<6.980000,-1.536000,23.275000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.980000,-1.536000,23.275000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.345000,-1.536000,23.910000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<6.345000,-1.536000,23.910000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.345000,-1.536000,23.910000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.075000,-1.536000,23.910000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<5.075000,-1.536000,23.910000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.075000,-1.536000,23.910000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.440000,-1.536000,23.275000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<4.440000,-1.536000,23.275000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.440000,-1.536000,23.275000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.440000,-1.536000,22.005000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<4.440000,-1.536000,22.005000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.440000,-1.536000,22.005000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.075000,-1.536000,21.370000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<4.440000,-1.536000,22.005000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<5.710000,-1.536000,20.100000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<5.710000,-1.536000,17.560000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<5.710000,-1.536000,22.640000>}
//JP3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.980000,-1.536000,6.765000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.980000,-1.536000,8.035000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<6.980000,-1.536000,8.035000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.980000,-1.536000,8.035000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.345000,-1.536000,8.670000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<6.345000,-1.536000,8.670000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.345000,-1.536000,8.670000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.075000,-1.536000,8.670000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<5.075000,-1.536000,8.670000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.075000,-1.536000,8.670000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.440000,-1.536000,8.035000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<4.440000,-1.536000,8.035000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.345000,-1.536000,8.670000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.980000,-1.536000,9.305000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<6.345000,-1.536000,8.670000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.980000,-1.536000,9.305000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.980000,-1.536000,10.575000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<6.980000,-1.536000,10.575000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.980000,-1.536000,10.575000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.345000,-1.536000,11.210000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<6.345000,-1.536000,11.210000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.345000,-1.536000,11.210000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.075000,-1.536000,11.210000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<5.075000,-1.536000,11.210000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.075000,-1.536000,11.210000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.440000,-1.536000,10.575000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<4.440000,-1.536000,10.575000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.440000,-1.536000,10.575000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.440000,-1.536000,9.305000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<4.440000,-1.536000,9.305000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.440000,-1.536000,9.305000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.075000,-1.536000,8.670000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<4.440000,-1.536000,9.305000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.345000,-1.536000,6.130000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.075000,-1.536000,6.130000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<5.075000,-1.536000,6.130000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.980000,-1.536000,6.765000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.345000,-1.536000,6.130000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<6.345000,-1.536000,6.130000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.075000,-1.536000,6.130000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.440000,-1.536000,6.765000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<4.440000,-1.536000,6.765000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.440000,-1.536000,8.035000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.440000,-1.536000,6.765000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<4.440000,-1.536000,6.765000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.345000,-1.536000,11.210000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.980000,-1.536000,11.845000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<6.345000,-1.536000,11.210000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.980000,-1.536000,11.845000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.980000,-1.536000,13.115000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<6.980000,-1.536000,13.115000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.980000,-1.536000,13.115000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.345000,-1.536000,13.750000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<6.345000,-1.536000,13.750000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.345000,-1.536000,13.750000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.075000,-1.536000,13.750000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<5.075000,-1.536000,13.750000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.075000,-1.536000,13.750000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.440000,-1.536000,13.115000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<4.440000,-1.536000,13.115000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.440000,-1.536000,13.115000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.440000,-1.536000,11.845000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<4.440000,-1.536000,11.845000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.440000,-1.536000,11.845000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.075000,-1.536000,11.210000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<4.440000,-1.536000,11.845000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<5.710000,-1.536000,9.940000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<5.710000,-1.536000,7.400000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<5.710000,-1.536000,12.480000>}
//PWR silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.440000,-1.536000,29.625000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.440000,-1.536000,28.355000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<4.440000,-1.536000,28.355000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.440000,-1.536000,28.355000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.075000,-1.536000,27.720000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<4.440000,-1.536000,28.355000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.075000,-1.536000,27.720000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.345000,-1.536000,27.720000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<5.075000,-1.536000,27.720000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.345000,-1.536000,27.720000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.980000,-1.536000,28.355000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<6.345000,-1.536000,27.720000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.075000,-1.536000,30.260000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.345000,-1.536000,30.260000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<5.075000,-1.536000,30.260000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.440000,-1.536000,29.625000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.075000,-1.536000,30.260000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<4.440000,-1.536000,29.625000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.345000,-1.536000,30.260000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.980000,-1.536000,29.625000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<6.345000,-1.536000,30.260000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.980000,-1.536000,28.355000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.980000,-1.536000,29.625000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<6.980000,-1.536000,29.625000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.075000,-1.536000,27.720000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.440000,-1.536000,27.085000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<4.440000,-1.536000,27.085000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.440000,-1.536000,27.085000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.440000,-1.536000,25.815000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<4.440000,-1.536000,25.815000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.440000,-1.536000,25.815000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.075000,-1.536000,25.180000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<4.440000,-1.536000,25.815000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.075000,-1.536000,25.180000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.345000,-1.536000,25.180000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<5.075000,-1.536000,25.180000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.345000,-1.536000,25.180000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.980000,-1.536000,25.815000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<6.345000,-1.536000,25.180000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.980000,-1.536000,25.815000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.980000,-1.536000,27.085000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<6.980000,-1.536000,27.085000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.980000,-1.536000,27.085000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.345000,-1.536000,27.720000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<6.345000,-1.536000,27.720000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<5.710000,-1.536000,28.990000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<5.710000,-1.536000,26.450000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.674700,-1.536000,26.891503>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.818675,-1.536000,26.891503>}
box{<0,0,-0.063500><1.143975,0.036000,0.063500> rotate<0,0.000000,0> translate<2.674700,-1.536000,26.891503> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.818675,-1.536000,26.891503>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.818675,-1.536000,27.463491>}
box{<0,0,-0.063500><0.571988,0.036000,0.063500> rotate<0,90.000000,0> translate<3.818675,-1.536000,27.463491> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.818675,-1.536000,27.463491>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.628013,-1.536000,27.654153>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<3.628013,-1.536000,27.654153> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.628013,-1.536000,27.654153>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.246688,-1.536000,27.654153>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,0.000000,0> translate<3.246688,-1.536000,27.654153> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.246688,-1.536000,27.654153>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.056025,-1.536000,27.463491>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<3.056025,-1.536000,27.463491> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.056025,-1.536000,27.463491>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.056025,-1.536000,26.891503>}
box{<0,0,-0.063500><0.571988,0.036000,0.063500> rotate<0,-90.000000,0> translate<3.056025,-1.536000,26.891503> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.818675,-1.536000,28.060900>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.674700,-1.536000,28.060900>}
box{<0,0,-0.063500><1.143975,0.036000,0.063500> rotate<0,0.000000,0> translate<2.674700,-1.536000,28.060900> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.674700,-1.536000,28.060900>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.056025,-1.536000,28.442225>}
box{<0,0,-0.063500><0.539275,0.036000,0.063500> rotate<0,-44.997030,0> translate<2.674700,-1.536000,28.060900> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.056025,-1.536000,28.442225>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.674700,-1.536000,28.823550>}
box{<0,0,-0.063500><0.539275,0.036000,0.063500> rotate<0,44.997030,0> translate<2.674700,-1.536000,28.823550> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.674700,-1.536000,28.823550>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.818675,-1.536000,28.823550>}
box{<0,0,-0.063500><1.143975,0.036000,0.063500> rotate<0,0.000000,0> translate<2.674700,-1.536000,28.823550> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.674700,-1.536000,29.230297>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.818675,-1.536000,29.230297>}
box{<0,0,-0.063500><1.143975,0.036000,0.063500> rotate<0,0.000000,0> translate<2.674700,-1.536000,29.230297> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.818675,-1.536000,29.230297>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.818675,-1.536000,29.802284>}
box{<0,0,-0.063500><0.571988,0.036000,0.063500> rotate<0,90.000000,0> translate<3.818675,-1.536000,29.802284> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.818675,-1.536000,29.802284>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.628013,-1.536000,29.992947>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<3.628013,-1.536000,29.992947> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.628013,-1.536000,29.992947>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.246688,-1.536000,29.992947>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,0.000000,0> translate<3.246688,-1.536000,29.992947> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.246688,-1.536000,29.992947>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.056025,-1.536000,29.802284>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<3.056025,-1.536000,29.802284> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.056025,-1.536000,29.802284>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.056025,-1.536000,29.230297>}
box{<0,0,-0.063500><0.571988,0.036000,0.063500> rotate<0,-90.000000,0> translate<3.056025,-1.536000,29.230297> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.056025,-1.536000,29.611622>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.674700,-1.536000,29.992947>}
box{<0,0,-0.063500><0.539275,0.036000,0.063500> rotate<0,44.997030,0> translate<2.674700,-1.536000,29.992947> }
//R1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<12.930000,-1.536000,12.050000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<12.930000,-1.536000,11.669000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,-90.000000,0> translate<12.930000,-1.536000,11.669000> }
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<12.041000,-1.536000,11.161000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<13.819000,-1.536000,11.161000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<13.819000,-1.536000,5.319000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<12.041000,-1.536000,5.319000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.819000,-1.536000,11.415000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.041000,-1.536000,11.415000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<12.041000,-1.536000,11.415000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.787000,-1.536000,11.161000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.787000,-1.536000,10.780000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<11.787000,-1.536000,10.780000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.914000,-1.536000,10.653000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.787000,-1.536000,10.780000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<11.787000,-1.536000,10.780000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.073000,-1.536000,11.161000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.073000,-1.536000,10.780000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<14.073000,-1.536000,10.780000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.946000,-1.536000,10.653000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.073000,-1.536000,10.780000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<13.946000,-1.536000,10.653000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.914000,-1.536000,5.827000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.787000,-1.536000,5.700000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<11.787000,-1.536000,5.700000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.914000,-1.536000,5.827000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.914000,-1.536000,10.653000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,90.000000,0> translate<11.914000,-1.536000,10.653000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.946000,-1.536000,5.827000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.073000,-1.536000,5.700000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<13.946000,-1.536000,5.827000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.946000,-1.536000,5.827000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.946000,-1.536000,10.653000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,90.000000,0> translate<13.946000,-1.536000,10.653000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.787000,-1.536000,5.319000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.787000,-1.536000,5.700000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<11.787000,-1.536000,5.700000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.073000,-1.536000,5.319000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.073000,-1.536000,5.700000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<14.073000,-1.536000,5.700000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.819000,-1.536000,5.065000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.041000,-1.536000,5.065000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<12.041000,-1.536000,5.065000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<12.930000,-1.536000,4.811000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<12.930000,-1.536000,4.430000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,-90.000000,0> translate<12.930000,-1.536000,4.430000> }
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-270.000000,0> translate<12.930000,-1.536000,11.542000>}
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-270.000000,0> translate<12.930000,-1.536000,4.938000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.126500,-1.536000,7.904703>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.270475,-1.536000,7.904703>}
box{<0,0,-0.063500><1.143975,0.036000,0.063500> rotate<0,0.000000,0> translate<14.126500,-1.536000,7.904703> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.270475,-1.536000,7.904703>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.270475,-1.536000,8.476691>}
box{<0,0,-0.063500><0.571987,0.036000,0.063500> rotate<0,90.000000,0> translate<15.270475,-1.536000,8.476691> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.270475,-1.536000,8.476691>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.079813,-1.536000,8.667353>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<15.079813,-1.536000,8.667353> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.079813,-1.536000,8.667353>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.698488,-1.536000,8.667353>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,0.000000,0> translate<14.698488,-1.536000,8.667353> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.698488,-1.536000,8.667353>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.507825,-1.536000,8.476691>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<14.507825,-1.536000,8.476691> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.507825,-1.536000,8.476691>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.507825,-1.536000,7.904703>}
box{<0,0,-0.063500><0.571987,0.036000,0.063500> rotate<0,-90.000000,0> translate<14.507825,-1.536000,7.904703> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.507825,-1.536000,8.286028>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.126500,-1.536000,8.667353>}
box{<0,0,-0.063500><0.539275,0.036000,0.063500> rotate<0,44.997030,0> translate<14.126500,-1.536000,8.667353> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.889150,-1.536000,9.074100>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.270475,-1.536000,9.455425>}
box{<0,0,-0.063500><0.539275,0.036000,0.063500> rotate<0,-44.997030,0> translate<14.889150,-1.536000,9.074100> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.270475,-1.536000,9.455425>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.126500,-1.536000,9.455425>}
box{<0,0,-0.063500><1.143975,0.036000,0.063500> rotate<0,0.000000,0> translate<14.126500,-1.536000,9.455425> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.126500,-1.536000,9.074100>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.126500,-1.536000,9.836750>}
box{<0,0,-0.063500><0.762650,0.036000,0.063500> rotate<0,90.000000,0> translate<14.126500,-1.536000,9.836750> }
//R2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.185000,0.000000,10.651200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.185000,0.000000,9.228800>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,-90.000000,0> translate<9.185000,0.000000,9.228800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.455000,0.000000,10.651200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.455000,0.000000,9.228800>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,-90.000000,0> translate<10.455000,0.000000,9.228800> }
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-90.000000,0> translate<9.820000,0.000000,9.076400>}
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-90.000000,0> translate<9.820000,0.000000,10.803600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.199200,0.000000,8.520800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.029803,0.000000,8.520800>}
box{<0,0,-0.050800><1.169397,0.036000,0.050800> rotate<0,0.000000,0> translate<11.029803,0.000000,8.520800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.029803,0.000000,8.520800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.029803,0.000000,9.105497>}
box{<0,0,-0.050800><0.584697,0.036000,0.050800> rotate<0,90.000000,0> translate<11.029803,0.000000,9.105497> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.029803,0.000000,9.105497>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.224703,0.000000,9.300397>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<11.029803,0.000000,9.105497> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.224703,0.000000,9.300397>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.614503,0.000000,9.300397>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<11.224703,0.000000,9.300397> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.614503,0.000000,9.300397>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.809403,0.000000,9.105497>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,44.997030,0> translate<11.614503,0.000000,9.300397> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.809403,0.000000,9.105497>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.809403,0.000000,8.520800>}
box{<0,0,-0.050800><0.584697,0.036000,0.050800> rotate<0,-90.000000,0> translate<11.809403,0.000000,8.520800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.809403,0.000000,8.910597>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.199200,0.000000,9.300397>}
box{<0,0,-0.050800><0.551258,0.036000,0.050800> rotate<0,-44.997260,0> translate<11.809403,0.000000,8.910597> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.199200,0.000000,10.469794>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.199200,0.000000,9.690197>}
box{<0,0,-0.050800><0.779597,0.036000,0.050800> rotate<0,-90.000000,0> translate<12.199200,0.000000,9.690197> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.199200,0.000000,9.690197>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.419603,0.000000,10.469794>}
box{<0,0,-0.050800><1.102516,0.036000,0.050800> rotate<0,44.997030,0> translate<11.419603,0.000000,10.469794> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.419603,0.000000,10.469794>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.224703,0.000000,10.469794>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,0.000000,0> translate<11.224703,0.000000,10.469794> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.224703,0.000000,10.469794>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.029803,0.000000,10.274894>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<11.029803,0.000000,10.274894> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.029803,0.000000,10.274894>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.029803,0.000000,9.885094>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,-90.000000,0> translate<11.029803,0.000000,9.885094> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.029803,0.000000,9.885094>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.224703,0.000000,9.690197>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,44.996571,0> translate<11.029803,0.000000,9.885094> }
//R3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.425000,0.000000,14.308800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.425000,0.000000,15.731200>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,90.000000,0> translate<10.425000,0.000000,15.731200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.155000,0.000000,14.308800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.155000,0.000000,15.731200>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,90.000000,0> translate<9.155000,0.000000,15.731200> }
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-270.000000,0> translate<9.790000,0.000000,15.883600>}
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-270.000000,0> translate<9.790000,0.000000,14.156400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.279200,0.000000,14.002003>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.109803,0.000000,14.002003>}
box{<0,0,-0.050800><1.169397,0.036000,0.050800> rotate<0,0.000000,0> translate<11.109803,0.000000,14.002003> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.109803,0.000000,14.002003>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.109803,0.000000,14.586700>}
box{<0,0,-0.050800><0.584697,0.036000,0.050800> rotate<0,90.000000,0> translate<11.109803,0.000000,14.586700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.109803,0.000000,14.586700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.304703,0.000000,14.781600>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<11.109803,0.000000,14.586700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.304703,0.000000,14.781600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.694503,0.000000,14.781600>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<11.304703,0.000000,14.781600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.694503,0.000000,14.781600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.889403,0.000000,14.586700>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,44.997030,0> translate<11.694503,0.000000,14.781600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.889403,0.000000,14.586700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.889403,0.000000,14.002003>}
box{<0,0,-0.050800><0.584697,0.036000,0.050800> rotate<0,-90.000000,0> translate<11.889403,0.000000,14.002003> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.889403,0.000000,14.391800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.279200,0.000000,14.781600>}
box{<0,0,-0.050800><0.551258,0.036000,0.050800> rotate<0,-44.997260,0> translate<11.889403,0.000000,14.391800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.304703,0.000000,15.171400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.109803,0.000000,15.366297>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,44.996571,0> translate<11.109803,0.000000,15.366297> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.109803,0.000000,15.366297>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.109803,0.000000,15.756097>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,90.000000,0> translate<11.109803,0.000000,15.756097> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.109803,0.000000,15.756097>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.304703,0.000000,15.950997>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<11.109803,0.000000,15.756097> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.304703,0.000000,15.950997>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.499603,0.000000,15.950997>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,0.000000,0> translate<11.304703,0.000000,15.950997> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.499603,0.000000,15.950997>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.694503,0.000000,15.756097>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,44.997030,0> translate<11.499603,0.000000,15.950997> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.694503,0.000000,15.756097>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.694503,0.000000,15.561197>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,-90.000000,0> translate<11.694503,0.000000,15.561197> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.694503,0.000000,15.756097>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.889403,0.000000,15.950997>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<11.694503,0.000000,15.756097> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.889403,0.000000,15.950997>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.084303,0.000000,15.950997>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,0.000000,0> translate<11.889403,0.000000,15.950997> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.084303,0.000000,15.950997>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.279200,0.000000,15.756097>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,44.997489,0> translate<12.084303,0.000000,15.950997> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.279200,0.000000,15.756097>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.279200,0.000000,15.366297>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,-90.000000,0> translate<12.279200,0.000000,15.366297> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.279200,0.000000,15.366297>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.084303,0.000000,15.171400>}
box{<0,0,-0.050800><0.275626,0.036000,0.050800> rotate<0,-44.997030,0> translate<12.084303,0.000000,15.171400> }

texture{col_slk}
}
#end
translate<mac_x_ver,mac_y_ver,mac_z_ver>
rotate<mac_x_rot,mac_y_rot,mac_z_rot>
}//End union
#end

#if(use_file_as_inc=off)
object{  EASY_LED(-23.450000,0,-16.500000,pcb_rotate_x,pcb_rotate_y,pcb_rotate_z)
#if(pcb_upsidedown=on)
rotate pcb_rotdir*180
#end
}
#end


//Parts not found in 3dpack.dat or 3dusrpac.dat are:
//IC1		SOP18
//U$1		3,2
//U$2		3,2
//U$3		3,2
