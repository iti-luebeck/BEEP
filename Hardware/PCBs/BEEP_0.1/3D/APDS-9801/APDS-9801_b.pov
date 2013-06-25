//POVRay-Datei erstellt mit 3d41.ulp v20110101
///home/flexxxv/eagle/BEEP_0.1/APDS-9801.brd
//27.04.13 20:56

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
#local cam_y = 139;
#local cam_z = -74;
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

#local lgt1_pos_x = 12;
#local lgt1_pos_y = 19;
#local lgt1_pos_z = 17;
#local lgt1_intense = 0.715646;
#local lgt2_pos_x = -12;
#local lgt2_pos_y = 19;
#local lgt2_pos_z = 17;
#local lgt2_intense = 0.715646;
#local lgt3_pos_x = 12;
#local lgt3_pos_y = 19;
#local lgt3_pos_z = -11;
#local lgt3_intense = 0.715646;
#local lgt4_pos_x = -12;
#local lgt4_pos_y = 19;
#local lgt4_pos_z = -11;
#local lgt4_intense = 0.715646;

//Do not change these values
#declare pcb_height = 1.500000;
#declare pcb_cuheight = 0.035000;
#declare pcb_x_size = 33.700000;
#declare pcb_y_size = 32.500000;
#declare pcb_layer1_used = 1;
#declare pcb_layer16_used = 0;
#declare inc_testmode = off;
#declare global_seed=seed(136);
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
	//translate<-16.850000,0,-16.250000>
}
#end

background{col_bgr}
light_source{<lgt1_pos_x,lgt1_pos_y,lgt1_pos_z> White*lgt1_intense shadowless}
light_source{<lgt2_pos_x,lgt2_pos_y,lgt2_pos_z> White*lgt2_intense shadowless}
light_source{<lgt3_pos_x,lgt3_pos_y,lgt3_pos_z> White*lgt3_intense shadowless}
light_source{<lgt4_pos_x,lgt4_pos_y,lgt4_pos_z> White*lgt4_intense}
#end


#macro APDS_9801(mac_x_ver,mac_y_ver,mac_z_ver,mac_x_rot,mac_y_rot,mac_z_rot)
union{
#if(pcb_board = on)
difference{
union{
//Platine
prism{-1.500000,0.000000,8
<0.000000,0.000000><33.700000,0.000000>
<33.700000,0.000000><33.700000,32.500000>
<33.700000,32.500000><0.000000,32.500000>
<0.000000,32.500000><0.000000,0.000000>
texture{col_brd}}
}//End union(PCB)
//Bohrungen(real)/Bauteile
cylinder{<4.100000,1,4.000000><4.100000,-5,4.000000>1.600000 texture{col_hls}}
cylinder{<29.600000,1,28.400000><29.600000,-5,28.400000>1.600000 texture{col_hls}}
cylinder{<4.200000,1,28.400000><4.200000,-5,28.400000>1.600000 texture{col_hls}}
cylinder{<29.600000,1,4.100000><29.600000,-5,4.100000>1.600000 texture{col_hls}}
//Bohrungen(real)/Platine
//Bohrungen(real)/Durchkontaktierungen
}//End difference(reale Bohrungen/Durchbrüche)
#end
#if(pcb_parts=on)//Bauteile
union{
//MPD-File
#ifndef(pack_C1) #declare global_pack_C1=yes; object {CAP_SMD_CHIP_0805()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<9.130000,0.000000,20.850000>translate<0,0.035000,0> }#end		//SMD Kondensator 0805 C1 6.8u C0805
#ifndef(pack_C2) #declare global_pack_C2=yes; object {CAP_SMD_CHIP_0805()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<5.320000,0.000000,20.850000>translate<0,0.035000,0> }#end		//SMD Kondensator 0805 C2 100n C0805
#ifndef(pack_C3) #declare global_pack_C3=yes; object {CAP_SMD_CHIP_0805()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<12.360000,0.000000,26.350000>translate<0,0.035000,0> }#end		//SMD Kondensator 0805 C3 6.8u C0805
#ifndef(pack_C4) #declare global_pack_C4=yes; object {CAP_SMD_CHIP_0805()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<12.360000,0.000000,29.360000>translate<0,0.035000,0> }#end		//SMD Kondensator 0805 C4 100n C0805
#ifndef(pack_C5) #declare global_pack_C5=yes; object {CAP_SMD_CHIP_0805()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<23.100000,0.000000,18.310000>translate<0,0.035000,0> }#end		//SMD Kondensator 0805 C5 10u C0805
#ifndef(pack_JP1) #declare global_pack_JP1=yes; object {CON_PH_2X4()translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,180> translate<16.750000,-1.500000,6.880000>}#end		//Stiftleiste 2,54mm Raster 4Pin 2Reihen (pinhead.lib) JP1  2X04
#ifndef(pack_R1) #declare global_pack_R1=yes; object {RES_SMD_CHIP_0805("102",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<25.640000,0.000000,18.310000>translate<0,0.035000,0> }#end		//SMD Widerstand 0805 R1 1k M0805
}//End union
#end
#if(pcb_pads_smds=on)
//Lötaugen&SMD/Bauteile
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<9.130000,0.000000,21.800000>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<9.130000,0.000000,19.900000>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<5.320000,0.000000,21.800000>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<5.320000,0.000000,19.900000>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<13.310000,0.000000,26.350000>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<11.410000,0.000000,26.350000>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<13.310000,0.000000,29.360000>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<11.410000,0.000000,29.360000>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<23.100000,0.000000,19.260000>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<23.100000,0.000000,17.360000>}
object{TOOLS_PCB_SMD(1.100000,2.000000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<14.950000,0.000000,20.085000>}
object{TOOLS_PCB_SMD(1.100000,2.000000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<18.550000,0.000000,20.085000>}
object{TOOLS_PCB_SMD(1.100000,2.000000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<14.950000,0.000000,23.145000>}
object{TOOLS_PCB_SMD(1.100000,2.000000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<18.550000,0.000000,21.615000>}
object{TOOLS_PCB_SMD(1.100000,2.000000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<14.950000,0.000000,18.555000>}
object{TOOLS_PCB_SMD(1.100000,2.000000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<18.550000,0.000000,18.555000>}
object{TOOLS_PCB_SMD(1.100000,2.000000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<14.950000,0.000000,21.615000>}
object{TOOLS_PCB_SMD(1.100000,2.000000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<18.550000,0.000000,23.145000>}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<18.020000,0,10.690000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<15.480000,0,10.690000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<18.020000,0,8.150000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<15.480000,0,8.150000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<18.020000,0,5.610000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<15.480000,0,5.610000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<18.020000,0,3.070000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<15.480000,0,3.070000> texture{col_thl}}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<25.640000,0.000000,17.360000>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<25.640000,0.000000,19.260000>}
//Lötaugen/Durchkontaktierungen
#end
#if(pcb_wires=on)
union{
//Signale
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.500000,0.000000,22.400000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.500000,0.000000,13.700000>}
box{<0,0,-0.304800><8.700000,0.035000,0.304800> rotate<0,-90.000000,0> translate<1.500000,0.000000,13.700000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.500000,0.000000,22.400000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.700000,0.000000,23.600000>}
box{<0,0,-0.304800><1.697056,0.035000,0.304800> rotate<0,-44.997030,0> translate<1.500000,0.000000,22.400000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.780000,0.000000,14.500000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.780000,0.000000,20.850000>}
box{<0,0,-0.304800><6.350000,0.035000,0.304800> rotate<0,90.000000,0> translate<2.780000,0.000000,20.850000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.780000,0.000000,20.850000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.050000,0.000000,22.120000>}
box{<0,0,-0.304800><1.796051,0.035000,0.304800> rotate<0,-44.997030,0> translate<2.780000,0.000000,20.850000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.050000,0.000000,22.120000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.000000,0.000000,22.120000>}
box{<0,0,-0.304800><0.950000,0.035000,0.304800> rotate<0,0.000000,0> translate<4.050000,0.000000,22.120000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.000000,0.000000,22.120000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.320000,0.000000,21.800000>}
box{<0,0,-0.304800><0.452548,0.035000,0.304800> rotate<0,44.997030,0> translate<5.000000,0.000000,22.120000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.700000,0.000000,23.600000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.660000,0.000000,23.600000>}
box{<0,0,-0.304800><5.960000,0.035000,0.304800> rotate<0,0.000000,0> translate<2.700000,0.000000,23.600000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.320000,0.000000,19.900000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.130000,0.000000,19.900000>}
box{<0,0,-0.304800><3.810000,0.035000,0.304800> rotate<0,0.000000,0> translate<5.320000,0.000000,19.900000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.320000,0.000000,21.800000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.130000,0.000000,21.800000>}
box{<0,0,-0.304800><3.810000,0.035000,0.304800> rotate<0,0.000000,0> translate<5.320000,0.000000,21.800000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.130000,0.000000,19.900000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.400000,0.000000,18.630000>}
box{<0,0,-0.304800><1.796051,0.035000,0.304800> rotate<0,44.997030,0> translate<9.130000,0.000000,19.900000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.400000,0.000000,11.960000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.400000,0.000000,18.630000>}
box{<0,0,-0.304800><6.670000,0.035000,0.304800> rotate<0,90.000000,0> translate<10.400000,0.000000,18.630000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.500000,0.000000,13.700000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.800000,0.000000,4.400000>}
box{<0,0,-0.304800><13.152186,0.035000,0.304800> rotate<0,44.997030,0> translate<1.500000,0.000000,13.700000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.660000,0.000000,23.600000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.410000,0.000000,26.350000>}
box{<0,0,-0.304800><3.889087,0.035000,0.304800> rotate<0,-44.997030,0> translate<8.660000,0.000000,23.600000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.410000,0.000000,29.360000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.410000,0.000000,26.350000>}
box{<0,0,-0.304800><3.010000,0.035000,0.304800> rotate<0,-90.000000,0> translate<11.410000,0.000000,26.350000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.780000,0.000000,14.500000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.670000,0.000000,5.610000>}
box{<0,0,-0.304800><12.572359,0.035000,0.304800> rotate<0,44.997030,0> translate<2.780000,0.000000,14.500000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.940000,0.000000,18.310000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.940000,0.000000,13.230000>}
box{<0,0,-0.304800><5.080000,0.035000,0.304800> rotate<0,-90.000000,0> translate<12.940000,0.000000,13.230000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.940000,0.000000,18.310000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.185000,0.000000,18.555000>}
box{<0,0,-0.304800><0.346482,0.035000,0.304800> rotate<0,-44.997030,0> translate<12.940000,0.000000,18.310000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.400000,0.000000,11.960000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.210000,0.000000,8.150000>}
box{<0,0,-0.304800><5.388154,0.035000,0.304800> rotate<0,44.997030,0> translate<10.400000,0.000000,11.960000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.310000,0.000000,26.350000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.660000,0.000000,27.700000>}
box{<0,0,-0.304800><1.909188,0.035000,0.304800> rotate<0,-44.997030,0> translate<13.310000,0.000000,26.350000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.310000,0.000000,29.360000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.660000,0.000000,28.010000>}
box{<0,0,-0.304800><1.909188,0.035000,0.304800> rotate<0,44.997030,0> translate<13.310000,0.000000,29.360000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.660000,0.000000,27.700000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.660000,0.000000,28.010000>}
box{<0,0,-0.304800><0.310000,0.035000,0.304800> rotate<0,90.000000,0> translate<14.660000,0.000000,28.010000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.130000,0.000000,19.900000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.765000,0.000000,19.900000>}
box{<0,0,-0.304800><5.635000,0.035000,0.304800> rotate<0,0.000000,0> translate<9.130000,0.000000,19.900000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.130000,0.000000,21.800000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.765000,0.000000,21.800000>}
box{<0,0,-0.304800><5.635000,0.035000,0.304800> rotate<0,0.000000,0> translate<9.130000,0.000000,21.800000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.185000,0.000000,18.555000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.950000,0.000000,18.555000>}
box{<0,0,-0.304800><1.765000,0.035000,0.304800> rotate<0,0.000000,0> translate<13.185000,0.000000,18.555000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.765000,0.000000,19.900000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.950000,0.000000,20.085000>}
box{<0,0,-0.304800><0.261630,0.035000,0.304800> rotate<0,-44.997030,0> translate<14.765000,0.000000,19.900000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.765000,0.000000,21.800000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.950000,0.000000,21.615000>}
box{<0,0,-0.304800><0.261630,0.035000,0.304800> rotate<0,44.997030,0> translate<14.765000,0.000000,21.800000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.670000,0.000000,5.610000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.480000,0.000000,5.610000>}
box{<0,0,-0.304800><3.810000,0.035000,0.304800> rotate<0,0.000000,0> translate<11.670000,0.000000,5.610000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.210000,0.000000,8.150000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.480000,0.000000,8.150000>}
box{<0,0,-0.304800><1.270000,0.035000,0.304800> rotate<0,0.000000,0> translate<14.210000,0.000000,8.150000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.940000,0.000000,13.230000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.480000,0.000000,10.690000>}
box{<0,0,-0.304800><3.592102,0.035000,0.304800> rotate<0,44.997030,0> translate<12.940000,0.000000,13.230000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.800000,0.000000,4.400000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.200000,0.000000,4.400000>}
box{<0,0,-0.203200><5.400000,0.035000,0.203200> rotate<0,0.000000,0> translate<10.800000,0.000000,4.400000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.200000,0.000000,4.400000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.700000,0.000000,4.900000>}
box{<0,0,-0.203200><0.707107,0.035000,0.203200> rotate<0,-44.997030,0> translate<16.200000,0.000000,4.400000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.480000,0.000000,8.150000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.700000,0.000000,6.930000>}
box{<0,0,-0.304800><1.725341,0.035000,0.304800> rotate<0,44.997030,0> translate<15.480000,0.000000,8.150000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.700000,0.000000,4.900000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.700000,0.000000,6.930000>}
box{<0,0,-0.203200><2.030000,0.035000,0.203200> rotate<0,90.000000,0> translate<16.700000,0.000000,6.930000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.480000,0.000000,8.150000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.750000,0.000000,9.420000>}
box{<0,0,-0.304800><1.796051,0.035000,0.304800> rotate<0,-44.997030,0> translate<15.480000,0.000000,8.150000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.660000,0.000000,27.700000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.000000,0.000000,27.700000>}
box{<0,0,-0.304800><2.340000,0.035000,0.304800> rotate<0,0.000000,0> translate<14.660000,0.000000,27.700000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.000000,0.000000,27.700000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.550000,0.000000,26.150000>}
box{<0,0,-0.304800><2.192031,0.035000,0.304800> rotate<0,44.997030,0> translate<17.000000,0.000000,27.700000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.550000,0.000000,23.145000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.550000,0.000000,26.150000>}
box{<0,0,-0.304800><3.005000,0.035000,0.304800> rotate<0,90.000000,0> translate<18.550000,0.000000,26.150000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.550000,0.000000,18.555000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.315000,0.000000,18.555000>}
box{<0,0,-0.304800><1.765000,0.035000,0.304800> rotate<0,0.000000,0> translate<18.550000,0.000000,18.555000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.750000,0.000000,9.420000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.560000,0.000000,9.420000>}
box{<0,0,-0.304800><3.810000,0.035000,0.304800> rotate<0,0.000000,0> translate<16.750000,0.000000,9.420000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.020000,0.000000,10.690000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.560000,0.000000,13.230000>}
box{<0,0,-0.304800><3.592102,0.035000,0.304800> rotate<0,-44.997030,0> translate<18.020000,0.000000,10.690000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.560000,0.000000,18.310000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.560000,0.000000,13.230000>}
box{<0,0,-0.304800><5.080000,0.035000,0.304800> rotate<0,-90.000000,0> translate<20.560000,0.000000,13.230000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.315000,0.000000,18.555000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.560000,0.000000,18.310000>}
box{<0,0,-0.304800><0.346482,0.035000,0.304800> rotate<0,44.997030,0> translate<20.315000,0.000000,18.555000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.020000,0.000000,3.070000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.240000,0.000000,3.070000>}
box{<0,0,-0.304800><3.220000,0.035000,0.304800> rotate<0,0.000000,0> translate<18.020000,0.000000,3.070000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.020000,0.000000,5.610000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.040000,0.000000,5.610000>}
box{<0,0,-0.304800><4.020000,0.035000,0.304800> rotate<0,0.000000,0> translate<18.020000,0.000000,5.610000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.550000,0.000000,20.085000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.275000,0.000000,20.085000>}
box{<0,0,-0.304800><3.725000,0.035000,0.304800> rotate<0,0.000000,0> translate<18.550000,0.000000,20.085000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.020000,0.000000,8.150000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.840000,0.000000,8.150000>}
box{<0,0,-0.304800><4.820000,0.035000,0.304800> rotate<0,0.000000,0> translate<18.020000,0.000000,8.150000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.560000,0.000000,9.420000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.100000,0.000000,11.960000>}
box{<0,0,-0.304800><3.592102,0.035000,0.304800> rotate<0,-44.997030,0> translate<20.560000,0.000000,9.420000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.100000,0.000000,17.360000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.100000,0.000000,11.960000>}
box{<0,0,-0.304800><5.400000,0.035000,0.304800> rotate<0,-90.000000,0> translate<23.100000,0.000000,11.960000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.275000,0.000000,20.085000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.100000,0.000000,19.260000>}
box{<0,0,-0.304800><1.166726,0.035000,0.304800> rotate<0,44.997030,0> translate<22.275000,0.000000,20.085000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.100000,0.000000,17.360000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.640000,0.000000,17.360000>}
box{<0,0,-0.304800><2.540000,0.035000,0.304800> rotate<0,0.000000,0> translate<23.100000,0.000000,17.360000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.100000,0.000000,19.260000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.640000,0.000000,19.260000>}
box{<0,0,-0.304800><2.540000,0.035000,0.304800> rotate<0,0.000000,0> translate<23.100000,0.000000,19.260000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.640000,0.000000,19.260000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.960000,0.000000,19.580000>}
box{<0,0,-0.304800><0.452548,0.035000,0.304800> rotate<0,-44.997030,0> translate<25.640000,0.000000,19.260000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.960000,0.000000,19.580000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.910000,0.000000,19.580000>}
box{<0,0,-0.304800><0.950000,0.035000,0.304800> rotate<0,0.000000,0> translate<25.960000,0.000000,19.580000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.550000,0.000000,21.615000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.415000,0.000000,21.615000>}
box{<0,0,-0.304800><8.865000,0.035000,0.304800> rotate<0,0.000000,0> translate<18.550000,0.000000,21.615000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.840000,0.000000,8.150000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.180000,0.000000,13.490000>}
box{<0,0,-0.304800><7.551900,0.035000,0.304800> rotate<0,-44.997030,0> translate<22.840000,0.000000,8.150000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.910000,0.000000,19.580000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.180000,0.000000,18.310000>}
box{<0,0,-0.304800><1.796051,0.035000,0.304800> rotate<0,44.997030,0> translate<26.910000,0.000000,19.580000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.180000,0.000000,13.490000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.180000,0.000000,18.310000>}
box{<0,0,-0.304800><4.820000,0.035000,0.304800> rotate<0,90.000000,0> translate<28.180000,0.000000,18.310000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.550000,0.000000,23.145000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.425000,0.000000,23.145000>}
box{<0,0,-0.304800><9.875000,0.035000,0.304800> rotate<0,0.000000,0> translate<18.550000,0.000000,23.145000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.040000,0.000000,5.610000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.450000,0.000000,13.020000>}
box{<0,0,-0.304800><10.479322,0.035000,0.304800> rotate<0,-44.997030,0> translate<22.040000,0.000000,5.610000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.450000,0.000000,19.580000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.450000,0.000000,13.020000>}
box{<0,0,-0.304800><6.560000,0.035000,0.304800> rotate<0,-90.000000,0> translate<29.450000,0.000000,13.020000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.415000,0.000000,21.615000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.450000,0.000000,19.580000>}
box{<0,0,-0.304800><2.877925,0.035000,0.304800> rotate<0,44.997030,0> translate<27.415000,0.000000,21.615000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.240000,0.000000,3.070000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.720000,0.000000,12.550000>}
box{<0,0,-0.304800><13.406745,0.035000,0.304800> rotate<0,-44.997030,0> translate<21.240000,0.000000,3.070000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.720000,0.000000,20.850000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.720000,0.000000,12.550000>}
box{<0,0,-0.304800><8.300000,0.035000,0.304800> rotate<0,-90.000000,0> translate<30.720000,0.000000,12.550000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.425000,0.000000,23.145000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.720000,0.000000,20.850000>}
box{<0,0,-0.304800><3.245620,0.035000,0.304800> rotate<0,44.997030,0> translate<28.425000,0.000000,23.145000> }
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
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320797,0.000000,7.309150>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320797,0.000000,25.170594>}
box{<0,0,-0.304800><17.861444,0.035000,0.304800> rotate<0,90.000000,0> translate<1.320797,0.000000,25.170594> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320797,0.000000,7.309150>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.915597,0.000000,7.783491>}
box{<0,0,-0.304800><0.760780,0.035000,0.304800> rotate<0,-38.569086,0> translate<1.320797,0.000000,7.309150> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320797,0.000000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.328384,0.000000,7.315200>}
box{<0,0,-0.304800><0.007588,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320797,0.000000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320797,0.000000,7.924800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.275653,0.000000,7.924800>}
box{<0,0,-0.304800><0.954856,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320797,0.000000,7.924800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320797,0.000000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.596125,0.000000,8.534400>}
box{<0,0,-0.304800><6.275328,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320797,0.000000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320797,0.000000,9.144000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.986525,0.000000,9.144000>}
box{<0,0,-0.304800><5.665728,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320797,0.000000,9.144000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320797,0.000000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.376925,0.000000,9.753600>}
box{<0,0,-0.304800><5.056128,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320797,0.000000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320797,0.000000,10.363200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.767325,0.000000,10.363200>}
box{<0,0,-0.304800><4.446528,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320797,0.000000,10.363200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320797,0.000000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.157725,0.000000,10.972800>}
box{<0,0,-0.304800><3.836928,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320797,0.000000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320797,0.000000,11.582400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.548125,0.000000,11.582400>}
box{<0,0,-0.304800><3.227328,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320797,0.000000,11.582400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320797,0.000000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.938525,0.000000,12.192000>}
box{<0,0,-0.304800><2.617728,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320797,0.000000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320797,0.000000,12.801600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.328925,0.000000,12.801600>}
box{<0,0,-0.304800><2.008128,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320797,0.000000,12.801600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320797,0.000000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.719325,0.000000,13.411200>}
box{<0,0,-0.304800><1.398528,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320797,0.000000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320797,0.000000,14.020800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.109725,0.000000,14.020800>}
box{<0,0,-0.304800><0.788928,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320797,0.000000,14.020800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320797,0.000000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.967200,0.000000,14.630400>}
box{<0,0,-0.304800><0.646403,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320797,0.000000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320797,0.000000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.967200,0.000000,15.240000>}
box{<0,0,-0.304800><0.646403,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320797,0.000000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320797,0.000000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.967200,0.000000,15.849600>}
box{<0,0,-0.304800><0.646403,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320797,0.000000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320797,0.000000,16.459200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.967200,0.000000,16.459200>}
box{<0,0,-0.304800><0.646403,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320797,0.000000,16.459200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320797,0.000000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.967200,0.000000,17.068800>}
box{<0,0,-0.304800><0.646403,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320797,0.000000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320797,0.000000,17.678400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.967200,0.000000,17.678400>}
box{<0,0,-0.304800><0.646403,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320797,0.000000,17.678400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320797,0.000000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.967200,0.000000,18.288000>}
box{<0,0,-0.304800><0.646403,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320797,0.000000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320797,0.000000,18.897600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.967200,0.000000,18.897600>}
box{<0,0,-0.304800><0.646403,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320797,0.000000,18.897600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320797,0.000000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.967200,0.000000,19.507200>}
box{<0,0,-0.304800><0.646403,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320797,0.000000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320797,0.000000,20.116800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.967200,0.000000,20.116800>}
box{<0,0,-0.304800><0.646403,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320797,0.000000,20.116800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320797,0.000000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.967200,0.000000,20.726400>}
box{<0,0,-0.304800><0.646403,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320797,0.000000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320797,0.000000,21.336000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.116528,0.000000,21.336000>}
box{<0,0,-0.304800><0.795731,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320797,0.000000,21.336000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320797,0.000000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.726128,0.000000,21.945600>}
box{<0,0,-0.304800><1.405331,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320797,0.000000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320797,0.000000,22.555200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.335728,0.000000,22.555200>}
box{<0,0,-0.304800><2.014931,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320797,0.000000,22.555200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320797,0.000000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.442000,0.000000,23.164800>}
box{<0,0,-0.304800><12.121203,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320797,0.000000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320797,0.000000,23.774400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.442000,0.000000,23.774400>}
box{<0,0,-0.304800><12.121203,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320797,0.000000,23.774400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320797,0.000000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.608016,0.000000,24.384000>}
box{<0,0,-0.304800><1.287219,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320797,0.000000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320797,0.000000,24.993600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.542738,0.000000,24.993600>}
box{<0,0,-0.304800><0.221941,0.035000,0.304800> rotate<0,0.000000,0> translate<1.320797,0.000000,24.993600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.320797,0.000000,25.170594>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.015597,0.000000,24.616506>}
box{<0,0,-0.304800><0.888684,0.035000,0.304800> rotate<0,38.569034,0> translate<1.320797,0.000000,25.170594> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.915597,0.000000,7.783491>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.915600,0.000000,7.783491>}
box{<0,0,-0.304800><0.000003,0.035000,0.304800> rotate<0,0.000000,0> translate<1.915597,0.000000,7.783491> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.915600,0.000000,7.783491>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.127847,0.000000,8.259263>}
box{<0,0,-0.304800><1.302268,0.035000,0.304800> rotate<0,-21.427159,0> translate<1.915600,0.000000,7.783491> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.967200,0.000000,14.338322>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.090941,0.000000,14.039584>}
box{<0,0,-0.304800><0.323351,0.035000,0.304800> rotate<0,67.495627,0> translate<1.967200,0.000000,14.338322> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.967200,0.000000,21.011675>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.967200,0.000000,14.338322>}
box{<0,0,-0.304800><6.673353,0.035000,0.304800> rotate<0,-90.000000,0> translate<1.967200,0.000000,14.338322> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.967200,0.000000,21.011675>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.090941,0.000000,21.310413>}
box{<0,0,-0.304800><0.323351,0.035000,0.304800> rotate<0,-67.495627,0> translate<1.967200,0.000000,21.011675> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.015597,0.000000,24.616506>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.015600,0.000000,24.616506>}
box{<0,0,-0.304800><0.000003,0.035000,0.304800> rotate<0,0.000000,0> translate<2.015597,0.000000,24.616506> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.015600,0.000000,24.616506>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.227847,0.000000,24.140734>}
box{<0,0,-0.304800><1.302268,0.035000,0.304800> rotate<0,21.427159,0> translate<2.015600,0.000000,24.616506> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.090941,0.000000,14.039584>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.319584,0.000000,13.810941>}
box{<0,0,-0.304800><0.323351,0.035000,0.304800> rotate<0,44.997030,0> translate<2.090941,0.000000,14.039584> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.090941,0.000000,21.310413>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.360941,0.000000,22.580413>}
box{<0,0,-0.304800><1.796051,0.035000,0.304800> rotate<0,-44.997030,0> translate<2.090941,0.000000,21.310413> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.319584,0.000000,13.810941>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.980941,0.000000,5.149584>}
box{<0,0,-0.304800><12.249007,0.035000,0.304800> rotate<0,44.997030,0> translate<2.319584,0.000000,13.810941> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.127847,0.000000,8.259263>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.127850,0.000000,8.259263>}
box{<0,0,-0.304800><0.000003,0.035000,0.304800> rotate<0,0.000000,0> translate<3.127847,0.000000,8.259263> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.127850,0.000000,8.259263>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.426478,0.000000,8.356581>}
box{<0,0,-0.304800><1.302270,0.035000,0.304800> rotate<0,-4.285433,0> translate<3.127850,0.000000,8.259263> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.227847,0.000000,24.140734>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.227850,0.000000,24.140734>}
box{<0,0,-0.304800><0.000003,0.035000,0.304800> rotate<0,0.000000,0> translate<3.227847,0.000000,24.140734> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.227850,0.000000,24.140734>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.526478,0.000000,24.043416>}
box{<0,0,-0.304800><1.302270,0.035000,0.304800> rotate<0,4.285433,0> translate<3.227850,0.000000,24.140734> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.360941,0.000000,22.580413>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.589584,0.000000,22.809056>}
box{<0,0,-0.304800><0.323351,0.035000,0.304800> rotate<0,-44.997030,0> translate<3.360941,0.000000,22.580413> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.589584,0.000000,22.809056>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.888322,0.000000,22.932797>}
box{<0,0,-0.304800><0.323351,0.035000,0.304800> rotate<0,-22.498433,0> translate<3.589584,0.000000,22.809056> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.592797,0.000000,14.836672>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.592797,0.000000,20.513325>}
box{<0,0,-0.304800><5.676653,0.035000,0.304800> rotate<0,90.000000,0> translate<3.592797,0.000000,20.513325> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.592797,0.000000,14.836672>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.006672,0.000000,6.422797>}
box{<0,0,-0.304800><11.899016,0.035000,0.304800> rotate<0,44.997030,0> translate<3.592797,0.000000,14.836672> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.592797,0.000000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.127200,0.000000,15.240000>}
box{<0,0,-0.304800><8.534403,0.035000,0.304800> rotate<0,0.000000,0> translate<3.592797,0.000000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.592797,0.000000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.127200,0.000000,15.849600>}
box{<0,0,-0.304800><8.534403,0.035000,0.304800> rotate<0,0.000000,0> translate<3.592797,0.000000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.592797,0.000000,16.459200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.127200,0.000000,16.459200>}
box{<0,0,-0.304800><8.534403,0.035000,0.304800> rotate<0,0.000000,0> translate<3.592797,0.000000,16.459200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.592797,0.000000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.127200,0.000000,17.068800>}
box{<0,0,-0.304800><8.534403,0.035000,0.304800> rotate<0,0.000000,0> translate<3.592797,0.000000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.592797,0.000000,17.678400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.127200,0.000000,17.678400>}
box{<0,0,-0.304800><8.534403,0.035000,0.304800> rotate<0,0.000000,0> translate<3.592797,0.000000,17.678400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.592797,0.000000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.127200,0.000000,18.288000>}
box{<0,0,-0.304800><8.534403,0.035000,0.304800> rotate<0,0.000000,0> translate<3.592797,0.000000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.592797,0.000000,18.897600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.132134,0.000000,18.897600>}
box{<0,0,-0.304800><0.539338,0.035000,0.304800> rotate<0,0.000000,0> translate<3.592797,0.000000,18.897600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.592797,0.000000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.011200,0.000000,19.507200>}
box{<0,0,-0.304800><0.418403,0.035000,0.304800> rotate<0,0.000000,0> translate<3.592797,0.000000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.592797,0.000000,20.116800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.011200,0.000000,20.116800>}
box{<0,0,-0.304800><0.418403,0.035000,0.304800> rotate<0,0.000000,0> translate<3.592797,0.000000,20.116800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.592797,0.000000,20.513325>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.062000,0.000000,20.982531>}
box{<0,0,-0.304800><0.663556,0.035000,0.304800> rotate<0,-44.997221,0> translate<3.592797,0.000000,20.513325> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.799069,0.000000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.127200,0.000000,14.630400>}
box{<0,0,-0.304800><8.328131,0.035000,0.304800> rotate<0,0.000000,0> translate<3.799069,0.000000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.805869,0.000000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.038756,0.000000,20.726400>}
box{<0,0,-0.304800><0.232888,0.035000,0.304800> rotate<0,0.000000,0> translate<3.805869,0.000000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.888322,0.000000,22.932797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.334381,0.000000,22.932797>}
box{<0,0,-0.304800><0.446059,0.035000,0.304800> rotate<0,0.000000,0> translate<3.888322,0.000000,22.932797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.011197,0.000000,19.920200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.011200,0.000000,20.623566>}
box{<0,0,-0.304800><0.703366,0.035000,0.304800> rotate<0,-89.993806,0> translate<4.011197,0.000000,19.920200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.011197,0.000000,19.920200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.299778,0.000000,19.920200>}
box{<0,0,-0.304800><1.288581,0.035000,0.304800> rotate<0,0.000000,0> translate<4.011197,0.000000,19.920200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.011200,0.000000,19.176431>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.049281,0.000000,19.034309>}
box{<0,0,-0.304800><0.147135,0.035000,0.304800> rotate<0,74.995122,0> translate<4.011200,0.000000,19.176431> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.011200,0.000000,19.879794>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.011200,0.000000,19.176431>}
box{<0,0,-0.304800><0.703363,0.035000,0.304800> rotate<0,-90.000000,0> translate<4.011200,0.000000,19.176431> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.011200,0.000000,19.879794>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.299778,0.000000,19.879794>}
box{<0,0,-0.304800><1.288578,0.035000,0.304800> rotate<0,0.000000,0> translate<4.011200,0.000000,19.879794> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.011200,0.000000,20.623566>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.049281,0.000000,20.765688>}
box{<0,0,-0.304800><0.147135,0.035000,0.304800> rotate<0,-74.995122,0> translate<4.011200,0.000000,20.623566> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.049281,0.000000,19.034309>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.122847,0.000000,18.906887>}
box{<0,0,-0.304800><0.147133,0.035000,0.304800> rotate<0,59.996522,0> translate<4.049281,0.000000,19.034309> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.049281,0.000000,20.765688>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.117587,0.000000,20.883994>}
box{<0,0,-0.304800><0.136609,0.035000,0.304800> rotate<0,-59.995276,0> translate<4.049281,0.000000,20.765688> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.062000,0.000000,20.939578>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.117587,0.000000,20.883994>}
box{<0,0,-0.304800><0.078610,0.035000,0.304800> rotate<0,44.995420,0> translate<4.062000,0.000000,20.939578> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.062000,0.000000,20.982531>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.062000,0.000000,20.939578>}
box{<0,0,-0.304800><0.042953,0.035000,0.304800> rotate<0,-90.000000,0> translate<4.062000,0.000000,20.939578> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.122847,0.000000,18.906887>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.226888,0.000000,18.802847>}
box{<0,0,-0.304800><0.147136,0.035000,0.304800> rotate<0,44.997030,0> translate<4.122847,0.000000,18.906887> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.226888,0.000000,18.802847>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.354309,0.000000,18.729281>}
box{<0,0,-0.304800><0.147133,0.035000,0.304800> rotate<0,29.997538,0> translate<4.226888,0.000000,18.802847> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.334381,0.000000,22.932797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.359578,0.000000,22.957997>}
box{<0,0,-0.304800><0.035636,0.035000,0.304800> rotate<0,-45.000583,0> translate<4.334381,0.000000,22.932797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.354309,0.000000,18.729281>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.496431,0.000000,18.691200>}
box{<0,0,-0.304800><0.147135,0.035000,0.304800> rotate<0,14.998938,0> translate<4.354309,0.000000,18.729281> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.359578,0.000000,22.957997>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.280419,0.000000,22.957997>}
box{<0,0,-0.304800><1.920841,0.035000,0.304800> rotate<0,0.000000,0> translate<4.359578,0.000000,22.957997> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.408669,0.000000,14.020800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.127200,0.000000,14.020800>}
box{<0,0,-0.304800><7.718531,0.035000,0.304800> rotate<0,0.000000,0> translate<4.408669,0.000000,14.020800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.426478,0.000000,8.356581>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.426481,0.000000,8.356581>}
box{<0,0,-0.304800><0.000003,0.035000,0.304800> rotate<0,0.000000,0> translate<4.426478,0.000000,8.356581> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.426481,0.000000,8.356581>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.696097,0.000000,8.066797>}
box{<0,0,-0.304800><1.302267,0.035000,0.304800> rotate<0,12.856418,0> translate<4.426481,0.000000,8.356581> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.496431,0.000000,18.691200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.299794,0.000000,18.691197>}
box{<0,0,-0.304800><0.803363,0.035000,0.304800> rotate<0,0.000223,0> translate<4.496431,0.000000,18.691200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.526478,0.000000,24.043416>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.526481,0.000000,24.043416>}
box{<0,0,-0.304800><0.000003,0.035000,0.304800> rotate<0,0.000000,0> translate<4.526478,0.000000,24.043416> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.526481,0.000000,24.043416>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.796100,0.000000,24.333200>}
box{<0,0,-0.304800><1.302270,0.035000,0.304800> rotate<0,-12.856388,0> translate<4.526481,0.000000,24.043416> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.018269,0.000000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.127200,0.000000,13.411200>}
box{<0,0,-0.304800><7.108931,0.035000,0.304800> rotate<0,0.000000,0> translate<5.018269,0.000000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.299778,0.000000,19.920200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.299778,0.000000,19.879794>}
box{<0,0,-0.304800><0.040406,0.035000,0.304800> rotate<0,-90.000000,0> translate<5.299778,0.000000,19.879794> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.299794,0.000000,18.691197>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.299794,0.000000,19.879778>}
box{<0,0,-0.304800><1.188581,0.035000,0.304800> rotate<0,90.000000,0> translate<5.299794,0.000000,19.879778> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.299794,0.000000,18.897600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.340200,0.000000,18.897600>}
box{<0,0,-0.304800><0.040406,0.035000,0.304800> rotate<0,0.000000,0> translate<5.299794,0.000000,18.897600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.299794,0.000000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.340200,0.000000,19.507200>}
box{<0,0,-0.304800><0.040406,0.035000,0.304800> rotate<0,0.000000,0> translate<5.299794,0.000000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.299794,0.000000,19.879778>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.340200,0.000000,19.879778>}
box{<0,0,-0.304800><0.040406,0.035000,0.304800> rotate<0,0.000000,0> translate<5.299794,0.000000,19.879778> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.340200,0.000000,18.691200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.143566,0.000000,18.691200>}
box{<0,0,-0.304800><0.803366,0.035000,0.304800> rotate<0,0.000000,0> translate<5.340200,0.000000,18.691200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.340200,0.000000,19.879778>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.340200,0.000000,18.691200>}
box{<0,0,-0.304800><1.188578,0.035000,0.304800> rotate<0,-90.000000,0> translate<5.340200,0.000000,18.691200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.340219,0.000000,19.879794>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.340219,0.000000,19.920200>}
box{<0,0,-0.304800><0.040406,0.035000,0.304800> rotate<0,90.000000,0> translate<5.340219,0.000000,19.920200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.340219,0.000000,19.879794>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.628797,0.000000,19.879794>}
box{<0,0,-0.304800><1.288578,0.035000,0.304800> rotate<0,0.000000,0> translate<5.340219,0.000000,19.879794> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.340219,0.000000,19.920200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.628794,0.000000,19.920200>}
box{<0,0,-0.304800><1.288575,0.035000,0.304800> rotate<0,0.000000,0> translate<5.340219,0.000000,19.920200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.627869,0.000000,12.801600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.237678,0.000000,12.801600>}
box{<0,0,-0.304800><6.609809,0.035000,0.304800> rotate<0,0.000000,0> translate<5.627869,0.000000,12.801600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.696097,0.000000,8.066797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.696100,0.000000,8.066797>}
box{<0,0,-0.304800><0.000003,0.035000,0.304800> rotate<0,0.000000,0> translate<5.696097,0.000000,8.066797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.696100,0.000000,8.066797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.823897,0.000000,7.415663>}
box{<0,0,-0.304800><1.302268,0.035000,0.304800> rotate<0,29.998041,0> translate<5.696100,0.000000,8.066797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.796100,0.000000,24.333200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.923900,0.000000,24.984334>}
box{<0,0,-0.304800><1.302271,0.035000,0.304800> rotate<0,-29.997972,0> translate<5.796100,0.000000,24.333200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.884088,0.000000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.737200,0.000000,24.384000>}
box{<0,0,-0.304800><11.853113,0.035000,0.304800> rotate<0,0.000000,0> translate<5.884088,0.000000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.942047,0.000000,7.924800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.205725,0.000000,7.924800>}
box{<0,0,-0.304800><2.263678,0.035000,0.304800> rotate<0,0.000000,0> translate<5.942047,0.000000,7.924800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.143566,0.000000,18.691200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.285687,0.000000,18.729281>}
box{<0,0,-0.304800><0.147135,0.035000,0.304800> rotate<0,-14.998938,0> translate<6.143566,0.000000,18.691200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.237469,0.000000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.828525,0.000000,12.192000>}
box{<0,0,-0.304800><6.591056,0.035000,0.304800> rotate<0,0.000000,0> translate<6.237469,0.000000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.280419,0.000000,22.957997>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.577997,0.000000,22.660419>}
box{<0,0,-0.304800><0.420839,0.035000,0.304800> rotate<0,44.997030,0> translate<6.280419,0.000000,22.957997> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.285687,0.000000,18.729281>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.413109,0.000000,18.802847>}
box{<0,0,-0.304800><0.147133,0.035000,0.304800> rotate<0,-29.997538,0> translate<6.285687,0.000000,18.729281> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.413109,0.000000,18.802847>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.517150,0.000000,18.906887>}
box{<0,0,-0.304800><0.147136,0.035000,0.304800> rotate<0,-44.997030,0> translate<6.413109,0.000000,18.802847> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.507862,0.000000,18.897600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.942134,0.000000,18.897600>}
box{<0,0,-0.304800><1.434272,0.035000,0.304800> rotate<0,0.000000,0> translate<6.507862,0.000000,18.897600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.517150,0.000000,18.906887>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.590716,0.000000,19.034309>}
box{<0,0,-0.304800><0.147133,0.035000,0.304800> rotate<0,-59.996522,0> translate<6.517150,0.000000,18.906887> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.522409,0.000000,20.883994>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.577997,0.000000,20.939578>}
box{<0,0,-0.304800><0.078610,0.035000,0.304800> rotate<0,-44.995420,0> translate<6.522409,0.000000,20.883994> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.522409,0.000000,20.883994>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.590716,0.000000,20.765688>}
box{<0,0,-0.304800><0.136609,0.035000,0.304800> rotate<0,59.995276,0> translate<6.522409,0.000000,20.883994> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.577997,0.000000,20.939578>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.577997,0.000000,20.987200>}
box{<0,0,-0.304800><0.047622,0.035000,0.304800> rotate<0,90.000000,0> translate<6.577997,0.000000,20.987200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.577997,0.000000,20.987200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.872000,0.000000,20.987200>}
box{<0,0,-0.304800><1.294003,0.035000,0.304800> rotate<0,0.000000,0> translate<6.577997,0.000000,20.987200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.577997,0.000000,22.612797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.577997,0.000000,22.660419>}
box{<0,0,-0.304800><0.047622,0.035000,0.304800> rotate<0,90.000000,0> translate<6.577997,0.000000,22.660419> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.577997,0.000000,22.612797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.872000,0.000000,22.612797>}
box{<0,0,-0.304800><1.294003,0.035000,0.304800> rotate<0,0.000000,0> translate<6.577997,0.000000,22.612797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.590716,0.000000,19.034309>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.628797,0.000000,19.176431>}
box{<0,0,-0.304800><0.147135,0.035000,0.304800> rotate<0,-74.995122,0> translate<6.590716,0.000000,19.034309> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.590716,0.000000,20.765688>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.628797,0.000000,20.623566>}
box{<0,0,-0.304800><0.147135,0.035000,0.304800> rotate<0,74.995122,0> translate<6.590716,0.000000,20.765688> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.601244,0.000000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.848756,0.000000,20.726400>}
box{<0,0,-0.304800><1.247513,0.035000,0.304800> rotate<0,0.000000,0> translate<6.601244,0.000000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.628794,0.000000,19.920200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.628797,0.000000,20.623566>}
box{<0,0,-0.304800><0.703366,0.035000,0.304800> rotate<0,-89.993806,0> translate<6.628794,0.000000,19.920200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.628794,0.000000,20.116800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.821200,0.000000,20.116800>}
box{<0,0,-0.304800><1.192406,0.035000,0.304800> rotate<0,0.000000,0> translate<6.628794,0.000000,20.116800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.628797,0.000000,19.176431>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.628797,0.000000,19.879794>}
box{<0,0,-0.304800><0.703363,0.035000,0.304800> rotate<0,90.000000,0> translate<6.628797,0.000000,19.879794> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.628797,0.000000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.821200,0.000000,19.507200>}
box{<0,0,-0.304800><1.192403,0.035000,0.304800> rotate<0,0.000000,0> translate<6.628797,0.000000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.823897,0.000000,7.415663>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.823900,0.000000,7.415663>}
box{<0,0,-0.304800><0.000003,0.035000,0.304800> rotate<0,0.000000,0> translate<6.823897,0.000000,7.415663> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.823900,0.000000,7.415663>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.709669,0.000000,6.461031>}
box{<0,0,-0.304800><1.302270,0.035000,0.304800> rotate<0,47.139733,0> translate<6.823900,0.000000,7.415663> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.847069,0.000000,11.582400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.438125,0.000000,11.582400>}
box{<0,0,-0.304800><6.591056,0.035000,0.304800> rotate<0,0.000000,0> translate<6.847069,0.000000,11.582400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.917116,0.000000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.815325,0.000000,7.315200>}
box{<0,0,-0.304800><1.898209,0.035000,0.304800> rotate<0,0.000000,0> translate<6.917116,0.000000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.923900,0.000000,24.984334>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.923900,0.000000,24.984338>}
box{<0,0,-0.304800><0.000003,0.035000,0.304800> rotate<0,90.000000,0> translate<6.923900,0.000000,24.984338> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.923900,0.000000,24.984338>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.809669,0.000000,25.938969>}
box{<0,0,-0.304800><1.302270,0.035000,0.304800> rotate<0,-47.139733,0> translate<6.923900,0.000000,24.984338> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.932494,0.000000,24.993600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.737200,0.000000,24.993600>}
box{<0,0,-0.304800><10.804706,0.035000,0.304800> rotate<0,0.000000,0> translate<6.932494,0.000000,24.993600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.456669,0.000000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.047725,0.000000,10.972800>}
box{<0,0,-0.304800><6.591056,0.035000,0.304800> rotate<0,0.000000,0> translate<7.456669,0.000000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.482744,0.000000,6.705600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.424925,0.000000,6.705600>}
box{<0,0,-0.304800><1.942181,0.035000,0.304800> rotate<0,0.000000,0> translate<7.482744,0.000000,6.705600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.498119,0.000000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.201200,0.000000,25.603200>}
box{<0,0,-0.304800><2.703081,0.035000,0.304800> rotate<0,0.000000,0> translate<7.498119,0.000000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.507234,0.000000,1.320797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.709669,0.000000,1.538966>}
box{<0,0,-0.304800><0.297619,0.035000,0.304800> rotate<0,-47.139272,0> translate<7.507234,0.000000,1.320797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.507234,0.000000,1.320797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.266309,0.000000,1.320797>}
box{<0,0,-0.304800><18.759075,0.035000,0.304800> rotate<0,0.000000,0> translate<7.507234,0.000000,1.320797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.514447,0.000000,31.179200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.809669,0.000000,30.861031>}
box{<0,0,-0.304800><0.434036,0.035000,0.304800> rotate<0,47.139318,0> translate<7.514447,0.000000,31.179200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.514447,0.000000,31.179200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.266309,0.000000,31.179200>}
box{<0,0,-0.304800><18.751863,0.035000,0.304800> rotate<0,0.000000,0> translate<7.514447,0.000000,31.179200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.597588,0.000000,31.089600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.205222,0.000000,31.089600>}
box{<0,0,-0.304800><18.607634,0.035000,0.304800> rotate<0,0.000000,0> translate<7.597588,0.000000,31.089600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.709669,0.000000,1.538966>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.709669,0.000000,1.538969>}
box{<0,0,-0.304800><0.000003,0.035000,0.304800> rotate<0,90.000000,0> translate<7.709669,0.000000,1.538969> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.709669,0.000000,1.538969>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.274703,0.000000,2.712272>}
box{<0,0,-0.304800><1.302269,0.035000,0.304800> rotate<0,-64.281417,0> translate<7.709669,0.000000,1.538969> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.709669,0.000000,6.461028>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.709669,0.000000,6.461031>}
box{<0,0,-0.304800><0.000003,0.035000,0.304800> rotate<0,90.000000,0> translate<7.709669,0.000000,6.461031> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.709669,0.000000,6.461028>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.274703,0.000000,5.287725>}
box{<0,0,-0.304800><1.302269,0.035000,0.304800> rotate<0,64.281417,0> translate<7.709669,0.000000,6.461028> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.809669,0.000000,25.938969>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.374700,0.000000,27.112272>}
box{<0,0,-0.304800><1.302267,0.035000,0.304800> rotate<0,-64.281541,0> translate<7.809669,0.000000,25.938969> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.809669,0.000000,30.861028>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.809669,0.000000,30.861031>}
box{<0,0,-0.304800><0.000003,0.035000,0.304800> rotate<0,90.000000,0> translate<7.809669,0.000000,30.861031> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.809669,0.000000,30.861028>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.374703,0.000000,29.687725>}
box{<0,0,-0.304800><1.302269,0.035000,0.304800> rotate<0,64.281417,0> translate<7.809669,0.000000,30.861028> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.821197,0.000000,19.920200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.821200,0.000000,20.623566>}
box{<0,0,-0.304800><0.703366,0.035000,0.304800> rotate<0,-89.993806,0> translate<7.821197,0.000000,19.920200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.821197,0.000000,19.920200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.109778,0.000000,19.920200>}
box{<0,0,-0.304800><1.288581,0.035000,0.304800> rotate<0,0.000000,0> translate<7.821197,0.000000,19.920200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.821200,0.000000,19.176431>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.859281,0.000000,19.034309>}
box{<0,0,-0.304800><0.147135,0.035000,0.304800> rotate<0,74.995122,0> translate<7.821200,0.000000,19.176431> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.821200,0.000000,19.879794>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.821200,0.000000,19.176431>}
box{<0,0,-0.304800><0.703363,0.035000,0.304800> rotate<0,-90.000000,0> translate<7.821200,0.000000,19.176431> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.821200,0.000000,19.879794>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.109778,0.000000,19.879794>}
box{<0,0,-0.304800><1.288578,0.035000,0.304800> rotate<0,0.000000,0> translate<7.821200,0.000000,19.879794> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.821200,0.000000,20.623566>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.859281,0.000000,20.765688>}
box{<0,0,-0.304800><0.147135,0.035000,0.304800> rotate<0,-74.995122,0> translate<7.821200,0.000000,20.623566> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.849244,0.000000,1.828800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.925150,0.000000,1.828800>}
box{<0,0,-0.304800><7.075906,0.035000,0.304800> rotate<0,0.000000,0> translate<7.849244,0.000000,1.828800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.859281,0.000000,19.034309>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.932847,0.000000,18.906887>}
box{<0,0,-0.304800><0.147133,0.035000,0.304800> rotate<0,59.996522,0> translate<7.859281,0.000000,19.034309> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.859281,0.000000,20.765688>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.927588,0.000000,20.883994>}
box{<0,0,-0.304800><0.136609,0.035000,0.304800> rotate<0,-59.995276,0> translate<7.859281,0.000000,20.765688> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.872000,0.000000,20.939578>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.927588,0.000000,20.883994>}
box{<0,0,-0.304800><0.078610,0.035000,0.304800> rotate<0,44.995420,0> translate<7.872000,0.000000,20.939578> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.872000,0.000000,20.987200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.872000,0.000000,20.939578>}
box{<0,0,-0.304800><0.047622,0.035000,0.304800> rotate<0,-90.000000,0> translate<7.872000,0.000000,20.939578> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.872000,0.000000,22.660419>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.872000,0.000000,22.612797>}
box{<0,0,-0.304800><0.047622,0.035000,0.304800> rotate<0,-90.000000,0> translate<7.872000,0.000000,22.612797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.872000,0.000000,22.660419>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.169578,0.000000,22.957997>}
box{<0,0,-0.304800><0.420839,0.035000,0.304800> rotate<0,-44.997030,0> translate<7.872000,0.000000,22.660419> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.885459,0.000000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.034525,0.000000,6.096000>}
box{<0,0,-0.304800><2.149066,0.035000,0.304800> rotate<0,0.000000,0> translate<7.885459,0.000000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.932847,0.000000,18.906887>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.036888,0.000000,18.802847>}
box{<0,0,-0.304800><0.147136,0.035000,0.304800> rotate<0,44.997030,0> translate<7.932847,0.000000,18.906887> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.941538,0.000000,26.212800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.201200,0.000000,26.212800>}
box{<0,0,-0.304800><2.259662,0.035000,0.304800> rotate<0,0.000000,0> translate<7.941538,0.000000,26.212800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.993166,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.339738,0.000000,30.480000>}
box{<0,0,-0.304800><2.346572,0.035000,0.304800> rotate<0,0.000000,0> translate<7.993166,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.036888,0.000000,18.802847>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.164309,0.000000,18.729281>}
box{<0,0,-0.304800><0.147133,0.035000,0.304800> rotate<0,29.997538,0> translate<8.036888,0.000000,18.802847> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.066269,0.000000,10.363200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.210000,0.000000,10.363200>}
box{<0,0,-0.304800><6.143731,0.035000,0.304800> rotate<0,0.000000,0> translate<8.066269,0.000000,10.363200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.142812,0.000000,2.438400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.315550,0.000000,2.438400>}
box{<0,0,-0.304800><6.172738,0.035000,0.304800> rotate<0,0.000000,0> translate<8.142812,0.000000,2.438400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.164309,0.000000,18.729281>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.306431,0.000000,18.691200>}
box{<0,0,-0.304800><0.147135,0.035000,0.304800> rotate<0,14.998938,0> translate<8.164309,0.000000,18.729281> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.169578,0.000000,22.957997>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.090419,0.000000,22.957997>}
box{<0,0,-0.304800><1.920841,0.035000,0.304800> rotate<0,0.000000,0> translate<8.169578,0.000000,22.957997> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.179028,0.000000,5.486400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.644125,0.000000,5.486400>}
box{<0,0,-0.304800><2.465097,0.035000,0.304800> rotate<0,0.000000,0> translate<8.179028,0.000000,5.486400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.235103,0.000000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.201200,0.000000,26.822400>}
box{<0,0,-0.304800><1.966097,0.035000,0.304800> rotate<0,0.000000,0> translate<8.235103,0.000000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.274703,0.000000,2.712272>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.274703,0.000000,2.712275>}
box{<0,0,-0.304800><0.000003,0.035000,0.304800> rotate<0,90.000000,0> translate<8.274703,0.000000,2.712275> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.274703,0.000000,2.712275>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.468797,0.000000,4.000000>}
box{<0,0,-0.304800><1.302270,0.035000,0.304800> rotate<0,-81.423179,0> translate<8.274703,0.000000,2.712275> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.274703,0.000000,5.287722>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.274703,0.000000,5.287725>}
box{<0,0,-0.304800><0.000003,0.035000,0.304800> rotate<0,90.000000,0> translate<8.274703,0.000000,5.287725> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.274703,0.000000,5.287722>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.468797,0.000000,4.000000>}
box{<0,0,-0.304800><1.302267,0.035000,0.304800> rotate<0,81.423158,0> translate<8.274703,0.000000,5.287722> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.286734,0.000000,29.870400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.201200,0.000000,29.870400>}
box{<0,0,-0.304800><1.914466,0.035000,0.304800> rotate<0,0.000000,0> translate<8.286734,0.000000,29.870400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.306431,0.000000,18.691200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.109794,0.000000,18.691197>}
box{<0,0,-0.304800><0.803363,0.035000,0.304800> rotate<0,0.000223,0> translate<8.306431,0.000000,18.691200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.325303,0.000000,3.048000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.210000,0.000000,3.048000>}
box{<0,0,-0.304800><5.884697,0.035000,0.304800> rotate<0,0.000000,0> translate<8.325303,0.000000,3.048000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.336641,0.000000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.316147,0.000000,4.876800>}
box{<0,0,-0.304800><2.979506,0.035000,0.304800> rotate<0,0.000000,0> translate<8.336641,0.000000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.374700,0.000000,27.112272>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.374703,0.000000,27.112272>}
box{<0,0,-0.304800><0.000003,0.035000,0.304800> rotate<0,0.000000,0> translate<8.374700,0.000000,27.112272> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.374703,0.000000,27.112272>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.568797,0.000000,28.400000>}
box{<0,0,-0.304800><1.302273,0.035000,0.304800> rotate<0,-81.423199,0> translate<8.374703,0.000000,27.112272> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.374703,0.000000,29.687722>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.374703,0.000000,29.687725>}
box{<0,0,-0.304800><0.000003,0.035000,0.304800> rotate<0,90.000000,0> translate<8.374703,0.000000,29.687725> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.374703,0.000000,29.687722>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.568797,0.000000,28.400000>}
box{<0,0,-0.304800><1.302267,0.035000,0.304800> rotate<0,81.423158,0> translate<8.374703,0.000000,29.687722> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.417188,0.000000,3.657600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.271553,0.000000,3.657600>}
box{<0,0,-0.304800><5.854366,0.035000,0.304800> rotate<0,0.000000,0> translate<8.417188,0.000000,3.657600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.422894,0.000000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.306434,0.000000,27.432000>}
box{<0,0,-0.304800><1.883541,0.035000,0.304800> rotate<0,0.000000,0> translate<8.422894,0.000000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.428525,0.000000,4.267200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.881153,0.000000,4.267200>}
box{<0,0,-0.304800><6.452628,0.035000,0.304800> rotate<0,0.000000,0> translate<8.428525,0.000000,4.267200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.439053,0.000000,29.260800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.201200,0.000000,29.260800>}
box{<0,0,-0.304800><1.762147,0.035000,0.304800> rotate<0,0.000000,0> translate<8.439053,0.000000,29.260800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.514775,0.000000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.478925,0.000000,28.041600>}
box{<0,0,-0.304800><4.964150,0.035000,0.304800> rotate<0,0.000000,0> translate<8.514775,0.000000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.530938,0.000000,28.651200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.201200,0.000000,28.651200>}
box{<0,0,-0.304800><1.670262,0.035000,0.304800> rotate<0,0.000000,0> translate<8.530938,0.000000,28.651200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.675869,0.000000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.620350,0.000000,9.753600>}
box{<0,0,-0.304800><5.944481,0.035000,0.304800> rotate<0,0.000000,0> translate<8.675869,0.000000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.109778,0.000000,19.920200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.109778,0.000000,19.879794>}
box{<0,0,-0.304800><0.040406,0.035000,0.304800> rotate<0,-90.000000,0> translate<9.109778,0.000000,19.879794> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.109794,0.000000,18.691197>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.109794,0.000000,19.879778>}
box{<0,0,-0.304800><1.188581,0.035000,0.304800> rotate<0,90.000000,0> translate<9.109794,0.000000,19.879778> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.109794,0.000000,18.897600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.150200,0.000000,18.897600>}
box{<0,0,-0.304800><0.040406,0.035000,0.304800> rotate<0,0.000000,0> translate<9.109794,0.000000,18.897600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.109794,0.000000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.150200,0.000000,19.507200>}
box{<0,0,-0.304800><0.040406,0.035000,0.304800> rotate<0,0.000000,0> translate<9.109794,0.000000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.109794,0.000000,19.879778>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.150200,0.000000,19.879778>}
box{<0,0,-0.304800><0.040406,0.035000,0.304800> rotate<0,0.000000,0> translate<9.109794,0.000000,19.879778> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.150200,0.000000,18.691200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.953566,0.000000,18.691200>}
box{<0,0,-0.304800><0.803366,0.035000,0.304800> rotate<0,0.000000,0> translate<9.150200,0.000000,18.691200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.150200,0.000000,19.879778>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.150200,0.000000,18.691200>}
box{<0,0,-0.304800><1.188578,0.035000,0.304800> rotate<0,-90.000000,0> translate<9.150200,0.000000,18.691200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.150219,0.000000,19.879794>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.150219,0.000000,19.920200>}
box{<0,0,-0.304800><0.040406,0.035000,0.304800> rotate<0,90.000000,0> translate<9.150219,0.000000,19.920200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.150219,0.000000,19.879794>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.438797,0.000000,19.879794>}
box{<0,0,-0.304800><1.288578,0.035000,0.304800> rotate<0,0.000000,0> translate<9.150219,0.000000,19.879794> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.150219,0.000000,19.920200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.438794,0.000000,19.920200>}
box{<0,0,-0.304800><1.288575,0.035000,0.304800> rotate<0,0.000000,0> translate<9.150219,0.000000,19.920200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.285469,0.000000,9.144000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.606109,0.000000,9.144000>}
box{<0,0,-0.304800><5.320641,0.035000,0.304800> rotate<0,0.000000,0> translate<9.285469,0.000000,9.144000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.895069,0.000000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.159200,0.000000,8.534400>}
box{<0,0,-0.304800><4.264131,0.035000,0.304800> rotate<0,0.000000,0> translate<9.895069,0.000000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.953566,0.000000,18.691200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.095688,0.000000,18.729281>}
box{<0,0,-0.304800><0.147135,0.035000,0.304800> rotate<0,-14.998938,0> translate<9.953566,0.000000,18.691200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.090419,0.000000,22.957997>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.387997,0.000000,22.660419>}
box{<0,0,-0.304800><0.420839,0.035000,0.304800> rotate<0,44.997030,0> translate<10.090419,0.000000,22.957997> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.095688,0.000000,18.729281>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.223109,0.000000,18.802847>}
box{<0,0,-0.304800><0.147133,0.035000,0.304800> rotate<0,-29.997538,0> translate<10.095688,0.000000,18.729281> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.201197,0.000000,26.370200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.201200,0.000000,27.173566>}
box{<0,0,-0.304800><0.803366,0.035000,0.304800> rotate<0,-89.993837,0> translate<10.201197,0.000000,26.370200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.201197,0.000000,26.370200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.389778,0.000000,26.370200>}
box{<0,0,-0.304800><1.188581,0.035000,0.304800> rotate<0,0.000000,0> translate<10.201197,0.000000,26.370200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.201197,0.000000,29.380200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.201200,0.000000,30.183566>}
box{<0,0,-0.304800><0.803366,0.035000,0.304800> rotate<0,-89.993837,0> translate<10.201197,0.000000,29.380200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.201197,0.000000,29.380200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.389778,0.000000,29.380200>}
box{<0,0,-0.304800><1.188581,0.035000,0.304800> rotate<0,0.000000,0> translate<10.201197,0.000000,29.380200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.201200,0.000000,25.526431>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.239281,0.000000,25.384309>}
box{<0,0,-0.304800><0.147135,0.035000,0.304800> rotate<0,74.995122,0> translate<10.201200,0.000000,25.526431> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.201200,0.000000,26.329794>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.201200,0.000000,25.526431>}
box{<0,0,-0.304800><0.803362,0.035000,0.304800> rotate<0,-90.000000,0> translate<10.201200,0.000000,25.526431> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.201200,0.000000,26.329794>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.389778,0.000000,26.329794>}
box{<0,0,-0.304800><1.188578,0.035000,0.304800> rotate<0,0.000000,0> translate<10.201200,0.000000,26.329794> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.201200,0.000000,27.173566>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.239281,0.000000,27.315688>}
box{<0,0,-0.304800><0.147135,0.035000,0.304800> rotate<0,-74.995122,0> translate<10.201200,0.000000,27.173566> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.201200,0.000000,28.536431>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.239281,0.000000,28.394309>}
box{<0,0,-0.304800><0.147135,0.035000,0.304800> rotate<0,74.995122,0> translate<10.201200,0.000000,28.536431> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.201200,0.000000,29.339794>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.201200,0.000000,28.536431>}
box{<0,0,-0.304800><0.803363,0.035000,0.304800> rotate<0,-90.000000,0> translate<10.201200,0.000000,28.536431> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.201200,0.000000,29.339794>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.389778,0.000000,29.339794>}
box{<0,0,-0.304800><1.188578,0.035000,0.304800> rotate<0,0.000000,0> translate<10.201200,0.000000,29.339794> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.201200,0.000000,30.183566>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.239281,0.000000,30.325688>}
box{<0,0,-0.304800><0.147135,0.035000,0.304800> rotate<0,-74.995122,0> translate<10.201200,0.000000,30.183566> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.223109,0.000000,18.802847>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.327150,0.000000,18.906887>}
box{<0,0,-0.304800><0.147136,0.035000,0.304800> rotate<0,-44.997030,0> translate<10.223109,0.000000,18.802847> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.239281,0.000000,25.384309>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.312847,0.000000,25.256888>}
box{<0,0,-0.304800><0.147133,0.035000,0.304800> rotate<0,59.996522,0> translate<10.239281,0.000000,25.384309> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.239281,0.000000,27.315688>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.312847,0.000000,27.443109>}
box{<0,0,-0.304800><0.147133,0.035000,0.304800> rotate<0,-59.996522,0> translate<10.239281,0.000000,27.315688> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.239281,0.000000,28.394309>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.312847,0.000000,28.266888>}
box{<0,0,-0.304800><0.147133,0.035000,0.304800> rotate<0,59.996522,0> translate<10.239281,0.000000,28.394309> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.239281,0.000000,30.325688>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.312847,0.000000,30.453109>}
box{<0,0,-0.304800><0.147133,0.035000,0.304800> rotate<0,-59.996522,0> translate<10.239281,0.000000,30.325688> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.312847,0.000000,25.256888>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.416887,0.000000,25.152847>}
box{<0,0,-0.304800><0.147136,0.035000,0.304800> rotate<0,44.997030,0> translate<10.312847,0.000000,25.256888> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.312847,0.000000,27.443109>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.416887,0.000000,27.547150>}
box{<0,0,-0.304800><0.147136,0.035000,0.304800> rotate<0,-44.997030,0> translate<10.312847,0.000000,27.443109> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.312847,0.000000,28.266888>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.416887,0.000000,28.162847>}
box{<0,0,-0.304800><0.147136,0.035000,0.304800> rotate<0,44.997030,0> translate<10.312847,0.000000,28.266888> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.312847,0.000000,30.453109>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.416887,0.000000,30.557150>}
box{<0,0,-0.304800><0.147136,0.035000,0.304800> rotate<0,-44.997030,0> translate<10.312847,0.000000,30.453109> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.317863,0.000000,18.897600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.378128,0.000000,18.897600>}
box{<0,0,-0.304800><2.060266,0.035000,0.304800> rotate<0,0.000000,0> translate<10.317863,0.000000,18.897600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.327150,0.000000,18.906887>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.400716,0.000000,19.034309>}
box{<0,0,-0.304800><0.147133,0.035000,0.304800> rotate<0,-59.996522,0> translate<10.327150,0.000000,18.906887> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.332409,0.000000,20.883994>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.387997,0.000000,20.939578>}
box{<0,0,-0.304800><0.078610,0.035000,0.304800> rotate<0,-44.995420,0> translate<10.332409,0.000000,20.883994> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.332409,0.000000,20.883994>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.400716,0.000000,20.765688>}
box{<0,0,-0.304800><0.136609,0.035000,0.304800> rotate<0,59.995276,0> translate<10.332409,0.000000,20.883994> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.387997,0.000000,20.939578>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.387997,0.000000,20.987200>}
box{<0,0,-0.304800><0.047622,0.035000,0.304800> rotate<0,90.000000,0> translate<10.387997,0.000000,20.987200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.387997,0.000000,20.987200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.442000,0.000000,20.987200>}
box{<0,0,-0.304800><3.054003,0.035000,0.304800> rotate<0,0.000000,0> translate<10.387997,0.000000,20.987200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.387997,0.000000,22.612797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.387997,0.000000,22.660419>}
box{<0,0,-0.304800><0.047622,0.035000,0.304800> rotate<0,90.000000,0> translate<10.387997,0.000000,22.660419> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.387997,0.000000,22.612797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.442000,0.000000,22.612797>}
box{<0,0,-0.304800><3.054003,0.035000,0.304800> rotate<0,0.000000,0> translate<10.387997,0.000000,22.612797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.400716,0.000000,19.034309>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.438797,0.000000,19.176431>}
box{<0,0,-0.304800><0.147135,0.035000,0.304800> rotate<0,-74.995122,0> translate<10.400716,0.000000,19.034309> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.400716,0.000000,20.765688>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.438797,0.000000,20.623566>}
box{<0,0,-0.304800><0.147135,0.035000,0.304800> rotate<0,74.995122,0> translate<10.400716,0.000000,20.765688> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.411244,0.000000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.395981,0.000000,20.726400>}
box{<0,0,-0.304800><2.984737,0.035000,0.304800> rotate<0,0.000000,0> translate<10.411244,0.000000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.416887,0.000000,25.152847>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.544309,0.000000,25.079281>}
box{<0,0,-0.304800><0.147133,0.035000,0.304800> rotate<0,29.997538,0> translate<10.416887,0.000000,25.152847> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.416887,0.000000,27.547150>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.544309,0.000000,27.620716>}
box{<0,0,-0.304800><0.147133,0.035000,0.304800> rotate<0,-29.997538,0> translate<10.416887,0.000000,27.547150> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.416887,0.000000,28.162847>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.544309,0.000000,28.089281>}
box{<0,0,-0.304800><0.147133,0.035000,0.304800> rotate<0,29.997538,0> translate<10.416887,0.000000,28.162847> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.416887,0.000000,30.557150>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.544309,0.000000,30.630716>}
box{<0,0,-0.304800><0.147133,0.035000,0.304800> rotate<0,-29.997538,0> translate<10.416887,0.000000,30.557150> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.438794,0.000000,19.920200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.438797,0.000000,20.623566>}
box{<0,0,-0.304800><0.703366,0.035000,0.304800> rotate<0,-89.993806,0> translate<10.438794,0.000000,19.920200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.438794,0.000000,20.116800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.391200,0.000000,20.116800>}
box{<0,0,-0.304800><2.952406,0.035000,0.304800> rotate<0,0.000000,0> translate<10.438794,0.000000,20.116800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.438797,0.000000,19.176431>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.438797,0.000000,19.879794>}
box{<0,0,-0.304800><0.703363,0.035000,0.304800> rotate<0,90.000000,0> translate<10.438797,0.000000,19.879794> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.438797,0.000000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.391197,0.000000,19.507200>}
box{<0,0,-0.304800><2.952400,0.035000,0.304800> rotate<0,0.000000,0> translate<10.438797,0.000000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.504669,0.000000,7.924800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.159197,0.000000,7.924800>}
box{<0,0,-0.304800><3.654528,0.035000,0.304800> rotate<0,0.000000,0> translate<10.504669,0.000000,7.924800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.544309,0.000000,25.079281>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.686431,0.000000,25.041200>}
box{<0,0,-0.304800><0.147135,0.035000,0.304800> rotate<0,14.998938,0> translate<10.544309,0.000000,25.079281> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.544309,0.000000,27.620716>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.686431,0.000000,27.658797>}
box{<0,0,-0.304800><0.147135,0.035000,0.304800> rotate<0,-14.998938,0> translate<10.544309,0.000000,27.620716> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.544309,0.000000,28.089281>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.686431,0.000000,28.051200>}
box{<0,0,-0.304800><0.147135,0.035000,0.304800> rotate<0,14.998938,0> translate<10.544309,0.000000,28.089281> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.544309,0.000000,30.630716>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.686431,0.000000,30.668797>}
box{<0,0,-0.304800><0.147135,0.035000,0.304800> rotate<0,-14.998938,0> translate<10.544309,0.000000,30.630716> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.686431,0.000000,25.041200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.389794,0.000000,25.041197>}
box{<0,0,-0.304800><0.703363,0.035000,0.304800> rotate<0,0.000255,0> translate<10.686431,0.000000,25.041200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.686431,0.000000,27.658797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.389794,0.000000,27.658794>}
box{<0,0,-0.304800><0.703363,0.035000,0.304800> rotate<0,0.000255,0> translate<10.686431,0.000000,27.658797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.686431,0.000000,28.051200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.389794,0.000000,28.051197>}
box{<0,0,-0.304800><0.703363,0.035000,0.304800> rotate<0,0.000255,0> translate<10.686431,0.000000,28.051200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.686431,0.000000,30.668797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.389794,0.000000,30.668794>}
box{<0,0,-0.304800><0.703363,0.035000,0.304800> rotate<0,0.000255,0> translate<10.686431,0.000000,30.668797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.980941,0.000000,5.149584>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.209584,0.000000,4.920941>}
box{<0,0,-0.304800><0.323351,0.035000,0.304800> rotate<0,44.997030,0> translate<10.980941,0.000000,5.149584> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.114269,0.000000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.446906,0.000000,7.315200>}
box{<0,0,-0.304800><3.332638,0.035000,0.304800> rotate<0,0.000000,0> translate<11.114269,0.000000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.209584,0.000000,4.920941>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.508322,0.000000,4.797200>}
box{<0,0,-0.304800><0.323351,0.035000,0.304800> rotate<0,22.498433,0> translate<11.209584,0.000000,4.920941> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.389778,0.000000,26.370200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.389778,0.000000,26.329794>}
box{<0,0,-0.304800><0.040406,0.035000,0.304800> rotate<0,-90.000000,0> translate<11.389778,0.000000,26.329794> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.389778,0.000000,29.380200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.389778,0.000000,29.339794>}
box{<0,0,-0.304800><0.040406,0.035000,0.304800> rotate<0,-90.000000,0> translate<11.389778,0.000000,29.339794> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.389794,0.000000,25.041197>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.389794,0.000000,26.329778>}
box{<0,0,-0.304800><1.288581,0.035000,0.304800> rotate<0,90.000000,0> translate<11.389794,0.000000,26.329778> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.389794,0.000000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.430200,0.000000,25.603200>}
box{<0,0,-0.304800><0.040406,0.035000,0.304800> rotate<0,0.000000,0> translate<11.389794,0.000000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.389794,0.000000,26.212800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.430200,0.000000,26.212800>}
box{<0,0,-0.304800><0.040406,0.035000,0.304800> rotate<0,0.000000,0> translate<11.389794,0.000000,26.212800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.389794,0.000000,26.329778>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.430200,0.000000,26.329778>}
box{<0,0,-0.304800><0.040406,0.035000,0.304800> rotate<0,0.000000,0> translate<11.389794,0.000000,26.329778> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.389794,0.000000,26.370219>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.389794,0.000000,27.658794>}
box{<0,0,-0.304800><1.288575,0.035000,0.304800> rotate<0,90.000000,0> translate<11.389794,0.000000,27.658794> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.389794,0.000000,26.370219>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.430200,0.000000,26.370219>}
box{<0,0,-0.304800><0.040406,0.035000,0.304800> rotate<0,0.000000,0> translate<11.389794,0.000000,26.370219> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.389794,0.000000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.430200,0.000000,26.822400>}
box{<0,0,-0.304800><0.040406,0.035000,0.304800> rotate<0,0.000000,0> translate<11.389794,0.000000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.389794,0.000000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.430200,0.000000,27.432000>}
box{<0,0,-0.304800><0.040406,0.035000,0.304800> rotate<0,0.000000,0> translate<11.389794,0.000000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.389794,0.000000,28.051197>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.389794,0.000000,29.339778>}
box{<0,0,-0.304800><1.288581,0.035000,0.304800> rotate<0,90.000000,0> translate<11.389794,0.000000,29.339778> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.389794,0.000000,28.651200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.430200,0.000000,28.651200>}
box{<0,0,-0.304800><0.040406,0.035000,0.304800> rotate<0,0.000000,0> translate<11.389794,0.000000,28.651200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.389794,0.000000,29.260800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.430200,0.000000,29.260800>}
box{<0,0,-0.304800><0.040406,0.035000,0.304800> rotate<0,0.000000,0> translate<11.389794,0.000000,29.260800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.389794,0.000000,29.339778>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.430200,0.000000,29.339778>}
box{<0,0,-0.304800><0.040406,0.035000,0.304800> rotate<0,0.000000,0> translate<11.389794,0.000000,29.339778> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.389794,0.000000,29.380219>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.389794,0.000000,30.668794>}
box{<0,0,-0.304800><1.288575,0.035000,0.304800> rotate<0,90.000000,0> translate<11.389794,0.000000,30.668794> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.389794,0.000000,29.380219>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.430200,0.000000,29.380219>}
box{<0,0,-0.304800><0.040406,0.035000,0.304800> rotate<0,0.000000,0> translate<11.389794,0.000000,29.380219> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.389794,0.000000,29.870400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.430200,0.000000,29.870400>}
box{<0,0,-0.304800><0.040406,0.035000,0.304800> rotate<0,0.000000,0> translate<11.389794,0.000000,29.870400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.389794,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.430200,0.000000,30.480000>}
box{<0,0,-0.304800><0.040406,0.035000,0.304800> rotate<0,0.000000,0> translate<11.389794,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.430200,0.000000,25.041200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.133566,0.000000,25.041200>}
box{<0,0,-0.304800><0.703366,0.035000,0.304800> rotate<0,0.000000,0> translate<11.430200,0.000000,25.041200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.430200,0.000000,26.329778>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.430200,0.000000,25.041200>}
box{<0,0,-0.304800><1.288578,0.035000,0.304800> rotate<0,-90.000000,0> translate<11.430200,0.000000,25.041200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.430200,0.000000,27.658797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.430200,0.000000,26.370219>}
box{<0,0,-0.304800><1.288578,0.035000,0.304800> rotate<0,-90.000000,0> translate<11.430200,0.000000,26.370219> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.430200,0.000000,27.658797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.133566,0.000000,27.658797>}
box{<0,0,-0.304800><0.703366,0.035000,0.304800> rotate<0,0.000000,0> translate<11.430200,0.000000,27.658797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.430200,0.000000,28.051200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.133566,0.000000,28.051200>}
box{<0,0,-0.304800><0.703366,0.035000,0.304800> rotate<0,0.000000,0> translate<11.430200,0.000000,28.051200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.430200,0.000000,29.339778>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.430200,0.000000,28.051200>}
box{<0,0,-0.304800><1.288578,0.035000,0.304800> rotate<0,-90.000000,0> translate<11.430200,0.000000,28.051200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.430200,0.000000,30.668797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.430200,0.000000,29.380219>}
box{<0,0,-0.304800><1.288578,0.035000,0.304800> rotate<0,-90.000000,0> translate<11.430200,0.000000,29.380219> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.430200,0.000000,30.668797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.133566,0.000000,30.668797>}
box{<0,0,-0.304800><0.703366,0.035000,0.304800> rotate<0,0.000000,0> translate<11.430200,0.000000,30.668797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.508322,0.000000,4.797200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.496753,0.000000,4.797200>}
box{<0,0,-0.304800><2.988431,0.035000,0.304800> rotate<0,0.000000,0> translate<11.508322,0.000000,4.797200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.723869,0.000000,6.705600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.779556,0.000000,6.705600>}
box{<0,0,-0.304800><3.055687,0.035000,0.304800> rotate<0,0.000000,0> translate<11.723869,0.000000,6.705600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.006672,0.000000,6.422797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.496753,0.000000,6.422797>}
box{<0,0,-0.304800><2.490081,0.035000,0.304800> rotate<0,0.000000,0> translate<12.006672,0.000000,6.422797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.127200,0.000000,13.068322>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.250941,0.000000,12.769584>}
box{<0,0,-0.304800><0.323351,0.035000,0.304800> rotate<0,67.495627,0> translate<12.127200,0.000000,13.068322> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.127200,0.000000,18.471675>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.127200,0.000000,13.068322>}
box{<0,0,-0.304800><5.403353,0.035000,0.304800> rotate<0,-90.000000,0> translate<12.127200,0.000000,13.068322> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.127200,0.000000,18.471675>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.250941,0.000000,18.770413>}
box{<0,0,-0.304800><0.323351,0.035000,0.304800> rotate<0,-67.495627,0> translate<12.127200,0.000000,18.471675> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.133566,0.000000,25.041200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.275688,0.000000,25.079281>}
box{<0,0,-0.304800><0.147135,0.035000,0.304800> rotate<0,-14.998938,0> translate<12.133566,0.000000,25.041200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.133566,0.000000,27.658797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.275688,0.000000,27.620716>}
box{<0,0,-0.304800><0.147135,0.035000,0.304800> rotate<0,14.998938,0> translate<12.133566,0.000000,27.658797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.133566,0.000000,28.051200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.275688,0.000000,28.089281>}
box{<0,0,-0.304800><0.147135,0.035000,0.304800> rotate<0,-14.998938,0> translate<12.133566,0.000000,28.051200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.133566,0.000000,30.668797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.275688,0.000000,30.630716>}
box{<0,0,-0.304800><0.147135,0.035000,0.304800> rotate<0,14.998938,0> translate<12.133566,0.000000,30.668797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.250941,0.000000,12.769584>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.210000,0.000000,10.810528>}
box{<0,0,-0.304800><2.770526,0.035000,0.304800> rotate<0,44.996984,0> translate<12.250941,0.000000,12.769584> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.250941,0.000000,18.770413>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.479584,0.000000,18.999056>}
box{<0,0,-0.304800><0.323351,0.035000,0.304800> rotate<0,-44.997030,0> translate<12.250941,0.000000,18.770413> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.275688,0.000000,25.079281>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.393994,0.000000,25.147588>}
box{<0,0,-0.304800><0.136609,0.035000,0.304800> rotate<0,-29.998785,0> translate<12.275688,0.000000,25.079281> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.275688,0.000000,27.620716>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.393994,0.000000,27.552409>}
box{<0,0,-0.304800><0.136609,0.035000,0.304800> rotate<0,29.998785,0> translate<12.275688,0.000000,27.620716> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.275688,0.000000,28.089281>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.393994,0.000000,28.157584>}
box{<0,0,-0.304800><0.136608,0.035000,0.304800> rotate<0,-29.997650,0> translate<12.275688,0.000000,28.089281> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.275688,0.000000,30.630716>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.393994,0.000000,30.562409>}
box{<0,0,-0.304800><0.136609,0.035000,0.304800> rotate<0,29.998785,0> translate<12.275688,0.000000,30.630716> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.393994,0.000000,25.147588>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.449578,0.000000,25.092000>}
box{<0,0,-0.304800><0.078610,0.035000,0.304800> rotate<0,44.998641,0> translate<12.393994,0.000000,25.147588> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.393994,0.000000,27.552409>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.449578,0.000000,27.607997>}
box{<0,0,-0.304800><0.078610,0.035000,0.304800> rotate<0,-44.998641,0> translate<12.393994,0.000000,27.552409> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.393994,0.000000,28.157584>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.449578,0.000000,28.102000>}
box{<0,0,-0.304800><0.078608,0.035000,0.304800> rotate<0,44.997030,0> translate<12.393994,0.000000,28.157584> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.393994,0.000000,30.562409>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.449578,0.000000,30.617997>}
box{<0,0,-0.304800><0.078610,0.035000,0.304800> rotate<0,-44.998641,0> translate<12.393994,0.000000,30.562409> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.449578,0.000000,25.092000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.170419,0.000000,25.092000>}
box{<0,0,-0.304800><1.720841,0.035000,0.304800> rotate<0,0.000000,0> translate<12.449578,0.000000,25.092000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.449578,0.000000,27.607997>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.418525,0.000000,27.607997>}
box{<0,0,-0.304800><0.968947,0.035000,0.304800> rotate<0,0.000000,0> translate<12.449578,0.000000,27.607997> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.449578,0.000000,28.102000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.418525,0.000000,28.102000>}
box{<0,0,-0.304800><0.968947,0.035000,0.304800> rotate<0,0.000000,0> translate<12.449578,0.000000,28.102000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.449578,0.000000,30.617997>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.170419,0.000000,30.617997>}
box{<0,0,-0.304800><1.720841,0.035000,0.304800> rotate<0,0.000000,0> translate<12.449578,0.000000,30.617997> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.479584,0.000000,18.999056>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.479588,0.000000,18.999056>}
box{<0,0,-0.304800><0.000003,0.035000,0.304800> rotate<0,0.000000,0> translate<12.479584,0.000000,18.999056> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.479588,0.000000,18.999056>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.724584,0.000000,19.244056>}
box{<0,0,-0.304800><0.346480,0.035000,0.304800> rotate<0,-44.997396,0> translate<12.479588,0.000000,18.999056> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.724584,0.000000,19.244056>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.023322,0.000000,19.367797>}
box{<0,0,-0.304800><0.323351,0.035000,0.304800> rotate<0,-22.498433,0> translate<12.724584,0.000000,19.244056> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.023322,0.000000,19.367797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.416291,0.000000,19.367797>}
box{<0,0,-0.304800><0.392969,0.035000,0.304800> rotate<0,0.000000,0> translate<13.023322,0.000000,19.367797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.391197,0.000000,20.084981>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.391200,0.000000,19.461431>}
box{<0,0,-0.304800><0.623550,0.035000,0.304800> rotate<0,89.993773,0> translate<13.391197,0.000000,20.084981> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.391197,0.000000,20.084981>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.949966,0.000000,20.084981>}
box{<0,0,-0.304800><1.558769,0.035000,0.304800> rotate<0,0.000000,0> translate<13.391197,0.000000,20.084981> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.391200,0.000000,19.461431>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.416291,0.000000,19.367797>}
box{<0,0,-0.304800><0.096938,0.035000,0.304800> rotate<0,74.994268,0> translate<13.391200,0.000000,19.461431> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.391200,0.000000,20.085013>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.949966,0.000000,20.085013>}
box{<0,0,-0.304800><1.558766,0.035000,0.304800> rotate<0,0.000000,0> translate<13.391200,0.000000,20.085013> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.391200,0.000000,20.708566>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.391200,0.000000,20.085013>}
box{<0,0,-0.304800><0.623553,0.035000,0.304800> rotate<0,-90.000000,0> translate<13.391200,0.000000,20.085013> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.391200,0.000000,20.708566>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.429281,0.000000,20.850687>}
box{<0,0,-0.304800><0.147135,0.035000,0.304800> rotate<0,-74.995122,0> translate<13.391200,0.000000,20.708566> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.418525,0.000000,27.607997>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.665528,0.000000,27.854997>}
box{<0,0,-0.304800><0.349313,0.035000,0.304800> rotate<0,-44.996668,0> translate<13.418525,0.000000,27.607997> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.418525,0.000000,28.102000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.665528,0.000000,27.854997>}
box{<0,0,-0.304800><0.349315,0.035000,0.304800> rotate<0,44.997030,0> translate<13.418525,0.000000,28.102000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.429281,0.000000,20.850687>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.442000,0.000000,20.872716>}
box{<0,0,-0.304800><0.025436,0.035000,0.304800> rotate<0,-59.994468,0> translate<13.429281,0.000000,20.850687> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.442000,0.000000,20.987200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.442000,0.000000,20.872716>}
box{<0,0,-0.304800><0.114484,0.035000,0.304800> rotate<0,-90.000000,0> translate<13.442000,0.000000,20.872716> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.442000,0.000000,23.905419>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.442000,0.000000,22.612797>}
box{<0,0,-0.304800><1.292622,0.035000,0.304800> rotate<0,-90.000000,0> translate<13.442000,0.000000,22.612797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.442000,0.000000,23.905419>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.739578,0.000000,24.202997>}
box{<0,0,-0.304800><0.420839,0.035000,0.304800> rotate<0,-44.997030,0> translate<13.442000,0.000000,23.905419> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.739578,0.000000,24.202997>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.160419,0.000000,24.202997>}
box{<0,0,-0.304800><2.420841,0.035000,0.304800> rotate<0,0.000000,0> translate<13.739578,0.000000,24.202997> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.752797,0.000000,13.566672>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.752797,0.000000,17.497000>}
box{<0,0,-0.304800><3.930328,0.035000,0.304800> rotate<0,90.000000,0> translate<13.752797,0.000000,17.497000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.752797,0.000000,13.566672>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.359469,0.000000,11.959997>}
box{<0,0,-0.304800><2.272179,0.035000,0.304800> rotate<0,44.997086,0> translate<13.752797,0.000000,13.566672> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.752797,0.000000,14.020800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.747200,0.000000,14.020800>}
box{<0,0,-0.304800><5.994403,0.035000,0.304800> rotate<0,0.000000,0> translate<13.752797,0.000000,14.020800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.752797,0.000000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.747200,0.000000,14.630400>}
box{<0,0,-0.304800><5.994403,0.035000,0.304800> rotate<0,0.000000,0> translate<13.752797,0.000000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.752797,0.000000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.747200,0.000000,15.240000>}
box{<0,0,-0.304800><5.994403,0.035000,0.304800> rotate<0,0.000000,0> translate<13.752797,0.000000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.752797,0.000000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.747200,0.000000,15.849600>}
box{<0,0,-0.304800><5.994403,0.035000,0.304800> rotate<0,0.000000,0> translate<13.752797,0.000000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.752797,0.000000,16.459200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.747200,0.000000,16.459200>}
box{<0,0,-0.304800><5.994403,0.035000,0.304800> rotate<0,0.000000,0> translate<13.752797,0.000000,16.459200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.752797,0.000000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.747200,0.000000,17.068800>}
box{<0,0,-0.304800><5.994403,0.035000,0.304800> rotate<0,0.000000,0> translate<13.752797,0.000000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.752797,0.000000,17.497000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.160419,0.000000,17.497000>}
box{<0,0,-0.304800><2.407622,0.035000,0.304800> rotate<0,0.000000,0> translate<13.752797,0.000000,17.497000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.908269,0.000000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.591731,0.000000,13.411200>}
box{<0,0,-0.304800><5.683463,0.035000,0.304800> rotate<0,0.000000,0> translate<13.908269,0.000000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.159197,0.000000,8.149981>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.159200,0.000000,7.602906>}
box{<0,0,-0.304800><0.547075,0.035000,0.304800> rotate<0,89.993733,0> translate<14.159197,0.000000,8.149981> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.159197,0.000000,8.149981>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.479966,0.000000,8.149981>}
box{<0,0,-0.304800><1.320769,0.035000,0.304800> rotate<0,0.000000,0> translate<14.159197,0.000000,8.149981> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.159200,0.000000,7.602906>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.918031,0.000000,6.844078>}
box{<0,0,-0.304800><1.073147,0.035000,0.304800> rotate<0,44.996912,0> translate<14.159200,0.000000,7.602906> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.159200,0.000000,8.150013>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.479966,0.000000,8.150013>}
box{<0,0,-0.304800><1.320766,0.035000,0.304800> rotate<0,0.000000,0> translate<14.159200,0.000000,8.150013> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.159200,0.000000,8.697091>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.159200,0.000000,8.150013>}
box{<0,0,-0.304800><0.547078,0.035000,0.304800> rotate<0,-90.000000,0> translate<14.159200,0.000000,8.150013> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.159200,0.000000,8.697091>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.918031,0.000000,9.455922>}
box{<0,0,-0.304800><1.073149,0.035000,0.304800> rotate<0,-44.997030,0> translate<14.159200,0.000000,8.697091> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.170419,0.000000,25.092000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.467997,0.000000,25.389578>}
box{<0,0,-0.304800><0.420839,0.035000,0.304800> rotate<0,-44.997030,0> translate<14.170419,0.000000,25.092000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.170419,0.000000,30.617997>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.467997,0.000000,30.320419>}
box{<0,0,-0.304800><0.420839,0.035000,0.304800> rotate<0,44.997030,0> translate<14.170419,0.000000,30.617997> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.210000,0.000000,2.543950>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.953950,0.000000,1.800000>}
box{<0,0,-0.304800><1.052104,0.035000,0.304800> rotate<0,44.997030,0> translate<14.210000,0.000000,2.543950> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.210000,0.000000,3.596047>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.210000,0.000000,2.543950>}
box{<0,0,-0.304800><1.052097,0.035000,0.304800> rotate<0,-90.000000,0> translate<14.210000,0.000000,2.543950> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.210000,0.000000,3.596047>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.953950,0.000000,4.339997>}
box{<0,0,-0.304800><1.052104,0.035000,0.304800> rotate<0,-44.997030,0> translate<14.210000,0.000000,3.596047> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.210000,0.000000,10.163950>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.918031,0.000000,9.455922>}
box{<0,0,-0.304800><1.001305,0.035000,0.304800> rotate<0,44.996904,0> translate<14.210000,0.000000,10.163950> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.210000,0.000000,10.810528>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.210000,0.000000,10.163950>}
box{<0,0,-0.304800><0.646578,0.035000,0.304800> rotate<0,-90.000000,0> translate<14.210000,0.000000,10.163950> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.308416,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.789603,0.000000,30.480000>}
box{<0,0,-0.304800><11.481188,0.035000,0.304800> rotate<0,0.000000,0> translate<14.308416,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.467997,0.000000,25.389578>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.467997,0.000000,26.358525>}
box{<0,0,-0.304800><0.968947,0.035000,0.304800> rotate<0,90.000000,0> translate<14.467997,0.000000,26.358525> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.467997,0.000000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.737200,0.000000,25.603200>}
box{<0,0,-0.304800><3.269203,0.035000,0.304800> rotate<0,0.000000,0> translate<14.467997,0.000000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.467997,0.000000,26.212800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.337725,0.000000,26.212800>}
box{<0,0,-0.304800><2.869728,0.035000,0.304800> rotate<0,0.000000,0> translate<14.467997,0.000000,26.212800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.467997,0.000000,26.358525>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.996672,0.000000,26.887200>}
box{<0,0,-0.304800><0.747659,0.035000,0.304800> rotate<0,-44.997030,0> translate<14.467997,0.000000,26.358525> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.467997,0.000000,29.351472>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.467997,0.000000,30.320419>}
box{<0,0,-0.304800><0.968947,0.035000,0.304800> rotate<0,90.000000,0> translate<14.467997,0.000000,30.320419> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.467997,0.000000,29.351472>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.306672,0.000000,28.512797>}
box{<0,0,-0.304800><1.186066,0.035000,0.304800> rotate<0,44.997030,0> translate<14.467997,0.000000,29.351472> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.467997,0.000000,29.870400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.532709,0.000000,29.870400>}
box{<0,0,-0.304800><11.064712,0.035000,0.304800> rotate<0,0.000000,0> translate<14.467997,0.000000,29.870400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.496753,0.000000,4.797200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.953950,0.000000,4.340000>}
box{<0,0,-0.304800><0.646576,0.035000,0.304800> rotate<0,44.997226,0> translate<14.496753,0.000000,4.797200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.496753,0.000000,6.422797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.918031,0.000000,6.844078>}
box{<0,0,-0.304800><0.595779,0.035000,0.304800> rotate<0,-44.997243,0> translate<14.496753,0.000000,6.422797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.517869,0.000000,12.801600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.982131,0.000000,12.801600>}
box{<0,0,-0.304800><4.464263,0.035000,0.304800> rotate<0,0.000000,0> translate<14.517869,0.000000,12.801600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.558669,0.000000,29.260800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.344672,0.000000,29.260800>}
box{<0,0,-0.304800><10.786003,0.035000,0.304800> rotate<0,0.000000,0> translate<14.558669,0.000000,29.260800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.931872,0.000000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.728125,0.000000,26.822400>}
box{<0,0,-0.304800><1.796253,0.035000,0.304800> rotate<0,0.000000,0> translate<14.931872,0.000000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.949966,0.000000,20.085013>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.949966,0.000000,20.084981>}
box{<0,0,-0.304800><0.000031,0.035000,0.304800> rotate<0,-90.000000,0> translate<14.949966,0.000000,20.084981> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.950031,0.000000,20.084981>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.950031,0.000000,20.085013>}
box{<0,0,-0.304800><0.000031,0.035000,0.304800> rotate<0,90.000000,0> translate<14.950031,0.000000,20.085013> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.950031,0.000000,20.084981>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.508794,0.000000,20.084981>}
box{<0,0,-0.304800><1.558763,0.035000,0.304800> rotate<0,0.000000,0> translate<14.950031,0.000000,20.084981> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.950031,0.000000,20.085013>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.508797,0.000000,20.085013>}
box{<0,0,-0.304800><1.558766,0.035000,0.304800> rotate<0,0.000000,0> translate<14.950031,0.000000,20.085013> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.953950,0.000000,1.800000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.006047,0.000000,1.800000>}
box{<0,0,-0.304800><1.052097,0.035000,0.304800> rotate<0,0.000000,0> translate<14.953950,0.000000,1.800000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.953950,0.000000,4.339997>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.006047,0.000000,4.339997>}
box{<0,0,-0.304800><1.052097,0.035000,0.304800> rotate<0,0.000000,0> translate<14.953950,0.000000,4.339997> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.953950,0.000000,4.340000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.006047,0.000000,4.340000>}
box{<0,0,-0.304800><1.052097,0.035000,0.304800> rotate<0,0.000000,0> translate<14.953950,0.000000,4.340000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.996672,0.000000,26.887200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.663325,0.000000,26.887200>}
box{<0,0,-0.304800><1.666653,0.035000,0.304800> rotate<0,0.000000,0> translate<14.996672,0.000000,26.887200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.127469,0.000000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.372531,0.000000,12.192000>}
box{<0,0,-0.304800><3.245063,0.035000,0.304800> rotate<0,0.000000,0> translate<15.127469,0.000000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.168269,0.000000,28.651200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.279997,0.000000,28.651200>}
box{<0,0,-0.304800><10.111728,0.035000,0.304800> rotate<0,0.000000,0> translate<15.168269,0.000000,28.651200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.306672,0.000000,28.512797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.161675,0.000000,28.512797>}
box{<0,0,-0.304800><1.855003,0.035000,0.304800> rotate<0,0.000000,0> translate<15.306672,0.000000,28.512797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.359469,0.000000,11.959997>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.006047,0.000000,11.959997>}
box{<0,0,-0.304800><0.646578,0.035000,0.304800> rotate<0,0.000000,0> translate<15.359469,0.000000,11.959997> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.479966,0.000000,8.150013>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.479966,0.000000,8.149981>}
box{<0,0,-0.304800><0.000031,0.035000,0.304800> rotate<0,-90.000000,0> translate<15.479966,0.000000,8.149981> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.006047,0.000000,1.800000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.749997,0.000000,2.543950>}
box{<0,0,-0.304800><1.052104,0.035000,0.304800> rotate<0,-44.997030,0> translate<16.006047,0.000000,1.800000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.006047,0.000000,4.339997>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.749997,0.000000,3.596047>}
box{<0,0,-0.304800><1.052104,0.035000,0.304800> rotate<0,44.997030,0> translate<16.006047,0.000000,4.339997> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.006047,0.000000,4.340000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.749997,0.000000,5.083950>}
box{<0,0,-0.304800><1.052104,0.035000,0.304800> rotate<0,-44.997030,0> translate<16.006047,0.000000,4.340000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.006047,0.000000,11.959997>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.749997,0.000000,11.216047>}
box{<0,0,-0.304800><1.052104,0.035000,0.304800> rotate<0,44.997030,0> translate<16.006047,0.000000,11.959997> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.034847,0.000000,1.828800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.465150,0.000000,1.828800>}
box{<0,0,-0.304800><1.430303,0.035000,0.304800> rotate<0,0.000000,0> translate<16.034847,0.000000,1.828800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.041966,0.000000,6.844078>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.749997,0.000000,6.136047>}
box{<0,0,-0.304800><1.001307,0.035000,0.304800> rotate<0,44.997030,0> translate<16.041966,0.000000,6.844078> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.041966,0.000000,6.844078>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.785922,0.000000,7.588031>}
box{<0,0,-0.304800><1.052111,0.035000,0.304800> rotate<0,-44.996910,0> translate<16.041966,0.000000,6.844078> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.041966,0.000000,9.455922>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.749997,0.000000,10.163950>}
box{<0,0,-0.304800><1.001305,0.035000,0.304800> rotate<0,-44.996904,0> translate<16.041966,0.000000,9.455922> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.041966,0.000000,9.455922>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.785922,0.000000,8.711966>}
box{<0,0,-0.304800><1.052113,0.035000,0.304800> rotate<0,44.997030,0> translate<16.041966,0.000000,9.455922> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.078844,0.000000,4.267200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.421153,0.000000,4.267200>}
box{<0,0,-0.304800><1.342309,0.035000,0.304800> rotate<0,0.000000,0> translate<16.078844,0.000000,4.267200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.160419,0.000000,17.497000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.457997,0.000000,17.794578>}
box{<0,0,-0.304800><0.420839,0.035000,0.304800> rotate<0,-44.997030,0> translate<16.160419,0.000000,17.497000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.160419,0.000000,24.202997>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.457997,0.000000,23.905419>}
box{<0,0,-0.304800><0.420839,0.035000,0.304800> rotate<0,44.997030,0> translate<16.160419,0.000000,24.202997> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.180444,0.000000,6.705600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.319553,0.000000,6.705600>}
box{<0,0,-0.304800><1.139109,0.035000,0.304800> rotate<0,0.000000,0> translate<16.180444,0.000000,6.705600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.339644,0.000000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.160350,0.000000,9.753600>}
box{<0,0,-0.304800><0.820706,0.035000,0.304800> rotate<0,0.000000,0> translate<16.339644,0.000000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.341819,0.000000,17.678400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.158178,0.000000,17.678400>}
box{<0,0,-0.304800><0.816359,0.035000,0.304800> rotate<0,0.000000,0> translate<16.341819,0.000000,17.678400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.353887,0.000000,9.144000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.217956,0.000000,9.144000>}
box{<0,0,-0.304800><0.864069,0.035000,0.304800> rotate<0,0.000000,0> translate<16.353887,0.000000,9.144000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.383644,0.000000,11.582400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.116353,0.000000,11.582400>}
box{<0,0,-0.304800><0.732709,0.035000,0.304800> rotate<0,0.000000,0> translate<16.383644,0.000000,11.582400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.453416,0.000000,22.379997>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.457997,0.000000,22.375419>}
box{<0,0,-0.304800><0.006477,0.035000,0.304800> rotate<0,44.977483,0> translate<16.453416,0.000000,22.379997> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.453416,0.000000,22.379997>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.457997,0.000000,22.384578>}
box{<0,0,-0.304800><0.006479,0.035000,0.304800> rotate<0,-44.997030,0> translate<16.453416,0.000000,22.379997> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.457997,0.000000,17.794578>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.457997,0.000000,19.297281>}
box{<0,0,-0.304800><1.502703,0.035000,0.304800> rotate<0,90.000000,0> translate<16.457997,0.000000,19.297281> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.457997,0.000000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.042000,0.000000,18.288000>}
box{<0,0,-0.304800><0.584003,0.035000,0.304800> rotate<0,0.000000,0> translate<16.457997,0.000000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.457997,0.000000,18.897600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.042000,0.000000,18.897600>}
box{<0,0,-0.304800><0.584003,0.035000,0.304800> rotate<0,0.000000,0> translate<16.457997,0.000000,18.897600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.457997,0.000000,19.297281>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.470716,0.000000,19.319309>}
box{<0,0,-0.304800><0.025436,0.035000,0.304800> rotate<0,-59.994468,0> translate<16.457997,0.000000,19.297281> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.457997,0.000000,20.872716>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.457997,0.000000,22.375419>}
box{<0,0,-0.304800><1.502703,0.035000,0.304800> rotate<0,90.000000,0> translate<16.457997,0.000000,22.375419> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.457997,0.000000,20.872716>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.470716,0.000000,20.850687>}
box{<0,0,-0.304800><0.025436,0.035000,0.304800> rotate<0,59.994468,0> translate<16.457997,0.000000,20.872716> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.457997,0.000000,21.336000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.042000,0.000000,21.336000>}
box{<0,0,-0.304800><0.584003,0.035000,0.304800> rotate<0,0.000000,0> translate<16.457997,0.000000,21.336000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.457997,0.000000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.042000,0.000000,21.945600>}
box{<0,0,-0.304800><0.584003,0.035000,0.304800> rotate<0,0.000000,0> translate<16.457997,0.000000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.457997,0.000000,22.384578>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.457997,0.000000,23.905419>}
box{<0,0,-0.304800><1.520841,0.035000,0.304800> rotate<0,90.000000,0> translate<16.457997,0.000000,23.905419> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.457997,0.000000,22.555200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.042000,0.000000,22.555200>}
box{<0,0,-0.304800><0.584003,0.035000,0.304800> rotate<0,0.000000,0> translate<16.457997,0.000000,22.555200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.457997,0.000000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.042000,0.000000,23.164800>}
box{<0,0,-0.304800><0.584003,0.035000,0.304800> rotate<0,0.000000,0> translate<16.457997,0.000000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.457997,0.000000,23.774400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.042000,0.000000,23.774400>}
box{<0,0,-0.304800><0.584003,0.035000,0.304800> rotate<0,0.000000,0> translate<16.457997,0.000000,23.774400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.470716,0.000000,19.319309>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.508797,0.000000,19.461431>}
box{<0,0,-0.304800><0.147135,0.035000,0.304800> rotate<0,-74.995122,0> translate<16.470716,0.000000,19.319309> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.470716,0.000000,20.850687>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.508797,0.000000,20.708566>}
box{<0,0,-0.304800><0.147135,0.035000,0.304800> rotate<0,74.995122,0> translate<16.470716,0.000000,20.850687> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.504019,0.000000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.042000,0.000000,20.726400>}
box{<0,0,-0.304800><0.537981,0.035000,0.304800> rotate<0,0.000000,0> translate<16.504019,0.000000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.508794,0.000000,20.084981>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.508797,0.000000,19.461431>}
box{<0,0,-0.304800><0.623550,0.035000,0.304800> rotate<0,89.993773,0> translate<16.508794,0.000000,20.084981> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.508797,0.000000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.042000,0.000000,19.507200>}
box{<0,0,-0.304800><0.533203,0.035000,0.304800> rotate<0,0.000000,0> translate<16.508797,0.000000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.508797,0.000000,20.085013>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.508797,0.000000,20.708566>}
box{<0,0,-0.304800><0.623553,0.035000,0.304800> rotate<0,90.000000,0> translate<16.508797,0.000000,20.708566> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.508797,0.000000,20.116800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.042000,0.000000,20.116800>}
box{<0,0,-0.304800><0.533203,0.035000,0.304800> rotate<0,0.000000,0> translate<16.508797,0.000000,20.116800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.513088,0.000000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.058750,0.000000,7.315200>}
box{<0,0,-0.304800><0.545662,0.035000,0.304800> rotate<0,0.000000,0> translate<16.513088,0.000000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.542847,0.000000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.957150,0.000000,4.876800>}
box{<0,0,-0.304800><0.414303,0.035000,0.304800> rotate<0,0.000000,0> translate<16.542847,0.000000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.644447,0.000000,2.438400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.855550,0.000000,2.438400>}
box{<0,0,-0.304800><0.211103,0.035000,0.304800> rotate<0,0.000000,0> translate<16.644447,0.000000,2.438400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.663325,0.000000,26.887200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.737200,0.000000,25.813325>}
box{<0,0,-0.304800><1.518689,0.035000,0.304800> rotate<0,44.997030,0> translate<16.663325,0.000000,26.887200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.688444,0.000000,3.657600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.811553,0.000000,3.657600>}
box{<0,0,-0.304800><0.123109,0.035000,0.304800> rotate<0,0.000000,0> translate<16.688444,0.000000,3.657600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.749997,0.000000,2.543950>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.749997,0.000000,3.596047>}
box{<0,0,-0.304800><1.052097,0.035000,0.304800> rotate<0,90.000000,0> translate<16.749997,0.000000,3.596047> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.749997,0.000000,3.048000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.750000,0.000000,3.048000>}
box{<0,0,-0.304800><0.000003,0.035000,0.304800> rotate<0,0.000000,0> translate<16.749997,0.000000,3.048000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.749997,0.000000,5.083950>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.749997,0.000000,6.136047>}
box{<0,0,-0.304800><1.052097,0.035000,0.304800> rotate<0,90.000000,0> translate<16.749997,0.000000,6.136047> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.749997,0.000000,5.486400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.750000,0.000000,5.486400>}
box{<0,0,-0.304800><0.000003,0.035000,0.304800> rotate<0,0.000000,0> translate<16.749997,0.000000,5.486400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.749997,0.000000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.750000,0.000000,6.096000>}
box{<0,0,-0.304800><0.000003,0.035000,0.304800> rotate<0,0.000000,0> translate<16.749997,0.000000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.749997,0.000000,10.163950>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.749997,0.000000,11.216047>}
box{<0,0,-0.304800><1.052097,0.035000,0.304800> rotate<0,90.000000,0> translate<16.749997,0.000000,11.216047> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.749997,0.000000,10.363200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.750000,0.000000,10.363200>}
box{<0,0,-0.304800><0.000003,0.035000,0.304800> rotate<0,0.000000,0> translate<16.749997,0.000000,10.363200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.749997,0.000000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.750000,0.000000,10.972800>}
box{<0,0,-0.304800><0.000003,0.035000,0.304800> rotate<0,0.000000,0> translate<16.749997,0.000000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.750000,0.000000,2.543950>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.493950,0.000000,1.800000>}
box{<0,0,-0.304800><1.052104,0.035000,0.304800> rotate<0,44.997030,0> translate<16.750000,0.000000,2.543950> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.750000,0.000000,3.596047>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.750000,0.000000,2.543950>}
box{<0,0,-0.304800><1.052097,0.035000,0.304800> rotate<0,-90.000000,0> translate<16.750000,0.000000,2.543950> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.750000,0.000000,3.596047>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.493950,0.000000,4.339997>}
box{<0,0,-0.304800><1.052104,0.035000,0.304800> rotate<0,-44.997030,0> translate<16.750000,0.000000,3.596047> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.750000,0.000000,5.083950>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.493950,0.000000,4.340000>}
box{<0,0,-0.304800><1.052104,0.035000,0.304800> rotate<0,44.997030,0> translate<16.750000,0.000000,5.083950> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.750000,0.000000,6.136047>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.750000,0.000000,5.083950>}
box{<0,0,-0.304800><1.052097,0.035000,0.304800> rotate<0,-90.000000,0> translate<16.750000,0.000000,5.083950> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.750000,0.000000,6.136047>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.493950,0.000000,6.879997>}
box{<0,0,-0.304800><1.052104,0.035000,0.304800> rotate<0,-44.997030,0> translate<16.750000,0.000000,6.136047> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.750000,0.000000,10.163950>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.493950,0.000000,9.420000>}
box{<0,0,-0.304800><1.052104,0.035000,0.304800> rotate<0,44.997030,0> translate<16.750000,0.000000,10.163950> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.750000,0.000000,11.216047>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.750000,0.000000,10.163950>}
box{<0,0,-0.304800><1.052097,0.035000,0.304800> rotate<0,-90.000000,0> translate<16.750000,0.000000,10.163950> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.750000,0.000000,11.216047>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.493950,0.000000,11.959997>}
box{<0,0,-0.304800><1.052104,0.035000,0.304800> rotate<0,-44.997030,0> translate<16.750000,0.000000,11.216047> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.785922,0.000000,7.588031>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.493950,0.000000,6.880000>}
box{<0,0,-0.304800><1.001305,0.035000,0.304800> rotate<0,44.997157,0> translate<16.785922,0.000000,7.588031> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.785922,0.000000,8.711966>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.493950,0.000000,9.419997>}
box{<0,0,-0.304800><1.001305,0.035000,0.304800> rotate<0,-44.997157,0> translate<16.785922,0.000000,8.711966> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.042000,0.000000,17.794578>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.339578,0.000000,17.497000>}
box{<0,0,-0.304800><0.420839,0.035000,0.304800> rotate<0,44.997030,0> translate<17.042000,0.000000,17.794578> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.042000,0.000000,19.315419>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.042000,0.000000,17.794578>}
box{<0,0,-0.304800><1.520841,0.035000,0.304800> rotate<0,-90.000000,0> translate<17.042000,0.000000,17.794578> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.042000,0.000000,19.315419>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.046581,0.000000,19.320000>}
box{<0,0,-0.304800><0.006479,0.035000,0.304800> rotate<0,-44.997030,0> translate<17.042000,0.000000,19.315419> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.042000,0.000000,19.324578>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.046581,0.000000,19.320000>}
box{<0,0,-0.304800><0.006477,0.035000,0.304800> rotate<0,44.977483,0> translate<17.042000,0.000000,19.324578> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.042000,0.000000,20.845419>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.042000,0.000000,19.324578>}
box{<0,0,-0.304800><1.520841,0.035000,0.304800> rotate<0,-90.000000,0> translate<17.042000,0.000000,19.324578> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.042000,0.000000,20.845419>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.046581,0.000000,20.849997>}
box{<0,0,-0.304800><0.006477,0.035000,0.304800> rotate<0,-44.977483,0> translate<17.042000,0.000000,20.845419> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.042000,0.000000,20.854578>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.046581,0.000000,20.849997>}
box{<0,0,-0.304800><0.006479,0.035000,0.304800> rotate<0,44.997030,0> translate<17.042000,0.000000,20.854578> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.042000,0.000000,22.375419>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.042000,0.000000,20.854578>}
box{<0,0,-0.304800><1.520841,0.035000,0.304800> rotate<0,-90.000000,0> translate<17.042000,0.000000,20.854578> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.042000,0.000000,22.375419>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.046581,0.000000,22.379997>}
box{<0,0,-0.304800><0.006477,0.035000,0.304800> rotate<0,-44.977483,0> translate<17.042000,0.000000,22.375419> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.042000,0.000000,22.384578>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.046581,0.000000,22.379997>}
box{<0,0,-0.304800><0.006479,0.035000,0.304800> rotate<0,44.997030,0> translate<17.042000,0.000000,22.384578> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.042000,0.000000,23.905419>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.042000,0.000000,22.384578>}
box{<0,0,-0.304800><1.520841,0.035000,0.304800> rotate<0,-90.000000,0> translate<17.042000,0.000000,22.384578> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.042000,0.000000,23.905419>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.339578,0.000000,24.202997>}
box{<0,0,-0.304800><0.420839,0.035000,0.304800> rotate<0,-44.997030,0> translate<17.042000,0.000000,23.905419> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.161675,0.000000,28.512797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.460413,0.000000,28.389056>}
box{<0,0,-0.304800><0.323351,0.035000,0.304800> rotate<0,22.498433,0> translate<17.161675,0.000000,28.512797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.339578,0.000000,17.497000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.747200,0.000000,17.497000>}
box{<0,0,-0.304800><2.407622,0.035000,0.304800> rotate<0,0.000000,0> translate<17.339578,0.000000,17.497000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.339578,0.000000,24.202997>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.737200,0.000000,24.202997>}
box{<0,0,-0.304800><0.397622,0.035000,0.304800> rotate<0,0.000000,0> translate<17.339578,0.000000,24.202997> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.460413,0.000000,28.389056>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.689056,0.000000,28.160412>}
box{<0,0,-0.304800><0.323351,0.035000,0.304800> rotate<0,44.997030,0> translate<17.460413,0.000000,28.389056> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.493950,0.000000,1.800000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.546047,0.000000,1.800000>}
box{<0,0,-0.304800><1.052097,0.035000,0.304800> rotate<0,0.000000,0> translate<17.493950,0.000000,1.800000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.493950,0.000000,4.339997>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.546047,0.000000,4.339997>}
box{<0,0,-0.304800><1.052097,0.035000,0.304800> rotate<0,0.000000,0> translate<17.493950,0.000000,4.339997> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.493950,0.000000,4.340000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.546047,0.000000,4.340000>}
box{<0,0,-0.304800><1.052097,0.035000,0.304800> rotate<0,0.000000,0> translate<17.493950,0.000000,4.340000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.493950,0.000000,6.879997>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.546047,0.000000,6.879997>}
box{<0,0,-0.304800><1.052097,0.035000,0.304800> rotate<0,0.000000,0> translate<17.493950,0.000000,6.879997> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.493950,0.000000,6.880000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.546047,0.000000,6.880000>}
box{<0,0,-0.304800><1.052097,0.035000,0.304800> rotate<0,0.000000,0> translate<17.493950,0.000000,6.880000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.493950,0.000000,9.419997>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.546047,0.000000,9.419997>}
box{<0,0,-0.304800><1.052097,0.035000,0.304800> rotate<0,0.000000,0> translate<17.493950,0.000000,9.419997> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.493950,0.000000,9.420000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.546047,0.000000,9.420000>}
box{<0,0,-0.304800><1.052097,0.035000,0.304800> rotate<0,0.000000,0> translate<17.493950,0.000000,9.420000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.493950,0.000000,11.959997>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.140528,0.000000,11.959997>}
box{<0,0,-0.304800><0.646578,0.035000,0.304800> rotate<0,0.000000,0> translate<17.493950,0.000000,11.959997> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.689056,0.000000,28.160412>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.239056,0.000000,26.610413>}
box{<0,0,-0.304800><2.192031,0.035000,0.304800> rotate<0,44.997030,0> translate<17.689056,0.000000,28.160412> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.737200,0.000000,25.813325>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.737200,0.000000,24.202997>}
box{<0,0,-0.304800><1.610328,0.035000,0.304800> rotate<0,-90.000000,0> translate<17.737200,0.000000,24.202997> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.807869,0.000000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.279997,0.000000,28.041600>}
box{<0,0,-0.304800><7.472128,0.035000,0.304800> rotate<0,0.000000,0> translate<17.807869,0.000000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.140528,0.000000,11.959997>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.747200,0.000000,13.566672>}
box{<0,0,-0.304800><2.272179,0.035000,0.304800> rotate<0,-44.997086,0> translate<18.140528,0.000000,11.959997> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.417469,0.000000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.377734,0.000000,27.432000>}
box{<0,0,-0.304800><6.960266,0.035000,0.304800> rotate<0,0.000000,0> translate<18.417469,0.000000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.546047,0.000000,1.800000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.003247,0.000000,2.257200>}
box{<0,0,-0.304800><0.646578,0.035000,0.304800> rotate<0,-44.997030,0> translate<18.546047,0.000000,1.800000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.546047,0.000000,4.339997>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.003247,0.000000,3.882797>}
box{<0,0,-0.304800><0.646578,0.035000,0.304800> rotate<0,44.997030,0> translate<18.546047,0.000000,4.339997> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.546047,0.000000,4.340000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.003247,0.000000,4.797200>}
box{<0,0,-0.304800><0.646578,0.035000,0.304800> rotate<0,-44.997030,0> translate<18.546047,0.000000,4.340000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.546047,0.000000,6.879997>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.003247,0.000000,6.422797>}
box{<0,0,-0.304800><0.646578,0.035000,0.304800> rotate<0,44.997030,0> translate<18.546047,0.000000,6.879997> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.546047,0.000000,6.880000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.003247,0.000000,7.337200>}
box{<0,0,-0.304800><0.646578,0.035000,0.304800> rotate<0,-44.997030,0> translate<18.546047,0.000000,6.880000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.546047,0.000000,9.419997>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.003247,0.000000,8.962797>}
box{<0,0,-0.304800><0.646578,0.035000,0.304800> rotate<0,44.997030,0> translate<18.546047,0.000000,9.419997> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.546047,0.000000,9.420000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.289997,0.000000,10.163950>}
box{<0,0,-0.304800><1.052104,0.035000,0.304800> rotate<0,-44.997030,0> translate<18.546047,0.000000,9.420000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.574847,0.000000,1.828800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.919956,0.000000,1.828800>}
box{<0,0,-0.304800><7.345109,0.035000,0.304800> rotate<0,0.000000,0> translate<18.574847,0.000000,1.828800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.618844,0.000000,4.267200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.287731,0.000000,4.267200>}
box{<0,0,-0.304800><2.668888,0.035000,0.304800> rotate<0,0.000000,0> translate<18.618844,0.000000,4.267200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.720444,0.000000,6.705600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.986131,0.000000,6.705600>}
box{<0,0,-0.304800><3.265687,0.035000,0.304800> rotate<0,0.000000,0> translate<18.720444,0.000000,6.705600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.822044,0.000000,9.144000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.684531,0.000000,9.144000>}
box{<0,0,-0.304800><3.862488,0.035000,0.304800> rotate<0,0.000000,0> translate<18.822044,0.000000,9.144000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.879647,0.000000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.294131,0.000000,9.753600>}
box{<0,0,-0.304800><4.414484,0.035000,0.304800> rotate<0,0.000000,0> translate<18.879647,0.000000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.981247,0.000000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.595731,0.000000,7.315200>}
box{<0,0,-0.304800><3.614484,0.035000,0.304800> rotate<0,0.000000,0> translate<18.981247,0.000000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.003247,0.000000,2.257200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.401675,0.000000,2.257200>}
box{<0,0,-0.304800><2.398428,0.035000,0.304800> rotate<0,0.000000,0> translate<19.003247,0.000000,2.257200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.003247,0.000000,3.882797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.903325,0.000000,3.882797>}
box{<0,0,-0.304800><1.900078,0.035000,0.304800> rotate<0,0.000000,0> translate<19.003247,0.000000,3.882797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.003247,0.000000,4.797200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.817731,0.000000,4.797200>}
box{<0,0,-0.304800><2.814484,0.035000,0.304800> rotate<0,0.000000,0> translate<19.003247,0.000000,4.797200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.003247,0.000000,6.422797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.703325,0.000000,6.422797>}
box{<0,0,-0.304800><2.700078,0.035000,0.304800> rotate<0,0.000000,0> translate<19.003247,0.000000,6.422797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.003247,0.000000,7.337200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.617731,0.000000,7.337200>}
box{<0,0,-0.304800><3.614484,0.035000,0.304800> rotate<0,0.000000,0> translate<19.003247,0.000000,7.337200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.003247,0.000000,8.962797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.503328,0.000000,8.962797>}
box{<0,0,-0.304800><3.500081,0.035000,0.304800> rotate<0,0.000000,0> translate<19.003247,0.000000,8.962797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.027069,0.000000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.565772,0.000000,26.822400>}
box{<0,0,-0.304800><6.538703,0.035000,0.304800> rotate<0,0.000000,0> translate<19.027069,0.000000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.239056,0.000000,26.610413>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.362797,0.000000,26.311675>}
box{<0,0,-0.304800><0.323351,0.035000,0.304800> rotate<0,67.495627,0> translate<19.239056,0.000000,26.610413> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.289997,0.000000,10.163950>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.289997,0.000000,10.810528>}
box{<0,0,-0.304800><0.646578,0.035000,0.304800> rotate<0,90.000000,0> translate<19.289997,0.000000,10.810528> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.289997,0.000000,10.363200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.903731,0.000000,10.363200>}
box{<0,0,-0.304800><4.613734,0.035000,0.304800> rotate<0,0.000000,0> translate<19.289997,0.000000,10.363200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.289997,0.000000,10.810528>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.249056,0.000000,12.769584>}
box{<0,0,-0.304800><2.770526,0.035000,0.304800> rotate<0,-44.996984,0> translate<19.289997,0.000000,10.810528> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.362797,0.000000,24.202997>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.362797,0.000000,26.311675>}
box{<0,0,-0.304800><2.108678,0.035000,0.304800> rotate<0,90.000000,0> translate<19.362797,0.000000,26.311675> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.362797,0.000000,24.202997>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.760419,0.000000,24.202997>}
box{<0,0,-0.304800><0.397622,0.035000,0.304800> rotate<0,0.000000,0> translate<19.362797,0.000000,24.202997> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.362797,0.000000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.008016,0.000000,24.384000>}
box{<0,0,-0.304800><8.645219,0.035000,0.304800> rotate<0,0.000000,0> translate<19.362797,0.000000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.362797,0.000000,24.993600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.942737,0.000000,24.993600>}
box{<0,0,-0.304800><7.579941,0.035000,0.304800> rotate<0,0.000000,0> translate<19.362797,0.000000,24.993600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.362797,0.000000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.278306,0.000000,25.603200>}
box{<0,0,-0.304800><6.915509,0.035000,0.304800> rotate<0,0.000000,0> translate<19.362797,0.000000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.362797,0.000000,26.212800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.862687,0.000000,26.212800>}
box{<0,0,-0.304800><6.499891,0.035000,0.304800> rotate<0,0.000000,0> translate<19.362797,0.000000,26.212800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.452269,0.000000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.513331,0.000000,10.972800>}
box{<0,0,-0.304800><5.061062,0.035000,0.304800> rotate<0,0.000000,0> translate<19.452269,0.000000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.747200,0.000000,17.497000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.747200,0.000000,13.566672>}
box{<0,0,-0.304800><3.930328,0.035000,0.304800> rotate<0,-90.000000,0> translate<19.747200,0.000000,13.566672> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.760419,0.000000,24.202997>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.005616,0.000000,23.957797>}
box{<0,0,-0.304800><0.346763,0.035000,0.304800> rotate<0,44.997395,0> translate<19.760419,0.000000,24.202997> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.005616,0.000000,23.957797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.586675,0.000000,23.957797>}
box{<0,0,-0.304800><8.581059,0.035000,0.304800> rotate<0,0.000000,0> translate<20.005616,0.000000,23.957797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.061869,0.000000,11.582400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.122931,0.000000,11.582400>}
box{<0,0,-0.304800><5.061062,0.035000,0.304800> rotate<0,0.000000,0> translate<20.061869,0.000000,11.582400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.671469,0.000000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.732531,0.000000,12.192000>}
box{<0,0,-0.304800><5.061062,0.035000,0.304800> rotate<0,0.000000,0> translate<20.671469,0.000000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.707459,0.000000,19.272200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.775413,0.000000,19.244056>}
box{<0,0,-0.304800><0.073551,0.035000,0.304800> rotate<0,22.496100,0> translate<20.707459,0.000000,19.272200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.707459,0.000000,19.272200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.842000,0.000000,19.272200>}
box{<0,0,-0.304800><1.134541,0.035000,0.304800> rotate<0,0.000000,0> translate<20.707459,0.000000,19.272200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.775413,0.000000,19.244056>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.020413,0.000000,18.999056>}
box{<0,0,-0.304800><0.346482,0.035000,0.304800> rotate<0,44.997030,0> translate<20.775413,0.000000,19.244056> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.903325,0.000000,3.882797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.817731,0.000000,4.797200>}
box{<0,0,-0.304800><1.293164,0.035000,0.304800> rotate<0,-44.996932,0> translate<20.903325,0.000000,3.882797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.020413,0.000000,18.999056>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.249056,0.000000,18.770413>}
box{<0,0,-0.304800><0.323351,0.035000,0.304800> rotate<0,44.997030,0> translate<21.020413,0.000000,18.999056> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.121869,0.000000,18.897600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.842000,0.000000,18.897600>}
box{<0,0,-0.304800><0.720131,0.035000,0.304800> rotate<0,0.000000,0> translate<21.121869,0.000000,18.897600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.249056,0.000000,12.769584>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.372797,0.000000,13.068322>}
box{<0,0,-0.304800><0.323351,0.035000,0.304800> rotate<0,-67.495627,0> translate<21.249056,0.000000,12.769584> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.249056,0.000000,18.770413>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.372797,0.000000,18.471675>}
box{<0,0,-0.304800><0.323351,0.035000,0.304800> rotate<0,67.495627,0> translate<21.249056,0.000000,18.770413> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.262316,0.000000,12.801600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.342131,0.000000,12.801600>}
box{<0,0,-0.304800><5.079816,0.035000,0.304800> rotate<0,0.000000,0> translate<21.262316,0.000000,12.801600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.372797,0.000000,13.068322>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.372797,0.000000,18.471675>}
box{<0,0,-0.304800><5.403353,0.035000,0.304800> rotate<0,90.000000,0> translate<21.372797,0.000000,18.471675> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.372797,0.000000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.951731,0.000000,13.411200>}
box{<0,0,-0.304800><5.578934,0.035000,0.304800> rotate<0,0.000000,0> translate<21.372797,0.000000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.372797,0.000000,14.020800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.367200,0.000000,14.020800>}
box{<0,0,-0.304800><5.994403,0.035000,0.304800> rotate<0,0.000000,0> translate<21.372797,0.000000,14.020800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.372797,0.000000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.367200,0.000000,14.630400>}
box{<0,0,-0.304800><5.994403,0.035000,0.304800> rotate<0,0.000000,0> translate<21.372797,0.000000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.372797,0.000000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.367200,0.000000,15.240000>}
box{<0,0,-0.304800><5.994403,0.035000,0.304800> rotate<0,0.000000,0> translate<21.372797,0.000000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.372797,0.000000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.367200,0.000000,15.849600>}
box{<0,0,-0.304800><5.994403,0.035000,0.304800> rotate<0,0.000000,0> translate<21.372797,0.000000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.372797,0.000000,16.459200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.849550,0.000000,16.459200>}
box{<0,0,-0.304800><0.476753,0.035000,0.304800> rotate<0,0.000000,0> translate<21.372797,0.000000,16.459200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.372797,0.000000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.791200,0.000000,17.068800>}
box{<0,0,-0.304800><0.418403,0.035000,0.304800> rotate<0,0.000000,0> translate<21.372797,0.000000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.372797,0.000000,17.678400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.791200,0.000000,17.678400>}
box{<0,0,-0.304800><0.418403,0.035000,0.304800> rotate<0,0.000000,0> translate<21.372797,0.000000,17.678400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.372797,0.000000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.865259,0.000000,18.288000>}
box{<0,0,-0.304800><0.492462,0.035000,0.304800> rotate<0,0.000000,0> translate<21.372797,0.000000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.401675,0.000000,2.257200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.700413,0.000000,2.380941>}
box{<0,0,-0.304800><0.323351,0.035000,0.304800> rotate<0,-22.498433,0> translate<21.401675,0.000000,2.257200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.700413,0.000000,2.380941>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.929056,0.000000,2.609584>}
box{<0,0,-0.304800><0.323351,0.035000,0.304800> rotate<0,-44.997030,0> translate<21.700413,0.000000,2.380941> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.703325,0.000000,6.422797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.617731,0.000000,7.337200>}
box{<0,0,-0.304800><1.293164,0.035000,0.304800> rotate<0,-44.996932,0> translate<21.703325,0.000000,6.422797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.757872,0.000000,2.438400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.591681,0.000000,2.438400>}
box{<0,0,-0.304800><3.833809,0.035000,0.304800> rotate<0,0.000000,0> translate<21.757872,0.000000,2.438400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.791197,0.000000,17.380200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.791200,0.000000,18.083566>}
box{<0,0,-0.304800><0.703366,0.035000,0.304800> rotate<0,-89.993806,0> translate<21.791197,0.000000,17.380200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.791197,0.000000,17.380200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.079778,0.000000,17.380200>}
box{<0,0,-0.304800><1.288581,0.035000,0.304800> rotate<0,0.000000,0> translate<21.791197,0.000000,17.380200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.791200,0.000000,16.636431>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.829281,0.000000,16.494309>}
box{<0,0,-0.304800><0.147135,0.035000,0.304800> rotate<0,74.995122,0> translate<21.791200,0.000000,16.636431> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.791200,0.000000,17.339794>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.791200,0.000000,16.636431>}
box{<0,0,-0.304800><0.703363,0.035000,0.304800> rotate<0,-90.000000,0> translate<21.791200,0.000000,16.636431> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.791200,0.000000,17.339794>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.079778,0.000000,17.339794>}
box{<0,0,-0.304800><1.288578,0.035000,0.304800> rotate<0,0.000000,0> translate<21.791200,0.000000,17.339794> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.791200,0.000000,18.083566>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.829281,0.000000,18.225687>}
box{<0,0,-0.304800><0.147135,0.035000,0.304800> rotate<0,-74.995122,0> translate<21.791200,0.000000,18.083566> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.829281,0.000000,16.494309>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.902847,0.000000,16.366888>}
box{<0,0,-0.304800><0.147133,0.035000,0.304800> rotate<0,59.996522,0> translate<21.829281,0.000000,16.494309> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.829281,0.000000,18.225687>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.897584,0.000000,18.343994>}
box{<0,0,-0.304800><0.136608,0.035000,0.304800> rotate<0,-59.996411,0> translate<21.829281,0.000000,18.225687> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.842000,0.000000,18.399578>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.897584,0.000000,18.343994>}
box{<0,0,-0.304800><0.078608,0.035000,0.304800> rotate<0,44.997030,0> translate<21.842000,0.000000,18.399578> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.842000,0.000000,19.272200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.842000,0.000000,18.399578>}
box{<0,0,-0.304800><0.872622,0.035000,0.304800> rotate<0,-90.000000,0> translate<21.842000,0.000000,18.399578> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.902847,0.000000,16.366888>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.006888,0.000000,16.262847>}
box{<0,0,-0.304800><0.147136,0.035000,0.304800> rotate<0,44.997030,0> translate<21.902847,0.000000,16.366888> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.929056,0.000000,2.609584>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.929056,0.000000,2.609587>}
box{<0,0,-0.304800><0.000003,0.035000,0.304800> rotate<0,90.000000,0> translate<21.929056,0.000000,2.609587> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.929056,0.000000,2.609587>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.409056,0.000000,12.089584>}
box{<0,0,-0.304800><13.406742,0.035000,0.304800> rotate<0,-44.997021,0> translate<21.929056,0.000000,2.609587> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.006888,0.000000,16.262847>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.134309,0.000000,16.189281>}
box{<0,0,-0.304800><0.147133,0.035000,0.304800> rotate<0,29.997538,0> translate<22.006888,0.000000,16.262847> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.134309,0.000000,16.189281>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.276431,0.000000,16.151200>}
box{<0,0,-0.304800><0.147135,0.035000,0.304800> rotate<0,14.998938,0> translate<22.134309,0.000000,16.189281> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.276431,0.000000,16.151200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.079794,0.000000,16.151197>}
box{<0,0,-0.304800><0.803363,0.035000,0.304800> rotate<0,0.000223,0> translate<22.276431,0.000000,16.151200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.367469,0.000000,3.048000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.403644,0.000000,3.048000>}
box{<0,0,-0.304800><3.036175,0.035000,0.304800> rotate<0,0.000000,0> translate<22.367469,0.000000,3.048000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.503328,0.000000,8.962797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.367200,0.000000,13.826672>}
box{<0,0,-0.304800><6.878556,0.035000,0.304800> rotate<0,-44.997049,0> translate<22.503328,0.000000,8.962797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.977069,0.000000,3.657600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.279997,0.000000,3.657600>}
box{<0,0,-0.304800><2.302928,0.035000,0.304800> rotate<0,0.000000,0> translate<22.977069,0.000000,3.657600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.079778,0.000000,17.380200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.079778,0.000000,17.339794>}
box{<0,0,-0.304800><0.040406,0.035000,0.304800> rotate<0,-90.000000,0> translate<23.079778,0.000000,17.339794> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.079794,0.000000,16.151197>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.079794,0.000000,17.339778>}
box{<0,0,-0.304800><1.188581,0.035000,0.304800> rotate<0,90.000000,0> translate<23.079794,0.000000,17.339778> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.079794,0.000000,16.459200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.120200,0.000000,16.459200>}
box{<0,0,-0.304800><0.040406,0.035000,0.304800> rotate<0,0.000000,0> translate<23.079794,0.000000,16.459200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.079794,0.000000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.120200,0.000000,17.068800>}
box{<0,0,-0.304800><0.040406,0.035000,0.304800> rotate<0,0.000000,0> translate<23.079794,0.000000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.079794,0.000000,17.339778>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.120200,0.000000,17.339778>}
box{<0,0,-0.304800><0.040406,0.035000,0.304800> rotate<0,0.000000,0> translate<23.079794,0.000000,17.339778> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.120200,0.000000,16.151200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.923566,0.000000,16.151200>}
box{<0,0,-0.304800><0.803366,0.035000,0.304800> rotate<0,0.000000,0> translate<23.120200,0.000000,16.151200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.120200,0.000000,17.339778>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.120200,0.000000,16.151200>}
box{<0,0,-0.304800><1.188578,0.035000,0.304800> rotate<0,-90.000000,0> translate<23.120200,0.000000,16.151200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.120219,0.000000,17.339794>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.120219,0.000000,17.380200>}
box{<0,0,-0.304800><0.040406,0.035000,0.304800> rotate<0,90.000000,0> translate<23.120219,0.000000,17.380200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.120219,0.000000,17.339794>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.281200,0.000000,17.339794>}
box{<0,0,-0.304800><1.160981,0.035000,0.304800> rotate<0,0.000000,0> translate<23.120219,0.000000,17.339794> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.120219,0.000000,17.380200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.619778,0.000000,17.380200>}
box{<0,0,-0.304800><2.499559,0.035000,0.304800> rotate<0,0.000000,0> translate<23.120219,0.000000,17.380200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.586669,0.000000,4.267200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.279997,0.000000,4.267200>}
box{<0,0,-0.304800><1.693328,0.035000,0.304800> rotate<0,0.000000,0> translate<23.586669,0.000000,4.267200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.923566,0.000000,16.151200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.065688,0.000000,16.189281>}
box{<0,0,-0.304800><0.147135,0.035000,0.304800> rotate<0,-14.998938,0> translate<23.923566,0.000000,16.151200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.065688,0.000000,16.189281>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.193109,0.000000,16.262847>}
box{<0,0,-0.304800><0.147133,0.035000,0.304800> rotate<0,-29.997538,0> translate<24.065688,0.000000,16.189281> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.193109,0.000000,16.262847>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.297150,0.000000,16.366888>}
box{<0,0,-0.304800><0.147136,0.035000,0.304800> rotate<0,-44.997030,0> translate<24.193109,0.000000,16.262847> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.196269,0.000000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.318763,0.000000,4.876800>}
box{<0,0,-0.304800><1.122494,0.035000,0.304800> rotate<0,0.000000,0> translate<24.196269,0.000000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.281200,0.000000,17.339794>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.619778,0.000000,17.339794>}
box{<0,0,-0.304800><1.338578,0.035000,0.304800> rotate<0,0.000000,0> translate<24.281200,0.000000,17.339794> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.297150,0.000000,16.366888>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.344997,0.000000,16.449766>}
box{<0,0,-0.304800><0.095698,0.035000,0.304800> rotate<0,-59.997509,0> translate<24.297150,0.000000,16.366888> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.344997,0.000000,16.449766>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.392847,0.000000,16.366888>}
box{<0,0,-0.304800><0.095700,0.035000,0.304800> rotate<0,59.995889,0> translate<24.344997,0.000000,16.449766> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.392847,0.000000,16.366888>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.496887,0.000000,16.262847>}
box{<0,0,-0.304800><0.147136,0.035000,0.304800> rotate<0,44.997030,0> translate<24.392847,0.000000,16.366888> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.496887,0.000000,16.262847>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.624309,0.000000,16.189281>}
box{<0,0,-0.304800><0.147133,0.035000,0.304800> rotate<0,29.997538,0> translate<24.496887,0.000000,16.262847> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.624309,0.000000,16.189281>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.766431,0.000000,16.151200>}
box{<0,0,-0.304800><0.147135,0.035000,0.304800> rotate<0,14.998938,0> translate<24.624309,0.000000,16.189281> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.766431,0.000000,16.151200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.619794,0.000000,16.151197>}
box{<0,0,-0.304800><0.853363,0.035000,0.304800> rotate<0,0.000210,0> translate<24.766431,0.000000,16.151200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.805869,0.000000,5.486400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.506797,0.000000,5.486400>}
box{<0,0,-0.304800><0.700928,0.035000,0.304800> rotate<0,0.000000,0> translate<24.805869,0.000000,5.486400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.279997,0.000000,3.448863>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.663847,0.000000,2.204450>}
box{<0,0,-0.304800><1.302269,0.035000,0.304800> rotate<0,72.852352,0> translate<25.279997,0.000000,3.448863> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.279997,0.000000,4.751134>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.279997,0.000000,3.448863>}
box{<0,0,-0.304800><1.302272,0.035000,0.304800> rotate<0,-90.000000,0> translate<25.279997,0.000000,3.448863> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.279997,0.000000,4.751134>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.663847,0.000000,5.995547>}
box{<0,0,-0.304800><1.302269,0.035000,0.304800> rotate<0,-72.852352,0> translate<25.279997,0.000000,4.751134> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.279997,0.000000,27.748863>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.663847,0.000000,26.504450>}
box{<0,0,-0.304800><1.302269,0.035000,0.304800> rotate<0,72.852352,0> translate<25.279997,0.000000,27.748863> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.279997,0.000000,29.051134>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.279997,0.000000,27.748863>}
box{<0,0,-0.304800><1.302272,0.035000,0.304800> rotate<0,-90.000000,0> translate<25.279997,0.000000,27.748863> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.279997,0.000000,29.051134>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.663847,0.000000,30.295547>}
box{<0,0,-0.304800><1.302269,0.035000,0.304800> rotate<0,-72.852352,0> translate<25.279997,0.000000,29.051134> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.415469,0.000000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.732334,0.000000,6.096000>}
box{<0,0,-0.304800><0.316866,0.035000,0.304800> rotate<0,0.000000,0> translate<25.415469,0.000000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.619778,0.000000,17.380200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.619778,0.000000,17.339794>}
box{<0,0,-0.304800><0.040406,0.035000,0.304800> rotate<0,-90.000000,0> translate<25.619778,0.000000,17.339794> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.619794,0.000000,16.151197>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.619794,0.000000,17.339778>}
box{<0,0,-0.304800><1.188581,0.035000,0.304800> rotate<0,90.000000,0> translate<25.619794,0.000000,17.339778> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.619794,0.000000,16.459200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.660200,0.000000,16.459200>}
box{<0,0,-0.304800><0.040406,0.035000,0.304800> rotate<0,0.000000,0> translate<25.619794,0.000000,16.459200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.619794,0.000000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.660200,0.000000,17.068800>}
box{<0,0,-0.304800><0.040406,0.035000,0.304800> rotate<0,0.000000,0> translate<25.619794,0.000000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.619794,0.000000,17.339778>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.660200,0.000000,17.339778>}
box{<0,0,-0.304800><0.040406,0.035000,0.304800> rotate<0,0.000000,0> translate<25.619794,0.000000,17.339778> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.660200,0.000000,16.151200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.513566,0.000000,16.151200>}
box{<0,0,-0.304800><0.853366,0.035000,0.304800> rotate<0,0.000000,0> translate<25.660200,0.000000,16.151200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.660200,0.000000,17.339778>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.660200,0.000000,16.151200>}
box{<0,0,-0.304800><1.188578,0.035000,0.304800> rotate<0,-90.000000,0> translate<25.660200,0.000000,16.151200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.660219,0.000000,17.339794>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.660219,0.000000,17.380200>}
box{<0,0,-0.304800><0.040406,0.035000,0.304800> rotate<0,90.000000,0> translate<25.660219,0.000000,17.380200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.660219,0.000000,17.339794>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.998797,0.000000,17.339794>}
box{<0,0,-0.304800><1.338578,0.035000,0.304800> rotate<0,0.000000,0> translate<25.660219,0.000000,17.339794> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.660219,0.000000,17.380200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.998794,0.000000,17.380200>}
box{<0,0,-0.304800><1.338575,0.035000,0.304800> rotate<0,0.000000,0> translate<25.660219,0.000000,17.380200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.663847,0.000000,2.204447>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.266309,0.000000,1.320797>}
box{<0,0,-0.304800><1.069485,0.035000,0.304800> rotate<0,55.710603,0> translate<25.663847,0.000000,2.204447> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.663847,0.000000,2.204450>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.663847,0.000000,2.204447>}
box{<0,0,-0.304800><0.000003,0.035000,0.304800> rotate<0,-90.000000,0> translate<25.663847,0.000000,2.204447> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.663847,0.000000,5.995550>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.663847,0.000000,5.995547>}
box{<0,0,-0.304800><0.000003,0.035000,0.304800> rotate<0,-90.000000,0> translate<25.663847,0.000000,5.995547> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.663847,0.000000,5.995550>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.397441,0.000000,7.071534>}
box{<0,0,-0.304800><1.302268,0.035000,0.304800> rotate<0,-55.710608,0> translate<25.663847,0.000000,5.995550> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.663847,0.000000,26.504447>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.397441,0.000000,25.428463>}
box{<0,0,-0.304800><1.302268,0.035000,0.304800> rotate<0,55.710608,0> translate<25.663847,0.000000,26.504447> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.663847,0.000000,26.504450>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.663847,0.000000,26.504447>}
box{<0,0,-0.304800><0.000003,0.035000,0.304800> rotate<0,-90.000000,0> translate<25.663847,0.000000,26.504447> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.663847,0.000000,30.295550>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.663847,0.000000,30.295547>}
box{<0,0,-0.304800><0.000003,0.035000,0.304800> rotate<0,-90.000000,0> translate<25.663847,0.000000,30.295547> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.663847,0.000000,30.295550>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.266309,0.000000,31.179200>}
box{<0,0,-0.304800><1.069485,0.035000,0.304800> rotate<0,-55.710603,0> translate<25.663847,0.000000,30.295550> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.025069,0.000000,6.705600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.147953,0.000000,6.705600>}
box{<0,0,-0.304800><0.122884,0.035000,0.304800> rotate<0,0.000000,0> translate<26.025069,0.000000,6.705600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.397441,0.000000,7.071538>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.397441,0.000000,7.071534>}
box{<0,0,-0.304800><0.000003,0.035000,0.304800> rotate<0,-90.000000,0> translate<26.397441,0.000000,7.071534> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.397441,0.000000,7.071538>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.397444,0.000000,7.071538>}
box{<0,0,-0.304800><0.000003,0.035000,0.304800> rotate<0,0.000000,0> translate<26.397441,0.000000,7.071538> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.397441,0.000000,25.428459>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.397444,0.000000,25.428459>}
box{<0,0,-0.304800><0.000003,0.035000,0.304800> rotate<0,0.000000,0> translate<26.397441,0.000000,25.428459> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.397441,0.000000,25.428463>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.397441,0.000000,25.428459>}
box{<0,0,-0.304800><0.000003,0.035000,0.304800> rotate<0,-90.000000,0> translate<26.397441,0.000000,25.428459> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.397444,0.000000,7.071538>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.415597,0.000000,7.883491>}
box{<0,0,-0.304800><1.302269,0.035000,0.304800> rotate<0,-38.568990,0> translate<26.397444,0.000000,7.071538> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.397444,0.000000,25.428459>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.415597,0.000000,24.616506>}
box{<0,0,-0.304800><1.302269,0.035000,0.304800> rotate<0,38.568990,0> translate<26.397444,0.000000,25.428459> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.513566,0.000000,16.151200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.655688,0.000000,16.189281>}
box{<0,0,-0.304800><0.147135,0.035000,0.304800> rotate<0,-14.998938,0> translate<26.513566,0.000000,16.151200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.634669,0.000000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.702988,0.000000,7.315200>}
box{<0,0,-0.304800><0.068319,0.035000,0.304800> rotate<0,0.000000,0> translate<26.634669,0.000000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.655688,0.000000,16.189281>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.783109,0.000000,16.262847>}
box{<0,0,-0.304800><0.147133,0.035000,0.304800> rotate<0,-29.997538,0> translate<26.655688,0.000000,16.189281> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.783109,0.000000,16.262847>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.887150,0.000000,16.366888>}
box{<0,0,-0.304800><0.147136,0.035000,0.304800> rotate<0,-44.997030,0> translate<26.783109,0.000000,16.262847> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.887150,0.000000,16.366888>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.960716,0.000000,16.494309>}
box{<0,0,-0.304800><0.147133,0.035000,0.304800> rotate<0,-59.996522,0> translate<26.887150,0.000000,16.366888> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.892413,0.000000,18.343994>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.944472,0.000000,18.396056>}
box{<0,0,-0.304800><0.073625,0.035000,0.304800> rotate<0,-44.998750,0> translate<26.892413,0.000000,18.343994> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.892413,0.000000,18.343994>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.960716,0.000000,18.225687>}
box{<0,0,-0.304800><0.136608,0.035000,0.304800> rotate<0,59.996411,0> translate<26.892413,0.000000,18.343994> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.924741,0.000000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.052525,0.000000,18.288000>}
box{<0,0,-0.304800><0.127784,0.035000,0.304800> rotate<0,0.000000,0> translate<26.924741,0.000000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.940444,0.000000,16.459200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.367200,0.000000,16.459200>}
box{<0,0,-0.304800><0.426756,0.035000,0.304800> rotate<0,0.000000,0> translate<26.940444,0.000000,16.459200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.944472,0.000000,18.396056>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.367200,0.000000,17.973325>}
box{<0,0,-0.304800><0.597830,0.035000,0.304800> rotate<0,44.997242,0> translate<26.944472,0.000000,18.396056> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.960716,0.000000,16.494309>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.998797,0.000000,16.636431>}
box{<0,0,-0.304800><0.147135,0.035000,0.304800> rotate<0,-74.995122,0> translate<26.960716,0.000000,16.494309> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.960716,0.000000,18.225687>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.998797,0.000000,18.083566>}
box{<0,0,-0.304800><0.147135,0.035000,0.304800> rotate<0,74.995122,0> translate<26.960716,0.000000,18.225687> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.998794,0.000000,17.380200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.998797,0.000000,18.083566>}
box{<0,0,-0.304800><0.703366,0.035000,0.304800> rotate<0,-89.993806,0> translate<26.998794,0.000000,17.380200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.998794,0.000000,17.678400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.367200,0.000000,17.678400>}
box{<0,0,-0.304800><0.368406,0.035000,0.304800> rotate<0,0.000000,0> translate<26.998794,0.000000,17.678400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.998797,0.000000,16.636431>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.998797,0.000000,17.339794>}
box{<0,0,-0.304800><0.703363,0.035000,0.304800> rotate<0,90.000000,0> translate<26.998797,0.000000,17.339794> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.998797,0.000000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.367200,0.000000,17.068800>}
box{<0,0,-0.304800><0.368403,0.035000,0.304800> rotate<0,0.000000,0> translate<26.998797,0.000000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.244269,0.000000,7.924800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.520856,0.000000,7.924800>}
box{<0,0,-0.304800><0.276588,0.035000,0.304800> rotate<0,0.000000,0> translate<27.244269,0.000000,7.924800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.367200,0.000000,17.973325>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.367200,0.000000,13.826672>}
box{<0,0,-0.304800><4.146653,0.035000,0.304800> rotate<0,-90.000000,0> translate<27.367200,0.000000,13.826672> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.415597,0.000000,7.883491>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.415600,0.000000,7.883491>}
box{<0,0,-0.304800><0.000003,0.035000,0.304800> rotate<0,0.000000,0> translate<27.415597,0.000000,7.883491> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.415597,0.000000,24.616506>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.415600,0.000000,24.616506>}
box{<0,0,-0.304800><0.000003,0.035000,0.304800> rotate<0,0.000000,0> translate<27.415597,0.000000,24.616506> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.415600,0.000000,7.883491>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.627850,0.000000,8.359262>}
box{<0,0,-0.304800><1.302271,0.035000,0.304800> rotate<0,-21.427108,0> translate<27.415600,0.000000,7.883491> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.415600,0.000000,24.616506>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.627847,0.000000,24.140734>}
box{<0,0,-0.304800><1.302268,0.035000,0.304800> rotate<0,21.427159,0> translate<27.415600,0.000000,24.616506> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.853869,0.000000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.379200,0.000000,8.534400>}
box{<0,0,-0.304800><4.525331,0.035000,0.304800> rotate<0,0.000000,0> translate<27.853869,0.000000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.463469,0.000000,9.144000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.379200,0.000000,9.144000>}
box{<0,0,-0.304800><3.915731,0.035000,0.304800> rotate<0,0.000000,0> translate<28.463469,0.000000,9.144000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.586675,0.000000,23.957797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.885413,0.000000,23.834056>}
box{<0,0,-0.304800><0.323351,0.035000,0.304800> rotate<0,22.498433,0> translate<28.586675,0.000000,23.957797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.627847,0.000000,24.140734>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.627850,0.000000,24.140734>}
box{<0,0,-0.304800><0.000003,0.035000,0.304800> rotate<0,0.000000,0> translate<28.627847,0.000000,24.140734> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.627850,0.000000,8.359262>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.926478,0.000000,8.456581>}
box{<0,0,-0.304800><1.302270,0.035000,0.304800> rotate<0,-4.285433,0> translate<28.627850,0.000000,8.359262> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.627850,0.000000,24.140734>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.926478,0.000000,24.043416>}
box{<0,0,-0.304800><1.302270,0.035000,0.304800> rotate<0,4.285433,0> translate<28.627850,0.000000,24.140734> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.885413,0.000000,23.834056>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.180413,0.000000,21.539056>}
box{<0,0,-0.304800><3.245620,0.035000,0.304800> rotate<0,44.997030,0> translate<28.885413,0.000000,23.834056> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.945069,0.000000,23.774400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.379200,0.000000,23.774400>}
box{<0,0,-0.304800><3.434131,0.035000,0.304800> rotate<0,0.000000,0> translate<28.945069,0.000000,23.774400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.073069,0.000000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.379200,0.000000,9.753600>}
box{<0,0,-0.304800><3.306131,0.035000,0.304800> rotate<0,0.000000,0> translate<29.073069,0.000000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.554669,0.000000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.379200,0.000000,23.164800>}
box{<0,0,-0.304800><2.824531,0.035000,0.304800> rotate<0,0.000000,0> translate<29.554669,0.000000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.682669,0.000000,10.363200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.379200,0.000000,10.363200>}
box{<0,0,-0.304800><2.696531,0.035000,0.304800> rotate<0,0.000000,0> translate<29.682669,0.000000,10.363200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.926478,0.000000,8.456581>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.196097,0.000000,8.166797>}
box{<0,0,-0.304800><1.302270,0.035000,0.304800> rotate<0,12.856388,0> translate<29.926478,0.000000,8.456581> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.926478,0.000000,24.043416>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.926481,0.000000,24.043416>}
box{<0,0,-0.304800><0.000003,0.035000,0.304800> rotate<0,0.000000,0> translate<29.926478,0.000000,24.043416> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.926481,0.000000,24.043416>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.196097,0.000000,24.333200>}
box{<0,0,-0.304800><1.302267,0.035000,0.304800> rotate<0,-12.856418,0> translate<29.926481,0.000000,24.043416> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.164269,0.000000,22.555200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.379200,0.000000,22.555200>}
box{<0,0,-0.304800><2.214931,0.035000,0.304800> rotate<0,0.000000,0> translate<30.164269,0.000000,22.555200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.292269,0.000000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.379200,0.000000,10.972800>}
box{<0,0,-0.304800><2.086931,0.035000,0.304800> rotate<0,0.000000,0> translate<30.292269,0.000000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.773869,0.000000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.379200,0.000000,21.945600>}
box{<0,0,-0.304800><1.605331,0.035000,0.304800> rotate<0,0.000000,0> translate<30.773869,0.000000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.901869,0.000000,11.582400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.379200,0.000000,11.582400>}
box{<0,0,-0.304800><1.477331,0.035000,0.304800> rotate<0,0.000000,0> translate<30.901869,0.000000,11.582400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.180413,0.000000,21.539056>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.409056,0.000000,21.310413>}
box{<0,0,-0.304800><0.323351,0.035000,0.304800> rotate<0,44.997030,0> translate<31.180413,0.000000,21.539056> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.196097,0.000000,8.166797>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.323897,0.000000,7.515663>}
box{<0,0,-0.304800><1.302271,0.035000,0.304800> rotate<0,29.997972,0> translate<31.196097,0.000000,8.166797> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.196097,0.000000,24.333200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.196100,0.000000,24.333200>}
box{<0,0,-0.304800><0.000003,0.035000,0.304800> rotate<0,0.000000,0> translate<31.196097,0.000000,24.333200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.196100,0.000000,24.333200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.323897,0.000000,24.984334>}
box{<0,0,-0.304800><1.302268,0.035000,0.304800> rotate<0,-29.998041,0> translate<31.196100,0.000000,24.333200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.284088,0.000000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.379200,0.000000,24.384000>}
box{<0,0,-0.304800><1.095113,0.035000,0.304800> rotate<0,0.000000,0> translate<31.284088,0.000000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.383469,0.000000,21.336000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.379200,0.000000,21.336000>}
box{<0,0,-0.304800><0.995731,0.035000,0.304800> rotate<0,0.000000,0> translate<31.383469,0.000000,21.336000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.409056,0.000000,12.089584>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.532797,0.000000,12.388322>}
box{<0,0,-0.304800><0.323351,0.035000,0.304800> rotate<0,-67.495627,0> translate<31.409056,0.000000,12.089584> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.409056,0.000000,21.310413>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.532797,0.000000,21.011675>}
box{<0,0,-0.304800><0.323351,0.035000,0.304800> rotate<0,67.495627,0> translate<31.409056,0.000000,21.310413> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.451475,0.000000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.379200,0.000000,12.192000>}
box{<0,0,-0.304800><0.927725,0.035000,0.304800> rotate<0,0.000000,0> translate<31.451475,0.000000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.532797,0.000000,12.388322>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.532797,0.000000,21.011675>}
box{<0,0,-0.304800><8.623353,0.035000,0.304800> rotate<0,90.000000,0> translate<31.532797,0.000000,21.011675> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.532797,0.000000,12.801600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.379200,0.000000,12.801600>}
box{<0,0,-0.304800><0.846403,0.035000,0.304800> rotate<0,0.000000,0> translate<31.532797,0.000000,12.801600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.532797,0.000000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.379200,0.000000,13.411200>}
box{<0,0,-0.304800><0.846403,0.035000,0.304800> rotate<0,0.000000,0> translate<31.532797,0.000000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.532797,0.000000,14.020800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.379200,0.000000,14.020800>}
box{<0,0,-0.304800><0.846403,0.035000,0.304800> rotate<0,0.000000,0> translate<31.532797,0.000000,14.020800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.532797,0.000000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.379200,0.000000,14.630400>}
box{<0,0,-0.304800><0.846403,0.035000,0.304800> rotate<0,0.000000,0> translate<31.532797,0.000000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.532797,0.000000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.379200,0.000000,15.240000>}
box{<0,0,-0.304800><0.846403,0.035000,0.304800> rotate<0,0.000000,0> translate<31.532797,0.000000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.532797,0.000000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.379200,0.000000,15.849600>}
box{<0,0,-0.304800><0.846403,0.035000,0.304800> rotate<0,0.000000,0> translate<31.532797,0.000000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.532797,0.000000,16.459200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.379200,0.000000,16.459200>}
box{<0,0,-0.304800><0.846403,0.035000,0.304800> rotate<0,0.000000,0> translate<31.532797,0.000000,16.459200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.532797,0.000000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.379200,0.000000,17.068800>}
box{<0,0,-0.304800><0.846403,0.035000,0.304800> rotate<0,0.000000,0> translate<31.532797,0.000000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.532797,0.000000,17.678400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.379200,0.000000,17.678400>}
box{<0,0,-0.304800><0.846403,0.035000,0.304800> rotate<0,0.000000,0> translate<31.532797,0.000000,17.678400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.532797,0.000000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.379200,0.000000,18.288000>}
box{<0,0,-0.304800><0.846403,0.035000,0.304800> rotate<0,0.000000,0> translate<31.532797,0.000000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.532797,0.000000,18.897600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.379200,0.000000,18.897600>}
box{<0,0,-0.304800><0.846403,0.035000,0.304800> rotate<0,0.000000,0> translate<31.532797,0.000000,18.897600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.532797,0.000000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.379200,0.000000,19.507200>}
box{<0,0,-0.304800><0.846403,0.035000,0.304800> rotate<0,0.000000,0> translate<31.532797,0.000000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.532797,0.000000,20.116800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.379200,0.000000,20.116800>}
box{<0,0,-0.304800><0.846403,0.035000,0.304800> rotate<0,0.000000,0> translate<31.532797,0.000000,20.116800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.532797,0.000000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.379200,0.000000,20.726400>}
box{<0,0,-0.304800><0.846403,0.035000,0.304800> rotate<0,0.000000,0> translate<31.532797,0.000000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.615250,0.000000,7.924800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.379200,0.000000,7.924800>}
box{<0,0,-0.304800><0.763950,0.035000,0.304800> rotate<0,0.000000,0> translate<31.615250,0.000000,7.924800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.323897,0.000000,7.515663>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.379200,0.000000,7.456059>}
box{<0,0,-0.304800><0.081308,0.035000,0.304800> rotate<0,47.140001,0> translate<32.323897,0.000000,7.515663> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.323897,0.000000,24.984334>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.323900,0.000000,24.984334>}
box{<0,0,-0.304800><0.000003,0.035000,0.304800> rotate<0,0.000000,0> translate<32.323897,0.000000,24.984334> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.323900,0.000000,24.984334>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.379200,0.000000,25.043938>}
box{<0,0,-0.304800><0.081306,0.035000,0.304800> rotate<0,-47.141615,0> translate<32.323900,0.000000,24.984334> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.332494,0.000000,24.993600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.379200,0.000000,24.993600>}
box{<0,0,-0.304800><0.046706,0.035000,0.304800> rotate<0,0.000000,0> translate<32.332494,0.000000,24.993600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.379200,0.000000,25.043938>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.379200,0.000000,7.456059>}
box{<0,0,-0.304800><17.587878,0.035000,0.304800> rotate<0,-90.000000,0> translate<32.379200,0.000000,7.456059> }
texture{col_pol}
}
#end
union{
cylinder{<18.020000,0.038000,10.690000><18.020000,-1.538000,10.690000>0.508000}
cylinder{<15.480000,0.038000,10.690000><15.480000,-1.538000,10.690000>0.508000}
cylinder{<18.020000,0.038000,8.150000><18.020000,-1.538000,8.150000>0.508000}
cylinder{<15.480000,0.038000,8.150000><15.480000,-1.538000,8.150000>0.508000}
cylinder{<18.020000,0.038000,5.610000><18.020000,-1.538000,5.610000>0.508000}
cylinder{<15.480000,0.038000,5.610000><15.480000,-1.538000,5.610000>0.508000}
cylinder{<18.020000,0.038000,3.070000><18.020000,-1.538000,3.070000>0.508000}
cylinder{<15.480000,0.038000,3.070000><15.480000,-1.538000,3.070000>0.508000}
//Bohrungen(schnell)/Durchkontaktierungen
//Bohrungen(schnell)/Platine
texture{col_hls}
}
#if(pcb_silkscreen=on)
//Bestückungsdruck
union{
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.939141,-1.536000,11.332025>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.210306,-1.536000,11.603188>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,-44.996700,0> translate<12.939141,-1.536000,11.332025> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.210306,-1.536000,11.603188>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.752638,-1.536000,11.603188>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,0.000000,0> translate<13.210306,-1.536000,11.603188> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.752638,-1.536000,11.603188>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.023800,-1.536000,11.332025>}
box{<0,0,-0.076200><0.383482,0.036000,0.076200> rotate<0,44.997030,0> translate<13.752638,-1.536000,11.603188> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.023800,-1.536000,11.332025>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.023800,-1.536000,11.060859>}
box{<0,0,-0.076200><0.271166,0.036000,0.076200> rotate<0,-90.000000,0> translate<14.023800,-1.536000,11.060859> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.023800,-1.536000,11.060859>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.752638,-1.536000,10.789694>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,-44.997360,0> translate<13.752638,-1.536000,10.789694> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.752638,-1.536000,10.789694>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.210306,-1.536000,10.789694>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,0.000000,0> translate<13.210306,-1.536000,10.789694> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.210306,-1.536000,10.789694>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.939141,-1.536000,10.518528>}
box{<0,0,-0.076200><0.383486,0.036000,0.076200> rotate<0,-44.997030,0> translate<12.939141,-1.536000,10.518528> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.939141,-1.536000,10.518528>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.939141,-1.536000,10.247363>}
box{<0,0,-0.076200><0.271166,0.036000,0.076200> rotate<0,-90.000000,0> translate<12.939141,-1.536000,10.247363> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.939141,-1.536000,10.247363>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.210306,-1.536000,9.976200>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,44.996700,0> translate<12.939141,-1.536000,10.247363> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.210306,-1.536000,9.976200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.752638,-1.536000,9.976200>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,0.000000,0> translate<13.210306,-1.536000,9.976200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.752638,-1.536000,9.976200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.023800,-1.536000,10.247363>}
box{<0,0,-0.076200><0.383482,0.036000,0.076200> rotate<0,-44.997030,0> translate<13.752638,-1.536000,9.976200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.301984,-1.536000,11.332025>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.573150,-1.536000,11.603188>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,-44.996700,0> translate<11.301984,-1.536000,11.332025> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.573150,-1.536000,11.603188>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.115481,-1.536000,11.603188>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,0.000000,0> translate<11.573150,-1.536000,11.603188> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.115481,-1.536000,11.603188>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.386644,-1.536000,11.332025>}
box{<0,0,-0.076200><0.383482,0.036000,0.076200> rotate<0,44.997030,0> translate<12.115481,-1.536000,11.603188> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.386644,-1.536000,11.332025>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.386644,-1.536000,10.247363>}
box{<0,0,-0.076200><1.084662,0.036000,0.076200> rotate<0,-90.000000,0> translate<12.386644,-1.536000,10.247363> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.386644,-1.536000,10.247363>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.115481,-1.536000,9.976200>}
box{<0,0,-0.076200><0.383482,0.036000,0.076200> rotate<0,-44.997030,0> translate<12.115481,-1.536000,9.976200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.115481,-1.536000,9.976200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.573150,-1.536000,9.976200>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,0.000000,0> translate<11.573150,-1.536000,9.976200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.573150,-1.536000,9.976200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.301984,-1.536000,10.247363>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,44.996700,0> translate<11.301984,-1.536000,10.247363> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.749488,-1.536000,11.603188>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.749488,-1.536000,9.976200>}
box{<0,0,-0.076200><1.626988,0.036000,0.076200> rotate<0,-90.000000,0> translate<10.749488,-1.536000,9.976200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.749488,-1.536000,9.976200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.664828,-1.536000,9.976200>}
box{<0,0,-0.076200><1.084659,0.036000,0.076200> rotate<0,0.000000,0> translate<9.664828,-1.536000,9.976200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.939141,-1.536000,8.932025>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.210306,-1.536000,9.203188>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,-44.996700,0> translate<12.939141,-1.536000,8.932025> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.210306,-1.536000,9.203188>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.752638,-1.536000,9.203188>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,0.000000,0> translate<13.210306,-1.536000,9.203188> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.752638,-1.536000,9.203188>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.023800,-1.536000,8.932025>}
box{<0,0,-0.076200><0.383482,0.036000,0.076200> rotate<0,44.997030,0> translate<13.752638,-1.536000,9.203188> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.023800,-1.536000,8.932025>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.023800,-1.536000,7.847363>}
box{<0,0,-0.076200><1.084663,0.036000,0.076200> rotate<0,-90.000000,0> translate<14.023800,-1.536000,7.847363> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.023800,-1.536000,7.847363>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.752638,-1.536000,7.576200>}
box{<0,0,-0.076200><0.383482,0.036000,0.076200> rotate<0,-44.997030,0> translate<13.752638,-1.536000,7.576200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.752638,-1.536000,7.576200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.210306,-1.536000,7.576200>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,0.000000,0> translate<13.210306,-1.536000,7.576200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.210306,-1.536000,7.576200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.939141,-1.536000,7.847363>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,44.996700,0> translate<12.939141,-1.536000,7.847363> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.939141,-1.536000,7.847363>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.939141,-1.536000,8.389694>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,90.000000,0> translate<12.939141,-1.536000,8.389694> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.939141,-1.536000,8.389694>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.481472,-1.536000,8.389694>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,0.000000,0> translate<12.939141,-1.536000,8.389694> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.386644,-1.536000,7.576200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.386644,-1.536000,9.203188>}
box{<0,0,-0.076200><1.626988,0.036000,0.076200> rotate<0,90.000000,0> translate<12.386644,-1.536000,9.203188> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.386644,-1.536000,9.203188>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.301984,-1.536000,7.576200>}
box{<0,0,-0.076200><1.955396,0.036000,0.076200> rotate<0,-56.306191,0> translate<11.301984,-1.536000,7.576200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.301984,-1.536000,7.576200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.301984,-1.536000,9.203188>}
box{<0,0,-0.076200><1.626988,0.036000,0.076200> rotate<0,90.000000,0> translate<11.301984,-1.536000,9.203188> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.749488,-1.536000,9.203188>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.749488,-1.536000,7.576200>}
box{<0,0,-0.076200><1.626988,0.036000,0.076200> rotate<0,-90.000000,0> translate<10.749488,-1.536000,7.576200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.749488,-1.536000,7.576200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.935994,-1.536000,7.576200>}
box{<0,0,-0.076200><0.813494,0.036000,0.076200> rotate<0,0.000000,0> translate<9.935994,-1.536000,7.576200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.935994,-1.536000,7.576200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.664828,-1.536000,7.847363>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,44.996700,0> translate<9.664828,-1.536000,7.847363> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.664828,-1.536000,7.847363>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.664828,-1.536000,8.932025>}
box{<0,0,-0.076200><1.084663,0.036000,0.076200> rotate<0,90.000000,0> translate<9.664828,-1.536000,8.932025> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.664828,-1.536000,8.932025>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.935994,-1.536000,9.203188>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,-44.996700,0> translate<9.664828,-1.536000,8.932025> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.935994,-1.536000,9.203188>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.749488,-1.536000,9.203188>}
box{<0,0,-0.076200><0.813494,0.036000,0.076200> rotate<0,0.000000,0> translate<9.935994,-1.536000,9.203188> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.023800,-1.536000,6.503188>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.023800,-1.536000,5.418528>}
box{<0,0,-0.076200><1.084659,0.036000,0.076200> rotate<0,-90.000000,0> translate<14.023800,-1.536000,5.418528> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.023800,-1.536000,5.418528>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.481472,-1.536000,4.876200>}
box{<0,0,-0.076200><0.766968,0.036000,0.076200> rotate<0,-44.997030,0> translate<13.481472,-1.536000,4.876200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.481472,-1.536000,4.876200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.939141,-1.536000,5.418528>}
box{<0,0,-0.076200><0.766970,0.036000,0.076200> rotate<0,44.996865,0> translate<12.939141,-1.536000,5.418528> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.939141,-1.536000,5.418528>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.939141,-1.536000,6.503188>}
box{<0,0,-0.076200><1.084659,0.036000,0.076200> rotate<0,90.000000,0> translate<12.939141,-1.536000,6.503188> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.386644,-1.536000,6.503188>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.386644,-1.536000,4.876200>}
box{<0,0,-0.076200><1.626988,0.036000,0.076200> rotate<0,-90.000000,0> translate<12.386644,-1.536000,4.876200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.386644,-1.536000,4.876200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.573150,-1.536000,4.876200>}
box{<0,0,-0.076200><0.813494,0.036000,0.076200> rotate<0,0.000000,0> translate<11.573150,-1.536000,4.876200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.573150,-1.536000,4.876200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.301984,-1.536000,5.147362>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,44.996700,0> translate<11.301984,-1.536000,5.147362> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.301984,-1.536000,5.147362>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.301984,-1.536000,6.232025>}
box{<0,0,-0.076200><1.084663,0.036000,0.076200> rotate<0,90.000000,0> translate<11.301984,-1.536000,6.232025> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.301984,-1.536000,6.232025>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.573150,-1.536000,6.503188>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,-44.996700,0> translate<11.301984,-1.536000,6.232025> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.573150,-1.536000,6.503188>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.386644,-1.536000,6.503188>}
box{<0,0,-0.076200><0.813494,0.036000,0.076200> rotate<0,0.000000,0> translate<11.573150,-1.536000,6.503188> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.749488,-1.536000,6.503188>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.749488,-1.536000,4.876200>}
box{<0,0,-0.076200><1.626988,0.036000,0.076200> rotate<0,-90.000000,0> translate<10.749488,-1.536000,4.876200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.749488,-1.536000,4.876200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.935994,-1.536000,4.876200>}
box{<0,0,-0.076200><0.813494,0.036000,0.076200> rotate<0,0.000000,0> translate<9.935994,-1.536000,4.876200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.935994,-1.536000,4.876200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.664828,-1.536000,5.147362>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,44.996700,0> translate<9.664828,-1.536000,5.147362> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.664828,-1.536000,5.147362>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.664828,-1.536000,6.232025>}
box{<0,0,-0.076200><1.084663,0.036000,0.076200> rotate<0,90.000000,0> translate<9.664828,-1.536000,6.232025> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.664828,-1.536000,6.232025>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.935994,-1.536000,6.503188>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,-44.996700,0> translate<9.664828,-1.536000,6.232025> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.935994,-1.536000,6.503188>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.749488,-1.536000,6.503188>}
box{<0,0,-0.076200><0.813494,0.036000,0.076200> rotate<0,0.000000,0> translate<9.935994,-1.536000,6.503188> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.923800,-1.536000,2.376200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.923800,-1.536000,4.003188>}
box{<0,0,-0.076200><1.626987,0.036000,0.076200> rotate<0,90.000000,0> translate<13.923800,-1.536000,4.003188> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.923800,-1.536000,4.003188>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.839141,-1.536000,2.376200>}
box{<0,0,-0.076200><1.955396,0.036000,0.076200> rotate<0,-56.306191,0> translate<12.839141,-1.536000,2.376200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.839141,-1.536000,2.376200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.839141,-1.536000,4.003188>}
box{<0,0,-0.076200><1.626987,0.036000,0.076200> rotate<0,90.000000,0> translate<12.839141,-1.536000,4.003188> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.201984,-1.536000,3.732025>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.473150,-1.536000,4.003188>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,-44.996700,0> translate<11.201984,-1.536000,3.732025> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.473150,-1.536000,4.003188>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.015481,-1.536000,4.003188>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,0.000000,0> translate<11.473150,-1.536000,4.003188> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.015481,-1.536000,4.003188>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.286644,-1.536000,3.732025>}
box{<0,0,-0.076200><0.383482,0.036000,0.076200> rotate<0,44.997030,0> translate<12.015481,-1.536000,4.003188> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.286644,-1.536000,3.732025>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.286644,-1.536000,2.647363>}
box{<0,0,-0.076200><1.084662,0.036000,0.076200> rotate<0,-90.000000,0> translate<12.286644,-1.536000,2.647363> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.286644,-1.536000,2.647363>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.015481,-1.536000,2.376200>}
box{<0,0,-0.076200><0.383482,0.036000,0.076200> rotate<0,-44.997030,0> translate<12.015481,-1.536000,2.376200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.015481,-1.536000,2.376200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.473150,-1.536000,2.376200>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,0.000000,0> translate<11.473150,-1.536000,2.376200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.473150,-1.536000,2.376200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.201984,-1.536000,2.647363>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,44.996700,0> translate<11.201984,-1.536000,2.647363> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.439141,-1.536000,11.132025>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.710306,-1.536000,11.403188>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,-44.996700,0> translate<24.439141,-1.536000,11.132025> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.710306,-1.536000,11.403188>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.252638,-1.536000,11.403188>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,0.000000,0> translate<24.710306,-1.536000,11.403188> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.252638,-1.536000,11.403188>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.523800,-1.536000,11.132025>}
box{<0,0,-0.076200><0.383482,0.036000,0.076200> rotate<0,44.997030,0> translate<25.252638,-1.536000,11.403188> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.523800,-1.536000,11.132025>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.523800,-1.536000,10.860859>}
box{<0,0,-0.076200><0.271166,0.036000,0.076200> rotate<0,-90.000000,0> translate<25.523800,-1.536000,10.860859> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.523800,-1.536000,10.860859>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.252638,-1.536000,10.589694>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,-44.997360,0> translate<25.252638,-1.536000,10.589694> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.252638,-1.536000,10.589694>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.710306,-1.536000,10.589694>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,0.000000,0> translate<24.710306,-1.536000,10.589694> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.710306,-1.536000,10.589694>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.439141,-1.536000,10.318528>}
box{<0,0,-0.076200><0.383486,0.036000,0.076200> rotate<0,-44.997030,0> translate<24.439141,-1.536000,10.318528> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.439141,-1.536000,10.318528>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.439141,-1.536000,10.047363>}
box{<0,0,-0.076200><0.271166,0.036000,0.076200> rotate<0,-90.000000,0> translate<24.439141,-1.536000,10.047363> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.439141,-1.536000,10.047363>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.710306,-1.536000,9.776200>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,44.996700,0> translate<24.439141,-1.536000,10.047363> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.710306,-1.536000,9.776200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.252638,-1.536000,9.776200>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,0.000000,0> translate<24.710306,-1.536000,9.776200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.252638,-1.536000,9.776200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.523800,-1.536000,10.047363>}
box{<0,0,-0.076200><0.383482,0.036000,0.076200> rotate<0,-44.997030,0> translate<25.252638,-1.536000,9.776200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.886644,-1.536000,11.403188>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.886644,-1.536000,9.776200>}
box{<0,0,-0.076200><1.626988,0.036000,0.076200> rotate<0,-90.000000,0> translate<23.886644,-1.536000,9.776200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.886644,-1.536000,9.776200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.073150,-1.536000,9.776200>}
box{<0,0,-0.076200><0.813494,0.036000,0.076200> rotate<0,0.000000,0> translate<23.073150,-1.536000,9.776200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.073150,-1.536000,9.776200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.801984,-1.536000,10.047363>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,44.996700,0> translate<22.801984,-1.536000,10.047363> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.801984,-1.536000,10.047363>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.801984,-1.536000,11.132025>}
box{<0,0,-0.076200><1.084663,0.036000,0.076200> rotate<0,90.000000,0> translate<22.801984,-1.536000,11.132025> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.801984,-1.536000,11.132025>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.073150,-1.536000,11.403188>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,-44.996700,0> translate<22.801984,-1.536000,11.132025> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.073150,-1.536000,11.403188>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.886644,-1.536000,11.403188>}
box{<0,0,-0.076200><0.813494,0.036000,0.076200> rotate<0,0.000000,0> translate<23.073150,-1.536000,11.403188> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.249488,-1.536000,9.776200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.249488,-1.536000,10.860859>}
box{<0,0,-0.076200><1.084659,0.036000,0.076200> rotate<0,90.000000,0> translate<22.249488,-1.536000,10.860859> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.249488,-1.536000,10.860859>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.707159,-1.536000,11.403188>}
box{<0,0,-0.076200><0.766968,0.036000,0.076200> rotate<0,44.997030,0> translate<21.707159,-1.536000,11.403188> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.707159,-1.536000,11.403188>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.164828,-1.536000,10.860859>}
box{<0,0,-0.076200><0.766970,0.036000,0.076200> rotate<0,-44.996865,0> translate<21.164828,-1.536000,10.860859> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.164828,-1.536000,10.860859>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.164828,-1.536000,9.776200>}
box{<0,0,-0.076200><1.084659,0.036000,0.076200> rotate<0,-90.000000,0> translate<21.164828,-1.536000,9.776200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.249488,-1.536000,10.589694>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.164828,-1.536000,10.589694>}
box{<0,0,-0.076200><1.084659,0.036000,0.076200> rotate<0,0.000000,0> translate<21.164828,-1.536000,10.589694> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.623800,-1.536000,7.376200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.081472,-1.536000,7.376200>}
box{<0,0,-0.076200><0.542328,0.036000,0.076200> rotate<0,0.000000,0> translate<25.081472,-1.536000,7.376200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.352638,-1.536000,7.376200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.352638,-1.536000,9.003188>}
box{<0,0,-0.076200><1.626988,0.036000,0.076200> rotate<0,90.000000,0> translate<25.352638,-1.536000,9.003188> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.623800,-1.536000,9.003188>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.081472,-1.536000,9.003188>}
box{<0,0,-0.076200><0.542328,0.036000,0.076200> rotate<0,0.000000,0> translate<25.081472,-1.536000,9.003188> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.532363,-1.536000,7.376200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.532363,-1.536000,9.003188>}
box{<0,0,-0.076200><1.626988,0.036000,0.076200> rotate<0,90.000000,0> translate<24.532363,-1.536000,9.003188> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.532363,-1.536000,9.003188>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.447703,-1.536000,7.376200>}
box{<0,0,-0.076200><1.955396,0.036000,0.076200> rotate<0,-56.306191,0> translate<23.447703,-1.536000,7.376200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.447703,-1.536000,7.376200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.447703,-1.536000,9.003188>}
box{<0,0,-0.076200><1.626988,0.036000,0.076200> rotate<0,90.000000,0> translate<23.447703,-1.536000,9.003188> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.352878,-1.536000,7.376200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.352878,-1.536000,9.003188>}
box{<0,0,-0.076200><1.626988,0.036000,0.076200> rotate<0,90.000000,0> translate<22.352878,-1.536000,9.003188> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.895206,-1.536000,9.003188>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.810547,-1.536000,9.003188>}
box{<0,0,-0.076200><1.084659,0.036000,0.076200> rotate<0,0.000000,0> translate<21.810547,-1.536000,9.003188> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.523800,-1.536000,5.076200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.981472,-1.536000,5.076200>}
box{<0,0,-0.076200><0.542328,0.036000,0.076200> rotate<0,0.000000,0> translate<24.981472,-1.536000,5.076200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.252638,-1.536000,5.076200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.252638,-1.536000,6.703188>}
box{<0,0,-0.076200><1.626988,0.036000,0.076200> rotate<0,90.000000,0> translate<25.252638,-1.536000,6.703188> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.523800,-1.536000,6.703188>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.981472,-1.536000,6.703188>}
box{<0,0,-0.076200><0.542328,0.036000,0.076200> rotate<0,0.000000,0> translate<24.981472,-1.536000,6.703188> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.618869,-1.536000,6.703188>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.161200,-1.536000,6.703188>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,0.000000,0> translate<23.618869,-1.536000,6.703188> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.161200,-1.536000,6.703188>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.432362,-1.536000,6.432025>}
box{<0,0,-0.076200><0.383482,0.036000,0.076200> rotate<0,44.997030,0> translate<24.161200,-1.536000,6.703188> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.432362,-1.536000,6.432025>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.432362,-1.536000,5.347363>}
box{<0,0,-0.076200><1.084663,0.036000,0.076200> rotate<0,-90.000000,0> translate<24.432362,-1.536000,5.347363> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.432362,-1.536000,5.347363>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.161200,-1.536000,5.076200>}
box{<0,0,-0.076200><0.383482,0.036000,0.076200> rotate<0,-44.997030,0> translate<24.161200,-1.536000,5.076200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.161200,-1.536000,5.076200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.618869,-1.536000,5.076200>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,0.000000,0> translate<23.618869,-1.536000,5.076200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.618869,-1.536000,5.076200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.347703,-1.536000,5.347363>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,44.996700,0> translate<23.347703,-1.536000,5.347363> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.347703,-1.536000,5.347363>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.347703,-1.536000,6.432025>}
box{<0,0,-0.076200><1.084663,0.036000,0.076200> rotate<0,90.000000,0> translate<23.347703,-1.536000,6.432025> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.347703,-1.536000,6.432025>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.618869,-1.536000,6.703188>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,-44.996700,0> translate<23.347703,-1.536000,6.432025> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.795206,-1.536000,6.703188>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.795206,-1.536000,5.347363>}
box{<0,0,-0.076200><1.355825,0.036000,0.076200> rotate<0,-90.000000,0> translate<22.795206,-1.536000,5.347363> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.795206,-1.536000,5.347363>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.524044,-1.536000,5.076200>}
box{<0,0,-0.076200><0.383482,0.036000,0.076200> rotate<0,-44.997030,0> translate<22.524044,-1.536000,5.076200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.524044,-1.536000,5.076200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.981713,-1.536000,5.076200>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,0.000000,0> translate<21.981713,-1.536000,5.076200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.981713,-1.536000,5.076200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.710547,-1.536000,5.347363>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,44.996700,0> translate<21.710547,-1.536000,5.347363> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.710547,-1.536000,5.347363>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.710547,-1.536000,6.703188>}
box{<0,0,-0.076200><1.355825,0.036000,0.076200> rotate<0,90.000000,0> translate<21.710547,-1.536000,6.703188> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.615722,-1.536000,5.076200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.615722,-1.536000,6.703188>}
box{<0,0,-0.076200><1.626988,0.036000,0.076200> rotate<0,90.000000,0> translate<20.615722,-1.536000,6.703188> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.158050,-1.536000,6.703188>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.073391,-1.536000,6.703188>}
box{<0,0,-0.076200><1.084659,0.036000,0.076200> rotate<0,0.000000,0> translate<20.073391,-1.536000,6.703188> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.623800,-1.536000,3.903188>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.623800,-1.536000,2.818528>}
box{<0,0,-0.076200><1.084659,0.036000,0.076200> rotate<0,-90.000000,0> translate<25.623800,-1.536000,2.818528> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.623800,-1.536000,2.818528>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.081472,-1.536000,2.276200>}
box{<0,0,-0.076200><0.766968,0.036000,0.076200> rotate<0,-44.997030,0> translate<25.081472,-1.536000,2.276200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.081472,-1.536000,2.276200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.539141,-1.536000,2.818528>}
box{<0,0,-0.076200><0.766970,0.036000,0.076200> rotate<0,44.996865,0> translate<24.539141,-1.536000,2.818528> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.539141,-1.536000,2.818528>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.539141,-1.536000,3.903188>}
box{<0,0,-0.076200><1.084659,0.036000,0.076200> rotate<0,90.000000,0> translate<24.539141,-1.536000,3.903188> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.986644,-1.536000,3.903188>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.986644,-1.536000,2.276200>}
box{<0,0,-0.076200><1.626987,0.036000,0.076200> rotate<0,-90.000000,0> translate<23.986644,-1.536000,2.276200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.986644,-1.536000,2.276200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.901984,-1.536000,2.276200>}
box{<0,0,-0.076200><1.084659,0.036000,0.076200> rotate<0,0.000000,0> translate<22.901984,-1.536000,2.276200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.264828,-1.536000,3.903188>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.349488,-1.536000,3.903188>}
box{<0,0,-0.076200><1.084659,0.036000,0.076200> rotate<0,0.000000,0> translate<21.264828,-1.536000,3.903188> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.349488,-1.536000,3.903188>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.349488,-1.536000,2.276200>}
box{<0,0,-0.076200><1.626987,0.036000,0.076200> rotate<0,-90.000000,0> translate<22.349488,-1.536000,2.276200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.349488,-1.536000,2.276200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.264828,-1.536000,2.276200>}
box{<0,0,-0.076200><1.084659,0.036000,0.076200> rotate<0,0.000000,0> translate<21.264828,-1.536000,2.276200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.349488,-1.536000,3.089694>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.807159,-1.536000,3.089694>}
box{<0,0,-0.076200><0.542328,0.036000,0.076200> rotate<0,0.000000,0> translate<21.807159,-1.536000,3.089694> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.712331,-1.536000,3.903188>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.712331,-1.536000,2.276200>}
box{<0,0,-0.076200><1.626987,0.036000,0.076200> rotate<0,-90.000000,0> translate<20.712331,-1.536000,2.276200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.712331,-1.536000,2.276200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.898838,-1.536000,2.276200>}
box{<0,0,-0.076200><0.813494,0.036000,0.076200> rotate<0,0.000000,0> translate<19.898838,-1.536000,2.276200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.898838,-1.536000,2.276200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.627672,-1.536000,2.547363>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,44.996700,0> translate<19.627672,-1.536000,2.547363> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.627672,-1.536000,2.547363>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.627672,-1.536000,3.632025>}
box{<0,0,-0.076200><1.084662,0.036000,0.076200> rotate<0,90.000000,0> translate<19.627672,-1.536000,3.632025> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.627672,-1.536000,3.632025>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.898838,-1.536000,3.903188>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,-44.996700,0> translate<19.627672,-1.536000,3.632025> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.898838,-1.536000,3.903188>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.712331,-1.536000,3.903188>}
box{<0,0,-0.076200><0.813494,0.036000,0.076200> rotate<0,0.000000,0> translate<19.898838,-1.536000,3.903188> }
//C1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.790000,0.000000,21.231000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.790000,0.000000,20.469000>}
box{<0,0,-0.050800><0.762000,0.036000,0.050800> rotate<0,-90.000000,0> translate<9.790000,0.000000,20.469000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.470000,0.000000,21.206000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.470000,0.000000,20.469000>}
box{<0,0,-0.050800><0.737000,0.036000,0.050800> rotate<0,-90.000000,0> translate<8.470000,0.000000,20.469000> }
box{<-0.375050,0,-0.725050><0.375050,0.036000,0.725050> rotate<0,-270.000000,0> translate<9.131150,0.000000,21.567150>}
box{<-0.375050,0,-0.725050><0.375050,0.036000,0.725050> rotate<0,-270.000000,0> translate<9.131150,0.000000,20.119350>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.944703,0.000000,17.211600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.749803,0.000000,17.016700>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<7.749803,0.000000,17.016700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.749803,0.000000,17.016700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.749803,0.000000,16.626900>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,-90.000000,0> translate<7.749803,0.000000,16.626900> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.749803,0.000000,16.626900>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.944703,0.000000,16.432003>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,44.996571,0> translate<7.749803,0.000000,16.626900> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.944703,0.000000,16.432003>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.724303,0.000000,16.432003>}
box{<0,0,-0.050800><0.779600,0.036000,0.050800> rotate<0,0.000000,0> translate<7.944703,0.000000,16.432003> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.724303,0.000000,16.432003>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.919200,0.000000,16.626900>}
box{<0,0,-0.050800><0.275626,0.036000,0.050800> rotate<0,-44.997030,0> translate<8.724303,0.000000,16.432003> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.919200,0.000000,16.626900>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.919200,0.000000,17.016700>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,90.000000,0> translate<8.919200,0.000000,17.016700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.919200,0.000000,17.016700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.724303,0.000000,17.211600>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,44.997489,0> translate<8.724303,0.000000,17.211600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.139603,0.000000,17.601400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.749803,0.000000,17.991197>}
box{<0,0,-0.050800><0.551258,0.036000,0.050800> rotate<0,44.996801,0> translate<7.749803,0.000000,17.991197> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.749803,0.000000,17.991197>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.919200,0.000000,17.991197>}
box{<0,0,-0.050800><1.169397,0.036000,0.050800> rotate<0,0.000000,0> translate<7.749803,0.000000,17.991197> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.919200,0.000000,17.601400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.919200,0.000000,18.380997>}
box{<0,0,-0.050800><0.779597,0.036000,0.050800> rotate<0,90.000000,0> translate<8.919200,0.000000,18.380997> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.339803,0.000000,15.457500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.534703,0.000000,15.067700>}
box{<0,0,-0.050800><0.435810,0.036000,0.050800> rotate<0,63.430762,0> translate<9.339803,0.000000,15.457500> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.534703,0.000000,15.067700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.924503,0.000000,14.677903>}
box{<0,0,-0.050800><0.551258,0.036000,0.050800> rotate<0,44.996801,0> translate<9.534703,0.000000,15.067700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.924503,0.000000,14.677903>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.314303,0.000000,14.677903>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<9.924503,0.000000,14.677903> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.314303,0.000000,14.677903>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.509200,0.000000,14.872800>}
box{<0,0,-0.050800><0.275626,0.036000,0.050800> rotate<0,-44.997030,0> translate<10.314303,0.000000,14.677903> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.509200,0.000000,14.872800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.509200,0.000000,15.262600>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,90.000000,0> translate<10.509200,0.000000,15.262600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.509200,0.000000,15.262600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.314303,0.000000,15.457500>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,44.997489,0> translate<10.314303,0.000000,15.457500> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.314303,0.000000,15.457500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.119403,0.000000,15.457500>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,0.000000,0> translate<10.119403,0.000000,15.457500> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.119403,0.000000,15.457500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.924503,0.000000,15.262600>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<9.924503,0.000000,15.262600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.924503,0.000000,15.262600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.924503,0.000000,14.677903>}
box{<0,0,-0.050800><0.584697,0.036000,0.050800> rotate<0,-90.000000,0> translate<9.924503,0.000000,14.677903> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.509200,0.000000,15.847300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.314303,0.000000,15.847300>}
box{<0,0,-0.050800><0.194897,0.036000,0.050800> rotate<0,0.000000,0> translate<10.314303,0.000000,15.847300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.314303,0.000000,15.847300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.314303,0.000000,16.042197>}
box{<0,0,-0.050800><0.194897,0.036000,0.050800> rotate<0,90.000000,0> translate<10.314303,0.000000,16.042197> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.314303,0.000000,16.042197>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.509200,0.000000,16.042197>}
box{<0,0,-0.050800><0.194897,0.036000,0.050800> rotate<0,0.000000,0> translate<10.314303,0.000000,16.042197> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.509200,0.000000,16.042197>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.509200,0.000000,15.847300>}
box{<0,0,-0.050800><0.194897,0.036000,0.050800> rotate<0,-90.000000,0> translate<10.509200,0.000000,15.847300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.534703,0.000000,16.431997>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.339803,0.000000,16.626894>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,44.996571,0> translate<9.339803,0.000000,16.626894> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.339803,0.000000,16.626894>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.339803,0.000000,17.016694>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,90.000000,0> translate<9.339803,0.000000,17.016694> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.339803,0.000000,17.016694>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.534703,0.000000,17.211594>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<9.339803,0.000000,17.016694> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.534703,0.000000,17.211594>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.729603,0.000000,17.211594>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,0.000000,0> translate<9.534703,0.000000,17.211594> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.729603,0.000000,17.211594>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.924503,0.000000,17.016694>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,44.997030,0> translate<9.729603,0.000000,17.211594> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.924503,0.000000,17.016694>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.119403,0.000000,17.211594>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<9.924503,0.000000,17.016694> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.119403,0.000000,17.211594>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.314303,0.000000,17.211594>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,0.000000,0> translate<10.119403,0.000000,17.211594> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.314303,0.000000,17.211594>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.509200,0.000000,17.016694>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,44.997489,0> translate<10.314303,0.000000,17.211594> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.509200,0.000000,17.016694>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.509200,0.000000,16.626894>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,-90.000000,0> translate<10.509200,0.000000,16.626894> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.509200,0.000000,16.626894>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.314303,0.000000,16.431997>}
box{<0,0,-0.050800><0.275626,0.036000,0.050800> rotate<0,-44.997030,0> translate<10.314303,0.000000,16.431997> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.314303,0.000000,16.431997>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.119403,0.000000,16.431997>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,0.000000,0> translate<10.119403,0.000000,16.431997> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.119403,0.000000,16.431997>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.924503,0.000000,16.626894>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,44.996571,0> translate<9.924503,0.000000,16.626894> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.924503,0.000000,16.626894>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.729603,0.000000,16.431997>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,-44.996571,0> translate<9.729603,0.000000,16.431997> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.729603,0.000000,16.431997>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.534703,0.000000,16.431997>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,0.000000,0> translate<9.534703,0.000000,16.431997> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.924503,0.000000,16.626894>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.924503,0.000000,17.016694>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,90.000000,0> translate<9.924503,0.000000,17.016694> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.729603,0.000000,17.601394>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.314303,0.000000,17.601394>}
box{<0,0,-0.050800><0.584700,0.036000,0.050800> rotate<0,0.000000,0> translate<9.729603,0.000000,17.601394> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.314303,0.000000,17.601394>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.509200,0.000000,17.796291>}
box{<0,0,-0.050800><0.275626,0.036000,0.050800> rotate<0,-44.997030,0> translate<10.314303,0.000000,17.601394> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.509200,0.000000,17.796291>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.509200,0.000000,18.380991>}
box{<0,0,-0.050800><0.584700,0.036000,0.050800> rotate<0,90.000000,0> translate<10.509200,0.000000,18.380991> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.509200,0.000000,18.380991>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.729603,0.000000,18.380991>}
box{<0,0,-0.050800><0.779597,0.036000,0.050800> rotate<0,0.000000,0> translate<9.729603,0.000000,18.380991> }
//C2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<5.980000,0.000000,21.231000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<5.980000,0.000000,20.469000>}
box{<0,0,-0.050800><0.762000,0.036000,0.050800> rotate<0,-90.000000,0> translate<5.980000,0.000000,20.469000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<4.660000,0.000000,21.206000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<4.660000,0.000000,20.469000>}
box{<0,0,-0.050800><0.737000,0.036000,0.050800> rotate<0,-90.000000,0> translate<4.660000,0.000000,20.469000> }
box{<-0.375050,0,-0.725050><0.375050,0.036000,0.725050> rotate<0,-270.000000,0> translate<5.321150,0.000000,21.567150>}
box{<-0.375050,0,-0.725050><0.375050,0.036000,0.725050> rotate<0,-270.000000,0> translate<5.321150,0.000000,20.119350>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<4.134703,0.000000,17.211600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<3.939803,0.000000,17.016700>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<3.939803,0.000000,17.016700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<3.939803,0.000000,17.016700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<3.939803,0.000000,16.626900>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,-90.000000,0> translate<3.939803,0.000000,16.626900> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<3.939803,0.000000,16.626900>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<4.134703,0.000000,16.432003>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,44.996571,0> translate<3.939803,0.000000,16.626900> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<4.134703,0.000000,16.432003>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<4.914303,0.000000,16.432003>}
box{<0,0,-0.050800><0.779600,0.036000,0.050800> rotate<0,0.000000,0> translate<4.134703,0.000000,16.432003> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<4.914303,0.000000,16.432003>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<5.109200,0.000000,16.626900>}
box{<0,0,-0.050800><0.275626,0.036000,0.050800> rotate<0,-44.997030,0> translate<4.914303,0.000000,16.432003> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<5.109200,0.000000,16.626900>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<5.109200,0.000000,17.016700>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,90.000000,0> translate<5.109200,0.000000,17.016700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<5.109200,0.000000,17.016700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<4.914303,0.000000,17.211600>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,44.997489,0> translate<4.914303,0.000000,17.211600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<5.109200,0.000000,18.380997>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<5.109200,0.000000,17.601400>}
box{<0,0,-0.050800><0.779597,0.036000,0.050800> rotate<0,-90.000000,0> translate<5.109200,0.000000,17.601400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<5.109200,0.000000,17.601400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<4.329603,0.000000,18.380997>}
box{<0,0,-0.050800><1.102516,0.036000,0.050800> rotate<0,44.997030,0> translate<4.329603,0.000000,18.380997> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<4.329603,0.000000,18.380997>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<4.134703,0.000000,18.380997>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,0.000000,0> translate<4.134703,0.000000,18.380997> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<4.134703,0.000000,18.380997>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<3.939803,0.000000,18.186097>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<3.939803,0.000000,18.186097> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<3.939803,0.000000,18.186097>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<3.939803,0.000000,17.796297>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,-90.000000,0> translate<3.939803,0.000000,17.796297> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<3.939803,0.000000,17.796297>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<4.134703,0.000000,17.601400>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,44.996571,0> translate<3.939803,0.000000,17.796297> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.119603,0.000000,14.093203>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<5.729803,0.000000,14.483000>}
box{<0,0,-0.050800><0.551258,0.036000,0.050800> rotate<0,44.996801,0> translate<5.729803,0.000000,14.483000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<5.729803,0.000000,14.483000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.899200,0.000000,14.483000>}
box{<0,0,-0.050800><1.169397,0.036000,0.050800> rotate<0,0.000000,0> translate<5.729803,0.000000,14.483000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.899200,0.000000,14.093203>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.899200,0.000000,14.872800>}
box{<0,0,-0.050800><0.779597,0.036000,0.050800> rotate<0,90.000000,0> translate<6.899200,0.000000,14.872800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.704303,0.000000,15.262600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<5.924703,0.000000,15.262600>}
box{<0,0,-0.050800><0.779600,0.036000,0.050800> rotate<0,0.000000,0> translate<5.924703,0.000000,15.262600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<5.924703,0.000000,15.262600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<5.729803,0.000000,15.457497>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,44.996571,0> translate<5.729803,0.000000,15.457497> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<5.729803,0.000000,15.457497>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<5.729803,0.000000,15.847297>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,90.000000,0> translate<5.729803,0.000000,15.847297> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<5.729803,0.000000,15.847297>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<5.924703,0.000000,16.042197>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<5.729803,0.000000,15.847297> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<5.924703,0.000000,16.042197>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.704303,0.000000,16.042197>}
box{<0,0,-0.050800><0.779600,0.036000,0.050800> rotate<0,0.000000,0> translate<5.924703,0.000000,16.042197> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.704303,0.000000,16.042197>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.899200,0.000000,15.847297>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,44.997489,0> translate<6.704303,0.000000,16.042197> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.899200,0.000000,15.847297>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.899200,0.000000,15.457497>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,-90.000000,0> translate<6.899200,0.000000,15.457497> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.899200,0.000000,15.457497>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.704303,0.000000,15.262600>}
box{<0,0,-0.050800><0.275626,0.036000,0.050800> rotate<0,-44.997030,0> translate<6.704303,0.000000,15.262600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.704303,0.000000,15.262600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<5.924703,0.000000,16.042197>}
box{<0,0,-0.050800><1.102519,0.036000,0.050800> rotate<0,44.996915,0> translate<5.924703,0.000000,16.042197> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.704303,0.000000,16.431997>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<5.924703,0.000000,16.431997>}
box{<0,0,-0.050800><0.779600,0.036000,0.050800> rotate<0,0.000000,0> translate<5.924703,0.000000,16.431997> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<5.924703,0.000000,16.431997>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<5.729803,0.000000,16.626894>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,44.996571,0> translate<5.729803,0.000000,16.626894> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<5.729803,0.000000,16.626894>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<5.729803,0.000000,17.016694>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,90.000000,0> translate<5.729803,0.000000,17.016694> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<5.729803,0.000000,17.016694>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<5.924703,0.000000,17.211594>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<5.729803,0.000000,17.016694> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<5.924703,0.000000,17.211594>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.704303,0.000000,17.211594>}
box{<0,0,-0.050800><0.779600,0.036000,0.050800> rotate<0,0.000000,0> translate<5.924703,0.000000,17.211594> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.704303,0.000000,17.211594>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.899200,0.000000,17.016694>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,44.997489,0> translate<6.704303,0.000000,17.211594> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.899200,0.000000,17.016694>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.899200,0.000000,16.626894>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,-90.000000,0> translate<6.899200,0.000000,16.626894> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.899200,0.000000,16.626894>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.704303,0.000000,16.431997>}
box{<0,0,-0.050800><0.275626,0.036000,0.050800> rotate<0,-44.997030,0> translate<6.704303,0.000000,16.431997> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.704303,0.000000,16.431997>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<5.924703,0.000000,17.211594>}
box{<0,0,-0.050800><1.102519,0.036000,0.050800> rotate<0,44.996915,0> translate<5.924703,0.000000,17.211594> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.899200,0.000000,17.601394>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.119603,0.000000,17.601394>}
box{<0,0,-0.050800><0.779597,0.036000,0.050800> rotate<0,0.000000,0> translate<6.119603,0.000000,17.601394> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.119603,0.000000,17.601394>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.119603,0.000000,18.186091>}
box{<0,0,-0.050800><0.584697,0.036000,0.050800> rotate<0,90.000000,0> translate<6.119603,0.000000,18.186091> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.119603,0.000000,18.186091>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.314503,0.000000,18.380991>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<6.119603,0.000000,18.186091> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.314503,0.000000,18.380991>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.899200,0.000000,18.380991>}
box{<0,0,-0.050800><0.584697,0.036000,0.050800> rotate<0,0.000000,0> translate<6.314503,0.000000,18.380991> }
//C3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.741000,0.000000,25.690000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.979000,0.000000,25.690000>}
box{<0,0,-0.050800><0.762000,0.036000,0.050800> rotate<0,0.000000,0> translate<11.979000,0.000000,25.690000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.716000,0.000000,27.010000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.979000,0.000000,27.010000>}
box{<0,0,-0.050800><0.737000,0.036000,0.050800> rotate<0,0.000000,0> translate<11.979000,0.000000,27.010000> }
box{<-0.375050,0,-0.725050><0.375050,0.036000,0.725050> rotate<0,-180.000000,0> translate<13.077150,0.000000,26.348850>}
box{<-0.375050,0,-0.725050><0.375050,0.036000,0.725050> rotate<0,-180.000000,0> translate<11.629350,0.000000,26.348850>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.921600,0.000000,26.535297>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.726700,0.000000,26.730197>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,44.997030,0> translate<8.726700,0.000000,26.730197> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.726700,0.000000,26.730197>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.336900,0.000000,26.730197>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<8.336900,0.000000,26.730197> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.336900,0.000000,26.730197>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.142003,0.000000,26.535297>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,-44.997489,0> translate<8.142003,0.000000,26.535297> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.142003,0.000000,26.535297>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.142003,0.000000,25.755697>}
box{<0,0,-0.050800><0.779600,0.036000,0.050800> rotate<0,-90.000000,0> translate<8.142003,0.000000,25.755697> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.142003,0.000000,25.755697>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.336900,0.000000,25.560800>}
box{<0,0,-0.050800><0.275626,0.036000,0.050800> rotate<0,44.997030,0> translate<8.142003,0.000000,25.755697> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.336900,0.000000,25.560800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.726700,0.000000,25.560800>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<8.336900,0.000000,25.560800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.726700,0.000000,25.560800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.921600,0.000000,25.755697>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,-44.996571,0> translate<8.726700,0.000000,25.560800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.311400,0.000000,26.535297>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.506297,0.000000,26.730197>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,-44.997489,0> translate<9.311400,0.000000,26.535297> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.506297,0.000000,26.730197>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.896097,0.000000,26.730197>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<9.506297,0.000000,26.730197> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.896097,0.000000,26.730197>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.090997,0.000000,26.535297>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,44.997030,0> translate<9.896097,0.000000,26.730197> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.090997,0.000000,26.535297>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.090997,0.000000,26.340397>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,-90.000000,0> translate<10.090997,0.000000,26.340397> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.090997,0.000000,26.340397>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.896097,0.000000,26.145497>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<9.896097,0.000000,26.145497> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.896097,0.000000,26.145497>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.701197,0.000000,26.145497>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,0.000000,0> translate<9.701197,0.000000,26.145497> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.896097,0.000000,26.145497>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.090997,0.000000,25.950597>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,44.997030,0> translate<9.896097,0.000000,26.145497> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.090997,0.000000,25.950597>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.090997,0.000000,25.755697>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,-90.000000,0> translate<10.090997,0.000000,25.755697> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.090997,0.000000,25.755697>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.896097,0.000000,25.560800>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,-44.996571,0> translate<9.896097,0.000000,25.560800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.896097,0.000000,25.560800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.506297,0.000000,25.560800>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<9.506297,0.000000,25.560800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.506297,0.000000,25.560800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.311400,0.000000,25.755697>}
box{<0,0,-0.050800><0.275626,0.036000,0.050800> rotate<0,44.997030,0> translate<9.311400,0.000000,25.755697> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.867500,0.000000,26.940197>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.477700,0.000000,26.745297>}
box{<0,0,-0.050800><0.435810,0.036000,0.050800> rotate<0,-26.563298,0> translate<14.477700,0.000000,26.745297> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.477700,0.000000,26.745297>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.087903,0.000000,26.355497>}
box{<0,0,-0.050800><0.551258,0.036000,0.050800> rotate<0,-44.997260,0> translate<14.087903,0.000000,26.355497> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.087903,0.000000,26.355497>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.087903,0.000000,25.965697>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,-90.000000,0> translate<14.087903,0.000000,25.965697> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.087903,0.000000,25.965697>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.282800,0.000000,25.770800>}
box{<0,0,-0.050800><0.275626,0.036000,0.050800> rotate<0,44.997030,0> translate<14.087903,0.000000,25.965697> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.282800,0.000000,25.770800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.672600,0.000000,25.770800>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<14.282800,0.000000,25.770800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.672600,0.000000,25.770800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.867500,0.000000,25.965697>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,-44.996571,0> translate<14.672600,0.000000,25.770800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.867500,0.000000,25.965697>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.867500,0.000000,26.160597>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,90.000000,0> translate<14.867500,0.000000,26.160597> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.867500,0.000000,26.160597>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.672600,0.000000,26.355497>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,44.997030,0> translate<14.672600,0.000000,26.355497> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.672600,0.000000,26.355497>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.087903,0.000000,26.355497>}
box{<0,0,-0.050800><0.584697,0.036000,0.050800> rotate<0,0.000000,0> translate<14.087903,0.000000,26.355497> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.257300,0.000000,25.770800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.257300,0.000000,25.965697>}
box{<0,0,-0.050800><0.194897,0.036000,0.050800> rotate<0,90.000000,0> translate<15.257300,0.000000,25.965697> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.257300,0.000000,25.965697>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.452197,0.000000,25.965697>}
box{<0,0,-0.050800><0.194897,0.036000,0.050800> rotate<0,0.000000,0> translate<15.257300,0.000000,25.965697> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.452197,0.000000,25.965697>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.452197,0.000000,25.770800>}
box{<0,0,-0.050800><0.194897,0.036000,0.050800> rotate<0,-90.000000,0> translate<15.452197,0.000000,25.770800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.452197,0.000000,25.770800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.257300,0.000000,25.770800>}
box{<0,0,-0.050800><0.194897,0.036000,0.050800> rotate<0,0.000000,0> translate<15.257300,0.000000,25.770800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.841997,0.000000,26.745297>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.036894,0.000000,26.940197>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,-44.997489,0> translate<15.841997,0.000000,26.745297> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.036894,0.000000,26.940197>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.426694,0.000000,26.940197>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<16.036894,0.000000,26.940197> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.426694,0.000000,26.940197>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.621594,0.000000,26.745297>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,44.997030,0> translate<16.426694,0.000000,26.940197> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.621594,0.000000,26.745297>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.621594,0.000000,26.550397>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,-90.000000,0> translate<16.621594,0.000000,26.550397> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.621594,0.000000,26.550397>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.426694,0.000000,26.355497>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<16.426694,0.000000,26.355497> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.426694,0.000000,26.355497>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.621594,0.000000,26.160597>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,44.997030,0> translate<16.426694,0.000000,26.355497> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.621594,0.000000,26.160597>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.621594,0.000000,25.965697>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,-90.000000,0> translate<16.621594,0.000000,25.965697> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.621594,0.000000,25.965697>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.426694,0.000000,25.770800>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,-44.996571,0> translate<16.426694,0.000000,25.770800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.426694,0.000000,25.770800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.036894,0.000000,25.770800>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<16.036894,0.000000,25.770800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.036894,0.000000,25.770800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.841997,0.000000,25.965697>}
box{<0,0,-0.050800><0.275626,0.036000,0.050800> rotate<0,44.997030,0> translate<15.841997,0.000000,25.965697> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.841997,0.000000,25.965697>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.841997,0.000000,26.160597>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,90.000000,0> translate<15.841997,0.000000,26.160597> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.841997,0.000000,26.160597>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.036894,0.000000,26.355497>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,-44.997489,0> translate<15.841997,0.000000,26.160597> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.036894,0.000000,26.355497>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.841997,0.000000,26.550397>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,44.997489,0> translate<15.841997,0.000000,26.550397> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.841997,0.000000,26.550397>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.841997,0.000000,26.745297>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,90.000000,0> translate<15.841997,0.000000,26.745297> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.036894,0.000000,26.355497>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.426694,0.000000,26.355497>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<16.036894,0.000000,26.355497> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.011394,0.000000,26.550397>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.011394,0.000000,25.965697>}
box{<0,0,-0.050800><0.584700,0.036000,0.050800> rotate<0,-90.000000,0> translate<17.011394,0.000000,25.965697> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.011394,0.000000,25.965697>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.206291,0.000000,25.770800>}
box{<0,0,-0.050800><0.275626,0.036000,0.050800> rotate<0,44.997030,0> translate<17.011394,0.000000,25.965697> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.206291,0.000000,25.770800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.790991,0.000000,25.770800>}
box{<0,0,-0.050800><0.584700,0.036000,0.050800> rotate<0,0.000000,0> translate<17.206291,0.000000,25.770800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.790991,0.000000,25.770800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.790991,0.000000,26.550397>}
box{<0,0,-0.050800><0.779597,0.036000,0.050800> rotate<0,90.000000,0> translate<17.790991,0.000000,26.550397> }
//C4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.741000,0.000000,28.700000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.979000,0.000000,28.700000>}
box{<0,0,-0.050800><0.762000,0.036000,0.050800> rotate<0,0.000000,0> translate<11.979000,0.000000,28.700000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.716000,0.000000,30.020000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.979000,0.000000,30.020000>}
box{<0,0,-0.050800><0.737000,0.036000,0.050800> rotate<0,0.000000,0> translate<11.979000,0.000000,30.020000> }
box{<-0.375050,0,-0.725050><0.375050,0.036000,0.725050> rotate<0,-180.000000,0> translate<13.077150,0.000000,29.358850>}
box{<-0.375050,0,-0.725050><0.375050,0.036000,0.725050> rotate<0,-180.000000,0> translate<11.629350,0.000000,29.358850>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.921600,0.000000,29.645297>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.726700,0.000000,29.840197>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,44.997030,0> translate<8.726700,0.000000,29.840197> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.726700,0.000000,29.840197>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.336900,0.000000,29.840197>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<8.336900,0.000000,29.840197> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.336900,0.000000,29.840197>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.142003,0.000000,29.645297>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,-44.997489,0> translate<8.142003,0.000000,29.645297> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.142003,0.000000,29.645297>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.142003,0.000000,28.865697>}
box{<0,0,-0.050800><0.779600,0.036000,0.050800> rotate<0,-90.000000,0> translate<8.142003,0.000000,28.865697> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.142003,0.000000,28.865697>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.336900,0.000000,28.670800>}
box{<0,0,-0.050800><0.275626,0.036000,0.050800> rotate<0,44.997030,0> translate<8.142003,0.000000,28.865697> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.336900,0.000000,28.670800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.726700,0.000000,28.670800>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<8.336900,0.000000,28.670800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.726700,0.000000,28.670800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.921600,0.000000,28.865697>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,-44.996571,0> translate<8.726700,0.000000,28.670800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.896097,0.000000,28.670800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.896097,0.000000,29.840197>}
box{<0,0,-0.050800><1.169397,0.036000,0.050800> rotate<0,90.000000,0> translate<9.896097,0.000000,29.840197> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.896097,0.000000,29.840197>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.311400,0.000000,29.255497>}
box{<0,0,-0.050800><0.826888,0.036000,0.050800> rotate<0,-44.997183,0> translate<9.311400,0.000000,29.255497> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.311400,0.000000,29.255497>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.090997,0.000000,29.255497>}
box{<0,0,-0.050800><0.779597,0.036000,0.050800> rotate<0,0.000000,0> translate<9.311400,0.000000,29.255497> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.803203,0.000000,29.560397>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.193000,0.000000,29.950197>}
box{<0,0,-0.050800><0.551258,0.036000,0.050800> rotate<0,-44.997260,0> translate<13.803203,0.000000,29.560397> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.193000,0.000000,29.950197>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.193000,0.000000,28.780800>}
box{<0,0,-0.050800><1.169397,0.036000,0.050800> rotate<0,-90.000000,0> translate<14.193000,0.000000,28.780800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.803203,0.000000,28.780800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.582800,0.000000,28.780800>}
box{<0,0,-0.050800><0.779597,0.036000,0.050800> rotate<0,0.000000,0> translate<13.803203,0.000000,28.780800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.972600,0.000000,28.975697>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.972600,0.000000,29.755297>}
box{<0,0,-0.050800><0.779600,0.036000,0.050800> rotate<0,90.000000,0> translate<14.972600,0.000000,29.755297> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.972600,0.000000,29.755297>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.167497,0.000000,29.950197>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,-44.997489,0> translate<14.972600,0.000000,29.755297> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.167497,0.000000,29.950197>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.557297,0.000000,29.950197>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<15.167497,0.000000,29.950197> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.557297,0.000000,29.950197>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.752197,0.000000,29.755297>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,44.997030,0> translate<15.557297,0.000000,29.950197> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.752197,0.000000,29.755297>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.752197,0.000000,28.975697>}
box{<0,0,-0.050800><0.779600,0.036000,0.050800> rotate<0,-90.000000,0> translate<15.752197,0.000000,28.975697> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.752197,0.000000,28.975697>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.557297,0.000000,28.780800>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,-44.996571,0> translate<15.557297,0.000000,28.780800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.557297,0.000000,28.780800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.167497,0.000000,28.780800>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<15.167497,0.000000,28.780800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.167497,0.000000,28.780800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.972600,0.000000,28.975697>}
box{<0,0,-0.050800><0.275626,0.036000,0.050800> rotate<0,44.997030,0> translate<14.972600,0.000000,28.975697> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.972600,0.000000,28.975697>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.752197,0.000000,29.755297>}
box{<0,0,-0.050800><1.102519,0.036000,0.050800> rotate<0,-44.997145,0> translate<14.972600,0.000000,28.975697> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.141997,0.000000,28.975697>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.141997,0.000000,29.755297>}
box{<0,0,-0.050800><0.779600,0.036000,0.050800> rotate<0,90.000000,0> translate<16.141997,0.000000,29.755297> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.141997,0.000000,29.755297>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.336894,0.000000,29.950197>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,-44.997489,0> translate<16.141997,0.000000,29.755297> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.336894,0.000000,29.950197>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.726694,0.000000,29.950197>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<16.336894,0.000000,29.950197> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.726694,0.000000,29.950197>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.921594,0.000000,29.755297>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,44.997030,0> translate<16.726694,0.000000,29.950197> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.921594,0.000000,29.755297>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.921594,0.000000,28.975697>}
box{<0,0,-0.050800><0.779600,0.036000,0.050800> rotate<0,-90.000000,0> translate<16.921594,0.000000,28.975697> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.921594,0.000000,28.975697>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.726694,0.000000,28.780800>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,-44.996571,0> translate<16.726694,0.000000,28.780800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.726694,0.000000,28.780800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.336894,0.000000,28.780800>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<16.336894,0.000000,28.780800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.336894,0.000000,28.780800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.141997,0.000000,28.975697>}
box{<0,0,-0.050800><0.275626,0.036000,0.050800> rotate<0,44.997030,0> translate<16.141997,0.000000,28.975697> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.141997,0.000000,28.975697>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.921594,0.000000,29.755297>}
box{<0,0,-0.050800><1.102519,0.036000,0.050800> rotate<0,-44.997145,0> translate<16.141997,0.000000,28.975697> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.311394,0.000000,28.780800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.311394,0.000000,29.560397>}
box{<0,0,-0.050800><0.779597,0.036000,0.050800> rotate<0,90.000000,0> translate<17.311394,0.000000,29.560397> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.311394,0.000000,29.560397>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.896091,0.000000,29.560397>}
box{<0,0,-0.050800><0.584697,0.036000,0.050800> rotate<0,0.000000,0> translate<17.311394,0.000000,29.560397> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.896091,0.000000,29.560397>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<18.090991,0.000000,29.365497>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,44.997030,0> translate<17.896091,0.000000,29.560397> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<18.090991,0.000000,29.365497>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<18.090991,0.000000,28.780800>}
box{<0,0,-0.050800><0.584697,0.036000,0.050800> rotate<0,-90.000000,0> translate<18.090991,0.000000,28.780800> }
//C5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.760000,0.000000,18.691000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.760000,0.000000,17.929000>}
box{<0,0,-0.050800><0.762000,0.036000,0.050800> rotate<0,-90.000000,0> translate<23.760000,0.000000,17.929000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.440000,0.000000,18.666000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.440000,0.000000,17.929000>}
box{<0,0,-0.050800><0.737000,0.036000,0.050800> rotate<0,-90.000000,0> translate<22.440000,0.000000,17.929000> }
box{<-0.375050,0,-0.725050><0.375050,0.036000,0.725050> rotate<0,-270.000000,0> translate<23.101150,0.000000,19.027150>}
box{<-0.375050,0,-0.725050><0.375050,0.036000,0.725050> rotate<0,-270.000000,0> translate<23.101150,0.000000,17.579350>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.814703,0.000000,14.671600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.619803,0.000000,14.476700>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<22.619803,0.000000,14.476700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.619803,0.000000,14.476700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.619803,0.000000,14.086900>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,-90.000000,0> translate<22.619803,0.000000,14.086900> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.619803,0.000000,14.086900>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.814703,0.000000,13.892003>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,44.996571,0> translate<22.619803,0.000000,14.086900> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.814703,0.000000,13.892003>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.594303,0.000000,13.892003>}
box{<0,0,-0.050800><0.779600,0.036000,0.050800> rotate<0,0.000000,0> translate<22.814703,0.000000,13.892003> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.594303,0.000000,13.892003>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.789200,0.000000,14.086900>}
box{<0,0,-0.050800><0.275626,0.036000,0.050800> rotate<0,-44.997030,0> translate<23.594303,0.000000,13.892003> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.789200,0.000000,14.086900>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.789200,0.000000,14.476700>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,90.000000,0> translate<23.789200,0.000000,14.476700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.789200,0.000000,14.476700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.594303,0.000000,14.671600>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,44.997489,0> translate<23.594303,0.000000,14.671600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.619803,0.000000,15.840997>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.619803,0.000000,15.061400>}
box{<0,0,-0.050800><0.779597,0.036000,0.050800> rotate<0,-90.000000,0> translate<22.619803,0.000000,15.061400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.619803,0.000000,15.061400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.204503,0.000000,15.061400>}
box{<0,0,-0.050800><0.584700,0.036000,0.050800> rotate<0,0.000000,0> translate<22.619803,0.000000,15.061400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.204503,0.000000,15.061400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.009603,0.000000,15.451197>}
box{<0,0,-0.050800><0.435807,0.036000,0.050800> rotate<0,63.430579,0> translate<23.009603,0.000000,15.451197> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.009603,0.000000,15.451197>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.009603,0.000000,15.646097>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,90.000000,0> translate<23.009603,0.000000,15.646097> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.009603,0.000000,15.646097>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.204503,0.000000,15.840997>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<23.009603,0.000000,15.646097> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.204503,0.000000,15.840997>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.594303,0.000000,15.840997>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<23.204503,0.000000,15.840997> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.594303,0.000000,15.840997>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.789200,0.000000,15.646097>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,44.997489,0> translate<23.594303,0.000000,15.840997> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.789200,0.000000,15.646097>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.789200,0.000000,15.256297>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,-90.000000,0> translate<23.789200,0.000000,15.256297> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.789200,0.000000,15.256297>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.594303,0.000000,15.061400>}
box{<0,0,-0.050800><0.275626,0.036000,0.050800> rotate<0,-44.997030,0> translate<23.594303,0.000000,15.061400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.899603,0.000000,19.822603>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.509803,0.000000,20.212400>}
box{<0,0,-0.050800><0.551258,0.036000,0.050800> rotate<0,44.996801,0> translate<22.509803,0.000000,20.212400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.509803,0.000000,20.212400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.679200,0.000000,20.212400>}
box{<0,0,-0.050800><1.169397,0.036000,0.050800> rotate<0,0.000000,0> translate<22.509803,0.000000,20.212400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.679200,0.000000,19.822603>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.679200,0.000000,20.602200>}
box{<0,0,-0.050800><0.779597,0.036000,0.050800> rotate<0,90.000000,0> translate<23.679200,0.000000,20.602200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.484303,0.000000,20.992000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.704703,0.000000,20.992000>}
box{<0,0,-0.050800><0.779600,0.036000,0.050800> rotate<0,0.000000,0> translate<22.704703,0.000000,20.992000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.704703,0.000000,20.992000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.509803,0.000000,21.186897>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,44.996571,0> translate<22.509803,0.000000,21.186897> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.509803,0.000000,21.186897>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.509803,0.000000,21.576697>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,90.000000,0> translate<22.509803,0.000000,21.576697> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.509803,0.000000,21.576697>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.704703,0.000000,21.771597>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<22.509803,0.000000,21.576697> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.704703,0.000000,21.771597>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.484303,0.000000,21.771597>}
box{<0,0,-0.050800><0.779600,0.036000,0.050800> rotate<0,0.000000,0> translate<22.704703,0.000000,21.771597> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.484303,0.000000,21.771597>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.679200,0.000000,21.576697>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,44.997489,0> translate<23.484303,0.000000,21.771597> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.679200,0.000000,21.576697>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.679200,0.000000,21.186897>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,-90.000000,0> translate<23.679200,0.000000,21.186897> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.679200,0.000000,21.186897>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.484303,0.000000,20.992000>}
box{<0,0,-0.050800><0.275626,0.036000,0.050800> rotate<0,-44.997030,0> translate<23.484303,0.000000,20.992000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.484303,0.000000,20.992000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.704703,0.000000,21.771597>}
box{<0,0,-0.050800><1.102519,0.036000,0.050800> rotate<0,44.996915,0> translate<22.704703,0.000000,21.771597> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.899603,0.000000,22.161397>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.484303,0.000000,22.161397>}
box{<0,0,-0.050800><0.584700,0.036000,0.050800> rotate<0,0.000000,0> translate<22.899603,0.000000,22.161397> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.484303,0.000000,22.161397>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.679200,0.000000,22.356294>}
box{<0,0,-0.050800><0.275626,0.036000,0.050800> rotate<0,-44.997030,0> translate<23.484303,0.000000,22.161397> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.679200,0.000000,22.356294>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.679200,0.000000,22.940994>}
box{<0,0,-0.050800><0.584700,0.036000,0.050800> rotate<0,90.000000,0> translate<23.679200,0.000000,22.940994> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.679200,0.000000,22.940994>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.899603,0.000000,22.940994>}
box{<0,0,-0.050800><0.779597,0.036000,0.050800> rotate<0,0.000000,0> translate<22.899603,0.000000,22.940994> }
//IC1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.850000,0.000000,23.900000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.850000,0.000000,17.800000>}
box{<0,0,-0.063500><6.100000,0.036000,0.063500> rotate<0,-90.000000,0> translate<14.850000,0.000000,17.800000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.850000,0.000000,17.800000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.650000,0.000000,17.800000>}
box{<0,0,-0.063500><3.800000,0.036000,0.063500> rotate<0,0.000000,0> translate<14.850000,0.000000,17.800000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.650000,0.000000,17.800000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.650000,0.000000,23.900000>}
box{<0,0,-0.063500><6.100000,0.036000,0.063500> rotate<0,90.000000,0> translate<18.650000,0.000000,23.900000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.650000,0.000000,23.900000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.850000,0.000000,23.900000>}
box{<0,0,-0.063500><3.800000,0.036000,0.063500> rotate<0,0.000000,0> translate<14.850000,0.000000,23.900000> }
difference{
cylinder{<15.750000,0,18.650000><15.750000,0.036000,18.650000>0.602016 translate<0,0.000000,0>}
cylinder{<15.750000,-0.1,18.650000><15.750000,0.135000,18.650000>0.475016 translate<0,0.000000,0>}}
difference{
cylinder{<15.850000,0,20.850000><15.850000,0.036000,20.850000>0.844522 translate<0,0.000000,0>}
cylinder{<15.850000,-0.1,20.850000><15.850000,0.135000,20.850000>0.717522 translate<0,0.000000,0>}}
difference{
cylinder{<15.750000,0,23.050000><15.750000,0.036000,23.050000>0.629184 translate<0,0.000000,0>}
cylinder{<15.750000,-0.1,23.050000><15.750000,0.135000,23.050000>0.502184 translate<0,0.000000,0>}}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<21.159200,0.000000,15.156206>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.379603,0.000000,15.156206>}
box{<0,0,-0.050800><0.779597,0.036000,0.050800> rotate<0,0.000000,0> translate<20.379603,0.000000,15.156206> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.379603,0.000000,15.156206>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.989803,0.000000,15.546003>}
box{<0,0,-0.050800><0.551258,0.036000,0.050800> rotate<0,44.996801,0> translate<19.989803,0.000000,15.546003> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.989803,0.000000,15.546003>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.379603,0.000000,15.935803>}
box{<0,0,-0.050800><0.551260,0.036000,0.050800> rotate<0,-44.997030,0> translate<19.989803,0.000000,15.546003> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.379603,0.000000,15.935803>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<21.159200,0.000000,15.935803>}
box{<0,0,-0.050800><0.779597,0.036000,0.050800> rotate<0,0.000000,0> translate<20.379603,0.000000,15.935803> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.574503,0.000000,15.156206>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.574503,0.000000,15.935803>}
box{<0,0,-0.050800><0.779597,0.036000,0.050800> rotate<0,90.000000,0> translate<20.574503,0.000000,15.935803> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<21.159200,0.000000,16.325603>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.989803,0.000000,16.325603>}
box{<0,0,-0.050800><1.169397,0.036000,0.050800> rotate<0,0.000000,0> translate<19.989803,0.000000,16.325603> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.989803,0.000000,16.325603>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.989803,0.000000,16.910300>}
box{<0,0,-0.050800><0.584697,0.036000,0.050800> rotate<0,90.000000,0> translate<19.989803,0.000000,16.910300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.989803,0.000000,16.910300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.184703,0.000000,17.105200>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<19.989803,0.000000,16.910300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.184703,0.000000,17.105200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.574503,0.000000,17.105200>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<20.184703,0.000000,17.105200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.574503,0.000000,17.105200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.769403,0.000000,16.910300>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,44.997030,0> translate<20.574503,0.000000,17.105200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.769403,0.000000,16.910300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.769403,0.000000,16.325603>}
box{<0,0,-0.050800><0.584697,0.036000,0.050800> rotate<0,-90.000000,0> translate<20.769403,0.000000,16.325603> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.989803,0.000000,17.495000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<21.159200,0.000000,17.495000>}
box{<0,0,-0.050800><1.169397,0.036000,0.050800> rotate<0,0.000000,0> translate<19.989803,0.000000,17.495000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<21.159200,0.000000,17.495000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<21.159200,0.000000,18.079697>}
box{<0,0,-0.050800><0.584697,0.036000,0.050800> rotate<0,90.000000,0> translate<21.159200,0.000000,18.079697> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<21.159200,0.000000,18.079697>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.964303,0.000000,18.274597>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,44.997489,0> translate<20.964303,0.000000,18.274597> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.964303,0.000000,18.274597>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.184703,0.000000,18.274597>}
box{<0,0,-0.050800><0.779600,0.036000,0.050800> rotate<0,0.000000,0> translate<20.184703,0.000000,18.274597> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.184703,0.000000,18.274597>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.989803,0.000000,18.079697>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<19.989803,0.000000,18.079697> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.989803,0.000000,18.079697>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.989803,0.000000,17.495000>}
box{<0,0,-0.050800><0.584697,0.036000,0.050800> rotate<0,-90.000000,0> translate<19.989803,0.000000,17.495000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.184703,0.000000,19.443994>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.989803,0.000000,19.249094>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<19.989803,0.000000,19.249094> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.989803,0.000000,19.249094>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.989803,0.000000,18.859294>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,-90.000000,0> translate<19.989803,0.000000,18.859294> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.989803,0.000000,18.859294>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.184703,0.000000,18.664397>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,44.996571,0> translate<19.989803,0.000000,18.859294> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.184703,0.000000,18.664397>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.379603,0.000000,18.664397>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,0.000000,0> translate<20.184703,0.000000,18.664397> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.379603,0.000000,18.664397>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.574503,0.000000,18.859294>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,-44.996571,0> translate<20.379603,0.000000,18.664397> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.574503,0.000000,18.859294>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.574503,0.000000,19.249094>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,90.000000,0> translate<20.574503,0.000000,19.249094> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.574503,0.000000,19.249094>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.769403,0.000000,19.443994>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<20.574503,0.000000,19.249094> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.769403,0.000000,19.443994>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.964303,0.000000,19.443994>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,0.000000,0> translate<20.769403,0.000000,19.443994> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.964303,0.000000,19.443994>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<21.159200,0.000000,19.249094>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,44.997489,0> translate<20.964303,0.000000,19.443994> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<21.159200,0.000000,19.249094>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<21.159200,0.000000,18.859294>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,-90.000000,0> translate<21.159200,0.000000,18.859294> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<21.159200,0.000000,18.859294>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.964303,0.000000,18.664397>}
box{<0,0,-0.050800><0.275626,0.036000,0.050800> rotate<0,-44.997030,0> translate<20.964303,0.000000,18.664397> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.574503,0.000000,19.833794>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.574503,0.000000,20.613391>}
box{<0,0,-0.050800><0.779597,0.036000,0.050800> rotate<0,90.000000,0> translate<20.574503,0.000000,20.613391> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.964303,0.000000,21.003191>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<21.159200,0.000000,21.198087>}
box{<0,0,-0.050800><0.275626,0.036000,0.050800> rotate<0,-44.997030,0> translate<20.964303,0.000000,21.003191> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<21.159200,0.000000,21.198087>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<21.159200,0.000000,21.587888>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,90.000000,0> translate<21.159200,0.000000,21.587888> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<21.159200,0.000000,21.587888>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.964303,0.000000,21.782788>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,44.997489,0> translate<20.964303,0.000000,21.782788> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.964303,0.000000,21.782788>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.184703,0.000000,21.782788>}
box{<0,0,-0.050800><0.779600,0.036000,0.050800> rotate<0,0.000000,0> translate<20.184703,0.000000,21.782788> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.184703,0.000000,21.782788>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.989803,0.000000,21.587888>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<19.989803,0.000000,21.587888> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.989803,0.000000,21.587888>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.989803,0.000000,21.198087>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,-90.000000,0> translate<19.989803,0.000000,21.198087> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.989803,0.000000,21.198087>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.184703,0.000000,21.003191>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,44.996571,0> translate<19.989803,0.000000,21.198087> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.184703,0.000000,21.003191>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.379603,0.000000,21.003191>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,0.000000,0> translate<20.184703,0.000000,21.003191> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.379603,0.000000,21.003191>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.574503,0.000000,21.198087>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,-44.996571,0> translate<20.379603,0.000000,21.003191> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.574503,0.000000,21.198087>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.574503,0.000000,21.782788>}
box{<0,0,-0.050800><0.584700,0.036000,0.050800> rotate<0,90.000000,0> translate<20.574503,0.000000,21.782788> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.184703,0.000000,22.172588>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.989803,0.000000,22.367484>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,44.996571,0> translate<19.989803,0.000000,22.367484> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.989803,0.000000,22.367484>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.989803,0.000000,22.757284>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,90.000000,0> translate<19.989803,0.000000,22.757284> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.989803,0.000000,22.757284>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.184703,0.000000,22.952184>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<19.989803,0.000000,22.757284> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.184703,0.000000,22.952184>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.379603,0.000000,22.952184>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,0.000000,0> translate<20.184703,0.000000,22.952184> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.379603,0.000000,22.952184>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.574503,0.000000,22.757284>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,44.997030,0> translate<20.379603,0.000000,22.952184> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.574503,0.000000,22.757284>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.769403,0.000000,22.952184>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<20.574503,0.000000,22.757284> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.769403,0.000000,22.952184>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.964303,0.000000,22.952184>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,0.000000,0> translate<20.769403,0.000000,22.952184> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.964303,0.000000,22.952184>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<21.159200,0.000000,22.757284>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,44.997489,0> translate<20.964303,0.000000,22.952184> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<21.159200,0.000000,22.757284>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<21.159200,0.000000,22.367484>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,-90.000000,0> translate<21.159200,0.000000,22.367484> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<21.159200,0.000000,22.367484>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.964303,0.000000,22.172588>}
box{<0,0,-0.050800><0.275626,0.036000,0.050800> rotate<0,-44.997030,0> translate<20.964303,0.000000,22.172588> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.964303,0.000000,22.172588>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.769403,0.000000,22.172588>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,0.000000,0> translate<20.769403,0.000000,22.172588> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.769403,0.000000,22.172588>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.574503,0.000000,22.367484>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,44.996571,0> translate<20.574503,0.000000,22.367484> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.574503,0.000000,22.367484>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.379603,0.000000,22.172588>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,-44.996571,0> translate<20.379603,0.000000,22.172588> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.379603,0.000000,22.172588>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.184703,0.000000,22.172588>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,0.000000,0> translate<20.184703,0.000000,22.172588> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.574503,0.000000,22.367484>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.574503,0.000000,22.757284>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,90.000000,0> translate<20.574503,0.000000,22.757284> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.964303,0.000000,23.341984>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.184703,0.000000,23.341984>}
box{<0,0,-0.050800><0.779600,0.036000,0.050800> rotate<0,0.000000,0> translate<20.184703,0.000000,23.341984> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.184703,0.000000,23.341984>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.989803,0.000000,23.536881>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,44.996571,0> translate<19.989803,0.000000,23.536881> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.989803,0.000000,23.536881>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.989803,0.000000,23.926681>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,90.000000,0> translate<19.989803,0.000000,23.926681> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.989803,0.000000,23.926681>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.184703,0.000000,24.121581>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<19.989803,0.000000,23.926681> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.184703,0.000000,24.121581>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.964303,0.000000,24.121581>}
box{<0,0,-0.050800><0.779600,0.036000,0.050800> rotate<0,0.000000,0> translate<20.184703,0.000000,24.121581> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.964303,0.000000,24.121581>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<21.159200,0.000000,23.926681>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,44.997489,0> translate<20.964303,0.000000,24.121581> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<21.159200,0.000000,23.926681>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<21.159200,0.000000,23.536881>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,-90.000000,0> translate<21.159200,0.000000,23.536881> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<21.159200,0.000000,23.536881>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.964303,0.000000,23.341984>}
box{<0,0,-0.050800><0.275626,0.036000,0.050800> rotate<0,-44.997030,0> translate<20.964303,0.000000,23.341984> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.964303,0.000000,23.341984>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.184703,0.000000,24.121581>}
box{<0,0,-0.050800><1.102519,0.036000,0.050800> rotate<0,44.996915,0> translate<20.184703,0.000000,24.121581> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.379603,0.000000,24.511381>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.989803,0.000000,24.901178>}
box{<0,0,-0.050800><0.551258,0.036000,0.050800> rotate<0,44.996801,0> translate<19.989803,0.000000,24.901178> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.989803,0.000000,24.901178>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<21.159200,0.000000,24.901178>}
box{<0,0,-0.050800><1.169397,0.036000,0.050800> rotate<0,0.000000,0> translate<19.989803,0.000000,24.901178> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<21.159200,0.000000,24.511381>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<21.159200,0.000000,25.290978>}
box{<0,0,-0.050800><0.779597,0.036000,0.050800> rotate<0,90.000000,0> translate<21.159200,0.000000,25.290978> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.279200,0.000000,19.522403>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.279200,0.000000,19.912200>}
box{<0,0,-0.050800><0.389797,0.036000,0.050800> rotate<0,90.000000,0> translate<13.279200,0.000000,19.912200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.279200,0.000000,19.717300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.109803,0.000000,19.717300>}
box{<0,0,-0.050800><1.169397,0.036000,0.050800> rotate<0,0.000000,0> translate<12.109803,0.000000,19.717300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.109803,0.000000,19.522403>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.109803,0.000000,19.912200>}
box{<0,0,-0.050800><0.389797,0.036000,0.050800> rotate<0,90.000000,0> translate<12.109803,0.000000,19.912200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.304703,0.000000,21.081597>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.109803,0.000000,20.886697>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<12.109803,0.000000,20.886697> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.109803,0.000000,20.886697>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.109803,0.000000,20.496897>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,-90.000000,0> translate<12.109803,0.000000,20.496897> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.109803,0.000000,20.496897>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.304703,0.000000,20.302000>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,44.996571,0> translate<12.109803,0.000000,20.496897> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.304703,0.000000,20.302000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.084303,0.000000,20.302000>}
box{<0,0,-0.050800><0.779600,0.036000,0.050800> rotate<0,0.000000,0> translate<12.304703,0.000000,20.302000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.084303,0.000000,20.302000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.279200,0.000000,20.496897>}
box{<0,0,-0.050800><0.275626,0.036000,0.050800> rotate<0,-44.997030,0> translate<13.084303,0.000000,20.302000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.279200,0.000000,20.496897>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.279200,0.000000,20.886697>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,90.000000,0> translate<13.279200,0.000000,20.886697> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.279200,0.000000,20.886697>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.084303,0.000000,21.081597>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,44.997489,0> translate<13.084303,0.000000,21.081597> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.499603,0.000000,21.471397>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.109803,0.000000,21.861194>}
box{<0,0,-0.050800><0.551258,0.036000,0.050800> rotate<0,44.996801,0> translate<12.109803,0.000000,21.861194> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.109803,0.000000,21.861194>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.279200,0.000000,21.861194>}
box{<0,0,-0.050800><1.169397,0.036000,0.050800> rotate<0,0.000000,0> translate<12.109803,0.000000,21.861194> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.279200,0.000000,21.471397>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.279200,0.000000,22.250994>}
box{<0,0,-0.050800><0.779597,0.036000,0.050800> rotate<0,90.000000,0> translate<13.279200,0.000000,22.250994> }
//JP1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.655000,-1.536000,11.960000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.290000,-1.536000,11.325000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<18.655000,-1.536000,11.960000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.290000,-1.536000,10.055000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.655000,-1.536000,9.420000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<18.655000,-1.536000,9.420000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.655000,-1.536000,9.420000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.290000,-1.536000,8.785000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<18.655000,-1.536000,9.420000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.290000,-1.536000,7.515000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.655000,-1.536000,6.880000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<18.655000,-1.536000,6.880000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.655000,-1.536000,6.880000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.290000,-1.536000,6.245000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<18.655000,-1.536000,6.880000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.290000,-1.536000,4.975000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.655000,-1.536000,4.340000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<18.655000,-1.536000,4.340000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.655000,-1.536000,11.960000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.845000,-1.536000,11.960000>}
box{<0,0,-0.076200><3.810000,0.036000,0.076200> rotate<0,0.000000,0> translate<14.845000,-1.536000,11.960000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.845000,-1.536000,11.960000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.210000,-1.536000,11.325000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<14.210000,-1.536000,11.325000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.210000,-1.536000,11.325000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.210000,-1.536000,10.055000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<14.210000,-1.536000,10.055000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.210000,-1.536000,10.055000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.845000,-1.536000,9.420000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<14.210000,-1.536000,10.055000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.845000,-1.536000,9.420000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.210000,-1.536000,8.785000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<14.210000,-1.536000,8.785000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.210000,-1.536000,8.785000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.210000,-1.536000,7.515000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<14.210000,-1.536000,7.515000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.210000,-1.536000,7.515000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.845000,-1.536000,6.880000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<14.210000,-1.536000,7.515000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.845000,-1.536000,6.880000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.210000,-1.536000,6.245000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<14.210000,-1.536000,6.245000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.210000,-1.536000,6.245000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.210000,-1.536000,4.975000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<14.210000,-1.536000,4.975000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.210000,-1.536000,4.975000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.845000,-1.536000,4.340000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<14.210000,-1.536000,4.975000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.845000,-1.536000,9.420000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.655000,-1.536000,9.420000>}
box{<0,0,-0.076200><3.810000,0.036000,0.076200> rotate<0,0.000000,0> translate<14.845000,-1.536000,9.420000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.845000,-1.536000,6.880000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.655000,-1.536000,6.880000>}
box{<0,0,-0.076200><3.810000,0.036000,0.076200> rotate<0,0.000000,0> translate<14.845000,-1.536000,6.880000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.845000,-1.536000,4.340000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.655000,-1.536000,4.340000>}
box{<0,0,-0.076200><3.810000,0.036000,0.076200> rotate<0,0.000000,0> translate<14.845000,-1.536000,4.340000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.290000,-1.536000,6.245000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.290000,-1.536000,4.975000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<19.290000,-1.536000,4.975000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.290000,-1.536000,8.785000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.290000,-1.536000,7.515000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<19.290000,-1.536000,7.515000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.290000,-1.536000,11.325000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.290000,-1.536000,10.055000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<19.290000,-1.536000,10.055000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.655000,-1.536000,4.340000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.290000,-1.536000,3.705000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<18.655000,-1.536000,4.340000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.290000,-1.536000,2.435000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.655000,-1.536000,1.800000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<18.655000,-1.536000,1.800000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.845000,-1.536000,4.340000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.210000,-1.536000,3.705000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<14.210000,-1.536000,3.705000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.210000,-1.536000,3.705000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.210000,-1.536000,2.435000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<14.210000,-1.536000,2.435000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.210000,-1.536000,2.435000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.845000,-1.536000,1.800000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<14.210000,-1.536000,2.435000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.845000,-1.536000,1.800000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.655000,-1.536000,1.800000>}
box{<0,0,-0.076200><3.810000,0.036000,0.076200> rotate<0,0.000000,0> translate<14.845000,-1.536000,1.800000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.290000,-1.536000,3.705000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.290000,-1.536000,2.435000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<19.290000,-1.536000,2.435000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<18.020000,-1.536000,10.690000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<15.480000,-1.536000,10.690000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<15.480000,-1.536000,8.150000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<18.020000,-1.536000,8.150000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<15.480000,-1.536000,5.610000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<18.020000,-1.536000,5.610000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<15.480000,-1.536000,3.070000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<18.020000,-1.536000,3.070000>}
//R1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.005000,0.000000,19.021200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.005000,0.000000,17.598800>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,-90.000000,0> translate<25.005000,0.000000,17.598800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.275000,0.000000,19.021200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.275000,0.000000,17.598800>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,-90.000000,0> translate<26.275000,0.000000,17.598800> }
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-90.000000,0> translate<25.640000,0.000000,17.446400>}
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-90.000000,0> translate<25.640000,0.000000,19.173600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<26.219200,0.000000,14.190800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.049803,0.000000,14.190800>}
box{<0,0,-0.050800><1.169397,0.036000,0.050800> rotate<0,0.000000,0> translate<25.049803,0.000000,14.190800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.049803,0.000000,14.190800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.049803,0.000000,14.775497>}
box{<0,0,-0.050800><0.584697,0.036000,0.050800> rotate<0,90.000000,0> translate<25.049803,0.000000,14.775497> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.049803,0.000000,14.775497>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.244703,0.000000,14.970397>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<25.049803,0.000000,14.775497> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.244703,0.000000,14.970397>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.634503,0.000000,14.970397>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<25.244703,0.000000,14.970397> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.634503,0.000000,14.970397>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.829403,0.000000,14.775497>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,44.997030,0> translate<25.634503,0.000000,14.970397> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.829403,0.000000,14.775497>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.829403,0.000000,14.190800>}
box{<0,0,-0.050800><0.584697,0.036000,0.050800> rotate<0,-90.000000,0> translate<25.829403,0.000000,14.190800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.829403,0.000000,14.580597>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<26.219200,0.000000,14.970397>}
box{<0,0,-0.050800><0.551258,0.036000,0.050800> rotate<0,-44.997260,0> translate<25.829403,0.000000,14.580597> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.439603,0.000000,15.360197>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.049803,0.000000,15.749994>}
box{<0,0,-0.050800><0.551258,0.036000,0.050800> rotate<0,44.996801,0> translate<25.049803,0.000000,15.749994> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.049803,0.000000,15.749994>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<26.219200,0.000000,15.749994>}
box{<0,0,-0.050800><1.169397,0.036000,0.050800> rotate<0,0.000000,0> translate<25.049803,0.000000,15.749994> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<26.219200,0.000000,15.360197>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<26.219200,0.000000,16.139794>}
box{<0,0,-0.050800><0.779597,0.036000,0.050800> rotate<0,90.000000,0> translate<26.219200,0.000000,16.139794> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.249603,0.000000,20.390800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.859803,0.000000,20.780597>}
box{<0,0,-0.050800><0.551258,0.036000,0.050800> rotate<0,44.996801,0> translate<24.859803,0.000000,20.780597> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.859803,0.000000,20.780597>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<26.029200,0.000000,20.780597>}
box{<0,0,-0.050800><1.169397,0.036000,0.050800> rotate<0,0.000000,0> translate<24.859803,0.000000,20.780597> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<26.029200,0.000000,20.390800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<26.029200,0.000000,21.170397>}
box{<0,0,-0.050800><0.779597,0.036000,0.050800> rotate<0,90.000000,0> translate<26.029200,0.000000,21.170397> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<26.029200,0.000000,21.560197>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.859803,0.000000,21.560197>}
box{<0,0,-0.050800><1.169397,0.036000,0.050800> rotate<0,0.000000,0> translate<24.859803,0.000000,21.560197> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<26.029200,0.000000,22.144894>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.639403,0.000000,21.560197>}
box{<0,0,-0.050800><0.702718,0.036000,0.050800> rotate<0,-56.306287,0> translate<25.639403,0.000000,21.560197> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.639403,0.000000,21.560197>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.249603,0.000000,22.144894>}
box{<0,0,-0.050800><0.702719,0.036000,0.050800> rotate<0,56.306075,0> translate<25.249603,0.000000,22.144894> }

texture{col_slk}
}
#end
translate<mac_x_ver,mac_y_ver,mac_z_ver>
rotate<mac_x_rot,mac_y_rot,mac_z_rot>
}//End union
#end

#if(use_file_as_inc=off)
object{  APDS_9801(-16.850000,0,-16.250000,pcb_rotate_x,pcb_rotate_y,pcb_rotate_z)
#if(pcb_upsidedown=on)
rotate pcb_rotdir*180
#end
}
#end


//Parts not found in 3dpack.dat or 3dusrpac.dat are:
