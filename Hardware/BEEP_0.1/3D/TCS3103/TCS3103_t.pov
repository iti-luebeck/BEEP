//POVRay-Datei erstellt mit 3d41.ulp v20110101
///home/flexxxv/eagle/BEEP_0.1/TCS3103.brd
//28.04.13 13:24

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
#local cam_y = 129;
#local cam_z = -69;
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

#local lgt1_pos_x = 10;
#local lgt1_pos_y = 17;
#local lgt1_pos_z = 15;
#local lgt1_intense = 0.712086;
#local lgt2_pos_x = -10;
#local lgt2_pos_y = 17;
#local lgt2_pos_z = 15;
#local lgt2_intense = 0.712086;
#local lgt3_pos_x = 10;
#local lgt3_pos_y = 17;
#local lgt3_pos_z = -10;
#local lgt3_intense = 0.712086;
#local lgt4_pos_x = -10;
#local lgt4_pos_y = 17;
#local lgt4_pos_z = -10;
#local lgt4_intense = 0.712086;

//Do not change these values
#declare pcb_height = 1.500000;
#declare pcb_cuheight = 0.035000;
#declare pcb_x_size = 28.200000;
#declare pcb_y_size = 30.000000;
#declare pcb_layer1_used = 1;
#declare pcb_layer16_used = 0;
#declare inc_testmode = off;
#declare global_seed=seed(797);
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
	//translate<-14.100000,0,-15.000000>
}
#end

background{col_bgr}
light_source{<lgt1_pos_x,lgt1_pos_y,lgt1_pos_z> White*lgt1_intense shadowless}
light_source{<lgt2_pos_x,lgt2_pos_y,lgt2_pos_z> White*lgt2_intense shadowless}
light_source{<lgt3_pos_x,lgt3_pos_y,lgt3_pos_z> White*lgt3_intense shadowless}
light_source{<lgt4_pos_x,lgt4_pos_y,lgt4_pos_z> White*lgt4_intense}
#end


#macro TCS3103(mac_x_ver,mac_y_ver,mac_z_ver,mac_x_rot,mac_y_rot,mac_z_rot)
union{
#if(pcb_board = on)
difference{
union{
//Platine
prism{-1.500000,0.000000,8
<0.000000,0.000000><28.200000,0.000000>
<28.200000,0.000000><28.200000,30.000000>
<28.200000,30.000000><0.000000,30.000000>
<0.000000,30.000000><0.000000,0.000000>
texture{col_brd}}
}//End union(PCB)
//Bohrungen(real)/Bauteile
cylinder{<24.100000,1,4.100000><24.100000,-5,4.100000>1.600000 texture{col_hls}}
cylinder{<4.200000,1,4.100000><4.200000,-5,4.100000>1.600000 texture{col_hls}}
cylinder{<24.100000,1,25.700000><24.100000,-5,25.700000>1.600000 texture{col_hls}}
//Bohrungen(real)/Platine
//Bohrungen(real)/Durchkontaktierungen
}//End difference(reale Bohrungen/Durchbrüche)
#end
#if(pcb_parts=on)//Bauteile
union{
//MPD-File
#ifndef(pack_C1) #declare global_pack_C1=yes; object {CAP_SMD_CHIP_0805()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<8.900000,0.000000,17.800000>translate<0,0.035000,0> }#end		//SMD Kondensator 0805 C1 100n C0805
#ifndef(pack_JP1) #declare global_pack_JP1=yes; object {CON_PH_2X4()translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,180> translate<14.380000,-1.500000,6.720000>}#end		//Stiftleiste 2,54mm Raster 4Pin 2Reihen (pinhead.lib) JP1  2X04
#ifndef(pack_LED1) #declare global_pack_LED1=yes; object {DIODE_DIS_LED_3MM(White,0.500000,0.000000,)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<23.180000,0.000000,12.000000>}#end		//Diskrete 3MM LED LED1  LED3MM
#ifndef(pack_LED2) #declare global_pack_LED2=yes; object {DIODE_DIS_LED_3MM(White,0.500000,0.000000,)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<13.940000,0.000000,26.060000>}#end		//Diskrete 3MM LED LED2  LED3MM
#ifndef(pack_LED3) #declare global_pack_LED3=yes; object {DIODE_DIS_LED_3MM(White,0.500000,0.000000,)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<4.620000,0.000000,11.960000>}#end		//Diskrete 3MM LED LED3  LED3MM
#ifndef(pack_LED4) #declare global_pack_LED4=yes; object {DIODE_SMD_LED_PLCC2()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<23.200000,0.000000,14.800000>translate<0,0.035000,0> }#end		//SMD-LED im PLCC2 LED4 NFSG036BT NFSG036BT
#ifndef(pack_LED5) #declare global_pack_LED5=yes; object {DIODE_SMD_LED_PLCC2()translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<13.900000,0.000000,23.200000>translate<0,0.035000,0> }#end		//SMD-LED im PLCC2 LED5 NFSG036BT NFSG036BT
#ifndef(pack_LED6) #declare global_pack_LED6=yes; object {DIODE_SMD_LED_PLCC2()translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<4.600000,0.000000,15.300000>translate<0,0.035000,0> }#end		//SMD-LED im PLCC2 LED6 NFSG036BT NFSG036BT
#ifndef(pack_R1) #declare global_pack_R1=yes; object {RES_SMD_CHIP_0805("0R0",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<4.650000,0.000000,26.390000>translate<0,0.035000,0> }#end		//SMD Widerstand 0805 R1  M0805
#ifndef(pack_R2) #declare global_pack_R2=yes; object {RES_SMD_CHIP_0805("0R0",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<4.650000,0.000000,23.440000>translate<0,0.035000,0> }#end		//SMD Widerstand 0805 R2  M0805
#ifndef(pack_R3) #declare global_pack_R3=yes; object {RES_SMD_CHIP_0805("0R0",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<4.650000,0.000000,20.130000>translate<0,0.035000,0> }#end		//SMD Widerstand 0805 R3  M0805
}//End union
#end
#if(pcb_pads_smds=on)
//Lötaugen&SMD/Bauteile
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<8.900000,0.000000,18.750000>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<8.900000,0.000000,16.850000>}
object{TOOLS_PCB_SMD(3.000000,0.400000,0.037000,80) rotate<0,-0.000000,0> texture{col_pds} translate<11.980000,0.000000,16.780000>}
object{TOOLS_PCB_SMD(3.000000,0.400000,0.037000,80) rotate<0,-0.000000,0> texture{col_pds} translate<11.980000,0.000000,16.130000>}
object{TOOLS_PCB_SMD(3.000000,0.400000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<11.980000,0.000000,17.430000>}
object{TOOLS_PCB_SMD(3.000000,0.400000,0.037000,80) rotate<0,-0.000000,0> texture{col_pds} translate<15.980000,0.000000,16.130000>}
object{TOOLS_PCB_SMD(3.000000,0.400000,0.037000,80) rotate<0,-0.000000,0> texture{col_pds} translate<15.980000,0.000000,16.780000>}
object{TOOLS_PCB_SMD(3.000000,0.400000,0.037000,80) rotate<0,-0.000000,0> texture{col_pds} translate<15.980000,0.000000,17.430000>}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<15.650000,0,10.530000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<13.110000,0,10.530000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<15.650000,0,7.990000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<13.110000,0,7.990000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<15.650000,0,5.450000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<13.110000,0,5.450000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<15.650000,0,2.910000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<13.110000,0,2.910000> texture{col_thl}}
#ifndef(global_pack_LED1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<21.910000,0,12.000000> texture{col_thl}}
#ifndef(global_pack_LED1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<24.450000,0,12.000000> texture{col_thl}}
#ifndef(global_pack_LED2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<15.210000,0,26.060000> texture{col_thl}}
#ifndef(global_pack_LED2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<12.670000,0,26.060000> texture{col_thl}}
#ifndef(global_pack_LED3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<5.890000,0,11.960000> texture{col_thl}}
#ifndef(global_pack_LED3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<3.350000,0,11.960000> texture{col_thl}}
object{TOOLS_PCB_SMD(1.300000,3.800000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<21.850000,0.000000,14.800000>}
object{TOOLS_PCB_SMD(1.300000,3.800000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<24.550000,0.000000,14.800000>}
object{TOOLS_PCB_SMD(1.300000,3.800000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<15.250000,0.000000,23.200000>}
object{TOOLS_PCB_SMD(1.300000,3.800000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<12.550000,0.000000,23.200000>}
object{TOOLS_PCB_SMD(1.300000,3.800000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<5.950000,0.000000,15.300000>}
object{TOOLS_PCB_SMD(1.300000,3.800000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<3.250000,0.000000,15.300000>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<5.600000,0.000000,26.390000>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<3.700000,0.000000,26.390000>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<5.600000,0.000000,23.440000>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<3.700000,0.000000,23.440000>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<3.700000,0.000000,20.130000>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<5.600000,0.000000,20.130000>}
//Lötaugen/Durchkontaktierungen
#end
#if(pcb_wires=on)
union{
//Signale
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.700000,0.000000,11.100000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.700000,0.000000,22.100000>}
box{<0,0,-0.304800><11.000000,0.035000,0.304800> rotate<0,90.000000,0> translate<1.700000,0.000000,22.100000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.700000,0.000000,11.100000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.800000,0.000000,10.000000>}
box{<0,0,-0.304800><1.555635,0.035000,0.304800> rotate<0,44.997030,0> translate<1.700000,0.000000,11.100000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.700000,0.000000,22.100000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.900000,0.000000,23.300000>}
box{<0,0,-0.304800><1.697056,0.035000,0.304800> rotate<0,-44.997030,0> translate<1.700000,0.000000,22.100000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.250000,0.000000,15.300000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.250000,0.000000,19.680000>}
box{<0,0,-0.304800><4.380000,0.035000,0.304800> rotate<0,90.000000,0> translate<3.250000,0.000000,19.680000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<3.250000,0.000000,15.300000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<3.350000,0.000000,15.200000>}
box{<0,0,-0.406400><0.141421,0.035000,0.406400> rotate<0,44.997030,0> translate<3.250000,0.000000,15.300000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.350000,0.000000,11.960000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.350000,0.000000,15.200000>}
box{<0,0,-0.304800><3.240000,0.035000,0.304800> rotate<0,90.000000,0> translate<3.350000,0.000000,15.200000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.900000,0.000000,23.300000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.560000,0.000000,23.300000>}
box{<0,0,-0.304800><0.660000,0.035000,0.304800> rotate<0,0.000000,0> translate<2.900000,0.000000,23.300000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.250000,0.000000,19.680000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.700000,0.000000,20.130000>}
box{<0,0,-0.304800><0.636396,0.035000,0.304800> rotate<0,-44.997030,0> translate<3.250000,0.000000,19.680000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.560000,0.000000,23.300000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.700000,0.000000,23.440000>}
box{<0,0,-0.304800><0.197990,0.035000,0.304800> rotate<0,-44.997030,0> translate<3.560000,0.000000,23.300000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.700000,0.000000,23.440000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.700000,0.000000,26.390000>}
box{<0,0,-0.304800><2.950000,0.035000,0.304800> rotate<0,90.000000,0> translate<3.700000,0.000000,26.390000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.700000,0.000000,23.440000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.800000,0.000000,23.340000>}
box{<0,0,-0.304800><0.141421,0.035000,0.304800> rotate<0,44.997030,0> translate<3.700000,0.000000,23.440000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.800000,0.000000,22.600000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.800000,0.000000,23.340000>}
box{<0,0,-0.304800><0.740000,0.035000,0.304800> rotate<0,90.000000,0> translate<3.800000,0.000000,23.340000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.800000,0.000000,22.600000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.400000,0.000000,21.000000>}
box{<0,0,-0.304800><2.262742,0.035000,0.304800> rotate<0,44.997030,0> translate<3.800000,0.000000,22.600000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.400000,0.000000,20.330000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.400000,0.000000,21.000000>}
box{<0,0,-0.304800><0.670000,0.035000,0.304800> rotate<0,90.000000,0> translate<5.400000,0.000000,21.000000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.800000,0.000000,10.000000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.500000,0.000000,10.000000>}
box{<0,0,-0.304800><2.700000,0.035000,0.304800> rotate<0,0.000000,0> translate<2.800000,0.000000,10.000000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.400000,0.000000,20.330000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.600000,0.000000,20.130000>}
box{<0,0,-0.203200><0.282843,0.035000,0.203200> rotate<0,44.997030,0> translate<5.400000,0.000000,20.330000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.800000,0.000000,11.950000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.800000,0.000000,11.400000>}
box{<0,0,-0.304800><0.550000,0.035000,0.304800> rotate<0,-90.000000,0> translate<5.800000,0.000000,11.400000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.800000,0.000000,11.950000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.890000,0.000000,11.960000>}
box{<0,0,-0.203200><0.090554,0.035000,0.203200> rotate<0,-6.339773,0> translate<5.800000,0.000000,11.950000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<5.890000,0.000000,11.960000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<5.890000,0.000000,15.240000>}
box{<0,0,-0.406400><3.280000,0.035000,0.406400> rotate<0,90.000000,0> translate<5.890000,0.000000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.790000,0.000000,15.040000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.950000,0.000000,15.300000>}
box{<0,0,-0.203200><0.305287,0.035000,0.203200> rotate<0,-58.388644,0> translate<5.790000,0.000000,15.040000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<5.890000,0.000000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<5.950000,0.000000,15.300000>}
box{<0,0,-0.406400><0.084853,0.035000,0.406400> rotate<0,-44.997030,0> translate<5.890000,0.000000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.950000,0.000000,15.300000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.000000,0.000000,17.050000>}
box{<0,0,-0.203200><1.750714,0.035000,0.203200> rotate<0,-88.357591,0> translate<5.950000,0.000000,15.300000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.000000,0.000000,17.400000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.000000,0.000000,17.050000>}
box{<0,0,-0.304800><0.350000,0.035000,0.304800> rotate<0,-90.000000,0> translate<6.000000,0.000000,17.050000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.000000,0.000000,17.400000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.700000,0.000000,18.100000>}
box{<0,0,-0.304800><0.989949,0.035000,0.304800> rotate<0,-44.997030,0> translate<6.000000,0.000000,17.400000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.700000,0.000000,18.900000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.700000,0.000000,18.100000>}
box{<0,0,-0.304800><0.800000,0.035000,0.304800> rotate<0,-90.000000,0> translate<6.700000,0.000000,18.100000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.600000,0.000000,26.390000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.110000,0.000000,27.900000>}
box{<0,0,-0.304800><2.135462,0.035000,0.304800> rotate<0,-44.997030,0> translate<5.600000,0.000000,26.390000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.500000,0.000000,11.000000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.500000,0.000000,18.000000>}
box{<0,0,-0.203200><7.000000,0.035000,0.203200> rotate<0,90.000000,0> translate<7.500000,0.000000,18.000000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.500000,0.000000,18.000000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.300000,0.000000,18.800000>}
box{<0,0,-0.203200><1.131371,0.035000,0.203200> rotate<0,-44.997030,0> translate<7.500000,0.000000,18.000000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.700000,0.000000,18.900000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.300000,0.000000,20.500000>}
box{<0,0,-0.304800><2.262742,0.035000,0.304800> rotate<0,-44.997030,0> translate<6.700000,0.000000,18.900000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.300000,0.000000,18.800000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.850000,0.000000,18.800000>}
box{<0,0,-0.203200><0.550000,0.035000,0.203200> rotate<0,0.000000,0> translate<8.300000,0.000000,18.800000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.900000,0.000000,16.850000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.900000,0.000000,11.400000>}
box{<0,0,-0.203200><5.450000,0.035000,0.203200> rotate<0,-90.000000,0> translate<8.900000,0.000000,11.400000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.850000,0.000000,18.800000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.900000,0.000000,18.750000>}
box{<0,0,-0.203200><0.070711,0.035000,0.203200> rotate<0,44.997030,0> translate<8.850000,0.000000,18.800000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.900000,0.000000,18.750000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.950000,0.000000,18.700000>}
box{<0,0,-0.203200><0.070711,0.035000,0.203200> rotate<0,44.997030,0> translate<8.900000,0.000000,18.750000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.900000,0.000000,16.850000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.970000,0.000000,16.780000>}
box{<0,0,-0.203200><0.098995,0.035000,0.203200> rotate<0,44.997030,0> translate<8.900000,0.000000,16.850000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.950000,0.000000,18.700000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.500000,0.000000,18.700000>}
box{<0,0,-0.203200><0.550000,0.035000,0.203200> rotate<0,0.000000,0> translate<8.950000,0.000000,18.700000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.000000,0.000000,5.500000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.000000,0.000000,3.400000>}
box{<0,0,-0.304800><2.100000,0.035000,0.304800> rotate<0,-90.000000,0> translate<10.000000,0.000000,3.400000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.500000,0.000000,10.000000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.000000,0.000000,5.500000>}
box{<0,0,-0.304800><6.363961,0.035000,0.304800> rotate<0,44.997030,0> translate<5.500000,0.000000,10.000000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.400000,0.000000,15.900000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.400000,0.000000,12.100000>}
box{<0,0,-0.203200><3.800000,0.035000,0.203200> rotate<0,-90.000000,0> translate<10.400000,0.000000,12.100000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.400000,0.000000,15.900000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.630000,0.000000,16.130000>}
box{<0,0,-0.203200><0.325269,0.035000,0.203200> rotate<0,-44.997030,0> translate<10.400000,0.000000,15.900000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.500000,0.000000,18.700000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.770000,0.000000,17.430000>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,44.997030,0> translate<9.500000,0.000000,18.700000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.900000,0.000000,11.400000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.000000,0.000000,9.300000>}
box{<0,0,-0.203200><2.969848,0.035000,0.203200> rotate<0,44.997030,0> translate<8.900000,0.000000,11.400000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.800000,0.000000,11.400000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.500000,0.000000,5.700000>}
box{<0,0,-0.304800><8.061017,0.035000,0.304800> rotate<0,44.997030,0> translate<5.800000,0.000000,11.400000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.500000,0.000000,5.100000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.500000,0.000000,5.700000>}
box{<0,0,-0.304800><0.600000,0.035000,0.304800> rotate<0,90.000000,0> translate<11.500000,0.000000,5.700000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.630000,0.000000,16.130000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.980000,0.000000,16.130000>}
box{<0,0,-0.203200><1.350000,0.035000,0.203200> rotate<0,0.000000,0> translate<10.630000,0.000000,16.130000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.970000,0.000000,16.780000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.980000,0.000000,16.780000>}
box{<0,0,-0.203200><3.010000,0.035000,0.203200> rotate<0,0.000000,0> translate<8.970000,0.000000,16.780000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.770000,0.000000,17.430000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.980000,0.000000,17.430000>}
box{<0,0,-0.203200><1.210000,0.035000,0.203200> rotate<0,0.000000,0> translate<10.770000,0.000000,17.430000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.000000,0.000000,3.400000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.000000,0.000000,1.400000>}
box{<0,0,-0.304800><2.828427,0.035000,0.304800> rotate<0,44.997030,0> translate<10.000000,0.000000,3.400000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.400000,0.000000,12.100000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.000000,0.000000,10.500000>}
box{<0,0,-0.203200><2.262742,0.035000,0.203200> rotate<0,44.997030,0> translate<10.400000,0.000000,12.100000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.600000,0.000000,23.440000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.310000,0.000000,23.440000>}
box{<0,0,-0.304800><6.710000,0.035000,0.304800> rotate<0,0.000000,0> translate<5.600000,0.000000,23.440000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.500000,0.000000,5.100000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.500000,0.000000,4.100000>}
box{<0,0,-0.304800><1.414214,0.035000,0.304800> rotate<0,44.997030,0> translate<11.500000,0.000000,5.100000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.310000,0.000000,23.440000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.550000,0.000000,23.200000>}
box{<0,0,-0.304800><0.339411,0.035000,0.304800> rotate<0,44.997030,0> translate<12.310000,0.000000,23.440000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.350000,0.000000,23.000000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.550000,0.000000,23.200000>}
box{<0,0,-0.203200><0.282843,0.035000,0.203200> rotate<0,-44.997030,0> translate<12.350000,0.000000,23.000000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.550000,0.000000,23.200000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.550000,0.000000,25.940000>}
box{<0,0,-0.203200><2.740000,0.035000,0.203200> rotate<0,90.000000,0> translate<12.550000,0.000000,25.940000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.600000,0.000000,4.100000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.600000,0.000000,3.420000>}
box{<0,0,-0.304800><0.680000,0.035000,0.304800> rotate<0,-90.000000,0> translate<12.600000,0.000000,3.420000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.500000,0.000000,4.100000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.600000,0.000000,4.100000>}
box{<0,0,-0.203200><0.100000,0.035000,0.203200> rotate<0,0.000000,0> translate<12.500000,0.000000,4.100000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.550000,0.000000,25.940000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.670000,0.000000,26.060000>}
box{<0,0,-0.203200><0.169706,0.035000,0.203200> rotate<0,-44.997030,0> translate<12.550000,0.000000,25.940000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.000000,0.000000,10.500000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.040000,0.000000,10.500000>}
box{<0,0,-0.203200><1.040000,0.035000,0.203200> rotate<0,0.000000,0> translate<12.000000,0.000000,10.500000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.500000,0.000000,11.000000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.050000,0.000000,5.450000>}
box{<0,0,-0.203200><7.848885,0.035000,0.203200> rotate<0,44.997030,0> translate<7.500000,0.000000,11.000000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.600000,0.000000,3.420000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.110000,0.000000,2.910000>}
box{<0,0,-0.304800><0.721249,0.035000,0.304800> rotate<0,44.997030,0> translate<12.600000,0.000000,3.420000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.050000,0.000000,5.450000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.110000,0.000000,5.450000>}
box{<0,0,-0.203200><0.060000,0.035000,0.203200> rotate<0,0.000000,0> translate<13.050000,0.000000,5.450000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.040000,0.000000,10.500000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.110000,0.000000,10.530000>}
box{<0,0,-0.203200><0.076158,0.035000,0.203200> rotate<0,-23.197059,0> translate<13.040000,0.000000,10.500000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.000000,0.000000,9.300000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.000000,0.000000,9.300000>}
box{<0,0,-0.203200><3.000000,0.035000,0.203200> rotate<0,0.000000,0> translate<11.000000,0.000000,9.300000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.000000,0.000000,1.400000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.140000,0.000000,1.400000>}
box{<0,0,-0.304800><2.140000,0.035000,0.304800> rotate<0,0.000000,0> translate<12.000000,0.000000,1.400000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.400000,0.000000,8.900000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.400000,0.000000,4.160000>}
box{<0,0,-0.203200><4.740000,0.035000,0.203200> rotate<0,-90.000000,0> translate<14.400000,0.000000,4.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.000000,0.000000,9.300000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.400000,0.000000,8.900000>}
box{<0,0,-0.203200><0.565685,0.035000,0.203200> rotate<0,44.997030,0> translate<14.000000,0.000000,9.300000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.300000,0.000000,20.500000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.700000,0.000000,20.500000>}
box{<0,0,-0.304800><6.400000,0.035000,0.304800> rotate<0,0.000000,0> translate<8.300000,0.000000,20.500000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.700000,0.000000,20.500000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.250000,0.000000,21.050000>}
box{<0,0,-0.304800><0.777817,0.035000,0.304800> rotate<0,-44.997030,0> translate<14.700000,0.000000,20.500000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.250000,0.000000,23.200000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.250000,0.000000,21.050000>}
box{<0,0,-0.304800><2.150000,0.035000,0.304800> rotate<0,-90.000000,0> translate<15.250000,0.000000,21.050000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.210000,0.000000,26.060000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.250000,0.000000,26.020000>}
box{<0,0,-0.203200><0.056569,0.035000,0.203200> rotate<0,44.997030,0> translate<15.210000,0.000000,26.060000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.250000,0.000000,23.200000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.250000,0.000000,26.020000>}
box{<0,0,-0.203200><2.820000,0.035000,0.203200> rotate<0,90.000000,0> translate<15.250000,0.000000,26.020000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.140000,0.000000,1.400000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.650000,0.000000,2.910000>}
box{<0,0,-0.304800><2.135462,0.035000,0.304800> rotate<0,-44.997030,0> translate<14.140000,0.000000,1.400000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.400000,0.000000,4.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.650000,0.000000,2.910000>}
box{<0,0,-0.203200><1.767767,0.035000,0.203200> rotate<0,44.997030,0> translate<14.400000,0.000000,4.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.650000,0.000000,5.450000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.700000,0.000000,5.400000>}
box{<0,0,-0.203200><0.070711,0.035000,0.203200> rotate<0,44.997030,0> translate<15.650000,0.000000,5.450000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.250000,0.000000,23.200000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.700000,0.000000,22.750000>}
box{<0,0,-0.203200><0.636396,0.035000,0.203200> rotate<0,44.997030,0> translate<15.250000,0.000000,23.200000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.700000,0.000000,22.700000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.700000,0.000000,22.750000>}
box{<0,0,-0.203200><0.050000,0.035000,0.203200> rotate<0,90.000000,0> translate<15.700000,0.000000,22.750000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.110000,0.000000,27.900000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.100000,0.000000,27.900000>}
box{<0,0,-0.304800><8.990000,0.035000,0.304800> rotate<0,0.000000,0> translate<7.110000,0.000000,27.900000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.700000,0.000000,5.400000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.000000,0.000000,5.400000>}
box{<0,0,-0.203200><1.300000,0.035000,0.203200> rotate<0,0.000000,0> translate<15.700000,0.000000,5.400000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.980000,0.000000,16.130000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.270000,0.000000,16.130000>}
box{<0,0,-0.203200><1.290000,0.035000,0.203200> rotate<0,0.000000,0> translate<15.980000,0.000000,16.130000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.650000,0.000000,7.990000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.490000,0.000000,7.990000>}
box{<0,0,-0.203200><1.840000,0.035000,0.203200> rotate<0,0.000000,0> translate<15.650000,0.000000,7.990000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.650000,0.000000,10.530000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.530000,0.000000,10.530000>}
box{<0,0,-0.203200><1.880000,0.035000,0.203200> rotate<0,0.000000,0> translate<15.650000,0.000000,10.530000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.980000,0.000000,16.780000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.020000,0.000000,16.780000>}
box{<0,0,-0.203200><2.040000,0.035000,0.203200> rotate<0,0.000000,0> translate<15.980000,0.000000,16.780000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.530000,0.000000,10.530000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.200000,0.000000,11.200000>}
box{<0,0,-0.203200><0.947523,0.035000,0.203200> rotate<0,-44.997030,0> translate<17.530000,0.000000,10.530000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.270000,0.000000,16.130000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.200000,0.000000,15.200000>}
box{<0,0,-0.203200><1.315219,0.035000,0.203200> rotate<0,44.997030,0> translate<17.270000,0.000000,16.130000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.200000,0.000000,11.200000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.200000,0.000000,15.200000>}
box{<0,0,-0.203200><4.000000,0.035000,0.203200> rotate<0,90.000000,0> translate<18.200000,0.000000,15.200000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.100000,0.000000,27.900000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.200000,0.000000,25.800000>}
box{<0,0,-0.304800><2.969848,0.035000,0.304800> rotate<0,44.997030,0> translate<16.100000,0.000000,27.900000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.200000,0.000000,23.000000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.200000,0.000000,25.800000>}
box{<0,0,-0.304800><2.800000,0.035000,0.304800> rotate<0,90.000000,0> translate<18.200000,0.000000,25.800000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.980000,0.000000,17.430000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.670000,0.000000,17.430000>}
box{<0,0,-0.203200><2.690000,0.035000,0.203200> rotate<0,0.000000,0> translate<15.980000,0.000000,17.430000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.490000,0.000000,7.990000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.300000,0.000000,9.800000>}
box{<0,0,-0.203200><2.559727,0.035000,0.203200> rotate<0,-44.997030,0> translate<17.490000,0.000000,7.990000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.020000,0.000000,16.780000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.300000,0.000000,15.500000>}
box{<0,0,-0.203200><1.810193,0.035000,0.203200> rotate<0,44.997030,0> translate<18.020000,0.000000,16.780000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.300000,0.000000,9.800000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.300000,0.000000,15.500000>}
box{<0,0,-0.203200><5.700000,0.035000,0.203200> rotate<0,90.000000,0> translate<19.300000,0.000000,15.500000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.000000,0.000000,5.400000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.300000,0.000000,8.700000>}
box{<0,0,-0.203200><4.666905,0.035000,0.203200> rotate<0,-44.997030,0> translate<17.000000,0.000000,5.400000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.670000,0.000000,17.430000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.300000,0.000000,15.800000>}
box{<0,0,-0.203200><2.305168,0.035000,0.203200> rotate<0,44.997030,0> translate<18.670000,0.000000,17.430000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.300000,0.000000,8.700000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.300000,0.000000,15.800000>}
box{<0,0,-0.203200><7.100000,0.035000,0.203200> rotate<0,90.000000,0> translate<20.300000,0.000000,15.800000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.700000,0.000000,22.700000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.850000,0.000000,16.550000>}
box{<0,0,-0.304800><8.697413,0.035000,0.304800> rotate<0,44.997030,0> translate<15.700000,0.000000,22.700000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.850000,0.000000,14.800000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.850000,0.000000,16.550000>}
box{<0,0,-0.203200><1.750000,0.035000,0.203200> rotate<0,90.000000,0> translate<21.850000,0.000000,16.550000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.850000,0.000000,14.800000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.910000,0.000000,14.740000>}
box{<0,0,-0.203200><0.084853,0.035000,0.203200> rotate<0,44.997030,0> translate<21.850000,0.000000,14.800000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.910000,0.000000,12.000000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.910000,0.000000,14.740000>}
box{<0,0,-0.304800><2.740000,0.035000,0.304800> rotate<0,90.000000,0> translate<21.910000,0.000000,14.740000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.450000,0.000000,12.000000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.450000,0.000000,14.700000>}
box{<0,0,-0.304800><2.700000,0.035000,0.304800> rotate<0,90.000000,0> translate<24.450000,0.000000,14.700000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.450000,0.000000,14.700000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.550000,0.000000,14.800000>}
box{<0,0,-0.203200><0.141421,0.035000,0.203200> rotate<0,-44.997030,0> translate<24.450000,0.000000,14.700000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.200000,0.000000,23.000000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.550000,0.000000,16.650000>}
box{<0,0,-0.304800><8.980256,0.035000,0.304800> rotate<0,44.997030,0> translate<18.200000,0.000000,23.000000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.550000,0.000000,14.800000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.550000,0.000000,16.650000>}
box{<0,0,-0.203200><1.850000,0.035000,0.203200> rotate<0,90.000000,0> translate<24.550000,0.000000,16.650000> }
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
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,7.119878>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,28.780800>}
box{<0,0,-0.203200><21.660922,0.035000,0.203200> rotate<0,90.000000,0> translate<1.219197,0.000000,28.780800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,7.119878>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.066397,0.000000,7.795500>}
box{<0,0,-0.203200><1.083611,0.035000,0.203200> rotate<0,-38.568983,0> translate<1.219197,0.000000,7.119878> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.464125,0.000000,7.315200>}
box{<0,0,-0.203200><0.244928,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,7.721600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.973731,0.000000,7.721600>}
box{<0,0,-0.203200><0.754534,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,7.721600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.913594,0.000000,8.128000>}
box{<0,0,-0.203200><1.694397,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.659809,0.000000,8.534400>}
box{<0,0,-0.203200><6.440613,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,8.940800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.253409,0.000000,8.940800>}
box{<0,0,-0.203200><6.034213,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,8.940800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,9.347200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.847009,0.000000,9.347200>}
box{<0,0,-0.203200><5.627813,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,9.347200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.440609,0.000000,9.753600>}
box{<0,0,-0.203200><5.221413,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.034209,0.000000,10.160000>}
box{<0,0,-0.203200><4.815013,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,10.566400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.627809,0.000000,10.566400>}
box{<0,0,-0.203200><4.408613,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,10.566400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.828516,0.000000,10.972800>}
box{<0,0,-0.203200><1.609319,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,11.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.422116,0.000000,11.379200>}
box{<0,0,-0.203200><1.202919,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,11.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,11.785600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.283200,0.000000,11.785600>}
box{<0,0,-0.203200><1.064003,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,11.785600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.283200,0.000000,12.192000>}
box{<0,0,-0.203200><1.064003,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,12.598400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.479719,0.000000,12.598400>}
box{<0,0,-0.203200><1.260522,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,12.598400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,13.004800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.420463,0.000000,13.004800>}
box{<0,0,-0.203200><1.201266,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,13.004800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.193600,0.000000,13.411200>}
box{<0,0,-0.203200><0.974403,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,13.817600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.193600,0.000000,13.817600>}
box{<0,0,-0.203200><0.974403,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,13.817600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.193600,0.000000,14.224000>}
box{<0,0,-0.203200><0.974403,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.193600,0.000000,14.630400>}
box{<0,0,-0.203200><0.974403,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.193600,0.000000,15.036800>}
box{<0,0,-0.203200><0.974403,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.193600,0.000000,15.443200>}
box{<0,0,-0.203200><0.974403,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.193600,0.000000,15.849600>}
box{<0,0,-0.203200><0.974403,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.193600,0.000000,16.256000>}
box{<0,0,-0.203200><0.974403,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.193600,0.000000,16.662400>}
box{<0,0,-0.203200><0.974403,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.193600,0.000000,17.068800>}
box{<0,0,-0.203200><0.974403,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,17.475200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.300466,0.000000,17.475200>}
box{<0,0,-0.203200><1.081269,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,17.475200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.538800,0.000000,17.881600>}
box{<0,0,-0.203200><1.319603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.538800,0.000000,18.288000>}
box{<0,0,-0.203200><1.319603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.538800,0.000000,18.694400>}
box{<0,0,-0.203200><1.319603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,19.100800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.538800,0.000000,19.100800>}
box{<0,0,-0.203200><1.319603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,19.100800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.538800,0.000000,19.507200>}
box{<0,0,-0.203200><1.319603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,19.913600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.576966,0.000000,19.913600>}
box{<0,0,-0.203200><1.357769,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,19.913600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.643600,0.000000,20.320000>}
box{<0,0,-0.203200><1.424403,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.643600,0.000000,20.726400>}
box{<0,0,-0.203200><1.424403,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,21.132800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.678066,0.000000,21.132800>}
box{<0,0,-0.203200><1.458869,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,21.132800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,21.539200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.493600,0.000000,21.539200>}
box{<0,0,-0.203200><10.274403,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,21.539200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.493600,0.000000,21.945600>}
box{<0,0,-0.203200><10.274403,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.691419,0.000000,22.352000>}
box{<0,0,-0.203200><1.472222,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,22.758400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.592797,0.000000,22.758400>}
box{<0,0,-0.203200><1.373600,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,22.758400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.592797,0.000000,23.164800>}
box{<0,0,-0.203200><1.373600,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,23.571200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.592800,0.000000,23.571200>}
box{<0,0,-0.203200><1.373603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,23.571200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,23.977600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.592800,0.000000,23.977600>}
box{<0,0,-0.203200><1.373603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,23.977600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.615256,0.000000,24.384000>}
box{<0,0,-0.203200><1.396059,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,24.790400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.493600,0.000000,24.790400>}
box{<0,0,-0.203200><10.274403,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,24.790400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,25.196800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.816638,0.000000,25.196800>}
box{<0,0,-0.203200><1.597441,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,25.196800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.592797,0.000000,25.603200>}
box{<0,0,-0.203200><1.373600,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,26.009600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.592797,0.000000,26.009600>}
box{<0,0,-0.203200><1.373600,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,26.009600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.578178,0.000000,26.416000>}
box{<0,0,-0.203200><2.358981,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.592800,0.000000,26.822400>}
box{<0,0,-0.203200><1.373603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,27.228800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.592800,0.000000,27.228800>}
box{<0,0,-0.203200><1.373603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,27.228800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,27.635200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.945034,0.000000,27.635200>}
box{<0,0,-0.203200><1.725838,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,27.635200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.245816,0.000000,28.041600>}
box{<0,0,-0.203200><5.026619,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.652216,0.000000,28.448000>}
box{<0,0,-0.203200><5.433019,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.219197,0.000000,28.780800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.195591,0.000000,28.780800>}
box{<0,0,-0.203200><19.976394,0.035000,0.203200> rotate<0,0.000000,0> translate<1.219197,0.000000,28.780800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.066397,0.000000,7.795500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.066400,0.000000,7.795500>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,0.000000,0> translate<2.066397,0.000000,7.795500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.066400,0.000000,7.795500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.250456,0.000000,8.260209>}
box{<0,0,-0.203200><1.271984,0.035000,0.203200> rotate<0,-21.427222,0> translate<2.066400,0.000000,7.795500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.193600,0.000000,13.231663>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.431663,0.000000,12.993600>}
box{<0,0,-0.203200><0.336671,0.035000,0.203200> rotate<0,44.997030,0> translate<2.193600,0.000000,13.231663> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.193600,0.000000,17.368334>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.193600,0.000000,13.231663>}
box{<0,0,-0.203200><4.136672,0.035000,0.203200> rotate<0,-90.000000,0> translate<2.193600,0.000000,13.231663> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.193600,0.000000,17.368334>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.431663,0.000000,17.606397>}
box{<0,0,-0.203200><0.336671,0.035000,0.203200> rotate<0,-44.997030,0> translate<2.193600,0.000000,17.368334> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.283200,0.000000,11.518116>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.908116,0.000000,10.893200>}
box{<0,0,-0.203200><0.883764,0.035000,0.203200> rotate<0,44.997030,0> translate<2.283200,0.000000,11.518116> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.283200,0.000000,12.401881>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.283200,0.000000,11.518116>}
box{<0,0,-0.203200><0.883766,0.035000,0.203200> rotate<0,-90.000000,0> translate<2.283200,0.000000,11.518116> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.283200,0.000000,12.401881>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.638800,0.000000,12.757481>}
box{<0,0,-0.203200><0.502894,0.035000,0.203200> rotate<0,-44.997030,0> translate<2.283200,0.000000,12.401881> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.431663,0.000000,12.993600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.638800,0.000000,12.993600>}
box{<0,0,-0.203200><0.207137,0.035000,0.203200> rotate<0,0.000000,0> translate<2.431663,0.000000,12.993600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.431663,0.000000,17.606397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.538800,0.000000,17.606397>}
box{<0,0,-0.203200><0.107137,0.035000,0.203200> rotate<0,0.000000,0> translate<2.431663,0.000000,17.606397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.538800,0.000000,19.821466>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.538800,0.000000,17.606397>}
box{<0,0,-0.203200><2.215069,0.035000,0.203200> rotate<0,-90.000000,0> translate<2.538800,0.000000,17.606397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.538800,0.000000,19.821466>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.643600,0.000000,20.074475>}
box{<0,0,-0.203200><0.273855,0.035000,0.203200> rotate<0,-67.495529,0> translate<2.538800,0.000000,19.821466> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.592797,0.000000,23.318194>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.592800,0.000000,22.579806>}
box{<0,0,-0.203200><0.738388,0.035000,0.203200> rotate<0,89.993818,0> translate<2.592797,0.000000,23.318194> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.592797,0.000000,23.318194>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.578178,0.000000,23.318194>}
box{<0,0,-0.203200><0.985381,0.035000,0.203200> rotate<0,0.000000,0> translate<2.592797,0.000000,23.318194> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.592797,0.000000,26.268194>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.592800,0.000000,25.529806>}
box{<0,0,-0.203200><0.738388,0.035000,0.203200> rotate<0,89.993818,0> translate<2.592797,0.000000,26.268194> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.592797,0.000000,26.268194>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.578178,0.000000,26.268194>}
box{<0,0,-0.203200><0.985381,0.035000,0.203200> rotate<0,0.000000,0> translate<2.592797,0.000000,26.268194> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.592800,0.000000,22.579806>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.623956,0.000000,22.463525>}
box{<0,0,-0.203200><0.120383,0.035000,0.203200> rotate<0,74.995610,0> translate<2.592800,0.000000,22.579806> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.592800,0.000000,23.561800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.578178,0.000000,23.561800>}
box{<0,0,-0.203200><0.985378,0.035000,0.203200> rotate<0,0.000000,0> translate<2.592800,0.000000,23.561800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.592800,0.000000,24.300191>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.592800,0.000000,23.561800>}
box{<0,0,-0.203200><0.738391,0.035000,0.203200> rotate<0,-90.000000,0> translate<2.592800,0.000000,23.561800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.592800,0.000000,24.300191>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.623956,0.000000,24.416472>}
box{<0,0,-0.203200><0.120383,0.035000,0.203200> rotate<0,-74.995610,0> translate<2.592800,0.000000,24.300191> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.592800,0.000000,25.529806>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.623956,0.000000,25.413525>}
box{<0,0,-0.203200><0.120383,0.035000,0.203200> rotate<0,74.995610,0> translate<2.592800,0.000000,25.529806> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.592800,0.000000,26.511800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.578178,0.000000,26.511800>}
box{<0,0,-0.203200><0.985378,0.035000,0.203200> rotate<0,0.000000,0> translate<2.592800,0.000000,26.511800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.592800,0.000000,27.250191>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.592800,0.000000,26.511800>}
box{<0,0,-0.203200><0.738391,0.035000,0.203200> rotate<0,-90.000000,0> translate<2.592800,0.000000,26.511800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.592800,0.000000,27.250191>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.623956,0.000000,27.366472>}
box{<0,0,-0.203200><0.120383,0.035000,0.203200> rotate<0,-74.995610,0> translate<2.592800,0.000000,27.250191> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.623956,0.000000,22.463525>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.684147,0.000000,22.359272>}
box{<0,0,-0.203200><0.120381,0.035000,0.203200> rotate<0,59.996017,0> translate<2.623956,0.000000,22.463525> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.623956,0.000000,24.416472>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.684147,0.000000,24.520725>}
box{<0,0,-0.203200><0.120381,0.035000,0.203200> rotate<0,-59.996017,0> translate<2.623956,0.000000,24.416472> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.623956,0.000000,25.413525>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.684147,0.000000,25.309272>}
box{<0,0,-0.203200><0.120381,0.035000,0.203200> rotate<0,59.996017,0> translate<2.623956,0.000000,25.413525> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.623956,0.000000,27.366472>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.684147,0.000000,27.470725>}
box{<0,0,-0.203200><0.120381,0.035000,0.203200> rotate<0,-59.996017,0> translate<2.623956,0.000000,27.366472> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.638800,0.000000,12.993600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.638800,0.000000,12.757481>}
box{<0,0,-0.203200><0.236119,0.035000,0.203200> rotate<0,-90.000000,0> translate<2.638800,0.000000,12.757481> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.643600,0.000000,21.098334>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.643600,0.000000,20.074475>}
box{<0,0,-0.203200><1.023859,0.035000,0.203200> rotate<0,-90.000000,0> translate<2.643600,0.000000,20.074475> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.643600,0.000000,21.098334>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.881663,0.000000,21.336397>}
box{<0,0,-0.203200><0.336671,0.035000,0.203200> rotate<0,-44.997030,0> translate<2.643600,0.000000,21.098334> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.684147,0.000000,22.359272>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.769272,0.000000,22.274147>}
box{<0,0,-0.203200><0.120385,0.035000,0.203200> rotate<0,44.997030,0> translate<2.684147,0.000000,22.359272> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.684147,0.000000,24.520725>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.769272,0.000000,24.605850>}
box{<0,0,-0.203200><0.120385,0.035000,0.203200> rotate<0,-44.997030,0> translate<2.684147,0.000000,24.520725> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.684147,0.000000,25.309272>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.769272,0.000000,25.224147>}
box{<0,0,-0.203200><0.120385,0.035000,0.203200> rotate<0,44.997030,0> translate<2.684147,0.000000,25.309272> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.684147,0.000000,27.470725>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.769272,0.000000,27.555850>}
box{<0,0,-0.203200><0.120385,0.035000,0.203200> rotate<0,-44.997030,0> translate<2.684147,0.000000,27.470725> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.769272,0.000000,22.274147>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.873525,0.000000,22.213956>}
box{<0,0,-0.203200><0.120381,0.035000,0.203200> rotate<0,29.998043,0> translate<2.769272,0.000000,22.274147> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.769272,0.000000,24.605850>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.873525,0.000000,24.666041>}
box{<0,0,-0.203200><0.120381,0.035000,0.203200> rotate<0,-29.998043,0> translate<2.769272,0.000000,24.605850> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.769272,0.000000,25.224147>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.873525,0.000000,25.163956>}
box{<0,0,-0.203200><0.120381,0.035000,0.203200> rotate<0,29.998043,0> translate<2.769272,0.000000,25.224147> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.769272,0.000000,27.555850>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.873525,0.000000,27.616041>}
box{<0,0,-0.203200><0.120381,0.035000,0.203200> rotate<0,-29.998043,0> translate<2.769272,0.000000,27.555850> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.873525,0.000000,22.213956>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.989806,0.000000,22.182800>}
box{<0,0,-0.203200><0.120383,0.035000,0.203200> rotate<0,14.998451,0> translate<2.873525,0.000000,22.213956> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.873525,0.000000,24.666041>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.989806,0.000000,24.697197>}
box{<0,0,-0.203200><0.120383,0.035000,0.203200> rotate<0,-14.998451,0> translate<2.873525,0.000000,24.666041> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.873525,0.000000,25.163956>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.989806,0.000000,25.132800>}
box{<0,0,-0.203200><0.120383,0.035000,0.203200> rotate<0,14.998451,0> translate<2.873525,0.000000,25.163956> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.873525,0.000000,27.616041>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.989806,0.000000,27.647197>}
box{<0,0,-0.203200><0.120383,0.035000,0.203200> rotate<0,-14.998451,0> translate<2.873525,0.000000,27.616041> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.881663,0.000000,21.336397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.518334,0.000000,21.336397>}
box{<0,0,-0.203200><1.636672,0.035000,0.203200> rotate<0,0.000000,0> translate<2.881663,0.000000,21.336397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.908116,0.000000,10.893200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.791881,0.000000,10.893200>}
box{<0,0,-0.203200><0.883766,0.035000,0.203200> rotate<0,0.000000,0> translate<2.908116,0.000000,10.893200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.989806,0.000000,22.182800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.578194,0.000000,22.182797>}
box{<0,0,-0.203200><0.588388,0.035000,0.203200> rotate<0,0.000304,0> translate<2.989806,0.000000,22.182800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.989806,0.000000,24.697197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.578194,0.000000,24.697194>}
box{<0,0,-0.203200><0.588388,0.035000,0.203200> rotate<0,0.000304,0> translate<2.989806,0.000000,24.697197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.989806,0.000000,25.132800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.578194,0.000000,25.132797>}
box{<0,0,-0.203200><0.588388,0.035000,0.203200> rotate<0,0.000304,0> translate<2.989806,0.000000,25.132800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.989806,0.000000,27.647197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.578194,0.000000,27.647194>}
box{<0,0,-0.203200><0.588388,0.035000,0.203200> rotate<0,0.000304,0> translate<2.989806,0.000000,27.647197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.250456,0.000000,8.260209>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.250459,0.000000,8.260209>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,0.000000,0> translate<3.250456,0.000000,8.260209> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.250459,0.000000,8.260209>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.518884,0.000000,8.355266>}
box{<0,0,-0.203200><1.271982,0.035000,0.203200> rotate<0,-4.285474,0> translate<3.250459,0.000000,8.260209> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.578178,0.000000,23.561800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.578178,0.000000,23.318194>}
box{<0,0,-0.203200><0.243606,0.035000,0.203200> rotate<0,-90.000000,0> translate<3.578178,0.000000,23.318194> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.578178,0.000000,26.511800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.578178,0.000000,26.268194>}
box{<0,0,-0.203200><0.243606,0.035000,0.203200> rotate<0,-90.000000,0> translate<3.578178,0.000000,26.268194> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.578194,0.000000,22.182797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.578194,0.000000,23.318178>}
box{<0,0,-0.203200><1.135381,0.035000,0.203200> rotate<0,90.000000,0> translate<3.578194,0.000000,23.318178> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.578194,0.000000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.821800,0.000000,22.352000>}
box{<0,0,-0.203200><0.243606,0.035000,0.203200> rotate<0,0.000000,0> translate<3.578194,0.000000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.578194,0.000000,22.758400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.821800,0.000000,22.758400>}
box{<0,0,-0.203200><0.243606,0.035000,0.203200> rotate<0,0.000000,0> translate<3.578194,0.000000,22.758400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.578194,0.000000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.821800,0.000000,23.164800>}
box{<0,0,-0.203200><0.243606,0.035000,0.203200> rotate<0,0.000000,0> translate<3.578194,0.000000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.578194,0.000000,23.318178>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.821800,0.000000,23.318178>}
box{<0,0,-0.203200><0.243606,0.035000,0.203200> rotate<0,0.000000,0> translate<3.578194,0.000000,23.318178> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.578194,0.000000,23.561819>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.578194,0.000000,24.697194>}
box{<0,0,-0.203200><1.135375,0.035000,0.203200> rotate<0,90.000000,0> translate<3.578194,0.000000,24.697194> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.578194,0.000000,23.561819>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.821800,0.000000,23.561819>}
box{<0,0,-0.203200><0.243606,0.035000,0.203200> rotate<0,0.000000,0> translate<3.578194,0.000000,23.561819> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.578194,0.000000,23.571200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.821800,0.000000,23.571200>}
box{<0,0,-0.203200><0.243606,0.035000,0.203200> rotate<0,0.000000,0> translate<3.578194,0.000000,23.571200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.578194,0.000000,23.977600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.821800,0.000000,23.977600>}
box{<0,0,-0.203200><0.243606,0.035000,0.203200> rotate<0,0.000000,0> translate<3.578194,0.000000,23.977600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.578194,0.000000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.821800,0.000000,24.384000>}
box{<0,0,-0.203200><0.243606,0.035000,0.203200> rotate<0,0.000000,0> translate<3.578194,0.000000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.578194,0.000000,25.132797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.578194,0.000000,26.268178>}
box{<0,0,-0.203200><1.135381,0.035000,0.203200> rotate<0,90.000000,0> translate<3.578194,0.000000,26.268178> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.578194,0.000000,25.196800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.821800,0.000000,25.196800>}
box{<0,0,-0.203200><0.243606,0.035000,0.203200> rotate<0,0.000000,0> translate<3.578194,0.000000,25.196800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.578194,0.000000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.821800,0.000000,25.603200>}
box{<0,0,-0.203200><0.243606,0.035000,0.203200> rotate<0,0.000000,0> translate<3.578194,0.000000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.578194,0.000000,26.009600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.821800,0.000000,26.009600>}
box{<0,0,-0.203200><0.243606,0.035000,0.203200> rotate<0,0.000000,0> translate<3.578194,0.000000,26.009600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.578194,0.000000,26.268178>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.821800,0.000000,26.268178>}
box{<0,0,-0.203200><0.243606,0.035000,0.203200> rotate<0,0.000000,0> translate<3.578194,0.000000,26.268178> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.578194,0.000000,26.511819>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.578194,0.000000,27.647194>}
box{<0,0,-0.203200><1.135375,0.035000,0.203200> rotate<0,90.000000,0> translate<3.578194,0.000000,27.647194> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.578194,0.000000,26.511819>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.821800,0.000000,26.511819>}
box{<0,0,-0.203200><0.243606,0.035000,0.203200> rotate<0,0.000000,0> translate<3.578194,0.000000,26.511819> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.578194,0.000000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.821800,0.000000,26.822400>}
box{<0,0,-0.203200><0.243606,0.035000,0.203200> rotate<0,0.000000,0> translate<3.578194,0.000000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.578194,0.000000,27.228800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.821800,0.000000,27.228800>}
box{<0,0,-0.203200><0.243606,0.035000,0.203200> rotate<0,0.000000,0> translate<3.578194,0.000000,27.228800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.578194,0.000000,27.635200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.821800,0.000000,27.635200>}
box{<0,0,-0.203200><0.243606,0.035000,0.203200> rotate<0,0.000000,0> translate<3.578194,0.000000,27.635200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.791881,0.000000,10.893200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.416797,0.000000,11.518116>}
box{<0,0,-0.203200><0.883764,0.035000,0.203200> rotate<0,-44.997030,0> translate<3.791881,0.000000,10.893200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.821800,0.000000,22.182800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.410191,0.000000,22.182800>}
box{<0,0,-0.203200><0.588391,0.035000,0.203200> rotate<0,0.000000,0> translate<3.821800,0.000000,22.182800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.821800,0.000000,23.318178>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.821800,0.000000,22.182800>}
box{<0,0,-0.203200><1.135378,0.035000,0.203200> rotate<0,-90.000000,0> translate<3.821800,0.000000,22.182800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.821800,0.000000,24.697197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.821800,0.000000,23.561819>}
box{<0,0,-0.203200><1.135378,0.035000,0.203200> rotate<0,-90.000000,0> translate<3.821800,0.000000,23.561819> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.821800,0.000000,24.697197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.410191,0.000000,24.697197>}
box{<0,0,-0.203200><0.588391,0.035000,0.203200> rotate<0,0.000000,0> translate<3.821800,0.000000,24.697197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.821800,0.000000,25.132800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.410191,0.000000,25.132800>}
box{<0,0,-0.203200><0.588391,0.035000,0.203200> rotate<0,0.000000,0> translate<3.821800,0.000000,25.132800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.821800,0.000000,26.268178>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.821800,0.000000,25.132800>}
box{<0,0,-0.203200><1.135378,0.035000,0.203200> rotate<0,-90.000000,0> translate<3.821800,0.000000,25.132800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.821800,0.000000,27.647197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.821800,0.000000,26.511819>}
box{<0,0,-0.203200><1.135378,0.035000,0.203200> rotate<0,-90.000000,0> translate<3.821800,0.000000,26.511819> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.821800,0.000000,27.647197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.410191,0.000000,27.647197>}
box{<0,0,-0.203200><0.588391,0.035000,0.203200> rotate<0,0.000000,0> translate<3.821800,0.000000,27.647197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.871481,0.000000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.221409,0.000000,10.972800>}
box{<0,0,-0.203200><1.349928,0.035000,0.203200> rotate<0,0.000000,0> translate<3.871481,0.000000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.961197,0.000000,17.606397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.961197,0.000000,18.923600>}
box{<0,0,-0.203200><1.317203,0.035000,0.203200> rotate<0,90.000000,0> translate<3.961197,0.000000,18.923600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.961197,0.000000,17.606397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.068334,0.000000,17.606397>}
box{<0,0,-0.203200><0.107137,0.035000,0.203200> rotate<0,0.000000,0> translate<3.961197,0.000000,17.606397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.961197,0.000000,17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.475812,0.000000,17.881600>}
box{<0,0,-0.203200><1.514616,0.035000,0.203200> rotate<0,0.000000,0> translate<3.961197,0.000000,17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.961197,0.000000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.882213,0.000000,18.288000>}
box{<0,0,-0.203200><1.921016,0.035000,0.203200> rotate<0,0.000000,0> translate<3.961197,0.000000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.961197,0.000000,18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.988800,0.000000,18.694400>}
box{<0,0,-0.203200><2.027603,0.035000,0.203200> rotate<0,0.000000,0> translate<3.961197,0.000000,18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.961197,0.000000,18.923600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.518334,0.000000,18.923600>}
box{<0,0,-0.203200><0.557138,0.035000,0.203200> rotate<0,0.000000,0> translate<3.961197,0.000000,18.923600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.061197,0.000000,12.757481>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.061197,0.000000,12.993600>}
box{<0,0,-0.203200><0.236119,0.035000,0.203200> rotate<0,90.000000,0> translate<4.061197,0.000000,12.993600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.061197,0.000000,12.757481>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.416797,0.000000,12.401881>}
box{<0,0,-0.203200><0.502894,0.035000,0.203200> rotate<0,44.997030,0> translate<4.061197,0.000000,12.757481> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.061197,0.000000,12.993600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.068334,0.000000,12.993600>}
box{<0,0,-0.203200><0.007137,0.035000,0.203200> rotate<0,0.000000,0> translate<4.061197,0.000000,12.993600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.068334,0.000000,12.993600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.306397,0.000000,13.231663>}
box{<0,0,-0.203200><0.336671,0.035000,0.203200> rotate<0,-44.997030,0> translate<4.068334,0.000000,12.993600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.068334,0.000000,17.606397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.306397,0.000000,17.368334>}
box{<0,0,-0.203200><0.336671,0.035000,0.203200> rotate<0,44.997030,0> translate<4.068334,0.000000,17.606397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.079534,0.000000,13.004800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.077200,0.000000,13.004800>}
box{<0,0,-0.203200><0.997666,0.035000,0.203200> rotate<0,0.000000,0> translate<4.079534,0.000000,13.004800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.199531,0.000000,17.475200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.000466,0.000000,17.475200>}
box{<0,0,-0.203200><0.800934,0.035000,0.203200> rotate<0,0.000000,0> translate<4.199531,0.000000,17.475200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.220278,0.000000,12.598400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.019719,0.000000,12.598400>}
box{<0,0,-0.203200><0.799441,0.035000,0.203200> rotate<0,0.000000,0> translate<4.220278,0.000000,12.598400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.277881,0.000000,11.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.962116,0.000000,11.379200>}
box{<0,0,-0.203200><0.684234,0.035000,0.203200> rotate<0,0.000000,0> translate<4.277881,0.000000,11.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.306397,0.000000,13.231663>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.306397,0.000000,17.368334>}
box{<0,0,-0.203200><4.136672,0.035000,0.203200> rotate<0,90.000000,0> translate<4.306397,0.000000,17.368334> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.306397,0.000000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.893600,0.000000,13.411200>}
box{<0,0,-0.203200><0.587203,0.035000,0.203200> rotate<0,0.000000,0> translate<4.306397,0.000000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.306397,0.000000,13.817600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.893600,0.000000,13.817600>}
box{<0,0,-0.203200><0.587203,0.035000,0.203200> rotate<0,0.000000,0> translate<4.306397,0.000000,13.817600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.306397,0.000000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.893600,0.000000,14.224000>}
box{<0,0,-0.203200><0.587203,0.035000,0.203200> rotate<0,0.000000,0> translate<4.306397,0.000000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.306397,0.000000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.893600,0.000000,14.630400>}
box{<0,0,-0.203200><0.587203,0.035000,0.203200> rotate<0,0.000000,0> translate<4.306397,0.000000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.306397,0.000000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.893600,0.000000,15.036800>}
box{<0,0,-0.203200><0.587203,0.035000,0.203200> rotate<0,0.000000,0> translate<4.306397,0.000000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.306397,0.000000,15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.893600,0.000000,15.443200>}
box{<0,0,-0.203200><0.587203,0.035000,0.203200> rotate<0,0.000000,0> translate<4.306397,0.000000,15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.306397,0.000000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.893600,0.000000,15.849600>}
box{<0,0,-0.203200><0.587203,0.035000,0.203200> rotate<0,0.000000,0> translate<4.306397,0.000000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.306397,0.000000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.893600,0.000000,16.256000>}
box{<0,0,-0.203200><0.587203,0.035000,0.203200> rotate<0,0.000000,0> translate<4.306397,0.000000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.306397,0.000000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.893600,0.000000,16.662400>}
box{<0,0,-0.203200><0.587203,0.035000,0.203200> rotate<0,0.000000,0> translate<4.306397,0.000000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.306397,0.000000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.893600,0.000000,17.068800>}
box{<0,0,-0.203200><0.587203,0.035000,0.203200> rotate<0,0.000000,0> translate<4.306397,0.000000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.410191,0.000000,22.182800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.526472,0.000000,22.213956>}
box{<0,0,-0.203200><0.120383,0.035000,0.203200> rotate<0,-14.998451,0> translate<4.410191,0.000000,22.182800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.410191,0.000000,24.697197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.526472,0.000000,24.666041>}
box{<0,0,-0.203200><0.120383,0.035000,0.203200> rotate<0,14.998451,0> translate<4.410191,0.000000,24.697197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.410191,0.000000,25.132800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.526472,0.000000,25.163956>}
box{<0,0,-0.203200><0.120383,0.035000,0.203200> rotate<0,-14.998451,0> translate<4.410191,0.000000,25.132800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.410191,0.000000,27.647197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.526472,0.000000,27.616041>}
box{<0,0,-0.203200><0.120383,0.035000,0.203200> rotate<0,14.998451,0> translate<4.410191,0.000000,27.647197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.416797,0.000000,11.518116>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.416797,0.000000,12.401881>}
box{<0,0,-0.203200><0.883766,0.035000,0.203200> rotate<0,90.000000,0> translate<4.416797,0.000000,12.401881> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.416797,0.000000,11.785600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.823200,0.000000,11.785600>}
box{<0,0,-0.203200><0.406403,0.035000,0.203200> rotate<0,0.000000,0> translate<4.416797,0.000000,11.785600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.416797,0.000000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.823200,0.000000,12.192000>}
box{<0,0,-0.203200><0.406403,0.035000,0.203200> rotate<0,0.000000,0> translate<4.416797,0.000000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.454966,0.000000,27.635200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.839416,0.000000,27.635200>}
box{<0,0,-0.203200><1.384450,0.035000,0.203200> rotate<0,0.000000,0> translate<4.454966,0.000000,27.635200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.518334,0.000000,18.923600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.614075,0.000000,19.019344>}
box{<0,0,-0.203200><0.135400,0.035000,0.203200> rotate<0,-44.997965,0> translate<4.518334,0.000000,18.923600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.518334,0.000000,21.336397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.614075,0.000000,21.240653>}
box{<0,0,-0.203200><0.135400,0.035000,0.203200> rotate<0,44.997965,0> translate<4.518334,0.000000,21.336397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.518884,0.000000,8.355266>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.518887,0.000000,8.355266>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,0.000000,0> translate<4.518884,0.000000,8.355266> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.518887,0.000000,8.355266>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.758978,0.000000,8.072222>}
box{<0,0,-0.203200><1.271982,0.035000,0.203200> rotate<0,12.856345,0> translate<4.518887,0.000000,8.355266> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.526472,0.000000,22.213956>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.630725,0.000000,22.274147>}
box{<0,0,-0.203200><0.120381,0.035000,0.203200> rotate<0,-29.998043,0> translate<4.526472,0.000000,22.213956> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.526472,0.000000,24.666041>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.630725,0.000000,24.605850>}
box{<0,0,-0.203200><0.120381,0.035000,0.203200> rotate<0,29.998043,0> translate<4.526472,0.000000,24.666041> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.526472,0.000000,25.163956>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.630725,0.000000,25.224147>}
box{<0,0,-0.203200><0.120381,0.035000,0.203200> rotate<0,-29.998043,0> translate<4.526472,0.000000,25.163956> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.526472,0.000000,27.616041>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.630725,0.000000,27.555850>}
box{<0,0,-0.203200><0.120381,0.035000,0.203200> rotate<0,29.998043,0> translate<4.526472,0.000000,27.616041> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.583356,0.000000,25.196800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.768463,0.000000,25.196800>}
box{<0,0,-0.203200><0.185106,0.035000,0.203200> rotate<0,0.000000,0> translate<4.583356,0.000000,25.196800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.614075,0.000000,19.019344>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.669272,0.000000,18.964147>}
box{<0,0,-0.203200><0.078060,0.035000,0.203200> rotate<0,44.997030,0> translate<4.614075,0.000000,19.019344> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.614075,0.000000,21.240653>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.669272,0.000000,21.295850>}
box{<0,0,-0.203200><0.078060,0.035000,0.203200> rotate<0,-44.997030,0> translate<4.614075,0.000000,21.240653> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.630725,0.000000,22.274147>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.685922,0.000000,22.329344>}
box{<0,0,-0.203200><0.078060,0.035000,0.203200> rotate<0,-44.997030,0> translate<4.630725,0.000000,22.274147> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.630725,0.000000,24.605850>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.685922,0.000000,24.550653>}
box{<0,0,-0.203200><0.078060,0.035000,0.203200> rotate<0,44.997030,0> translate<4.630725,0.000000,24.605850> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.630725,0.000000,25.224147>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.685922,0.000000,25.279344>}
box{<0,0,-0.203200><0.078060,0.035000,0.203200> rotate<0,-44.997030,0> translate<4.630725,0.000000,25.224147> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.630725,0.000000,27.555850>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.685922,0.000000,27.500653>}
box{<0,0,-0.203200><0.078060,0.035000,0.203200> rotate<0,44.997030,0> translate<4.630725,0.000000,27.555850> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.669272,0.000000,18.964147>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.773525,0.000000,18.903956>}
box{<0,0,-0.203200><0.120381,0.035000,0.203200> rotate<0,29.998043,0> translate<4.669272,0.000000,18.964147> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.669272,0.000000,21.295850>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.773525,0.000000,21.356041>}
box{<0,0,-0.203200><0.120381,0.035000,0.203200> rotate<0,-29.998043,0> translate<4.669272,0.000000,21.295850> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.685922,0.000000,22.329344>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.781663,0.000000,22.233600>}
box{<0,0,-0.203200><0.135400,0.035000,0.203200> rotate<0,44.997965,0> translate<4.685922,0.000000,22.329344> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.685922,0.000000,24.550653>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.781663,0.000000,24.646397>}
box{<0,0,-0.203200><0.135400,0.035000,0.203200> rotate<0,-44.997965,0> translate<4.685922,0.000000,24.550653> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.685922,0.000000,25.279344>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.781663,0.000000,25.183600>}
box{<0,0,-0.203200><0.135400,0.035000,0.203200> rotate<0,44.997965,0> translate<4.685922,0.000000,25.279344> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.685922,0.000000,27.500653>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.781663,0.000000,27.596397>}
box{<0,0,-0.203200><0.135400,0.035000,0.203200> rotate<0,-44.997965,0> translate<4.685922,0.000000,27.500653> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.773525,0.000000,18.903956>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.889806,0.000000,18.872800>}
box{<0,0,-0.203200><0.120383,0.035000,0.203200> rotate<0,14.998451,0> translate<4.773525,0.000000,18.903956> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.773525,0.000000,21.356041>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.889806,0.000000,21.387197>}
box{<0,0,-0.203200><0.120383,0.035000,0.203200> rotate<0,-14.998451,0> translate<4.773525,0.000000,21.356041> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.781663,0.000000,22.233600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.418334,0.000000,22.233600>}
box{<0,0,-0.203200><1.636672,0.035000,0.203200> rotate<0,0.000000,0> translate<4.781663,0.000000,22.233600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.781663,0.000000,24.646397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.418334,0.000000,24.646397>}
box{<0,0,-0.203200><1.636672,0.035000,0.203200> rotate<0,0.000000,0> translate<4.781663,0.000000,24.646397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.781663,0.000000,25.183600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.418334,0.000000,25.183600>}
box{<0,0,-0.203200><1.636672,0.035000,0.203200> rotate<0,0.000000,0> translate<4.781663,0.000000,25.183600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.781663,0.000000,27.596397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.800613,0.000000,27.596397>}
box{<0,0,-0.203200><1.018950,0.035000,0.203200> rotate<0,0.000000,0> translate<4.781663,0.000000,27.596397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.823200,0.000000,11.518116>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.093056,0.000000,11.248263>}
box{<0,0,-0.203200><0.381632,0.035000,0.203200> rotate<0,44.996698,0> translate<4.823200,0.000000,11.518116> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.823200,0.000000,12.401881>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.823200,0.000000,11.518116>}
box{<0,0,-0.203200><0.883766,0.035000,0.203200> rotate<0,-90.000000,0> translate<4.823200,0.000000,11.518116> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.823200,0.000000,12.401881>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.077200,0.000000,12.655881>}
box{<0,0,-0.203200><0.359210,0.035000,0.203200> rotate<0,-44.997030,0> translate<4.823200,0.000000,12.401881> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.889806,0.000000,18.872800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.478194,0.000000,18.872797>}
box{<0,0,-0.203200><0.588388,0.035000,0.203200> rotate<0,0.000304,0> translate<4.889806,0.000000,18.872800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.889806,0.000000,21.387197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.478194,0.000000,21.387194>}
box{<0,0,-0.203200><0.588388,0.035000,0.203200> rotate<0,0.000304,0> translate<4.889806,0.000000,21.387197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.893600,0.000000,13.231663>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.077200,0.000000,13.048063>}
box{<0,0,-0.203200><0.259650,0.035000,0.203200> rotate<0,44.997030,0> translate<4.893600,0.000000,13.231663> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.893600,0.000000,17.368334>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.893600,0.000000,13.231663>}
box{<0,0,-0.203200><4.136672,0.035000,0.203200> rotate<0,-90.000000,0> translate<4.893600,0.000000,13.231663> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.893600,0.000000,17.368334>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.131663,0.000000,17.606397>}
box{<0,0,-0.203200><0.336671,0.035000,0.203200> rotate<0,-44.997030,0> translate<4.893600,0.000000,17.368334> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.077200,0.000000,13.048063>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.077200,0.000000,12.655881>}
box{<0,0,-0.203200><0.392181,0.035000,0.203200> rotate<0,-90.000000,0> translate<5.077200,0.000000,12.655881> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.093056,0.000000,11.248263>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.197072,0.000000,10.997138>}
box{<0,0,-0.203200><0.271814,0.035000,0.203200> rotate<0,67.496277,0> translate<5.093056,0.000000,11.248263> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.131663,0.000000,17.606397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.315697,0.000000,17.606397>}
box{<0,0,-0.203200><0.184034,0.035000,0.203200> rotate<0,0.000000,0> translate<5.131663,0.000000,17.606397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.197072,0.000000,10.997138>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.788800,0.000000,5.405409>}
box{<0,0,-0.203200><7.907898,0.035000,0.203200> rotate<0,44.997030,0> translate<5.197072,0.000000,10.997138> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.315697,0.000000,17.606397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.397072,0.000000,17.802859>}
box{<0,0,-0.203200><0.212649,0.035000,0.203200> rotate<0,-67.496151,0> translate<5.315697,0.000000,17.606397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.397072,0.000000,17.802859>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.597138,0.000000,18.002925>}
box{<0,0,-0.203200><0.282936,0.035000,0.203200> rotate<0,-44.997030,0> translate<5.397072,0.000000,17.802859> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.478194,0.000000,18.872797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.478194,0.000000,20.008178>}
box{<0,0,-0.203200><1.135381,0.035000,0.203200> rotate<0,90.000000,0> translate<5.478194,0.000000,20.008178> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.478194,0.000000,19.100800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.721800,0.000000,19.100800>}
box{<0,0,-0.203200><0.243606,0.035000,0.203200> rotate<0,0.000000,0> translate<5.478194,0.000000,19.100800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.478194,0.000000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.721800,0.000000,19.507200>}
box{<0,0,-0.203200><0.243606,0.035000,0.203200> rotate<0,0.000000,0> translate<5.478194,0.000000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.478194,0.000000,19.913600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.721800,0.000000,19.913600>}
box{<0,0,-0.203200><0.243606,0.035000,0.203200> rotate<0,0.000000,0> translate<5.478194,0.000000,19.913600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.478194,0.000000,20.008178>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.721800,0.000000,20.008178>}
box{<0,0,-0.203200><0.243606,0.035000,0.203200> rotate<0,0.000000,0> translate<5.478194,0.000000,20.008178> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.478194,0.000000,20.251819>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.478194,0.000000,21.387194>}
box{<0,0,-0.203200><1.135375,0.035000,0.203200> rotate<0,90.000000,0> translate<5.478194,0.000000,21.387194> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.478194,0.000000,20.251819>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.721800,0.000000,20.251819>}
box{<0,0,-0.203200><0.243606,0.035000,0.203200> rotate<0,0.000000,0> translate<5.478194,0.000000,20.251819> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.478194,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.721800,0.000000,20.320000>}
box{<0,0,-0.203200><0.243606,0.035000,0.203200> rotate<0,0.000000,0> translate<5.478194,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.478194,0.000000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.721800,0.000000,20.726400>}
box{<0,0,-0.203200><0.243606,0.035000,0.203200> rotate<0,0.000000,0> translate<5.478194,0.000000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.478194,0.000000,21.132800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.721800,0.000000,21.132800>}
box{<0,0,-0.203200><0.243606,0.035000,0.203200> rotate<0,0.000000,0> translate<5.478194,0.000000,21.132800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.514600,0.000000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.066209,0.000000,8.128000>}
box{<0,0,-0.203200><2.551609,0.035000,0.203200> rotate<0,0.000000,0> translate<5.514600,0.000000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.597138,0.000000,18.002925>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.988800,0.000000,18.394588>}
box{<0,0,-0.203200><0.553894,0.035000,0.203200> rotate<0,-44.997030,0> translate<5.597138,0.000000,18.002925> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.721800,0.000000,18.872800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.988800,0.000000,18.872800>}
box{<0,0,-0.203200><0.267000,0.035000,0.203200> rotate<0,0.000000,0> translate<5.721800,0.000000,18.872800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.721800,0.000000,20.008178>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.721800,0.000000,18.872800>}
box{<0,0,-0.203200><1.135378,0.035000,0.203200> rotate<0,-90.000000,0> translate<5.721800,0.000000,18.872800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.721800,0.000000,21.387197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.721800,0.000000,20.251819>}
box{<0,0,-0.203200><1.135378,0.035000,0.203200> rotate<0,-90.000000,0> translate<5.721800,0.000000,20.251819> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.721800,0.000000,21.387197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.310191,0.000000,21.387197>}
box{<0,0,-0.203200><0.588391,0.035000,0.203200> rotate<0,0.000000,0> translate<5.721800,0.000000,21.387197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.721819,0.000000,20.008194>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.721819,0.000000,20.251800>}
box{<0,0,-0.203200><0.243606,0.035000,0.203200> rotate<0,90.000000,0> translate<5.721819,0.000000,20.251800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.721819,0.000000,20.008194>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.707197,0.000000,20.008194>}
box{<0,0,-0.203200><0.985378,0.035000,0.203200> rotate<0,0.000000,0> translate<5.721819,0.000000,20.008194> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.721819,0.000000,20.251800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.707194,0.000000,20.251800>}
box{<0,0,-0.203200><0.985375,0.035000,0.203200> rotate<0,0.000000,0> translate<5.721819,0.000000,20.251800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.758978,0.000000,8.072222>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.758981,0.000000,8.072222>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,0.000000,0> translate<5.758978,0.000000,8.072222> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.758981,0.000000,8.072222>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.860550,0.000000,7.436228>}
box{<0,0,-0.203200><1.271983,0.035000,0.203200> rotate<0,29.998127,0> translate<5.758981,0.000000,8.072222> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.800613,0.000000,27.596397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.707137,0.000000,28.502925>}
box{<0,0,-0.203200><1.282022,0.035000,0.203200> rotate<0,-44.997129,0> translate<5.800613,0.000000,27.596397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.988800,0.000000,18.872800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.988800,0.000000,18.394588>}
box{<0,0,-0.203200><0.478213,0.035000,0.203200> rotate<0,-90.000000,0> translate<5.988800,0.000000,18.394588> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.310191,0.000000,21.387197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.426472,0.000000,21.356041>}
box{<0,0,-0.203200><0.120383,0.035000,0.203200> rotate<0,14.998451,0> translate<6.310191,0.000000,21.387197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.366275,0.000000,7.721600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.472609,0.000000,7.721600>}
box{<0,0,-0.203200><2.106334,0.035000,0.203200> rotate<0,0.000000,0> translate<6.366275,0.000000,7.721600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.418334,0.000000,22.233600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.656397,0.000000,22.471663>}
box{<0,0,-0.203200><0.336671,0.035000,0.203200> rotate<0,-44.997030,0> translate<6.418334,0.000000,22.233600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.418334,0.000000,24.646397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.656397,0.000000,24.408334>}
box{<0,0,-0.203200><0.336671,0.035000,0.203200> rotate<0,44.997030,0> translate<6.418334,0.000000,24.646397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.418334,0.000000,25.183600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.656397,0.000000,25.421663>}
box{<0,0,-0.203200><0.336671,0.035000,0.203200> rotate<0,-44.997030,0> translate<6.418334,0.000000,25.183600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.426472,0.000000,21.356041>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.530725,0.000000,21.295850>}
box{<0,0,-0.203200><0.120381,0.035000,0.203200> rotate<0,29.998043,0> translate<6.426472,0.000000,21.356041> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.431534,0.000000,25.196800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.493600,0.000000,25.196800>}
box{<0,0,-0.203200><5.062066,0.035000,0.203200> rotate<0,0.000000,0> translate<6.431534,0.000000,25.196800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.530725,0.000000,21.295850>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.615850,0.000000,21.210725>}
box{<0,0,-0.203200><0.120385,0.035000,0.203200> rotate<0,44.997030,0> translate<6.530725,0.000000,21.295850> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.536734,0.000000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.493600,0.000000,22.352000>}
box{<0,0,-0.203200><4.956866,0.035000,0.203200> rotate<0,0.000000,0> translate<6.536734,0.000000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.615850,0.000000,21.210725>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.676041,0.000000,21.106472>}
box{<0,0,-0.203200><0.120381,0.035000,0.203200> rotate<0,59.996017,0> translate<6.615850,0.000000,21.210725> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.656397,0.000000,22.471663>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.656397,0.000000,22.728800>}
box{<0,0,-0.203200><0.257137,0.035000,0.203200> rotate<0,90.000000,0> translate<6.656397,0.000000,22.728800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.656397,0.000000,22.728800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.493600,0.000000,22.728800>}
box{<0,0,-0.203200><4.837203,0.035000,0.203200> rotate<0,0.000000,0> translate<6.656397,0.000000,22.728800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.656397,0.000000,24.151197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.656397,0.000000,24.408334>}
box{<0,0,-0.203200><0.257138,0.035000,0.203200> rotate<0,90.000000,0> translate<6.656397,0.000000,24.408334> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.656397,0.000000,24.151197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.493600,0.000000,24.151197>}
box{<0,0,-0.203200><4.837203,0.035000,0.203200> rotate<0,0.000000,0> translate<6.656397,0.000000,24.151197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.656397,0.000000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.493600,0.000000,24.384000>}
box{<0,0,-0.203200><4.837203,0.035000,0.203200> rotate<0,0.000000,0> translate<6.656397,0.000000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.656397,0.000000,25.421663>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.656397,0.000000,26.440613>}
box{<0,0,-0.203200><1.018950,0.035000,0.203200> rotate<0,90.000000,0> translate<6.656397,0.000000,26.440613> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.656397,0.000000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.618116,0.000000,25.603200>}
box{<0,0,-0.203200><4.961719,0.035000,0.203200> rotate<0,0.000000,0> translate<6.656397,0.000000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.656397,0.000000,26.009600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.603200,0.000000,26.009600>}
box{<0,0,-0.203200><4.946803,0.035000,0.203200> rotate<0,0.000000,0> translate<6.656397,0.000000,26.009600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.656397,0.000000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.603200,0.000000,26.416000>}
box{<0,0,-0.203200><4.946803,0.035000,0.203200> rotate<0,0.000000,0> translate<6.656397,0.000000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.656397,0.000000,26.440613>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.404588,0.000000,27.188800>}
box{<0,0,-0.203200><1.058099,0.035000,0.203200> rotate<0,-44.996911,0> translate<6.656397,0.000000,26.440613> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.660841,0.000000,21.132800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.969266,0.000000,21.132800>}
box{<0,0,-0.203200><1.308425,0.035000,0.203200> rotate<0,0.000000,0> translate<6.660841,0.000000,21.132800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.676041,0.000000,21.106472>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.707197,0.000000,20.990191>}
box{<0,0,-0.203200><0.120383,0.035000,0.203200> rotate<0,74.995610,0> translate<6.676041,0.000000,21.106472> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.707137,0.000000,28.502925>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.968531,0.000000,28.611197>}
box{<0,0,-0.203200><0.282930,0.035000,0.203200> rotate<0,-22.498335,0> translate<6.707137,0.000000,28.502925> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.707194,0.000000,20.251800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.707197,0.000000,20.990191>}
box{<0,0,-0.203200><0.738391,0.035000,0.203200> rotate<0,-89.993818,0> translate<6.707194,0.000000,20.251800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.707194,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.114216,0.000000,20.320000>}
box{<0,0,-0.203200><0.407022,0.035000,0.203200> rotate<0,0.000000,0> translate<6.707194,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.707194,0.000000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.520616,0.000000,20.726400>}
box{<0,0,-0.203200><0.813422,0.035000,0.203200> rotate<0,0.000000,0> translate<6.707194,0.000000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.707197,0.000000,19.912981>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.707197,0.000000,20.008194>}
box{<0,0,-0.203200><0.095212,0.035000,0.203200> rotate<0,90.000000,0> translate<6.707197,0.000000,20.008194> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.707197,0.000000,19.912981>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.897138,0.000000,21.102925>}
box{<0,0,-0.203200><1.682832,0.035000,0.203200> rotate<0,-44.997105,0> translate<6.707197,0.000000,19.912981> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.707197,0.000000,19.913600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.707816,0.000000,19.913600>}
box{<0,0,-0.203200><0.000619,0.035000,0.203200> rotate<0,0.000000,0> translate<6.707197,0.000000,19.913600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.860550,0.000000,7.436228>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.860553,0.000000,7.436228>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,0.000000,0> translate<6.860550,0.000000,7.436228> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.860553,0.000000,7.436228>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.725725,0.000000,6.503797>}
box{<0,0,-0.203200><1.271987,0.035000,0.203200> rotate<0,47.139676,0> translate<6.860553,0.000000,7.436228> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.968531,0.000000,28.611197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.241466,0.000000,28.611197>}
box{<0,0,-0.203200><9.272934,0.035000,0.203200> rotate<0,0.000000,0> translate<6.968531,0.000000,28.611197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.972853,0.000000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.879009,0.000000,7.315200>}
box{<0,0,-0.203200><1.906156,0.035000,0.203200> rotate<0,0.000000,0> translate<6.972853,0.000000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.038184,0.000000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.923719,0.000000,26.822400>}
box{<0,0,-0.203200><4.885534,0.035000,0.203200> rotate<0,0.000000,0> translate<7.038184,0.000000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.283125,0.000000,1.219197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.725725,0.000000,1.696200>}
box{<0,0,-0.203200><0.650712,0.035000,0.203200> rotate<0,-47.139373,0> translate<7.283125,0.000000,1.219197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.283125,0.000000,1.219197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.957175,0.000000,1.219197>}
box{<0,0,-0.203200><13.674050,0.035000,0.203200> rotate<0,0.000000,0> translate<7.283125,0.000000,1.219197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.283125,0.000000,1.219200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.957172,0.000000,1.219200>}
box{<0,0,-0.203200><13.674047,0.035000,0.203200> rotate<0,0.000000,0> translate<7.283125,0.000000,1.219200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.349938,0.000000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.285409,0.000000,6.908800>}
box{<0,0,-0.203200><1.935472,0.035000,0.203200> rotate<0,0.000000,0> translate<7.349938,0.000000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.404588,0.000000,27.188800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.805409,0.000000,27.188800>}
box{<0,0,-0.203200><8.400822,0.035000,0.203200> rotate<0,0.000000,0> translate<7.404588,0.000000,27.188800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.660216,0.000000,1.625600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.680091,0.000000,1.625600>}
box{<0,0,-0.203200><13.019875,0.035000,0.203200> rotate<0,0.000000,0> translate<7.660216,0.000000,1.625600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.725725,0.000000,1.696200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.725725,0.000000,1.696203>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,90.000000,0> translate<7.725725,0.000000,1.696203> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.725725,0.000000,1.696203>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.277619,0.000000,2.842219>}
box{<0,0,-0.203200><1.271982,0.035000,0.203200> rotate<0,-64.281402,0> translate<7.725725,0.000000,1.696203> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.725725,0.000000,6.503794>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.725725,0.000000,6.503797>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,90.000000,0> translate<7.725725,0.000000,6.503797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.725725,0.000000,6.503794>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.277619,0.000000,5.357778>}
box{<0,0,-0.203200><1.271982,0.035000,0.203200> rotate<0,64.281402,0> translate<7.725725,0.000000,6.503794> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.726397,0.000000,6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.691809,0.000000,6.502400>}
box{<0,0,-0.203200><1.965412,0.035000,0.203200> rotate<0,0.000000,0> translate<7.726397,0.000000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.887434,0.000000,2.032000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.335631,0.000000,2.032000>}
box{<0,0,-0.203200><4.448197,0.035000,0.203200> rotate<0,0.000000,0> translate<7.887434,0.000000,2.032000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.897138,0.000000,21.102925>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.158531,0.000000,21.211197>}
box{<0,0,-0.203200><0.282930,0.035000,0.203200> rotate<0,-22.498335,0> translate<7.897138,0.000000,21.102925> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.922109,0.000000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.098209,0.000000,6.096000>}
box{<0,0,-0.203200><2.176100,0.035000,0.203200> rotate<0,0.000000,0> translate<7.922109,0.000000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.083147,0.000000,2.438400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.941600,0.000000,2.438400>}
box{<0,0,-0.203200><3.858453,0.035000,0.203200> rotate<0,0.000000,0> translate<8.083147,0.000000,2.438400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.109597,0.000000,11.252503>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.109597,0.000000,15.742800>}
box{<0,0,-0.203200><4.490297,0.035000,0.203200> rotate<0,90.000000,0> translate<8.109597,0.000000,15.742800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.109597,0.000000,11.252503>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.743703,0.000000,6.618397>}
box{<0,0,-0.203200><6.553616,0.035000,0.203200> rotate<0,44.997030,0> translate<8.109597,0.000000,11.252503> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.109597,0.000000,11.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.258694,0.000000,11.379200>}
box{<0,0,-0.203200><2.149097,0.035000,0.203200> rotate<0,0.000000,0> translate<8.109597,0.000000,11.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.109597,0.000000,11.785600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.870400,0.000000,11.785600>}
box{<0,0,-0.203200><1.760803,0.035000,0.203200> rotate<0,0.000000,0> translate<8.109597,0.000000,11.785600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.109597,0.000000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.790400,0.000000,12.192000>}
box{<0,0,-0.203200><1.680803,0.035000,0.203200> rotate<0,0.000000,0> translate<8.109597,0.000000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.109597,0.000000,12.598400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.790400,0.000000,12.598400>}
box{<0,0,-0.203200><1.680803,0.035000,0.203200> rotate<0,0.000000,0> translate<8.109597,0.000000,12.598400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.109597,0.000000,13.004800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.790400,0.000000,13.004800>}
box{<0,0,-0.203200><1.680803,0.035000,0.203200> rotate<0,0.000000,0> translate<8.109597,0.000000,13.004800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.109597,0.000000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.790400,0.000000,13.411200>}
box{<0,0,-0.203200><1.680803,0.035000,0.203200> rotate<0,0.000000,0> translate<8.109597,0.000000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.109597,0.000000,13.817600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.790400,0.000000,13.817600>}
box{<0,0,-0.203200><1.680803,0.035000,0.203200> rotate<0,0.000000,0> translate<8.109597,0.000000,13.817600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.109597,0.000000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.790400,0.000000,14.224000>}
box{<0,0,-0.203200><1.680803,0.035000,0.203200> rotate<0,0.000000,0> translate<8.109597,0.000000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.109597,0.000000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.790400,0.000000,14.630400>}
box{<0,0,-0.203200><1.680803,0.035000,0.203200> rotate<0,0.000000,0> translate<8.109597,0.000000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.109597,0.000000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.790400,0.000000,15.036800>}
box{<0,0,-0.203200><1.680803,0.035000,0.203200> rotate<0,0.000000,0> translate<8.109597,0.000000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.109597,0.000000,15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.790400,0.000000,15.443200>}
box{<0,0,-0.203200><1.680803,0.035000,0.203200> rotate<0,0.000000,0> translate<8.109597,0.000000,15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.109597,0.000000,15.742800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.778194,0.000000,15.742800>}
box{<0,0,-0.203200><0.668597,0.035000,0.203200> rotate<0,0.000000,0> translate<8.109597,0.000000,15.742800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.117822,0.000000,5.689600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.504609,0.000000,5.689600>}
box{<0,0,-0.203200><2.386788,0.035000,0.203200> rotate<0,0.000000,0> translate<8.117822,0.000000,5.689600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.158531,0.000000,21.211197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.493600,0.000000,21.211197>}
box{<0,0,-0.203200><3.335069,0.035000,0.203200> rotate<0,0.000000,0> translate<8.158531,0.000000,21.211197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.277619,0.000000,2.842219>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.277619,0.000000,2.842222>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,90.000000,0> translate<8.277619,0.000000,2.842222> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.277619,0.000000,2.842222>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.467197,0.000000,4.099997>}
box{<0,0,-0.203200><1.271982,0.035000,0.203200> rotate<0,-81.423240,0> translate<8.277619,0.000000,2.842222> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.277619,0.000000,5.357775>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.277619,0.000000,5.357778>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,90.000000,0> translate<8.277619,0.000000,5.357778> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.277619,0.000000,5.357775>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.467197,0.000000,4.099997>}
box{<0,0,-0.203200><1.271985,0.035000,0.203200> rotate<0,81.423261,0> translate<8.277619,0.000000,5.357775> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.278006,0.000000,2.844800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.941600,0.000000,2.844800>}
box{<0,0,-0.203200><3.663594,0.035000,0.203200> rotate<0,0.000000,0> translate<8.278006,0.000000,2.844800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.288859,0.000000,5.283200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.788800,0.000000,5.283200>}
box{<0,0,-0.203200><2.499941,0.035000,0.203200> rotate<0,0.000000,0> translate<8.288859,0.000000,5.283200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.339259,0.000000,3.251200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.900119,0.000000,3.251200>}
box{<0,0,-0.203200><3.560859,0.035000,0.203200> rotate<0,0.000000,0> translate<8.339259,0.000000,3.251200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.350116,0.000000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.822653,0.000000,4.876800>}
box{<0,0,-0.203200><2.472537,0.035000,0.203200> rotate<0,0.000000,0> translate<8.350116,0.000000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.389300,0.000000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.665094,0.000000,10.972800>}
box{<0,0,-0.203200><2.275794,0.035000,0.203200> rotate<0,0.000000,0> translate<8.389300,0.000000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.400516,0.000000,3.657600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.888800,0.000000,3.657600>}
box{<0,0,-0.203200><3.488284,0.035000,0.203200> rotate<0,0.000000,0> translate<8.400516,0.000000,3.657600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.411369,0.000000,4.470400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.123809,0.000000,4.470400>}
box{<0,0,-0.203200><2.712441,0.035000,0.203200> rotate<0,0.000000,0> translate<8.411369,0.000000,4.470400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.461769,0.000000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.530209,0.000000,4.064000>}
box{<0,0,-0.203200><3.068441,0.035000,0.203200> rotate<0,0.000000,0> translate<8.461769,0.000000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.778194,0.000000,15.742800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.778194,0.000000,16.728178>}
box{<0,0,-0.203200><0.985378,0.035000,0.203200> rotate<0,90.000000,0> translate<8.778194,0.000000,16.728178> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.778194,0.000000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.021800,0.000000,15.849600>}
box{<0,0,-0.203200><0.243606,0.035000,0.203200> rotate<0,0.000000,0> translate<8.778194,0.000000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.778194,0.000000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.021800,0.000000,16.256000>}
box{<0,0,-0.203200><0.243606,0.035000,0.203200> rotate<0,0.000000,0> translate<8.778194,0.000000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.778194,0.000000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.021800,0.000000,16.662400>}
box{<0,0,-0.203200><0.243606,0.035000,0.203200> rotate<0,0.000000,0> translate<8.778194,0.000000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.778194,0.000000,16.728178>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.021800,0.000000,16.728178>}
box{<0,0,-0.203200><0.243606,0.035000,0.203200> rotate<0,0.000000,0> translate<8.778194,0.000000,16.728178> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.795700,0.000000,10.566400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.071494,0.000000,10.566400>}
box{<0,0,-0.203200><2.275794,0.035000,0.203200> rotate<0,0.000000,0> translate<8.795700,0.000000,10.566400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.021800,0.000000,15.742797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.710191,0.000000,15.742800>}
box{<0,0,-0.203200><0.688391,0.035000,0.203200> rotate<0,-0.000260,0> translate<9.021800,0.000000,15.742797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.021800,0.000000,16.728178>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.021800,0.000000,15.742797>}
box{<0,0,-0.203200><0.985381,0.035000,0.203200> rotate<0,-90.000000,0> translate<9.021800,0.000000,15.742797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.021819,0.000000,16.728194>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.021819,0.000000,16.971800>}
box{<0,0,-0.203200><0.243606,0.035000,0.203200> rotate<0,90.000000,0> translate<9.021819,0.000000,16.971800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.021819,0.000000,16.728194>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.022800,0.000000,16.728194>}
box{<0,0,-0.203200><1.000981,0.035000,0.203200> rotate<0,0.000000,0> translate<9.021819,0.000000,16.728194> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.021819,0.000000,16.971800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.040906,0.000000,16.971800>}
box{<0,0,-0.203200><1.019088,0.035000,0.203200> rotate<0,0.000000,0> translate<9.021819,0.000000,16.971800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.202100,0.000000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.477894,0.000000,10.160000>}
box{<0,0,-0.203200><2.275794,0.035000,0.203200> rotate<0,0.000000,0> translate<9.202100,0.000000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.608500,0.000000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.234031,0.000000,9.753600>}
box{<0,0,-0.203200><2.625531,0.035000,0.203200> rotate<0,0.000000,0> translate<9.608500,0.000000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.710191,0.000000,15.742800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.790400,0.000000,15.764294>}
box{<0,0,-0.203200><0.083039,0.035000,0.203200> rotate<0,-15.000151,0> translate<9.710191,0.000000,15.742800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.790400,0.000000,11.978741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.883206,0.000000,11.754688>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<9.790400,0.000000,11.978741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.790400,0.000000,15.764294>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.790400,0.000000,11.978741>}
box{<0,0,-0.203200><3.785553,0.035000,0.203200> rotate<0,-90.000000,0> translate<9.790400,0.000000,11.978741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.835928,0.000000,19.788800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.056397,0.000000,19.568334>}
box{<0,0,-0.203200><0.311788,0.035000,0.203200> rotate<0,44.996624,0> translate<9.835928,0.000000,19.788800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.835928,0.000000,19.788800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.841466,0.000000,19.788800>}
box{<0,0,-0.203200><5.005538,0.035000,0.203200> rotate<0,0.000000,0> translate<9.835928,0.000000,19.788800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.883206,0.000000,11.754688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.483206,0.000000,10.154691>}
box{<0,0,-0.203200><2.262739,0.035000,0.203200> rotate<0,44.996974,0> translate<9.883206,0.000000,11.754688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.014900,0.000000,9.347200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.985097,0.000000,9.347200>}
box{<0,0,-0.203200><7.970197,0.035000,0.203200> rotate<0,0.000000,0> translate<10.014900,0.000000,9.347200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.022797,0.000000,16.780013>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.022800,0.000000,16.880788>}
box{<0,0,-0.203200><0.100775,0.035000,0.203200> rotate<0,-89.992284,0> translate<10.022797,0.000000,16.780013> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.022797,0.000000,16.780013>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.979966,0.000000,16.780013>}
box{<0,0,-0.203200><1.957169,0.035000,0.203200> rotate<0,0.000000,0> translate<10.022797,0.000000,16.780013> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.022800,0.000000,16.779981>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.022800,0.000000,16.728194>}
box{<0,0,-0.203200><0.051788,0.035000,0.203200> rotate<0,-90.000000,0> translate<10.022800,0.000000,16.728194> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.022800,0.000000,16.779981>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.979966,0.000000,16.779981>}
box{<0,0,-0.203200><1.957166,0.035000,0.203200> rotate<0,0.000000,0> translate<10.022800,0.000000,16.779981> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.022800,0.000000,16.880788>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.040906,0.000000,16.971800>}
box{<0,0,-0.203200><0.092796,0.035000,0.203200> rotate<0,-78.743145,0> translate<10.022800,0.000000,16.880788> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.056397,0.000000,19.005703>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.056397,0.000000,19.568334>}
box{<0,0,-0.203200><0.562631,0.035000,0.203200> rotate<0,90.000000,0> translate<10.056397,0.000000,19.568334> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.056397,0.000000,19.005703>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.022503,0.000000,18.039597>}
box{<0,0,-0.203200><1.366281,0.035000,0.203200> rotate<0,44.997030,0> translate<10.056397,0.000000,19.005703> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.056397,0.000000,19.100800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.293413,0.000000,19.100800>}
box{<0,0,-0.203200><8.237016,0.035000,0.203200> rotate<0,0.000000,0> translate<10.056397,0.000000,19.100800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.056397,0.000000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.887013,0.000000,19.507200>}
box{<0,0,-0.203200><7.830616,0.035000,0.203200> rotate<0,0.000000,0> translate<10.056397,0.000000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.367700,0.000000,18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.699813,0.000000,18.694400>}
box{<0,0,-0.203200><8.332112,0.035000,0.203200> rotate<0,0.000000,0> translate<10.367700,0.000000,18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.421300,0.000000,8.940800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.408434,0.000000,8.940800>}
box{<0,0,-0.203200><1.987134,0.035000,0.203200> rotate<0,0.000000,0> translate<10.421300,0.000000,8.940800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.774100,0.000000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.106213,0.000000,18.288000>}
box{<0,0,-0.203200><8.332113,0.035000,0.203200> rotate<0,0.000000,0> translate<10.774100,0.000000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.788800,0.000000,4.958531>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.897072,0.000000,4.697138>}
box{<0,0,-0.203200><0.282930,0.035000,0.203200> rotate<0,67.495725,0> translate<10.788800,0.000000,4.958531> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.788800,0.000000,5.405409>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.788800,0.000000,4.958531>}
box{<0,0,-0.203200><0.446878,0.035000,0.203200> rotate<0,-90.000000,0> translate<10.788800,0.000000,4.958531> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.827700,0.000000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.002034,0.000000,8.534400>}
box{<0,0,-0.203200><1.174334,0.035000,0.203200> rotate<0,0.000000,0> translate<10.827700,0.000000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.897072,0.000000,4.697138>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.097138,0.000000,4.497072>}
box{<0,0,-0.203200><0.282936,0.035000,0.203200> rotate<0,44.997030,0> translate<10.897072,0.000000,4.697138> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.009597,0.000000,12.352503>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.009597,0.000000,15.520400>}
box{<0,0,-0.203200><3.167897,0.035000,0.203200> rotate<0,90.000000,0> translate<11.009597,0.000000,15.520400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.009597,0.000000,12.352503>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.144869,0.000000,11.217231>}
box{<0,0,-0.203200><1.605517,0.035000,0.203200> rotate<0,44.997030,0> translate<11.009597,0.000000,12.352503> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.009597,0.000000,12.598400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.590400,0.000000,12.598400>}
box{<0,0,-0.203200><6.580803,0.035000,0.203200> rotate<0,0.000000,0> translate<11.009597,0.000000,12.598400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.009597,0.000000,13.004800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.590400,0.000000,13.004800>}
box{<0,0,-0.203200><6.580803,0.035000,0.203200> rotate<0,0.000000,0> translate<11.009597,0.000000,13.004800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.009597,0.000000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.590400,0.000000,13.411200>}
box{<0,0,-0.203200><6.580803,0.035000,0.203200> rotate<0,0.000000,0> translate<11.009597,0.000000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.009597,0.000000,13.817600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.590400,0.000000,13.817600>}
box{<0,0,-0.203200><6.580803,0.035000,0.203200> rotate<0,0.000000,0> translate<11.009597,0.000000,13.817600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.009597,0.000000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.590400,0.000000,14.224000>}
box{<0,0,-0.203200><6.580803,0.035000,0.203200> rotate<0,0.000000,0> translate<11.009597,0.000000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.009597,0.000000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.590400,0.000000,14.630400>}
box{<0,0,-0.203200><6.580803,0.035000,0.203200> rotate<0,0.000000,0> translate<11.009597,0.000000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.009597,0.000000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.501094,0.000000,15.036800>}
box{<0,0,-0.203200><6.491497,0.035000,0.203200> rotate<0,0.000000,0> translate<11.009597,0.000000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.009597,0.000000,15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.094694,0.000000,15.443200>}
box{<0,0,-0.203200><6.085097,0.035000,0.203200> rotate<0,0.000000,0> translate<11.009597,0.000000,15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.009597,0.000000,15.520400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.101256,0.000000,15.520400>}
box{<0,0,-0.203200><1.091659,0.035000,0.203200> rotate<0,0.000000,0> translate<11.009597,0.000000,15.520400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.022503,0.000000,18.039597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.101256,0.000000,18.039597>}
box{<0,0,-0.203200><1.078753,0.035000,0.203200> rotate<0,0.000000,0> translate<11.022503,0.000000,18.039597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.097138,0.000000,4.497072>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.888800,0.000000,3.705409>}
box{<0,0,-0.203200><1.119580,0.035000,0.203200> rotate<0,44.997030,0> translate<11.097138,0.000000,4.497072> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.170100,0.000000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.590400,0.000000,12.192000>}
box{<0,0,-0.203200><6.420300,0.035000,0.203200> rotate<0,0.000000,0> translate<11.170100,0.000000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.234100,0.000000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.941600,0.000000,8.128000>}
box{<0,0,-0.203200><0.707500,0.035000,0.203200> rotate<0,0.000000,0> translate<11.234100,0.000000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.483206,0.000000,10.154687>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.654688,0.000000,9.983206>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<11.483206,0.000000,10.154687> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.483206,0.000000,10.154691>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.483206,0.000000,10.154687>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,-90.000000,0> translate<11.483206,0.000000,10.154687> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.493600,0.000000,22.728800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.493600,0.000000,21.211197>}
box{<0,0,-0.203200><1.517603,0.035000,0.203200> rotate<0,-90.000000,0> translate<11.493600,0.000000,21.211197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.493600,0.000000,25.268334>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.493600,0.000000,24.151197>}
box{<0,0,-0.203200><1.117138,0.035000,0.203200> rotate<0,-90.000000,0> translate<11.493600,0.000000,24.151197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.493600,0.000000,25.268334>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.723294,0.000000,25.498025>}
box{<0,0,-0.203200><0.324834,0.035000,0.203200> rotate<0,-44.996640,0> translate<11.493600,0.000000,25.268334> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.576500,0.000000,11.785600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.590400,0.000000,11.785600>}
box{<0,0,-0.203200><6.013900,0.035000,0.203200> rotate<0,0.000000,0> translate<11.576500,0.000000,11.785600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.603200,0.000000,25.618116>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.723294,0.000000,25.498025>}
box{<0,0,-0.203200><0.169836,0.035000,0.203200> rotate<0,44.996285,0> translate<11.603200,0.000000,25.618116> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.603200,0.000000,26.501881>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.603200,0.000000,25.618116>}
box{<0,0,-0.203200><0.883766,0.035000,0.203200> rotate<0,-90.000000,0> translate<11.603200,0.000000,25.618116> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.603200,0.000000,26.501881>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.228116,0.000000,27.126797>}
box{<0,0,-0.203200><0.883764,0.035000,0.203200> rotate<0,-44.997030,0> translate<11.603200,0.000000,26.501881> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.640500,0.000000,7.721600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.941600,0.000000,7.721600>}
box{<0,0,-0.203200><0.301100,0.035000,0.203200> rotate<0,0.000000,0> translate<11.640500,0.000000,7.721600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.654688,0.000000,9.983206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.878741,0.000000,9.890400>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<11.654688,0.000000,9.983206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.878741,0.000000,9.890400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.097231,0.000000,9.890400>}
box{<0,0,-0.203200><0.218491,0.035000,0.203200> rotate<0,0.000000,0> translate<11.878741,0.000000,9.890400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.888800,0.000000,3.278531>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.941600,0.000000,3.151059>}
box{<0,0,-0.203200><0.137974,0.035000,0.203200> rotate<0,67.495768,0> translate<11.888800,0.000000,3.278531> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.888800,0.000000,3.705409>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.888800,0.000000,3.278531>}
box{<0,0,-0.203200><0.426878,0.035000,0.203200> rotate<0,-90.000000,0> translate<11.888800,0.000000,3.278531> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.941600,0.000000,2.426031>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.626031,0.000000,1.741600>}
box{<0,0,-0.203200><0.967932,0.035000,0.203200> rotate<0,44.997030,0> translate<11.941600,0.000000,2.426031> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.941600,0.000000,3.151059>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.941600,0.000000,2.426031>}
box{<0,0,-0.203200><0.725028,0.035000,0.203200> rotate<0,-90.000000,0> translate<11.941600,0.000000,2.426031> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.941600,0.000000,7.506031>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.626031,0.000000,6.821600>}
box{<0,0,-0.203200><0.967932,0.035000,0.203200> rotate<0,44.997030,0> translate<11.941600,0.000000,7.506031> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.941600,0.000000,8.473966>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.941600,0.000000,7.506031>}
box{<0,0,-0.203200><0.967934,0.035000,0.203200> rotate<0,-90.000000,0> translate<11.941600,0.000000,7.506031> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.941600,0.000000,8.473966>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.626031,0.000000,9.158397>}
box{<0,0,-0.203200><0.967932,0.035000,0.203200> rotate<0,-44.997030,0> translate<11.941600,0.000000,8.473966> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.979966,0.000000,16.780013>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.979966,0.000000,16.779981>}
box{<0,0,-0.203200><0.000031,0.035000,0.203200> rotate<0,-90.000000,0> translate<11.979966,0.000000,16.779981> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.980031,0.000000,16.779981>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.980031,0.000000,16.780013>}
box{<0,0,-0.203200><0.000031,0.035000,0.203200> rotate<0,90.000000,0> translate<11.980031,0.000000,16.780013> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.980031,0.000000,16.779981>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.937197,0.000000,16.779981>}
box{<0,0,-0.203200><1.957166,0.035000,0.203200> rotate<0,0.000000,0> translate<11.980031,0.000000,16.779981> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.980031,0.000000,16.780013>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.937194,0.000000,16.780013>}
box{<0,0,-0.203200><1.957163,0.035000,0.203200> rotate<0,0.000000,0> translate<11.980031,0.000000,16.780013> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.982900,0.000000,11.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.306838,0.000000,11.379200>}
box{<0,0,-0.203200><0.323937,0.035000,0.203200> rotate<0,0.000000,0> translate<11.982900,0.000000,11.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.046900,0.000000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.132431,0.000000,7.315200>}
box{<0,0,-0.203200><0.085531,0.035000,0.203200> rotate<0,0.000000,0> translate<12.046900,0.000000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.097231,0.000000,9.890400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.626031,0.000000,9.361600>}
box{<0,0,-0.203200><0.747836,0.035000,0.203200> rotate<0,44.997030,0> translate<12.097231,0.000000,9.890400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.101256,0.000000,15.520400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.108978,0.000000,15.523600>}
box{<0,0,-0.203200><0.008359,0.035000,0.203200> rotate<0,-22.507980,0> translate<12.101256,0.000000,15.520400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.101256,0.000000,18.039597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.108981,0.000000,18.036397>}
box{<0,0,-0.203200><0.008362,0.035000,0.203200> rotate<0,22.499783,0> translate<12.101256,0.000000,18.039597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.108978,0.000000,15.523600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.554609,0.000000,15.523600>}
box{<0,0,-0.203200><1.445631,0.035000,0.203200> rotate<0,0.000000,0> translate<12.108978,0.000000,15.523600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.108981,0.000000,18.036397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.648334,0.000000,18.036397>}
box{<0,0,-0.203200><1.539353,0.035000,0.203200> rotate<0,0.000000,0> translate<12.108981,0.000000,18.036397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.144869,0.000000,11.217231>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.626031,0.000000,11.698397>}
box{<0,0,-0.203200><0.680469,0.035000,0.203200> rotate<0,-44.997216,0> translate<12.144869,0.000000,11.217231> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.228116,0.000000,27.126797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.111881,0.000000,27.126797>}
box{<0,0,-0.203200><0.883766,0.035000,0.203200> rotate<0,0.000000,0> translate<12.228116,0.000000,27.126797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.453300,0.000000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.538831,0.000000,6.908800>}
box{<0,0,-0.203200><0.085531,0.035000,0.203200> rotate<0,0.000000,0> translate<12.453300,0.000000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.626031,0.000000,1.741600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.593966,0.000000,1.741600>}
box{<0,0,-0.203200><0.967934,0.035000,0.203200> rotate<0,0.000000,0> translate<12.626031,0.000000,1.741600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.626031,0.000000,6.821600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.593966,0.000000,6.821600>}
box{<0,0,-0.203200><0.967934,0.035000,0.203200> rotate<0,0.000000,0> translate<12.626031,0.000000,6.821600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.626031,0.000000,9.158397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.593966,0.000000,9.158397>}
box{<0,0,-0.203200><0.967934,0.035000,0.203200> rotate<0,0.000000,0> translate<12.626031,0.000000,9.158397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.626031,0.000000,9.361600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.593966,0.000000,9.361600>}
box{<0,0,-0.203200><0.967934,0.035000,0.203200> rotate<0,0.000000,0> translate<12.626031,0.000000,9.361600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.626031,0.000000,11.698397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.593966,0.000000,11.698397>}
box{<0,0,-0.203200><0.967934,0.035000,0.203200> rotate<0,0.000000,0> translate<12.626031,0.000000,11.698397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.743703,0.000000,6.618397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.593966,0.000000,6.618397>}
box{<0,0,-0.203200><0.850262,0.035000,0.203200> rotate<0,0.000000,0> translate<12.743703,0.000000,6.618397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.111881,0.000000,27.126797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.736797,0.000000,26.501881>}
box{<0,0,-0.203200><0.883764,0.035000,0.203200> rotate<0,44.997030,0> translate<13.111881,0.000000,27.126797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.294572,0.000000,4.281600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.311197,0.000000,4.241466>}
box{<0,0,-0.203200><0.043441,0.035000,0.203200> rotate<0,67.494573,0> translate<13.294572,0.000000,4.281600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.294572,0.000000,4.281600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.593966,0.000000,4.281600>}
box{<0,0,-0.203200><0.299394,0.035000,0.203200> rotate<0,0.000000,0> translate<13.294572,0.000000,4.281600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.311197,0.000000,4.078397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.311197,0.000000,4.241466>}
box{<0,0,-0.203200><0.163069,0.035000,0.203200> rotate<0,90.000000,0> translate<13.311197,0.000000,4.241466> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.311197,0.000000,4.078397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.593966,0.000000,4.078397>}
box{<0,0,-0.203200><0.282769,0.035000,0.203200> rotate<0,0.000000,0> translate<13.311197,0.000000,4.078397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.416278,0.000000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.463719,0.000000,26.822400>}
box{<0,0,-0.203200><1.047441,0.035000,0.203200> rotate<0,0.000000,0> translate<13.416278,0.000000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.496703,0.000000,25.378025>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.606397,0.000000,25.268334>}
box{<0,0,-0.203200><0.155128,0.035000,0.203200> rotate<0,44.996214,0> translate<13.496703,0.000000,25.378025> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.496703,0.000000,25.378025>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.736797,0.000000,25.618116>}
box{<0,0,-0.203200><0.339542,0.035000,0.203200> rotate<0,-44.996657,0> translate<13.496703,0.000000,25.378025> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.554609,0.000000,15.523600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.886397,0.000000,15.855388>}
box{<0,0,-0.203200><0.469218,0.035000,0.203200> rotate<0,-44.997030,0> translate<13.554609,0.000000,15.523600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.593966,0.000000,1.741600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.278397,0.000000,2.426031>}
box{<0,0,-0.203200><0.967932,0.035000,0.203200> rotate<0,-44.997030,0> translate<13.593966,0.000000,1.741600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.593966,0.000000,4.078397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.278397,0.000000,3.393966>}
box{<0,0,-0.203200><0.967932,0.035000,0.203200> rotate<0,44.997030,0> translate<13.593966,0.000000,4.078397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.593966,0.000000,4.281600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.278397,0.000000,4.966031>}
box{<0,0,-0.203200><0.967932,0.035000,0.203200> rotate<0,-44.997030,0> translate<13.593966,0.000000,4.281600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.593966,0.000000,6.618397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.278397,0.000000,5.933966>}
box{<0,0,-0.203200><0.967932,0.035000,0.203200> rotate<0,44.997030,0> translate<13.593966,0.000000,6.618397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.593966,0.000000,6.821600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.278397,0.000000,7.506031>}
box{<0,0,-0.203200><0.967932,0.035000,0.203200> rotate<0,-44.997030,0> translate<13.593966,0.000000,6.821600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.593966,0.000000,9.158397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.278397,0.000000,8.473966>}
box{<0,0,-0.203200><0.967932,0.035000,0.203200> rotate<0,44.997030,0> translate<13.593966,0.000000,9.158397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.593966,0.000000,9.361600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.278397,0.000000,10.046031>}
box{<0,0,-0.203200><0.967932,0.035000,0.203200> rotate<0,-44.997030,0> translate<13.593966,0.000000,9.361600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.593966,0.000000,11.698397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.278397,0.000000,11.013966>}
box{<0,0,-0.203200><0.967932,0.035000,0.203200> rotate<0,44.997030,0> translate<13.593966,0.000000,11.698397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.606397,0.000000,21.211197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.606397,0.000000,25.268334>}
box{<0,0,-0.203200><4.057137,0.035000,0.203200> rotate<0,90.000000,0> translate<13.606397,0.000000,25.268334> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.606397,0.000000,21.211197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.193600,0.000000,21.211197>}
box{<0,0,-0.203200><0.587203,0.035000,0.203200> rotate<0,0.000000,0> translate<13.606397,0.000000,21.211197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.606397,0.000000,21.539200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.193600,0.000000,21.539200>}
box{<0,0,-0.203200><0.587203,0.035000,0.203200> rotate<0,0.000000,0> translate<13.606397,0.000000,21.539200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.606397,0.000000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.193600,0.000000,21.945600>}
box{<0,0,-0.203200><0.587203,0.035000,0.203200> rotate<0,0.000000,0> translate<13.606397,0.000000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.606397,0.000000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.193600,0.000000,22.352000>}
box{<0,0,-0.203200><0.587203,0.035000,0.203200> rotate<0,0.000000,0> translate<13.606397,0.000000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.606397,0.000000,22.758400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.193600,0.000000,22.758400>}
box{<0,0,-0.203200><0.587203,0.035000,0.203200> rotate<0,0.000000,0> translate<13.606397,0.000000,22.758400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.606397,0.000000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.193600,0.000000,23.164800>}
box{<0,0,-0.203200><0.587203,0.035000,0.203200> rotate<0,0.000000,0> translate<13.606397,0.000000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.606397,0.000000,23.571200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.193600,0.000000,23.571200>}
box{<0,0,-0.203200><0.587203,0.035000,0.203200> rotate<0,0.000000,0> translate<13.606397,0.000000,23.571200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.606397,0.000000,23.977600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.193600,0.000000,23.977600>}
box{<0,0,-0.203200><0.587203,0.035000,0.203200> rotate<0,0.000000,0> translate<13.606397,0.000000,23.977600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.606397,0.000000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.193600,0.000000,24.384000>}
box{<0,0,-0.203200><0.587203,0.035000,0.203200> rotate<0,0.000000,0> translate<13.606397,0.000000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.606397,0.000000,24.790400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.193600,0.000000,24.790400>}
box{<0,0,-0.203200><0.587203,0.035000,0.203200> rotate<0,0.000000,0> translate<13.606397,0.000000,24.790400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.606397,0.000000,25.196800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.193600,0.000000,25.196800>}
box{<0,0,-0.203200><0.587203,0.035000,0.203200> rotate<0,0.000000,0> translate<13.606397,0.000000,25.196800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.608363,0.000000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.079794,0.000000,4.064000>}
box{<0,0,-0.203200><1.471431,0.035000,0.203200> rotate<0,0.000000,0> translate<13.608363,0.000000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.648334,0.000000,18.036397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.886397,0.000000,17.798334>}
box{<0,0,-0.203200><0.336671,0.035000,0.203200> rotate<0,44.997030,0> translate<13.648334,0.000000,18.036397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.681166,0.000000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.078831,0.000000,6.908800>}
box{<0,0,-0.203200><1.397666,0.035000,0.203200> rotate<0,0.000000,0> translate<13.681166,0.000000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.709963,0.000000,6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.050034,0.000000,6.502400>}
box{<0,0,-0.203200><1.340072,0.035000,0.203200> rotate<0,0.000000,0> translate<13.709963,0.000000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.721878,0.000000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.158116,0.000000,25.603200>}
box{<0,0,-0.203200><0.436238,0.035000,0.203200> rotate<0,0.000000,0> translate<13.721878,0.000000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.736797,0.000000,25.618116>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.736797,0.000000,26.501881>}
box{<0,0,-0.203200><0.883766,0.035000,0.203200> rotate<0,90.000000,0> translate<13.736797,0.000000,26.501881> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.736797,0.000000,26.009600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.143200,0.000000,26.009600>}
box{<0,0,-0.203200><0.406403,0.035000,0.203200> rotate<0,0.000000,0> translate<13.736797,0.000000,26.009600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.736797,0.000000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.143200,0.000000,26.416000>}
box{<0,0,-0.203200><0.406403,0.035000,0.203200> rotate<0,0.000000,0> translate<13.736797,0.000000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.782766,0.000000,4.470400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.977231,0.000000,4.470400>}
box{<0,0,-0.203200><1.194466,0.035000,0.203200> rotate<0,0.000000,0> translate<13.782766,0.000000,4.470400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.803131,0.000000,17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.250591,0.000000,17.881600>}
box{<0,0,-0.203200><0.447459,0.035000,0.203200> rotate<0,0.000000,0> translate<13.803131,0.000000,17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.811563,0.000000,8.940800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.948434,0.000000,8.940800>}
box{<0,0,-0.203200><1.136872,0.035000,0.203200> rotate<0,0.000000,0> translate<13.811563,0.000000,8.940800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.857503,0.000000,16.433503>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.866953,0.000000,16.447644>}
box{<0,0,-0.203200><0.017008,0.035000,0.203200> rotate<0,-56.241984,0> translate<13.857503,0.000000,16.433503> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.857503,0.000000,16.433503>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.886397,0.000000,16.404609>}
box{<0,0,-0.203200><0.040862,0.035000,0.203200> rotate<0,44.997030,0> translate<13.857503,0.000000,16.433503> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.866953,0.000000,16.447644>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.913478,0.000000,16.559966>}
box{<0,0,-0.203200><0.121576,0.035000,0.203200> rotate<0,-67.495651,0> translate<13.866953,0.000000,16.447644> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.880609,0.000000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.079388,0.000000,15.849600>}
box{<0,0,-0.203200><0.198778,0.035000,0.203200> rotate<0,0.000000,0> translate<13.880609,0.000000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.884366,0.000000,2.032000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.803791,0.000000,2.032000>}
box{<0,0,-0.203200><0.919425,0.035000,0.203200> rotate<0,0.000000,0> translate<13.884366,0.000000,2.032000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.886397,0.000000,15.855388>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.886397,0.000000,16.404609>}
box{<0,0,-0.203200><0.549222,0.035000,0.203200> rotate<0,90.000000,0> translate<13.886397,0.000000,16.404609> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.886397,0.000000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.073600,0.000000,16.256000>}
box{<0,0,-0.203200><0.187203,0.035000,0.203200> rotate<0,0.000000,0> translate<13.886397,0.000000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.886397,0.000000,17.065409>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.886397,0.000000,17.798334>}
box{<0,0,-0.203200><0.732925,0.035000,0.203200> rotate<0,90.000000,0> translate<13.886397,0.000000,17.798334> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.886397,0.000000,17.065409>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.913478,0.000000,17.000031>}
box{<0,0,-0.203200><0.070765,0.035000,0.203200> rotate<0,67.494989,0> translate<13.886397,0.000000,17.065409> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.886397,0.000000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.087794,0.000000,17.068800>}
box{<0,0,-0.203200><0.201397,0.035000,0.203200> rotate<0,0.000000,0> translate<13.886397,0.000000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.886397,0.000000,17.475200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.073600,0.000000,17.475200>}
box{<0,0,-0.203200><0.187203,0.035000,0.203200> rotate<0,0.000000,0> translate<13.886397,0.000000,17.475200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.913163,0.000000,11.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.846834,0.000000,11.379200>}
box{<0,0,-0.203200><0.933672,0.035000,0.203200> rotate<0,0.000000,0> translate<13.913163,0.000000,11.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.913478,0.000000,16.559966>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.937197,0.000000,16.679209>}
box{<0,0,-0.203200><0.121580,0.035000,0.203200> rotate<0,-78.744945,0> translate<13.913478,0.000000,16.559966> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.913478,0.000000,17.000031>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.937197,0.000000,16.880788>}
box{<0,0,-0.203200><0.121580,0.035000,0.203200> rotate<0,78.744945,0> translate<13.913478,0.000000,17.000031> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.933853,0.000000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.073600,0.000000,16.662400>}
box{<0,0,-0.203200><0.139747,0.035000,0.203200> rotate<0,0.000000,0> translate<13.933853,0.000000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.937194,0.000000,16.780013>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.937197,0.000000,16.880788>}
box{<0,0,-0.203200><0.100775,0.035000,0.203200> rotate<0,-89.992284,0> translate<13.937194,0.000000,16.780013> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.937197,0.000000,16.679209>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.937197,0.000000,16.779981>}
box{<0,0,-0.203200><0.100772,0.035000,0.203200> rotate<0,90.000000,0> translate<13.937197,0.000000,16.779981> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.985966,0.000000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.774031,0.000000,9.753600>}
box{<0,0,-0.203200><0.788066,0.035000,0.203200> rotate<0,0.000000,0> translate<13.985966,0.000000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.014762,0.000000,3.657600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.673394,0.000000,3.657600>}
box{<0,0,-0.203200><0.658631,0.035000,0.203200> rotate<0,0.000000,0> translate<14.014762,0.000000,3.657600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.073600,0.000000,15.855388>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.405388,0.000000,15.523600>}
box{<0,0,-0.203200><0.469218,0.035000,0.203200> rotate<0,44.997030,0> translate<14.073600,0.000000,15.855388> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.073600,0.000000,16.404609>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.073600,0.000000,15.855388>}
box{<0,0,-0.203200><0.549222,0.035000,0.203200> rotate<0,-90.000000,0> translate<14.073600,0.000000,15.855388> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.073600,0.000000,16.404609>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.123991,0.000000,16.455000>}
box{<0,0,-0.203200><0.071263,0.035000,0.203200> rotate<0,-44.997030,0> translate<14.073600,0.000000,16.404609> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.073600,0.000000,16.505388>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.123991,0.000000,16.455000>}
box{<0,0,-0.203200><0.071261,0.035000,0.203200> rotate<0,44.995254,0> translate<14.073600,0.000000,16.505388> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.073600,0.000000,17.054609>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.073600,0.000000,16.505388>}
box{<0,0,-0.203200><0.549222,0.035000,0.203200> rotate<0,-90.000000,0> translate<14.073600,0.000000,16.505388> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.073600,0.000000,17.054609>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.123991,0.000000,17.104997>}
box{<0,0,-0.203200><0.071261,0.035000,0.203200> rotate<0,-44.995254,0> translate<14.073600,0.000000,17.054609> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.073600,0.000000,17.155387>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.123991,0.000000,17.104997>}
box{<0,0,-0.203200><0.071263,0.035000,0.203200> rotate<0,44.997030,0> translate<14.073600,0.000000,17.155387> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.073600,0.000000,17.704609>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.073600,0.000000,17.155387>}
box{<0,0,-0.203200><0.549222,0.035000,0.203200> rotate<0,-90.000000,0> translate<14.073600,0.000000,17.155387> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.073600,0.000000,17.704609>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.405388,0.000000,18.036397>}
box{<0,0,-0.203200><0.469218,0.035000,0.203200> rotate<0,-44.997030,0> translate<14.073600,0.000000,17.704609> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.087566,0.000000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.672431,0.000000,7.315200>}
box{<0,0,-0.203200><0.584866,0.035000,0.203200> rotate<0,0.000000,0> translate<14.087566,0.000000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.116363,0.000000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.643634,0.000000,6.096000>}
box{<0,0,-0.203200><0.527272,0.035000,0.203200> rotate<0,0.000000,0> translate<14.116363,0.000000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.143200,0.000000,25.618116>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.343294,0.000000,25.418025>}
box{<0,0,-0.203200><0.282973,0.035000,0.203200> rotate<0,44.996583,0> translate<14.143200,0.000000,25.618116> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.143200,0.000000,26.501881>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.143200,0.000000,25.618116>}
box{<0,0,-0.203200><0.883766,0.035000,0.203200> rotate<0,-90.000000,0> translate<14.143200,0.000000,25.618116> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.143200,0.000000,26.501881>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.768116,0.000000,27.126797>}
box{<0,0,-0.203200><0.883764,0.035000,0.203200> rotate<0,-44.997030,0> translate<14.143200,0.000000,26.501881> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.189166,0.000000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.570831,0.000000,4.876800>}
box{<0,0,-0.203200><0.381666,0.035000,0.203200> rotate<0,0.000000,0> translate<14.189166,0.000000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.193600,0.000000,25.268334>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.193600,0.000000,21.211197>}
box{<0,0,-0.203200><4.057137,0.035000,0.203200> rotate<0,-90.000000,0> translate<14.193600,0.000000,21.211197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.193600,0.000000,25.268334>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.343294,0.000000,25.418025>}
box{<0,0,-0.203200><0.211697,0.035000,0.203200> rotate<0,-44.996432,0> translate<14.193600,0.000000,25.268334> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.217963,0.000000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.542034,0.000000,8.534400>}
box{<0,0,-0.203200><0.324072,0.035000,0.203200> rotate<0,0.000000,0> translate<14.217963,0.000000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.278397,0.000000,2.426031>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.278397,0.000000,3.393966>}
box{<0,0,-0.203200><0.967934,0.035000,0.203200> rotate<0,90.000000,0> translate<14.278397,0.000000,3.393966> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.278397,0.000000,2.438400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.430800,0.000000,2.438400>}
box{<0,0,-0.203200><0.152403,0.035000,0.203200> rotate<0,0.000000,0> translate<14.278397,0.000000,2.438400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.278397,0.000000,2.844800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.430800,0.000000,2.844800>}
box{<0,0,-0.203200><0.152403,0.035000,0.203200> rotate<0,0.000000,0> translate<14.278397,0.000000,2.844800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.278397,0.000000,3.251200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.430800,0.000000,3.251200>}
box{<0,0,-0.203200><0.152403,0.035000,0.203200> rotate<0,0.000000,0> translate<14.278397,0.000000,3.251200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.278397,0.000000,4.966031>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.278397,0.000000,5.933966>}
box{<0,0,-0.203200><0.967934,0.035000,0.203200> rotate<0,90.000000,0> translate<14.278397,0.000000,5.933966> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.278397,0.000000,5.283200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.481600,0.000000,5.283200>}
box{<0,0,-0.203200><0.203203,0.035000,0.203200> rotate<0,0.000000,0> translate<14.278397,0.000000,5.283200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.278397,0.000000,5.689600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.481600,0.000000,5.689600>}
box{<0,0,-0.203200><0.203203,0.035000,0.203200> rotate<0,0.000000,0> translate<14.278397,0.000000,5.689600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.278397,0.000000,7.506031>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.278397,0.000000,8.473966>}
box{<0,0,-0.203200><0.967934,0.035000,0.203200> rotate<0,90.000000,0> translate<14.278397,0.000000,8.473966> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.278397,0.000000,7.721600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.481600,0.000000,7.721600>}
box{<0,0,-0.203200><0.203203,0.035000,0.203200> rotate<0,0.000000,0> translate<14.278397,0.000000,7.721600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.278397,0.000000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.481600,0.000000,8.128000>}
box{<0,0,-0.203200><0.203203,0.035000,0.203200> rotate<0,0.000000,0> translate<14.278397,0.000000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.278397,0.000000,10.046031>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.278397,0.000000,11.013966>}
box{<0,0,-0.203200><0.967934,0.035000,0.203200> rotate<0,90.000000,0> translate<14.278397,0.000000,11.013966> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.278397,0.000000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.481600,0.000000,10.160000>}
box{<0,0,-0.203200><0.203203,0.035000,0.203200> rotate<0,0.000000,0> translate<14.278397,0.000000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.278397,0.000000,10.566400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.481600,0.000000,10.566400>}
box{<0,0,-0.203200><0.203203,0.035000,0.203200> rotate<0,0.000000,0> translate<14.278397,0.000000,10.566400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.278397,0.000000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.481600,0.000000,10.972800>}
box{<0,0,-0.203200><0.203203,0.035000,0.203200> rotate<0,0.000000,0> translate<14.278397,0.000000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.405388,0.000000,15.523600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.851016,0.000000,15.523600>}
box{<0,0,-0.203200><1.445628,0.035000,0.203200> rotate<0,0.000000,0> translate<14.405388,0.000000,15.523600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.405388,0.000000,18.036397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.851016,0.000000,18.036397>}
box{<0,0,-0.203200><1.445628,0.035000,0.203200> rotate<0,0.000000,0> translate<14.405388,0.000000,18.036397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.430800,0.000000,2.404991>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.144991,0.000000,1.690800>}
box{<0,0,-0.203200><1.010018,0.035000,0.203200> rotate<0,44.997030,0> translate<14.430800,0.000000,2.404991> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.430800,0.000000,2.859194>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.430800,0.000000,2.404991>}
box{<0,0,-0.203200><0.454203,0.035000,0.203200> rotate<0,-90.000000,0> translate<14.430800,0.000000,2.404991> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.430800,0.000000,2.859194>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.599178,0.000000,2.859194>}
box{<0,0,-0.203200><1.168378,0.035000,0.203200> rotate<0,0.000000,0> translate<14.430800,0.000000,2.859194> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.430800,0.000000,2.960800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.599178,0.000000,2.960800>}
box{<0,0,-0.203200><1.168378,0.035000,0.203200> rotate<0,0.000000,0> translate<14.430800,0.000000,2.960800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.430800,0.000000,3.415006>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.430800,0.000000,2.960800>}
box{<0,0,-0.203200><0.454206,0.035000,0.203200> rotate<0,-90.000000,0> translate<14.430800,0.000000,2.960800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.430800,0.000000,3.415006>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.144991,0.000000,4.129197>}
box{<0,0,-0.203200><1.010018,0.035000,0.203200> rotate<0,-44.997030,0> translate<14.430800,0.000000,3.415006> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.481600,0.000000,4.966031>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.166031,0.000000,4.281600>}
box{<0,0,-0.203200><0.967932,0.035000,0.203200> rotate<0,44.997030,0> translate<14.481600,0.000000,4.966031> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.481600,0.000000,5.933966>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.481600,0.000000,4.966031>}
box{<0,0,-0.203200><0.967934,0.035000,0.203200> rotate<0,-90.000000,0> translate<14.481600,0.000000,4.966031> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.481600,0.000000,5.933966>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.166031,0.000000,6.618397>}
box{<0,0,-0.203200><0.967932,0.035000,0.203200> rotate<0,-44.997030,0> translate<14.481600,0.000000,5.933966> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.481600,0.000000,7.506031>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.166031,0.000000,6.821600>}
box{<0,0,-0.203200><0.967932,0.035000,0.203200> rotate<0,44.997030,0> translate<14.481600,0.000000,7.506031> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.481600,0.000000,8.473966>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.481600,0.000000,7.506031>}
box{<0,0,-0.203200><0.967934,0.035000,0.203200> rotate<0,-90.000000,0> translate<14.481600,0.000000,7.506031> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.481600,0.000000,8.473966>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.166031,0.000000,9.158397>}
box{<0,0,-0.203200><0.967932,0.035000,0.203200> rotate<0,-44.997030,0> translate<14.481600,0.000000,8.473966> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.481600,0.000000,10.046031>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.166031,0.000000,9.361600>}
box{<0,0,-0.203200><0.967932,0.035000,0.203200> rotate<0,44.997030,0> translate<14.481600,0.000000,10.046031> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.481600,0.000000,11.013966>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.481600,0.000000,10.046031>}
box{<0,0,-0.203200><0.967934,0.035000,0.203200> rotate<0,-90.000000,0> translate<14.481600,0.000000,10.046031> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.481600,0.000000,11.013966>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.166031,0.000000,11.698397>}
box{<0,0,-0.203200><0.967932,0.035000,0.203200> rotate<0,-44.997030,0> translate<14.481600,0.000000,11.013966> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.768116,0.000000,27.126797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.651881,0.000000,27.126797>}
box{<0,0,-0.203200><0.883766,0.035000,0.203200> rotate<0,0.000000,0> translate<14.768116,0.000000,27.126797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.841466,0.000000,19.788800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.102859,0.000000,19.897072>}
box{<0,0,-0.203200><0.282930,0.035000,0.203200> rotate<0,-22.498335,0> translate<14.841466,0.000000,19.788800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.102859,0.000000,19.897072>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.302925,0.000000,20.097138>}
box{<0,0,-0.203200><0.282936,0.035000,0.203200> rotate<0,-44.997030,0> translate<15.102859,0.000000,19.897072> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.119388,0.000000,19.913600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.480612,0.000000,19.913600>}
box{<0,0,-0.203200><2.361225,0.035000,0.203200> rotate<0,0.000000,0> translate<15.119388,0.000000,19.913600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.144991,0.000000,1.690800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.599194,0.000000,1.690797>}
box{<0,0,-0.203200><0.454203,0.035000,0.203200> rotate<0,0.000394,0> translate<15.144991,0.000000,1.690800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.144991,0.000000,4.129197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.599194,0.000000,4.129194>}
box{<0,0,-0.203200><0.454203,0.035000,0.203200> rotate<0,0.000394,0> translate<15.144991,0.000000,4.129197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.166031,0.000000,4.281600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.133966,0.000000,4.281600>}
box{<0,0,-0.203200><0.967934,0.035000,0.203200> rotate<0,0.000000,0> translate<15.166031,0.000000,4.281600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.166031,0.000000,6.618397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.133966,0.000000,6.618397>}
box{<0,0,-0.203200><0.967934,0.035000,0.203200> rotate<0,0.000000,0> translate<15.166031,0.000000,6.618397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.166031,0.000000,6.821600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.133966,0.000000,6.821600>}
box{<0,0,-0.203200><0.967934,0.035000,0.203200> rotate<0,0.000000,0> translate<15.166031,0.000000,6.821600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.166031,0.000000,9.158397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.133966,0.000000,9.158397>}
box{<0,0,-0.203200><0.967934,0.035000,0.203200> rotate<0,0.000000,0> translate<15.166031,0.000000,9.158397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.166031,0.000000,9.361600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.133966,0.000000,9.361600>}
box{<0,0,-0.203200><0.967934,0.035000,0.203200> rotate<0,0.000000,0> translate<15.166031,0.000000,9.361600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.166031,0.000000,11.698397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.133966,0.000000,11.698397>}
box{<0,0,-0.203200><0.967934,0.035000,0.203200> rotate<0,0.000000,0> translate<15.166031,0.000000,11.698397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.302925,0.000000,20.097138>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.852925,0.000000,20.647137>}
box{<0,0,-0.203200><0.777817,0.035000,0.203200> rotate<0,-44.997030,0> translate<15.302925,0.000000,20.097138> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.525788,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.074213,0.000000,20.320000>}
box{<0,0,-0.203200><1.548425,0.035000,0.203200> rotate<0,0.000000,0> translate<15.525788,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.599178,0.000000,2.960800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.599178,0.000000,2.859194>}
box{<0,0,-0.203200><0.101606,0.035000,0.203200> rotate<0,-90.000000,0> translate<15.599178,0.000000,2.859194> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.599194,0.000000,1.690797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.599194,0.000000,2.859178>}
box{<0,0,-0.203200><1.168381,0.035000,0.203200> rotate<0,90.000000,0> translate<15.599194,0.000000,2.859178> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.599194,0.000000,2.032000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.700800,0.000000,2.032000>}
box{<0,0,-0.203200><0.101606,0.035000,0.203200> rotate<0,0.000000,0> translate<15.599194,0.000000,2.032000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.599194,0.000000,2.438400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.700800,0.000000,2.438400>}
box{<0,0,-0.203200><0.101606,0.035000,0.203200> rotate<0,0.000000,0> translate<15.599194,0.000000,2.438400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.599194,0.000000,2.844800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.700800,0.000000,2.844800>}
box{<0,0,-0.203200><0.101606,0.035000,0.203200> rotate<0,0.000000,0> translate<15.599194,0.000000,2.844800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.599194,0.000000,2.859178>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.700800,0.000000,2.859178>}
box{<0,0,-0.203200><0.101606,0.035000,0.203200> rotate<0,0.000000,0> translate<15.599194,0.000000,2.859178> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.599194,0.000000,2.960819>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.599194,0.000000,4.129194>}
box{<0,0,-0.203200><1.168375,0.035000,0.203200> rotate<0,90.000000,0> translate<15.599194,0.000000,4.129194> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.599194,0.000000,2.960819>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.700800,0.000000,2.960819>}
box{<0,0,-0.203200><0.101606,0.035000,0.203200> rotate<0,0.000000,0> translate<15.599194,0.000000,2.960819> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.599194,0.000000,3.251200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.700800,0.000000,3.251200>}
box{<0,0,-0.203200><0.101606,0.035000,0.203200> rotate<0,0.000000,0> translate<15.599194,0.000000,3.251200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.599194,0.000000,3.657600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.700800,0.000000,3.657600>}
box{<0,0,-0.203200><0.101606,0.035000,0.203200> rotate<0,0.000000,0> translate<15.599194,0.000000,3.657600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.599194,0.000000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.700800,0.000000,4.064000>}
box{<0,0,-0.203200><0.101606,0.035000,0.203200> rotate<0,0.000000,0> translate<15.599194,0.000000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.651881,0.000000,27.126797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.276797,0.000000,26.501881>}
box{<0,0,-0.203200><0.883764,0.035000,0.203200> rotate<0,44.997030,0> translate<15.651881,0.000000,27.126797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.700800,0.000000,1.690800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.155006,0.000000,1.690800>}
box{<0,0,-0.203200><0.454206,0.035000,0.203200> rotate<0,0.000000,0> translate<15.700800,0.000000,1.690800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.700800,0.000000,2.859178>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.700800,0.000000,1.690800>}
box{<0,0,-0.203200><1.168378,0.035000,0.203200> rotate<0,-90.000000,0> translate<15.700800,0.000000,1.690800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.700800,0.000000,4.129197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.700800,0.000000,2.960819>}
box{<0,0,-0.203200><1.168378,0.035000,0.203200> rotate<0,-90.000000,0> translate<15.700800,0.000000,2.960819> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.700800,0.000000,4.129197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.155006,0.000000,4.129197>}
box{<0,0,-0.203200><0.454206,0.035000,0.203200> rotate<0,0.000000,0> translate<15.700800,0.000000,4.129197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.700819,0.000000,2.859194>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.700819,0.000000,2.960800>}
box{<0,0,-0.203200><0.101606,0.035000,0.203200> rotate<0,90.000000,0> translate<15.700819,0.000000,2.960800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.700819,0.000000,2.859194>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.869197,0.000000,2.859194>}
box{<0,0,-0.203200><1.168378,0.035000,0.203200> rotate<0,0.000000,0> translate<15.700819,0.000000,2.859194> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.700819,0.000000,2.960800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.869197,0.000000,2.960800>}
box{<0,0,-0.203200><1.168378,0.035000,0.203200> rotate<0,0.000000,0> translate<15.700819,0.000000,2.960800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.805409,0.000000,27.188800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.488800,0.000000,25.505409>}
box{<0,0,-0.203200><2.380674,0.035000,0.203200> rotate<0,44.997030,0> translate<15.805409,0.000000,27.188800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.851016,0.000000,15.523600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.858741,0.000000,15.520400>}
box{<0,0,-0.203200><0.008362,0.035000,0.203200> rotate<0,22.499783,0> translate<15.851016,0.000000,15.523600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.851016,0.000000,18.036397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.858741,0.000000,18.039597>}
box{<0,0,-0.203200><0.008362,0.035000,0.203200> rotate<0,-22.499783,0> translate<15.851016,0.000000,18.036397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.852925,0.000000,20.647137>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.955009,0.000000,20.893600>}
box{<0,0,-0.203200><0.266768,0.035000,0.203200> rotate<0,-67.496286,0> translate<15.852925,0.000000,20.647137> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.858741,0.000000,15.520400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.017494,0.000000,15.520400>}
box{<0,0,-0.203200><1.158753,0.035000,0.203200> rotate<0,0.000000,0> translate<15.858741,0.000000,15.520400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.858741,0.000000,18.039597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.791256,0.000000,18.039597>}
box{<0,0,-0.203200><2.932516,0.035000,0.203200> rotate<0,0.000000,0> translate<15.858741,0.000000,18.039597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.885753,0.000000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.667813,0.000000,20.726400>}
box{<0,0,-0.203200><0.782059,0.035000,0.203200> rotate<0,0.000000,0> translate<15.885753,0.000000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.955009,0.000000,20.893600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.068334,0.000000,20.893600>}
box{<0,0,-0.203200><0.113325,0.035000,0.203200> rotate<0,0.000000,0> translate<15.955009,0.000000,20.893600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.956278,0.000000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.171809,0.000000,26.822400>}
box{<0,0,-0.203200><0.215531,0.035000,0.203200> rotate<0,0.000000,0> translate<15.956278,0.000000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.068334,0.000000,20.893600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.284472,0.000000,21.109741>}
box{<0,0,-0.203200><0.305667,0.035000,0.203200> rotate<0,-44.997444,0> translate<16.068334,0.000000,20.893600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.116703,0.000000,25.458025>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.276797,0.000000,25.618116>}
box{<0,0,-0.203200><0.226405,0.035000,0.203200> rotate<0,-44.996471,0> translate<16.116703,0.000000,25.458025> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.116703,0.000000,25.458025>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.306397,0.000000,25.268334>}
box{<0,0,-0.203200><0.268265,0.035000,0.203200> rotate<0,44.996558,0> translate<16.116703,0.000000,25.458025> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.133966,0.000000,4.281600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.642762,0.000000,4.790400>}
box{<0,0,-0.203200><0.719550,0.035000,0.203200> rotate<0,-44.997206,0> translate<16.133966,0.000000,4.281600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.133966,0.000000,6.618397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.742763,0.000000,6.009597>}
box{<0,0,-0.203200><0.860971,0.035000,0.203200> rotate<0,44.997177,0> translate<16.133966,0.000000,6.618397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.133966,0.000000,6.821600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.692763,0.000000,7.380400>}
box{<0,0,-0.203200><0.790260,0.035000,0.203200> rotate<0,-44.997190,0> translate<16.133966,0.000000,6.821600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.133966,0.000000,9.158397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.692763,0.000000,8.599597>}
box{<0,0,-0.203200><0.790260,0.035000,0.203200> rotate<0,44.997190,0> translate<16.133966,0.000000,9.158397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.133966,0.000000,9.361600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.692763,0.000000,9.920400>}
box{<0,0,-0.203200><0.790260,0.035000,0.203200> rotate<0,-44.997190,0> translate<16.133966,0.000000,9.361600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.133966,0.000000,11.698397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.692763,0.000000,11.139597>}
box{<0,0,-0.203200><0.790260,0.035000,0.203200> rotate<0,44.997190,0> translate<16.133966,0.000000,11.698397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.155006,0.000000,1.690800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.869197,0.000000,2.404991>}
box{<0,0,-0.203200><1.010018,0.035000,0.203200> rotate<0,-44.997030,0> translate<16.155006,0.000000,1.690800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.155006,0.000000,4.129197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.869197,0.000000,3.415006>}
box{<0,0,-0.203200><1.010018,0.035000,0.203200> rotate<0,44.997030,0> translate<16.155006,0.000000,4.129197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.220203,0.000000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.880463,0.000000,4.064000>}
box{<0,0,-0.203200><3.660259,0.035000,0.203200> rotate<0,0.000000,0> translate<16.220203,0.000000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.221163,0.000000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.646697,0.000000,6.908800>}
box{<0,0,-0.203200><1.425534,0.035000,0.203200> rotate<0,0.000000,0> translate<16.221163,0.000000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.241466,0.000000,28.611197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.502859,0.000000,28.502925>}
box{<0,0,-0.203200><0.282930,0.035000,0.203200> rotate<0,22.498335,0> translate<16.241466,0.000000,28.611197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.249963,0.000000,6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.240297,0.000000,6.502400>}
box{<0,0,-0.203200><0.990334,0.035000,0.203200> rotate<0,0.000000,0> translate<16.249963,0.000000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.261878,0.000000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.391009,0.000000,25.603200>}
box{<0,0,-0.203200><1.129131,0.035000,0.203200> rotate<0,0.000000,0> translate<16.261878,0.000000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.276797,0.000000,25.618116>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.276797,0.000000,26.501881>}
box{<0,0,-0.203200><0.883766,0.035000,0.203200> rotate<0,90.000000,0> translate<16.276797,0.000000,26.501881> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.276797,0.000000,26.009600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.984609,0.000000,26.009600>}
box{<0,0,-0.203200><0.707812,0.035000,0.203200> rotate<0,0.000000,0> translate<16.276797,0.000000,26.009600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.276797,0.000000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.578209,0.000000,26.416000>}
box{<0,0,-0.203200><0.301412,0.035000,0.203200> rotate<0,0.000000,0> translate<16.276797,0.000000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.284472,0.000000,21.109741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.793600,0.000000,16.600613>}
box{<0,0,-0.203200><6.376870,0.035000,0.203200> rotate<0,44.997030,0> translate<16.284472,0.000000,21.109741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.306397,0.000000,23.099384>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.306397,0.000000,25.268334>}
box{<0,0,-0.203200><2.168950,0.035000,0.203200> rotate<0,90.000000,0> translate<16.306397,0.000000,25.268334> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.306397,0.000000,23.099384>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.299384,0.000000,17.106397>}
box{<0,0,-0.203200><8.475364,0.035000,0.203200> rotate<0,44.997030,0> translate<16.306397,0.000000,23.099384> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.306397,0.000000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.488800,0.000000,23.164800>}
box{<0,0,-0.203200><1.182403,0.035000,0.203200> rotate<0,0.000000,0> translate<16.306397,0.000000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.306397,0.000000,23.571200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.488800,0.000000,23.571200>}
box{<0,0,-0.203200><1.182403,0.035000,0.203200> rotate<0,0.000000,0> translate<16.306397,0.000000,23.571200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.306397,0.000000,23.977600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.488800,0.000000,23.977600>}
box{<0,0,-0.203200><1.182403,0.035000,0.203200> rotate<0,0.000000,0> translate<16.306397,0.000000,23.977600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.306397,0.000000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.488800,0.000000,24.384000>}
box{<0,0,-0.203200><1.182403,0.035000,0.203200> rotate<0,0.000000,0> translate<16.306397,0.000000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.306397,0.000000,24.790400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.488800,0.000000,24.790400>}
box{<0,0,-0.203200><1.182403,0.035000,0.203200> rotate<0,0.000000,0> translate<16.306397,0.000000,24.790400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.306397,0.000000,25.196800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.488800,0.000000,25.196800>}
box{<0,0,-0.203200><1.182403,0.035000,0.203200> rotate<0,0.000000,0> translate<16.306397,0.000000,25.196800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.322762,0.000000,4.470400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.880463,0.000000,4.470400>}
box{<0,0,-0.203200><3.557700,0.035000,0.203200> rotate<0,0.000000,0> translate<16.322762,0.000000,4.470400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.351562,0.000000,8.940800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.578697,0.000000,8.940800>}
box{<0,0,-0.203200><1.227134,0.035000,0.203200> rotate<0,0.000000,0> translate<16.351562,0.000000,8.940800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.453163,0.000000,11.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.517097,0.000000,11.379200>}
box{<0,0,-0.203200><1.063934,0.035000,0.203200> rotate<0,0.000000,0> translate<16.453163,0.000000,11.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.496206,0.000000,2.032000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.403009,0.000000,2.032000>}
box{<0,0,-0.203200><3.906803,0.035000,0.203200> rotate<0,0.000000,0> translate<16.496206,0.000000,2.032000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.502859,0.000000,28.502925>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.702925,0.000000,28.302859>}
box{<0,0,-0.203200><0.282936,0.035000,0.203200> rotate<0,44.997030,0> translate<16.502859,0.000000,28.502925> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.525963,0.000000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.391497,0.000000,9.753600>}
box{<0,0,-0.203200><1.865534,0.035000,0.203200> rotate<0,0.000000,0> translate<16.525963,0.000000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.557784,0.000000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.866634,0.000000,28.448000>}
box{<0,0,-0.203200><4.308850,0.035000,0.203200> rotate<0,0.000000,0> translate<16.557784,0.000000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.626603,0.000000,3.657600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.880463,0.000000,3.657600>}
box{<0,0,-0.203200><3.253859,0.035000,0.203200> rotate<0,0.000000,0> translate<16.626603,0.000000,3.657600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.627562,0.000000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.053097,0.000000,7.315200>}
box{<0,0,-0.203200><1.425534,0.035000,0.203200> rotate<0,0.000000,0> translate<16.627562,0.000000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.642762,0.000000,4.790400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.121256,0.000000,4.790400>}
box{<0,0,-0.203200><0.478494,0.035000,0.203200> rotate<0,0.000000,0> translate<16.642762,0.000000,4.790400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.647381,0.000000,22.758400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.530275,0.000000,22.758400>}
box{<0,0,-0.203200><0.882894,0.035000,0.203200> rotate<0,0.000000,0> translate<16.647381,0.000000,22.758400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.656363,0.000000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.833897,0.000000,6.096000>}
box{<0,0,-0.203200><0.177534,0.035000,0.203200> rotate<0,0.000000,0> translate<16.656363,0.000000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.692763,0.000000,7.380400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.611256,0.000000,7.380400>}
box{<0,0,-0.203200><0.918494,0.035000,0.203200> rotate<0,0.000000,0> translate<16.692763,0.000000,7.380400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.692763,0.000000,8.599597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.237494,0.000000,8.599597>}
box{<0,0,-0.203200><0.544731,0.035000,0.203200> rotate<0,0.000000,0> translate<16.692763,0.000000,8.599597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.692763,0.000000,9.920400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.651256,0.000000,9.920400>}
box{<0,0,-0.203200><0.958494,0.035000,0.203200> rotate<0,0.000000,0> translate<16.692763,0.000000,9.920400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.692763,0.000000,11.139597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.277494,0.000000,11.139597>}
box{<0,0,-0.203200><0.584731,0.035000,0.203200> rotate<0,0.000000,0> translate<16.692763,0.000000,11.139597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.702925,0.000000,28.302859>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.802925,0.000000,26.202859>}
box{<0,0,-0.203200><2.969848,0.035000,0.203200> rotate<0,44.997030,0> translate<16.702925,0.000000,28.302859> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.742763,0.000000,6.009597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.747494,0.000000,6.009597>}
box{<0,0,-0.203200><0.004731,0.035000,0.203200> rotate<0,0.000000,0> translate<16.742763,0.000000,6.009597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.747494,0.000000,6.009597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.690400,0.000000,8.952503>}
box{<0,0,-0.203200><4.161898,0.035000,0.203200> rotate<0,-44.997030,0> translate<16.747494,0.000000,6.009597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.869197,0.000000,2.404991>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.869197,0.000000,2.859194>}
box{<0,0,-0.203200><0.454203,0.035000,0.203200> rotate<0,90.000000,0> translate<16.869197,0.000000,2.859194> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.869197,0.000000,2.438400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.196816,0.000000,2.438400>}
box{<0,0,-0.203200><3.327619,0.035000,0.203200> rotate<0,0.000000,0> translate<16.869197,0.000000,2.438400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.869197,0.000000,2.844800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.071459,0.000000,2.844800>}
box{<0,0,-0.203200><3.202262,0.035000,0.203200> rotate<0,0.000000,0> translate<16.869197,0.000000,2.844800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.869197,0.000000,2.960800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.869197,0.000000,3.415006>}
box{<0,0,-0.203200><0.454206,0.035000,0.203200> rotate<0,90.000000,0> translate<16.869197,0.000000,3.415006> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.869197,0.000000,3.251200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.946103,0.000000,3.251200>}
box{<0,0,-0.203200><3.076906,0.035000,0.203200> rotate<0,0.000000,0> translate<16.869197,0.000000,3.251200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.964184,0.000000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.589553,0.000000,28.041600>}
box{<0,0,-0.203200><3.625369,0.035000,0.203200> rotate<0,0.000000,0> translate<16.964184,0.000000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.017494,0.000000,15.520400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.590400,0.000000,14.947494>}
box{<0,0,-0.203200><0.810212,0.035000,0.203200> rotate<0,44.997030,0> translate<17.017494,0.000000,15.520400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.053781,0.000000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.842209,0.000000,22.352000>}
box{<0,0,-0.203200><0.788428,0.035000,0.203200> rotate<0,0.000000,0> translate<17.053781,0.000000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.121256,0.000000,4.790400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.345309,0.000000,4.883206>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<17.121256,0.000000,4.790400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.237494,0.000000,8.599597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.690400,0.000000,10.052503>}
box{<0,0,-0.203200><2.054720,0.035000,0.203200> rotate<0,-44.997030,0> translate<17.237494,0.000000,8.599597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.277494,0.000000,11.139597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.590400,0.000000,11.452503>}
box{<0,0,-0.203200><0.442516,0.035000,0.203200> rotate<0,-44.997030,0> translate<17.277494,0.000000,11.139597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.329841,0.000000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.923897,0.000000,4.876800>}
box{<0,0,-0.203200><2.594056,0.035000,0.203200> rotate<0,0.000000,0> translate<17.329841,0.000000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.345309,0.000000,4.883206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.516791,0.000000,5.054688>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<17.345309,0.000000,4.883206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.370584,0.000000,27.635200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.312475,0.000000,27.635200>}
box{<0,0,-0.203200><2.941891,0.035000,0.203200> rotate<0,0.000000,0> translate<17.370584,0.000000,27.635200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.460181,0.000000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.248609,0.000000,21.945600>}
box{<0,0,-0.203200><0.788428,0.035000,0.203200> rotate<0,0.000000,0> translate<17.460181,0.000000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.488800,0.000000,22.858531>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.597072,0.000000,22.597138>}
box{<0,0,-0.203200><0.282930,0.035000,0.203200> rotate<0,67.495725,0> translate<17.488800,0.000000,22.858531> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.488800,0.000000,25.505409>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.488800,0.000000,22.858531>}
box{<0,0,-0.203200><2.646878,0.035000,0.203200> rotate<0,-90.000000,0> translate<17.488800,0.000000,22.858531> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.516791,0.000000,5.054688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.816791,0.000000,8.354688>}
box{<0,0,-0.203200><4.666905,0.035000,0.203200> rotate<0,-44.997030,0> translate<17.516791,0.000000,5.054688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.590400,0.000000,14.947494>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.590400,0.000000,11.452503>}
box{<0,0,-0.203200><3.494991,0.035000,0.203200> rotate<0,-90.000000,0> translate<17.590400,0.000000,11.452503> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.597072,0.000000,22.597138>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.797138,0.000000,22.397072>}
box{<0,0,-0.203200><0.282936,0.035000,0.203200> rotate<0,44.997030,0> translate<17.597072,0.000000,22.597138> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.611256,0.000000,7.380400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.835309,0.000000,7.473206>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<17.611256,0.000000,7.380400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.651256,0.000000,9.920400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.875309,0.000000,10.013206>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<17.651256,0.000000,9.920400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.745303,0.000000,5.283200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.049253,0.000000,5.283200>}
box{<0,0,-0.203200><2.303950,0.035000,0.203200> rotate<0,0.000000,0> translate<17.745303,0.000000,5.283200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.776984,0.000000,27.228800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.155856,0.000000,27.228800>}
box{<0,0,-0.203200><2.378872,0.035000,0.203200> rotate<0,0.000000,0> translate<17.776984,0.000000,27.228800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.797138,0.000000,22.397072>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.493600,0.000000,16.700613>}
box{<0,0,-0.203200><8.056012,0.035000,0.203200> rotate<0,44.997014,0> translate<17.797138,0.000000,22.397072> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.835309,0.000000,7.473206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.645309,0.000000,9.283206>}
box{<0,0,-0.203200><2.559727,0.035000,0.203200> rotate<0,-44.997030,0> translate<17.835309,0.000000,7.473206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.866581,0.000000,21.539200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.655009,0.000000,21.539200>}
box{<0,0,-0.203200><0.788428,0.035000,0.203200> rotate<0,0.000000,0> translate<17.866581,0.000000,21.539200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.875309,0.000000,10.013206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.545309,0.000000,10.683206>}
box{<0,0,-0.203200><0.947523,0.035000,0.203200> rotate<0,-44.997030,0> translate<17.875309,0.000000,10.013206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.022103,0.000000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.690400,0.000000,10.160000>}
box{<0,0,-0.203200><0.668297,0.035000,0.203200> rotate<0,0.000000,0> translate<18.022103,0.000000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.083703,0.000000,7.721600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.459497,0.000000,7.721600>}
box{<0,0,-0.203200><0.375794,0.035000,0.203200> rotate<0,0.000000,0> translate<18.083703,0.000000,7.721600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.151703,0.000000,5.689600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.174613,0.000000,5.689600>}
box{<0,0,-0.203200><2.022909,0.035000,0.203200> rotate<0,0.000000,0> translate<18.151703,0.000000,5.689600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.183384,0.000000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.030500,0.000000,26.822400>}
box{<0,0,-0.203200><1.847116,0.035000,0.203200> rotate<0,0.000000,0> translate<18.183384,0.000000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.272981,0.000000,21.132800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.061409,0.000000,21.132800>}
box{<0,0,-0.203200><0.788428,0.035000,0.203200> rotate<0,0.000000,0> translate<18.272981,0.000000,21.132800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.428503,0.000000,10.566400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.690400,0.000000,10.566400>}
box{<0,0,-0.203200><0.261897,0.035000,0.203200> rotate<0,0.000000,0> translate<18.428503,0.000000,10.566400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.490103,0.000000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.865897,0.000000,8.128000>}
box{<0,0,-0.203200><0.375794,0.035000,0.203200> rotate<0,0.000000,0> translate<18.490103,0.000000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.545309,0.000000,10.683206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.690400,0.000000,10.828300>}
box{<0,0,-0.203200><0.205191,0.035000,0.203200> rotate<0,-44.997647,0> translate<18.545309,0.000000,10.683206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.558103,0.000000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.353925,0.000000,6.096000>}
box{<0,0,-0.203200><1.795822,0.035000,0.203200> rotate<0,0.000000,0> translate<18.558103,0.000000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.589784,0.000000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.905144,0.000000,26.416000>}
box{<0,0,-0.203200><1.315359,0.035000,0.203200> rotate<0,0.000000,0> translate<18.589784,0.000000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.679381,0.000000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.467809,0.000000,20.726400>}
box{<0,0,-0.203200><0.788428,0.035000,0.203200> rotate<0,0.000000,0> translate<18.679381,0.000000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.690400,0.000000,10.828300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.690400,0.000000,10.052503>}
box{<0,0,-0.203200><0.775797,0.035000,0.203200> rotate<0,-90.000000,0> translate<18.690400,0.000000,10.052503> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.791256,0.000000,18.039597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.015309,0.000000,17.946791>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<18.791256,0.000000,18.039597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.802925,0.000000,26.202859>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.911197,0.000000,25.941466>}
box{<0,0,-0.203200><0.282930,0.035000,0.203200> rotate<0,67.495725,0> translate<18.802925,0.000000,26.202859> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.882975,0.000000,26.009600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.880463,0.000000,26.009600>}
box{<0,0,-0.203200><0.997487,0.035000,0.203200> rotate<0,0.000000,0> translate<18.882975,0.000000,26.009600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.896503,0.000000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.272297,0.000000,8.534400>}
box{<0,0,-0.203200><0.375794,0.035000,0.203200> rotate<0,0.000000,0> translate<18.896503,0.000000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.911197,0.000000,23.294588>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.911197,0.000000,25.941466>}
box{<0,0,-0.203200><2.646878,0.035000,0.203200> rotate<0,90.000000,0> translate<18.911197,0.000000,25.941466> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.911197,0.000000,23.294588>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.099384,0.000000,17.106397>}
box{<0,0,-0.203200><8.751421,0.035000,0.203200> rotate<0,44.997045,0> translate<18.911197,0.000000,23.294588> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.911197,0.000000,23.571200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.444466,0.000000,23.571200>}
box{<0,0,-0.203200><1.533269,0.035000,0.203200> rotate<0,0.000000,0> translate<18.911197,0.000000,23.571200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.911197,0.000000,23.977600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.215572,0.000000,23.977600>}
box{<0,0,-0.203200><1.304375,0.035000,0.203200> rotate<0,0.000000,0> translate<18.911197,0.000000,23.977600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.911197,0.000000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.090212,0.000000,24.384000>}
box{<0,0,-0.203200><1.179016,0.035000,0.203200> rotate<0,0.000000,0> translate<18.911197,0.000000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.911197,0.000000,24.790400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.964856,0.000000,24.790400>}
box{<0,0,-0.203200><1.053659,0.035000,0.203200> rotate<0,0.000000,0> translate<18.911197,0.000000,24.790400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.911197,0.000000,25.196800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.880463,0.000000,25.196800>}
box{<0,0,-0.203200><0.969266,0.035000,0.203200> rotate<0,0.000000,0> translate<18.911197,0.000000,25.196800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.911197,0.000000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.880463,0.000000,25.603200>}
box{<0,0,-0.203200><0.969266,0.035000,0.203200> rotate<0,0.000000,0> translate<18.911197,0.000000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.964503,0.000000,6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.631006,0.000000,6.502400>}
box{<0,0,-0.203200><1.666503,0.035000,0.203200> rotate<0,0.000000,0> translate<18.964503,0.000000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.015309,0.000000,17.946791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.793600,0.000000,16.168497>}
box{<0,0,-0.203200><2.514885,0.035000,0.203200> rotate<0,44.997081,0> translate<19.015309,0.000000,17.946791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.040984,0.000000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.721544,0.000000,23.164800>}
box{<0,0,-0.203200><1.680559,0.035000,0.203200> rotate<0,0.000000,0> translate<19.040984,0.000000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.080500,0.000000,17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.512612,0.000000,17.881600>}
box{<0,0,-0.203200><0.432112,0.035000,0.203200> rotate<0,0.000000,0> translate<19.080500,0.000000,17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.085781,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.874209,0.000000,20.320000>}
box{<0,0,-0.203200><0.788428,0.035000,0.203200> rotate<0,0.000000,0> translate<19.085781,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.302903,0.000000,8.940800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.678697,0.000000,8.940800>}
box{<0,0,-0.203200><0.375794,0.035000,0.203200> rotate<0,0.000000,0> translate<19.302903,0.000000,8.940800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.370903,0.000000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.908084,0.000000,6.908800>}
box{<0,0,-0.203200><1.537181,0.035000,0.203200> rotate<0,0.000000,0> translate<19.370903,0.000000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.447384,0.000000,22.758400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.021031,0.000000,22.758400>}
box{<0,0,-0.203200><1.573647,0.035000,0.203200> rotate<0,0.000000,0> translate<19.447384,0.000000,22.758400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.486900,0.000000,17.475200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.919013,0.000000,17.475200>}
box{<0,0,-0.203200><0.432112,0.035000,0.203200> rotate<0,0.000000,0> translate<19.486900,0.000000,17.475200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.492181,0.000000,19.913600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.280609,0.000000,19.913600>}
box{<0,0,-0.203200><0.788428,0.035000,0.203200> rotate<0,0.000000,0> translate<19.492181,0.000000,19.913600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.645309,0.000000,9.283206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.690400,0.000000,9.328300>}
box{<0,0,-0.203200><0.063770,0.035000,0.203200> rotate<0,-44.999015,0> translate<19.645309,0.000000,9.283206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.690400,0.000000,9.328300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.690400,0.000000,8.952503>}
box{<0,0,-0.203200><0.375797,0.035000,0.203200> rotate<0,-90.000000,0> translate<19.690400,0.000000,8.952503> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.777303,0.000000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.364122,0.000000,7.315200>}
box{<0,0,-0.203200><1.586819,0.035000,0.203200> rotate<0,0.000000,0> translate<19.777303,0.000000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.853784,0.000000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.530641,0.000000,22.352000>}
box{<0,0,-0.203200><1.676856,0.035000,0.203200> rotate<0,0.000000,0> translate<19.853784,0.000000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.880463,0.000000,3.464003>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.255384,0.000000,2.248531>}
box{<0,0,-0.203200><1.271982,0.035000,0.203200> rotate<0,72.852401,0> translate<19.880463,0.000000,3.464003> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.880463,0.000000,4.735994>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.880463,0.000000,3.464003>}
box{<0,0,-0.203200><1.271991,0.035000,0.203200> rotate<0,-90.000000,0> translate<19.880463,0.000000,3.464003> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.880463,0.000000,4.735994>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.255384,0.000000,5.951466>}
box{<0,0,-0.203200><1.271982,0.035000,0.203200> rotate<0,-72.852401,0> translate<19.880463,0.000000,4.735994> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.880463,0.000000,25.064003>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.255384,0.000000,23.848531>}
box{<0,0,-0.203200><1.271982,0.035000,0.203200> rotate<0,72.852401,0> translate<19.880463,0.000000,25.064003> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.880463,0.000000,26.335991>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.880463,0.000000,25.064003>}
box{<0,0,-0.203200><1.271987,0.035000,0.203200> rotate<0,-90.000000,0> translate<19.880463,0.000000,25.064003> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.880463,0.000000,26.335991>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.255384,0.000000,27.551466>}
box{<0,0,-0.203200><1.271985,0.035000,0.203200> rotate<0,-72.852443,0> translate<19.880463,0.000000,26.335991> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.893300,0.000000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.325413,0.000000,17.068800>}
box{<0,0,-0.203200><0.432113,0.035000,0.203200> rotate<0,0.000000,0> translate<19.893300,0.000000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.898581,0.000000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.687009,0.000000,19.507200>}
box{<0,0,-0.203200><0.788428,0.035000,0.203200> rotate<0,0.000000,0> translate<19.898581,0.000000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.183703,0.000000,7.721600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.873731,0.000000,7.721600>}
box{<0,0,-0.203200><1.690028,0.035000,0.203200> rotate<0,0.000000,0> translate<20.183703,0.000000,7.721600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.255384,0.000000,2.248528>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.957175,0.000000,1.219197>}
box{<0,0,-0.203200><1.245806,0.035000,0.203200> rotate<0,55.710439,0> translate<20.255384,0.000000,2.248528> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.255384,0.000000,2.248531>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.255384,0.000000,2.248528>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,-90.000000,0> translate<20.255384,0.000000,2.248528> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.255384,0.000000,5.951469>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.255384,0.000000,5.951466>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,-90.000000,0> translate<20.255384,0.000000,5.951466> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.255384,0.000000,5.951469>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.971919,0.000000,7.002428>}
box{<0,0,-0.203200><1.271982,0.035000,0.203200> rotate<0,-55.710519,0> translate<20.255384,0.000000,5.951469> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.255384,0.000000,23.848531>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.971919,0.000000,22.797569>}
box{<0,0,-0.203200><1.271984,0.035000,0.203200> rotate<0,55.710599,0> translate<20.255384,0.000000,23.848531> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.255384,0.000000,27.551466>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.971919,0.000000,28.602428>}
box{<0,0,-0.203200><1.271984,0.035000,0.203200> rotate<0,-55.710599,0> translate<20.255384,0.000000,27.551466> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.260184,0.000000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.116466,0.000000,21.945600>}
box{<0,0,-0.203200><1.856281,0.035000,0.203200> rotate<0,0.000000,0> translate<20.260184,0.000000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.299700,0.000000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.731813,0.000000,16.662400>}
box{<0,0,-0.203200><0.432112,0.035000,0.203200> rotate<0,0.000000,0> translate<20.299700,0.000000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.304981,0.000000,19.100800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.093409,0.000000,19.100800>}
box{<0,0,-0.203200><0.788428,0.035000,0.203200> rotate<0,0.000000,0> translate<20.304981,0.000000,19.100800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.590103,0.000000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.813594,0.000000,8.128000>}
box{<0,0,-0.203200><2.223491,0.035000,0.203200> rotate<0,0.000000,0> translate<20.590103,0.000000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.666584,0.000000,21.539200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.158297,0.000000,21.539200>}
box{<0,0,-0.203200><2.491713,0.035000,0.203200> rotate<0,0.000000,0> translate<20.666584,0.000000,21.539200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.706100,0.000000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.793600,0.000000,16.256000>}
box{<0,0,-0.203200><0.087500,0.035000,0.203200> rotate<0,0.000000,0> translate<20.706100,0.000000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.711381,0.000000,18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.499809,0.000000,18.694400>}
box{<0,0,-0.203200><0.788428,0.035000,0.203200> rotate<0,0.000000,0> translate<20.711381,0.000000,18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.793600,0.000000,16.600613>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.793600,0.000000,16.168497>}
box{<0,0,-0.203200><0.432116,0.035000,0.203200> rotate<0,-90.000000,0> translate<20.793600,0.000000,16.168497> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.816791,0.000000,8.354688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.909597,0.000000,8.578741>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<20.816791,0.000000,8.354688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.891228,0.000000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.980800,0.000000,8.534400>}
box{<0,0,-0.203200><6.089572,0.035000,0.203200> rotate<0,0.000000,0> translate<20.891228,0.000000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.909597,0.000000,8.578741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.909597,0.000000,11.491722>}
box{<0,0,-0.203200><2.912981,0.035000,0.203200> rotate<0,90.000000,0> translate<20.909597,0.000000,11.491722> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.909597,0.000000,8.940800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.980800,0.000000,8.940800>}
box{<0,0,-0.203200><6.071203,0.035000,0.203200> rotate<0,0.000000,0> translate<20.909597,0.000000,8.940800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.909597,0.000000,9.347200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.980800,0.000000,9.347200>}
box{<0,0,-0.203200><6.071203,0.035000,0.203200> rotate<0,0.000000,0> translate<20.909597,0.000000,9.347200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.909597,0.000000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.980800,0.000000,9.753600>}
box{<0,0,-0.203200><6.071203,0.035000,0.203200> rotate<0,0.000000,0> translate<20.909597,0.000000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.909597,0.000000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.980800,0.000000,10.160000>}
box{<0,0,-0.203200><6.071203,0.035000,0.203200> rotate<0,0.000000,0> translate<20.909597,0.000000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.909597,0.000000,10.566400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.980800,0.000000,10.566400>}
box{<0,0,-0.203200><6.071203,0.035000,0.203200> rotate<0,0.000000,0> translate<20.909597,0.000000,10.566400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.909597,0.000000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.428516,0.000000,10.972800>}
box{<0,0,-0.203200><0.518919,0.035000,0.203200> rotate<0,0.000000,0> translate<20.909597,0.000000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.909597,0.000000,11.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.022116,0.000000,11.379200>}
box{<0,0,-0.203200><0.112519,0.035000,0.203200> rotate<0,0.000000,0> translate<20.909597,0.000000,11.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.909597,0.000000,11.491722>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.468116,0.000000,10.933200>}
box{<0,0,-0.203200><0.789867,0.035000,0.203200> rotate<0,44.997190,0> translate<20.909597,0.000000,11.491722> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.971919,0.000000,7.002431>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.971919,0.000000,7.002428>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,-90.000000,0> translate<20.971919,0.000000,7.002428> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.971919,0.000000,7.002431>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.971922,0.000000,7.002431>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,0.000000,0> translate<20.971919,0.000000,7.002431> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.971919,0.000000,22.797566>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.971922,0.000000,22.797566>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,0.000000,0> translate<20.971919,0.000000,22.797566> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.971919,0.000000,22.797569>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.971919,0.000000,22.797566>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,-90.000000,0> translate<20.971919,0.000000,22.797566> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.971919,0.000000,28.602431>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.971919,0.000000,28.602428>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,-90.000000,0> translate<20.971919,0.000000,28.602428> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.971919,0.000000,28.602431>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.195591,0.000000,28.780800>}
box{<0,0,-0.203200><0.286085,0.035000,0.203200> rotate<0,-38.568317,0> translate<20.971919,0.000000,28.602431> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.971922,0.000000,7.002431>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.966397,0.000000,7.795500>}
box{<0,0,-0.203200><1.271982,0.035000,0.203200> rotate<0,-38.568932,0> translate<20.971922,0.000000,7.002431> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.971922,0.000000,22.797566>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.966397,0.000000,22.004497>}
box{<0,0,-0.203200><1.271982,0.035000,0.203200> rotate<0,38.568932,0> translate<20.971922,0.000000,22.797566> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.072984,0.000000,21.132800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.980800,0.000000,21.132800>}
box{<0,0,-0.203200><5.907816,0.035000,0.203200> rotate<0,0.000000,0> translate<21.072984,0.000000,21.132800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.117781,0.000000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.906209,0.000000,18.288000>}
box{<0,0,-0.203200><0.788428,0.035000,0.203200> rotate<0,0.000000,0> translate<21.117781,0.000000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.468116,0.000000,10.933200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.351881,0.000000,10.933200>}
box{<0,0,-0.203200><0.883766,0.035000,0.203200> rotate<0,0.000000,0> translate<21.468116,0.000000,10.933200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.479384,0.000000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.980800,0.000000,20.726400>}
box{<0,0,-0.203200><5.501416,0.035000,0.203200> rotate<0,0.000000,0> translate<21.479384,0.000000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.524181,0.000000,17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.312609,0.000000,17.881600>}
box{<0,0,-0.203200><0.788428,0.035000,0.203200> rotate<0,0.000000,0> translate<21.524181,0.000000,17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.885784,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.980800,0.000000,20.320000>}
box{<0,0,-0.203200><5.095016,0.035000,0.203200> rotate<0,0.000000,0> translate<21.885784,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.930581,0.000000,17.475200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.719009,0.000000,17.475200>}
box{<0,0,-0.203200><0.788428,0.035000,0.203200> rotate<0,0.000000,0> translate<21.930581,0.000000,17.475200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.966397,0.000000,7.795500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.966400,0.000000,7.795500>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,0.000000,0> translate<21.966397,0.000000,7.795500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.966397,0.000000,22.004497>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.966400,0.000000,22.004497>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,0.000000,0> translate<21.966397,0.000000,22.004497> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.966400,0.000000,7.795500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.150456,0.000000,8.260209>}
box{<0,0,-0.203200><1.271984,0.035000,0.203200> rotate<0,-21.427222,0> translate<21.966400,0.000000,7.795500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.966400,0.000000,22.004497>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.150456,0.000000,21.539788>}
box{<0,0,-0.203200><1.271984,0.035000,0.203200> rotate<0,21.427222,0> translate<21.966400,0.000000,22.004497> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.292184,0.000000,19.913600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.980800,0.000000,19.913600>}
box{<0,0,-0.203200><4.688616,0.035000,0.203200> rotate<0,0.000000,0> translate<22.292184,0.000000,19.913600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.299384,0.000000,17.106397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.668334,0.000000,17.106397>}
box{<0,0,-0.203200><0.368950,0.035000,0.203200> rotate<0,0.000000,0> translate<22.299384,0.000000,17.106397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.351881,0.000000,10.933200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.976797,0.000000,11.558116>}
box{<0,0,-0.203200><0.883764,0.035000,0.203200> rotate<0,-44.997030,0> translate<22.351881,0.000000,10.933200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.391481,0.000000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.968516,0.000000,10.972800>}
box{<0,0,-0.203200><1.577034,0.035000,0.203200> rotate<0,0.000000,0> translate<22.391481,0.000000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.668334,0.000000,17.106397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.906397,0.000000,16.868334>}
box{<0,0,-0.203200><0.336671,0.035000,0.203200> rotate<0,44.997030,0> translate<22.668334,0.000000,17.106397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.698584,0.000000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.980800,0.000000,19.507200>}
box{<0,0,-0.203200><4.282216,0.035000,0.203200> rotate<0,0.000000,0> translate<22.698584,0.000000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.705931,0.000000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.125409,0.000000,17.068800>}
box{<0,0,-0.203200><0.419478,0.035000,0.203200> rotate<0,0.000000,0> translate<22.705931,0.000000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.796703,0.000000,12.621972>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.906397,0.000000,12.731663>}
box{<0,0,-0.203200><0.155128,0.035000,0.203200> rotate<0,-44.996214,0> translate<22.796703,0.000000,12.621972> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.796703,0.000000,12.621972>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.976797,0.000000,12.441881>}
box{<0,0,-0.203200><0.254689,0.035000,0.203200> rotate<0,44.996533,0> translate<22.796703,0.000000,12.621972> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.797881,0.000000,11.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.562116,0.000000,11.379200>}
box{<0,0,-0.203200><0.764234,0.035000,0.203200> rotate<0,0.000000,0> translate<22.797881,0.000000,11.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.820278,0.000000,12.598400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.539722,0.000000,12.598400>}
box{<0,0,-0.203200><0.719444,0.035000,0.203200> rotate<0,0.000000,0> translate<22.820278,0.000000,12.598400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.906397,0.000000,12.731663>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.906397,0.000000,16.868334>}
box{<0,0,-0.203200><4.136672,0.035000,0.203200> rotate<0,90.000000,0> translate<22.906397,0.000000,16.868334> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.906397,0.000000,13.004800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.493600,0.000000,13.004800>}
box{<0,0,-0.203200><0.587203,0.035000,0.203200> rotate<0,0.000000,0> translate<22.906397,0.000000,13.004800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.906397,0.000000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.493600,0.000000,13.411200>}
box{<0,0,-0.203200><0.587203,0.035000,0.203200> rotate<0,0.000000,0> translate<22.906397,0.000000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.906397,0.000000,13.817600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.493600,0.000000,13.817600>}
box{<0,0,-0.203200><0.587203,0.035000,0.203200> rotate<0,0.000000,0> translate<22.906397,0.000000,13.817600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.906397,0.000000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.493600,0.000000,14.224000>}
box{<0,0,-0.203200><0.587203,0.035000,0.203200> rotate<0,0.000000,0> translate<22.906397,0.000000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.906397,0.000000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.493600,0.000000,14.630400>}
box{<0,0,-0.203200><0.587203,0.035000,0.203200> rotate<0,0.000000,0> translate<22.906397,0.000000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.906397,0.000000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.493600,0.000000,15.036800>}
box{<0,0,-0.203200><0.587203,0.035000,0.203200> rotate<0,0.000000,0> translate<22.906397,0.000000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.906397,0.000000,15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.493600,0.000000,15.443200>}
box{<0,0,-0.203200><0.587203,0.035000,0.203200> rotate<0,0.000000,0> translate<22.906397,0.000000,15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.906397,0.000000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.493600,0.000000,15.849600>}
box{<0,0,-0.203200><0.587203,0.035000,0.203200> rotate<0,0.000000,0> translate<22.906397,0.000000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.906397,0.000000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.493600,0.000000,16.256000>}
box{<0,0,-0.203200><0.587203,0.035000,0.203200> rotate<0,0.000000,0> translate<22.906397,0.000000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.906397,0.000000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.493600,0.000000,16.662400>}
box{<0,0,-0.203200><0.587203,0.035000,0.203200> rotate<0,0.000000,0> translate<22.906397,0.000000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.976797,0.000000,11.558116>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.976797,0.000000,12.441881>}
box{<0,0,-0.203200><0.883766,0.035000,0.203200> rotate<0,90.000000,0> translate<22.976797,0.000000,12.441881> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.976797,0.000000,11.785600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.383200,0.000000,11.785600>}
box{<0,0,-0.203200><0.406403,0.035000,0.203200> rotate<0,0.000000,0> translate<22.976797,0.000000,11.785600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.976797,0.000000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.383200,0.000000,12.192000>}
box{<0,0,-0.203200><0.406403,0.035000,0.203200> rotate<0,0.000000,0> translate<22.976797,0.000000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.104984,0.000000,19.100800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.980800,0.000000,19.100800>}
box{<0,0,-0.203200><3.875816,0.035000,0.203200> rotate<0,0.000000,0> translate<23.104984,0.000000,19.100800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.150456,0.000000,8.260209>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.150459,0.000000,8.260209>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,0.000000,0> translate<23.150456,0.000000,8.260209> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.150456,0.000000,21.539788>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.150459,0.000000,21.539788>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,0.000000,0> translate<23.150456,0.000000,21.539788> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.150459,0.000000,8.260209>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.418884,0.000000,8.355266>}
box{<0,0,-0.203200><1.271982,0.035000,0.203200> rotate<0,-4.285474,0> translate<23.150459,0.000000,8.260209> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.150459,0.000000,21.539788>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.418884,0.000000,21.444731>}
box{<0,0,-0.203200><1.271982,0.035000,0.203200> rotate<0,4.285474,0> translate<23.150459,0.000000,21.539788> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.383200,0.000000,11.558116>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.008116,0.000000,10.933200>}
box{<0,0,-0.203200><0.883764,0.035000,0.203200> rotate<0,44.997030,0> translate<23.383200,0.000000,11.558116> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.383200,0.000000,12.441881>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.383200,0.000000,11.558116>}
box{<0,0,-0.203200><0.883766,0.035000,0.203200> rotate<0,-90.000000,0> translate<23.383200,0.000000,11.558116> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.383200,0.000000,12.441881>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.583294,0.000000,12.641972>}
box{<0,0,-0.203200><0.282973,0.035000,0.203200> rotate<0,-44.996583,0> translate<23.383200,0.000000,12.441881> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.493600,0.000000,12.731663>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.583294,0.000000,12.641972>}
box{<0,0,-0.203200><0.126844,0.035000,0.203200> rotate<0,44.996032,0> translate<23.493600,0.000000,12.731663> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.493600,0.000000,16.700613>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.493600,0.000000,12.731663>}
box{<0,0,-0.203200><3.968950,0.035000,0.203200> rotate<0,-90.000000,0> translate<23.493600,0.000000,12.731663> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.511384,0.000000,18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.980800,0.000000,18.694400>}
box{<0,0,-0.203200><3.469416,0.035000,0.203200> rotate<0,0.000000,0> translate<23.511384,0.000000,18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.917784,0.000000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.980800,0.000000,18.288000>}
box{<0,0,-0.203200><3.063016,0.035000,0.203200> rotate<0,0.000000,0> translate<23.917784,0.000000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.008116,0.000000,10.933200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.891881,0.000000,10.933200>}
box{<0,0,-0.203200><0.883766,0.035000,0.203200> rotate<0,0.000000,0> translate<24.008116,0.000000,10.933200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.324184,0.000000,17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.980800,0.000000,17.881600>}
box{<0,0,-0.203200><2.656616,0.035000,0.203200> rotate<0,0.000000,0> translate<24.324184,0.000000,17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.418884,0.000000,8.355266>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.418888,0.000000,8.355266>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,0.000000,0> translate<24.418884,0.000000,8.355266> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.418884,0.000000,21.444731>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.418888,0.000000,21.444731>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,0.000000,0> translate<24.418884,0.000000,21.444731> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.418888,0.000000,8.355266>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.658981,0.000000,8.072222>}
box{<0,0,-0.203200><1.271985,0.035000,0.203200> rotate<0,12.856314,0> translate<24.418888,0.000000,8.355266> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.418888,0.000000,21.444731>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.658978,0.000000,21.727775>}
box{<0,0,-0.203200><1.271982,0.035000,0.203200> rotate<0,-12.856345,0> translate<24.418888,0.000000,21.444731> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.730584,0.000000,17.475200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.980800,0.000000,17.475200>}
box{<0,0,-0.203200><2.250216,0.035000,0.203200> rotate<0,0.000000,0> translate<24.730584,0.000000,17.475200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.832778,0.000000,21.539200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.980800,0.000000,21.539200>}
box{<0,0,-0.203200><2.148022,0.035000,0.203200> rotate<0,0.000000,0> translate<24.832778,0.000000,21.539200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.891881,0.000000,10.933200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.516797,0.000000,11.558116>}
box{<0,0,-0.203200><0.883764,0.035000,0.203200> rotate<0,-44.997030,0> translate<24.891881,0.000000,10.933200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.931481,0.000000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.980800,0.000000,10.972800>}
box{<0,0,-0.203200><2.049319,0.035000,0.203200> rotate<0,0.000000,0> translate<24.931481,0.000000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.099384,0.000000,17.106397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.368334,0.000000,17.106397>}
box{<0,0,-0.203200><0.268950,0.035000,0.203200> rotate<0,0.000000,0> translate<25.099384,0.000000,17.106397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.337881,0.000000,11.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.980800,0.000000,11.379200>}
box{<0,0,-0.203200><1.642919,0.035000,0.203200> rotate<0,0.000000,0> translate<25.337881,0.000000,11.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.368334,0.000000,17.106397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.606397,0.000000,16.868334>}
box{<0,0,-0.203200><0.336671,0.035000,0.203200> rotate<0,44.997030,0> translate<25.368334,0.000000,17.106397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.405931,0.000000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.980800,0.000000,17.068800>}
box{<0,0,-0.203200><1.574869,0.035000,0.203200> rotate<0,0.000000,0> translate<25.405931,0.000000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.414603,0.000000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.980800,0.000000,8.128000>}
box{<0,0,-0.203200><1.566197,0.035000,0.203200> rotate<0,0.000000,0> translate<25.414603,0.000000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.416703,0.000000,12.541972>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.516797,0.000000,12.441881>}
box{<0,0,-0.203200><0.141552,0.035000,0.203200> rotate<0,44.996136,0> translate<25.416703,0.000000,12.541972> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.416703,0.000000,12.541972>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.606397,0.000000,12.731663>}
box{<0,0,-0.203200><0.268265,0.035000,0.203200> rotate<0,-44.996558,0> translate<25.416703,0.000000,12.541972> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.473131,0.000000,12.598400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.980800,0.000000,12.598400>}
box{<0,0,-0.203200><1.507669,0.035000,0.203200> rotate<0,0.000000,0> translate<25.473131,0.000000,12.598400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.516797,0.000000,11.558116>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.516797,0.000000,12.441881>}
box{<0,0,-0.203200><0.883766,0.035000,0.203200> rotate<0,90.000000,0> translate<25.516797,0.000000,12.441881> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.516797,0.000000,11.785600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.980800,0.000000,11.785600>}
box{<0,0,-0.203200><1.464003,0.035000,0.203200> rotate<0,0.000000,0> translate<25.516797,0.000000,11.785600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.516797,0.000000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.980800,0.000000,12.192000>}
box{<0,0,-0.203200><1.464003,0.035000,0.203200> rotate<0,0.000000,0> translate<25.516797,0.000000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.606397,0.000000,12.731663>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.606397,0.000000,16.868334>}
box{<0,0,-0.203200><4.136672,0.035000,0.203200> rotate<0,90.000000,0> translate<25.606397,0.000000,16.868334> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.606397,0.000000,13.004800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.980800,0.000000,13.004800>}
box{<0,0,-0.203200><1.374403,0.035000,0.203200> rotate<0,0.000000,0> translate<25.606397,0.000000,13.004800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.606397,0.000000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.980800,0.000000,13.411200>}
box{<0,0,-0.203200><1.374403,0.035000,0.203200> rotate<0,0.000000,0> translate<25.606397,0.000000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.606397,0.000000,13.817600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.980800,0.000000,13.817600>}
box{<0,0,-0.203200><1.374403,0.035000,0.203200> rotate<0,0.000000,0> translate<25.606397,0.000000,13.817600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.606397,0.000000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.980800,0.000000,14.224000>}
box{<0,0,-0.203200><1.374403,0.035000,0.203200> rotate<0,0.000000,0> translate<25.606397,0.000000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.606397,0.000000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.980800,0.000000,14.630400>}
box{<0,0,-0.203200><1.374403,0.035000,0.203200> rotate<0,0.000000,0> translate<25.606397,0.000000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.606397,0.000000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.980800,0.000000,15.036800>}
box{<0,0,-0.203200><1.374403,0.035000,0.203200> rotate<0,0.000000,0> translate<25.606397,0.000000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.606397,0.000000,15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.980800,0.000000,15.443200>}
box{<0,0,-0.203200><1.374403,0.035000,0.203200> rotate<0,0.000000,0> translate<25.606397,0.000000,15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.606397,0.000000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.980800,0.000000,15.849600>}
box{<0,0,-0.203200><1.374403,0.035000,0.203200> rotate<0,0.000000,0> translate<25.606397,0.000000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.606397,0.000000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.980800,0.000000,16.256000>}
box{<0,0,-0.203200><1.374403,0.035000,0.203200> rotate<0,0.000000,0> translate<25.606397,0.000000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.606397,0.000000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.980800,0.000000,16.662400>}
box{<0,0,-0.203200><1.374403,0.035000,0.203200> rotate<0,0.000000,0> translate<25.606397,0.000000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.658978,0.000000,21.727775>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.658981,0.000000,21.727775>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,0.000000,0> translate<25.658978,0.000000,21.727775> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.658981,0.000000,8.072219>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.658981,0.000000,8.072222>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,90.000000,0> translate<25.658981,0.000000,8.072222> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.658981,0.000000,8.072219>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.760550,0.000000,7.436228>}
box{<0,0,-0.203200><1.271982,0.035000,0.203200> rotate<0,29.998005,0> translate<25.658981,0.000000,8.072219> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.658981,0.000000,21.727775>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.760550,0.000000,22.363769>}
box{<0,0,-0.203200><1.271983,0.035000,0.203200> rotate<0,-29.998127,0> translate<25.658981,0.000000,21.727775> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.036263,0.000000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.980800,0.000000,21.945600>}
box{<0,0,-0.203200><0.944537,0.035000,0.203200> rotate<0,0.000000,0> translate<26.036263,0.000000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.266272,0.000000,7.721600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.980800,0.000000,7.721600>}
box{<0,0,-0.203200><0.714528,0.035000,0.203200> rotate<0,0.000000,0> translate<26.266272,0.000000,7.721600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.740166,0.000000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.980800,0.000000,22.352000>}
box{<0,0,-0.203200><0.240634,0.035000,0.203200> rotate<0,0.000000,0> translate<26.740166,0.000000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.760550,0.000000,7.436228>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.980800,0.000000,7.198853>}
box{<0,0,-0.203200><0.323816,0.035000,0.203200> rotate<0,47.139981,0> translate<26.760550,0.000000,7.436228> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.760550,0.000000,22.363769>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.760553,0.000000,22.363769>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,0.000000,0> translate<26.760550,0.000000,22.363769> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.760553,0.000000,22.363769>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.980800,0.000000,22.601141>}
box{<0,0,-0.203200><0.323812,0.035000,0.203200> rotate<0,-47.140010,0> translate<26.760553,0.000000,22.363769> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.872847,0.000000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.980800,0.000000,7.315200>}
box{<0,0,-0.203200><0.107953,0.035000,0.203200> rotate<0,0.000000,0> translate<26.872847,0.000000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.980800,0.000000,22.601141>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.980800,0.000000,7.198853>}
box{<0,0,-0.203200><15.402287,0.035000,0.203200> rotate<0,-90.000000,0> translate<26.980800,0.000000,7.198853> }
texture{col_pol}
}
#end
union{
cylinder{<15.650000,0.038000,10.530000><15.650000,-1.538000,10.530000>0.508000}
cylinder{<13.110000,0.038000,10.530000><13.110000,-1.538000,10.530000>0.508000}
cylinder{<15.650000,0.038000,7.990000><15.650000,-1.538000,7.990000>0.508000}
cylinder{<13.110000,0.038000,7.990000><13.110000,-1.538000,7.990000>0.508000}
cylinder{<15.650000,0.038000,5.450000><15.650000,-1.538000,5.450000>0.508000}
cylinder{<13.110000,0.038000,5.450000><13.110000,-1.538000,5.450000>0.508000}
cylinder{<15.650000,0.038000,2.910000><15.650000,-1.538000,2.910000>0.508000}
cylinder{<13.110000,0.038000,2.910000><13.110000,-1.538000,2.910000>0.508000}
cylinder{<21.910000,0.038000,12.000000><21.910000,-1.538000,12.000000>0.406400}
cylinder{<24.450000,0.038000,12.000000><24.450000,-1.538000,12.000000>0.406400}
cylinder{<15.210000,0.038000,26.060000><15.210000,-1.538000,26.060000>0.406400}
cylinder{<12.670000,0.038000,26.060000><12.670000,-1.538000,26.060000>0.406400}
cylinder{<5.890000,0.038000,11.960000><5.890000,-1.538000,11.960000>0.406400}
cylinder{<3.350000,0.038000,11.960000><3.350000,-1.538000,11.960000>0.406400}
//Bohrungen(schnell)/Durchkontaktierungen
//Bohrungen(schnell)/Platine
texture{col_hls}
}
#if(pcb_silkscreen=on)
//Bestückungsdruck
union{
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.661900,-1.536000,10.030100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.661900,-1.536000,10.970703>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,90.000000,0> translate<11.661900,-1.536000,10.970703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.661900,-1.536000,10.970703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.348366,-1.536000,10.657169>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,-44.997030,0> translate<11.348366,-1.536000,10.657169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.348366,-1.536000,10.657169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.034831,-1.536000,10.970703>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,44.997030,0> translate<11.034831,-1.536000,10.970703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.034831,-1.536000,10.970703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.034831,-1.536000,10.030100>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,-90.000000,0> translate<11.034831,-1.536000,10.030100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.726381,-1.536000,10.030100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.726381,-1.536000,10.970703>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,90.000000,0> translate<10.726381,-1.536000,10.970703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.726381,-1.536000,10.970703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.099312,-1.536000,10.970703>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,0.000000,0> translate<10.099312,-1.536000,10.970703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.726381,-1.536000,10.500400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.412847,-1.536000,10.500400>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<10.412847,-1.536000,10.500400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.790863,-1.536000,10.030100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.790863,-1.536000,10.970703>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,90.000000,0> translate<9.790863,-1.536000,10.970703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.790863,-1.536000,10.970703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.320563,-1.536000,10.970703>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<9.320563,-1.536000,10.970703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.320563,-1.536000,10.970703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.163794,-1.536000,10.813934>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,-44.997030,0> translate<9.163794,-1.536000,10.813934> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.163794,-1.536000,10.813934>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.163794,-1.536000,10.500400>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,-90.000000,0> translate<9.163794,-1.536000,10.500400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.163794,-1.536000,10.500400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.320563,-1.536000,10.343634>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.996459,0> translate<9.163794,-1.536000,10.500400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.320563,-1.536000,10.343634>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.790863,-1.536000,10.343634>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<9.320563,-1.536000,10.343634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.241388,-1.536000,3.213934>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.398156,-1.536000,3.370703>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,-44.997030,0> translate<19.241388,-1.536000,3.213934> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.398156,-1.536000,3.370703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.711691,-1.536000,3.370703>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<19.398156,-1.536000,3.370703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.711691,-1.536000,3.370703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.868456,-1.536000,3.213934>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.997601,0> translate<19.711691,-1.536000,3.370703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.868456,-1.536000,3.213934>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.868456,-1.536000,2.586866>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,-90.000000,0> translate<19.868456,-1.536000,2.586866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.868456,-1.536000,2.586866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.711691,-1.536000,2.430100>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,-44.997030,0> translate<19.711691,-1.536000,2.430100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.711691,-1.536000,2.430100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.398156,-1.536000,2.430100>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<19.398156,-1.536000,2.430100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.398156,-1.536000,2.430100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.241388,-1.536000,2.586866>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.996459,0> translate<19.241388,-1.536000,2.586866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.241388,-1.536000,2.586866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.241388,-1.536000,2.900400>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,90.000000,0> translate<19.241388,-1.536000,2.900400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.241388,-1.536000,2.900400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.554922,-1.536000,2.900400>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<19.241388,-1.536000,2.900400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.932938,-1.536000,2.430100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.932938,-1.536000,3.370703>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,90.000000,0> translate<18.932938,-1.536000,3.370703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.932938,-1.536000,3.370703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.305869,-1.536000,2.430100>}
box{<0,0,-0.038100><1.130464,0.036000,0.038100> rotate<0,-56.306216,0> translate<18.305869,-1.536000,2.430100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.305869,-1.536000,2.430100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.305869,-1.536000,3.370703>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,90.000000,0> translate<18.305869,-1.536000,3.370703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.997419,-1.536000,3.370703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.997419,-1.536000,2.430100>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,-90.000000,0> translate<17.997419,-1.536000,2.430100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.997419,-1.536000,2.430100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.527119,-1.536000,2.430100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<17.527119,-1.536000,2.430100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.527119,-1.536000,2.430100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.370350,-1.536000,2.586866>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.996459,0> translate<17.370350,-1.536000,2.586866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.370350,-1.536000,2.586866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.370350,-1.536000,3.213934>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,90.000000,0> translate<17.370350,-1.536000,3.213934> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.370350,-1.536000,3.213934>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.527119,-1.536000,3.370703>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,-44.997030,0> translate<17.370350,-1.536000,3.213934> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.527119,-1.536000,3.370703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.997419,-1.536000,3.370703>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<17.527119,-1.536000,3.370703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.661900,-1.536000,5.970703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.661900,-1.536000,5.343634>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,-90.000000,0> translate<11.661900,-1.536000,5.343634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.661900,-1.536000,5.343634>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.348366,-1.536000,5.030100>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,-44.997030,0> translate<11.348366,-1.536000,5.030100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.348366,-1.536000,5.030100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.034831,-1.536000,5.343634>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,44.997030,0> translate<11.034831,-1.536000,5.343634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.034831,-1.536000,5.343634>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.034831,-1.536000,5.970703>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,90.000000,0> translate<11.034831,-1.536000,5.970703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.726381,-1.536000,5.970703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.726381,-1.536000,5.030100>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,-90.000000,0> translate<10.726381,-1.536000,5.030100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.726381,-1.536000,5.030100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.256081,-1.536000,5.030100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<10.256081,-1.536000,5.030100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.256081,-1.536000,5.030100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.099312,-1.536000,5.186866>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.996459,0> translate<10.099312,-1.536000,5.186866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.099312,-1.536000,5.186866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.099312,-1.536000,5.813934>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,90.000000,0> translate<10.099312,-1.536000,5.813934> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.099312,-1.536000,5.813934>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.256081,-1.536000,5.970703>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,-44.997030,0> translate<10.099312,-1.536000,5.813934> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.256081,-1.536000,5.970703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.726381,-1.536000,5.970703>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<10.256081,-1.536000,5.970703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.790863,-1.536000,5.970703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.790863,-1.536000,5.030100>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,-90.000000,0> translate<9.790863,-1.536000,5.030100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.790863,-1.536000,5.030100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.320563,-1.536000,5.030100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<9.320563,-1.536000,5.030100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.320563,-1.536000,5.030100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.163794,-1.536000,5.186866>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.996459,0> translate<9.163794,-1.536000,5.186866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.163794,-1.536000,5.186866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.163794,-1.536000,5.813934>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,90.000000,0> translate<9.163794,-1.536000,5.813934> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.163794,-1.536000,5.813934>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.320563,-1.536000,5.970703>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,-44.997030,0> translate<9.163794,-1.536000,5.813934> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.320563,-1.536000,5.970703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.790863,-1.536000,5.970703>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<9.320563,-1.536000,5.970703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.661900,-1.536000,3.470703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.661900,-1.536000,2.843634>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,-90.000000,0> translate<11.661900,-1.536000,2.843634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.661900,-1.536000,2.843634>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.348366,-1.536000,2.530100>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,-44.997030,0> translate<11.348366,-1.536000,2.530100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.348366,-1.536000,2.530100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.034831,-1.536000,2.843634>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,44.997030,0> translate<11.034831,-1.536000,2.843634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.034831,-1.536000,2.843634>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.034831,-1.536000,3.470703>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,90.000000,0> translate<11.034831,-1.536000,3.470703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.726381,-1.536000,3.470703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.726381,-1.536000,2.530100>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,-90.000000,0> translate<10.726381,-1.536000,2.530100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.726381,-1.536000,2.530100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.099312,-1.536000,2.530100>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,0.000000,0> translate<10.099312,-1.536000,2.530100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.163794,-1.536000,3.470703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.790863,-1.536000,3.470703>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,0.000000,0> translate<9.163794,-1.536000,3.470703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.790863,-1.536000,3.470703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.790863,-1.536000,2.530100>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,-90.000000,0> translate<9.790863,-1.536000,2.530100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.790863,-1.536000,2.530100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.163794,-1.536000,2.530100>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,0.000000,0> translate<9.163794,-1.536000,2.530100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.790863,-1.536000,3.000400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.477328,-1.536000,3.000400>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<9.477328,-1.536000,3.000400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.855344,-1.536000,3.470703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.855344,-1.536000,2.530100>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,-90.000000,0> translate<8.855344,-1.536000,2.530100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.855344,-1.536000,2.530100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.385044,-1.536000,2.530100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<8.385044,-1.536000,2.530100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.385044,-1.536000,2.530100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.228275,-1.536000,2.686866>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.996459,0> translate<8.228275,-1.536000,2.686866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.228275,-1.536000,2.686866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.228275,-1.536000,3.313934>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,90.000000,0> translate<8.228275,-1.536000,3.313934> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.228275,-1.536000,3.313934>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.385044,-1.536000,3.470703>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,-44.997030,0> translate<8.228275,-1.536000,3.313934> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.385044,-1.536000,3.470703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.855344,-1.536000,3.470703>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<8.385044,-1.536000,3.470703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.868456,-1.536000,10.970703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.868456,-1.536000,10.343634>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,-90.000000,0> translate<19.868456,-1.536000,10.343634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.868456,-1.536000,10.343634>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.554922,-1.536000,10.030100>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,-44.997030,0> translate<19.554922,-1.536000,10.030100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.554922,-1.536000,10.030100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.241388,-1.536000,10.343634>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,44.997030,0> translate<19.241388,-1.536000,10.343634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.241388,-1.536000,10.343634>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.241388,-1.536000,10.970703>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,90.000000,0> translate<19.241388,-1.536000,10.970703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.462637,-1.536000,10.970703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.776172,-1.536000,10.970703>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<18.462637,-1.536000,10.970703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.776172,-1.536000,10.970703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.932938,-1.536000,10.813934>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.997601,0> translate<18.776172,-1.536000,10.970703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.932938,-1.536000,10.813934>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.932938,-1.536000,10.186866>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,-90.000000,0> translate<18.932938,-1.536000,10.186866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.932938,-1.536000,10.186866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.776172,-1.536000,10.030100>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,-44.997030,0> translate<18.776172,-1.536000,10.030100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.776172,-1.536000,10.030100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.462637,-1.536000,10.030100>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<18.462637,-1.536000,10.030100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.462637,-1.536000,10.030100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.305869,-1.536000,10.186866>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.996459,0> translate<18.305869,-1.536000,10.186866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.305869,-1.536000,10.186866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.305869,-1.536000,10.813934>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,90.000000,0> translate<18.305869,-1.536000,10.813934> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.305869,-1.536000,10.813934>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.462637,-1.536000,10.970703>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,-44.997030,0> translate<18.305869,-1.536000,10.813934> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.997419,-1.536000,10.030100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.997419,-1.536000,10.970703>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,90.000000,0> translate<17.997419,-1.536000,10.970703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.997419,-1.536000,10.970703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.527119,-1.536000,10.970703>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<17.527119,-1.536000,10.970703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.527119,-1.536000,10.970703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.370350,-1.536000,10.813934>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,-44.997030,0> translate<17.370350,-1.536000,10.813934> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.370350,-1.536000,10.813934>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.370350,-1.536000,10.500400>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,-90.000000,0> translate<17.370350,-1.536000,10.500400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.370350,-1.536000,10.500400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.527119,-1.536000,10.343634>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.996459,0> translate<17.370350,-1.536000,10.500400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.527119,-1.536000,10.343634>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.997419,-1.536000,10.343634>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<17.527119,-1.536000,10.343634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.683884,-1.536000,10.343634>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.370350,-1.536000,10.030100>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,-44.997030,0> translate<17.370350,-1.536000,10.030100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.868456,-1.536000,8.470703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.868456,-1.536000,7.843634>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,-90.000000,0> translate<19.868456,-1.536000,7.843634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.868456,-1.536000,7.843634>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.554922,-1.536000,7.530100>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,-44.997030,0> translate<19.554922,-1.536000,7.530100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.554922,-1.536000,7.530100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.241388,-1.536000,7.843634>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,44.997030,0> translate<19.241388,-1.536000,7.843634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.241388,-1.536000,7.843634>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.241388,-1.536000,8.470703>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,90.000000,0> translate<19.241388,-1.536000,8.470703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.462637,-1.536000,8.470703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.776172,-1.536000,8.470703>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<18.462637,-1.536000,8.470703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.776172,-1.536000,8.470703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.932938,-1.536000,8.313934>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.997601,0> translate<18.776172,-1.536000,8.470703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.932938,-1.536000,8.313934>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.932938,-1.536000,7.686866>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,-90.000000,0> translate<18.932938,-1.536000,7.686866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.932938,-1.536000,7.686866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.776172,-1.536000,7.530100>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,-44.997030,0> translate<18.776172,-1.536000,7.530100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.776172,-1.536000,7.530100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.462637,-1.536000,7.530100>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<18.462637,-1.536000,7.530100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.462637,-1.536000,7.530100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.305869,-1.536000,7.686866>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.996459,0> translate<18.305869,-1.536000,7.686866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.305869,-1.536000,7.686866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.305869,-1.536000,8.313934>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,90.000000,0> translate<18.305869,-1.536000,8.313934> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.305869,-1.536000,8.313934>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.462637,-1.536000,8.470703>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,-44.997030,0> translate<18.305869,-1.536000,8.313934> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.370350,-1.536000,8.313934>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.527119,-1.536000,8.470703>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,-44.997030,0> translate<17.370350,-1.536000,8.313934> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.527119,-1.536000,8.470703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.840653,-1.536000,8.470703>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<17.527119,-1.536000,8.470703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.840653,-1.536000,8.470703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.997419,-1.536000,8.313934>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.997601,0> translate<17.840653,-1.536000,8.470703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.997419,-1.536000,8.313934>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.997419,-1.536000,7.686866>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,-90.000000,0> translate<17.997419,-1.536000,7.686866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.997419,-1.536000,7.686866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.840653,-1.536000,7.530100>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,-44.997030,0> translate<17.840653,-1.536000,7.530100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.840653,-1.536000,7.530100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.527119,-1.536000,7.530100>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<17.527119,-1.536000,7.530100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.527119,-1.536000,7.530100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.370350,-1.536000,7.686866>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.996459,0> translate<17.370350,-1.536000,7.686866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.370350,-1.536000,7.686866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.370350,-1.536000,8.000400>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,90.000000,0> translate<17.370350,-1.536000,8.000400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.370350,-1.536000,8.000400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.683884,-1.536000,8.000400>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<17.370350,-1.536000,8.000400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.868456,-1.536000,5.970703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.868456,-1.536000,5.343634>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,-90.000000,0> translate<19.868456,-1.536000,5.343634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.868456,-1.536000,5.343634>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.554922,-1.536000,5.030100>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,-44.997030,0> translate<19.554922,-1.536000,5.030100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.554922,-1.536000,5.030100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.241388,-1.536000,5.343634>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,44.997030,0> translate<19.241388,-1.536000,5.343634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.241388,-1.536000,5.343634>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.241388,-1.536000,5.970703>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,90.000000,0> translate<19.241388,-1.536000,5.970703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.462637,-1.536000,5.970703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.776172,-1.536000,5.970703>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<18.462637,-1.536000,5.970703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.776172,-1.536000,5.970703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.932938,-1.536000,5.813934>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.997601,0> translate<18.776172,-1.536000,5.970703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.932938,-1.536000,5.813934>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.932938,-1.536000,5.186866>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,-90.000000,0> translate<18.932938,-1.536000,5.186866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.932938,-1.536000,5.186866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.776172,-1.536000,5.030100>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,-44.997030,0> translate<18.776172,-1.536000,5.030100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.776172,-1.536000,5.030100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.462637,-1.536000,5.030100>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<18.462637,-1.536000,5.030100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.462637,-1.536000,5.030100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.305869,-1.536000,5.186866>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.996459,0> translate<18.305869,-1.536000,5.186866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.305869,-1.536000,5.186866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.305869,-1.536000,5.813934>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,90.000000,0> translate<18.305869,-1.536000,5.813934> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.305869,-1.536000,5.813934>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.462637,-1.536000,5.970703>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,-44.997030,0> translate<18.305869,-1.536000,5.813934> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.997419,-1.536000,5.030100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.997419,-1.536000,5.970703>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,90.000000,0> translate<17.997419,-1.536000,5.970703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.997419,-1.536000,5.970703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.527119,-1.536000,5.970703>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<17.527119,-1.536000,5.970703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.527119,-1.536000,5.970703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.370350,-1.536000,5.813934>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,-44.997030,0> translate<17.370350,-1.536000,5.813934> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.370350,-1.536000,5.813934>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.370350,-1.536000,5.657169>}
box{<0,0,-0.038100><0.156766,0.036000,0.038100> rotate<0,-90.000000,0> translate<17.370350,-1.536000,5.657169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.370350,-1.536000,5.657169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.527119,-1.536000,5.500400>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,44.997030,0> translate<17.370350,-1.536000,5.657169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.527119,-1.536000,5.500400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.370350,-1.536000,5.343634>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.996459,0> translate<17.370350,-1.536000,5.343634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.370350,-1.536000,5.343634>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.370350,-1.536000,5.186866>}
box{<0,0,-0.038100><0.156769,0.036000,0.038100> rotate<0,-90.000000,0> translate<17.370350,-1.536000,5.186866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.370350,-1.536000,5.186866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.527119,-1.536000,5.030100>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.996459,0> translate<17.370350,-1.536000,5.186866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.527119,-1.536000,5.030100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.997419,-1.536000,5.030100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<17.527119,-1.536000,5.030100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.997419,-1.536000,5.500400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.527119,-1.536000,5.500400>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<17.527119,-1.536000,5.500400> }
//C1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.560000,0.000000,18.181000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.560000,0.000000,17.419000>}
box{<0,0,-0.050800><0.762000,0.036000,0.050800> rotate<0,-90.000000,0> translate<9.560000,0.000000,17.419000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.240000,0.000000,18.156000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.240000,0.000000,17.419000>}
box{<0,0,-0.050800><0.737000,0.036000,0.050800> rotate<0,-90.000000,0> translate<8.240000,0.000000,17.419000> }
box{<-0.375050,0,-0.725050><0.375050,0.036000,0.725050> rotate<0,-270.000000,0> translate<8.901150,0.000000,18.517150>}
box{<-0.375050,0,-0.725050><0.375050,0.036000,0.725050> rotate<0,-270.000000,0> translate<8.901150,0.000000,17.069350>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.064066,0.000000,20.464131>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.907297,0.000000,20.307362>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,-44.997030,0> translate<7.907297,0.000000,20.307362> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.907297,0.000000,20.307362>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.907297,0.000000,19.993828>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,-90.000000,0> translate<7.907297,0.000000,19.993828> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.907297,0.000000,19.993828>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.064066,0.000000,19.837063>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.996459,0> translate<7.907297,0.000000,19.993828> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.064066,0.000000,19.837063>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.691134,0.000000,19.837063>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,0.000000,0> translate<8.064066,0.000000,19.837063> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.691134,0.000000,19.837063>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.847900,0.000000,19.993828>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,-44.997030,0> translate<8.691134,0.000000,19.837063> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.847900,0.000000,19.993828>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.847900,0.000000,20.307362>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,90.000000,0> translate<8.847900,0.000000,20.307362> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.847900,0.000000,20.307362>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.691134,0.000000,20.464131>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.997601,0> translate<8.691134,0.000000,20.464131> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.220831,0.000000,20.772581>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.907297,0.000000,21.086116>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,44.997030,0> translate<7.907297,0.000000,21.086116> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.907297,0.000000,21.086116>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.847900,0.000000,21.086116>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,0.000000,0> translate<7.907297,0.000000,21.086116> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.847900,0.000000,20.772581>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.847900,0.000000,21.399650>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,90.000000,0> translate<8.847900,0.000000,21.399650> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.310831,0.000000,17.866022>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.997297,0.000000,18.179556>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,44.997030,0> translate<9.997297,0.000000,18.179556> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.997297,0.000000,18.179556>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.937900,0.000000,18.179556>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,0.000000,0> translate<9.997297,0.000000,18.179556> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.937900,0.000000,17.866022>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.937900,0.000000,18.493091>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,90.000000,0> translate<10.937900,0.000000,18.493091> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.781134,0.000000,18.801541>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.154066,0.000000,18.801541>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,0.000000,0> translate<10.154066,0.000000,18.801541> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.154066,0.000000,18.801541>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.997297,0.000000,18.958306>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.996459,0> translate<9.997297,0.000000,18.958306> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.997297,0.000000,18.958306>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.997297,0.000000,19.271841>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,90.000000,0> translate<9.997297,0.000000,19.271841> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.997297,0.000000,19.271841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.154066,0.000000,19.428609>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,-44.997030,0> translate<9.997297,0.000000,19.271841> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.154066,0.000000,19.428609>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.781134,0.000000,19.428609>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,0.000000,0> translate<10.154066,0.000000,19.428609> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.781134,0.000000,19.428609>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.937900,0.000000,19.271841>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.997601,0> translate<10.781134,0.000000,19.428609> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.937900,0.000000,19.271841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.937900,0.000000,18.958306>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,-90.000000,0> translate<10.937900,0.000000,18.958306> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.937900,0.000000,18.958306>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.781134,0.000000,18.801541>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,-44.997030,0> translate<10.781134,0.000000,18.801541> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.781134,0.000000,18.801541>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.154066,0.000000,19.428609>}
box{<0,0,-0.038100><0.886809,0.036000,0.038100> rotate<0,44.997030,0> translate<10.154066,0.000000,19.428609> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.781134,0.000000,19.737059>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.154066,0.000000,19.737059>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,0.000000,0> translate<10.154066,0.000000,19.737059> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.154066,0.000000,19.737059>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.997297,0.000000,19.893825>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.996459,0> translate<9.997297,0.000000,19.893825> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.997297,0.000000,19.893825>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.997297,0.000000,20.207359>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,90.000000,0> translate<9.997297,0.000000,20.207359> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.997297,0.000000,20.207359>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.154066,0.000000,20.364128>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,-44.997030,0> translate<9.997297,0.000000,20.207359> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.154066,0.000000,20.364128>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.781134,0.000000,20.364128>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,0.000000,0> translate<10.154066,0.000000,20.364128> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.781134,0.000000,20.364128>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.937900,0.000000,20.207359>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.997601,0> translate<10.781134,0.000000,20.364128> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.937900,0.000000,20.207359>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.937900,0.000000,19.893825>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,-90.000000,0> translate<10.937900,0.000000,19.893825> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.937900,0.000000,19.893825>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.781134,0.000000,19.737059>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,-44.997030,0> translate<10.781134,0.000000,19.737059> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.781134,0.000000,19.737059>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.154066,0.000000,20.364128>}
box{<0,0,-0.038100><0.886809,0.036000,0.038100> rotate<0,44.997030,0> translate<10.154066,0.000000,20.364128> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.937900,0.000000,20.672578>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.310831,0.000000,20.672578>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,0.000000,0> translate<10.310831,0.000000,20.672578> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.310831,0.000000,20.672578>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.310831,0.000000,21.142878>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,90.000000,0> translate<10.310831,0.000000,21.142878> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.310831,0.000000,21.142878>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.467600,0.000000,21.299647>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,-44.997030,0> translate<10.310831,0.000000,21.142878> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.467600,0.000000,21.299647>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.937900,0.000000,21.299647>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<10.467600,0.000000,21.299647> }
//IC1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.980000,0.000000,17.780000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.980000,0.000000,17.780000>}
box{<0,0,-0.063500><2.000000,0.036000,0.063500> rotate<0,0.000000,0> translate<12.980000,0.000000,17.780000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.980000,0.000000,17.780000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.980000,0.000000,15.780000>}
box{<0,0,-0.063500><2.000000,0.036000,0.063500> rotate<0,-90.000000,0> translate<12.980000,0.000000,15.780000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.980000,0.000000,15.780000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.980000,0.000000,15.780000>}
box{<0,0,-0.063500><2.000000,0.036000,0.063500> rotate<0,0.000000,0> translate<12.980000,0.000000,15.780000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.980000,0.000000,15.780000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.980000,0.000000,17.780000>}
box{<0,0,-0.063500><2.000000,0.036000,0.063500> rotate<0,90.000000,0> translate<14.980000,0.000000,17.780000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.118100,0.000000,14.318100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.431634,0.000000,14.318100>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<13.118100,0.000000,14.318100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.274866,0.000000,14.318100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.274866,0.000000,15.258703>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,90.000000,0> translate<13.274866,0.000000,15.258703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.118100,0.000000,15.258703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.431634,0.000000,15.258703>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<13.118100,0.000000,15.258703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.368847,0.000000,15.101934>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.212078,0.000000,15.258703>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,44.997030,0> translate<14.212078,0.000000,15.258703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.212078,0.000000,15.258703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.898544,0.000000,15.258703>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<13.898544,0.000000,15.258703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.898544,0.000000,15.258703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.741778,0.000000,15.101934>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.997601,0> translate<13.741778,0.000000,15.101934> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.741778,0.000000,15.101934>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.741778,0.000000,14.474866>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,-90.000000,0> translate<13.741778,0.000000,14.474866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.741778,0.000000,14.474866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.898544,0.000000,14.318100>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,44.997030,0> translate<13.741778,0.000000,14.474866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.898544,0.000000,14.318100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.212078,0.000000,14.318100>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<13.898544,0.000000,14.318100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.212078,0.000000,14.318100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.368847,0.000000,14.474866>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.996459,0> translate<14.212078,0.000000,14.318100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.677297,0.000000,14.945169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.990831,0.000000,15.258703>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,-44.997030,0> translate<14.677297,0.000000,14.945169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.990831,0.000000,15.258703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.990831,0.000000,14.318100>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,-90.000000,0> translate<14.990831,0.000000,14.318100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.677297,0.000000,14.318100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.304366,0.000000,14.318100>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,0.000000,0> translate<14.677297,0.000000,14.318100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.731634,0.000000,18.218100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.731634,0.000000,19.158703>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,90.000000,0> translate<11.731634,0.000000,19.158703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.418100,0.000000,19.158703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.045169,0.000000,19.158703>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,0.000000,0> translate<11.418100,0.000000,19.158703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.980688,0.000000,19.001934>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.823919,0.000000,19.158703>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,44.997030,0> translate<12.823919,0.000000,19.158703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.823919,0.000000,19.158703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.510384,0.000000,19.158703>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<12.510384,0.000000,19.158703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.510384,0.000000,19.158703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.353619,0.000000,19.001934>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.997601,0> translate<12.353619,0.000000,19.001934> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.353619,0.000000,19.001934>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.353619,0.000000,18.374866>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,-90.000000,0> translate<12.353619,0.000000,18.374866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.353619,0.000000,18.374866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.510384,0.000000,18.218100>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,44.997030,0> translate<12.353619,0.000000,18.374866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.510384,0.000000,18.218100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.823919,0.000000,18.218100>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<12.510384,0.000000,18.218100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.823919,0.000000,18.218100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.980688,0.000000,18.374866>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.996459,0> translate<12.823919,0.000000,18.218100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.916206,0.000000,19.001934>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.759438,0.000000,19.158703>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,44.997030,0> translate<13.759438,0.000000,19.158703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.759438,0.000000,19.158703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.445903,0.000000,19.158703>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<13.445903,0.000000,19.158703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.445903,0.000000,19.158703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.289138,0.000000,19.001934>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.997601,0> translate<13.289138,0.000000,19.001934> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.289138,0.000000,19.001934>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.289138,0.000000,18.845169>}
box{<0,0,-0.038100><0.156766,0.036000,0.038100> rotate<0,-90.000000,0> translate<13.289138,0.000000,18.845169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.289138,0.000000,18.845169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.445903,0.000000,18.688400>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.997601,0> translate<13.289138,0.000000,18.845169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.445903,0.000000,18.688400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.759438,0.000000,18.688400>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<13.445903,0.000000,18.688400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.759438,0.000000,18.688400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.916206,0.000000,18.531634>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.996459,0> translate<13.759438,0.000000,18.688400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.916206,0.000000,18.531634>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.916206,0.000000,18.374866>}
box{<0,0,-0.038100><0.156769,0.036000,0.038100> rotate<0,-90.000000,0> translate<13.916206,0.000000,18.374866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.916206,0.000000,18.374866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.759438,0.000000,18.218100>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.996459,0> translate<13.759438,0.000000,18.218100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.759438,0.000000,18.218100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.445903,0.000000,18.218100>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<13.445903,0.000000,18.218100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.445903,0.000000,18.218100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.289138,0.000000,18.374866>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,44.997030,0> translate<13.289138,0.000000,18.374866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.224656,0.000000,19.001934>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.381422,0.000000,19.158703>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.997601,0> translate<14.224656,0.000000,19.001934> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.381422,0.000000,19.158703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.694956,0.000000,19.158703>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<14.381422,0.000000,19.158703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.694956,0.000000,19.158703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.851725,0.000000,19.001934>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,44.997030,0> translate<14.694956,0.000000,19.158703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.851725,0.000000,19.001934>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.851725,0.000000,18.845169>}
box{<0,0,-0.038100><0.156766,0.036000,0.038100> rotate<0,-90.000000,0> translate<14.851725,0.000000,18.845169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.851725,0.000000,18.845169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.694956,0.000000,18.688400>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,-44.997030,0> translate<14.694956,0.000000,18.688400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.694956,0.000000,18.688400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.538191,0.000000,18.688400>}
box{<0,0,-0.038100><0.156766,0.036000,0.038100> rotate<0,0.000000,0> translate<14.538191,0.000000,18.688400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.694956,0.000000,18.688400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.851725,0.000000,18.531634>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.996459,0> translate<14.694956,0.000000,18.688400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.851725,0.000000,18.531634>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.851725,0.000000,18.374866>}
box{<0,0,-0.038100><0.156769,0.036000,0.038100> rotate<0,-90.000000,0> translate<14.851725,0.000000,18.374866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.851725,0.000000,18.374866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.694956,0.000000,18.218100>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.996459,0> translate<14.694956,0.000000,18.218100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.694956,0.000000,18.218100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.381422,0.000000,18.218100>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<14.381422,0.000000,18.218100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.381422,0.000000,18.218100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.224656,0.000000,18.374866>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,44.997030,0> translate<14.224656,0.000000,18.374866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.160175,0.000000,18.845169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.473709,0.000000,19.158703>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,-44.997030,0> translate<15.160175,0.000000,18.845169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.473709,0.000000,19.158703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.473709,0.000000,18.218100>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,-90.000000,0> translate<15.473709,0.000000,18.218100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.160175,0.000000,18.218100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.787244,0.000000,18.218100>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,0.000000,0> translate<15.160175,0.000000,18.218100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.095694,0.000000,18.374866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.095694,0.000000,19.001934>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,90.000000,0> translate<16.095694,0.000000,19.001934> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.095694,0.000000,19.001934>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.252459,0.000000,19.158703>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.997601,0> translate<16.095694,0.000000,19.001934> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.252459,0.000000,19.158703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.565994,0.000000,19.158703>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<16.252459,0.000000,19.158703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.565994,0.000000,19.158703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.722763,0.000000,19.001934>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,44.997030,0> translate<16.565994,0.000000,19.158703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.722763,0.000000,19.001934>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.722763,0.000000,18.374866>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,-90.000000,0> translate<16.722763,0.000000,18.374866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.722763,0.000000,18.374866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.565994,0.000000,18.218100>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.996459,0> translate<16.565994,0.000000,18.218100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.565994,0.000000,18.218100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.252459,0.000000,18.218100>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<16.252459,0.000000,18.218100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.252459,0.000000,18.218100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.095694,0.000000,18.374866>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,44.997030,0> translate<16.095694,0.000000,18.374866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.095694,0.000000,18.374866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.722763,0.000000,19.001934>}
box{<0,0,-0.038100><0.886809,0.036000,0.038100> rotate<0,-44.997030,0> translate<16.095694,0.000000,18.374866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.031213,0.000000,19.001934>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.187978,0.000000,19.158703>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.997601,0> translate<17.031213,0.000000,19.001934> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.187978,0.000000,19.158703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.501513,0.000000,19.158703>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<17.187978,0.000000,19.158703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.501513,0.000000,19.158703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.658281,0.000000,19.001934>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,44.997030,0> translate<17.501513,0.000000,19.158703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.658281,0.000000,19.001934>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.658281,0.000000,18.845169>}
box{<0,0,-0.038100><0.156766,0.036000,0.038100> rotate<0,-90.000000,0> translate<17.658281,0.000000,18.845169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.658281,0.000000,18.845169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.501513,0.000000,18.688400>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,-44.997030,0> translate<17.501513,0.000000,18.688400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.501513,0.000000,18.688400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.344747,0.000000,18.688400>}
box{<0,0,-0.038100><0.156766,0.036000,0.038100> rotate<0,0.000000,0> translate<17.344747,0.000000,18.688400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.501513,0.000000,18.688400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.658281,0.000000,18.531634>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.996459,0> translate<17.501513,0.000000,18.688400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.658281,0.000000,18.531634>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.658281,0.000000,18.374866>}
box{<0,0,-0.038100><0.156769,0.036000,0.038100> rotate<0,-90.000000,0> translate<17.658281,0.000000,18.374866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.658281,0.000000,18.374866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.501513,0.000000,18.218100>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.996459,0> translate<17.501513,0.000000,18.218100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.501513,0.000000,18.218100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.187978,0.000000,18.218100>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<17.187978,0.000000,18.218100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.187978,0.000000,18.218100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.031213,0.000000,18.374866>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,44.997030,0> translate<17.031213,0.000000,18.374866> }
//JP1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.285000,-1.536000,11.800000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.920000,-1.536000,11.165000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<16.285000,-1.536000,11.800000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.920000,-1.536000,9.895000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.285000,-1.536000,9.260000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<16.285000,-1.536000,9.260000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.285000,-1.536000,9.260000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.920000,-1.536000,8.625000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<16.285000,-1.536000,9.260000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.920000,-1.536000,7.355000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.285000,-1.536000,6.720000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<16.285000,-1.536000,6.720000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.285000,-1.536000,6.720000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.920000,-1.536000,6.085000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<16.285000,-1.536000,6.720000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.920000,-1.536000,4.815000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.285000,-1.536000,4.180000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<16.285000,-1.536000,4.180000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.285000,-1.536000,11.800000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.475000,-1.536000,11.800000>}
box{<0,0,-0.076200><3.810000,0.036000,0.076200> rotate<0,0.000000,0> translate<12.475000,-1.536000,11.800000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.475000,-1.536000,11.800000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.840000,-1.536000,11.165000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<11.840000,-1.536000,11.165000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.840000,-1.536000,11.165000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.840000,-1.536000,9.895000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<11.840000,-1.536000,9.895000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.840000,-1.536000,9.895000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.475000,-1.536000,9.260000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<11.840000,-1.536000,9.895000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.475000,-1.536000,9.260000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.840000,-1.536000,8.625000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<11.840000,-1.536000,8.625000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.840000,-1.536000,8.625000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.840000,-1.536000,7.355000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<11.840000,-1.536000,7.355000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.840000,-1.536000,7.355000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.475000,-1.536000,6.720000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<11.840000,-1.536000,7.355000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.475000,-1.536000,6.720000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.840000,-1.536000,6.085000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<11.840000,-1.536000,6.085000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.840000,-1.536000,6.085000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.840000,-1.536000,4.815000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<11.840000,-1.536000,4.815000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.840000,-1.536000,4.815000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.475000,-1.536000,4.180000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<11.840000,-1.536000,4.815000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.475000,-1.536000,9.260000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.285000,-1.536000,9.260000>}
box{<0,0,-0.076200><3.810000,0.036000,0.076200> rotate<0,0.000000,0> translate<12.475000,-1.536000,9.260000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.475000,-1.536000,6.720000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.285000,-1.536000,6.720000>}
box{<0,0,-0.076200><3.810000,0.036000,0.076200> rotate<0,0.000000,0> translate<12.475000,-1.536000,6.720000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.475000,-1.536000,4.180000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.285000,-1.536000,4.180000>}
box{<0,0,-0.076200><3.810000,0.036000,0.076200> rotate<0,0.000000,0> translate<12.475000,-1.536000,4.180000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.920000,-1.536000,6.085000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.920000,-1.536000,4.815000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<16.920000,-1.536000,4.815000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.920000,-1.536000,8.625000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.920000,-1.536000,7.355000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<16.920000,-1.536000,7.355000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.920000,-1.536000,11.165000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.920000,-1.536000,9.895000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<16.920000,-1.536000,9.895000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.285000,-1.536000,4.180000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.920000,-1.536000,3.545000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<16.285000,-1.536000,4.180000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.920000,-1.536000,2.275000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.285000,-1.536000,1.640000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<16.285000,-1.536000,1.640000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.475000,-1.536000,4.180000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.840000,-1.536000,3.545000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<11.840000,-1.536000,3.545000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.840000,-1.536000,3.545000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.840000,-1.536000,2.275000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<11.840000,-1.536000,2.275000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.840000,-1.536000,2.275000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.475000,-1.536000,1.640000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<11.840000,-1.536000,2.275000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.475000,-1.536000,1.640000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.285000,-1.536000,1.640000>}
box{<0,0,-0.076200><3.810000,0.036000,0.076200> rotate<0,0.000000,0> translate<12.475000,-1.536000,1.640000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.920000,-1.536000,3.545000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.920000,-1.536000,2.275000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<16.920000,-1.536000,2.275000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<15.650000,-1.536000,10.530000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<13.110000,-1.536000,10.530000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<13.110000,-1.536000,7.990000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<15.650000,-1.536000,7.990000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<13.110000,-1.536000,5.450000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<15.650000,-1.536000,5.450000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<13.110000,-1.536000,2.910000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<15.650000,-1.536000,2.910000>}
//LED1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<24.754800,0.000000,10.730000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<24.754800,0.000000,13.270000>}
box{<0,0,-0.127000><2.540000,0.036000,0.127000> rotate<0,90.000000,0> translate<24.754800,0.000000,13.270000> }
object{ARC(1.524000,0.152400,140.196236,179.999846,0.036000) translate<23.180000,0.000000,11.999997>}
object{ARC(1.524000,0.152400,179.997604,221.630812,0.036000) translate<23.180000,0.000000,11.999937>}
object{ARC(1.524000,0.152400,0.000537,40.601702,0.036000) translate<23.180000,0.000000,11.999984>}
object{ARC(1.524000,0.152400,320.196236,359.999846,0.036000) translate<23.180000,0.000000,12.000003>}
object{ARC(1.524000,0.152400,35.537354,89.998691,0.036000) translate<23.179966,0.000000,12.000000>}
object{ARC(1.524000,0.152400,90.000000,143.130102,0.036000) translate<23.180000,0.000000,12.000000>}
object{ARC(1.524000,0.152400,270.000307,322.127183,0.036000) translate<23.179991,0.000000,12.000000>}
object{ARC(1.524000,0.152400,217.872817,269.999693,0.036000) translate<23.180009,0.000000,12.000000>}
object{ARC(0.635000,0.152400,90.000000,180.000000,0.036000) translate<23.180000,0.000000,12.000000>}
object{ARC(1.016000,0.152400,90.000000,180.000000,0.036000) translate<23.180000,0.000000,12.000000>}
object{ARC(0.635000,0.152400,270.000000,360.000000,0.036000) translate<23.180000,0.000000,12.000000>}
object{ARC(1.016000,0.152400,270.000000,360.000000,0.036000) translate<23.180000,0.000000,12.000000>}
object{ARC(2.032000,0.254000,39.807234,90.000342,0.036000) translate<23.180013,0.000000,12.000000>}
object{ARC(2.032000,0.254000,90.001692,151.928641,0.036000) translate<23.180059,0.000000,12.000000>}
object{ARC(2.032000,0.254000,269.998944,319.761966,0.036000) translate<23.180038,0.000000,12.000000>}
object{ARC(2.032000,0.254000,209.746365,270.001580,0.036000) translate<23.179944,0.000000,12.000000>}
object{ARC(2.032000,0.254000,151.698217,179.999918,0.036000) translate<23.180000,0.000000,11.999997>}
object{ARC(2.032000,0.254000,179.997652,211.605872,0.036000) translate<23.180000,0.000000,11.999916>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.735800,0.000000,12.938981>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.735800,0.000000,12.023800>}
box{<0,0,-0.050800><0.915181,0.036000,0.050800> rotate<0,-90.000000,0> translate<17.735800,0.000000,12.023800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.735800,0.000000,12.023800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<18.345919,0.000000,12.023800>}
box{<0,0,-0.050800><0.610119,0.036000,0.050800> rotate<0,0.000000,0> translate<17.735800,0.000000,12.023800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.281438,0.000000,12.938981>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<18.671319,0.000000,12.938981>}
box{<0,0,-0.050800><0.610119,0.036000,0.050800> rotate<0,0.000000,0> translate<18.671319,0.000000,12.938981> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<18.671319,0.000000,12.938981>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<18.671319,0.000000,12.023800>}
box{<0,0,-0.050800><0.915181,0.036000,0.050800> rotate<0,-90.000000,0> translate<18.671319,0.000000,12.023800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<18.671319,0.000000,12.023800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.281438,0.000000,12.023800>}
box{<0,0,-0.050800><0.610119,0.036000,0.050800> rotate<0,0.000000,0> translate<18.671319,0.000000,12.023800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<18.671319,0.000000,12.481391>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<18.976378,0.000000,12.481391>}
box{<0,0,-0.050800><0.305059,0.036000,0.050800> rotate<0,0.000000,0> translate<18.671319,0.000000,12.481391> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.606838,0.000000,12.938981>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.606838,0.000000,12.023800>}
box{<0,0,-0.050800><0.915181,0.036000,0.050800> rotate<0,-90.000000,0> translate<19.606838,0.000000,12.023800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.606838,0.000000,12.023800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.064428,0.000000,12.023800>}
box{<0,0,-0.050800><0.457591,0.036000,0.050800> rotate<0,0.000000,0> translate<19.606838,0.000000,12.023800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.064428,0.000000,12.023800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.216956,0.000000,12.176328>}
box{<0,0,-0.050800><0.215707,0.036000,0.050800> rotate<0,-44.997030,0> translate<20.064428,0.000000,12.023800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.216956,0.000000,12.176328>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.216956,0.000000,12.786450>}
box{<0,0,-0.050800><0.610122,0.036000,0.050800> rotate<0,90.000000,0> translate<20.216956,0.000000,12.786450> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.216956,0.000000,12.786450>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.064428,0.000000,12.938981>}
box{<0,0,-0.050800><0.215710,0.036000,0.050800> rotate<0,44.997617,0> translate<20.064428,0.000000,12.938981> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.064428,0.000000,12.938981>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.606838,0.000000,12.938981>}
box{<0,0,-0.050800><0.457591,0.036000,0.050800> rotate<0,0.000000,0> translate<19.606838,0.000000,12.938981> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.542356,0.000000,12.633919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.847416,0.000000,12.938981>}
box{<0,0,-0.050800><0.431421,0.036000,0.050800> rotate<0,-44.997324,0> translate<20.542356,0.000000,12.633919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.847416,0.000000,12.938981>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.847416,0.000000,12.023800>}
box{<0,0,-0.050800><0.915181,0.036000,0.050800> rotate<0,-90.000000,0> translate<20.847416,0.000000,12.023800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.542356,0.000000,12.023800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<21.152475,0.000000,12.023800>}
box{<0,0,-0.050800><0.610119,0.036000,0.050800> rotate<0,0.000000,0> translate<20.542356,0.000000,12.023800> }
//LED2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<12.365200,0.000000,27.330000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<12.365200,0.000000,24.790000>}
box{<0,0,-0.127000><2.540000,0.036000,0.127000> rotate<0,-90.000000,0> translate<12.365200,0.000000,24.790000> }
object{ARC(1.524000,0.152400,320.196236,359.999846,0.036000) translate<13.940000,0.000000,26.060003>}
object{ARC(1.524000,0.152400,359.997604,401.630812,0.036000) translate<13.940000,0.000000,26.060063>}
object{ARC(1.524000,0.152400,180.000537,220.601702,0.036000) translate<13.940000,0.000000,26.060016>}
object{ARC(1.524000,0.152400,140.196236,179.999846,0.036000) translate<13.940000,0.000000,26.059997>}
object{ARC(1.524000,0.152400,215.537354,269.998691,0.036000) translate<13.940034,0.000000,26.060000>}
object{ARC(1.524000,0.152400,270.000000,323.130102,0.036000) translate<13.940000,0.000000,26.060000>}
object{ARC(1.524000,0.152400,90.000307,142.127183,0.036000) translate<13.940009,0.000000,26.060000>}
object{ARC(1.524000,0.152400,37.872817,89.999693,0.036000) translate<13.939991,0.000000,26.060000>}
object{ARC(0.635000,0.152400,270.000000,360.000000,0.036000) translate<13.940000,0.000000,26.060000>}
object{ARC(1.016000,0.152400,270.000000,360.000000,0.036000) translate<13.940000,0.000000,26.060000>}
object{ARC(0.635000,0.152400,90.000000,180.000000,0.036000) translate<13.940000,0.000000,26.060000>}
object{ARC(1.016000,0.152400,90.000000,180.000000,0.036000) translate<13.940000,0.000000,26.060000>}
object{ARC(2.032000,0.254000,219.807234,270.000342,0.036000) translate<13.939988,0.000000,26.060000>}
object{ARC(2.032000,0.254000,270.001692,331.928641,0.036000) translate<13.939941,0.000000,26.060000>}
object{ARC(2.032000,0.254000,89.998944,139.761966,0.036000) translate<13.939963,0.000000,26.060000>}
object{ARC(2.032000,0.254000,29.746365,90.001580,0.036000) translate<13.940056,0.000000,26.060000>}
object{ARC(2.032000,0.254000,331.698217,359.999918,0.036000) translate<13.940000,0.000000,26.060003>}
object{ARC(2.032000,0.254000,359.997652,391.605872,0.036000) translate<13.940000,0.000000,26.060084>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.285800,0.000000,26.536981>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.285800,0.000000,25.621800>}
box{<0,0,-0.050800><0.915181,0.036000,0.050800> rotate<0,-90.000000,0> translate<8.285800,0.000000,25.621800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.285800,0.000000,25.621800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.895919,0.000000,25.621800>}
box{<0,0,-0.050800><0.610119,0.036000,0.050800> rotate<0,0.000000,0> translate<8.285800,0.000000,25.621800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.831437,0.000000,26.536981>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.221319,0.000000,26.536981>}
box{<0,0,-0.050800><0.610119,0.036000,0.050800> rotate<0,0.000000,0> translate<9.221319,0.000000,26.536981> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.221319,0.000000,26.536981>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.221319,0.000000,25.621800>}
box{<0,0,-0.050800><0.915181,0.036000,0.050800> rotate<0,-90.000000,0> translate<9.221319,0.000000,25.621800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.221319,0.000000,25.621800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.831437,0.000000,25.621800>}
box{<0,0,-0.050800><0.610119,0.036000,0.050800> rotate<0,0.000000,0> translate<9.221319,0.000000,25.621800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.221319,0.000000,26.079391>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.526378,0.000000,26.079391>}
box{<0,0,-0.050800><0.305059,0.036000,0.050800> rotate<0,0.000000,0> translate<9.221319,0.000000,26.079391> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.156837,0.000000,26.536981>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.156837,0.000000,25.621800>}
box{<0,0,-0.050800><0.915181,0.036000,0.050800> rotate<0,-90.000000,0> translate<10.156837,0.000000,25.621800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.156837,0.000000,25.621800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.614428,0.000000,25.621800>}
box{<0,0,-0.050800><0.457591,0.036000,0.050800> rotate<0,0.000000,0> translate<10.156837,0.000000,25.621800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.614428,0.000000,25.621800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.766956,0.000000,25.774328>}
box{<0,0,-0.050800><0.215707,0.036000,0.050800> rotate<0,-44.997030,0> translate<10.614428,0.000000,25.621800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.766956,0.000000,25.774328>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.766956,0.000000,26.384450>}
box{<0,0,-0.050800><0.610122,0.036000,0.050800> rotate<0,90.000000,0> translate<10.766956,0.000000,26.384450> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.766956,0.000000,26.384450>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.614428,0.000000,26.536981>}
box{<0,0,-0.050800><0.215710,0.036000,0.050800> rotate<0,44.997617,0> translate<10.614428,0.000000,26.536981> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.614428,0.000000,26.536981>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.156837,0.000000,26.536981>}
box{<0,0,-0.050800><0.457591,0.036000,0.050800> rotate<0,0.000000,0> translate<10.156837,0.000000,26.536981> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.702475,0.000000,25.621800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.092356,0.000000,25.621800>}
box{<0,0,-0.050800><0.610119,0.036000,0.050800> rotate<0,0.000000,0> translate<11.092356,0.000000,25.621800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.092356,0.000000,25.621800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.702475,0.000000,26.231919>}
box{<0,0,-0.050800><0.862838,0.036000,0.050800> rotate<0,-44.997030,0> translate<11.092356,0.000000,25.621800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.702475,0.000000,26.231919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.702475,0.000000,26.384450>}
box{<0,0,-0.050800><0.152531,0.036000,0.050800> rotate<0,90.000000,0> translate<11.702475,0.000000,26.384450> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.702475,0.000000,26.384450>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.549947,0.000000,26.536981>}
box{<0,0,-0.050800><0.215710,0.036000,0.050800> rotate<0,44.997617,0> translate<11.549947,0.000000,26.536981> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.549947,0.000000,26.536981>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.244884,0.000000,26.536981>}
box{<0,0,-0.050800><0.305063,0.036000,0.050800> rotate<0,0.000000,0> translate<11.244884,0.000000,26.536981> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.244884,0.000000,26.536981>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.092356,0.000000,26.384450>}
box{<0,0,-0.050800><0.215710,0.036000,0.050800> rotate<0,-44.997617,0> translate<11.092356,0.000000,26.384450> }
//LED3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<3.045200,0.000000,13.230000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<3.045200,0.000000,10.690000>}
box{<0,0,-0.127000><2.540000,0.036000,0.127000> rotate<0,-90.000000,0> translate<3.045200,0.000000,10.690000> }
object{ARC(1.524000,0.152400,320.196236,359.999846,0.036000) translate<4.620000,0.000000,11.960003>}
object{ARC(1.524000,0.152400,359.997604,401.630812,0.036000) translate<4.620000,0.000000,11.960063>}
object{ARC(1.524000,0.152400,180.000537,220.601702,0.036000) translate<4.620000,0.000000,11.960016>}
object{ARC(1.524000,0.152400,140.196236,179.999846,0.036000) translate<4.620000,0.000000,11.959997>}
object{ARC(1.524000,0.152400,215.537354,269.998691,0.036000) translate<4.620034,0.000000,11.960000>}
object{ARC(1.524000,0.152400,270.000000,323.130102,0.036000) translate<4.620000,0.000000,11.960000>}
object{ARC(1.524000,0.152400,90.000307,142.127183,0.036000) translate<4.620009,0.000000,11.960000>}
object{ARC(1.524000,0.152400,37.872817,89.999693,0.036000) translate<4.619991,0.000000,11.960000>}
object{ARC(0.635000,0.152400,270.000000,360.000000,0.036000) translate<4.620000,0.000000,11.960000>}
object{ARC(1.016000,0.152400,270.000000,360.000000,0.036000) translate<4.620000,0.000000,11.960000>}
object{ARC(0.635000,0.152400,90.000000,180.000000,0.036000) translate<4.620000,0.000000,11.960000>}
object{ARC(1.016000,0.152400,90.000000,180.000000,0.036000) translate<4.620000,0.000000,11.960000>}
object{ARC(2.032000,0.254000,219.807234,270.000342,0.036000) translate<4.619988,0.000000,11.960000>}
object{ARC(2.032000,0.254000,270.001692,331.928641,0.036000) translate<4.619941,0.000000,11.960000>}
object{ARC(2.032000,0.254000,89.998944,139.761966,0.036000) translate<4.619963,0.000000,11.960000>}
object{ARC(2.032000,0.254000,29.746365,90.001580,0.036000) translate<4.620056,0.000000,11.960000>}
object{ARC(2.032000,0.254000,331.698217,359.999918,0.036000) translate<4.620000,0.000000,11.960003>}
object{ARC(2.032000,0.254000,359.997652,391.605872,0.036000) translate<4.620000,0.000000,11.960084>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.065800,0.000000,12.336981>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.065800,0.000000,11.421800>}
box{<0,0,-0.050800><0.915181,0.036000,0.050800> rotate<0,-90.000000,0> translate<7.065800,0.000000,11.421800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.065800,0.000000,11.421800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.675919,0.000000,11.421800>}
box{<0,0,-0.050800><0.610119,0.036000,0.050800> rotate<0,0.000000,0> translate<7.065800,0.000000,11.421800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.611438,0.000000,12.336981>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.001319,0.000000,12.336981>}
box{<0,0,-0.050800><0.610119,0.036000,0.050800> rotate<0,0.000000,0> translate<8.001319,0.000000,12.336981> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.001319,0.000000,12.336981>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.001319,0.000000,11.421800>}
box{<0,0,-0.050800><0.915181,0.036000,0.050800> rotate<0,-90.000000,0> translate<8.001319,0.000000,11.421800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.001319,0.000000,11.421800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.611438,0.000000,11.421800>}
box{<0,0,-0.050800><0.610119,0.036000,0.050800> rotate<0,0.000000,0> translate<8.001319,0.000000,11.421800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.001319,0.000000,11.879391>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.306378,0.000000,11.879391>}
box{<0,0,-0.050800><0.305059,0.036000,0.050800> rotate<0,0.000000,0> translate<8.001319,0.000000,11.879391> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.936838,0.000000,12.336981>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.936838,0.000000,11.421800>}
box{<0,0,-0.050800><0.915181,0.036000,0.050800> rotate<0,-90.000000,0> translate<8.936838,0.000000,11.421800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.936838,0.000000,11.421800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.394428,0.000000,11.421800>}
box{<0,0,-0.050800><0.457591,0.036000,0.050800> rotate<0,0.000000,0> translate<8.936838,0.000000,11.421800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.394428,0.000000,11.421800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.546956,0.000000,11.574328>}
box{<0,0,-0.050800><0.215707,0.036000,0.050800> rotate<0,-44.997030,0> translate<9.394428,0.000000,11.421800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.546956,0.000000,11.574328>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.546956,0.000000,12.184450>}
box{<0,0,-0.050800><0.610122,0.036000,0.050800> rotate<0,90.000000,0> translate<9.546956,0.000000,12.184450> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.546956,0.000000,12.184450>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.394428,0.000000,12.336981>}
box{<0,0,-0.050800><0.215710,0.036000,0.050800> rotate<0,44.997617,0> translate<9.394428,0.000000,12.336981> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.394428,0.000000,12.336981>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.936838,0.000000,12.336981>}
box{<0,0,-0.050800><0.457591,0.036000,0.050800> rotate<0,0.000000,0> translate<8.936838,0.000000,12.336981> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.872356,0.000000,12.184450>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.024884,0.000000,12.336981>}
box{<0,0,-0.050800><0.215710,0.036000,0.050800> rotate<0,-44.997617,0> translate<9.872356,0.000000,12.184450> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.024884,0.000000,12.336981>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.329947,0.000000,12.336981>}
box{<0,0,-0.050800><0.305063,0.036000,0.050800> rotate<0,0.000000,0> translate<10.024884,0.000000,12.336981> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.329947,0.000000,12.336981>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.482475,0.000000,12.184450>}
box{<0,0,-0.050800><0.215710,0.036000,0.050800> rotate<0,44.997617,0> translate<10.329947,0.000000,12.336981> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.482475,0.000000,12.184450>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.482475,0.000000,12.031919>}
box{<0,0,-0.050800><0.152531,0.036000,0.050800> rotate<0,-90.000000,0> translate<10.482475,0.000000,12.031919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.482475,0.000000,12.031919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.329947,0.000000,11.879391>}
box{<0,0,-0.050800><0.215707,0.036000,0.050800> rotate<0,-44.997030,0> translate<10.329947,0.000000,11.879391> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.329947,0.000000,11.879391>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.177416,0.000000,11.879391>}
box{<0,0,-0.050800><0.152531,0.036000,0.050800> rotate<0,0.000000,0> translate<10.177416,0.000000,11.879391> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.329947,0.000000,11.879391>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.482475,0.000000,11.726859>}
box{<0,0,-0.050800><0.215710,0.036000,0.050800> rotate<0,44.997617,0> translate<10.329947,0.000000,11.879391> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.482475,0.000000,11.726859>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.482475,0.000000,11.574328>}
box{<0,0,-0.050800><0.152531,0.036000,0.050800> rotate<0,-90.000000,0> translate<10.482475,0.000000,11.574328> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.482475,0.000000,11.574328>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.329947,0.000000,11.421800>}
box{<0,0,-0.050800><0.215707,0.036000,0.050800> rotate<0,-44.997030,0> translate<10.329947,0.000000,11.421800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.329947,0.000000,11.421800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.024884,0.000000,11.421800>}
box{<0,0,-0.050800><0.305063,0.036000,0.050800> rotate<0,0.000000,0> translate<10.024884,0.000000,11.421800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.024884,0.000000,11.421800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.872356,0.000000,11.574328>}
box{<0,0,-0.050800><0.215707,0.036000,0.050800> rotate<0,44.997030,0> translate<9.872356,0.000000,11.574328> }
//LED4 silk screen
object{ARC(0.324900,0.203200,359.982365,450.017635,0.036000) translate<21.550100,0.000000,13.150100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<21.875000,0.000000,13.150000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.525000,0.000000,13.150000>}
box{<0,0,-0.101600><2.650000,0.036000,0.101600> rotate<0,0.000000,0> translate<21.875000,0.000000,13.150000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.850000,0.000000,13.475000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.850000,0.000000,16.125000>}
box{<0,0,-0.101600><2.650000,0.036000,0.101600> rotate<0,90.000000,0> translate<24.850000,0.000000,16.125000> }
object{ARC(0.324900,0.203200,179.982365,270.017635,0.036000) translate<24.849900,0.000000,16.449900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.525000,0.000000,16.450000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<21.875000,0.000000,16.450000>}
box{<0,0,-0.101600><2.650000,0.036000,0.101600> rotate<0,0.000000,0> translate<21.875000,0.000000,16.450000> }
object{ARC(0.324900,0.203200,269.982365,360.017635,0.036000) translate<21.550100,0.000000,16.449900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<21.550000,0.000000,16.125000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<21.550000,0.000000,13.475000>}
box{<0,0,-0.101600><2.650000,0.036000,0.101600> rotate<0,-90.000000,0> translate<21.550000,0.000000,13.475000> }
object{ARC(0.324900,0.203200,89.982365,180.017635,0.036000) translate<24.849900,0.000000,13.150100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.450000,0.000000,13.925000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.075000,0.000000,13.550000>}
box{<0,0,-0.101600><0.530330,0.036000,0.101600> rotate<0,-44.997030,0> translate<24.075000,0.000000,13.550000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.075000,0.000000,16.050000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.450000,0.000000,15.675000>}
box{<0,0,-0.101600><0.530330,0.036000,0.101600> rotate<0,44.997030,0> translate<24.075000,0.000000,16.050000> }
object{ARC(1.165000,0.203200,243.215005,296.784995,0.036000) translate<23.200000,0.000000,14.765000>}
object{ARC(1.165000,0.203200,63.215005,116.784995,0.036000) translate<23.200000,0.000000,14.835000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<23.725000,0.000000,13.150000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.675000,0.000000,13.150000>}
box{<0,0,-0.101600><1.050000,0.036000,0.101600> rotate<0,0.000000,0> translate<22.675000,0.000000,13.150000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.675000,0.000000,16.450000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<23.725000,0.000000,16.450000>}
box{<0,0,-0.101600><1.050000,0.036000,0.101600> rotate<0,0.000000,0> translate<22.675000,0.000000,16.450000> }
difference{
cylinder{<23.200000,0,14.800000><23.200000,0.036000,14.800000>1.301600 translate<0,0.000000,0>}
cylinder{<23.200000,-0.1,14.800000><23.200000,0.135000,14.800000>1.098400 translate<0,0.000000,0>}}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.743100,0.000000,15.330703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.743100,0.000000,14.390100>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,-90.000000,0> translate<17.743100,0.000000,14.390100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.743100,0.000000,14.390100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.370169,0.000000,14.390100>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,0.000000,0> translate<17.743100,0.000000,14.390100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.305688,0.000000,15.330703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.678619,0.000000,15.330703>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,0.000000,0> translate<18.678619,0.000000,15.330703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.678619,0.000000,15.330703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.678619,0.000000,14.390100>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,-90.000000,0> translate<18.678619,0.000000,14.390100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.678619,0.000000,14.390100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.305688,0.000000,14.390100>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,0.000000,0> translate<18.678619,0.000000,14.390100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.678619,0.000000,14.860400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.992153,0.000000,14.860400>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<18.678619,0.000000,14.860400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.614138,0.000000,15.330703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.614138,0.000000,14.390100>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,-90.000000,0> translate<19.614138,0.000000,14.390100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.614138,0.000000,14.390100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.084437,0.000000,14.390100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<19.614138,0.000000,14.390100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.084437,0.000000,14.390100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.241206,0.000000,14.546866>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.996459,0> translate<20.084437,0.000000,14.390100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.241206,0.000000,14.546866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.241206,0.000000,15.173934>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,90.000000,0> translate<20.241206,0.000000,15.173934> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.241206,0.000000,15.173934>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.084437,0.000000,15.330703>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,44.997030,0> translate<20.084437,0.000000,15.330703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.084437,0.000000,15.330703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.614138,0.000000,15.330703>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<19.614138,0.000000,15.330703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.019956,0.000000,14.390100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.019956,0.000000,15.330703>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,90.000000,0> translate<21.019956,0.000000,15.330703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.019956,0.000000,15.330703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.549656,0.000000,14.860400>}
box{<0,0,-0.038100><0.665107,0.036000,0.038100> rotate<0,-44.997221,0> translate<20.549656,0.000000,14.860400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.549656,0.000000,14.860400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.176725,0.000000,14.860400>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,0.000000,0> translate<20.549656,0.000000,14.860400> }
//LED5 silk screen
object{ARC(0.324900,0.203200,179.982365,270.017635,0.036000) translate<15.549900,0.000000,24.849900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.225000,0.000000,24.850000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<12.575000,0.000000,24.850000>}
box{<0,0,-0.101600><2.650000,0.036000,0.101600> rotate<0,0.000000,0> translate<12.575000,0.000000,24.850000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<12.250000,0.000000,24.525000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<12.250000,0.000000,21.875000>}
box{<0,0,-0.101600><2.650000,0.036000,0.101600> rotate<0,-90.000000,0> translate<12.250000,0.000000,21.875000> }
object{ARC(0.324900,0.203200,359.982365,450.017635,0.036000) translate<12.250100,0.000000,21.550100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<12.575000,0.000000,21.550000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.225000,0.000000,21.550000>}
box{<0,0,-0.101600><2.650000,0.036000,0.101600> rotate<0,0.000000,0> translate<12.575000,0.000000,21.550000> }
object{ARC(0.324900,0.203200,89.982365,180.017635,0.036000) translate<15.549900,0.000000,21.550100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.550000,0.000000,21.875000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.550000,0.000000,24.525000>}
box{<0,0,-0.101600><2.650000,0.036000,0.101600> rotate<0,90.000000,0> translate<15.550000,0.000000,24.525000> }
object{ARC(0.324900,0.203200,269.982365,360.017635,0.036000) translate<12.250100,0.000000,24.849900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<12.650000,0.000000,24.075000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<13.025000,0.000000,24.450000>}
box{<0,0,-0.101600><0.530330,0.036000,0.101600> rotate<0,-44.997030,0> translate<12.650000,0.000000,24.075000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<13.025000,0.000000,21.950000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<12.650000,0.000000,22.325000>}
box{<0,0,-0.101600><0.530330,0.036000,0.101600> rotate<0,44.997030,0> translate<12.650000,0.000000,22.325000> }
object{ARC(1.165000,0.203200,63.215005,116.784995,0.036000) translate<13.900000,0.000000,23.235000>}
object{ARC(1.165000,0.203200,243.215005,296.784995,0.036000) translate<13.900000,0.000000,23.165000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<13.375000,0.000000,24.850000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.425000,0.000000,24.850000>}
box{<0,0,-0.101600><1.050000,0.036000,0.101600> rotate<0,0.000000,0> translate<13.375000,0.000000,24.850000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.425000,0.000000,21.550000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<13.375000,0.000000,21.550000>}
box{<0,0,-0.101600><1.050000,0.036000,0.101600> rotate<0,0.000000,0> translate<13.375000,0.000000,21.550000> }
difference{
cylinder{<13.900000,0,23.200000><13.900000,0.036000,23.200000>1.301600 translate<0,0.000000,0>}
cylinder{<13.900000,-0.1,23.200000><13.900000,0.135000,23.200000>1.098400 translate<0,0.000000,0>}}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.333100,0.000000,23.610703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.333100,0.000000,22.670100>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,-90.000000,0> translate<8.333100,0.000000,22.670100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.333100,0.000000,22.670100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.960169,0.000000,22.670100>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,0.000000,0> translate<8.333100,0.000000,22.670100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.895688,0.000000,23.610703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.268619,0.000000,23.610703>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,0.000000,0> translate<9.268619,0.000000,23.610703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.268619,0.000000,23.610703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.268619,0.000000,22.670100>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,-90.000000,0> translate<9.268619,0.000000,22.670100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.268619,0.000000,22.670100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.895688,0.000000,22.670100>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,0.000000,0> translate<9.268619,0.000000,22.670100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.268619,0.000000,23.140400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.582153,0.000000,23.140400>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<9.268619,0.000000,23.140400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.204137,0.000000,23.610703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.204137,0.000000,22.670100>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,-90.000000,0> translate<10.204137,0.000000,22.670100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.204137,0.000000,22.670100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.674437,0.000000,22.670100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<10.204137,0.000000,22.670100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.674437,0.000000,22.670100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.831206,0.000000,22.826866>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.996459,0> translate<10.674437,0.000000,22.670100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.831206,0.000000,22.826866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.831206,0.000000,23.453934>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,90.000000,0> translate<10.831206,0.000000,23.453934> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.831206,0.000000,23.453934>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.674437,0.000000,23.610703>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,44.997030,0> translate<10.674437,0.000000,23.610703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.674437,0.000000,23.610703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.204137,0.000000,23.610703>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<10.204137,0.000000,23.610703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.766725,0.000000,23.610703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.139656,0.000000,23.610703>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,0.000000,0> translate<11.139656,0.000000,23.610703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.139656,0.000000,23.610703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.139656,0.000000,23.140400>}
box{<0,0,-0.038100><0.470303,0.036000,0.038100> rotate<0,-90.000000,0> translate<11.139656,0.000000,23.140400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.139656,0.000000,23.140400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.453191,0.000000,23.297169>}
box{<0,0,-0.038100><0.350543,0.036000,0.038100> rotate<0,-26.563526,0> translate<11.139656,0.000000,23.140400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.453191,0.000000,23.297169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.609956,0.000000,23.297169>}
box{<0,0,-0.038100><0.156766,0.036000,0.038100> rotate<0,0.000000,0> translate<11.453191,0.000000,23.297169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.609956,0.000000,23.297169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.766725,0.000000,23.140400>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,44.997030,0> translate<11.609956,0.000000,23.297169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.766725,0.000000,23.140400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.766725,0.000000,22.826866>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,-90.000000,0> translate<11.766725,0.000000,22.826866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.766725,0.000000,22.826866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.609956,0.000000,22.670100>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.996459,0> translate<11.609956,0.000000,22.670100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.609956,0.000000,22.670100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.296422,0.000000,22.670100>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<11.296422,0.000000,22.670100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.296422,0.000000,22.670100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.139656,0.000000,22.826866>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,44.997030,0> translate<11.139656,0.000000,22.826866> }
//LED6 silk screen
object{ARC(0.324900,0.203200,179.982365,270.017635,0.036000) translate<6.249900,0.000000,16.949900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.925000,0.000000,16.950000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.275000,0.000000,16.950000>}
box{<0,0,-0.101600><2.650000,0.036000,0.101600> rotate<0,0.000000,0> translate<3.275000,0.000000,16.950000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.950000,0.000000,16.625000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.950000,0.000000,13.975000>}
box{<0,0,-0.101600><2.650000,0.036000,0.101600> rotate<0,-90.000000,0> translate<2.950000,0.000000,13.975000> }
object{ARC(0.324900,0.203200,359.982365,450.017635,0.036000) translate<2.950100,0.000000,13.650100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.275000,0.000000,13.650000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.925000,0.000000,13.650000>}
box{<0,0,-0.101600><2.650000,0.036000,0.101600> rotate<0,0.000000,0> translate<3.275000,0.000000,13.650000> }
object{ARC(0.324900,0.203200,89.982365,180.017635,0.036000) translate<6.249900,0.000000,13.650100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<6.250000,0.000000,13.975000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<6.250000,0.000000,16.625000>}
box{<0,0,-0.101600><2.650000,0.036000,0.101600> rotate<0,90.000000,0> translate<6.250000,0.000000,16.625000> }
object{ARC(0.324900,0.203200,269.982365,360.017635,0.036000) translate<2.950100,0.000000,16.949900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.350000,0.000000,16.175000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.725000,0.000000,16.550000>}
box{<0,0,-0.101600><0.530330,0.036000,0.101600> rotate<0,-44.997030,0> translate<3.350000,0.000000,16.175000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.725000,0.000000,14.050000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.350000,0.000000,14.425000>}
box{<0,0,-0.101600><0.530330,0.036000,0.101600> rotate<0,44.997030,0> translate<3.350000,0.000000,14.425000> }
object{ARC(1.165000,0.203200,63.215005,116.784995,0.036000) translate<4.600000,0.000000,15.335000>}
object{ARC(1.165000,0.203200,243.215005,296.784995,0.036000) translate<4.600000,0.000000,15.265000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.075000,0.000000,16.950000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.125000,0.000000,16.950000>}
box{<0,0,-0.101600><1.050000,0.036000,0.101600> rotate<0,0.000000,0> translate<4.075000,0.000000,16.950000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.125000,0.000000,13.650000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.075000,0.000000,13.650000>}
box{<0,0,-0.101600><1.050000,0.036000,0.101600> rotate<0,0.000000,0> translate<4.075000,0.000000,13.650000> }
difference{
cylinder{<4.600000,0,15.300000><4.600000,0.036000,15.300000>1.301600 translate<0,0.000000,0>}
cylinder{<4.600000,-0.1,15.300000><4.600000,0.135000,15.300000>1.098400 translate<0,0.000000,0>}}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.033100,0.000000,15.110703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.033100,0.000000,14.170100>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,-90.000000,0> translate<7.033100,0.000000,14.170100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.033100,0.000000,14.170100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.660169,0.000000,14.170100>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,0.000000,0> translate<7.033100,0.000000,14.170100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.595688,0.000000,15.110703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.968619,0.000000,15.110703>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,0.000000,0> translate<7.968619,0.000000,15.110703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.968619,0.000000,15.110703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.968619,0.000000,14.170100>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,-90.000000,0> translate<7.968619,0.000000,14.170100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.968619,0.000000,14.170100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.595688,0.000000,14.170100>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,0.000000,0> translate<7.968619,0.000000,14.170100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.968619,0.000000,14.640400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.282153,0.000000,14.640400>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<7.968619,0.000000,14.640400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.904138,0.000000,15.110703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.904138,0.000000,14.170100>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,-90.000000,0> translate<8.904138,0.000000,14.170100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.904138,0.000000,14.170100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.374438,0.000000,14.170100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<8.904138,0.000000,14.170100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.374438,0.000000,14.170100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.531206,0.000000,14.326866>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.996459,0> translate<9.374438,0.000000,14.170100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.531206,0.000000,14.326866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.531206,0.000000,14.953934>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,90.000000,0> translate<9.531206,0.000000,14.953934> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.531206,0.000000,14.953934>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.374438,0.000000,15.110703>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,44.997030,0> translate<9.374438,0.000000,15.110703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.374438,0.000000,15.110703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.904138,0.000000,15.110703>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<8.904138,0.000000,15.110703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.466725,0.000000,15.110703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.153191,0.000000,14.953934>}
box{<0,0,-0.038100><0.350543,0.036000,0.038100> rotate<0,-26.563526,0> translate<10.153191,0.000000,14.953934> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.153191,0.000000,14.953934>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.839656,0.000000,14.640400>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,-44.997030,0> translate<9.839656,0.000000,14.640400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.839656,0.000000,14.640400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.839656,0.000000,14.326866>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,-90.000000,0> translate<9.839656,0.000000,14.326866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.839656,0.000000,14.326866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.996422,0.000000,14.170100>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,44.997030,0> translate<9.839656,0.000000,14.326866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.996422,0.000000,14.170100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.309956,0.000000,14.170100>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<9.996422,0.000000,14.170100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.309956,0.000000,14.170100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.466725,0.000000,14.326866>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.996459,0> translate<10.309956,0.000000,14.170100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.466725,0.000000,14.326866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.466725,0.000000,14.483634>}
box{<0,0,-0.038100><0.156769,0.036000,0.038100> rotate<0,90.000000,0> translate<10.466725,0.000000,14.483634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.466725,0.000000,14.483634>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.309956,0.000000,14.640400>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.996459,0> translate<10.309956,0.000000,14.640400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.309956,0.000000,14.640400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.839656,0.000000,14.640400>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<9.839656,0.000000,14.640400> }
//R1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.938800,0.000000,25.755000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.361200,0.000000,25.755000>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,0.000000,0> translate<3.938800,0.000000,25.755000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.938800,0.000000,27.025000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.361200,0.000000,27.025000>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,0.000000,0> translate<3.938800,0.000000,27.025000> }
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-180.000000,0> translate<5.513600,0.000000,26.390000>}
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-180.000000,0> translate<3.786400,0.000000,26.390000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<0.658100,0.000000,25.950100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<0.658100,0.000000,26.890703>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,90.000000,0> translate<0.658100,0.000000,26.890703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<0.658100,0.000000,26.890703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.128400,0.000000,26.890703>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<0.658100,0.000000,26.890703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.128400,0.000000,26.890703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.285169,0.000000,26.733934>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,44.997030,0> translate<1.128400,0.000000,26.890703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.285169,0.000000,26.733934>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.285169,0.000000,26.420400>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,-90.000000,0> translate<1.285169,0.000000,26.420400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.285169,0.000000,26.420400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.128400,0.000000,26.263634>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.996459,0> translate<1.128400,0.000000,26.263634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.128400,0.000000,26.263634>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<0.658100,0.000000,26.263634>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<0.658100,0.000000,26.263634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<0.971634,0.000000,26.263634>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.285169,0.000000,25.950100>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,44.997030,0> translate<0.971634,0.000000,26.263634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.593619,0.000000,26.577169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.907153,0.000000,26.890703>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,-44.997030,0> translate<1.593619,0.000000,26.577169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.907153,0.000000,26.890703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.907153,0.000000,25.950100>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,-90.000000,0> translate<1.907153,0.000000,25.950100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.593619,0.000000,25.950100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.220687,0.000000,25.950100>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,0.000000,0> translate<1.593619,0.000000,25.950100> }
//R2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.938800,0.000000,22.805000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.361200,0.000000,22.805000>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,0.000000,0> translate<3.938800,0.000000,22.805000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.938800,0.000000,24.075000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.361200,0.000000,24.075000>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,0.000000,0> translate<3.938800,0.000000,24.075000> }
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-180.000000,0> translate<5.513600,0.000000,23.440000>}
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-180.000000,0> translate<3.786400,0.000000,23.440000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<0.558100,0.000000,23.000100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<0.558100,0.000000,23.940703>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,90.000000,0> translate<0.558100,0.000000,23.940703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<0.558100,0.000000,23.940703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.028400,0.000000,23.940703>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<0.558100,0.000000,23.940703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.028400,0.000000,23.940703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.185169,0.000000,23.783934>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,44.997030,0> translate<1.028400,0.000000,23.940703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.185169,0.000000,23.783934>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.185169,0.000000,23.470400>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,-90.000000,0> translate<1.185169,0.000000,23.470400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.185169,0.000000,23.470400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.028400,0.000000,23.313634>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.996459,0> translate<1.028400,0.000000,23.313634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.028400,0.000000,23.313634>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<0.558100,0.000000,23.313634>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<0.558100,0.000000,23.313634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<0.871634,0.000000,23.313634>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.185169,0.000000,23.000100>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,44.997030,0> translate<0.871634,0.000000,23.313634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.120688,0.000000,23.000100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.493619,0.000000,23.000100>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,0.000000,0> translate<1.493619,0.000000,23.000100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.493619,0.000000,23.000100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.120688,0.000000,23.627169>}
box{<0,0,-0.038100><0.886809,0.036000,0.038100> rotate<0,-44.997030,0> translate<1.493619,0.000000,23.000100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.120688,0.000000,23.627169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.120688,0.000000,23.783934>}
box{<0,0,-0.038100><0.156766,0.036000,0.038100> rotate<0,90.000000,0> translate<2.120688,0.000000,23.783934> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.120688,0.000000,23.783934>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.963919,0.000000,23.940703>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,44.997030,0> translate<1.963919,0.000000,23.940703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.963919,0.000000,23.940703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.650384,0.000000,23.940703>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<1.650384,0.000000,23.940703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.650384,0.000000,23.940703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.493619,0.000000,23.783934>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.997601,0> translate<1.493619,0.000000,23.783934> }
//R3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.361200,0.000000,20.765000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.938800,0.000000,20.765000>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,0.000000,0> translate<3.938800,0.000000,20.765000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.361200,0.000000,19.495000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.938800,0.000000,19.495000>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,0.000000,0> translate<3.938800,0.000000,19.495000> }
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-0.000000,0> translate<3.786400,0.000000,20.130000>}
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-0.000000,0> translate<5.513600,0.000000,20.130000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<0.618100,0.000000,19.730100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<0.618100,0.000000,20.670703>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,90.000000,0> translate<0.618100,0.000000,20.670703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<0.618100,0.000000,20.670703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.088400,0.000000,20.670703>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<0.618100,0.000000,20.670703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.088400,0.000000,20.670703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.245169,0.000000,20.513934>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,44.997030,0> translate<1.088400,0.000000,20.670703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.245169,0.000000,20.513934>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.245169,0.000000,20.200400>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,-90.000000,0> translate<1.245169,0.000000,20.200400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.245169,0.000000,20.200400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.088400,0.000000,20.043634>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.996459,0> translate<1.088400,0.000000,20.043634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.088400,0.000000,20.043634>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<0.618100,0.000000,20.043634>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<0.618100,0.000000,20.043634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<0.931634,0.000000,20.043634>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.245169,0.000000,19.730100>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,44.997030,0> translate<0.931634,0.000000,20.043634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.553619,0.000000,20.513934>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.710384,0.000000,20.670703>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.997601,0> translate<1.553619,0.000000,20.513934> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.710384,0.000000,20.670703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.023919,0.000000,20.670703>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<1.710384,0.000000,20.670703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.023919,0.000000,20.670703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.180687,0.000000,20.513934>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,44.997030,0> translate<2.023919,0.000000,20.670703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.180687,0.000000,20.513934>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.180687,0.000000,20.357169>}
box{<0,0,-0.038100><0.156766,0.036000,0.038100> rotate<0,-90.000000,0> translate<2.180687,0.000000,20.357169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.180687,0.000000,20.357169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.023919,0.000000,20.200400>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,-44.997030,0> translate<2.023919,0.000000,20.200400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.023919,0.000000,20.200400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.867153,0.000000,20.200400>}
box{<0,0,-0.038100><0.156766,0.036000,0.038100> rotate<0,0.000000,0> translate<1.867153,0.000000,20.200400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.023919,0.000000,20.200400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.180687,0.000000,20.043634>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.996459,0> translate<2.023919,0.000000,20.200400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.180687,0.000000,20.043634>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.180687,0.000000,19.886866>}
box{<0,0,-0.038100><0.156769,0.036000,0.038100> rotate<0,-90.000000,0> translate<2.180687,0.000000,19.886866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.180687,0.000000,19.886866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.023919,0.000000,19.730100>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.996459,0> translate<2.023919,0.000000,19.730100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.023919,0.000000,19.730100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.710384,0.000000,19.730100>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<1.710384,0.000000,19.730100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.710384,0.000000,19.730100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.553619,0.000000,19.886866>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,44.997030,0> translate<1.553619,0.000000,19.886866> }

texture{col_slk}
}
#end
translate<mac_x_ver,mac_y_ver,mac_z_ver>
rotate<mac_x_rot,mac_y_rot,mac_z_rot>
}//End union
#end

#if(use_file_as_inc=off)
object{  TCS3103(-14.100000,0,-15.000000,pcb_rotate_x,pcb_rotate_y,pcb_rotate_z)
#if(pcb_upsidedown=on)
rotate pcb_rotdir*180
#end
}
#end


//Parts not found in 3dpack.dat or 3dusrpac.dat are:
