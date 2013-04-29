//POVRay-Datei erstellt mit 3d41.ulp v20110101
///home/flexxxv/eagle/BEEP_0.1/TCS32X0.brd
//28.04.13 15:30

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
#local cam_y = 160;
#local cam_z = -85;
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

#local lgt1_pos_x = 11;
#local lgt1_pos_y = 21;
#local lgt1_pos_z = 19;
#local lgt1_intense = 0.715807;
#local lgt2_pos_x = -11;
#local lgt2_pos_y = 21;
#local lgt2_pos_z = 19;
#local lgt2_intense = 0.715807;
#local lgt3_pos_x = 11;
#local lgt3_pos_y = 21;
#local lgt3_pos_z = -13;
#local lgt3_intense = 0.715807;
#local lgt4_pos_x = -11;
#local lgt4_pos_y = 21;
#local lgt4_pos_z = -13;
#local lgt4_intense = 0.715807;

//Do not change these values
#declare pcb_height = 1.500000;
#declare pcb_cuheight = 0.035000;
#declare pcb_x_size = 29.642000;
#declare pcb_y_size = 37.328000;
#declare pcb_layer1_used = 1;
#declare pcb_layer16_used = 0;
#declare inc_testmode = off;
#declare global_seed=seed(646);
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
	//translate<-14.821000,0,-18.664000>
}
#end

background{col_bgr}
light_source{<lgt1_pos_x,lgt1_pos_y,lgt1_pos_z> White*lgt1_intense shadowless}
light_source{<lgt2_pos_x,lgt2_pos_y,lgt2_pos_z> White*lgt2_intense shadowless}
light_source{<lgt3_pos_x,lgt3_pos_y,lgt3_pos_z> White*lgt3_intense shadowless}
light_source{<lgt4_pos_x,lgt4_pos_y,lgt4_pos_z> White*lgt4_intense}
#end


#macro TCS32X0(mac_x_ver,mac_y_ver,mac_z_ver,mac_x_rot,mac_y_rot,mac_z_rot)
union{
#if(pcb_board = on)
difference{
union{
//Platine
prism{-1.500000,0.000000,8
<0.000000,0.000000><29.642000,0.000000>
<29.642000,0.000000><29.642000,37.328000>
<29.642000,37.328000><0.000000,37.328000>
<0.000000,37.328000><0.000000,0.000000>
texture{col_brd}}
}//End union(PCB)
//Bohrungen(real)/Bauteile
cylinder{<4.064000,1,4.064000><4.064000,-5,4.064000>1.600000 texture{col_hls}}
cylinder{<25.654000,1,4.064000><25.654000,-5,4.064000>1.600000 texture{col_hls}}
cylinder{<25.654000,1,33.274000><25.654000,-5,33.274000>1.600000 texture{col_hls}}
//Bohrungen(real)/Platine
//Bohrungen(real)/Durchkontaktierungen
}//End difference(reale Bohrungen/Durchbrüche)
#end
#if(pcb_parts=on)//Bauteile
union{
}//End union
#end
#if(pcb_pads_smds=on)
//Lötaugen&SMD/Bauteile
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<14.036000,0.000000,17.780000>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<15.936000,0.000000,17.780000>}
object{TOOLS_PCB_SMD(0.500000,2.500000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<12.661000,0.000000,20.447000>}
object{TOOLS_PCB_SMD(0.500000,2.500000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<12.661000,0.000000,21.717000>}
object{TOOLS_PCB_SMD(0.500000,2.500000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<17.311000,0.000000,21.717000>}
object{TOOLS_PCB_SMD(0.500000,2.500000,0.037000,80) rotate<0,-270.000000,0> texture{col_pds} translate<12.661000,0.000000,24.257000>}
object{TOOLS_PCB_SMD(0.500000,2.500000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<12.661000,0.000000,22.987000>}
object{TOOLS_PCB_SMD(0.500000,2.500000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<17.311000,0.000000,22.987000>}
object{TOOLS_PCB_SMD(0.500000,2.500000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<17.311000,0.000000,24.257000>}
object{TOOLS_PCB_SMD(0.500000,2.500000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<17.311000,0.000000,20.447000>}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<16.256000,0,13.970000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<13.716000,0,13.970000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<16.256000,0,11.430000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<13.716000,0,11.430000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<16.256000,0,8.890000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<13.716000,0,8.890000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<16.256000,0,6.350000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<13.716000,0,6.350000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<16.256000,0,3.810000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<13.716000,0,3.810000> texture{col_thl}}
#ifndef(global_pack_LED1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<13.716000,0,32.766000> texture{col_thl}}
#ifndef(global_pack_LED1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<16.256000,0,32.766000> texture{col_thl}}
#ifndef(global_pack_LED2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<3.810000,0,19.304000> texture{col_thl}}
#ifndef(global_pack_LED2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<6.350000,0,19.304000> texture{col_thl}}
#ifndef(global_pack_LED3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<26.416000,0,18.542000> texture{col_thl}}
#ifndef(global_pack_LED3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<23.876000,0,18.542000> texture{col_thl}}
object{TOOLS_PCB_SMD(1.300000,3.800000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<13.636000,0.000000,29.718000>}
object{TOOLS_PCB_SMD(1.300000,3.800000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<16.336000,0.000000,29.718000>}
object{TOOLS_PCB_SMD(1.300000,3.800000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<3.730000,0.000000,16.256000>}
object{TOOLS_PCB_SMD(1.300000,3.800000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<6.430000,0.000000,16.256000>}
object{TOOLS_PCB_SMD(1.300000,3.800000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<26.496000,0.000000,15.240000>}
object{TOOLS_PCB_SMD(1.300000,3.800000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<23.796000,0.000000,15.240000>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<4.826000,0.000000,26.736000>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<4.826000,0.000000,28.636000>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<11.430000,0.000000,28.636000>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<11.430000,0.000000,26.736000>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<8.128000,0.000000,28.636000>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<8.128000,0.000000,26.736000>}
//Lötaugen/Durchkontaktierungen
#end
#if(pcb_wires=on)
union{
//Signale
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<2.286000,0.000000,28.194000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<2.286000,0.000000,13.716000>}
box{<0,0,-0.406400><14.478000,0.035000,0.406400> rotate<0,-90.000000,0> translate<2.286000,0.000000,13.716000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<2.286000,0.000000,28.194000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<3.048000,0.000000,28.956000>}
box{<0,0,-0.406400><1.077631,0.035000,0.406400> rotate<0,-44.997030,0> translate<2.286000,0.000000,28.194000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<2.286000,0.000000,13.716000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<3.302000,0.000000,12.700000>}
box{<0,0,-0.406400><1.436841,0.035000,0.406400> rotate<0,44.997030,0> translate<2.286000,0.000000,13.716000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<3.302000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<3.810000,0.000000,12.700000>}
box{<0,0,-0.406400><0.508000,0.035000,0.406400> rotate<0,0.000000,0> translate<3.302000,0.000000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<3.730000,0.000000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<3.810000,0.000000,16.336000>}
box{<0,0,-0.406400><0.113137,0.035000,0.406400> rotate<0,-44.997030,0> translate<3.730000,0.000000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<3.810000,0.000000,19.304000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<3.810000,0.000000,16.336000>}
box{<0,0,-0.406400><2.968000,0.035000,0.406400> rotate<0,-90.000000,0> translate<3.810000,0.000000,16.336000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<3.810000,0.000000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<3.810000,0.000000,19.304000>}
box{<0,0,-0.406400><6.096000,0.035000,0.406400> rotate<0,-90.000000,0> translate<3.810000,0.000000,19.304000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<3.810000,0.000000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<5.014000,0.000000,26.604000>}
box{<0,0,-0.406400><1.702713,0.035000,0.406400> rotate<0,-44.997030,0> translate<3.810000,0.000000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<4.826000,0.000000,26.736000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<5.014000,0.000000,26.604000>}
box{<0,0,-0.254000><0.229713,0.035000,0.254000> rotate<0,35.071440,0> translate<4.826000,0.000000,26.736000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<3.048000,0.000000,28.956000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<5.014000,0.000000,28.956000>}
box{<0,0,-0.406400><1.966000,0.035000,0.406400> rotate<0,0.000000,0> translate<3.048000,0.000000,28.956000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.826000,0.000000,28.636000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.014000,0.000000,28.956000>}
box{<0,0,-0.203200><0.371139,0.035000,0.203200> rotate<0,-59.561833,0> translate<4.826000,0.000000,28.636000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<4.826000,0.000000,28.636000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<5.654000,0.000000,28.636000>}
box{<0,0,-0.406400><0.828000,0.035000,0.406400> rotate<0,0.000000,0> translate<4.826000,0.000000,28.636000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.350000,0.000000,15.494000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.350000,0.000000,16.176000>}
box{<0,0,-0.203200><0.682000,0.035000,0.203200> rotate<0,90.000000,0> translate<6.350000,0.000000,16.176000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<6.350000,0.000000,21.844000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<6.350000,0.000000,19.304000>}
box{<0,0,-0.406400><2.540000,0.035000,0.406400> rotate<0,-90.000000,0> translate<6.350000,0.000000,19.304000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.350000,0.000000,16.176000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.430000,0.000000,16.256000>}
box{<0,0,-0.203200><0.113137,0.035000,0.203200> rotate<0,-44.997030,0> translate<6.350000,0.000000,16.176000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.350000,0.000000,19.304000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.430000,0.000000,19.224000>}
box{<0,0,-0.203200><0.113137,0.035000,0.203200> rotate<0,44.997030,0> translate<6.350000,0.000000,19.304000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<6.430000,0.000000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<6.430000,0.000000,19.224000>}
box{<0,0,-0.406400><2.968000,0.035000,0.406400> rotate<0,90.000000,0> translate<6.430000,0.000000,19.224000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<5.654000,0.000000,28.636000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<7.366000,0.000000,26.924000>}
box{<0,0,-0.406400><2.421134,0.035000,0.406400> rotate<0,44.997030,0> translate<5.654000,0.000000,28.636000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.874000,0.000000,15.494000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.874000,0.000000,21.590000>}
box{<0,0,-0.203200><6.096000,0.035000,0.203200> rotate<0,90.000000,0> translate<7.874000,0.000000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<7.366000,0.000000,26.924000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<7.940000,0.000000,26.924000>}
box{<0,0,-0.406400><0.574000,0.035000,0.406400> rotate<0,0.000000,0> translate<7.366000,0.000000,26.924000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<7.940000,0.000000,26.924000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<8.128000,0.000000,26.736000>}
box{<0,0,-0.406400><0.265872,0.035000,0.406400> rotate<0,44.997030,0> translate<7.940000,0.000000,26.924000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<8.128000,0.000000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<8.128000,0.000000,28.636000>}
box{<0,0,-0.406400><4.384000,0.035000,0.406400> rotate<0,-90.000000,0> translate<8.128000,0.000000,28.636000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.890000,0.000000,15.748000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.890000,0.000000,20.828000>}
box{<0,0,-0.203200><5.080000,0.035000,0.203200> rotate<0,90.000000,0> translate<8.890000,0.000000,20.828000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<6.350000,0.000000,15.494000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<9.144000,0.000000,12.700000>}
box{<0,0,-0.406400><3.951313,0.035000,0.406400> rotate<0,44.997030,0> translate<6.350000,0.000000,15.494000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<9.144000,0.000000,9.144000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<9.144000,0.000000,12.700000>}
box{<0,0,-0.406400><3.556000,0.035000,0.406400> rotate<0,90.000000,0> translate<9.144000,0.000000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.906000,0.000000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.906000,0.000000,20.320000>}
box{<0,0,-0.203200><3.810000,0.035000,0.203200> rotate<0,90.000000,0> translate<9.906000,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<6.350000,0.000000,21.844000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<9.906000,0.000000,25.400000>}
box{<0,0,-0.406400><5.028943,0.035000,0.406400> rotate<0,-44.997030,0> translate<6.350000,0.000000,21.844000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<10.160000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<10.160000,0.000000,4.318000>}
box{<0,0,-0.406400><2.032000,0.035000,0.406400> rotate<0,-90.000000,0> translate<10.160000,0.000000,4.318000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<3.810000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<10.160000,0.000000,6.350000>}
box{<0,0,-0.406400><8.980256,0.035000,0.406400> rotate<0,44.997030,0> translate<3.810000,0.000000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<8.128000,0.000000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<10.160000,0.000000,35.052000>}
box{<0,0,-0.406400><2.873682,0.035000,0.406400> rotate<0,-44.997030,0> translate<8.128000,0.000000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.874000,0.000000,15.494000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.414000,0.000000,12.954000>}
box{<0,0,-0.203200><3.592102,0.035000,0.203200> rotate<0,44.997030,0> translate<7.874000,0.000000,15.494000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.414000,0.000000,9.652000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.414000,0.000000,12.954000>}
box{<0,0,-0.203200><3.302000,0.035000,0.203200> rotate<0,90.000000,0> translate<10.414000,0.000000,12.954000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<7.874000,0.000000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<10.541000,0.000000,24.257000>}
box{<0,0,-0.254000><3.771708,0.035000,0.254000> rotate<0,-44.997030,0> translate<7.874000,0.000000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.922000,0.000000,19.558000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.922000,0.000000,16.764000>}
box{<0,0,-0.203200><2.794000,0.035000,0.203200> rotate<0,-90.000000,0> translate<10.922000,0.000000,16.764000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.922000,0.000000,20.066000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.922000,0.000000,19.558000>}
box{<0,0,-0.203200><0.508000,0.035000,0.203200> rotate<0,-90.000000,0> translate<10.922000,0.000000,19.558000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<8.890000,0.000000,20.828000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<11.049000,0.000000,22.987000>}
box{<0,0,-0.254000><3.053287,0.035000,0.254000> rotate<0,-44.997030,0> translate<8.890000,0.000000,20.828000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.922000,0.000000,20.066000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.303000,0.000000,20.447000>}
box{<0,0,-0.203200><0.538815,0.035000,0.203200> rotate<0,-44.997030,0> translate<10.922000,0.000000,20.066000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<9.906000,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<11.303000,0.000000,21.717000>}
box{<0,0,-0.254000><1.975656,0.035000,0.254000> rotate<0,-44.997030,0> translate<9.906000,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.890000,0.000000,15.748000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.430000,0.000000,13.208000>}
box{<0,0,-0.203200><3.592102,0.035000,0.203200> rotate<0,44.997030,0> translate<8.890000,0.000000,15.748000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.430000,0.000000,11.176000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.430000,0.000000,13.208000>}
box{<0,0,-0.203200><2.032000,0.035000,0.203200> rotate<0,90.000000,0> translate<11.430000,0.000000,13.208000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<8.128000,0.000000,26.736000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<11.430000,0.000000,26.736000>}
box{<0,0,-0.406400><3.302000,0.035000,0.406400> rotate<0,0.000000,0> translate<8.128000,0.000000,26.736000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<11.430000,0.000000,28.636000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<11.496000,0.000000,28.702000>}
box{<0,0,-0.254000><0.093338,0.035000,0.254000> rotate<0,-44.997030,0> translate<11.430000,0.000000,28.636000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<9.144000,0.000000,9.144000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<11.938000,0.000000,6.350000>}
box{<0,0,-0.406400><3.951313,0.035000,0.406400> rotate<0,44.997030,0> translate<9.144000,0.000000,9.144000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<11.938000,0.000000,5.588000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<11.938000,0.000000,6.350000>}
box{<0,0,-0.406400><0.762000,0.035000,0.406400> rotate<0,90.000000,0> translate<11.938000,0.000000,6.350000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<10.160000,0.000000,4.318000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<12.192000,0.000000,2.286000>}
box{<0,0,-0.406400><2.873682,0.035000,0.406400> rotate<0,44.997030,0> translate<10.160000,0.000000,4.318000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.906000,0.000000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.446000,0.000000,13.970000>}
box{<0,0,-0.203200><3.592102,0.035000,0.203200> rotate<0,44.997030,0> translate<9.906000,0.000000,16.510000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.446000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.446000,0.000000,13.970000>}
box{<0,0,-0.203200><1.270000,0.035000,0.203200> rotate<0,90.000000,0> translate<12.446000,0.000000,13.970000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<11.496000,0.000000,28.702000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<12.446000,0.000000,28.702000>}
box{<0,0,-0.406400><0.950000,0.035000,0.406400> rotate<0,0.000000,0> translate<11.496000,0.000000,28.702000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.303000,0.000000,20.447000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.661000,0.000000,20.447000>}
box{<0,0,-0.203200><1.358000,0.035000,0.203200> rotate<0,0.000000,0> translate<11.303000,0.000000,20.447000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<11.303000,0.000000,21.717000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<12.661000,0.000000,21.717000>}
box{<0,0,-0.254000><1.358000,0.035000,0.254000> rotate<0,0.000000,0> translate<11.303000,0.000000,21.717000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<11.049000,0.000000,22.987000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<12.661000,0.000000,22.987000>}
box{<0,0,-0.254000><1.612000,0.035000,0.254000> rotate<0,0.000000,0> translate<11.049000,0.000000,22.987000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<10.541000,0.000000,24.257000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<12.661000,0.000000,24.257000>}
box{<0,0,-0.254000><2.120000,0.035000,0.254000> rotate<0,0.000000,0> translate<10.541000,0.000000,24.257000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.922000,0.000000,19.558000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.700000,0.000000,17.780000>}
box{<0,0,-0.203200><2.514472,0.035000,0.203200> rotate<0,44.997030,0> translate<10.922000,0.000000,19.558000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<11.938000,0.000000,5.588000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<13.716000,0.000000,3.810000>}
box{<0,0,-0.406400><2.514472,0.035000,0.406400> rotate<0,44.997030,0> translate<11.938000,0.000000,5.588000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.414000,0.000000,9.652000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.716000,0.000000,6.350000>}
box{<0,0,-0.203200><4.669733,0.035000,0.203200> rotate<0,44.997030,0> translate<10.414000,0.000000,9.652000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.430000,0.000000,11.176000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.716000,0.000000,8.890000>}
box{<0,0,-0.203200><3.232892,0.035000,0.203200> rotate<0,44.997030,0> translate<11.430000,0.000000,11.176000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.446000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.716000,0.000000,11.430000>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,44.997030,0> translate<12.446000,0.000000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.922000,0.000000,16.764000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.716000,0.000000,13.970000>}
box{<0,0,-0.203200><3.951313,0.035000,0.203200> rotate<0,44.997030,0> translate<10.922000,0.000000,16.764000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.636000,0.000000,29.718000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.716000,0.000000,29.798000>}
box{<0,0,-0.203200><0.113137,0.035000,0.203200> rotate<0,-44.997030,0> translate<13.636000,0.000000,29.718000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.716000,0.000000,29.972000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.716000,0.000000,29.798000>}
box{<0,0,-0.203200><0.174000,0.035000,0.203200> rotate<0,-90.000000,0> translate<13.716000,0.000000,29.798000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<12.446000,0.000000,28.702000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<13.716000,0.000000,29.972000>}
box{<0,0,-0.406400><1.796051,0.035000,0.406400> rotate<0,-44.997030,0> translate<12.446000,0.000000,28.702000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.716000,0.000000,29.972000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.716000,0.000000,32.766000>}
box{<0,0,-0.203200><2.794000,0.035000,0.203200> rotate<0,90.000000,0> translate<13.716000,0.000000,32.766000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.700000,0.000000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.036000,0.000000,17.780000>}
box{<0,0,-0.203200><1.336000,0.035000,0.203200> rotate<0,0.000000,0> translate<12.700000,0.000000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.208000,0.000000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.036000,0.000000,17.780000>}
box{<0,0,-0.203200><0.828000,0.035000,0.203200> rotate<0,0.000000,0> translate<13.208000,0.000000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<9.906000,0.000000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<14.478000,0.000000,25.400000>}
box{<0,0,-0.406400><4.572000,0.035000,0.406400> rotate<0,0.000000,0> translate<9.906000,0.000000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<12.192000,0.000000,2.286000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<14.732000,0.000000,2.286000>}
box{<0,0,-0.406400><2.540000,0.035000,0.406400> rotate<0,0.000000,0> translate<12.192000,0.000000,2.286000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.716000,0.000000,3.810000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.986000,0.000000,5.080000>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,-44.997030,0> translate<13.716000,0.000000,3.810000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.716000,0.000000,13.970000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.986000,0.000000,12.700000>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,44.997030,0> translate<13.716000,0.000000,13.970000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.986000,0.000000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.986000,0.000000,12.700000>}
box{<0,0,-0.203200><7.620000,0.035000,0.203200> rotate<0,90.000000,0> translate<14.986000,0.000000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<14.732000,0.000000,2.286000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<16.256000,0.000000,3.810000>}
box{<0,0,-0.406400><2.155261,0.035000,0.406400> rotate<0,-44.997030,0> translate<14.732000,0.000000,2.286000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<14.478000,0.000000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<16.336000,0.000000,27.258000>}
box{<0,0,-0.406400><2.627609,0.035000,0.406400> rotate<0,-44.997030,0> translate<14.478000,0.000000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<16.336000,0.000000,29.718000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<16.336000,0.000000,27.258000>}
box{<0,0,-0.406400><2.460000,0.035000,0.406400> rotate<0,-90.000000,0> translate<16.336000,0.000000,27.258000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.256000,0.000000,32.766000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.336000,0.000000,32.686000>}
box{<0,0,-0.203200><0.113137,0.035000,0.203200> rotate<0,44.997030,0> translate<16.256000,0.000000,32.766000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.336000,0.000000,29.718000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.336000,0.000000,32.686000>}
box{<0,0,-0.203200><2.968000,0.035000,0.203200> rotate<0,90.000000,0> translate<16.336000,0.000000,32.686000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.936000,0.000000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.764000,0.000000,17.780000>}
box{<0,0,-0.203200><0.828000,0.035000,0.203200> rotate<0,0.000000,0> translate<15.936000,0.000000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<10.160000,0.000000,35.052000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<16.764000,0.000000,35.052000>}
box{<0,0,-0.406400><6.604000,0.035000,0.406400> rotate<0,0.000000,0> translate<10.160000,0.000000,35.052000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<16.336000,0.000000,27.258000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<17.178000,0.000000,26.416000>}
box{<0,0,-0.406400><1.190768,0.035000,0.406400> rotate<0,44.997030,0> translate<16.336000,0.000000,27.258000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.145000,0.000000,24.257000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.311000,0.000000,24.257000>}
box{<0,0,-0.254000><0.166000,0.035000,0.254000> rotate<0,0.000000,0> translate<17.145000,0.000000,24.257000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.764000,0.000000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.542000,0.000000,19.558000>}
box{<0,0,-0.203200><2.514472,0.035000,0.203200> rotate<0,-44.997030,0> translate<16.764000,0.000000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.542000,0.000000,19.558000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.542000,0.000000,20.320000>}
box{<0,0,-0.203200><0.762000,0.035000,0.203200> rotate<0,90.000000,0> translate<18.542000,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<16.764000,0.000000,35.052000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<18.542000,0.000000,33.274000>}
box{<0,0,-0.406400><2.514472,0.035000,0.406400> rotate<0,44.997030,0> translate<16.764000,0.000000,35.052000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<18.542000,0.000000,29.718000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<18.542000,0.000000,33.274000>}
box{<0,0,-0.406400><3.556000,0.035000,0.406400> rotate<0,90.000000,0> translate<18.542000,0.000000,33.274000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.311000,0.000000,20.447000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<18.669000,0.000000,20.447000>}
box{<0,0,-0.254000><1.358000,0.035000,0.254000> rotate<0,0.000000,0> translate<17.311000,0.000000,20.447000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<18.542000,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<18.669000,0.000000,20.447000>}
box{<0,0,-0.254000><0.179605,0.035000,0.254000> rotate<0,-44.997030,0> translate<18.542000,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.669000,0.000000,20.447000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.923000,0.000000,20.447000>}
box{<0,0,-0.203200><0.254000,0.035000,0.203200> rotate<0,0.000000,0> translate<18.669000,0.000000,20.447000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.311000,0.000000,21.717000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<19.177000,0.000000,21.717000>}
box{<0,0,-0.254000><1.866000,0.035000,0.254000> rotate<0,0.000000,0> translate<17.311000,0.000000,21.717000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.256000,0.000000,13.970000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.304000,0.000000,17.018000>}
box{<0,0,-0.203200><4.310523,0.035000,0.203200> rotate<0,-44.997030,0> translate<16.256000,0.000000,13.970000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.304000,0.000000,20.066000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.304000,0.000000,17.018000>}
box{<0,0,-0.203200><3.048000,0.035000,0.203200> rotate<0,-90.000000,0> translate<19.304000,0.000000,17.018000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.923000,0.000000,20.447000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.304000,0.000000,20.066000>}
box{<0,0,-0.203200><0.538815,0.035000,0.203200> rotate<0,44.997030,0> translate<18.923000,0.000000,20.447000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<17.178000,0.000000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<19.304000,0.000000,26.416000>}
box{<0,0,-0.406400><2.126000,0.035000,0.406400> rotate<0,0.000000,0> translate<17.178000,0.000000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.311000,0.000000,22.987000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<19.431000,0.000000,22.987000>}
box{<0,0,-0.254000><2.120000,0.035000,0.254000> rotate<0,0.000000,0> translate<17.311000,0.000000,22.987000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.311000,0.000000,24.257000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<20.193000,0.000000,24.257000>}
box{<0,0,-0.254000><2.882000,0.035000,0.254000> rotate<0,0.000000,0> translate<17.311000,0.000000,24.257000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.256000,0.000000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.320000,0.000000,15.494000>}
box{<0,0,-0.203200><5.747364,0.035000,0.203200> rotate<0,-44.997030,0> translate<16.256000,0.000000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<19.177000,0.000000,21.717000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<20.320000,0.000000,20.574000>}
box{<0,0,-0.254000><1.616446,0.035000,0.254000> rotate<0,44.997030,0> translate<19.177000,0.000000,21.717000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<20.320000,0.000000,15.494000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<20.320000,0.000000,20.574000>}
box{<0,0,-0.254000><5.080000,0.035000,0.254000> rotate<0,90.000000,0> translate<20.320000,0.000000,20.574000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.256000,0.000000,8.890000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.336000,0.000000,13.970000>}
box{<0,0,-0.203200><7.184205,0.035000,0.203200> rotate<0,-44.997030,0> translate<16.256000,0.000000,8.890000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<19.431000,0.000000,22.987000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<21.336000,0.000000,21.082000>}
box{<0,0,-0.254000><2.694077,0.035000,0.254000> rotate<0,44.997030,0> translate<19.431000,0.000000,22.987000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<21.336000,0.000000,13.970000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<21.336000,0.000000,21.082000>}
box{<0,0,-0.254000><7.112000,0.035000,0.254000> rotate<0,90.000000,0> translate<21.336000,0.000000,21.082000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.256000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.352000,0.000000,12.446000>}
box{<0,0,-0.203200><8.621046,0.035000,0.203200> rotate<0,-44.997030,0> translate<16.256000,0.000000,6.350000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.352000,0.000000,22.098000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.352000,0.000000,12.446000>}
box{<0,0,-0.203200><9.652000,0.035000,0.203200> rotate<0,-90.000000,0> translate<22.352000,0.000000,12.446000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<20.193000,0.000000,24.257000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<22.352000,0.000000,22.098000>}
box{<0,0,-0.254000><3.053287,0.035000,0.254000> rotate<0,44.997030,0> translate<20.193000,0.000000,24.257000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.796000,0.000000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.796000,0.000000,18.462000>}
box{<0,0,-0.203200><3.222000,0.035000,0.203200> rotate<0,90.000000,0> translate<23.796000,0.000000,18.462000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<19.304000,0.000000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<23.796000,0.000000,21.924000>}
box{<0,0,-0.406400><6.352647,0.035000,0.406400> rotate<0,44.997030,0> translate<19.304000,0.000000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<23.796000,0.000000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<23.796000,0.000000,21.924000>}
box{<0,0,-0.406400><6.684000,0.035000,0.406400> rotate<0,90.000000,0> translate<23.796000,0.000000,21.924000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.796000,0.000000,18.462000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.876000,0.000000,18.542000>}
box{<0,0,-0.203200><0.113137,0.035000,0.203200> rotate<0,-44.997030,0> translate<23.796000,0.000000,18.462000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.416000,0.000000,18.542000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.416000,0.000000,15.320000>}
box{<0,0,-0.203200><3.222000,0.035000,0.203200> rotate<0,-90.000000,0> translate<26.416000,0.000000,15.320000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<18.542000,0.000000,29.718000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<26.416000,0.000000,21.844000>}
box{<0,0,-0.406400><11.135518,0.035000,0.406400> rotate<0,44.997030,0> translate<18.542000,0.000000,29.718000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<26.416000,0.000000,18.542000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<26.416000,0.000000,21.844000>}
box{<0,0,-0.406400><3.302000,0.035000,0.406400> rotate<0,90.000000,0> translate<26.416000,0.000000,21.844000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.416000,0.000000,15.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.496000,0.000000,15.240000>}
box{<0,0,-0.203200><0.113137,0.035000,0.203200> rotate<0,44.997030,0> translate<26.416000,0.000000,15.320000> }
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
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<1.269997,0.000000,7.647828>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<1.269997,0.000000,36.058000>}
box{<0,0,-0.254000><28.410172,0.035000,0.254000> rotate<0,90.000000,0> translate<1.269997,0.000000,36.058000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<1.269997,0.000000,7.647828>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<2.164722,0.000000,8.222834>}
box{<0,0,-0.254000><1.063562,0.035000,0.254000> rotate<0,-32.725177,0> translate<1.269997,0.000000,7.647828> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<1.269997,0.000000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<2.017159,0.000000,8.128000>}
box{<0,0,-0.254000><0.747163,0.035000,0.254000> rotate<0,0.000000,0> translate<1.269997,0.000000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<1.269997,0.000000,8.636000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<6.580841,0.000000,8.636000>}
box{<0,0,-0.254000><5.310844,0.035000,0.254000> rotate<0,0.000000,0> translate<1.269997,0.000000,8.636000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<1.269997,0.000000,9.144000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<6.072841,0.000000,9.144000>}
box{<0,0,-0.254000><4.802844,0.035000,0.254000> rotate<0,0.000000,0> translate<1.269997,0.000000,9.144000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<1.269997,0.000000,9.652000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<5.564841,0.000000,9.652000>}
box{<0,0,-0.254000><4.294844,0.035000,0.254000> rotate<0,0.000000,0> translate<1.269997,0.000000,9.652000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<1.269997,0.000000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<5.056841,0.000000,10.160000>}
box{<0,0,-0.254000><3.786844,0.035000,0.254000> rotate<0,0.000000,0> translate<1.269997,0.000000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<1.269997,0.000000,10.668000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<4.548841,0.000000,10.668000>}
box{<0,0,-0.254000><3.278844,0.035000,0.254000> rotate<0,0.000000,0> translate<1.269997,0.000000,10.668000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<1.269997,0.000000,11.176000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<4.040841,0.000000,11.176000>}
box{<0,0,-0.254000><2.770844,0.035000,0.254000> rotate<0,0.000000,0> translate<1.269997,0.000000,11.176000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<1.269997,0.000000,11.684000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<3.532841,0.000000,11.684000>}
box{<0,0,-0.254000><2.262844,0.035000,0.254000> rotate<0,0.000000,0> translate<1.269997,0.000000,11.684000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<1.269997,0.000000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<2.516844,0.000000,12.192000>}
box{<0,0,-0.254000><1.246847,0.035000,0.254000> rotate<0,0.000000,0> translate<1.269997,0.000000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<1.269997,0.000000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<2.008844,0.000000,12.700000>}
box{<0,0,-0.254000><0.738847,0.035000,0.254000> rotate<0,0.000000,0> translate<1.269997,0.000000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<1.269997,0.000000,13.208000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<1.506678,0.000000,13.208000>}
box{<0,0,-0.254000><0.236681,0.035000,0.254000> rotate<0,0.000000,0> translate<1.269997,0.000000,13.208000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<1.269997,0.000000,13.716000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<1.371600,0.000000,13.716000>}
box{<0,0,-0.254000><0.101603,0.035000,0.254000> rotate<0,0.000000,0> translate<1.269997,0.000000,13.716000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<1.269997,0.000000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<1.371600,0.000000,14.224000>}
box{<0,0,-0.254000><0.101603,0.035000,0.254000> rotate<0,0.000000,0> translate<1.269997,0.000000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<1.269997,0.000000,14.732000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<1.371600,0.000000,14.732000>}
box{<0,0,-0.254000><0.101603,0.035000,0.254000> rotate<0,0.000000,0> translate<1.269997,0.000000,14.732000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<1.269997,0.000000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<1.371600,0.000000,15.240000>}
box{<0,0,-0.254000><0.101603,0.035000,0.254000> rotate<0,0.000000,0> translate<1.269997,0.000000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<1.269997,0.000000,15.748000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<1.371600,0.000000,15.748000>}
box{<0,0,-0.254000><0.101603,0.035000,0.254000> rotate<0,0.000000,0> translate<1.269997,0.000000,15.748000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<1.269997,0.000000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<1.371600,0.000000,16.256000>}
box{<0,0,-0.254000><0.101603,0.035000,0.254000> rotate<0,0.000000,0> translate<1.269997,0.000000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<1.269997,0.000000,16.764000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<1.371600,0.000000,16.764000>}
box{<0,0,-0.254000><0.101603,0.035000,0.254000> rotate<0,0.000000,0> translate<1.269997,0.000000,16.764000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<1.269997,0.000000,17.272000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<1.371600,0.000000,17.272000>}
box{<0,0,-0.254000><0.101603,0.035000,0.254000> rotate<0,0.000000,0> translate<1.269997,0.000000,17.272000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<1.269997,0.000000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<1.371600,0.000000,17.780000>}
box{<0,0,-0.254000><0.101603,0.035000,0.254000> rotate<0,0.000000,0> translate<1.269997,0.000000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<1.269997,0.000000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<1.371600,0.000000,18.288000>}
box{<0,0,-0.254000><0.101603,0.035000,0.254000> rotate<0,0.000000,0> translate<1.269997,0.000000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<1.269997,0.000000,18.796000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<1.371600,0.000000,18.796000>}
box{<0,0,-0.254000><0.101603,0.035000,0.254000> rotate<0,0.000000,0> translate<1.269997,0.000000,18.796000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<1.269997,0.000000,19.304000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<1.371600,0.000000,19.304000>}
box{<0,0,-0.254000><0.101603,0.035000,0.254000> rotate<0,0.000000,0> translate<1.269997,0.000000,19.304000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<1.269997,0.000000,19.812000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<1.371600,0.000000,19.812000>}
box{<0,0,-0.254000><0.101603,0.035000,0.254000> rotate<0,0.000000,0> translate<1.269997,0.000000,19.812000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<1.269997,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<1.371600,0.000000,20.320000>}
box{<0,0,-0.254000><0.101603,0.035000,0.254000> rotate<0,0.000000,0> translate<1.269997,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<1.269997,0.000000,20.828000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<1.371600,0.000000,20.828000>}
box{<0,0,-0.254000><0.101603,0.035000,0.254000> rotate<0,0.000000,0> translate<1.269997,0.000000,20.828000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<1.269997,0.000000,21.336000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<1.371600,0.000000,21.336000>}
box{<0,0,-0.254000><0.101603,0.035000,0.254000> rotate<0,0.000000,0> translate<1.269997,0.000000,21.336000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<1.269997,0.000000,21.844000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<1.371600,0.000000,21.844000>}
box{<0,0,-0.254000><0.101603,0.035000,0.254000> rotate<0,0.000000,0> translate<1.269997,0.000000,21.844000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<1.269997,0.000000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<1.371600,0.000000,22.352000>}
box{<0,0,-0.254000><0.101603,0.035000,0.254000> rotate<0,0.000000,0> translate<1.269997,0.000000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<1.269997,0.000000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<1.371600,0.000000,22.860000>}
box{<0,0,-0.254000><0.101603,0.035000,0.254000> rotate<0,0.000000,0> translate<1.269997,0.000000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<1.269997,0.000000,23.368000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<1.371600,0.000000,23.368000>}
box{<0,0,-0.254000><0.101603,0.035000,0.254000> rotate<0,0.000000,0> translate<1.269997,0.000000,23.368000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<1.269997,0.000000,23.876000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<1.371600,0.000000,23.876000>}
box{<0,0,-0.254000><0.101603,0.035000,0.254000> rotate<0,0.000000,0> translate<1.269997,0.000000,23.876000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<1.269997,0.000000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<1.371600,0.000000,24.384000>}
box{<0,0,-0.254000><0.101603,0.035000,0.254000> rotate<0,0.000000,0> translate<1.269997,0.000000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<1.269997,0.000000,24.892000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<1.371600,0.000000,24.892000>}
box{<0,0,-0.254000><0.101603,0.035000,0.254000> rotate<0,0.000000,0> translate<1.269997,0.000000,24.892000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<1.269997,0.000000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<1.371600,0.000000,25.400000>}
box{<0,0,-0.254000><0.101603,0.035000,0.254000> rotate<0,0.000000,0> translate<1.269997,0.000000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<1.269997,0.000000,25.908000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<1.371600,0.000000,25.908000>}
box{<0,0,-0.254000><0.101603,0.035000,0.254000> rotate<0,0.000000,0> translate<1.269997,0.000000,25.908000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<1.269997,0.000000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<1.371600,0.000000,26.416000>}
box{<0,0,-0.254000><0.101603,0.035000,0.254000> rotate<0,0.000000,0> translate<1.269997,0.000000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<1.269997,0.000000,26.924000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<1.371600,0.000000,26.924000>}
box{<0,0,-0.254000><0.101603,0.035000,0.254000> rotate<0,0.000000,0> translate<1.269997,0.000000,26.924000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<1.269997,0.000000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<1.371600,0.000000,27.432000>}
box{<0,0,-0.254000><0.101603,0.035000,0.254000> rotate<0,0.000000,0> translate<1.269997,0.000000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<1.269997,0.000000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<1.371600,0.000000,27.940000>}
box{<0,0,-0.254000><0.101603,0.035000,0.254000> rotate<0,0.000000,0> translate<1.269997,0.000000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<1.269997,0.000000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<1.401472,0.000000,28.448000>}
box{<0,0,-0.254000><0.131475,0.035000,0.254000> rotate<0,0.000000,0> translate<1.269997,0.000000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<1.269997,0.000000,28.956000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<1.754844,0.000000,28.956000>}
box{<0,0,-0.254000><0.484847,0.035000,0.254000> rotate<0,0.000000,0> translate<1.269997,0.000000,28.956000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<1.269997,0.000000,29.464000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<2.262844,0.000000,29.464000>}
box{<0,0,-0.254000><0.992847,0.035000,0.254000> rotate<0,0.000000,0> translate<1.269997,0.000000,29.464000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<1.269997,0.000000,29.972000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<7.213600,0.000000,29.972000>}
box{<0,0,-0.254000><5.943603,0.035000,0.254000> rotate<0,0.000000,0> translate<1.269997,0.000000,29.972000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<1.269997,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<7.213600,0.000000,30.480000>}
box{<0,0,-0.254000><5.943603,0.035000,0.254000> rotate<0,0.000000,0> translate<1.269997,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<1.269997,0.000000,30.988000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<7.213600,0.000000,30.988000>}
box{<0,0,-0.254000><5.943603,0.035000,0.254000> rotate<0,0.000000,0> translate<1.269997,0.000000,30.988000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<1.269997,0.000000,31.496000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<7.213600,0.000000,31.496000>}
box{<0,0,-0.254000><5.943603,0.035000,0.254000> rotate<0,0.000000,0> translate<1.269997,0.000000,31.496000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<1.269997,0.000000,32.004000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<7.213600,0.000000,32.004000>}
box{<0,0,-0.254000><5.943603,0.035000,0.254000> rotate<0,0.000000,0> translate<1.269997,0.000000,32.004000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<1.269997,0.000000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<7.213600,0.000000,32.512000>}
box{<0,0,-0.254000><5.943603,0.035000,0.254000> rotate<0,0.000000,0> translate<1.269997,0.000000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<1.269997,0.000000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<7.213600,0.000000,33.020000>}
box{<0,0,-0.254000><5.943603,0.035000,0.254000> rotate<0,0.000000,0> translate<1.269997,0.000000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<1.269997,0.000000,33.528000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<7.348684,0.000000,33.528000>}
box{<0,0,-0.254000><6.078688,0.035000,0.254000> rotate<0,0.000000,0> translate<1.269997,0.000000,33.528000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<1.269997,0.000000,34.036000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<7.850844,0.000000,34.036000>}
box{<0,0,-0.254000><6.580847,0.035000,0.254000> rotate<0,0.000000,0> translate<1.269997,0.000000,34.036000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<1.269997,0.000000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<8.358844,0.000000,34.544000>}
box{<0,0,-0.254000><7.088847,0.035000,0.254000> rotate<0,0.000000,0> translate<1.269997,0.000000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<1.269997,0.000000,35.052000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<8.866844,0.000000,35.052000>}
box{<0,0,-0.254000><7.596847,0.035000,0.254000> rotate<0,0.000000,0> translate<1.269997,0.000000,35.052000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<1.269997,0.000000,35.560000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<9.374844,0.000000,35.560000>}
box{<0,0,-0.254000><8.104847,0.035000,0.254000> rotate<0,0.000000,0> translate<1.269997,0.000000,35.560000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<1.269997,0.000000,36.058000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<22.078306,0.000000,36.058000>}
box{<0,0,-0.254000><20.808309,0.035000,0.254000> rotate<0,0.000000,0> translate<1.269997,0.000000,36.058000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<1.371600,0.000000,13.534113>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<1.510809,0.000000,13.198031>}
box{<0,0,-0.254000><0.363772,0.035000,0.254000> rotate<0,67.495551,0> translate<1.371600,0.000000,13.534113> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<1.371600,0.000000,28.375884>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<1.371600,0.000000,13.534113>}
box{<0,0,-0.254000><14.841772,0.035000,0.254000> rotate<0,-90.000000,0> translate<1.371600,0.000000,13.534113> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<1.371600,0.000000,28.375884>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<1.510809,0.000000,28.711966>}
box{<0,0,-0.254000><0.363772,0.035000,0.254000> rotate<0,-67.495551,0> translate<1.371600,0.000000,28.375884> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<1.510809,0.000000,13.198031>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<1.768031,0.000000,12.940809>}
box{<0,0,-0.254000><0.363767,0.035000,0.254000> rotate<0,44.997030,0> translate<1.510809,0.000000,13.198031> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<1.510809,0.000000,28.711966>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<1.768031,0.000000,28.969188>}
box{<0,0,-0.254000><0.363767,0.035000,0.254000> rotate<0,-44.997030,0> translate<1.510809,0.000000,28.711966> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<1.768031,0.000000,12.940809>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<1.768034,0.000000,12.940809>}
box{<0,0,-0.254000><0.000003,0.035000,0.254000> rotate<0,0.000000,0> translate<1.768031,0.000000,12.940809> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<1.768031,0.000000,28.969188>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<2.272809,0.000000,29.473966>}
box{<0,0,-0.254000><0.713864,0.035000,0.254000> rotate<0,-44.997030,0> translate<1.768031,0.000000,28.969188> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<1.768034,0.000000,12.940809>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<2.526809,0.000000,12.182034>}
box{<0,0,-0.254000><1.073070,0.035000,0.254000> rotate<0,44.997030,0> translate<1.768034,0.000000,12.940809> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<2.164722,0.000000,8.222834>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<2.164725,0.000000,8.222834>}
box{<0,0,-0.254000><0.000003,0.035000,0.254000> rotate<0,0.000000,0> translate<2.164722,0.000000,8.222834> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<2.164725,0.000000,8.222834>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<3.413334,0.000000,8.589459>}
box{<0,0,-0.254000><1.301322,0.035000,0.254000> rotate<0,-16.362565,0> translate<2.164725,0.000000,8.222834> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<2.272809,0.000000,29.473966>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<2.530031,0.000000,29.731188>}
box{<0,0,-0.254000><0.363767,0.035000,0.254000> rotate<0,-44.997030,0> translate<2.272809,0.000000,29.473966> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<2.526809,0.000000,12.182031>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<2.784031,0.000000,11.924809>}
box{<0,0,-0.254000><0.363767,0.035000,0.254000> rotate<0,44.997030,0> translate<2.526809,0.000000,12.182031> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<2.526809,0.000000,12.182034>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<2.526809,0.000000,12.182031>}
box{<0,0,-0.254000><0.000003,0.035000,0.254000> rotate<0,-90.000000,0> translate<2.526809,0.000000,12.182031> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<2.530031,0.000000,29.731188>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<2.866113,0.000000,29.870397>}
box{<0,0,-0.254000><0.363772,0.035000,0.254000> rotate<0,-22.498510,0> translate<2.530031,0.000000,29.731188> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<2.784031,0.000000,11.924809>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<3.120113,0.000000,11.785600>}
box{<0,0,-0.254000><0.363772,0.035000,0.254000> rotate<0,22.498510,0> translate<2.784031,0.000000,11.924809> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<2.866113,0.000000,29.870397>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<5.195884,0.000000,29.870397>}
box{<0,0,-0.254000><2.329772,0.035000,0.254000> rotate<0,0.000000,0> translate<2.866113,0.000000,29.870397> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<3.120113,0.000000,11.785600>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<3.431241,0.000000,11.785600>}
box{<0,0,-0.254000><0.311128,0.035000,0.254000> rotate<0,0.000000,0> translate<3.120113,0.000000,11.785600> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<3.413334,0.000000,8.589459>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<4.714663,0.000000,8.589459>}
box{<0,0,-0.254000><1.301328,0.035000,0.254000> rotate<0,0.000000,0> translate<3.413334,0.000000,8.589459> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<3.431241,0.000000,11.785600>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<9.245600,0.000000,5.971241>}
box{<0,0,-0.254000><8.222746,0.035000,0.254000> rotate<0,44.997030,0> translate<3.431241,0.000000,11.785600> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<3.447150,0.000000,13.848000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<3.680753,0.000000,13.614397>}
box{<0,0,-0.254000><0.330365,0.035000,0.254000> rotate<0,44.997030,0> translate<3.447150,0.000000,13.848000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<3.447150,0.000000,13.848000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<4.590419,0.000000,13.848000>}
box{<0,0,-0.254000><1.143269,0.035000,0.254000> rotate<0,0.000000,0> translate<3.447150,0.000000,13.848000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<3.579150,0.000000,13.716000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<8.646209,0.000000,13.716000>}
box{<0,0,-0.254000><5.067059,0.035000,0.254000> rotate<0,0.000000,0> translate<3.579150,0.000000,13.716000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<3.680753,0.000000,13.614397>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<3.991884,0.000000,13.614397>}
box{<0,0,-0.254000><0.311131,0.035000,0.254000> rotate<0,0.000000,0> translate<3.680753,0.000000,13.614397> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<3.991884,0.000000,13.614397>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<4.327966,0.000000,13.475188>}
box{<0,0,-0.254000><0.363772,0.035000,0.254000> rotate<0,22.498510,0> translate<3.991884,0.000000,13.614397> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<4.327966,0.000000,13.475188>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<10.677963,0.000000,7.125188>}
box{<0,0,-0.254000><8.980254,0.035000,0.254000> rotate<0,44.997044,0> translate<4.327966,0.000000,13.475188> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<4.590419,0.000000,13.848000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<4.887997,0.000000,14.145578>}
box{<0,0,-0.254000><0.420839,0.035000,0.254000> rotate<0,-44.997030,0> translate<4.590419,0.000000,13.848000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<4.595153,0.000000,13.208000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<9.154209,0.000000,13.208000>}
box{<0,0,-0.254000><4.559056,0.035000,0.254000> rotate<0,0.000000,0> translate<4.595153,0.000000,13.208000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<4.714663,0.000000,8.589459>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<5.963272,0.000000,8.222834>}
box{<0,0,-0.254000><1.301322,0.035000,0.254000> rotate<0,16.362565,0> translate<4.714663,0.000000,8.589459> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<4.724397,0.000000,18.530019>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<4.724397,0.000000,18.566034>}
box{<0,0,-0.254000><0.036016,0.035000,0.254000> rotate<0,90.000000,0> translate<4.724397,0.000000,18.566034> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<4.724397,0.000000,18.530019>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<4.887997,0.000000,18.366419>}
box{<0,0,-0.254000><0.231365,0.035000,0.254000> rotate<0,44.997030,0> translate<4.724397,0.000000,18.530019> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<4.724397,0.000000,18.566034>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<4.978397,0.000000,18.820031>}
box{<0,0,-0.254000><0.359208,0.035000,0.254000> rotate<0,-44.996678,0> translate<4.724397,0.000000,18.566034> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<4.724397,0.000000,20.041963>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<4.724397,0.000000,25.021241>}
box{<0,0,-0.254000><4.979278,0.035000,0.254000> rotate<0,90.000000,0> translate<4.724397,0.000000,25.021241> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<4.724397,0.000000,20.041963>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<4.978397,0.000000,19.787966>}
box{<0,0,-0.254000><0.359208,0.035000,0.254000> rotate<0,44.996678,0> translate<4.724397,0.000000,20.041963> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<4.724397,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<5.713634,0.000000,20.320000>}
box{<0,0,-0.254000><0.989238,0.035000,0.254000> rotate<0,0.000000,0> translate<4.724397,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<4.724397,0.000000,20.828000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<7.162800,0.000000,20.828000>}
box{<0,0,-0.254000><2.438403,0.035000,0.254000> rotate<0,0.000000,0> translate<4.724397,0.000000,20.828000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<4.724397,0.000000,21.336000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<7.154425,0.000000,21.336000>}
box{<0,0,-0.254000><2.430028,0.035000,0.254000> rotate<0,0.000000,0> translate<4.724397,0.000000,21.336000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<4.724397,0.000000,21.844000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<7.154428,0.000000,21.844000>}
box{<0,0,-0.254000><2.430031,0.035000,0.254000> rotate<0,0.000000,0> translate<4.724397,0.000000,21.844000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<4.724397,0.000000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<7.558369,0.000000,22.352000>}
box{<0,0,-0.254000><2.833972,0.035000,0.254000> rotate<0,0.000000,0> translate<4.724397,0.000000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<4.724397,0.000000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<8.066369,0.000000,22.860000>}
box{<0,0,-0.254000><3.341972,0.035000,0.254000> rotate<0,0.000000,0> translate<4.724397,0.000000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<4.724397,0.000000,23.368000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<8.574369,0.000000,23.368000>}
box{<0,0,-0.254000><3.849972,0.035000,0.254000> rotate<0,0.000000,0> translate<4.724397,0.000000,23.368000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<4.724397,0.000000,23.876000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<9.082369,0.000000,23.876000>}
box{<0,0,-0.254000><4.357972,0.035000,0.254000> rotate<0,0.000000,0> translate<4.724397,0.000000,23.876000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<4.724397,0.000000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<9.590369,0.000000,24.384000>}
box{<0,0,-0.254000><4.865972,0.035000,0.254000> rotate<0,0.000000,0> translate<4.724397,0.000000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<4.724397,0.000000,24.892000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<10.098369,0.000000,24.892000>}
box{<0,0,-0.254000><5.373972,0.035000,0.254000> rotate<0,0.000000,0> translate<4.724397,0.000000,24.892000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<4.724397,0.000000,25.021241>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<5.281153,0.000000,25.578000>}
box{<0,0,-0.254000><0.787374,0.035000,0.254000> rotate<0,-44.997191,0> translate<4.724397,0.000000,25.021241> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<4.887997,0.000000,14.145578>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<4.887997,0.000000,18.366419>}
box{<0,0,-0.254000><4.220841,0.035000,0.254000> rotate<0,90.000000,0> translate<4.887997,0.000000,18.366419> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<4.887997,0.000000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<5.289447,0.000000,14.224000>}
box{<0,0,-0.254000><0.401450,0.035000,0.254000> rotate<0,0.000000,0> translate<4.887997,0.000000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<4.887997,0.000000,14.732000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<5.271997,0.000000,14.732000>}
box{<0,0,-0.254000><0.384000,0.035000,0.254000> rotate<0,0.000000,0> translate<4.887997,0.000000,14.732000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<4.887997,0.000000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<5.271997,0.000000,15.240000>}
box{<0,0,-0.254000><0.384000,0.035000,0.254000> rotate<0,0.000000,0> translate<4.887997,0.000000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<4.887997,0.000000,15.748000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<5.271997,0.000000,15.748000>}
box{<0,0,-0.254000><0.384000,0.035000,0.254000> rotate<0,0.000000,0> translate<4.887997,0.000000,15.748000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<4.887997,0.000000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<6.358978,0.000000,16.256000>}
box{<0,0,-0.254000><1.470981,0.035000,0.254000> rotate<0,0.000000,0> translate<4.887997,0.000000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<4.887997,0.000000,16.764000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<5.272000,0.000000,16.764000>}
box{<0,0,-0.254000><0.384003,0.035000,0.254000> rotate<0,0.000000,0> translate<4.887997,0.000000,16.764000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<4.887997,0.000000,17.272000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<5.272000,0.000000,17.272000>}
box{<0,0,-0.254000><0.384003,0.035000,0.254000> rotate<0,0.000000,0> translate<4.887997,0.000000,17.272000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<4.887997,0.000000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<5.272000,0.000000,17.780000>}
box{<0,0,-0.254000><0.384003,0.035000,0.254000> rotate<0,0.000000,0> translate<4.887997,0.000000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<4.887997,0.000000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<5.289450,0.000000,18.288000>}
box{<0,0,-0.254000><0.401453,0.035000,0.254000> rotate<0,0.000000,0> translate<4.887997,0.000000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<4.954363,0.000000,18.796000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<5.205631,0.000000,18.796000>}
box{<0,0,-0.254000><0.251269,0.035000,0.254000> rotate<0,0.000000,0> translate<4.954363,0.000000,18.796000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<4.954363,0.000000,19.812000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<5.205634,0.000000,19.812000>}
box{<0,0,-0.254000><0.251272,0.035000,0.254000> rotate<0,0.000000,0> translate<4.954363,0.000000,19.812000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<4.978397,0.000000,18.820031>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<4.978397,0.000000,19.787966>}
box{<0,0,-0.254000><0.967934,0.035000,0.254000> rotate<0,90.000000,0> translate<4.978397,0.000000,19.787966> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<4.978397,0.000000,19.304000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<6.349966,0.000000,19.304000>}
box{<0,0,-0.254000><1.371569,0.035000,0.254000> rotate<0,0.000000,0> translate<4.978397,0.000000,19.304000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<5.103153,0.000000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<9.662209,0.000000,12.700000>}
box{<0,0,-0.254000><4.559056,0.035000,0.254000> rotate<0,0.000000,0> translate<5.103153,0.000000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<5.103153,0.000000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<21.566841,0.000000,25.400000>}
box{<0,0,-0.254000><16.463687,0.035000,0.254000> rotate<0,0.000000,0> translate<5.103153,0.000000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<5.181597,0.000000,19.304013>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<5.181600,0.000000,19.787966>}
box{<0,0,-0.254000><0.483953,0.035000,0.254000> rotate<0,-89.993690,0> translate<5.181597,0.000000,19.304013> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<5.181597,0.000000,19.304013>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<6.349966,0.000000,19.304013>}
box{<0,0,-0.254000><1.168369,0.035000,0.254000> rotate<0,0.000000,0> translate<5.181597,0.000000,19.304013> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<5.181600,0.000000,18.820031>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<5.453606,0.000000,18.548028>}
box{<0,0,-0.254000><0.384673,0.035000,0.254000> rotate<0,44.996701,0> translate<5.181600,0.000000,18.820031> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<5.181600,0.000000,19.303981>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<5.181600,0.000000,18.820031>}
box{<0,0,-0.254000><0.483950,0.035000,0.254000> rotate<0,-90.000000,0> translate<5.181600,0.000000,18.820031> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<5.181600,0.000000,19.303981>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<6.349966,0.000000,19.303981>}
box{<0,0,-0.254000><1.168366,0.035000,0.254000> rotate<0,0.000000,0> translate<5.181600,0.000000,19.303981> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<5.181600,0.000000,19.787966>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<5.866031,0.000000,20.472397>}
box{<0,0,-0.254000><0.967932,0.035000,0.254000> rotate<0,-44.997030,0> translate<5.181600,0.000000,19.787966> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<5.195884,0.000000,29.870397>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<5.380331,0.000000,29.793997>}
box{<0,0,-0.254000><0.199644,0.035000,0.254000> rotate<0,22.498410,0> translate<5.195884,0.000000,29.870397> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<5.271997,0.000000,16.184994>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<5.272000,0.000000,14.289119>}
box{<0,0,-0.254000><1.895875,0.035000,0.254000> rotate<0,89.993966,0> translate<5.271997,0.000000,16.184994> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<5.271997,0.000000,16.184994>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<6.358978,0.000000,16.184994>}
box{<0,0,-0.254000><1.086981,0.035000,0.254000> rotate<0,0.000000,0> translate<5.271997,0.000000,16.184994> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<5.272000,0.000000,14.289119>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<5.306619,0.000000,14.159919>}
box{<0,0,-0.254000><0.133758,0.035000,0.254000> rotate<0,74.995168,0> translate<5.272000,0.000000,14.289119> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<5.272000,0.000000,16.327000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<6.358978,0.000000,16.327000>}
box{<0,0,-0.254000><1.086978,0.035000,0.254000> rotate<0,0.000000,0> translate<5.272000,0.000000,16.327000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<5.272000,0.000000,18.222878>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<5.272000,0.000000,16.327000>}
box{<0,0,-0.254000><1.895878,0.035000,0.254000> rotate<0,-90.000000,0> translate<5.272000,0.000000,16.327000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<5.272000,0.000000,18.222878>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<5.306619,0.000000,18.352078>}
box{<0,0,-0.254000><0.133758,0.035000,0.254000> rotate<0,-74.995168,0> translate<5.272000,0.000000,18.222878> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<5.281153,0.000000,25.578000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<5.836419,0.000000,25.578000>}
box{<0,0,-0.254000><0.555266,0.035000,0.254000> rotate<0,0.000000,0> translate<5.281153,0.000000,25.578000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<5.306619,0.000000,14.159919>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<5.373497,0.000000,14.044078>}
box{<0,0,-0.254000><0.133760,0.035000,0.254000> rotate<0,59.996964,0> translate<5.306619,0.000000,14.159919> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<5.306619,0.000000,18.352078>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<5.373497,0.000000,18.467919>}
box{<0,0,-0.254000><0.133760,0.035000,0.254000> rotate<0,-59.996964,0> translate<5.306619,0.000000,18.352078> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<5.373497,0.000000,14.044078>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<5.468078,0.000000,13.949497>}
box{<0,0,-0.254000><0.133758,0.035000,0.254000> rotate<0,44.997030,0> translate<5.373497,0.000000,14.044078> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<5.373497,0.000000,18.467919>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<5.453606,0.000000,18.548028>}
box{<0,0,-0.254000><0.113292,0.035000,0.254000> rotate<0,-44.997030,0> translate<5.373497,0.000000,18.467919> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<5.380331,0.000000,29.793997>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<5.836419,0.000000,29.793997>}
box{<0,0,-0.254000><0.456087,0.035000,0.254000> rotate<0,0.000000,0> translate<5.380331,0.000000,29.793997> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<5.468078,0.000000,13.949497>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<5.583919,0.000000,13.882619>}
box{<0,0,-0.254000><0.133760,0.035000,0.254000> rotate<0,29.997096,0> translate<5.468078,0.000000,13.949497> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<5.583919,0.000000,13.882619>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<5.713119,0.000000,13.848000>}
box{<0,0,-0.254000><0.133758,0.035000,0.254000> rotate<0,14.998892,0> translate<5.583919,0.000000,13.882619> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<5.611153,0.000000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<9.702800,0.000000,12.192000>}
box{<0,0,-0.254000><4.091647,0.035000,0.254000> rotate<0,0.000000,0> translate<5.611153,0.000000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<5.713119,0.000000,13.848000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<6.358994,0.000000,13.848000>}
box{<0,0,-0.254000><0.645875,0.035000,0.254000> rotate<0,0.000000,0> translate<5.713119,0.000000,13.848000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<5.836419,0.000000,25.578000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<6.133997,0.000000,25.875578>}
box{<0,0,-0.254000><0.420839,0.035000,0.254000> rotate<0,-44.997030,0> translate<5.836419,0.000000,25.578000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<5.836419,0.000000,29.793997>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<6.133997,0.000000,29.496419>}
box{<0,0,-0.254000><0.420839,0.035000,0.254000> rotate<0,44.997030,0> translate<5.836419,0.000000,29.793997> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<5.866031,0.000000,20.472397>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<6.349981,0.000000,20.472394>}
box{<0,0,-0.254000><0.483950,0.035000,0.254000> rotate<0,0.000370,0> translate<5.866031,0.000000,20.472397> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<5.963272,0.000000,8.222834>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<5.963275,0.000000,8.222834>}
box{<0,0,-0.254000><0.000003,0.035000,0.254000> rotate<0,0.000000,0> translate<5.963272,0.000000,8.222834> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<5.963275,0.000000,8.222834>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<7.058019,0.000000,7.519284>}
box{<0,0,-0.254000><1.301325,0.035000,0.254000> rotate<0,32.725147,0> translate<5.963275,0.000000,8.222834> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<6.110841,0.000000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<7.088841,0.000000,8.128000>}
box{<0,0,-0.254000><0.978000,0.035000,0.254000> rotate<0,0.000000,0> translate<6.110841,0.000000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<6.119153,0.000000,11.684000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<9.702800,0.000000,11.684000>}
box{<0,0,-0.254000><3.583647,0.035000,0.254000> rotate<0,0.000000,0> translate<6.119153,0.000000,11.684000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<6.133997,0.000000,25.875578>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<6.133997,0.000000,26.862847>}
box{<0,0,-0.254000><0.987269,0.035000,0.254000> rotate<0,90.000000,0> translate<6.133997,0.000000,26.862847> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<6.133997,0.000000,25.908000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<6.820000,0.000000,25.908000>}
box{<0,0,-0.254000><0.686003,0.035000,0.254000> rotate<0,0.000000,0> translate<6.133997,0.000000,25.908000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<6.133997,0.000000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<6.580841,0.000000,26.416000>}
box{<0,0,-0.254000><0.446844,0.035000,0.254000> rotate<0,0.000000,0> translate<6.133997,0.000000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<6.133997,0.000000,26.862847>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<6.590809,0.000000,26.406031>}
box{<0,0,-0.254000><0.646033,0.035000,0.254000> rotate<0,44.997226,0> translate<6.133997,0.000000,26.862847> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<6.133997,0.000000,29.426913>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<6.133997,0.000000,29.496419>}
box{<0,0,-0.254000><0.069506,0.035000,0.254000> rotate<0,90.000000,0> translate<6.133997,0.000000,29.496419> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<6.133997,0.000000,29.426913>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<6.171966,0.000000,29.411188>}
box{<0,0,-0.254000><0.041096,0.035000,0.254000> rotate<0,22.495719,0> translate<6.133997,0.000000,29.426913> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<6.133997,0.000000,29.464000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<6.820000,0.000000,29.464000>}
box{<0,0,-0.254000><0.686003,0.035000,0.254000> rotate<0,0.000000,0> translate<6.133997,0.000000,29.464000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<6.171966,0.000000,29.411188>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<6.820000,0.000000,28.763150>}
box{<0,0,-0.254000><0.916461,0.035000,0.254000> rotate<0,44.997168,0> translate<6.171966,0.000000,29.411188> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<6.349966,0.000000,19.304013>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<6.349966,0.000000,19.303981>}
box{<0,0,-0.254000><0.000031,0.035000,0.254000> rotate<0,-90.000000,0> translate<6.349966,0.000000,19.303981> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<6.349981,0.000000,19.304031>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<6.349981,0.000000,20.472394>}
box{<0,0,-0.254000><1.168363,0.035000,0.254000> rotate<0,90.000000,0> translate<6.349981,0.000000,20.472394> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<6.349981,0.000000,19.304031>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<6.350013,0.000000,19.304031>}
box{<0,0,-0.254000><0.000031,0.035000,0.254000> rotate<0,0.000000,0> translate<6.349981,0.000000,19.304031> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<6.349981,0.000000,19.812000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<6.350013,0.000000,19.812000>}
box{<0,0,-0.254000><0.000031,0.035000,0.254000> rotate<0,0.000000,0> translate<6.349981,0.000000,19.812000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<6.349981,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<6.350013,0.000000,20.320000>}
box{<0,0,-0.254000><0.000031,0.035000,0.254000> rotate<0,0.000000,0> translate<6.349981,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<6.350013,0.000000,20.472397>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<6.350013,0.000000,19.304031>}
box{<0,0,-0.254000><1.168366,0.035000,0.254000> rotate<0,-90.000000,0> translate<6.350013,0.000000,19.304031> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<6.350013,0.000000,20.472397>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<6.833966,0.000000,20.472397>}
box{<0,0,-0.254000><0.483953,0.035000,0.254000> rotate<0,0.000000,0> translate<6.350013,0.000000,20.472397> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<6.358978,0.000000,16.327000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<6.358978,0.000000,16.184994>}
box{<0,0,-0.254000><0.142006,0.035000,0.254000> rotate<0,-90.000000,0> translate<6.358978,0.000000,16.184994> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<6.358994,0.000000,13.848000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<6.358994,0.000000,16.184978>}
box{<0,0,-0.254000><2.336978,0.035000,0.254000> rotate<0,90.000000,0> translate<6.358994,0.000000,16.184978> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<6.358994,0.000000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<6.501000,0.000000,14.224000>}
box{<0,0,-0.254000><0.142006,0.035000,0.254000> rotate<0,0.000000,0> translate<6.358994,0.000000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<6.358994,0.000000,14.732000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<6.501000,0.000000,14.732000>}
box{<0,0,-0.254000><0.142006,0.035000,0.254000> rotate<0,0.000000,0> translate<6.358994,0.000000,14.732000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<6.358994,0.000000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<6.501000,0.000000,15.240000>}
box{<0,0,-0.254000><0.142006,0.035000,0.254000> rotate<0,0.000000,0> translate<6.358994,0.000000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<6.358994,0.000000,15.748000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<6.501000,0.000000,15.748000>}
box{<0,0,-0.254000><0.142006,0.035000,0.254000> rotate<0,0.000000,0> translate<6.358994,0.000000,15.748000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<6.358994,0.000000,16.184978>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<6.501000,0.000000,16.184978>}
box{<0,0,-0.254000><0.142006,0.035000,0.254000> rotate<0,0.000000,0> translate<6.358994,0.000000,16.184978> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<6.501000,0.000000,13.848000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<7.146878,0.000000,13.848000>}
box{<0,0,-0.254000><0.645878,0.035000,0.254000> rotate<0,0.000000,0> translate<6.501000,0.000000,13.848000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<6.501000,0.000000,16.184978>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<6.501000,0.000000,13.848000>}
box{<0,0,-0.254000><2.336978,0.035000,0.254000> rotate<0,-90.000000,0> translate<6.501000,0.000000,13.848000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<6.590809,0.000000,26.406031>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<6.820000,0.000000,26.176844>}
box{<0,0,-0.254000><0.324122,0.035000,0.254000> rotate<0,44.996640,0> translate<6.590809,0.000000,26.406031> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<6.627153,0.000000,11.176000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<9.702800,0.000000,11.176000>}
box{<0,0,-0.254000><3.075647,0.035000,0.254000> rotate<0,0.000000,0> translate<6.627153,0.000000,11.176000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<6.627153,0.000000,28.956000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<6.820000,0.000000,28.956000>}
box{<0,0,-0.254000><0.192847,0.035000,0.254000> rotate<0,0.000000,0> translate<6.627153,0.000000,28.956000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<6.820000,0.000000,25.875578>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<7.117578,0.000000,25.578000>}
box{<0,0,-0.254000><0.420839,0.035000,0.254000> rotate<0,44.997030,0> translate<6.820000,0.000000,25.875578> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<6.820000,0.000000,26.176844>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<6.820000,0.000000,25.875578>}
box{<0,0,-0.254000><0.301266,0.035000,0.254000> rotate<0,-90.000000,0> translate<6.820000,0.000000,25.875578> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<6.820000,0.000000,29.496419>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<6.820000,0.000000,28.763150>}
box{<0,0,-0.254000><0.733269,0.035000,0.254000> rotate<0,-90.000000,0> translate<6.820000,0.000000,28.763150> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<6.820000,0.000000,29.496419>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<7.117578,0.000000,29.793997>}
box{<0,0,-0.254000><0.420839,0.035000,0.254000> rotate<0,-44.997030,0> translate<6.820000,0.000000,29.496419> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<6.833966,0.000000,20.472397>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<7.162800,0.000000,20.143559>}
box{<0,0,-0.254000><0.465044,0.035000,0.254000> rotate<0,44.997302,0> translate<6.833966,0.000000,20.472397> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<6.901303,0.000000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<7.596841,0.000000,7.620000>}
box{<0,0,-0.254000><0.695538,0.035000,0.254000> rotate<0,0.000000,0> translate<6.901303,0.000000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<6.986363,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<7.162800,0.000000,20.320000>}
box{<0,0,-0.254000><0.176438,0.035000,0.254000> rotate<0,0.000000,0> translate<6.986363,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<7.058019,0.000000,7.519284>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<7.058022,0.000000,7.519284>}
box{<0,0,-0.254000><0.000003,0.035000,0.254000> rotate<0,0.000000,0> translate<7.058019,0.000000,7.519284> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<7.058022,0.000000,7.519284>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<7.910209,0.000000,6.535809>}
box{<0,0,-0.254000><1.301325,0.035000,0.254000> rotate<0,49.087617,0> translate<7.058022,0.000000,7.519284> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<7.112000,0.000000,21.438425>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<7.162800,0.000000,21.315784>}
box{<0,0,-0.254000><0.132745,0.035000,0.254000> rotate<0,67.495310,0> translate<7.112000,0.000000,21.438425> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<7.112000,0.000000,21.741572>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<7.112000,0.000000,21.438425>}
box{<0,0,-0.254000><0.303147,0.035000,0.254000> rotate<0,-90.000000,0> translate<7.112000,0.000000,21.438425> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<7.112000,0.000000,21.741572>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<7.228006,0.000000,22.021638>}
box{<0,0,-0.254000><0.303141,0.035000,0.254000> rotate<0,-67.495673,0> translate<7.112000,0.000000,21.741572> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<7.117578,0.000000,25.578000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<9.138419,0.000000,25.578000>}
box{<0,0,-0.254000><2.020841,0.035000,0.254000> rotate<0,0.000000,0> translate<7.117578,0.000000,25.578000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<7.117578,0.000000,29.793997>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<7.213600,0.000000,29.793997>}
box{<0,0,-0.254000><0.096022,0.035000,0.254000> rotate<0,0.000000,0> translate<7.117578,0.000000,29.793997> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<7.135153,0.000000,10.668000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<9.702800,0.000000,10.668000>}
box{<0,0,-0.254000><2.567647,0.035000,0.254000> rotate<0,0.000000,0> translate<7.135153,0.000000,10.668000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<7.146878,0.000000,13.848000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<7.276078,0.000000,13.882619>}
box{<0,0,-0.254000><0.133758,0.035000,0.254000> rotate<0,-14.998892,0> translate<7.146878,0.000000,13.848000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<7.162800,0.000000,21.315784>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<7.162800,0.000000,20.143559>}
box{<0,0,-0.254000><1.172225,0.035000,0.254000> rotate<0,-90.000000,0> translate<7.162800,0.000000,20.143559> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<7.213600,0.000000,33.201884>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<7.213600,0.000000,29.793997>}
box{<0,0,-0.254000><3.407887,0.035000,0.254000> rotate<0,-90.000000,0> translate<7.213600,0.000000,29.793997> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<7.213600,0.000000,33.201884>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<7.352809,0.000000,33.537966>}
box{<0,0,-0.254000><0.363772,0.035000,0.254000> rotate<0,-67.495551,0> translate<7.213600,0.000000,33.201884> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<7.228006,0.000000,22.021638>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<10.109359,0.000000,24.902991>}
box{<0,0,-0.254000><4.074849,0.035000,0.254000> rotate<0,-44.997030,0> translate<7.228006,0.000000,22.021638> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<7.276078,0.000000,13.882619>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<7.391919,0.000000,13.949497>}
box{<0,0,-0.254000><0.133760,0.035000,0.254000> rotate<0,-29.997096,0> translate<7.276078,0.000000,13.882619> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<7.352809,0.000000,33.537966>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<7.610031,0.000000,33.795188>}
box{<0,0,-0.254000><0.363767,0.035000,0.254000> rotate<0,-44.997030,0> translate<7.352809,0.000000,33.537966> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<7.391919,0.000000,13.949497>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<7.486500,0.000000,14.044078>}
box{<0,0,-0.254000><0.133758,0.035000,0.254000> rotate<0,-44.997030,0> translate<7.391919,0.000000,13.949497> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<7.410938,0.000000,7.112000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<8.104841,0.000000,7.112000>}
box{<0,0,-0.254000><0.693903,0.035000,0.254000> rotate<0,0.000000,0> translate<7.410938,0.000000,7.112000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<7.486500,0.000000,14.044078>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<7.553378,0.000000,14.159919>}
box{<0,0,-0.254000><0.133760,0.035000,0.254000> rotate<0,-59.996964,0> translate<7.486500,0.000000,14.044078> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<7.553378,0.000000,14.159919>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<7.587997,0.000000,14.289119>}
box{<0,0,-0.254000><0.133758,0.035000,0.254000> rotate<0,-74.995168,0> translate<7.553378,0.000000,14.159919> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<7.570547,0.000000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<8.138209,0.000000,14.224000>}
box{<0,0,-0.254000><0.567662,0.035000,0.254000> rotate<0,0.000000,0> translate<7.570547,0.000000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<7.587997,0.000000,14.289119>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<7.587997,0.000000,14.774216>}
box{<0,0,-0.254000><0.485097,0.035000,0.254000> rotate<0,90.000000,0> translate<7.587997,0.000000,14.774216> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<7.587997,0.000000,14.732000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<7.630209,0.000000,14.732000>}
box{<0,0,-0.254000><0.042213,0.035000,0.254000> rotate<0,0.000000,0> translate<7.587997,0.000000,14.732000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<7.587997,0.000000,14.774216>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<9.702800,0.000000,12.659409>}
box{<0,0,-0.254000><2.990785,0.035000,0.254000> rotate<0,44.997073,0> translate<7.587997,0.000000,14.774216> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<7.610031,0.000000,33.795188>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<9.642031,0.000000,35.827188>}
box{<0,0,-0.254000><2.873682,0.035000,0.254000> rotate<0,-44.997030,0> translate<7.610031,0.000000,33.795188> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<7.631025,0.000000,1.269997>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<7.910209,0.000000,1.592188>}
box{<0,0,-0.254000><0.426322,0.035000,0.254000> rotate<0,-49.087201,0> translate<7.631025,0.000000,1.269997> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<7.631025,0.000000,1.269997>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<22.086972,0.000000,1.269997>}
box{<0,0,-0.254000><14.455947,0.035000,0.254000> rotate<0,0.000000,0> translate<7.631025,0.000000,1.269997> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<7.643153,0.000000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<9.702800,0.000000,10.160000>}
box{<0,0,-0.254000><2.059647,0.035000,0.254000> rotate<0,0.000000,0> translate<7.643153,0.000000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<7.851122,0.000000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<11.660841,0.000000,1.524000>}
box{<0,0,-0.254000><3.809719,0.035000,0.254000> rotate<0,0.000000,0> translate<7.851122,0.000000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<7.851122,0.000000,6.604000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<8.612841,0.000000,6.604000>}
box{<0,0,-0.254000><0.761719,0.035000,0.254000> rotate<0,0.000000,0> translate<7.851122,0.000000,6.604000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<7.910209,0.000000,1.592188>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<7.910209,0.000000,1.592191>}
box{<0,0,-0.254000><0.000003,0.035000,0.254000> rotate<0,90.000000,0> translate<7.910209,0.000000,1.592191> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<7.910209,0.000000,1.592191>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<8.450800,0.000000,2.775916>}
box{<0,0,-0.254000><1.301324,0.035000,0.254000> rotate<0,-65.450164,0> translate<7.910209,0.000000,1.592191> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<7.910209,0.000000,6.535806>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<7.910209,0.000000,6.535809>}
box{<0,0,-0.254000><0.000003,0.035000,0.254000> rotate<0,90.000000,0> translate<7.910209,0.000000,6.535809> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<7.910209,0.000000,6.535806>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<8.450800,0.000000,5.352081>}
box{<0,0,-0.254000><1.301324,0.035000,0.254000> rotate<0,65.450164,0> translate<7.910209,0.000000,6.535806> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<8.111063,0.000000,2.032000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<11.152841,0.000000,2.032000>}
box{<0,0,-0.254000><3.041778,0.035000,0.254000> rotate<0,0.000000,0> translate<8.111063,0.000000,2.032000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<8.111066,0.000000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<9.120841,0.000000,6.096000>}
box{<0,0,-0.254000><1.009775,0.035000,0.254000> rotate<0,0.000000,0> translate<8.111066,0.000000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<8.151153,0.000000,9.652000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<9.702800,0.000000,9.652000>}
box{<0,0,-0.254000><1.551647,0.035000,0.254000> rotate<0,0.000000,0> translate<8.151153,0.000000,9.652000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<8.343059,0.000000,2.540000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<10.644841,0.000000,2.540000>}
box{<0,0,-0.254000><2.301781,0.035000,0.254000> rotate<0,0.000000,0> translate<8.343059,0.000000,2.540000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<8.343059,0.000000,5.588000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<9.245600,0.000000,5.588000>}
box{<0,0,-0.254000><0.902541,0.035000,0.254000> rotate<0,0.000000,0> translate<8.343059,0.000000,5.588000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<8.450800,0.000000,2.775916>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<8.450800,0.000000,2.775919>}
box{<0,0,-0.254000><0.000003,0.035000,0.254000> rotate<0,90.000000,0> translate<8.450800,0.000000,2.775919> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<8.450800,0.000000,2.775919>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<8.635997,0.000000,4.064000>}
box{<0,0,-0.254000><1.301327,0.035000,0.254000> rotate<0,-81.812837,0> translate<8.450800,0.000000,2.775919> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<8.450800,0.000000,5.352078>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<8.450800,0.000000,5.352081>}
box{<0,0,-0.254000><0.000003,0.035000,0.254000> rotate<0,90.000000,0> translate<8.450800,0.000000,5.352081> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<8.450800,0.000000,5.352078>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<8.635997,0.000000,4.064000>}
box{<0,0,-0.254000><1.301324,0.035000,0.254000> rotate<0,81.812817,0> translate<8.450800,0.000000,5.352078> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<8.489919,0.000000,3.048000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<10.136841,0.000000,3.048000>}
box{<0,0,-0.254000><1.646922,0.035000,0.254000> rotate<0,0.000000,0> translate<8.489919,0.000000,3.048000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<8.489922,0.000000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<9.245600,0.000000,5.080000>}
box{<0,0,-0.254000><0.755678,0.035000,0.254000> rotate<0,0.000000,0> translate<8.489922,0.000000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<8.562956,0.000000,3.556000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<9.628841,0.000000,3.556000>}
box{<0,0,-0.254000><1.065884,0.035000,0.254000> rotate<0,0.000000,0> translate<8.562956,0.000000,3.556000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<8.562959,0.000000,4.572000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<9.245600,0.000000,4.572000>}
box{<0,0,-0.254000><0.682641,0.035000,0.254000> rotate<0,0.000000,0> translate<8.562959,0.000000,4.572000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<8.635997,0.000000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<9.275469,0.000000,4.064000>}
box{<0,0,-0.254000><0.639472,0.035000,0.254000> rotate<0,0.000000,0> translate<8.635997,0.000000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<8.659153,0.000000,9.144000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<9.916209,0.000000,9.144000>}
box{<0,0,-0.254000><1.257056,0.035000,0.254000> rotate<0,0.000000,0> translate<8.659153,0.000000,9.144000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<9.042397,0.000000,29.793997>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<9.042397,0.000000,32.641241>}
box{<0,0,-0.254000><2.847244,0.035000,0.254000> rotate<0,90.000000,0> translate<9.042397,0.000000,32.641241> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<9.042397,0.000000,29.793997>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<9.138419,0.000000,29.793997>}
box{<0,0,-0.254000><0.096022,0.035000,0.254000> rotate<0,0.000000,0> translate<9.042397,0.000000,29.793997> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<9.042397,0.000000,29.972000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<12.422847,0.000000,29.972000>}
box{<0,0,-0.254000><3.380450,0.035000,0.254000> rotate<0,0.000000,0> translate<9.042397,0.000000,29.972000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<9.042397,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<12.478000,0.000000,30.480000>}
box{<0,0,-0.254000><3.435603,0.035000,0.254000> rotate<0,0.000000,0> translate<9.042397,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<9.042397,0.000000,30.988000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<12.478000,0.000000,30.988000>}
box{<0,0,-0.254000><3.435603,0.035000,0.254000> rotate<0,0.000000,0> translate<9.042397,0.000000,30.988000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<9.042397,0.000000,31.496000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<12.478000,0.000000,31.496000>}
box{<0,0,-0.254000><3.435603,0.035000,0.254000> rotate<0,0.000000,0> translate<9.042397,0.000000,31.496000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<9.042397,0.000000,32.004000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<12.653584,0.000000,32.004000>}
box{<0,0,-0.254000><3.611188,0.035000,0.254000> rotate<0,0.000000,0> translate<9.042397,0.000000,32.004000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<9.042397,0.000000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<12.547600,0.000000,32.512000>}
box{<0,0,-0.254000><3.505203,0.035000,0.254000> rotate<0,0.000000,0> translate<9.042397,0.000000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<9.042397,0.000000,32.641241>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<10.538756,0.000000,34.137600>}
box{<0,0,-0.254000><2.116172,0.035000,0.254000> rotate<0,-44.997030,0> translate<9.042397,0.000000,32.641241> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<9.138419,0.000000,25.578000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<9.382016,0.000000,25.821600>}
box{<0,0,-0.254000><0.344500,0.035000,0.254000> rotate<0,-44.997398,0> translate<9.138419,0.000000,25.578000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<9.138419,0.000000,29.793997>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<9.435997,0.000000,29.496419>}
box{<0,0,-0.254000><0.420839,0.035000,0.254000> rotate<0,44.997030,0> translate<9.138419,0.000000,29.793997> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<9.167153,0.000000,8.636000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<10.424209,0.000000,8.636000>}
box{<0,0,-0.254000><1.257056,0.035000,0.254000> rotate<0,0.000000,0> translate<9.167153,0.000000,8.636000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<9.245600,0.000000,4.136113>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<9.384809,0.000000,3.800031>}
box{<0,0,-0.254000><0.363772,0.035000,0.254000> rotate<0,67.495551,0> translate<9.245600,0.000000,4.136113> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<9.245600,0.000000,5.971241>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<9.245600,0.000000,4.136113>}
box{<0,0,-0.254000><1.835128,0.035000,0.254000> rotate<0,-90.000000,0> translate<9.245600,0.000000,4.136113> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<9.346416,0.000000,27.686000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<9.382016,0.000000,27.650397>}
box{<0,0,-0.254000><0.050348,0.035000,0.254000> rotate<0,44.999545,0> translate<9.346416,0.000000,27.686000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<9.346416,0.000000,27.686000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<9.435997,0.000000,27.775578>}
box{<0,0,-0.254000><0.126685,0.035000,0.254000> rotate<0,-44.996031,0> translate<9.346416,0.000000,27.686000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<9.382016,0.000000,25.821600>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<10.175981,0.000000,25.821600>}
box{<0,0,-0.254000><0.793966,0.035000,0.254000> rotate<0,0.000000,0> translate<9.382016,0.000000,25.821600> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<9.382016,0.000000,27.650397>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<10.175981,0.000000,27.650397>}
box{<0,0,-0.254000><0.793966,0.035000,0.254000> rotate<0,0.000000,0> translate<9.382016,0.000000,27.650397> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<9.384809,0.000000,3.800031>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<11.416809,0.000000,1.768031>}
box{<0,0,-0.254000><2.873682,0.035000,0.254000> rotate<0,44.997030,0> translate<9.384809,0.000000,3.800031> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<9.421156,0.000000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<12.547600,0.000000,33.020000>}
box{<0,0,-0.254000><3.126444,0.035000,0.254000> rotate<0,0.000000,0> translate<9.421156,0.000000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<9.435997,0.000000,27.775578>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<9.435997,0.000000,29.496419>}
box{<0,0,-0.254000><1.720841,0.035000,0.254000> rotate<0,90.000000,0> translate<9.435997,0.000000,29.496419> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<9.435997,0.000000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<10.122000,0.000000,27.940000>}
box{<0,0,-0.254000><0.686003,0.035000,0.254000> rotate<0,0.000000,0> translate<9.435997,0.000000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<9.435997,0.000000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<10.122000,0.000000,28.448000>}
box{<0,0,-0.254000><0.686003,0.035000,0.254000> rotate<0,0.000000,0> translate<9.435997,0.000000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<9.435997,0.000000,28.956000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<10.122000,0.000000,28.956000>}
box{<0,0,-0.254000><0.686003,0.035000,0.254000> rotate<0,0.000000,0> translate<9.435997,0.000000,28.956000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<9.435997,0.000000,29.464000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<10.122000,0.000000,29.464000>}
box{<0,0,-0.254000><0.686003,0.035000,0.254000> rotate<0,0.000000,0> translate<9.435997,0.000000,29.464000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<9.642031,0.000000,35.827188>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<9.978112,0.000000,35.966397>}
box{<0,0,-0.254000><0.363772,0.035000,0.254000> rotate<0,-22.498510,0> translate<9.642031,0.000000,35.827188> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<9.675153,0.000000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<10.932209,0.000000,8.128000>}
box{<0,0,-0.254000><1.257056,0.035000,0.254000> rotate<0,0.000000,0> translate<9.675153,0.000000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<9.702800,0.000000,9.510531>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<9.811072,0.000000,9.249137>}
box{<0,0,-0.254000><0.282930,0.035000,0.254000> rotate<0,67.495725,0> translate<9.702800,0.000000,9.510531> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<9.702800,0.000000,12.659409>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<9.702800,0.000000,9.510531>}
box{<0,0,-0.254000><3.148878,0.035000,0.254000> rotate<0,-90.000000,0> translate<9.702800,0.000000,9.510531> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<9.811072,0.000000,9.249137>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<10.011138,0.000000,9.049072>}
box{<0,0,-0.254000><0.282936,0.035000,0.254000> rotate<0,44.997030,0> translate<9.811072,0.000000,9.249137> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<9.929156,0.000000,33.528000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<12.825634,0.000000,33.528000>}
box{<0,0,-0.254000><2.896478,0.035000,0.254000> rotate<0,0.000000,0> translate<9.929156,0.000000,33.528000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<9.978112,0.000000,35.966397>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<16.945884,0.000000,35.966397>}
box{<0,0,-0.254000><6.967772,0.035000,0.254000> rotate<0,0.000000,0> translate<9.978112,0.000000,35.966397> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<10.011138,0.000000,9.049072>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<12.446000,0.000000,6.614209>}
box{<0,0,-0.254000><3.443416,0.035000,0.254000> rotate<0,44.997030,0> translate<10.011138,0.000000,9.049072> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<10.109359,0.000000,24.902991>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<10.389425,0.000000,25.018997>}
box{<0,0,-0.254000><0.303141,0.035000,0.254000> rotate<0,-22.498388,0> translate<10.109359,0.000000,24.902991> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<10.122000,0.000000,27.775578>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<10.211581,0.000000,27.686000>}
box{<0,0,-0.254000><0.126685,0.035000,0.254000> rotate<0,44.996031,0> translate<10.122000,0.000000,27.775578> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<10.122000,0.000000,29.496419>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<10.122000,0.000000,27.775578>}
box{<0,0,-0.254000><1.720841,0.035000,0.254000> rotate<0,-90.000000,0> translate<10.122000,0.000000,27.775578> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<10.122000,0.000000,29.496419>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<10.419578,0.000000,29.793997>}
box{<0,0,-0.254000><0.420839,0.035000,0.254000> rotate<0,-44.997030,0> translate<10.122000,0.000000,29.496419> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<10.175981,0.000000,25.821600>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<10.419578,0.000000,25.578000>}
box{<0,0,-0.254000><0.344500,0.035000,0.254000> rotate<0,44.997398,0> translate<10.175981,0.000000,25.821600> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<10.175981,0.000000,27.650397>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<10.211581,0.000000,27.686000>}
box{<0,0,-0.254000><0.050348,0.035000,0.254000> rotate<0,-44.999545,0> translate<10.175981,0.000000,27.650397> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<10.183153,0.000000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<11.440209,0.000000,7.620000>}
box{<0,0,-0.254000><1.257056,0.035000,0.254000> rotate<0,0.000000,0> translate<10.183153,0.000000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<10.389425,0.000000,25.018997>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<12.812572,0.000000,25.018997>}
box{<0,0,-0.254000><2.423147,0.035000,0.254000> rotate<0,0.000000,0> translate<10.389425,0.000000,25.018997> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<10.419578,0.000000,25.578000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<12.440419,0.000000,25.578000>}
box{<0,0,-0.254000><2.020841,0.035000,0.254000> rotate<0,0.000000,0> translate<10.419578,0.000000,25.578000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<10.419578,0.000000,29.793997>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<12.244844,0.000000,29.793997>}
box{<0,0,-0.254000><1.825266,0.035000,0.254000> rotate<0,0.000000,0> translate<10.419578,0.000000,29.793997> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<10.437156,0.000000,34.036000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<16.486841,0.000000,34.036000>}
box{<0,0,-0.254000><6.049684,0.035000,0.254000> rotate<0,0.000000,0> translate<10.437156,0.000000,34.036000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<10.538756,0.000000,34.137600>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<16.385241,0.000000,34.137600>}
box{<0,0,-0.254000><5.846484,0.035000,0.254000> rotate<0,0.000000,0> translate<10.538756,0.000000,34.137600> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<10.617197,0.000000,16.804588>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<10.617197,0.000000,19.953569>}
box{<0,0,-0.254000><3.148981,0.035000,0.254000> rotate<0,90.000000,0> translate<10.617197,0.000000,19.953569> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<10.617197,0.000000,16.804588>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<12.685869,0.000000,14.735913>}
box{<0,0,-0.254000><2.925546,0.035000,0.254000> rotate<0,44.997073,0> translate<10.617197,0.000000,16.804588> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<10.617197,0.000000,17.272000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<12.877997,0.000000,17.272000>}
box{<0,0,-0.254000><2.260800,0.035000,0.254000> rotate<0,0.000000,0> translate<10.617197,0.000000,17.272000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<10.617197,0.000000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.964978,0.000000,17.780000>}
box{<0,0,-0.254000><3.347781,0.035000,0.254000> rotate<0,0.000000,0> translate<10.617197,0.000000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<10.617197,0.000000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<12.878000,0.000000,18.288000>}
box{<0,0,-0.254000><2.260803,0.035000,0.254000> rotate<0,0.000000,0> translate<10.617197,0.000000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<10.617197,0.000000,18.796000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<12.952988,0.000000,18.796000>}
box{<0,0,-0.254000><2.335791,0.035000,0.254000> rotate<0,0.000000,0> translate<10.617197,0.000000,18.796000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<10.617197,0.000000,19.304000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.282216,0.000000,19.304000>}
box{<0,0,-0.254000><6.665019,0.035000,0.254000> rotate<0,0.000000,0> translate<10.617197,0.000000,19.304000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<10.617197,0.000000,19.812000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<11.077575,0.000000,19.812000>}
box{<0,0,-0.254000><0.460378,0.035000,0.254000> rotate<0,0.000000,0> translate<10.617197,0.000000,19.812000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<10.617197,0.000000,19.953569>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<10.903000,0.000000,20.239372>}
box{<0,0,-0.254000><0.404187,0.035000,0.254000> rotate<0,-44.997030,0> translate<10.617197,0.000000,19.953569> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<10.657784,0.000000,16.764000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<12.952984,0.000000,16.764000>}
box{<0,0,-0.254000><2.295200,0.035000,0.254000> rotate<0,0.000000,0> translate<10.657784,0.000000,16.764000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<10.677963,0.000000,7.125188>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<10.677966,0.000000,7.125188>}
box{<0,0,-0.254000><0.000003,0.035000,0.254000> rotate<0,0.000000,0> translate<10.677963,0.000000,7.125188> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<10.677966,0.000000,7.125188>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<10.935188,0.000000,6.867966>}
box{<0,0,-0.254000><0.363767,0.035000,0.254000> rotate<0,44.997030,0> translate<10.677966,0.000000,7.125188> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<10.691153,0.000000,7.112000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<11.948209,0.000000,7.112000>}
box{<0,0,-0.254000><1.257056,0.035000,0.254000> rotate<0,0.000000,0> translate<10.691153,0.000000,7.112000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<10.903000,0.000000,20.130119>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<10.937619,0.000000,20.000919>}
box{<0,0,-0.254000><0.133758,0.035000,0.254000> rotate<0,74.995168,0> translate<10.903000,0.000000,20.130119> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<10.903000,0.000000,20.239372>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<10.903000,0.000000,20.130119>}
box{<0,0,-0.254000><0.109253,0.035000,0.254000> rotate<0,-90.000000,0> translate<10.903000,0.000000,20.130119> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<10.935188,0.000000,6.867966>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<11.074397,0.000000,6.531884>}
box{<0,0,-0.254000><0.363772,0.035000,0.254000> rotate<0,67.495551,0> translate<10.935188,0.000000,6.867966> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<10.937619,0.000000,20.000919>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<11.004497,0.000000,19.885078>}
box{<0,0,-0.254000><0.133760,0.035000,0.254000> rotate<0,59.996964,0> translate<10.937619,0.000000,20.000919> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<11.004497,0.000000,19.885078>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<11.099078,0.000000,19.790497>}
box{<0,0,-0.254000><0.133758,0.035000,0.254000> rotate<0,44.997030,0> translate<11.004497,0.000000,19.885078> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<11.044528,0.000000,6.604000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<12.446000,0.000000,6.604000>}
box{<0,0,-0.254000><1.401472,0.035000,0.254000> rotate<0,0.000000,0> translate<11.044528,0.000000,6.604000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<11.074397,0.000000,4.696756>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<11.074397,0.000000,6.531884>}
box{<0,0,-0.254000><1.835128,0.035000,0.254000> rotate<0,90.000000,0> translate<11.074397,0.000000,6.531884> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<11.074397,0.000000,4.696756>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<12.446000,0.000000,3.325150>}
box{<0,0,-0.254000><1.939742,0.035000,0.254000> rotate<0,44.997095,0> translate<11.074397,0.000000,4.696756> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<11.074397,0.000000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.189950,0.000000,5.080000>}
box{<0,0,-0.254000><2.115553,0.035000,0.254000> rotate<0,0.000000,0> translate<11.074397,0.000000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<11.074397,0.000000,5.588000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<12.681950,0.000000,5.588000>}
box{<0,0,-0.254000><1.607553,0.035000,0.254000> rotate<0,0.000000,0> translate<11.074397,0.000000,5.588000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<11.074397,0.000000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<12.446000,0.000000,6.096000>}
box{<0,0,-0.254000><1.371603,0.035000,0.254000> rotate<0,0.000000,0> translate<11.074397,0.000000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<11.099078,0.000000,19.790497>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<11.214919,0.000000,19.723619>}
box{<0,0,-0.254000><0.133760,0.035000,0.254000> rotate<0,29.997096,0> translate<11.099078,0.000000,19.790497> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<11.110609,0.000000,20.446981>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<11.110641,0.000000,20.447012>}
box{<0,0,-0.254000><0.000044,0.035000,0.254000> rotate<0,-44.997030,0> translate<11.110609,0.000000,20.446981> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<11.110609,0.000000,20.446981>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<12.660966,0.000000,20.446981>}
box{<0,0,-0.254000><1.550356,0.035000,0.254000> rotate<0,0.000000,0> translate<11.110609,0.000000,20.446981> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<11.110641,0.000000,20.447012>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<12.660966,0.000000,20.447012>}
box{<0,0,-0.254000><1.550325,0.035000,0.254000> rotate<0,0.000000,0> translate<11.110641,0.000000,20.447012> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<11.165784,0.000000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.536213,0.000000,16.256000>}
box{<0,0,-0.254000><6.370428,0.035000,0.254000> rotate<0,0.000000,0> translate<11.165784,0.000000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<11.199153,0.000000,4.572000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<12.681953,0.000000,4.572000>}
box{<0,0,-0.254000><1.482800,0.035000,0.254000> rotate<0,0.000000,0> translate<11.199153,0.000000,4.572000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<11.214919,0.000000,19.723619>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<11.344119,0.000000,19.689000>}
box{<0,0,-0.254000><0.133758,0.035000,0.254000> rotate<0,14.998892,0> translate<11.214919,0.000000,19.723619> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<11.344119,0.000000,19.689000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<12.660981,0.000000,19.688997>}
box{<0,0,-0.254000><1.316863,0.035000,0.254000> rotate<0,0.000136,0> translate<11.344119,0.000000,19.689000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<11.416809,0.000000,1.768031>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<11.674031,0.000000,1.510809>}
box{<0,0,-0.254000><0.363767,0.035000,0.254000> rotate<0,44.997030,0> translate<11.416809,0.000000,1.768031> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<11.673784,0.000000,15.748000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.028213,0.000000,15.748000>}
box{<0,0,-0.254000><5.354428,0.035000,0.254000> rotate<0,0.000000,0> translate<11.673784,0.000000,15.748000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<11.674031,0.000000,1.510809>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<12.010112,0.000000,1.371600>}
box{<0,0,-0.254000><0.363772,0.035000,0.254000> rotate<0,22.498510,0> translate<11.674031,0.000000,1.510809> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<11.707153,0.000000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<12.446000,0.000000,4.064000>}
box{<0,0,-0.254000><0.738847,0.035000,0.254000> rotate<0,0.000000,0> translate<11.707153,0.000000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<12.010112,0.000000,1.371600>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.913884,0.000000,1.371600>}
box{<0,0,-0.254000><2.903772,0.035000,0.254000> rotate<0,0.000000,0> translate<12.010112,0.000000,1.371600> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<12.181784,0.000000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<16.520212,0.000000,15.240000>}
box{<0,0,-0.254000><4.338428,0.035000,0.254000> rotate<0,0.000000,0> translate<12.181784,0.000000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<12.215153,0.000000,3.556000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<12.445997,0.000000,3.556000>}
box{<0,0,-0.254000><0.230844,0.035000,0.254000> rotate<0,0.000000,0> translate<12.215153,0.000000,3.556000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<12.244844,0.000000,29.793997>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<12.478000,0.000000,30.027153>}
box{<0,0,-0.254000><0.329733,0.035000,0.254000> rotate<0,-44.997030,0> translate<12.244844,0.000000,29.793997> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<12.440419,0.000000,25.578000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<12.737997,0.000000,25.875578>}
box{<0,0,-0.254000><0.420839,0.035000,0.254000> rotate<0,-44.997030,0> translate<12.440419,0.000000,25.578000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<12.445997,0.000000,3.809981>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<12.446000,0.000000,3.325150>}
box{<0,0,-0.254000><0.484831,0.035000,0.254000> rotate<0,89.993691,0> translate<12.445997,0.000000,3.809981> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<12.445997,0.000000,3.809981>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.715966,0.000000,3.809981>}
box{<0,0,-0.254000><1.269969,0.035000,0.254000> rotate<0,0.000000,0> translate<12.445997,0.000000,3.809981> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<12.446000,0.000000,3.810013>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.715966,0.000000,3.810013>}
box{<0,0,-0.254000><1.269966,0.035000,0.254000> rotate<0,0.000000,0> translate<12.446000,0.000000,3.810013> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<12.446000,0.000000,4.336047>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<12.446000,0.000000,3.810013>}
box{<0,0,-0.254000><0.526034,0.035000,0.254000> rotate<0,-90.000000,0> translate<12.446000,0.000000,3.810013> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<12.446000,0.000000,4.336047>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.189950,0.000000,5.079997>}
box{<0,0,-0.254000><1.052104,0.035000,0.254000> rotate<0,-44.997030,0> translate<12.446000,0.000000,4.336047> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<12.446000,0.000000,5.823950>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.189950,0.000000,5.080000>}
box{<0,0,-0.254000><1.052104,0.035000,0.254000> rotate<0,44.997030,0> translate<12.446000,0.000000,5.823950> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<12.446000,0.000000,6.614209>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<12.446000,0.000000,5.823950>}
box{<0,0,-0.254000><0.790259,0.035000,0.254000> rotate<0,-90.000000,0> translate<12.446000,0.000000,5.823950> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<12.478000,0.000000,31.828419>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<12.478000,0.000000,30.027153>}
box{<0,0,-0.254000><1.801266,0.035000,0.254000> rotate<0,-90.000000,0> translate<12.478000,0.000000,30.027153> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<12.478000,0.000000,31.828419>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<12.739609,0.000000,32.090025>}
box{<0,0,-0.254000><0.369969,0.035000,0.254000> rotate<0,-44.996688,0> translate<12.478000,0.000000,31.828419> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<12.547600,0.000000,32.282031>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<12.739609,0.000000,32.090025>}
box{<0,0,-0.254000><0.271540,0.035000,0.254000> rotate<0,44.996564,0> translate<12.547600,0.000000,32.282031> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<12.547600,0.000000,33.249966>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<12.547600,0.000000,32.282031>}
box{<0,0,-0.254000><0.967934,0.035000,0.254000> rotate<0,-90.000000,0> translate<12.547600,0.000000,32.282031> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<12.547600,0.000000,33.249966>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.232031,0.000000,33.934397>}
box{<0,0,-0.254000><0.967932,0.035000,0.254000> rotate<0,-44.997030,0> translate<12.547600,0.000000,33.249966> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<12.660966,0.000000,20.447012>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<12.660966,0.000000,20.446981>}
box{<0,0,-0.254000><0.000031,0.035000,0.254000> rotate<0,-90.000000,0> translate<12.660966,0.000000,20.446981> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<12.660981,0.000000,19.688997>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<12.660981,0.000000,20.446966>}
box{<0,0,-0.254000><0.757969,0.035000,0.254000> rotate<0,90.000000,0> translate<12.660981,0.000000,20.446966> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<12.660981,0.000000,19.812000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<12.661013,0.000000,19.812000>}
box{<0,0,-0.254000><0.000031,0.035000,0.254000> rotate<0,0.000000,0> translate<12.660981,0.000000,19.812000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<12.660981,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<12.661013,0.000000,20.320000>}
box{<0,0,-0.254000><0.000031,0.035000,0.254000> rotate<0,0.000000,0> translate<12.660981,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<12.660981,0.000000,20.446966>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<12.661013,0.000000,20.446966>}
box{<0,0,-0.254000><0.000031,0.035000,0.254000> rotate<0,0.000000,0> translate<12.660981,0.000000,20.446966> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<12.661013,0.000000,19.689000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.977878,0.000000,19.689000>}
box{<0,0,-0.254000><1.316866,0.035000,0.254000> rotate<0,0.000000,0> translate<12.661013,0.000000,19.689000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<12.661013,0.000000,20.446966>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<12.661013,0.000000,19.689000>}
box{<0,0,-0.254000><0.757966,0.035000,0.254000> rotate<0,-90.000000,0> translate<12.661013,0.000000,19.689000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<12.661031,0.000000,20.446981>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<12.661031,0.000000,20.447012>}
box{<0,0,-0.254000><0.000031,0.035000,0.254000> rotate<0,90.000000,0> translate<12.661031,0.000000,20.447012> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<12.661031,0.000000,20.446981>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.418997,0.000000,20.446981>}
box{<0,0,-0.254000><1.757966,0.035000,0.254000> rotate<0,0.000000,0> translate<12.661031,0.000000,20.446981> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<12.661031,0.000000,20.447012>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.418994,0.000000,20.447012>}
box{<0,0,-0.254000><1.757962,0.035000,0.254000> rotate<0,0.000000,0> translate<12.661031,0.000000,20.447012> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<12.685869,0.000000,14.735913>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.189950,0.000000,15.239997>}
box{<0,0,-0.254000><0.712881,0.035000,0.254000> rotate<0,-44.997208,0> translate<12.685869,0.000000,14.735913> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<12.737997,0.000000,25.875578>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<12.737997,0.000000,27.347584>}
box{<0,0,-0.254000><1.472006,0.035000,0.254000> rotate<0,90.000000,0> translate<12.737997,0.000000,27.347584> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<12.737997,0.000000,25.908000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<21.058841,0.000000,25.908000>}
box{<0,0,-0.254000><8.320844,0.035000,0.254000> rotate<0,0.000000,0> translate<12.737997,0.000000,25.908000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<12.737997,0.000000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<20.550841,0.000000,26.416000>}
box{<0,0,-0.254000><7.812844,0.035000,0.254000> rotate<0,0.000000,0> translate<12.737997,0.000000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<12.737997,0.000000,26.924000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<20.042841,0.000000,26.924000>}
box{<0,0,-0.254000><7.304844,0.035000,0.254000> rotate<0,0.000000,0> translate<12.737997,0.000000,26.924000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<12.737997,0.000000,27.347584>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<12.775578,0.000000,27.310000>}
box{<0,0,-0.254000><0.053150,0.035000,0.254000> rotate<0,44.999412,0> translate<12.737997,0.000000,27.347584> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<12.775578,0.000000,27.310000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.496419,0.000000,27.310000>}
box{<0,0,-0.254000><1.720841,0.035000,0.254000> rotate<0,0.000000,0> translate<12.775578,0.000000,27.310000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<12.812572,0.000000,25.018997>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<12.822228,0.000000,25.014997>}
box{<0,0,-0.254000><0.010452,0.035000,0.254000> rotate<0,22.499783,0> translate<12.812572,0.000000,25.018997> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<12.822228,0.000000,25.014997>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.851828,0.000000,25.014997>}
box{<0,0,-0.254000><1.029600,0.035000,0.254000> rotate<0,0.000000,0> translate<12.822228,0.000000,25.014997> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<12.877997,0.000000,17.708994>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<12.878000,0.000000,16.963119>}
box{<0,0,-0.254000><0.745875,0.035000,0.254000> rotate<0,89.993820,0> translate<12.877997,0.000000,17.708994> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<12.877997,0.000000,17.708994>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.964978,0.000000,17.708994>}
box{<0,0,-0.254000><1.086981,0.035000,0.254000> rotate<0,0.000000,0> translate<12.877997,0.000000,17.708994> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<12.878000,0.000000,16.963119>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<12.912619,0.000000,16.833919>}
box{<0,0,-0.254000><0.133758,0.035000,0.254000> rotate<0,74.995168,0> translate<12.878000,0.000000,16.963119> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<12.878000,0.000000,17.851000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.964978,0.000000,17.851000>}
box{<0,0,-0.254000><1.086978,0.035000,0.254000> rotate<0,0.000000,0> translate<12.878000,0.000000,17.851000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<12.878000,0.000000,18.596878>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<12.878000,0.000000,17.851000>}
box{<0,0,-0.254000><0.745878,0.035000,0.254000> rotate<0,-90.000000,0> translate<12.878000,0.000000,17.851000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<12.878000,0.000000,18.596878>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<12.912619,0.000000,18.726078>}
box{<0,0,-0.254000><0.133758,0.035000,0.254000> rotate<0,-74.995168,0> translate<12.878000,0.000000,18.596878> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<12.912619,0.000000,16.833919>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<12.979497,0.000000,16.718078>}
box{<0,0,-0.254000><0.133760,0.035000,0.254000> rotate<0,59.996964,0> translate<12.912619,0.000000,16.833919> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<12.912619,0.000000,18.726078>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<12.979497,0.000000,18.841919>}
box{<0,0,-0.254000><0.133760,0.035000,0.254000> rotate<0,-59.996964,0> translate<12.912619,0.000000,18.726078> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<12.979497,0.000000,16.718078>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.074078,0.000000,16.623497>}
box{<0,0,-0.254000><0.133758,0.035000,0.254000> rotate<0,44.997030,0> translate<12.979497,0.000000,16.718078> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<12.979497,0.000000,18.841919>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.074078,0.000000,18.936500>}
box{<0,0,-0.254000><0.133758,0.035000,0.254000> rotate<0,-44.997030,0> translate<12.979497,0.000000,18.841919> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.074078,0.000000,16.623497>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.189919,0.000000,16.556619>}
box{<0,0,-0.254000><0.133760,0.035000,0.254000> rotate<0,29.997096,0> translate<13.074078,0.000000,16.623497> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.074078,0.000000,18.936500>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.189919,0.000000,19.003378>}
box{<0,0,-0.254000><0.133760,0.035000,0.254000> rotate<0,-29.997096,0> translate<13.074078,0.000000,18.936500> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.189919,0.000000,16.556619>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.319119,0.000000,16.522000>}
box{<0,0,-0.254000><0.133758,0.035000,0.254000> rotate<0,14.998892,0> translate<13.189919,0.000000,16.556619> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.189919,0.000000,19.003378>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.319119,0.000000,19.037997>}
box{<0,0,-0.254000><0.133758,0.035000,0.254000> rotate<0,-14.998892,0> translate<13.189919,0.000000,19.003378> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.189950,0.000000,5.079997>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.715981,0.000000,5.079994>}
box{<0,0,-0.254000><0.526031,0.035000,0.254000> rotate<0,0.000340,0> translate<13.189950,0.000000,5.079997> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.189950,0.000000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.242047,0.000000,5.080000>}
box{<0,0,-0.254000><1.052097,0.035000,0.254000> rotate<0,0.000000,0> translate<13.189950,0.000000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.189950,0.000000,15.239997>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.715981,0.000000,15.239994>}
box{<0,0,-0.254000><0.526031,0.035000,0.254000> rotate<0,0.000340,0> translate<13.189950,0.000000,15.239997> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.232031,0.000000,33.934397>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.199966,0.000000,33.934397>}
box{<0,0,-0.254000><0.967934,0.035000,0.254000> rotate<0,0.000000,0> translate<13.232031,0.000000,33.934397> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.319119,0.000000,16.522000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.964994,0.000000,16.522000>}
box{<0,0,-0.254000><0.645875,0.035000,0.254000> rotate<0,0.000000,0> translate<13.319119,0.000000,16.522000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.319119,0.000000,19.037997>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.964994,0.000000,19.037997>}
box{<0,0,-0.254000><0.645875,0.035000,0.254000> rotate<0,0.000000,0> translate<13.319119,0.000000,19.037997> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.451781,0.000000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.451788,0.000000,7.619997>}
box{<0,0,-0.254000><0.000007,0.035000,0.254000> rotate<0,26.563298,0> translate<13.451781,0.000000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.451781,0.000000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.242047,0.000000,7.620000>}
box{<0,0,-0.254000><0.790266,0.035000,0.254000> rotate<0,0.000000,0> translate<13.451781,0.000000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.451781,0.000000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.451784,0.000000,10.159997>}
box{<0,0,-0.254000><0.000004,0.035000,0.254000> rotate<0,44.997030,0> translate<13.451781,0.000000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.451781,0.000000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.242047,0.000000,10.160000>}
box{<0,0,-0.254000><0.790266,0.035000,0.254000> rotate<0,0.000000,0> translate<13.451781,0.000000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.451781,0.000000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.451784,0.000000,12.699997>}
box{<0,0,-0.254000><0.000004,0.035000,0.254000> rotate<0,44.997030,0> translate<13.451781,0.000000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.451781,0.000000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.715981,0.000000,12.699997>}
box{<0,0,-0.254000><0.264200,0.035000,0.254000> rotate<0,0.000678,0> translate<13.451781,0.000000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.451784,0.000000,10.159997>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.242047,0.000000,10.159997>}
box{<0,0,-0.254000><0.790263,0.035000,0.254000> rotate<0,0.000000,0> translate<13.451784,0.000000,10.159997> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.451784,0.000000,12.699997>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.242047,0.000000,12.699997>}
box{<0,0,-0.254000><0.790263,0.035000,0.254000> rotate<0,0.000000,0> translate<13.451784,0.000000,12.699997> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.451788,0.000000,7.619997>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.242047,0.000000,7.619997>}
box{<0,0,-0.254000><0.790259,0.035000,0.254000> rotate<0,0.000000,0> translate<13.451788,0.000000,7.619997> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.715966,0.000000,3.810013>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.715966,0.000000,3.809981>}
box{<0,0,-0.254000><0.000031,0.035000,0.254000> rotate<0,-90.000000,0> translate<13.715966,0.000000,3.809981> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.715981,0.000000,3.810031>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.715981,0.000000,5.079994>}
box{<0,0,-0.254000><1.269962,0.035000,0.254000> rotate<0,90.000000,0> translate<13.715981,0.000000,5.079994> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.715981,0.000000,3.810031>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.716013,0.000000,3.810031>}
box{<0,0,-0.254000><0.000031,0.035000,0.254000> rotate<0,0.000000,0> translate<13.715981,0.000000,3.810031> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.715981,0.000000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.716013,0.000000,4.064000>}
box{<0,0,-0.254000><0.000031,0.035000,0.254000> rotate<0,0.000000,0> translate<13.715981,0.000000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.715981,0.000000,4.572000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.716013,0.000000,4.572000>}
box{<0,0,-0.254000><0.000031,0.035000,0.254000> rotate<0,0.000000,0> translate<13.715981,0.000000,4.572000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.715981,0.000000,12.699997>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.715981,0.000000,13.969966>}
box{<0,0,-0.254000><1.269969,0.035000,0.254000> rotate<0,90.000000,0> translate<13.715981,0.000000,13.969966> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.715981,0.000000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.716013,0.000000,12.700000>}
box{<0,0,-0.254000><0.000031,0.035000,0.254000> rotate<0,0.000000,0> translate<13.715981,0.000000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.715981,0.000000,13.208000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.716013,0.000000,13.208000>}
box{<0,0,-0.254000><0.000031,0.035000,0.254000> rotate<0,0.000000,0> translate<13.715981,0.000000,13.208000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.715981,0.000000,13.716000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.716013,0.000000,13.716000>}
box{<0,0,-0.254000><0.000031,0.035000,0.254000> rotate<0,0.000000,0> translate<13.715981,0.000000,13.716000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.715981,0.000000,13.969966>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.716013,0.000000,13.969966>}
box{<0,0,-0.254000><0.000031,0.035000,0.254000> rotate<0,0.000000,0> translate<13.715981,0.000000,13.969966> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.715981,0.000000,13.970031>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.715981,0.000000,15.239994>}
box{<0,0,-0.254000><1.269963,0.035000,0.254000> rotate<0,90.000000,0> translate<13.715981,0.000000,15.239994> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.715981,0.000000,13.970031>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.716013,0.000000,13.970031>}
box{<0,0,-0.254000><0.000031,0.035000,0.254000> rotate<0,0.000000,0> translate<13.715981,0.000000,13.970031> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.715981,0.000000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.716013,0.000000,14.224000>}
box{<0,0,-0.254000><0.000031,0.035000,0.254000> rotate<0,0.000000,0> translate<13.715981,0.000000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.715981,0.000000,14.732000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.716013,0.000000,14.732000>}
box{<0,0,-0.254000><0.000031,0.035000,0.254000> rotate<0,0.000000,0> translate<13.715981,0.000000,14.732000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.716013,0.000000,5.079997>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.716013,0.000000,3.810031>}
box{<0,0,-0.254000><1.269966,0.035000,0.254000> rotate<0,-90.000000,0> translate<13.716013,0.000000,3.810031> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.716013,0.000000,5.079997>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.242047,0.000000,5.079997>}
box{<0,0,-0.254000><0.526034,0.035000,0.254000> rotate<0,0.000000,0> translate<13.716013,0.000000,5.079997> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.716013,0.000000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.242047,0.000000,12.700000>}
box{<0,0,-0.254000><0.526034,0.035000,0.254000> rotate<0,0.000000,0> translate<13.716013,0.000000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.716013,0.000000,13.969966>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.716013,0.000000,12.700000>}
box{<0,0,-0.254000><1.269966,0.035000,0.254000> rotate<0,-90.000000,0> translate<13.716013,0.000000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.716013,0.000000,15.239997>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.716013,0.000000,13.970031>}
box{<0,0,-0.254000><1.269966,0.035000,0.254000> rotate<0,-90.000000,0> translate<13.716013,0.000000,13.970031> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.716013,0.000000,15.239997>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.242047,0.000000,15.239997>}
box{<0,0,-0.254000><0.526034,0.035000,0.254000> rotate<0,0.000000,0> translate<13.716013,0.000000,15.239997> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.716031,0.000000,13.969981>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.716031,0.000000,13.970013>}
box{<0,0,-0.254000><0.000031,0.035000,0.254000> rotate<0,90.000000,0> translate<13.716031,0.000000,13.970013> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.716031,0.000000,13.969981>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.985994,0.000000,13.969981>}
box{<0,0,-0.254000><1.269963,0.035000,0.254000> rotate<0,0.000000,0> translate<13.716031,0.000000,13.969981> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.716031,0.000000,13.970013>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.985997,0.000000,13.970013>}
box{<0,0,-0.254000><1.269966,0.035000,0.254000> rotate<0,0.000000,0> translate<13.716031,0.000000,13.970013> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.851828,0.000000,25.014997>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.112047,0.000000,24.907209>}
box{<0,0,-0.254000><0.281659,0.035000,0.254000> rotate<0,22.498772,0> translate<13.851828,0.000000,25.014997> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.964978,0.000000,17.851000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.964978,0.000000,17.708994>}
box{<0,0,-0.254000><0.142006,0.035000,0.254000> rotate<0,-90.000000,0> translate<13.964978,0.000000,17.708994> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.964994,0.000000,16.522000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.964994,0.000000,17.708978>}
box{<0,0,-0.254000><1.186978,0.035000,0.254000> rotate<0,90.000000,0> translate<13.964994,0.000000,17.708978> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.964994,0.000000,16.764000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.107000,0.000000,16.764000>}
box{<0,0,-0.254000><0.142006,0.035000,0.254000> rotate<0,0.000000,0> translate<13.964994,0.000000,16.764000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.964994,0.000000,17.272000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.107000,0.000000,17.272000>}
box{<0,0,-0.254000><0.142006,0.035000,0.254000> rotate<0,0.000000,0> translate<13.964994,0.000000,17.272000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.964994,0.000000,17.708978>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.107000,0.000000,17.708978>}
box{<0,0,-0.254000><0.142006,0.035000,0.254000> rotate<0,0.000000,0> translate<13.964994,0.000000,17.708978> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.964994,0.000000,17.851019>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.964994,0.000000,19.037997>}
box{<0,0,-0.254000><1.186978,0.035000,0.254000> rotate<0,90.000000,0> translate<13.964994,0.000000,19.037997> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.964994,0.000000,17.851019>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.107000,0.000000,17.851019>}
box{<0,0,-0.254000><0.142006,0.035000,0.254000> rotate<0,0.000000,0> translate<13.964994,0.000000,17.851019> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.964994,0.000000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.107000,0.000000,18.288000>}
box{<0,0,-0.254000><0.142006,0.035000,0.254000> rotate<0,0.000000,0> translate<13.964994,0.000000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.964994,0.000000,18.796000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.107000,0.000000,18.796000>}
box{<0,0,-0.254000><0.142006,0.035000,0.254000> rotate<0,0.000000,0> translate<13.964994,0.000000,18.796000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<13.977878,0.000000,19.689000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.107078,0.000000,19.723619>}
box{<0,0,-0.254000><0.133758,0.035000,0.254000> rotate<0,-14.998892,0> translate<13.977878,0.000000,19.689000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.107000,0.000000,16.522000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.752878,0.000000,16.522000>}
box{<0,0,-0.254000><0.645878,0.035000,0.254000> rotate<0,0.000000,0> translate<14.107000,0.000000,16.522000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.107000,0.000000,17.708978>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.107000,0.000000,16.522000>}
box{<0,0,-0.254000><1.186978,0.035000,0.254000> rotate<0,-90.000000,0> translate<14.107000,0.000000,16.522000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.107000,0.000000,19.037997>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.107000,0.000000,17.851019>}
box{<0,0,-0.254000><1.186978,0.035000,0.254000> rotate<0,-90.000000,0> translate<14.107000,0.000000,17.851019> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.107000,0.000000,19.037997>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.752878,0.000000,19.037997>}
box{<0,0,-0.254000><0.645878,0.035000,0.254000> rotate<0,0.000000,0> translate<14.107000,0.000000,19.037997> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.107078,0.000000,19.723619>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.222919,0.000000,19.790497>}
box{<0,0,-0.254000><0.133760,0.035000,0.254000> rotate<0,-29.997096,0> translate<14.107078,0.000000,19.723619> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.112047,0.000000,24.907209>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.311209,0.000000,24.708047>}
box{<0,0,-0.254000><0.281658,0.035000,0.254000> rotate<0,44.997030,0> translate<14.112047,0.000000,24.907209> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.127256,0.000000,24.892000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.727581,0.000000,24.892000>}
box{<0,0,-0.254000><1.600325,0.035000,0.254000> rotate<0,0.000000,0> translate<14.127256,0.000000,24.892000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.185834,0.000000,23.680578>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.311209,0.000000,23.805950>}
box{<0,0,-0.254000><0.177305,0.035000,0.254000> rotate<0,-44.996316,0> translate<14.185834,0.000000,23.680578> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.185834,0.000000,23.680578>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.418997,0.000000,23.447419>}
box{<0,0,-0.254000><0.329739,0.035000,0.254000> rotate<0,44.996646,0> translate<14.185834,0.000000,23.680578> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.199966,0.000000,33.934397>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.884397,0.000000,33.249966>}
box{<0,0,-0.254000><0.967932,0.035000,0.254000> rotate<0,44.997030,0> translate<14.199966,0.000000,33.934397> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.222919,0.000000,19.790497>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.317500,0.000000,19.885078>}
box{<0,0,-0.254000><0.133758,0.035000,0.254000> rotate<0,-44.997030,0> translate<14.222919,0.000000,19.790497> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.242047,0.000000,5.079997>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.985997,0.000000,4.336047>}
box{<0,0,-0.254000><1.052104,0.035000,0.254000> rotate<0,44.997030,0> translate<14.242047,0.000000,5.079997> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.242047,0.000000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.985997,0.000000,5.823950>}
box{<0,0,-0.254000><1.052104,0.035000,0.254000> rotate<0,-44.997030,0> translate<14.242047,0.000000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.242047,0.000000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.729950,0.000000,5.080000>}
box{<0,0,-0.254000><1.487903,0.035000,0.254000> rotate<0,0.000000,0> translate<14.242047,0.000000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.242047,0.000000,7.619997>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.985997,0.000000,6.876047>}
box{<0,0,-0.254000><1.052104,0.035000,0.254000> rotate<0,44.997030,0> translate<14.242047,0.000000,7.619997> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.242047,0.000000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.985997,0.000000,8.363950>}
box{<0,0,-0.254000><1.052104,0.035000,0.254000> rotate<0,-44.997030,0> translate<14.242047,0.000000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.242047,0.000000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.729950,0.000000,7.620000>}
box{<0,0,-0.254000><1.487903,0.035000,0.254000> rotate<0,0.000000,0> translate<14.242047,0.000000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.242047,0.000000,10.159997>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.985997,0.000000,9.416047>}
box{<0,0,-0.254000><1.052104,0.035000,0.254000> rotate<0,44.997030,0> translate<14.242047,0.000000,10.159997> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.242047,0.000000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.985997,0.000000,10.903950>}
box{<0,0,-0.254000><1.052104,0.035000,0.254000> rotate<0,-44.997030,0> translate<14.242047,0.000000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.242047,0.000000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.729950,0.000000,10.160000>}
box{<0,0,-0.254000><1.487903,0.035000,0.254000> rotate<0,0.000000,0> translate<14.242047,0.000000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.242047,0.000000,12.699997>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.985997,0.000000,11.956047>}
box{<0,0,-0.254000><1.052104,0.035000,0.254000> rotate<0,44.997030,0> translate<14.242047,0.000000,12.699997> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.242047,0.000000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.985997,0.000000,13.443950>}
box{<0,0,-0.254000><1.052104,0.035000,0.254000> rotate<0,-44.997030,0> translate<14.242047,0.000000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.242047,0.000000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.729950,0.000000,12.700000>}
box{<0,0,-0.254000><1.487903,0.035000,0.254000> rotate<0,0.000000,0> translate<14.242047,0.000000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.242047,0.000000,15.239997>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.985997,0.000000,14.496047>}
box{<0,0,-0.254000><1.052104,0.035000,0.254000> rotate<0,44.997030,0> translate<14.242047,0.000000,15.239997> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.244416,0.000000,21.082000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.317500,0.000000,21.008919>}
box{<0,0,-0.254000><0.103355,0.035000,0.254000> rotate<0,44.995805,0> translate<14.244416,0.000000,21.082000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.244416,0.000000,21.082000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.418997,0.000000,21.256578>}
box{<0,0,-0.254000><0.246893,0.035000,0.254000> rotate<0,-44.996517,0> translate<14.244416,0.000000,21.082000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.244416,0.000000,22.351997>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.418997,0.000000,22.177419>}
box{<0,0,-0.254000><0.246893,0.035000,0.254000> rotate<0,44.996517,0> translate<14.244416,0.000000,22.351997> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.244416,0.000000,22.351997>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.418997,0.000000,22.526578>}
box{<0,0,-0.254000><0.246895,0.035000,0.254000> rotate<0,-44.997030,0> translate<14.244416,0.000000,22.351997> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.244419,0.000000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.727578,0.000000,22.352000>}
box{<0,0,-0.254000><1.483159,0.035000,0.254000> rotate<0,0.000000,0> translate<14.244419,0.000000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.244422,0.000000,19.812000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.727578,0.000000,19.812000>}
box{<0,0,-0.254000><1.483156,0.035000,0.254000> rotate<0,0.000000,0> translate<14.244422,0.000000,19.812000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.311209,0.000000,23.805950>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.418997,0.000000,24.066169>}
box{<0,0,-0.254000><0.281659,0.035000,0.254000> rotate<0,-67.495289,0> translate<14.311209,0.000000,23.805950> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.311209,0.000000,24.708047>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.418997,0.000000,24.447828>}
box{<0,0,-0.254000><0.281659,0.035000,0.254000> rotate<0,67.495289,0> translate<14.311209,0.000000,24.708047> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.317500,0.000000,19.885078>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.384378,0.000000,20.000919>}
box{<0,0,-0.254000><0.133760,0.035000,0.254000> rotate<0,-59.996964,0> translate<14.317500,0.000000,19.885078> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.317500,0.000000,21.008919>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.384378,0.000000,20.893078>}
box{<0,0,-0.254000><0.133760,0.035000,0.254000> rotate<0,59.996964,0> translate<14.317500,0.000000,21.008919> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.340225,0.000000,23.876000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.553000,0.000000,23.876000>}
box{<0,0,-0.254000><1.212775,0.035000,0.254000> rotate<0,0.000000,0> translate<14.340225,0.000000,23.876000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.384378,0.000000,20.000919>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.418997,0.000000,20.130119>}
box{<0,0,-0.254000><0.133758,0.035000,0.254000> rotate<0,-74.995168,0> translate<14.384378,0.000000,20.000919> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.384378,0.000000,20.893078>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.418997,0.000000,20.763878>}
box{<0,0,-0.254000><0.133758,0.035000,0.254000> rotate<0,74.995168,0> translate<14.384378,0.000000,20.893078> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.401816,0.000000,20.828000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.553000,0.000000,20.828000>}
box{<0,0,-0.254000><1.151184,0.035000,0.254000> rotate<0,0.000000,0> translate<14.401816,0.000000,20.828000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.418994,0.000000,20.447012>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.418997,0.000000,20.763878>}
box{<0,0,-0.254000><0.316866,0.035000,0.254000> rotate<0,-89.993495,0> translate<14.418994,0.000000,20.447012> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.418997,0.000000,20.130119>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.418997,0.000000,20.446981>}
box{<0,0,-0.254000><0.316862,0.035000,0.254000> rotate<0,90.000000,0> translate<14.418997,0.000000,20.446981> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.418997,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.553000,0.000000,20.320000>}
box{<0,0,-0.254000><1.134003,0.035000,0.254000> rotate<0,0.000000,0> translate<14.418997,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.418997,0.000000,21.256578>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.418997,0.000000,22.177419>}
box{<0,0,-0.254000><0.920841,0.035000,0.254000> rotate<0,90.000000,0> translate<14.418997,0.000000,22.177419> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.418997,0.000000,21.336000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.553000,0.000000,21.336000>}
box{<0,0,-0.254000><1.134003,0.035000,0.254000> rotate<0,0.000000,0> translate<14.418997,0.000000,21.336000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.418997,0.000000,21.844000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.553000,0.000000,21.844000>}
box{<0,0,-0.254000><1.134003,0.035000,0.254000> rotate<0,0.000000,0> translate<14.418997,0.000000,21.844000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.418997,0.000000,22.526578>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.418997,0.000000,23.447419>}
box{<0,0,-0.254000><0.920841,0.035000,0.254000> rotate<0,90.000000,0> translate<14.418997,0.000000,23.447419> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.418997,0.000000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.553000,0.000000,22.860000>}
box{<0,0,-0.254000><1.134003,0.035000,0.254000> rotate<0,0.000000,0> translate<14.418997,0.000000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.418997,0.000000,23.368000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.553000,0.000000,23.368000>}
box{<0,0,-0.254000><1.134003,0.035000,0.254000> rotate<0,0.000000,0> translate<14.418997,0.000000,23.368000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.418997,0.000000,24.066169>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.418997,0.000000,24.447828>}
box{<0,0,-0.254000><0.381659,0.035000,0.254000> rotate<0,90.000000,0> translate<14.418997,0.000000,24.447828> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.418997,0.000000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.553000,0.000000,24.384000>}
box{<0,0,-0.254000><1.134003,0.035000,0.254000> rotate<0,0.000000,0> translate<14.418997,0.000000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.496419,0.000000,27.310000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.793997,0.000000,27.607578>}
box{<0,0,-0.254000><0.420839,0.035000,0.254000> rotate<0,-44.997030,0> translate<14.496419,0.000000,27.310000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.606363,0.000000,33.528000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.365634,0.000000,33.528000>}
box{<0,0,-0.254000><0.759272,0.035000,0.254000> rotate<0,0.000000,0> translate<14.606363,0.000000,33.528000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.612388,0.000000,32.010025>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.793997,0.000000,31.828419>}
box{<0,0,-0.254000><0.256832,0.035000,0.254000> rotate<0,44.996537,0> translate<14.612388,0.000000,32.010025> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.612388,0.000000,32.010025>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.884397,0.000000,32.282031>}
box{<0,0,-0.254000><0.384677,0.035000,0.254000> rotate<0,-44.996701,0> translate<14.612388,0.000000,32.010025> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.618416,0.000000,32.004000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.353581,0.000000,32.004000>}
box{<0,0,-0.254000><0.735166,0.035000,0.254000> rotate<0,0.000000,0> translate<14.618416,0.000000,32.004000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.618419,0.000000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.353575,0.000000,27.432000>}
box{<0,0,-0.254000><0.735156,0.035000,0.254000> rotate<0,0.000000,0> translate<14.618419,0.000000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.750044,0.000000,4.572000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.221953,0.000000,4.572000>}
box{<0,0,-0.254000><0.471909,0.035000,0.254000> rotate<0,0.000000,0> translate<14.750044,0.000000,4.572000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.750044,0.000000,7.112000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.221953,0.000000,7.112000>}
box{<0,0,-0.254000><0.471909,0.035000,0.254000> rotate<0,0.000000,0> translate<14.750044,0.000000,7.112000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.750044,0.000000,9.652000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.221953,0.000000,9.652000>}
box{<0,0,-0.254000><0.471909,0.035000,0.254000> rotate<0,0.000000,0> translate<14.750044,0.000000,9.652000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.750044,0.000000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.221953,0.000000,12.192000>}
box{<0,0,-0.254000><0.471909,0.035000,0.254000> rotate<0,0.000000,0> translate<14.750044,0.000000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.750044,0.000000,14.732000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.221953,0.000000,14.732000>}
box{<0,0,-0.254000><0.471909,0.035000,0.254000> rotate<0,0.000000,0> translate<14.750044,0.000000,14.732000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.750047,0.000000,5.588000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.221950,0.000000,5.588000>}
box{<0,0,-0.254000><0.471903,0.035000,0.254000> rotate<0,0.000000,0> translate<14.750047,0.000000,5.588000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.750047,0.000000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.221950,0.000000,8.128000>}
box{<0,0,-0.254000><0.471903,0.035000,0.254000> rotate<0,0.000000,0> translate<14.750047,0.000000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.750047,0.000000,10.668000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.221950,0.000000,10.668000>}
box{<0,0,-0.254000><0.471903,0.035000,0.254000> rotate<0,0.000000,0> translate<14.750047,0.000000,10.668000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.750047,0.000000,13.208000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.221950,0.000000,13.208000>}
box{<0,0,-0.254000><0.471903,0.035000,0.254000> rotate<0,0.000000,0> translate<14.750047,0.000000,13.208000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.752878,0.000000,16.522000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.882078,0.000000,16.556619>}
box{<0,0,-0.254000><0.133758,0.035000,0.254000> rotate<0,-14.998892,0> translate<14.752878,0.000000,16.522000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.752878,0.000000,19.037997>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.882078,0.000000,19.003378>}
box{<0,0,-0.254000><0.133758,0.035000,0.254000> rotate<0,14.998892,0> translate<14.752878,0.000000,19.037997> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.793997,0.000000,27.607578>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.793997,0.000000,31.828419>}
box{<0,0,-0.254000><4.220841,0.035000,0.254000> rotate<0,90.000000,0> translate<14.793997,0.000000,31.828419> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.793997,0.000000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.177997,0.000000,27.940000>}
box{<0,0,-0.254000><0.384000,0.035000,0.254000> rotate<0,0.000000,0> translate<14.793997,0.000000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.793997,0.000000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.177997,0.000000,28.448000>}
box{<0,0,-0.254000><0.384000,0.035000,0.254000> rotate<0,0.000000,0> translate<14.793997,0.000000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.793997,0.000000,28.956000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.177997,0.000000,28.956000>}
box{<0,0,-0.254000><0.384000,0.035000,0.254000> rotate<0,0.000000,0> translate<14.793997,0.000000,28.956000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.793997,0.000000,29.464000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.177997,0.000000,29.464000>}
box{<0,0,-0.254000><0.384000,0.035000,0.254000> rotate<0,0.000000,0> translate<14.793997,0.000000,29.464000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.793997,0.000000,29.972000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.178000,0.000000,29.972000>}
box{<0,0,-0.254000><0.384003,0.035000,0.254000> rotate<0,0.000000,0> translate<14.793997,0.000000,29.972000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.793997,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.178000,0.000000,30.480000>}
box{<0,0,-0.254000><0.384003,0.035000,0.254000> rotate<0,0.000000,0> translate<14.793997,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.793997,0.000000,30.988000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.178000,0.000000,30.988000>}
box{<0,0,-0.254000><0.384003,0.035000,0.254000> rotate<0,0.000000,0> translate<14.793997,0.000000,30.988000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.793997,0.000000,31.496000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.178000,0.000000,31.496000>}
box{<0,0,-0.254000><0.384003,0.035000,0.254000> rotate<0,0.000000,0> translate<14.793997,0.000000,31.496000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.882078,0.000000,16.556619>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.982806,0.000000,16.614775>}
box{<0,0,-0.254000><0.116311,0.035000,0.254000> rotate<0,-29.998378,0> translate<14.882078,0.000000,16.556619> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.882078,0.000000,19.003378>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.982806,0.000000,18.945222>}
box{<0,0,-0.254000><0.116311,0.035000,0.254000> rotate<0,29.998378,0> translate<14.882078,0.000000,19.003378> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.884397,0.000000,32.282031>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.884397,0.000000,33.249966>}
box{<0,0,-0.254000><0.967934,0.035000,0.254000> rotate<0,90.000000,0> translate<14.884397,0.000000,33.249966> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.884397,0.000000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.087600,0.000000,32.512000>}
box{<0,0,-0.254000><0.203203,0.035000,0.254000> rotate<0,0.000000,0> translate<14.884397,0.000000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.884397,0.000000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.087600,0.000000,33.020000>}
box{<0,0,-0.254000><0.203203,0.035000,0.254000> rotate<0,0.000000,0> translate<14.884397,0.000000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.913884,0.000000,1.371600>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.249966,0.000000,1.510809>}
box{<0,0,-0.254000><0.363772,0.035000,0.254000> rotate<0,-22.498510,0> translate<14.913884,0.000000,1.371600> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.982806,0.000000,16.614775>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.075578,0.000000,16.522000>}
box{<0,0,-0.254000><0.131201,0.035000,0.254000> rotate<0,44.997995,0> translate<14.982806,0.000000,16.614775> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.982806,0.000000,18.945222>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.075578,0.000000,19.037997>}
box{<0,0,-0.254000><0.131201,0.035000,0.254000> rotate<0,-44.997995,0> translate<14.982806,0.000000,18.945222> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.985994,0.000000,13.969981>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.985997,0.000000,13.443950>}
box{<0,0,-0.254000><0.526031,0.035000,0.254000> rotate<0,89.993720,0> translate<14.985994,0.000000,13.969981> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.985997,0.000000,3.833150>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.985997,0.000000,4.336047>}
box{<0,0,-0.254000><0.502897,0.035000,0.254000> rotate<0,90.000000,0> translate<14.985997,0.000000,4.336047> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.985997,0.000000,3.833150>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.986000,0.000000,3.833156>}
box{<0,0,-0.254000><0.000007,0.035000,0.254000> rotate<0,-63.430762,0> translate<14.985997,0.000000,3.833150> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.985997,0.000000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.986000,0.000000,4.064000>}
box{<0,0,-0.254000><0.000003,0.035000,0.254000> rotate<0,0.000000,0> translate<14.985997,0.000000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.985997,0.000000,5.823950>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.985997,0.000000,6.876047>}
box{<0,0,-0.254000><1.052097,0.035000,0.254000> rotate<0,90.000000,0> translate<14.985997,0.000000,6.876047> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.985997,0.000000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.986000,0.000000,6.096000>}
box{<0,0,-0.254000><0.000003,0.035000,0.254000> rotate<0,0.000000,0> translate<14.985997,0.000000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.985997,0.000000,6.604000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.986000,0.000000,6.604000>}
box{<0,0,-0.254000><0.000003,0.035000,0.254000> rotate<0,0.000000,0> translate<14.985997,0.000000,6.604000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.985997,0.000000,8.363950>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.985997,0.000000,9.416047>}
box{<0,0,-0.254000><1.052097,0.035000,0.254000> rotate<0,90.000000,0> translate<14.985997,0.000000,9.416047> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.985997,0.000000,8.636000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.986000,0.000000,8.636000>}
box{<0,0,-0.254000><0.000003,0.035000,0.254000> rotate<0,0.000000,0> translate<14.985997,0.000000,8.636000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.985997,0.000000,9.144000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.986000,0.000000,9.144000>}
box{<0,0,-0.254000><0.000003,0.035000,0.254000> rotate<0,0.000000,0> translate<14.985997,0.000000,9.144000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.985997,0.000000,10.903950>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.985997,0.000000,11.956047>}
box{<0,0,-0.254000><1.052097,0.035000,0.254000> rotate<0,90.000000,0> translate<14.985997,0.000000,11.956047> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.985997,0.000000,11.176000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.986000,0.000000,11.176000>}
box{<0,0,-0.254000><0.000003,0.035000,0.254000> rotate<0,0.000000,0> translate<14.985997,0.000000,11.176000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.985997,0.000000,11.684000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.986000,0.000000,11.684000>}
box{<0,0,-0.254000><0.000003,0.035000,0.254000> rotate<0,0.000000,0> translate<14.985997,0.000000,11.684000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.985997,0.000000,13.716000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.986000,0.000000,13.716000>}
box{<0,0,-0.254000><0.000003,0.035000,0.254000> rotate<0,0.000000,0> translate<14.985997,0.000000,13.716000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.985997,0.000000,13.970013>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.985997,0.000000,14.496047>}
box{<0,0,-0.254000><0.526034,0.035000,0.254000> rotate<0,90.000000,0> translate<14.985997,0.000000,14.496047> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.985997,0.000000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.986000,0.000000,14.224000>}
box{<0,0,-0.254000><0.000003,0.035000,0.254000> rotate<0,0.000000,0> translate<14.985997,0.000000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.986000,0.000000,4.336047>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.986000,0.000000,3.833156>}
box{<0,0,-0.254000><0.502891,0.035000,0.254000> rotate<0,-90.000000,0> translate<14.986000,0.000000,3.833156> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.986000,0.000000,4.336047>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.729950,0.000000,5.079997>}
box{<0,0,-0.254000><1.052104,0.035000,0.254000> rotate<0,-44.997030,0> translate<14.986000,0.000000,4.336047> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.986000,0.000000,5.823950>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.729950,0.000000,5.080000>}
box{<0,0,-0.254000><1.052104,0.035000,0.254000> rotate<0,44.997030,0> translate<14.986000,0.000000,5.823950> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.986000,0.000000,6.876047>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.986000,0.000000,5.823950>}
box{<0,0,-0.254000><1.052097,0.035000,0.254000> rotate<0,-90.000000,0> translate<14.986000,0.000000,5.823950> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.986000,0.000000,6.876047>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.729950,0.000000,7.619997>}
box{<0,0,-0.254000><1.052104,0.035000,0.254000> rotate<0,-44.997030,0> translate<14.986000,0.000000,6.876047> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.986000,0.000000,8.363950>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.729950,0.000000,7.620000>}
box{<0,0,-0.254000><1.052104,0.035000,0.254000> rotate<0,44.997030,0> translate<14.986000,0.000000,8.363950> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.986000,0.000000,9.416047>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.986000,0.000000,8.363950>}
box{<0,0,-0.254000><1.052097,0.035000,0.254000> rotate<0,-90.000000,0> translate<14.986000,0.000000,8.363950> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.986000,0.000000,9.416047>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.729950,0.000000,10.159997>}
box{<0,0,-0.254000><1.052104,0.035000,0.254000> rotate<0,-44.997030,0> translate<14.986000,0.000000,9.416047> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.986000,0.000000,10.903950>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.729950,0.000000,10.160000>}
box{<0,0,-0.254000><1.052104,0.035000,0.254000> rotate<0,44.997030,0> translate<14.986000,0.000000,10.903950> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.986000,0.000000,11.956047>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.986000,0.000000,10.903950>}
box{<0,0,-0.254000><1.052097,0.035000,0.254000> rotate<0,-90.000000,0> translate<14.986000,0.000000,10.903950> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.986000,0.000000,11.956047>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.729950,0.000000,12.699997>}
box{<0,0,-0.254000><1.052104,0.035000,0.254000> rotate<0,-44.997030,0> translate<14.986000,0.000000,11.956047> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.986000,0.000000,13.443950>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.729950,0.000000,12.700000>}
box{<0,0,-0.254000><1.052104,0.035000,0.254000> rotate<0,44.997030,0> translate<14.986000,0.000000,13.443950> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.986000,0.000000,14.496047>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.986000,0.000000,13.443950>}
box{<0,0,-0.254000><1.052097,0.035000,0.254000> rotate<0,-90.000000,0> translate<14.986000,0.000000,13.443950> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<14.986000,0.000000,14.496047>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.729950,0.000000,15.239997>}
box{<0,0,-0.254000><1.052104,0.035000,0.254000> rotate<0,-44.997030,0> translate<14.986000,0.000000,14.496047> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.075578,0.000000,16.522000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<16.796419,0.000000,16.522000>}
box{<0,0,-0.254000><1.720841,0.035000,0.254000> rotate<0,0.000000,0> translate<15.075578,0.000000,16.522000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.075578,0.000000,19.037997>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<16.796419,0.000000,19.037997>}
box{<0,0,-0.254000><1.720841,0.035000,0.254000> rotate<0,0.000000,0> translate<15.075578,0.000000,19.037997> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.087597,0.000000,32.766013>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.087600,0.000000,33.249966>}
box{<0,0,-0.254000><0.483953,0.035000,0.254000> rotate<0,-89.993690,0> translate<15.087597,0.000000,32.766013> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.087597,0.000000,32.766013>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<16.255966,0.000000,32.766013>}
box{<0,0,-0.254000><1.168369,0.035000,0.254000> rotate<0,0.000000,0> translate<15.087597,0.000000,32.766013> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.087600,0.000000,32.282031>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.359606,0.000000,32.010025>}
box{<0,0,-0.254000><0.384675,0.035000,0.254000> rotate<0,44.997030,0> translate<15.087600,0.000000,32.282031> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.087600,0.000000,32.765981>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.087600,0.000000,32.282031>}
box{<0,0,-0.254000><0.483950,0.035000,0.254000> rotate<0,-90.000000,0> translate<15.087600,0.000000,32.282031> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.087600,0.000000,32.765981>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<16.255966,0.000000,32.765981>}
box{<0,0,-0.254000><1.168366,0.035000,0.254000> rotate<0,0.000000,0> translate<15.087600,0.000000,32.765981> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.087600,0.000000,33.249966>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.772031,0.000000,33.934397>}
box{<0,0,-0.254000><0.967932,0.035000,0.254000> rotate<0,-44.997030,0> translate<15.087600,0.000000,33.249966> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.177997,0.000000,29.646994>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.178000,0.000000,27.751119>}
box{<0,0,-0.254000><1.895875,0.035000,0.254000> rotate<0,89.993966,0> translate<15.177997,0.000000,29.646994> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.177997,0.000000,29.646994>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<16.264978,0.000000,29.646994>}
box{<0,0,-0.254000><1.086981,0.035000,0.254000> rotate<0,0.000000,0> translate<15.177997,0.000000,29.646994> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.178000,0.000000,27.751119>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.212619,0.000000,27.621919>}
box{<0,0,-0.254000><0.133758,0.035000,0.254000> rotate<0,74.995168,0> translate<15.178000,0.000000,27.751119> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.178000,0.000000,29.789000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<16.264978,0.000000,29.789000>}
box{<0,0,-0.254000><1.086978,0.035000,0.254000> rotate<0,0.000000,0> translate<15.178000,0.000000,29.789000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.178000,0.000000,31.684878>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.178000,0.000000,29.789000>}
box{<0,0,-0.254000><1.895878,0.035000,0.254000> rotate<0,-90.000000,0> translate<15.178000,0.000000,29.789000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.178000,0.000000,31.684878>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.212619,0.000000,31.814078>}
box{<0,0,-0.254000><0.133758,0.035000,0.254000> rotate<0,-74.995168,0> translate<15.178000,0.000000,31.684878> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.212619,0.000000,27.621919>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.279497,0.000000,27.506078>}
box{<0,0,-0.254000><0.133760,0.035000,0.254000> rotate<0,59.996964,0> translate<15.212619,0.000000,27.621919> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.212619,0.000000,31.814078>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.279497,0.000000,31.929919>}
box{<0,0,-0.254000><0.133760,0.035000,0.254000> rotate<0,-59.996964,0> translate<15.212619,0.000000,31.814078> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.249966,0.000000,1.510809>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<16.279156,0.000000,2.540000>}
box{<0,0,-0.254000><1.455495,0.035000,0.254000> rotate<0,-44.997030,0> translate<15.249966,0.000000,1.510809> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.263156,0.000000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<21.866872,0.000000,1.524000>}
box{<0,0,-0.254000><6.603716,0.035000,0.254000> rotate<0,0.000000,0> translate<15.263156,0.000000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.279497,0.000000,27.506078>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.374078,0.000000,27.411497>}
box{<0,0,-0.254000><0.133758,0.035000,0.254000> rotate<0,44.997030,0> translate<15.279497,0.000000,27.506078> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.279497,0.000000,31.929919>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.359606,0.000000,32.010025>}
box{<0,0,-0.254000><0.113290,0.035000,0.254000> rotate<0,-44.995913,0> translate<15.279497,0.000000,31.929919> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.374078,0.000000,27.411497>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.489919,0.000000,27.344619>}
box{<0,0,-0.254000><0.133760,0.035000,0.254000> rotate<0,29.997096,0> translate<15.374078,0.000000,27.411497> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.489919,0.000000,27.344619>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.619119,0.000000,27.310000>}
box{<0,0,-0.254000><0.133758,0.035000,0.254000> rotate<0,14.998892,0> translate<15.489919,0.000000,27.344619> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.553000,0.000000,19.986578>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.850578,0.000000,19.689000>}
box{<0,0,-0.254000><0.420839,0.035000,0.254000> rotate<0,44.997030,0> translate<15.553000,0.000000,19.986578> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.553000,0.000000,20.907419>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.553000,0.000000,19.986578>}
box{<0,0,-0.254000><0.920841,0.035000,0.254000> rotate<0,-90.000000,0> translate<15.553000,0.000000,19.986578> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.553000,0.000000,20.907419>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.727581,0.000000,21.082000>}
box{<0,0,-0.254000><0.246895,0.035000,0.254000> rotate<0,-44.997030,0> translate<15.553000,0.000000,20.907419> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.553000,0.000000,21.256578>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.727581,0.000000,21.082000>}
box{<0,0,-0.254000><0.246893,0.035000,0.254000> rotate<0,44.996517,0> translate<15.553000,0.000000,21.256578> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.553000,0.000000,22.177419>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.553000,0.000000,21.256578>}
box{<0,0,-0.254000><0.920841,0.035000,0.254000> rotate<0,-90.000000,0> translate<15.553000,0.000000,21.256578> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.553000,0.000000,22.177419>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.727581,0.000000,22.351997>}
box{<0,0,-0.254000><0.246893,0.035000,0.254000> rotate<0,-44.996517,0> translate<15.553000,0.000000,22.177419> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.553000,0.000000,22.526578>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.727581,0.000000,22.351997>}
box{<0,0,-0.254000><0.246895,0.035000,0.254000> rotate<0,44.997030,0> translate<15.553000,0.000000,22.526578> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.553000,0.000000,23.447419>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.553000,0.000000,22.526578>}
box{<0,0,-0.254000><0.920841,0.035000,0.254000> rotate<0,-90.000000,0> translate<15.553000,0.000000,22.526578> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.553000,0.000000,23.447419>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.727581,0.000000,23.621997>}
box{<0,0,-0.254000><0.246893,0.035000,0.254000> rotate<0,-44.996517,0> translate<15.553000,0.000000,23.447419> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.553000,0.000000,23.796578>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.727581,0.000000,23.621997>}
box{<0,0,-0.254000><0.246895,0.035000,0.254000> rotate<0,44.997030,0> translate<15.553000,0.000000,23.796578> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.553000,0.000000,24.717419>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.553000,0.000000,23.796578>}
box{<0,0,-0.254000><0.920841,0.035000,0.254000> rotate<0,-90.000000,0> translate<15.553000,0.000000,23.796578> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.553000,0.000000,24.717419>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.850578,0.000000,25.014997>}
box{<0,0,-0.254000><0.420839,0.035000,0.254000> rotate<0,-44.997030,0> translate<15.553000,0.000000,24.717419> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.619119,0.000000,27.310000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<16.264994,0.000000,27.310000>}
box{<0,0,-0.254000><0.645875,0.035000,0.254000> rotate<0,0.000000,0> translate<15.619119,0.000000,27.310000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.729950,0.000000,5.079997>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<16.782047,0.000000,5.079997>}
box{<0,0,-0.254000><1.052097,0.035000,0.254000> rotate<0,0.000000,0> translate<15.729950,0.000000,5.079997> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.729950,0.000000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<16.782047,0.000000,5.080000>}
box{<0,0,-0.254000><1.052097,0.035000,0.254000> rotate<0,0.000000,0> translate<15.729950,0.000000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.729950,0.000000,7.619997>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<16.520212,0.000000,7.619997>}
box{<0,0,-0.254000><0.790262,0.035000,0.254000> rotate<0,0.000000,0> translate<15.729950,0.000000,7.619997> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.729950,0.000000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<16.520216,0.000000,7.620000>}
box{<0,0,-0.254000><0.790266,0.035000,0.254000> rotate<0,0.000000,0> translate<15.729950,0.000000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.729950,0.000000,10.159997>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<16.520209,0.000000,10.159997>}
box{<0,0,-0.254000><0.790259,0.035000,0.254000> rotate<0,0.000000,0> translate<15.729950,0.000000,10.159997> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.729950,0.000000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<16.520216,0.000000,10.160000>}
box{<0,0,-0.254000><0.790266,0.035000,0.254000> rotate<0,0.000000,0> translate<15.729950,0.000000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.729950,0.000000,12.699997>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<16.520209,0.000000,12.699997>}
box{<0,0,-0.254000><0.790259,0.035000,0.254000> rotate<0,0.000000,0> translate<15.729950,0.000000,12.699997> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.729950,0.000000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<16.520216,0.000000,12.700000>}
box{<0,0,-0.254000><0.790266,0.035000,0.254000> rotate<0,0.000000,0> translate<15.729950,0.000000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.729950,0.000000,15.239997>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<16.520209,0.000000,15.239997>}
box{<0,0,-0.254000><0.790259,0.035000,0.254000> rotate<0,0.000000,0> translate<15.729950,0.000000,15.239997> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.771156,0.000000,2.032000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<21.606931,0.000000,2.032000>}
box{<0,0,-0.254000><5.835775,0.035000,0.254000> rotate<0,0.000000,0> translate<15.771156,0.000000,2.032000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.772031,0.000000,33.934397>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<16.255981,0.000000,33.934394>}
box{<0,0,-0.254000><0.483950,0.035000,0.254000> rotate<0,0.000370,0> translate<15.772031,0.000000,33.934397> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.850578,0.000000,19.689000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.149769,0.000000,19.689000>}
box{<0,0,-0.254000><1.299191,0.035000,0.254000> rotate<0,0.000000,0> translate<15.850578,0.000000,19.689000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<15.850578,0.000000,25.014997>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<16.983769,0.000000,25.014997>}
box{<0,0,-0.254000><1.133191,0.035000,0.254000> rotate<0,0.000000,0> translate<15.850578,0.000000,25.014997> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<16.255966,0.000000,32.766013>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<16.255966,0.000000,32.765981>}
box{<0,0,-0.254000><0.000031,0.035000,0.254000> rotate<0,-90.000000,0> translate<16.255966,0.000000,32.765981> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<16.255981,0.000000,32.766031>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<16.255981,0.000000,33.934394>}
box{<0,0,-0.254000><1.168362,0.035000,0.254000> rotate<0,90.000000,0> translate<16.255981,0.000000,33.934394> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<16.255981,0.000000,32.766031>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<16.256013,0.000000,32.766031>}
box{<0,0,-0.254000><0.000031,0.035000,0.254000> rotate<0,0.000000,0> translate<16.255981,0.000000,32.766031> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<16.255981,0.000000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<16.256013,0.000000,33.020000>}
box{<0,0,-0.254000><0.000031,0.035000,0.254000> rotate<0,0.000000,0> translate<16.255981,0.000000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<16.255981,0.000000,33.528000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<16.256013,0.000000,33.528000>}
box{<0,0,-0.254000><0.000031,0.035000,0.254000> rotate<0,0.000000,0> translate<16.255981,0.000000,33.528000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<16.256013,0.000000,33.934397>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<16.256013,0.000000,32.766031>}
box{<0,0,-0.254000><1.168366,0.035000,0.254000> rotate<0,-90.000000,0> translate<16.256013,0.000000,32.766031> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<16.256013,0.000000,33.934397>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<16.588447,0.000000,33.934397>}
box{<0,0,-0.254000><0.332434,0.035000,0.254000> rotate<0,0.000000,0> translate<16.256013,0.000000,33.934397> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<16.256031,0.000000,32.765981>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<16.256031,0.000000,32.766013>}
box{<0,0,-0.254000><0.000031,0.035000,0.254000> rotate<0,90.000000,0> translate<16.256031,0.000000,32.766013> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<16.256031,0.000000,32.765981>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.424397,0.000000,32.765981>}
box{<0,0,-0.254000><1.168366,0.035000,0.254000> rotate<0,0.000000,0> translate<16.256031,0.000000,32.765981> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<16.256031,0.000000,32.766013>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.424394,0.000000,32.766013>}
box{<0,0,-0.254000><1.168363,0.035000,0.254000> rotate<0,0.000000,0> translate<16.256031,0.000000,32.766013> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<16.264978,0.000000,29.789000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<16.264978,0.000000,29.646994>}
box{<0,0,-0.254000><0.142006,0.035000,0.254000> rotate<0,-90.000000,0> translate<16.264978,0.000000,29.646994> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<16.264994,0.000000,27.310000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<16.264994,0.000000,29.646978>}
box{<0,0,-0.254000><2.336978,0.035000,0.254000> rotate<0,90.000000,0> translate<16.264994,0.000000,29.646978> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<16.264994,0.000000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<16.407000,0.000000,27.432000>}
box{<0,0,-0.254000><0.142006,0.035000,0.254000> rotate<0,0.000000,0> translate<16.264994,0.000000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<16.264994,0.000000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<16.407000,0.000000,27.940000>}
box{<0,0,-0.254000><0.142006,0.035000,0.254000> rotate<0,0.000000,0> translate<16.264994,0.000000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<16.264994,0.000000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<16.407000,0.000000,28.448000>}
box{<0,0,-0.254000><0.142006,0.035000,0.254000> rotate<0,0.000000,0> translate<16.264994,0.000000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<16.264994,0.000000,28.956000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<16.407000,0.000000,28.956000>}
box{<0,0,-0.254000><0.142006,0.035000,0.254000> rotate<0,0.000000,0> translate<16.264994,0.000000,28.956000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<16.264994,0.000000,29.464000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<16.407000,0.000000,29.464000>}
box{<0,0,-0.254000><0.142006,0.035000,0.254000> rotate<0,0.000000,0> translate<16.264994,0.000000,29.464000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<16.264994,0.000000,29.646978>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<16.407000,0.000000,29.646978>}
box{<0,0,-0.254000><0.142006,0.035000,0.254000> rotate<0,0.000000,0> translate<16.264994,0.000000,29.646978> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<16.279156,0.000000,2.540000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<16.782047,0.000000,2.540000>}
box{<0,0,-0.254000><0.502891,0.035000,0.254000> rotate<0,0.000000,0> translate<16.279156,0.000000,2.540000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<16.385241,0.000000,34.137600>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<16.588447,0.000000,33.934397>}
box{<0,0,-0.254000><0.287375,0.035000,0.254000> rotate<0,44.996590,0> translate<16.385241,0.000000,34.137600> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<16.407000,0.000000,27.310000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.052878,0.000000,27.310000>}
box{<0,0,-0.254000><0.645878,0.035000,0.254000> rotate<0,0.000000,0> translate<16.407000,0.000000,27.310000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<16.407000,0.000000,29.646978>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<16.407000,0.000000,27.310000>}
box{<0,0,-0.254000><2.336978,0.035000,0.254000> rotate<0,-90.000000,0> translate<16.407000,0.000000,27.310000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<16.407019,0.000000,29.646994>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<16.407019,0.000000,29.789000>}
box{<0,0,-0.254000><0.142006,0.035000,0.254000> rotate<0,90.000000,0> translate<16.407019,0.000000,29.789000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<16.407019,0.000000,29.646994>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.493994,0.000000,29.646994>}
box{<0,0,-0.254000><1.086975,0.035000,0.254000> rotate<0,0.000000,0> translate<16.407019,0.000000,29.646994> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<16.407019,0.000000,29.789000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.493997,0.000000,29.789000>}
box{<0,0,-0.254000><1.086978,0.035000,0.254000> rotate<0,0.000000,0> translate<16.407019,0.000000,29.789000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<16.520209,0.000000,10.159997>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<16.520216,0.000000,10.160000>}
box{<0,0,-0.254000><0.000007,0.035000,0.254000> rotate<0,-26.563298,0> translate<16.520209,0.000000,10.159997> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<16.520209,0.000000,12.699997>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<16.520216,0.000000,12.700000>}
box{<0,0,-0.254000><0.000007,0.035000,0.254000> rotate<0,-26.563298,0> translate<16.520209,0.000000,12.699997> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<16.520209,0.000000,15.239997>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<18.592800,0.000000,17.312587>}
box{<0,0,-0.254000><2.931086,0.035000,0.254000> rotate<0,-44.997030,0> translate<16.520209,0.000000,15.239997> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<16.520212,0.000000,7.619997>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<16.520216,0.000000,7.620000>}
box{<0,0,-0.254000><0.000004,0.035000,0.254000> rotate<0,-44.997030,0> translate<16.520212,0.000000,7.619997> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<16.782047,0.000000,2.540000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.525997,0.000000,3.283950>}
box{<0,0,-0.254000><1.052104,0.035000,0.254000> rotate<0,-44.997030,0> translate<16.782047,0.000000,2.540000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<16.782047,0.000000,2.540000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<21.374934,0.000000,2.540000>}
box{<0,0,-0.254000><4.592887,0.035000,0.254000> rotate<0,0.000000,0> translate<16.782047,0.000000,2.540000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<16.782047,0.000000,5.079997>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.525997,0.000000,4.336047>}
box{<0,0,-0.254000><1.052104,0.035000,0.254000> rotate<0,44.997030,0> translate<16.782047,0.000000,5.079997> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<16.782047,0.000000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.525997,0.000000,5.823950>}
box{<0,0,-0.254000><1.052104,0.035000,0.254000> rotate<0,-44.997030,0> translate<16.782047,0.000000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<16.782047,0.000000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<21.228078,0.000000,5.080000>}
box{<0,0,-0.254000><4.446031,0.035000,0.254000> rotate<0,0.000000,0> translate<16.782047,0.000000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<16.796419,0.000000,16.522000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.093997,0.000000,16.819578>}
box{<0,0,-0.254000><0.420839,0.035000,0.254000> rotate<0,-44.997030,0> translate<16.796419,0.000000,16.522000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<16.796419,0.000000,19.037997>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<16.906316,0.000000,18.928100>}
box{<0,0,-0.254000><0.155418,0.035000,0.254000> rotate<0,44.997030,0> translate<16.796419,0.000000,19.037997> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<16.906316,0.000000,18.928100>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.663216,0.000000,19.685000>}
box{<0,0,-0.254000><1.070418,0.035000,0.254000> rotate<0,-44.997030,0> translate<16.906316,0.000000,18.928100> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<16.945884,0.000000,35.966397>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.281966,0.000000,35.827188>}
box{<0,0,-0.254000><0.363772,0.035000,0.254000> rotate<0,22.498510,0> translate<16.945884,0.000000,35.966397> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<16.983769,0.000000,25.014997>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<16.993425,0.000000,25.018997>}
box{<0,0,-0.254000><0.010452,0.035000,0.254000> rotate<0,-22.499783,0> translate<16.983769,0.000000,25.014997> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<16.993425,0.000000,25.018997>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<20.344572,0.000000,25.018997>}
box{<0,0,-0.254000><3.351147,0.035000,0.254000> rotate<0,0.000000,0> translate<16.993425,0.000000,25.018997> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.038419,0.000000,16.764000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<18.044213,0.000000,16.764000>}
box{<0,0,-0.254000><1.005794,0.035000,0.254000> rotate<0,0.000000,0> translate<17.038419,0.000000,16.764000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.052878,0.000000,27.310000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.182078,0.000000,27.344619>}
box{<0,0,-0.254000><0.133758,0.035000,0.254000> rotate<0,-14.998892,0> translate<17.052878,0.000000,27.310000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.093997,0.000000,16.819578>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.093997,0.000000,17.146894>}
box{<0,0,-0.254000><0.327316,0.035000,0.254000> rotate<0,90.000000,0> translate<17.093997,0.000000,17.146894> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.093997,0.000000,17.146894>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.166859,0.000000,17.177072>}
box{<0,0,-0.254000><0.078865,0.035000,0.254000> rotate<0,-22.496830,0> translate<17.093997,0.000000,17.146894> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.149769,0.000000,19.689000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.159425,0.000000,19.685000>}
box{<0,0,-0.254000><0.010452,0.035000,0.254000> rotate<0,22.499783,0> translate<17.149769,0.000000,19.689000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.159425,0.000000,19.685000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.663216,0.000000,19.685000>}
box{<0,0,-0.254000><0.503791,0.035000,0.254000> rotate<0,0.000000,0> translate<17.159425,0.000000,19.685000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.166859,0.000000,17.177072>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<18.592800,0.000000,18.603016>}
box{<0,0,-0.254000><2.016587,0.035000,0.254000> rotate<0,-44.997093,0> translate<17.166859,0.000000,17.177072> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.182078,0.000000,27.344619>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.297919,0.000000,27.411497>}
box{<0,0,-0.254000><0.133760,0.035000,0.254000> rotate<0,-29.997096,0> translate<17.182078,0.000000,27.344619> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.214831,0.000000,32.072469>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.297919,0.000000,32.024500>}
box{<0,0,-0.254000><0.095940,0.035000,0.254000> rotate<0,29.997068,0> translate<17.214831,0.000000,32.072469> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.214831,0.000000,32.072469>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.424397,0.000000,32.282031>}
box{<0,0,-0.254000><0.296368,0.035000,0.254000> rotate<0,-44.996603,0> translate<17.214831,0.000000,32.072469> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.261784,0.000000,17.272000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<18.552212,0.000000,17.272000>}
box{<0,0,-0.254000><1.290428,0.035000,0.254000> rotate<0,0.000000,0> translate<17.261784,0.000000,17.272000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.281966,0.000000,35.827188>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.539188,0.000000,35.569966>}
box{<0,0,-0.254000><0.363767,0.035000,0.254000> rotate<0,44.997030,0> translate<17.281966,0.000000,35.827188> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.290044,0.000000,4.572000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<21.155041,0.000000,4.572000>}
box{<0,0,-0.254000><3.864997,0.035000,0.254000> rotate<0,0.000000,0> translate<17.290044,0.000000,4.572000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.290047,0.000000,3.048000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<21.228075,0.000000,3.048000>}
box{<0,0,-0.254000><3.938028,0.035000,0.254000> rotate<0,0.000000,0> translate<17.290047,0.000000,3.048000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.290047,0.000000,5.588000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<21.374941,0.000000,5.588000>}
box{<0,0,-0.254000><4.084894,0.035000,0.254000> rotate<0,0.000000,0> translate<17.290047,0.000000,5.588000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.297919,0.000000,27.411497>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.392500,0.000000,27.506078>}
box{<0,0,-0.254000><0.133758,0.035000,0.254000> rotate<0,-44.997030,0> translate<17.297919,0.000000,27.411497> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.297919,0.000000,32.024500>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.392500,0.000000,31.929919>}
box{<0,0,-0.254000><0.133758,0.035000,0.254000> rotate<0,44.997030,0> translate<17.297919,0.000000,32.024500> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.318419,0.000000,32.004000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.627600,0.000000,32.004000>}
box{<0,0,-0.254000><0.309181,0.035000,0.254000> rotate<0,0.000000,0> translate<17.318419,0.000000,32.004000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.318422,0.000000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<19.534841,0.000000,27.432000>}
box{<0,0,-0.254000><2.216419,0.035000,0.254000> rotate<0,0.000000,0> translate<17.318422,0.000000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.392500,0.000000,27.506078>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.459378,0.000000,27.621919>}
box{<0,0,-0.254000><0.133760,0.035000,0.254000> rotate<0,-59.996964,0> translate<17.392500,0.000000,27.506078> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.392500,0.000000,31.929919>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.459378,0.000000,31.814078>}
box{<0,0,-0.254000><0.133760,0.035000,0.254000> rotate<0,59.996964,0> translate<17.392500,0.000000,31.929919> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.424394,0.000000,32.766013>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.424394,0.000000,33.098450>}
box{<0,0,-0.254000><0.332437,0.035000,0.254000> rotate<0,90.000000,0> translate<17.424394,0.000000,33.098450> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.424394,0.000000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.502844,0.000000,33.020000>}
box{<0,0,-0.254000><0.078450,0.035000,0.254000> rotate<0,0.000000,0> translate<17.424394,0.000000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.424394,0.000000,33.098450>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.627600,0.000000,32.895244>}
box{<0,0,-0.254000><0.287377,0.035000,0.254000> rotate<0,44.997030,0> translate<17.424394,0.000000,33.098450> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.424397,0.000000,32.282031>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.424397,0.000000,32.765981>}
box{<0,0,-0.254000><0.483950,0.035000,0.254000> rotate<0,90.000000,0> translate<17.424397,0.000000,32.765981> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.424397,0.000000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.627600,0.000000,32.512000>}
box{<0,0,-0.254000><0.203203,0.035000,0.254000> rotate<0,0.000000,0> translate<17.424397,0.000000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.459378,0.000000,27.621919>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.493997,0.000000,27.751119>}
box{<0,0,-0.254000><0.133758,0.035000,0.254000> rotate<0,-74.995168,0> translate<17.459378,0.000000,27.621919> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.459378,0.000000,31.814078>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.493997,0.000000,31.684878>}
box{<0,0,-0.254000><0.133758,0.035000,0.254000> rotate<0,74.995168,0> translate<17.459378,0.000000,31.814078> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.493994,0.000000,29.646994>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.493997,0.000000,27.751119>}
box{<0,0,-0.254000><1.895875,0.035000,0.254000> rotate<0,89.993966,0> translate<17.493994,0.000000,29.646994> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.493997,0.000000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<19.026841,0.000000,27.940000>}
box{<0,0,-0.254000><1.532844,0.035000,0.254000> rotate<0,0.000000,0> translate<17.493997,0.000000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.493997,0.000000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<18.518841,0.000000,28.448000>}
box{<0,0,-0.254000><1.024844,0.035000,0.254000> rotate<0,0.000000,0> translate<17.493997,0.000000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.493997,0.000000,28.956000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<18.010841,0.000000,28.956000>}
box{<0,0,-0.254000><0.516844,0.035000,0.254000> rotate<0,0.000000,0> translate<17.493997,0.000000,28.956000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.493997,0.000000,29.464000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.657469,0.000000,29.464000>}
box{<0,0,-0.254000><0.163472,0.035000,0.254000> rotate<0,0.000000,0> translate<17.493997,0.000000,29.464000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.493997,0.000000,29.789000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.493997,0.000000,31.684878>}
box{<0,0,-0.254000><1.895878,0.035000,0.254000> rotate<0,90.000000,0> translate<17.493997,0.000000,31.684878> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.493997,0.000000,29.972000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.627600,0.000000,29.972000>}
box{<0,0,-0.254000><0.133603,0.035000,0.254000> rotate<0,0.000000,0> translate<17.493997,0.000000,29.972000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.493997,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.627600,0.000000,30.480000>}
box{<0,0,-0.254000><0.133603,0.035000,0.254000> rotate<0,0.000000,0> translate<17.493997,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.493997,0.000000,30.988000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.627600,0.000000,30.988000>}
box{<0,0,-0.254000><0.133603,0.035000,0.254000> rotate<0,0.000000,0> translate<17.493997,0.000000,30.988000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.493997,0.000000,31.496000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.627600,0.000000,31.496000>}
box{<0,0,-0.254000><0.133603,0.035000,0.254000> rotate<0,0.000000,0> translate<17.493997,0.000000,31.496000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.525997,0.000000,3.283950>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.525997,0.000000,4.336047>}
box{<0,0,-0.254000><1.052097,0.035000,0.254000> rotate<0,90.000000,0> translate<17.525997,0.000000,4.336047> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.525997,0.000000,3.556000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<21.155038,0.000000,3.556000>}
box{<0,0,-0.254000><3.629041,0.035000,0.254000> rotate<0,0.000000,0> translate<17.525997,0.000000,3.556000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.525997,0.000000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<21.082000,0.000000,4.064000>}
box{<0,0,-0.254000><3.556003,0.035000,0.254000> rotate<0,0.000000,0> translate<17.525997,0.000000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.525997,0.000000,5.823950>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.525997,0.000000,6.614213>}
box{<0,0,-0.254000><0.790263,0.035000,0.254000> rotate<0,90.000000,0> translate<17.525997,0.000000,6.614213> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.525997,0.000000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<21.606934,0.000000,6.096000>}
box{<0,0,-0.254000><4.080938,0.035000,0.254000> rotate<0,0.000000,0> translate<17.525997,0.000000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.525997,0.000000,6.604000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<21.866878,0.000000,6.604000>}
box{<0,0,-0.254000><4.340881,0.035000,0.254000> rotate<0,0.000000,0> translate<17.525997,0.000000,6.604000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.525997,0.000000,6.614213>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<22.754856,0.000000,11.843072>}
box{<0,0,-0.254000><7.394724,0.035000,0.254000> rotate<0,-44.997030,0> translate<17.525997,0.000000,6.614213> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.539188,0.000000,35.569966>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<19.059963,0.000000,34.049188>}
box{<0,0,-0.254000><2.150703,0.035000,0.254000> rotate<0,44.997089,0> translate<17.539188,0.000000,35.569966> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.549153,0.000000,35.560000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<21.722934,0.000000,35.560000>}
box{<0,0,-0.254000><4.173781,0.035000,0.254000> rotate<0,0.000000,0> translate<17.549153,0.000000,35.560000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.627600,0.000000,29.536113>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.766809,0.000000,29.200031>}
box{<0,0,-0.254000><0.363772,0.035000,0.254000> rotate<0,67.495551,0> translate<17.627600,0.000000,29.536113> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.627600,0.000000,32.895244>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.627600,0.000000,29.536113>}
box{<0,0,-0.254000><3.359131,0.035000,0.254000> rotate<0,-90.000000,0> translate<17.627600,0.000000,29.536113> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.766809,0.000000,29.200031>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<18.024031,0.000000,28.942809>}
box{<0,0,-0.254000><0.363767,0.035000,0.254000> rotate<0,44.997030,0> translate<17.766809,0.000000,29.200031> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<17.769784,0.000000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<18.592800,0.000000,17.780000>}
box{<0,0,-0.254000><0.823016,0.035000,0.254000> rotate<0,0.000000,0> translate<17.769784,0.000000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<18.023784,0.000000,7.112000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<22.307063,0.000000,7.112000>}
box{<0,0,-0.254000><4.283278,0.035000,0.254000> rotate<0,0.000000,0> translate<18.023784,0.000000,7.112000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<18.024031,0.000000,28.942809>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<25.501600,0.000000,21.465241>}
box{<0,0,-0.254000><10.574879,0.035000,0.254000> rotate<0,44.997030,0> translate<18.024031,0.000000,28.942809> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<18.057153,0.000000,35.052000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<21.490938,0.000000,35.052000>}
box{<0,0,-0.254000><3.433784,0.035000,0.254000> rotate<0,0.000000,0> translate<18.057153,0.000000,35.052000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<18.277784,0.000000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<18.592800,0.000000,18.288000>}
box{<0,0,-0.254000><0.315016,0.035000,0.254000> rotate<0,0.000000,0> translate<18.277784,0.000000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<18.531784,0.000000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<22.816697,0.000000,7.620000>}
box{<0,0,-0.254000><4.284913,0.035000,0.254000> rotate<0,0.000000,0> translate<18.531784,0.000000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<18.565153,0.000000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<21.264600,0.000000,34.544000>}
box{<0,0,-0.254000><2.699447,0.035000,0.254000> rotate<0,0.000000,0> translate<18.565153,0.000000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<18.592800,0.000000,18.603016>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<18.592800,0.000000,17.312587>}
box{<0,0,-0.254000><1.290428,0.035000,0.254000> rotate<0,-90.000000,0> translate<18.592800,0.000000,17.312587> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<19.039784,0.000000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<23.607159,0.000000,8.128000>}
box{<0,0,-0.254000><4.567375,0.035000,0.254000> rotate<0,0.000000,0> translate<19.039784,0.000000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<19.059963,0.000000,34.049188>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<19.059966,0.000000,34.049188>}
box{<0,0,-0.254000><0.000003,0.035000,0.254000> rotate<0,0.000000,0> translate<19.059963,0.000000,34.049188> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<19.059966,0.000000,34.049188>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<19.317187,0.000000,33.791966>}
box{<0,0,-0.254000><0.363767,0.035000,0.254000> rotate<0,44.997030,0> translate<19.059966,0.000000,34.049188> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<19.073153,0.000000,34.036000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<21.191559,0.000000,34.036000>}
box{<0,0,-0.254000><2.118406,0.035000,0.254000> rotate<0,0.000000,0> translate<19.073153,0.000000,34.036000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<19.317187,0.000000,33.791966>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<19.456397,0.000000,33.455884>}
box{<0,0,-0.254000><0.363772,0.035000,0.254000> rotate<0,67.495551,0> translate<19.317187,0.000000,33.791966> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<19.426528,0.000000,33.528000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<21.118522,0.000000,33.528000>}
box{<0,0,-0.254000><1.691994,0.035000,0.254000> rotate<0,0.000000,0> translate<19.426528,0.000000,33.528000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<19.456397,0.000000,30.096756>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<19.456397,0.000000,33.455884>}
box{<0,0,-0.254000><3.359128,0.035000,0.254000> rotate<0,90.000000,0> translate<19.456397,0.000000,33.455884> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<19.456397,0.000000,30.096756>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<27.191188,0.000000,22.361966>}
box{<0,0,-0.254000><10.938646,0.035000,0.254000> rotate<0,44.997030,0> translate<19.456397,0.000000,30.096756> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<19.456397,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<22.086963,0.000000,30.480000>}
box{<0,0,-0.254000><2.630566,0.035000,0.254000> rotate<0,0.000000,0> translate<19.456397,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<19.456397,0.000000,30.988000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<21.722928,0.000000,30.988000>}
box{<0,0,-0.254000><2.266531,0.035000,0.254000> rotate<0,0.000000,0> translate<19.456397,0.000000,30.988000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<19.456397,0.000000,31.496000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<21.490934,0.000000,31.496000>}
box{<0,0,-0.254000><2.034538,0.035000,0.254000> rotate<0,0.000000,0> translate<19.456397,0.000000,31.496000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<19.456397,0.000000,32.004000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<21.264597,0.000000,32.004000>}
box{<0,0,-0.254000><1.808200,0.035000,0.254000> rotate<0,0.000000,0> translate<19.456397,0.000000,32.004000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<19.456397,0.000000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<21.191556,0.000000,32.512000>}
box{<0,0,-0.254000><1.735159,0.035000,0.254000> rotate<0,0.000000,0> translate<19.456397,0.000000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<19.456397,0.000000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<21.118519,0.000000,33.020000>}
box{<0,0,-0.254000><1.662122,0.035000,0.254000> rotate<0,0.000000,0> translate<19.456397,0.000000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<19.547784,0.000000,8.636000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<28.372000,0.000000,8.636000>}
box{<0,0,-0.254000><8.824216,0.035000,0.254000> rotate<0,0.000000,0> translate<19.547784,0.000000,8.636000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<19.581153,0.000000,29.972000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<22.527150,0.000000,29.972000>}
box{<0,0,-0.254000><2.945997,0.035000,0.254000> rotate<0,0.000000,0> translate<19.581153,0.000000,29.972000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<20.055784,0.000000,9.144000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<28.372000,0.000000,9.144000>}
box{<0,0,-0.254000><8.316216,0.035000,0.254000> rotate<0,0.000000,0> translate<20.055784,0.000000,9.144000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<20.089153,0.000000,29.464000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<23.211919,0.000000,29.464000>}
box{<0,0,-0.254000><3.122766,0.035000,0.254000> rotate<0,0.000000,0> translate<20.089153,0.000000,29.464000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<20.344572,0.000000,25.018997>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<20.624638,0.000000,24.902991>}
box{<0,0,-0.254000><0.303141,0.035000,0.254000> rotate<0,22.498388,0> translate<20.344572,0.000000,25.018997> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<20.563784,0.000000,9.652000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<28.372000,0.000000,9.652000>}
box{<0,0,-0.254000><7.808216,0.035000,0.254000> rotate<0,0.000000,0> translate<20.563784,0.000000,9.652000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<20.597153,0.000000,28.956000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<24.296781,0.000000,28.956000>}
box{<0,0,-0.254000><3.699628,0.035000,0.254000> rotate<0,0.000000,0> translate<20.597153,0.000000,28.956000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<20.624638,0.000000,24.902991>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<20.838991,0.000000,24.688638>}
box{<0,0,-0.254000><0.303141,0.035000,0.254000> rotate<0,44.997030,0> translate<20.624638,0.000000,24.902991> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<20.635628,0.000000,24.892000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<22.074841,0.000000,24.892000>}
box{<0,0,-0.254000><1.439213,0.035000,0.254000> rotate<0,0.000000,0> translate<20.635628,0.000000,24.892000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<20.838991,0.000000,24.688638>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<22.997991,0.000000,22.529637>}
box{<0,0,-0.254000><3.053287,0.035000,0.254000> rotate<0,44.997030,0> translate<20.838991,0.000000,24.688638> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<21.071784,0.000000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<28.372000,0.000000,10.160000>}
box{<0,0,-0.254000><7.300216,0.035000,0.254000> rotate<0,0.000000,0> translate<21.071784,0.000000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<21.082000,0.000000,4.063997>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<21.267197,0.000000,2.775919>}
box{<0,0,-0.254000><1.301324,0.035000,0.254000> rotate<0,81.812817,0> translate<21.082000,0.000000,4.063997> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<21.082000,0.000000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<21.082000,0.000000,4.063997>}
box{<0,0,-0.254000><0.000003,0.035000,0.254000> rotate<0,-90.000000,0> translate<21.082000,0.000000,4.063997> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<21.082000,0.000000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<21.267197,0.000000,5.352078>}
box{<0,0,-0.254000><1.301324,0.035000,0.254000> rotate<0,-81.812817,0> translate<21.082000,0.000000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<21.082000,0.000000,33.273997>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<21.267197,0.000000,31.985919>}
box{<0,0,-0.254000><1.301324,0.035000,0.254000> rotate<0,81.812817,0> translate<21.082000,0.000000,33.273997> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<21.082000,0.000000,33.274000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<21.082000,0.000000,33.273997>}
box{<0,0,-0.254000><0.000003,0.035000,0.254000> rotate<0,-90.000000,0> translate<21.082000,0.000000,33.273997> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<21.082000,0.000000,33.274000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<21.267197,0.000000,34.562078>}
box{<0,0,-0.254000><1.301324,0.035000,0.254000> rotate<0,-81.812817,0> translate<21.082000,0.000000,33.274000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<21.105153,0.000000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<28.372000,0.000000,28.448000>}
box{<0,0,-0.254000><7.266847,0.035000,0.254000> rotate<0,0.000000,0> translate<21.105153,0.000000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<21.143628,0.000000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<22.582841,0.000000,24.384000>}
box{<0,0,-0.254000><1.439213,0.035000,0.254000> rotate<0,0.000000,0> translate<21.143628,0.000000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<21.267197,0.000000,2.775916>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<21.807787,0.000000,1.592191>}
box{<0,0,-0.254000><1.301324,0.035000,0.254000> rotate<0,65.450164,0> translate<21.267197,0.000000,2.775916> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<21.267197,0.000000,2.775919>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<21.267197,0.000000,2.775916>}
box{<0,0,-0.254000><0.000003,0.035000,0.254000> rotate<0,-90.000000,0> translate<21.267197,0.000000,2.775916> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<21.267197,0.000000,5.352081>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<21.267197,0.000000,5.352078>}
box{<0,0,-0.254000><0.000003,0.035000,0.254000> rotate<0,-90.000000,0> translate<21.267197,0.000000,5.352078> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<21.267197,0.000000,5.352081>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<21.807787,0.000000,6.535806>}
box{<0,0,-0.254000><1.301324,0.035000,0.254000> rotate<0,-65.450164,0> translate<21.267197,0.000000,5.352081> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<21.267197,0.000000,31.985916>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<21.807787,0.000000,30.802191>}
box{<0,0,-0.254000><1.301324,0.035000,0.254000> rotate<0,65.450164,0> translate<21.267197,0.000000,31.985916> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<21.267197,0.000000,31.985919>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<21.267197,0.000000,31.985916>}
box{<0,0,-0.254000><0.000003,0.035000,0.254000> rotate<0,-90.000000,0> translate<21.267197,0.000000,31.985916> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<21.267197,0.000000,34.562081>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<21.267197,0.000000,34.562078>}
box{<0,0,-0.254000><0.000003,0.035000,0.254000> rotate<0,-90.000000,0> translate<21.267197,0.000000,34.562078> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<21.267197,0.000000,34.562081>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<21.807787,0.000000,35.745806>}
box{<0,0,-0.254000><1.301324,0.035000,0.254000> rotate<0,-65.450164,0> translate<21.267197,0.000000,34.562081> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<21.579784,0.000000,10.668000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<28.372000,0.000000,10.668000>}
box{<0,0,-0.254000><6.792216,0.035000,0.254000> rotate<0,0.000000,0> translate<21.579784,0.000000,10.668000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<21.613153,0.000000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<28.372000,0.000000,27.940000>}
box{<0,0,-0.254000><6.758847,0.035000,0.254000> rotate<0,0.000000,0> translate<21.613153,0.000000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<21.651628,0.000000,23.876000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<23.090841,0.000000,23.876000>}
box{<0,0,-0.254000><1.439213,0.035000,0.254000> rotate<0,0.000000,0> translate<21.651628,0.000000,23.876000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<21.807787,0.000000,1.592188>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<22.086972,0.000000,1.269997>}
box{<0,0,-0.254000><0.426322,0.035000,0.254000> rotate<0,49.087201,0> translate<21.807787,0.000000,1.592188> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<21.807787,0.000000,1.592191>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<21.807787,0.000000,1.592188>}
box{<0,0,-0.254000><0.000003,0.035000,0.254000> rotate<0,-90.000000,0> translate<21.807787,0.000000,1.592188> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<21.807787,0.000000,6.535809>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<21.807787,0.000000,6.535806>}
box{<0,0,-0.254000><0.000003,0.035000,0.254000> rotate<0,-90.000000,0> translate<21.807787,0.000000,6.535806> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<21.807787,0.000000,6.535809>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<22.659975,0.000000,7.519281>}
box{<0,0,-0.254000><1.301323,0.035000,0.254000> rotate<0,-49.087527,0> translate<21.807787,0.000000,6.535809> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<21.807787,0.000000,30.802188>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<22.659975,0.000000,29.818713>}
box{<0,0,-0.254000><1.301325,0.035000,0.254000> rotate<0,49.087617,0> translate<21.807787,0.000000,30.802188> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<21.807787,0.000000,30.802191>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<21.807787,0.000000,30.802188>}
box{<0,0,-0.254000><0.000003,0.035000,0.254000> rotate<0,-90.000000,0> translate<21.807787,0.000000,30.802188> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<21.807787,0.000000,35.745809>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<21.807787,0.000000,35.745806>}
box{<0,0,-0.254000><0.000003,0.035000,0.254000> rotate<0,-90.000000,0> translate<21.807787,0.000000,35.745806> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<21.807787,0.000000,35.745809>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<22.078306,0.000000,36.058000>}
box{<0,0,-0.254000><0.413090,0.035000,0.254000> rotate<0,-49.087247,0> translate<21.807787,0.000000,35.745809> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<22.087784,0.000000,11.176000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<28.372000,0.000000,11.176000>}
box{<0,0,-0.254000><6.284216,0.035000,0.254000> rotate<0,0.000000,0> translate<22.087784,0.000000,11.176000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<22.121153,0.000000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<28.372000,0.000000,27.432000>}
box{<0,0,-0.254000><6.250847,0.035000,0.254000> rotate<0,0.000000,0> translate<22.121153,0.000000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<22.159628,0.000000,23.368000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<23.598841,0.000000,23.368000>}
box{<0,0,-0.254000><1.439213,0.035000,0.254000> rotate<0,0.000000,0> translate<22.159628,0.000000,23.368000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<22.595784,0.000000,11.684000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<28.372000,0.000000,11.684000>}
box{<0,0,-0.254000><5.776216,0.035000,0.254000> rotate<0,0.000000,0> translate<22.595784,0.000000,11.684000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<22.629153,0.000000,26.924000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<28.372000,0.000000,26.924000>}
box{<0,0,-0.254000><5.742847,0.035000,0.254000> rotate<0,0.000000,0> translate<22.629153,0.000000,26.924000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<22.659975,0.000000,7.519284>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<22.659975,0.000000,7.519281>}
box{<0,0,-0.254000><0.000003,0.035000,0.254000> rotate<0,-90.000000,0> translate<22.659975,0.000000,7.519281> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<22.659975,0.000000,7.519284>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<22.659978,0.000000,7.519284>}
box{<0,0,-0.254000><0.000003,0.035000,0.254000> rotate<0,0.000000,0> translate<22.659975,0.000000,7.519284> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<22.659975,0.000000,29.818713>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<22.659978,0.000000,29.818713>}
box{<0,0,-0.254000><0.000003,0.035000,0.254000> rotate<0,0.000000,0> translate<22.659975,0.000000,29.818713> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<22.659978,0.000000,7.519284>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<23.754722,0.000000,8.222834>}
box{<0,0,-0.254000><1.301325,0.035000,0.254000> rotate<0,-32.725147,0> translate<22.659978,0.000000,7.519284> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<22.659978,0.000000,29.818713>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<23.754722,0.000000,29.115163>}
box{<0,0,-0.254000><1.301325,0.035000,0.254000> rotate<0,32.725147,0> translate<22.659978,0.000000,29.818713> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<22.667628,0.000000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<24.106841,0.000000,22.860000>}
box{<0,0,-0.254000><1.439213,0.035000,0.254000> rotate<0,0.000000,0> translate<22.667628,0.000000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<22.754856,0.000000,11.843072>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<22.754859,0.000000,11.843072>}
box{<0,0,-0.254000><0.000003,0.035000,0.254000> rotate<0,0.000000,0> translate<22.754856,0.000000,11.843072> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<22.754859,0.000000,11.843072>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<22.954925,0.000000,12.043138>}
box{<0,0,-0.254000><0.282936,0.035000,0.254000> rotate<0,-44.997030,0> translate<22.754859,0.000000,11.843072> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<22.954925,0.000000,12.043138>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<23.063197,0.000000,12.304531>}
box{<0,0,-0.254000><0.282930,0.035000,0.254000> rotate<0,-67.495725,0> translate<22.954925,0.000000,12.043138> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<22.997991,0.000000,22.529637>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<23.113997,0.000000,22.249572>}
box{<0,0,-0.254000><0.303141,0.035000,0.254000> rotate<0,67.495673,0> translate<22.997991,0.000000,22.529637> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<23.016584,0.000000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<28.372000,0.000000,12.192000>}
box{<0,0,-0.254000><5.355416,0.035000,0.254000> rotate<0,0.000000,0> translate<23.016584,0.000000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<23.063197,0.000000,12.304531>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<23.063197,0.000000,12.836269>}
box{<0,0,-0.254000><0.531738,0.035000,0.254000> rotate<0,90.000000,0> translate<23.063197,0.000000,12.836269> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<23.063197,0.000000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<28.372000,0.000000,12.700000>}
box{<0,0,-0.254000><5.308803,0.035000,0.254000> rotate<0,0.000000,0> translate<23.063197,0.000000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<23.063197,0.000000,12.836269>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<23.079119,0.000000,12.832000>}
box{<0,0,-0.254000><0.016484,0.035000,0.254000> rotate<0,15.007391,0> translate<23.063197,0.000000,12.836269> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<23.063197,0.000000,19.381559>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<23.063197,0.000000,21.823784>}
box{<0,0,-0.254000><2.442225,0.035000,0.254000> rotate<0,90.000000,0> translate<23.063197,0.000000,21.823784> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<23.063197,0.000000,19.381559>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<23.392031,0.000000,19.710397>}
box{<0,0,-0.254000><0.465044,0.035000,0.254000> rotate<0,-44.997302,0> translate<23.063197,0.000000,19.381559> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<23.063197,0.000000,19.812000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<25.501600,0.000000,19.812000>}
box{<0,0,-0.254000><2.438403,0.035000,0.254000> rotate<0,0.000000,0> translate<23.063197,0.000000,19.812000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<23.063197,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<25.501600,0.000000,20.320000>}
box{<0,0,-0.254000><2.438403,0.035000,0.254000> rotate<0,0.000000,0> translate<23.063197,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<23.063197,0.000000,20.828000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<25.501600,0.000000,20.828000>}
box{<0,0,-0.254000><2.438403,0.035000,0.254000> rotate<0,0.000000,0> translate<23.063197,0.000000,20.828000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<23.063197,0.000000,21.336000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<25.501600,0.000000,21.336000>}
box{<0,0,-0.254000><2.438403,0.035000,0.254000> rotate<0,0.000000,0> translate<23.063197,0.000000,21.336000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<23.063197,0.000000,21.823784>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<23.113997,0.000000,21.946425>}
box{<0,0,-0.254000><0.132745,0.035000,0.254000> rotate<0,-67.495310,0> translate<23.063197,0.000000,21.823784> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<23.071569,0.000000,21.844000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<25.122841,0.000000,21.844000>}
box{<0,0,-0.254000><2.051272,0.035000,0.254000> rotate<0,0.000000,0> translate<23.071569,0.000000,21.844000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<23.071572,0.000000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<24.614841,0.000000,22.352000>}
box{<0,0,-0.254000><1.543269,0.035000,0.254000> rotate<0,0.000000,0> translate<23.071572,0.000000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<23.079119,0.000000,12.832000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<23.724994,0.000000,12.832000>}
box{<0,0,-0.254000><0.645875,0.035000,0.254000> rotate<0,0.000000,0> translate<23.079119,0.000000,12.832000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<23.113997,0.000000,21.946425>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<23.113997,0.000000,22.249572>}
box{<0,0,-0.254000><0.303147,0.035000,0.254000> rotate<0,90.000000,0> translate<23.113997,0.000000,22.249572> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<23.137153,0.000000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<28.372000,0.000000,26.416000>}
box{<0,0,-0.254000><5.234847,0.035000,0.254000> rotate<0,0.000000,0> translate<23.137153,0.000000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<23.392031,0.000000,19.710397>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<23.875981,0.000000,19.710394>}
box{<0,0,-0.254000><0.483950,0.035000,0.254000> rotate<0,0.000370,0> translate<23.392031,0.000000,19.710397> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<23.645153,0.000000,25.908000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<28.372000,0.000000,25.908000>}
box{<0,0,-0.254000><4.726847,0.035000,0.254000> rotate<0,0.000000,0> translate<23.645153,0.000000,25.908000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<23.724994,0.000000,12.832000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<23.724994,0.000000,15.168978>}
box{<0,0,-0.254000><2.336978,0.035000,0.254000> rotate<0,90.000000,0> translate<23.724994,0.000000,15.168978> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<23.724994,0.000000,13.208000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<23.867000,0.000000,13.208000>}
box{<0,0,-0.254000><0.142006,0.035000,0.254000> rotate<0,0.000000,0> translate<23.724994,0.000000,13.208000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<23.724994,0.000000,13.716000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<23.867000,0.000000,13.716000>}
box{<0,0,-0.254000><0.142006,0.035000,0.254000> rotate<0,0.000000,0> translate<23.724994,0.000000,13.716000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<23.724994,0.000000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<23.867000,0.000000,14.224000>}
box{<0,0,-0.254000><0.142006,0.035000,0.254000> rotate<0,0.000000,0> translate<23.724994,0.000000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<23.724994,0.000000,14.732000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<23.867000,0.000000,14.732000>}
box{<0,0,-0.254000><0.142006,0.035000,0.254000> rotate<0,0.000000,0> translate<23.724994,0.000000,14.732000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<23.724994,0.000000,15.168978>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<23.867000,0.000000,15.168978>}
box{<0,0,-0.254000><0.142006,0.035000,0.254000> rotate<0,0.000000,0> translate<23.724994,0.000000,15.168978> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<23.754722,0.000000,8.222834>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<23.754725,0.000000,8.222834>}
box{<0,0,-0.254000><0.000003,0.035000,0.254000> rotate<0,0.000000,0> translate<23.754722,0.000000,8.222834> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<23.754722,0.000000,29.115163>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<23.754725,0.000000,29.115163>}
box{<0,0,-0.254000><0.000003,0.035000,0.254000> rotate<0,0.000000,0> translate<23.754722,0.000000,29.115163> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<23.754725,0.000000,8.222834>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<25.003334,0.000000,8.589459>}
box{<0,0,-0.254000><1.301322,0.035000,0.254000> rotate<0,-16.362565,0> translate<23.754725,0.000000,8.222834> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<23.754725,0.000000,29.115163>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<25.003334,0.000000,28.748538>}
box{<0,0,-0.254000><1.301322,0.035000,0.254000> rotate<0,16.362565,0> translate<23.754725,0.000000,29.115163> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<23.867000,0.000000,12.831997>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<24.512878,0.000000,12.832000>}
box{<0,0,-0.254000><0.645878,0.035000,0.254000> rotate<0,-0.000277,0> translate<23.867000,0.000000,12.831997> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<23.867000,0.000000,15.168978>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<23.867000,0.000000,12.831997>}
box{<0,0,-0.254000><2.336981,0.035000,0.254000> rotate<0,-90.000000,0> translate<23.867000,0.000000,12.831997> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<23.867019,0.000000,15.168994>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<23.867019,0.000000,15.311000>}
box{<0,0,-0.254000><0.142006,0.035000,0.254000> rotate<0,90.000000,0> translate<23.867019,0.000000,15.311000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<23.867019,0.000000,15.168994>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<24.953994,0.000000,15.168994>}
box{<0,0,-0.254000><1.086975,0.035000,0.254000> rotate<0,0.000000,0> translate<23.867019,0.000000,15.168994> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<23.867019,0.000000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<25.338000,0.000000,15.240000>}
box{<0,0,-0.254000><1.470981,0.035000,0.254000> rotate<0,0.000000,0> translate<23.867019,0.000000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<23.867019,0.000000,15.311000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<24.953997,0.000000,15.311000>}
box{<0,0,-0.254000><1.086978,0.035000,0.254000> rotate<0,0.000000,0> translate<23.867019,0.000000,15.311000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<23.875981,0.000000,18.542031>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<23.875981,0.000000,19.710394>}
box{<0,0,-0.254000><1.168363,0.035000,0.254000> rotate<0,90.000000,0> translate<23.875981,0.000000,19.710394> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<23.875981,0.000000,18.542031>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<23.876013,0.000000,18.542031>}
box{<0,0,-0.254000><0.000031,0.035000,0.254000> rotate<0,0.000000,0> translate<23.875981,0.000000,18.542031> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<23.875981,0.000000,18.796000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<23.876013,0.000000,18.796000>}
box{<0,0,-0.254000><0.000031,0.035000,0.254000> rotate<0,0.000000,0> translate<23.875981,0.000000,18.796000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<23.875981,0.000000,19.304000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<23.876013,0.000000,19.304000>}
box{<0,0,-0.254000><0.000031,0.035000,0.254000> rotate<0,0.000000,0> translate<23.875981,0.000000,19.304000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<23.876013,0.000000,19.710397>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<23.876013,0.000000,18.542031>}
box{<0,0,-0.254000><1.168366,0.035000,0.254000> rotate<0,-90.000000,0> translate<23.876013,0.000000,18.542031> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<23.876013,0.000000,19.710397>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<24.359966,0.000000,19.710397>}
box{<0,0,-0.254000><0.483953,0.035000,0.254000> rotate<0,0.000000,0> translate<23.876013,0.000000,19.710397> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<23.876031,0.000000,18.541981>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<23.876031,0.000000,18.542013>}
box{<0,0,-0.254000><0.000031,0.035000,0.254000> rotate<0,90.000000,0> translate<23.876031,0.000000,18.542013> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<23.876031,0.000000,18.541981>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<25.044397,0.000000,18.541981>}
box{<0,0,-0.254000><1.168366,0.035000,0.254000> rotate<0,0.000000,0> translate<23.876031,0.000000,18.541981> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<23.876031,0.000000,18.542013>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<25.044394,0.000000,18.542013>}
box{<0,0,-0.254000><1.168363,0.035000,0.254000> rotate<0,0.000000,0> translate<23.876031,0.000000,18.542013> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<24.153153,0.000000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<28.372000,0.000000,25.400000>}
box{<0,0,-0.254000><4.218847,0.035000,0.254000> rotate<0,0.000000,0> translate<24.153153,0.000000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<24.359966,0.000000,19.710397>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<25.044397,0.000000,19.025966>}
box{<0,0,-0.254000><0.967932,0.035000,0.254000> rotate<0,44.997030,0> translate<24.359966,0.000000,19.710397> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<24.512878,0.000000,12.832000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<24.642078,0.000000,12.866619>}
box{<0,0,-0.254000><0.133758,0.035000,0.254000> rotate<0,-14.998892,0> translate<24.512878,0.000000,12.832000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<24.608688,0.000000,17.622325>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<24.642078,0.000000,17.613378>}
box{<0,0,-0.254000><0.034568,0.035000,0.254000> rotate<0,14.998824,0> translate<24.608688,0.000000,17.622325> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<24.608688,0.000000,17.622325>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<25.044397,0.000000,18.058031>}
box{<0,0,-0.254000><0.616184,0.035000,0.254000> rotate<0,-44.996825,0> translate<24.608688,0.000000,17.622325> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<24.642078,0.000000,12.866619>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<24.757919,0.000000,12.933497>}
box{<0,0,-0.254000><0.133760,0.035000,0.254000> rotate<0,-29.997096,0> translate<24.642078,0.000000,12.866619> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<24.642078,0.000000,17.613378>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<24.757919,0.000000,17.546500>}
box{<0,0,-0.254000><0.133760,0.035000,0.254000> rotate<0,29.997096,0> translate<24.642078,0.000000,17.613378> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<24.661153,0.000000,24.892000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<28.372000,0.000000,24.892000>}
box{<0,0,-0.254000><3.710847,0.035000,0.254000> rotate<0,0.000000,0> translate<24.661153,0.000000,24.892000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<24.757919,0.000000,12.933497>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<24.852500,0.000000,13.028078>}
box{<0,0,-0.254000><0.133758,0.035000,0.254000> rotate<0,-44.997030,0> translate<24.757919,0.000000,12.933497> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<24.757919,0.000000,17.546500>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<24.852500,0.000000,17.451919>}
box{<0,0,-0.254000><0.133758,0.035000,0.254000> rotate<0,44.997030,0> translate<24.757919,0.000000,17.546500> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<24.766362,0.000000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<25.525631,0.000000,17.780000>}
box{<0,0,-0.254000><0.759269,0.035000,0.254000> rotate<0,0.000000,0> translate<24.766362,0.000000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<24.766362,0.000000,19.304000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<25.501600,0.000000,19.304000>}
box{<0,0,-0.254000><0.735238,0.035000,0.254000> rotate<0,0.000000,0> translate<24.766362,0.000000,19.304000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<24.852500,0.000000,13.028078>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<24.919378,0.000000,13.143919>}
box{<0,0,-0.254000><0.133760,0.035000,0.254000> rotate<0,-59.996964,0> translate<24.852500,0.000000,13.028078> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<24.852500,0.000000,17.451919>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<24.919378,0.000000,17.336078>}
box{<0,0,-0.254000><0.133760,0.035000,0.254000> rotate<0,59.996964,0> translate<24.852500,0.000000,17.451919> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<24.919378,0.000000,13.143919>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<24.953997,0.000000,13.273119>}
box{<0,0,-0.254000><0.133758,0.035000,0.254000> rotate<0,-74.995168,0> translate<24.919378,0.000000,13.143919> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<24.919378,0.000000,17.336078>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<24.953997,0.000000,17.206878>}
box{<0,0,-0.254000><0.133758,0.035000,0.254000> rotate<0,74.995168,0> translate<24.919378,0.000000,17.336078> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<24.936547,0.000000,13.208000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<25.338000,0.000000,13.208000>}
box{<0,0,-0.254000><0.401453,0.035000,0.254000> rotate<0,0.000000,0> translate<24.936547,0.000000,13.208000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<24.936550,0.000000,17.272000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<25.338000,0.000000,17.272000>}
box{<0,0,-0.254000><0.401450,0.035000,0.254000> rotate<0,0.000000,0> translate<24.936550,0.000000,17.272000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<24.953994,0.000000,15.168994>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<24.953997,0.000000,13.273119>}
box{<0,0,-0.254000><1.895875,0.035000,0.254000> rotate<0,89.993966,0> translate<24.953994,0.000000,15.168994> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<24.953997,0.000000,13.716000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<25.338000,0.000000,13.716000>}
box{<0,0,-0.254000><0.384003,0.035000,0.254000> rotate<0,0.000000,0> translate<24.953997,0.000000,13.716000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<24.953997,0.000000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<25.338000,0.000000,14.224000>}
box{<0,0,-0.254000><0.384003,0.035000,0.254000> rotate<0,0.000000,0> translate<24.953997,0.000000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<24.953997,0.000000,14.732000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<25.338000,0.000000,14.732000>}
box{<0,0,-0.254000><0.384003,0.035000,0.254000> rotate<0,0.000000,0> translate<24.953997,0.000000,14.732000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<24.953997,0.000000,15.311000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<24.953997,0.000000,17.206878>}
box{<0,0,-0.254000><1.895878,0.035000,0.254000> rotate<0,90.000000,0> translate<24.953997,0.000000,17.206878> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<24.953997,0.000000,15.748000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<25.338000,0.000000,15.748000>}
box{<0,0,-0.254000><0.384003,0.035000,0.254000> rotate<0,0.000000,0> translate<24.953997,0.000000,15.748000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<24.953997,0.000000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<25.338000,0.000000,16.256000>}
box{<0,0,-0.254000><0.384003,0.035000,0.254000> rotate<0,0.000000,0> translate<24.953997,0.000000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<24.953997,0.000000,16.764000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<25.338000,0.000000,16.764000>}
box{<0,0,-0.254000><0.384003,0.035000,0.254000> rotate<0,0.000000,0> translate<24.953997,0.000000,16.764000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<25.003334,0.000000,8.589459>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<26.304663,0.000000,8.589459>}
box{<0,0,-0.254000><1.301328,0.035000,0.254000> rotate<0,0.000000,0> translate<25.003334,0.000000,8.589459> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<25.003334,0.000000,28.748538>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<26.304663,0.000000,28.748538>}
box{<0,0,-0.254000><1.301328,0.035000,0.254000> rotate<0,0.000000,0> translate<25.003334,0.000000,28.748538> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<25.044394,0.000000,18.542013>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<25.044397,0.000000,19.025966>}
box{<0,0,-0.254000><0.483953,0.035000,0.254000> rotate<0,-89.993690,0> translate<25.044394,0.000000,18.542013> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<25.044394,0.000000,18.796000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<25.247600,0.000000,18.796000>}
box{<0,0,-0.254000><0.203206,0.035000,0.254000> rotate<0,0.000000,0> translate<25.044394,0.000000,18.796000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<25.044397,0.000000,18.058031>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<25.044397,0.000000,18.541981>}
box{<0,0,-0.254000><0.483950,0.035000,0.254000> rotate<0,90.000000,0> translate<25.044397,0.000000,18.541981> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<25.044397,0.000000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<25.247600,0.000000,18.288000>}
box{<0,0,-0.254000><0.203203,0.035000,0.254000> rotate<0,0.000000,0> translate<25.044397,0.000000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<25.169153,0.000000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<28.372000,0.000000,24.384000>}
box{<0,0,-0.254000><3.202847,0.035000,0.254000> rotate<0,0.000000,0> translate<25.169153,0.000000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<25.247600,0.000000,18.058031>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<25.657637,0.000000,17.647997>}
box{<0,0,-0.254000><0.579878,0.035000,0.254000> rotate<0,44.996812,0> translate<25.247600,0.000000,18.058031> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<25.247600,0.000000,19.025966>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<25.247600,0.000000,18.058031>}
box{<0,0,-0.254000><0.967934,0.035000,0.254000> rotate<0,-90.000000,0> translate<25.247600,0.000000,18.058031> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<25.247600,0.000000,19.025966>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<25.501600,0.000000,19.279962>}
box{<0,0,-0.254000><0.359208,0.035000,0.254000> rotate<0,-44.996678,0> translate<25.247600,0.000000,19.025966> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<25.338000,0.000000,13.129578>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<25.635578,0.000000,12.832000>}
box{<0,0,-0.254000><0.420839,0.035000,0.254000> rotate<0,44.997030,0> translate<25.338000,0.000000,13.129578> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<25.338000,0.000000,17.350419>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<25.338000,0.000000,13.129578>}
box{<0,0,-0.254000><4.220841,0.035000,0.254000> rotate<0,-90.000000,0> translate<25.338000,0.000000,13.129578> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<25.338000,0.000000,17.350419>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<25.635578,0.000000,17.647997>}
box{<0,0,-0.254000><0.420839,0.035000,0.254000> rotate<0,-44.997030,0> translate<25.338000,0.000000,17.350419> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<25.501600,0.000000,21.465241>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<25.501600,0.000000,19.279962>}
box{<0,0,-0.254000><2.185278,0.035000,0.254000> rotate<0,-90.000000,0> translate<25.501600,0.000000,19.279962> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<25.635578,0.000000,12.832000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<27.356419,0.000000,12.832000>}
box{<0,0,-0.254000><1.720841,0.035000,0.254000> rotate<0,0.000000,0> translate<25.635578,0.000000,12.832000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<25.635578,0.000000,17.647997>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<25.657637,0.000000,17.647997>}
box{<0,0,-0.254000><0.022059,0.035000,0.254000> rotate<0,0.000000,0> translate<25.635578,0.000000,17.647997> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<25.677153,0.000000,23.876000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<28.372000,0.000000,23.876000>}
box{<0,0,-0.254000><2.694847,0.035000,0.254000> rotate<0,0.000000,0> translate<25.677153,0.000000,23.876000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<26.185153,0.000000,23.368000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<28.372000,0.000000,23.368000>}
box{<0,0,-0.254000><2.186847,0.035000,0.254000> rotate<0,0.000000,0> translate<26.185153,0.000000,23.368000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<26.304663,0.000000,8.589459>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<27.553272,0.000000,8.222834>}
box{<0,0,-0.254000><1.301322,0.035000,0.254000> rotate<0,16.362565,0> translate<26.304663,0.000000,8.589459> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<26.304663,0.000000,28.748538>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<27.553272,0.000000,29.115163>}
box{<0,0,-0.254000><1.301322,0.035000,0.254000> rotate<0,-16.362565,0> translate<26.304663,0.000000,28.748538> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<26.693153,0.000000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<28.372000,0.000000,22.860000>}
box{<0,0,-0.254000><1.678847,0.035000,0.254000> rotate<0,0.000000,0> translate<26.693153,0.000000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<27.011213,0.000000,28.956000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<28.372000,0.000000,28.956000>}
box{<0,0,-0.254000><1.360787,0.035000,0.254000> rotate<0,0.000000,0> translate<27.011213,0.000000,28.956000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<27.174359,0.000000,17.647997>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<27.356419,0.000000,17.647997>}
box{<0,0,-0.254000><0.182059,0.035000,0.254000> rotate<0,0.000000,0> translate<27.174359,0.000000,17.647997> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<27.174359,0.000000,17.647997>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<27.584397,0.000000,18.058031>}
box{<0,0,-0.254000><0.579878,0.035000,0.254000> rotate<0,-44.996812,0> translate<27.174359,0.000000,17.647997> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<27.191188,0.000000,22.361966>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<27.330397,0.000000,22.025884>}
box{<0,0,-0.254000><0.363772,0.035000,0.254000> rotate<0,67.495551,0> translate<27.191188,0.000000,22.361966> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<27.195316,0.000000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<28.372000,0.000000,22.352000>}
box{<0,0,-0.254000><1.176684,0.035000,0.254000> rotate<0,0.000000,0> translate<27.195316,0.000000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<27.306363,0.000000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<28.372000,0.000000,17.780000>}
box{<0,0,-0.254000><1.065637,0.035000,0.254000> rotate<0,0.000000,0> translate<27.306363,0.000000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<27.330397,0.000000,19.279962>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<27.330397,0.000000,22.025884>}
box{<0,0,-0.254000><2.745922,0.035000,0.254000> rotate<0,90.000000,0> translate<27.330397,0.000000,22.025884> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<27.330397,0.000000,19.279962>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<27.584397,0.000000,19.025966>}
box{<0,0,-0.254000><0.359208,0.035000,0.254000> rotate<0,44.996678,0> translate<27.330397,0.000000,19.279962> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<27.330397,0.000000,19.304000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<28.372000,0.000000,19.304000>}
box{<0,0,-0.254000><1.041603,0.035000,0.254000> rotate<0,0.000000,0> translate<27.330397,0.000000,19.304000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<27.330397,0.000000,19.812000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<28.372000,0.000000,19.812000>}
box{<0,0,-0.254000><1.041603,0.035000,0.254000> rotate<0,0.000000,0> translate<27.330397,0.000000,19.812000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<27.330397,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<28.372000,0.000000,20.320000>}
box{<0,0,-0.254000><1.041603,0.035000,0.254000> rotate<0,0.000000,0> translate<27.330397,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<27.330397,0.000000,20.828000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<28.372000,0.000000,20.828000>}
box{<0,0,-0.254000><1.041603,0.035000,0.254000> rotate<0,0.000000,0> translate<27.330397,0.000000,20.828000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<27.330397,0.000000,21.336000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<28.372000,0.000000,21.336000>}
box{<0,0,-0.254000><1.041603,0.035000,0.254000> rotate<0,0.000000,0> translate<27.330397,0.000000,21.336000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<27.330397,0.000000,21.844000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<28.372000,0.000000,21.844000>}
box{<0,0,-0.254000><1.041603,0.035000,0.254000> rotate<0,0.000000,0> translate<27.330397,0.000000,21.844000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<27.356419,0.000000,12.832000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<27.653997,0.000000,13.129578>}
box{<0,0,-0.254000><0.420839,0.035000,0.254000> rotate<0,-44.997030,0> translate<27.356419,0.000000,12.832000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<27.356419,0.000000,17.647997>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<27.653997,0.000000,17.350419>}
box{<0,0,-0.254000><0.420839,0.035000,0.254000> rotate<0,44.997030,0> translate<27.356419,0.000000,17.647997> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<27.553272,0.000000,8.222834>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<27.553275,0.000000,8.222834>}
box{<0,0,-0.254000><0.000003,0.035000,0.254000> rotate<0,0.000000,0> translate<27.553272,0.000000,8.222834> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<27.553272,0.000000,29.115163>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<27.553275,0.000000,29.115163>}
box{<0,0,-0.254000><0.000003,0.035000,0.254000> rotate<0,0.000000,0> translate<27.553272,0.000000,29.115163> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<27.553275,0.000000,8.222834>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<28.372000,0.000000,7.696669>}
box{<0,0,-0.254000><0.973222,0.035000,0.254000> rotate<0,32.725262,0> translate<27.553275,0.000000,8.222834> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<27.553275,0.000000,29.115163>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<28.372000,0.000000,29.641328>}
box{<0,0,-0.254000><0.973222,0.035000,0.254000> rotate<0,-32.725262,0> translate<27.553275,0.000000,29.115163> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<27.584397,0.000000,18.058031>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<27.584397,0.000000,19.025966>}
box{<0,0,-0.254000><0.967934,0.035000,0.254000> rotate<0,90.000000,0> translate<27.584397,0.000000,19.025966> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<27.584397,0.000000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<28.372000,0.000000,18.288000>}
box{<0,0,-0.254000><0.787603,0.035000,0.254000> rotate<0,0.000000,0> translate<27.584397,0.000000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<27.584397,0.000000,18.796000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<28.372000,0.000000,18.796000>}
box{<0,0,-0.254000><0.787603,0.035000,0.254000> rotate<0,0.000000,0> translate<27.584397,0.000000,18.796000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<27.653997,0.000000,13.129578>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<27.653997,0.000000,17.350419>}
box{<0,0,-0.254000><4.220841,0.035000,0.254000> rotate<0,90.000000,0> translate<27.653997,0.000000,17.350419> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<27.653997,0.000000,13.208000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<28.372000,0.000000,13.208000>}
box{<0,0,-0.254000><0.718003,0.035000,0.254000> rotate<0,0.000000,0> translate<27.653997,0.000000,13.208000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<27.653997,0.000000,13.716000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<28.372000,0.000000,13.716000>}
box{<0,0,-0.254000><0.718003,0.035000,0.254000> rotate<0,0.000000,0> translate<27.653997,0.000000,13.716000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<27.653997,0.000000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<28.372000,0.000000,14.224000>}
box{<0,0,-0.254000><0.718003,0.035000,0.254000> rotate<0,0.000000,0> translate<27.653997,0.000000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<27.653997,0.000000,14.732000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<28.372000,0.000000,14.732000>}
box{<0,0,-0.254000><0.718003,0.035000,0.254000> rotate<0,0.000000,0> translate<27.653997,0.000000,14.732000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<27.653997,0.000000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<28.372000,0.000000,15.240000>}
box{<0,0,-0.254000><0.718003,0.035000,0.254000> rotate<0,0.000000,0> translate<27.653997,0.000000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<27.653997,0.000000,15.748000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<28.372000,0.000000,15.748000>}
box{<0,0,-0.254000><0.718003,0.035000,0.254000> rotate<0,0.000000,0> translate<27.653997,0.000000,15.748000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<27.653997,0.000000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<28.372000,0.000000,16.256000>}
box{<0,0,-0.254000><0.718003,0.035000,0.254000> rotate<0,0.000000,0> translate<27.653997,0.000000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<27.653997,0.000000,16.764000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<28.372000,0.000000,16.764000>}
box{<0,0,-0.254000><0.718003,0.035000,0.254000> rotate<0,0.000000,0> translate<27.653997,0.000000,16.764000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<27.653997,0.000000,17.272000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<28.372000,0.000000,17.272000>}
box{<0,0,-0.254000><0.718003,0.035000,0.254000> rotate<0,0.000000,0> translate<27.653997,0.000000,17.272000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<27.700841,0.000000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<28.372000,0.000000,8.128000>}
box{<0,0,-0.254000><0.671159,0.035000,0.254000> rotate<0,0.000000,0> translate<27.700841,0.000000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<28.096072,0.000000,29.464000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<28.372000,0.000000,29.464000>}
box{<0,0,-0.254000><0.275928,0.035000,0.254000> rotate<0,0.000000,0> translate<28.096072,0.000000,29.464000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<28.372000,0.000000,29.641328>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<28.372000,0.000000,7.696669>}
box{<0,0,-0.254000><21.944659,0.035000,0.254000> rotate<0,-90.000000,0> translate<28.372000,0.000000,7.696669> }
texture{col_pol}
}
#end
union{
cylinder{<16.256000,0.038000,13.970000><16.256000,-1.538000,13.970000>0.508000}
cylinder{<13.716000,0.038000,13.970000><13.716000,-1.538000,13.970000>0.508000}
cylinder{<16.256000,0.038000,11.430000><16.256000,-1.538000,11.430000>0.508000}
cylinder{<13.716000,0.038000,11.430000><13.716000,-1.538000,11.430000>0.508000}
cylinder{<16.256000,0.038000,8.890000><16.256000,-1.538000,8.890000>0.508000}
cylinder{<13.716000,0.038000,8.890000><13.716000,-1.538000,8.890000>0.508000}
cylinder{<16.256000,0.038000,6.350000><16.256000,-1.538000,6.350000>0.508000}
cylinder{<13.716000,0.038000,6.350000><13.716000,-1.538000,6.350000>0.508000}
cylinder{<16.256000,0.038000,3.810000><16.256000,-1.538000,3.810000>0.508000}
cylinder{<13.716000,0.038000,3.810000><13.716000,-1.538000,3.810000>0.508000}
cylinder{<13.716000,0.038000,32.766000><13.716000,-1.538000,32.766000>0.406400}
cylinder{<16.256000,0.038000,32.766000><16.256000,-1.538000,32.766000>0.406400}
cylinder{<3.810000,0.038000,19.304000><3.810000,-1.538000,19.304000>0.406400}
cylinder{<6.350000,0.038000,19.304000><6.350000,-1.538000,19.304000>0.406400}
cylinder{<26.416000,0.038000,18.542000><26.416000,-1.538000,18.542000>0.406400}
cylinder{<23.876000,0.038000,18.542000><23.876000,-1.538000,18.542000>0.406400}
//Bohrungen(schnell)/Durchkontaktierungen
//Bohrungen(schnell)/Platine
texture{col_hls}
}
#if(pcb_silkscreen=on)
//Bestückungsdruck
union{
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.526831,-1.536000,4.123934>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.683600,-1.536000,4.280703>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,-44.997030,0> translate<11.526831,-1.536000,4.123934> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.683600,-1.536000,4.280703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.997134,-1.536000,4.280703>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<11.683600,-1.536000,4.280703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.997134,-1.536000,4.280703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.153900,-1.536000,4.123934>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.997601,0> translate<11.997134,-1.536000,4.280703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.153900,-1.536000,4.123934>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.153900,-1.536000,3.496866>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,-90.000000,0> translate<12.153900,-1.536000,3.496866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.153900,-1.536000,3.496866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.997134,-1.536000,3.340100>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,-44.997030,0> translate<11.997134,-1.536000,3.340100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.997134,-1.536000,3.340100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.683600,-1.536000,3.340100>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<11.683600,-1.536000,3.340100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.683600,-1.536000,3.340100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.526831,-1.536000,3.496866>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.996459,0> translate<11.526831,-1.536000,3.496866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.526831,-1.536000,3.496866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.526831,-1.536000,3.810400>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,90.000000,0> translate<11.526831,-1.536000,3.810400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.526831,-1.536000,3.810400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.840366,-1.536000,3.810400>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<11.526831,-1.536000,3.810400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.218381,-1.536000,3.340100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.218381,-1.536000,4.280703>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,90.000000,0> translate<11.218381,-1.536000,4.280703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.218381,-1.536000,4.280703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.591313,-1.536000,3.340100>}
box{<0,0,-0.038100><1.130464,0.036000,0.038100> rotate<0,-56.306216,0> translate<10.591313,-1.536000,3.340100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.591313,-1.536000,3.340100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.591313,-1.536000,4.280703>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,90.000000,0> translate<10.591313,-1.536000,4.280703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.282863,-1.536000,4.280703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.282863,-1.536000,3.340100>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,-90.000000,0> translate<10.282863,-1.536000,3.340100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.282863,-1.536000,3.340100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.812563,-1.536000,3.340100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<9.812563,-1.536000,3.340100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.812563,-1.536000,3.340100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.655794,-1.536000,3.496866>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.996459,0> translate<9.655794,-1.536000,3.496866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.655794,-1.536000,3.496866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.655794,-1.536000,4.123934>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,90.000000,0> translate<9.655794,-1.536000,4.123934> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.655794,-1.536000,4.123934>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.812563,-1.536000,4.280703>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,-44.997030,0> translate<9.655794,-1.536000,4.123934> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.812563,-1.536000,4.280703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.282863,-1.536000,4.280703>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<9.812563,-1.536000,4.280703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.526831,-1.536000,14.283934>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.683600,-1.536000,14.440703>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,-44.997030,0> translate<11.526831,-1.536000,14.283934> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.683600,-1.536000,14.440703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.997134,-1.536000,14.440703>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<11.683600,-1.536000,14.440703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.997134,-1.536000,14.440703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.153900,-1.536000,14.283934>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.997601,0> translate<11.997134,-1.536000,14.440703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.153900,-1.536000,14.283934>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.153900,-1.536000,13.656866>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,-90.000000,0> translate<12.153900,-1.536000,13.656866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.153900,-1.536000,13.656866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.997134,-1.536000,13.500100>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,-44.997030,0> translate<11.997134,-1.536000,13.500100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.997134,-1.536000,13.500100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.683600,-1.536000,13.500100>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<11.683600,-1.536000,13.500100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.683600,-1.536000,13.500100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.526831,-1.536000,13.656866>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.996459,0> translate<11.526831,-1.536000,13.656866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.526831,-1.536000,13.656866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.526831,-1.536000,13.970400>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,90.000000,0> translate<11.526831,-1.536000,13.970400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.526831,-1.536000,13.970400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.840366,-1.536000,13.970400>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<11.526831,-1.536000,13.970400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.218381,-1.536000,13.500100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.218381,-1.536000,14.440703>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,90.000000,0> translate<11.218381,-1.536000,14.440703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.218381,-1.536000,14.440703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.591313,-1.536000,13.500100>}
box{<0,0,-0.038100><1.130464,0.036000,0.038100> rotate<0,-56.306216,0> translate<10.591313,-1.536000,13.500100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.591313,-1.536000,13.500100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.591313,-1.536000,14.440703>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,90.000000,0> translate<10.591313,-1.536000,14.440703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.282863,-1.536000,14.440703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.282863,-1.536000,13.500100>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,-90.000000,0> translate<10.282863,-1.536000,13.500100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.282863,-1.536000,13.500100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.812563,-1.536000,13.500100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<9.812563,-1.536000,13.500100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.812563,-1.536000,13.500100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.655794,-1.536000,13.656866>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.996459,0> translate<9.655794,-1.536000,13.656866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.655794,-1.536000,13.656866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.655794,-1.536000,14.283934>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,90.000000,0> translate<9.655794,-1.536000,14.283934> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.655794,-1.536000,14.283934>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.812563,-1.536000,14.440703>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,-44.997030,0> translate<9.655794,-1.536000,14.283934> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.812563,-1.536000,14.440703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.282863,-1.536000,14.440703>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<9.812563,-1.536000,14.440703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.297900,-1.536000,4.280703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.297900,-1.536000,3.653634>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,-90.000000,0> translate<21.297900,-1.536000,3.653634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.297900,-1.536000,3.653634>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.984366,-1.536000,3.340100>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,-44.997030,0> translate<20.984366,-1.536000,3.340100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.984366,-1.536000,3.340100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.670831,-1.536000,3.653634>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,44.997030,0> translate<20.670831,-1.536000,3.653634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.670831,-1.536000,3.653634>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.670831,-1.536000,4.280703>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,90.000000,0> translate<20.670831,-1.536000,4.280703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.362381,-1.536000,4.280703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.362381,-1.536000,3.340100>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,-90.000000,0> translate<20.362381,-1.536000,3.340100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.362381,-1.536000,3.340100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.735313,-1.536000,3.340100>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,0.000000,0> translate<19.735313,-1.536000,3.340100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.799794,-1.536000,4.280703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.426863,-1.536000,4.280703>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,0.000000,0> translate<18.799794,-1.536000,4.280703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.426863,-1.536000,4.280703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.426863,-1.536000,3.340100>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,-90.000000,0> translate<19.426863,-1.536000,3.340100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.426863,-1.536000,3.340100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.799794,-1.536000,3.340100>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,0.000000,0> translate<18.799794,-1.536000,3.340100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.426863,-1.536000,3.810400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.113328,-1.536000,3.810400>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<19.113328,-1.536000,3.810400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.491344,-1.536000,4.280703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.491344,-1.536000,3.340100>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,-90.000000,0> translate<18.491344,-1.536000,3.340100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.491344,-1.536000,3.340100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.021044,-1.536000,3.340100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<18.021044,-1.536000,3.340100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.021044,-1.536000,3.340100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.864275,-1.536000,3.496866>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.996459,0> translate<17.864275,-1.536000,3.496866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.864275,-1.536000,3.496866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.864275,-1.536000,4.123934>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,90.000000,0> translate<17.864275,-1.536000,4.123934> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.864275,-1.536000,4.123934>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.021044,-1.536000,4.280703>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,-44.997030,0> translate<17.864275,-1.536000,4.123934> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.021044,-1.536000,4.280703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.491344,-1.536000,4.280703>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<18.021044,-1.536000,4.280703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.551900,-1.536000,14.694703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.551900,-1.536000,14.067634>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,-90.000000,0> translate<21.551900,-1.536000,14.067634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.551900,-1.536000,14.067634>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.238366,-1.536000,13.754100>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,-44.997030,0> translate<21.238366,-1.536000,13.754100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.238366,-1.536000,13.754100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.924831,-1.536000,14.067634>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,44.997030,0> translate<20.924831,-1.536000,14.067634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.924831,-1.536000,14.067634>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.924831,-1.536000,14.694703>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,90.000000,0> translate<20.924831,-1.536000,14.694703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.616381,-1.536000,14.694703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.616381,-1.536000,13.754100>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,-90.000000,0> translate<20.616381,-1.536000,13.754100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.616381,-1.536000,13.754100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.146081,-1.536000,13.754100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<20.146081,-1.536000,13.754100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.146081,-1.536000,13.754100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.989313,-1.536000,13.910866>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.996459,0> translate<19.989313,-1.536000,13.910866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.989313,-1.536000,13.910866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.989313,-1.536000,14.537934>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,90.000000,0> translate<19.989313,-1.536000,14.537934> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.989313,-1.536000,14.537934>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.146081,-1.536000,14.694703>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,-44.997030,0> translate<19.989313,-1.536000,14.537934> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.146081,-1.536000,14.694703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.616381,-1.536000,14.694703>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<20.146081,-1.536000,14.694703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.680862,-1.536000,14.694703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.680862,-1.536000,13.754100>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,-90.000000,0> translate<19.680862,-1.536000,13.754100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.680862,-1.536000,13.754100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.210563,-1.536000,13.754100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<19.210563,-1.536000,13.754100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.210563,-1.536000,13.754100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.053794,-1.536000,13.910866>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.996459,0> translate<19.053794,-1.536000,13.910866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.053794,-1.536000,13.910866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.053794,-1.536000,14.537934>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,90.000000,0> translate<19.053794,-1.536000,14.537934> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.053794,-1.536000,14.537934>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.210563,-1.536000,14.694703>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,-44.997030,0> translate<19.053794,-1.536000,14.537934> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.210563,-1.536000,14.694703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.680862,-1.536000,14.694703>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<19.210563,-1.536000,14.694703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.081600,-1.536000,12.154703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.395134,-1.536000,12.154703>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<21.081600,-1.536000,12.154703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.395134,-1.536000,12.154703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.551900,-1.536000,11.997934>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.997601,0> translate<21.395134,-1.536000,12.154703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.551900,-1.536000,11.997934>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.551900,-1.536000,11.370866>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,-90.000000,0> translate<21.551900,-1.536000,11.370866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.551900,-1.536000,11.370866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.395134,-1.536000,11.214100>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,-44.997030,0> translate<21.395134,-1.536000,11.214100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.395134,-1.536000,11.214100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.081600,-1.536000,11.214100>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<21.081600,-1.536000,11.214100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.081600,-1.536000,11.214100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.924831,-1.536000,11.370866>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.996459,0> translate<20.924831,-1.536000,11.370866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.924831,-1.536000,11.370866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.924831,-1.536000,11.997934>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,90.000000,0> translate<20.924831,-1.536000,11.997934> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.924831,-1.536000,11.997934>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.081600,-1.536000,12.154703>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,-44.997030,0> translate<20.924831,-1.536000,11.997934> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.616381,-1.536000,12.154703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.616381,-1.536000,11.370866>}
box{<0,0,-0.038100><0.783838,0.036000,0.038100> rotate<0,-90.000000,0> translate<20.616381,-1.536000,11.370866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.616381,-1.536000,11.370866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.459616,-1.536000,11.214100>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,-44.997030,0> translate<20.459616,-1.536000,11.214100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.459616,-1.536000,11.214100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.146081,-1.536000,11.214100>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<20.146081,-1.536000,11.214100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.146081,-1.536000,11.214100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.989313,-1.536000,11.370866>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.996459,0> translate<19.989313,-1.536000,11.370866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.989313,-1.536000,11.370866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.989313,-1.536000,12.154703>}
box{<0,0,-0.038100><0.783838,0.036000,0.038100> rotate<0,90.000000,0> translate<19.989313,-1.536000,12.154703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.367328,-1.536000,11.214100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.367328,-1.536000,12.154703>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,90.000000,0> translate<19.367328,-1.536000,12.154703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.680862,-1.536000,12.154703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.053794,-1.536000,12.154703>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,0.000000,0> translate<19.053794,-1.536000,12.154703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.924831,-1.536000,9.457934>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.081600,-1.536000,9.614703>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,-44.997030,0> translate<20.924831,-1.536000,9.457934> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.081600,-1.536000,9.614703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.395134,-1.536000,9.614703>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<21.081600,-1.536000,9.614703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.395134,-1.536000,9.614703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.551900,-1.536000,9.457934>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.997601,0> translate<21.395134,-1.536000,9.614703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.551900,-1.536000,9.457934>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.551900,-1.536000,9.301169>}
box{<0,0,-0.038100><0.156766,0.036000,0.038100> rotate<0,-90.000000,0> translate<21.551900,-1.536000,9.301169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.551900,-1.536000,9.301169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.395134,-1.536000,9.144400>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.997601,0> translate<21.395134,-1.536000,9.144400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.395134,-1.536000,9.144400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.081600,-1.536000,9.144400>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<21.081600,-1.536000,9.144400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.081600,-1.536000,9.144400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.924831,-1.536000,8.987634>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.996459,0> translate<20.924831,-1.536000,8.987634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.924831,-1.536000,8.987634>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.924831,-1.536000,8.830866>}
box{<0,0,-0.038100><0.156769,0.036000,0.038100> rotate<0,-90.000000,0> translate<20.924831,-1.536000,8.830866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.924831,-1.536000,8.830866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.081600,-1.536000,8.674100>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.996459,0> translate<20.924831,-1.536000,8.830866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.081600,-1.536000,8.674100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.395134,-1.536000,8.674100>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<21.081600,-1.536000,8.674100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.395134,-1.536000,8.674100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.551900,-1.536000,8.830866>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,-44.997030,0> translate<21.395134,-1.536000,8.674100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.989313,-1.536000,8.674100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.616381,-1.536000,8.674100>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,0.000000,0> translate<19.989313,-1.536000,8.674100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.616381,-1.536000,8.674100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.989313,-1.536000,9.301169>}
box{<0,0,-0.038100><0.886809,0.036000,0.038100> rotate<0,44.997030,0> translate<19.989313,-1.536000,9.301169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.989313,-1.536000,9.301169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.989313,-1.536000,9.457934>}
box{<0,0,-0.038100><0.156766,0.036000,0.038100> rotate<0,90.000000,0> translate<19.989313,-1.536000,9.457934> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.989313,-1.536000,9.457934>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.146081,-1.536000,9.614703>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,-44.997030,0> translate<19.989313,-1.536000,9.457934> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.146081,-1.536000,9.614703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.459616,-1.536000,9.614703>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<20.146081,-1.536000,9.614703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.459616,-1.536000,9.614703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.616381,-1.536000,9.457934>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.997601,0> translate<20.459616,-1.536000,9.614703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.924831,-1.536000,6.663934>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.081600,-1.536000,6.820703>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,-44.997030,0> translate<20.924831,-1.536000,6.663934> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.081600,-1.536000,6.820703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.395134,-1.536000,6.820703>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<21.081600,-1.536000,6.820703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.395134,-1.536000,6.820703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.551900,-1.536000,6.663934>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.997601,0> translate<21.395134,-1.536000,6.820703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.551900,-1.536000,6.663934>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.551900,-1.536000,6.507169>}
box{<0,0,-0.038100><0.156766,0.036000,0.038100> rotate<0,-90.000000,0> translate<21.551900,-1.536000,6.507169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.551900,-1.536000,6.507169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.395134,-1.536000,6.350400>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.997601,0> translate<21.395134,-1.536000,6.350400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.395134,-1.536000,6.350400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.081600,-1.536000,6.350400>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<21.081600,-1.536000,6.350400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.081600,-1.536000,6.350400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.924831,-1.536000,6.193634>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.996459,0> translate<20.924831,-1.536000,6.193634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.924831,-1.536000,6.193634>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.924831,-1.536000,6.036866>}
box{<0,0,-0.038100><0.156769,0.036000,0.038100> rotate<0,-90.000000,0> translate<20.924831,-1.536000,6.036866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.924831,-1.536000,6.036866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.081600,-1.536000,5.880100>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.996459,0> translate<20.924831,-1.536000,6.036866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.081600,-1.536000,5.880100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.395134,-1.536000,5.880100>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<21.081600,-1.536000,5.880100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.395134,-1.536000,5.880100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.551900,-1.536000,6.036866>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,-44.997030,0> translate<21.395134,-1.536000,5.880100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.616381,-1.536000,6.663934>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.459616,-1.536000,6.820703>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.997601,0> translate<20.459616,-1.536000,6.820703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.459616,-1.536000,6.820703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.146081,-1.536000,6.820703>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<20.146081,-1.536000,6.820703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.146081,-1.536000,6.820703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.989313,-1.536000,6.663934>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,-44.997030,0> translate<19.989313,-1.536000,6.663934> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.989313,-1.536000,6.663934>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.989313,-1.536000,6.507169>}
box{<0,0,-0.038100><0.156766,0.036000,0.038100> rotate<0,-90.000000,0> translate<19.989313,-1.536000,6.507169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.989313,-1.536000,6.507169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.146081,-1.536000,6.350400>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,44.997030,0> translate<19.989313,-1.536000,6.507169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.146081,-1.536000,6.350400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.302847,-1.536000,6.350400>}
box{<0,0,-0.038100><0.156766,0.036000,0.038100> rotate<0,0.000000,0> translate<20.146081,-1.536000,6.350400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.146081,-1.536000,6.350400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.989313,-1.536000,6.193634>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.996459,0> translate<19.989313,-1.536000,6.193634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.989313,-1.536000,6.193634>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.989313,-1.536000,6.036866>}
box{<0,0,-0.038100><0.156769,0.036000,0.038100> rotate<0,-90.000000,0> translate<19.989313,-1.536000,6.036866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.989313,-1.536000,6.036866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.146081,-1.536000,5.880100>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.996459,0> translate<19.989313,-1.536000,6.036866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.146081,-1.536000,5.880100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.459616,-1.536000,5.880100>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<20.146081,-1.536000,5.880100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.459616,-1.536000,5.880100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.616381,-1.536000,6.036866>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,-44.997030,0> translate<20.459616,-1.536000,5.880100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.526831,-1.536000,6.663934>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.683600,-1.536000,6.820703>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,-44.997030,0> translate<11.526831,-1.536000,6.663934> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.683600,-1.536000,6.820703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.997134,-1.536000,6.820703>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<11.683600,-1.536000,6.820703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.997134,-1.536000,6.820703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.153900,-1.536000,6.663934>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.997601,0> translate<11.997134,-1.536000,6.820703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.153900,-1.536000,6.663934>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.153900,-1.536000,6.507169>}
box{<0,0,-0.038100><0.156766,0.036000,0.038100> rotate<0,-90.000000,0> translate<12.153900,-1.536000,6.507169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.153900,-1.536000,6.507169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.997134,-1.536000,6.350400>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.997601,0> translate<11.997134,-1.536000,6.350400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.997134,-1.536000,6.350400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.683600,-1.536000,6.350400>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<11.683600,-1.536000,6.350400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.683600,-1.536000,6.350400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.526831,-1.536000,6.193634>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.996459,0> translate<11.526831,-1.536000,6.193634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.526831,-1.536000,6.193634>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.526831,-1.536000,6.036866>}
box{<0,0,-0.038100><0.156769,0.036000,0.038100> rotate<0,-90.000000,0> translate<11.526831,-1.536000,6.036866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.526831,-1.536000,6.036866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.683600,-1.536000,5.880100>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.996459,0> translate<11.526831,-1.536000,6.036866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.683600,-1.536000,5.880100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.997134,-1.536000,5.880100>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<11.683600,-1.536000,5.880100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.997134,-1.536000,5.880100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.153900,-1.536000,6.036866>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,-44.997030,0> translate<11.997134,-1.536000,5.880100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.218381,-1.536000,6.036866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.218381,-1.536000,6.663934>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,90.000000,0> translate<11.218381,-1.536000,6.663934> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.218381,-1.536000,6.663934>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.061616,-1.536000,6.820703>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.997601,0> translate<11.061616,-1.536000,6.820703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.061616,-1.536000,6.820703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.748081,-1.536000,6.820703>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<10.748081,-1.536000,6.820703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.748081,-1.536000,6.820703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.591313,-1.536000,6.663934>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,-44.997030,0> translate<10.591313,-1.536000,6.663934> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.591313,-1.536000,6.663934>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.591313,-1.536000,6.036866>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,-90.000000,0> translate<10.591313,-1.536000,6.036866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.591313,-1.536000,6.036866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.748081,-1.536000,5.880100>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.996459,0> translate<10.591313,-1.536000,6.036866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.748081,-1.536000,5.880100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.061616,-1.536000,5.880100>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<10.748081,-1.536000,5.880100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.061616,-1.536000,5.880100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.218381,-1.536000,6.036866>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,-44.997030,0> translate<11.061616,-1.536000,5.880100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.218381,-1.536000,6.036866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.591313,-1.536000,6.663934>}
box{<0,0,-0.038100><0.886809,0.036000,0.038100> rotate<0,44.997030,0> translate<10.591313,-1.536000,6.663934> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.526831,-1.536000,9.203934>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.683600,-1.536000,9.360703>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,-44.997030,0> translate<11.526831,-1.536000,9.203934> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.683600,-1.536000,9.360703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.997134,-1.536000,9.360703>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<11.683600,-1.536000,9.360703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.997134,-1.536000,9.360703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.153900,-1.536000,9.203934>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.997601,0> translate<11.997134,-1.536000,9.360703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.153900,-1.536000,9.203934>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.153900,-1.536000,9.047169>}
box{<0,0,-0.038100><0.156766,0.036000,0.038100> rotate<0,-90.000000,0> translate<12.153900,-1.536000,9.047169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.153900,-1.536000,9.047169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.997134,-1.536000,8.890400>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.997601,0> translate<11.997134,-1.536000,8.890400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.997134,-1.536000,8.890400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.683600,-1.536000,8.890400>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<11.683600,-1.536000,8.890400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.683600,-1.536000,8.890400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.526831,-1.536000,8.733634>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.996459,0> translate<11.526831,-1.536000,8.733634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.526831,-1.536000,8.733634>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.526831,-1.536000,8.576866>}
box{<0,0,-0.038100><0.156769,0.036000,0.038100> rotate<0,-90.000000,0> translate<11.526831,-1.536000,8.576866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.526831,-1.536000,8.576866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.683600,-1.536000,8.420100>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.996459,0> translate<11.526831,-1.536000,8.576866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.683600,-1.536000,8.420100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.997134,-1.536000,8.420100>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<11.683600,-1.536000,8.420100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.997134,-1.536000,8.420100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.153900,-1.536000,8.576866>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,-44.997030,0> translate<11.997134,-1.536000,8.420100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.218381,-1.536000,9.047169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.904847,-1.536000,9.360703>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,44.997030,0> translate<10.904847,-1.536000,9.360703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.904847,-1.536000,9.360703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.904847,-1.536000,8.420100>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,-90.000000,0> translate<10.904847,-1.536000,8.420100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.218381,-1.536000,8.420100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.591313,-1.536000,8.420100>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,0.000000,0> translate<10.591313,-1.536000,8.420100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.153900,-1.536000,10.960100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.153900,-1.536000,11.900703>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,90.000000,0> translate<12.153900,-1.536000,11.900703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.153900,-1.536000,11.900703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.526831,-1.536000,10.960100>}
box{<0,0,-0.038100><1.130464,0.036000,0.038100> rotate<0,-56.306216,0> translate<11.526831,-1.536000,10.960100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.526831,-1.536000,10.960100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.526831,-1.536000,11.900703>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,90.000000,0> translate<11.526831,-1.536000,11.900703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.748081,-1.536000,11.900703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.061616,-1.536000,11.900703>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<10.748081,-1.536000,11.900703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.061616,-1.536000,11.900703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.218381,-1.536000,11.743934>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.997601,0> translate<11.061616,-1.536000,11.900703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.218381,-1.536000,11.743934>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.218381,-1.536000,11.116866>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,-90.000000,0> translate<11.218381,-1.536000,11.116866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.218381,-1.536000,11.116866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.061616,-1.536000,10.960100>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,-44.997030,0> translate<11.061616,-1.536000,10.960100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.061616,-1.536000,10.960100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.748081,-1.536000,10.960100>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<10.748081,-1.536000,10.960100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.748081,-1.536000,10.960100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.591313,-1.536000,11.116866>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.996459,0> translate<10.591313,-1.536000,11.116866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.591313,-1.536000,11.116866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.591313,-1.536000,11.743934>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,90.000000,0> translate<10.591313,-1.536000,11.743934> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.591313,-1.536000,11.743934>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.748081,-1.536000,11.900703>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,-44.997030,0> translate<10.591313,-1.536000,11.743934> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.655794,-1.536000,11.900703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.282863,-1.536000,11.900703>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,0.000000,0> translate<9.655794,-1.536000,11.900703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.282863,-1.536000,11.900703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.282863,-1.536000,10.960100>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,-90.000000,0> translate<10.282863,-1.536000,10.960100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.282863,-1.536000,10.960100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.655794,-1.536000,10.960100>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,0.000000,0> translate<9.655794,-1.536000,10.960100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.282863,-1.536000,11.430400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.969328,-1.536000,11.430400>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<9.969328,-1.536000,11.430400> }
//C1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.605000,0.000000,18.440000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.367000,0.000000,18.440000>}
box{<0,0,-0.050800><0.762000,0.036000,0.050800> rotate<0,0.000000,0> translate<14.605000,0.000000,18.440000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.630000,0.000000,17.120000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.367000,0.000000,17.120000>}
box{<0,0,-0.050800><0.737000,0.036000,0.050800> rotate<0,0.000000,0> translate<14.630000,0.000000,17.120000> }
box{<-0.375050,0,-0.725050><0.375050,0.036000,0.725050> rotate<0,-0.000000,0> translate<14.268850,0.000000,17.781150>}
box{<-0.375050,0,-0.725050><0.375050,0.036000,0.725050> rotate<0,-0.000000,0> translate<15.716650,0.000000,17.781150>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.494131,0.000000,18.093934>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.337363,0.000000,18.250703>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,44.997030,0> translate<11.337363,0.000000,18.250703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.337363,0.000000,18.250703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.023828,0.000000,18.250703>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<11.023828,0.000000,18.250703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.023828,0.000000,18.250703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.867063,0.000000,18.093934>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.997601,0> translate<10.867063,0.000000,18.093934> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.867063,0.000000,18.093934>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.867063,0.000000,17.466866>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,-90.000000,0> translate<10.867063,0.000000,17.466866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.867063,0.000000,17.466866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.023828,0.000000,17.310100>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,44.997030,0> translate<10.867063,0.000000,17.466866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.023828,0.000000,17.310100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.337363,0.000000,17.310100>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<11.023828,0.000000,17.310100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.337363,0.000000,17.310100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.494131,0.000000,17.466866>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.996459,0> translate<11.337363,0.000000,17.310100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.802581,0.000000,17.937169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.116116,0.000000,18.250703>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,-44.997030,0> translate<11.802581,0.000000,17.937169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.116116,0.000000,18.250703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.116116,0.000000,17.310100>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,-90.000000,0> translate<12.116116,0.000000,17.310100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.802581,0.000000,17.310100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.429650,0.000000,17.310100>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,0.000000,0> translate<11.802581,0.000000,17.310100> }
//IC1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.936000,0.000000,19.902000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.936000,0.000000,24.802000>}
box{<0,0,-0.063500><4.900000,0.036000,0.063500> rotate<0,90.000000,0> translate<16.936000,0.000000,24.802000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.936000,0.000000,24.802000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.036000,0.000000,24.802000>}
box{<0,0,-0.063500><3.900000,0.036000,0.063500> rotate<0,0.000000,0> translate<13.036000,0.000000,24.802000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.036000,0.000000,24.802000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.036000,0.000000,19.902000>}
box{<0,0,-0.063500><4.900000,0.036000,0.063500> rotate<0,-90.000000,0> translate<13.036000,0.000000,19.902000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.036000,0.000000,19.902000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.936000,0.000000,19.902000>}
box{<0,0,-0.063500><3.900000,0.036000,0.063500> rotate<0,0.000000,0> translate<13.036000,0.000000,19.902000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.808741,0.000000,25.446100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.122275,0.000000,25.446100>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<13.808741,0.000000,25.446100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.965506,0.000000,25.446100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.965506,0.000000,26.386703>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,90.000000,0> translate<13.965506,0.000000,26.386703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.808741,0.000000,26.386703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.122275,0.000000,26.386703>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<13.808741,0.000000,26.386703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.059488,0.000000,26.229934>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.902719,0.000000,26.386703>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,44.997030,0> translate<14.902719,0.000000,26.386703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.902719,0.000000,26.386703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.589184,0.000000,26.386703>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<14.589184,0.000000,26.386703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.589184,0.000000,26.386703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.432419,0.000000,26.229934>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.997601,0> translate<14.432419,0.000000,26.229934> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.432419,0.000000,26.229934>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.432419,0.000000,25.602866>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,-90.000000,0> translate<14.432419,0.000000,25.602866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.432419,0.000000,25.602866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.589184,0.000000,25.446100>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,44.997030,0> translate<14.432419,0.000000,25.602866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.589184,0.000000,25.446100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.902719,0.000000,25.446100>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<14.589184,0.000000,25.446100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.902719,0.000000,25.446100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.059488,0.000000,25.602866>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.996459,0> translate<14.902719,0.000000,25.446100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.367938,0.000000,26.073169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.681472,0.000000,26.386703>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,-44.997030,0> translate<15.367938,0.000000,26.073169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.681472,0.000000,26.386703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.681472,0.000000,25.446100>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,-90.000000,0> translate<15.681472,0.000000,25.446100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.367938,0.000000,25.446100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.995006,0.000000,25.446100>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,0.000000,0> translate<15.367938,0.000000,25.446100> }
//JP1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.891000,-1.536000,15.240000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.526000,-1.536000,14.605000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<16.891000,-1.536000,15.240000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.526000,-1.536000,13.335000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.891000,-1.536000,12.700000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<16.891000,-1.536000,12.700000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.891000,-1.536000,12.700000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.526000,-1.536000,12.065000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<16.891000,-1.536000,12.700000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.526000,-1.536000,10.795000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.891000,-1.536000,10.160000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<16.891000,-1.536000,10.160000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.891000,-1.536000,10.160000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.526000,-1.536000,9.525000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<16.891000,-1.536000,10.160000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.526000,-1.536000,8.255000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.891000,-1.536000,7.620000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<16.891000,-1.536000,7.620000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.891000,-1.536000,7.620000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.526000,-1.536000,6.985000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<16.891000,-1.536000,7.620000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.526000,-1.536000,5.715000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.891000,-1.536000,5.080000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<16.891000,-1.536000,5.080000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.891000,-1.536000,15.240000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.081000,-1.536000,15.240000>}
box{<0,0,-0.076200><3.810000,0.036000,0.076200> rotate<0,0.000000,0> translate<13.081000,-1.536000,15.240000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.081000,-1.536000,15.240000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.446000,-1.536000,14.605000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<12.446000,-1.536000,14.605000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.446000,-1.536000,14.605000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.446000,-1.536000,13.335000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<12.446000,-1.536000,13.335000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.446000,-1.536000,13.335000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.081000,-1.536000,12.700000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<12.446000,-1.536000,13.335000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.081000,-1.536000,12.700000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.446000,-1.536000,12.065000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<12.446000,-1.536000,12.065000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.446000,-1.536000,12.065000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.446000,-1.536000,10.795000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<12.446000,-1.536000,10.795000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.446000,-1.536000,10.795000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.081000,-1.536000,10.160000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<12.446000,-1.536000,10.795000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.081000,-1.536000,10.160000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.446000,-1.536000,9.525000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<12.446000,-1.536000,9.525000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.446000,-1.536000,9.525000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.446000,-1.536000,8.255000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<12.446000,-1.536000,8.255000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.446000,-1.536000,8.255000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.081000,-1.536000,7.620000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<12.446000,-1.536000,8.255000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.081000,-1.536000,7.620000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.446000,-1.536000,6.985000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<12.446000,-1.536000,6.985000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.446000,-1.536000,6.985000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.446000,-1.536000,5.715000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<12.446000,-1.536000,5.715000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.446000,-1.536000,5.715000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.081000,-1.536000,5.080000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<12.446000,-1.536000,5.715000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.081000,-1.536000,12.700000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.891000,-1.536000,12.700000>}
box{<0,0,-0.076200><3.810000,0.036000,0.076200> rotate<0,0.000000,0> translate<13.081000,-1.536000,12.700000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.081000,-1.536000,10.160000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.891000,-1.536000,10.160000>}
box{<0,0,-0.076200><3.810000,0.036000,0.076200> rotate<0,0.000000,0> translate<13.081000,-1.536000,10.160000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.081000,-1.536000,7.620000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.891000,-1.536000,7.620000>}
box{<0,0,-0.076200><3.810000,0.036000,0.076200> rotate<0,0.000000,0> translate<13.081000,-1.536000,7.620000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.081000,-1.536000,5.080000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.891000,-1.536000,5.080000>}
box{<0,0,-0.076200><3.810000,0.036000,0.076200> rotate<0,0.000000,0> translate<13.081000,-1.536000,5.080000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.526000,-1.536000,6.985000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.526000,-1.536000,5.715000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<17.526000,-1.536000,5.715000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.526000,-1.536000,9.525000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.526000,-1.536000,8.255000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<17.526000,-1.536000,8.255000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.526000,-1.536000,12.065000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.526000,-1.536000,10.795000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<17.526000,-1.536000,10.795000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.526000,-1.536000,14.605000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.526000,-1.536000,13.335000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<17.526000,-1.536000,13.335000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.891000,-1.536000,5.080000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.526000,-1.536000,4.445000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<16.891000,-1.536000,5.080000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.526000,-1.536000,3.175000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.891000,-1.536000,2.540000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<16.891000,-1.536000,2.540000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.081000,-1.536000,5.080000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.446000,-1.536000,4.445000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<12.446000,-1.536000,4.445000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.446000,-1.536000,4.445000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.446000,-1.536000,3.175000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<12.446000,-1.536000,3.175000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.446000,-1.536000,3.175000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.081000,-1.536000,2.540000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<12.446000,-1.536000,3.175000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.081000,-1.536000,2.540000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.891000,-1.536000,2.540000>}
box{<0,0,-0.076200><3.810000,0.036000,0.076200> rotate<0,0.000000,0> translate<13.081000,-1.536000,2.540000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.526000,-1.536000,4.445000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.526000,-1.536000,3.175000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<17.526000,-1.536000,3.175000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<16.256000,-1.536000,13.970000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<13.716000,-1.536000,13.970000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<13.716000,-1.536000,11.430000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<16.256000,-1.536000,11.430000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<13.716000,-1.536000,8.890000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<16.256000,-1.536000,8.890000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<13.716000,-1.536000,6.350000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<16.256000,-1.536000,6.350000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<13.716000,-1.536000,3.810000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<16.256000,-1.536000,3.810000>}
//LED1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<16.560800,0.000000,31.496000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<16.560800,0.000000,34.036000>}
box{<0,0,-0.127000><2.540000,0.036000,0.127000> rotate<0,90.000000,0> translate<16.560800,0.000000,34.036000> }
object{ARC(1.524000,0.152400,140.196236,179.999846,0.036000) translate<14.986000,0.000000,32.765997>}
object{ARC(1.524000,0.152400,179.997604,221.630812,0.036000) translate<14.986000,0.000000,32.765937>}
object{ARC(1.524000,0.152400,0.000537,40.601702,0.036000) translate<14.986000,0.000000,32.765984>}
object{ARC(1.524000,0.152400,320.196236,359.999846,0.036000) translate<14.986000,0.000000,32.766003>}
object{ARC(1.524000,0.152400,35.537354,89.998691,0.036000) translate<14.985966,0.000000,32.766000>}
object{ARC(1.524000,0.152400,90.000000,143.130102,0.036000) translate<14.986000,0.000000,32.766000>}
object{ARC(1.524000,0.152400,270.000307,322.127183,0.036000) translate<14.985991,0.000000,32.766000>}
object{ARC(1.524000,0.152400,217.872817,269.999693,0.036000) translate<14.986009,0.000000,32.766000>}
object{ARC(0.635000,0.152400,90.000000,180.000000,0.036000) translate<14.986000,0.000000,32.766000>}
object{ARC(1.016000,0.152400,90.000000,180.000000,0.036000) translate<14.986000,0.000000,32.766000>}
object{ARC(0.635000,0.152400,270.000000,360.000000,0.036000) translate<14.986000,0.000000,32.766000>}
object{ARC(1.016000,0.152400,270.000000,360.000000,0.036000) translate<14.986000,0.000000,32.766000>}
object{ARC(2.032000,0.254000,39.807234,90.000342,0.036000) translate<14.986013,0.000000,32.766000>}
object{ARC(2.032000,0.254000,90.001692,151.928641,0.036000) translate<14.986059,0.000000,32.766000>}
object{ARC(2.032000,0.254000,269.998944,319.761966,0.036000) translate<14.986038,0.000000,32.766000>}
object{ARC(2.032000,0.254000,209.746365,270.001580,0.036000) translate<14.985944,0.000000,32.766000>}
object{ARC(2.032000,0.254000,151.698217,179.999918,0.036000) translate<14.986000,0.000000,32.765997>}
object{ARC(2.032000,0.254000,179.997652,211.605872,0.036000) translate<14.986000,0.000000,32.765916>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.195800,0.000000,33.096981>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.195800,0.000000,32.181800>}
box{<0,0,-0.050800><0.915181,0.036000,0.050800> rotate<0,-90.000000,0> translate<17.195800,0.000000,32.181800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.195800,0.000000,32.181800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.805919,0.000000,32.181800>}
box{<0,0,-0.050800><0.610119,0.036000,0.050800> rotate<0,0.000000,0> translate<17.195800,0.000000,32.181800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<18.741437,0.000000,33.096981>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<18.131319,0.000000,33.096981>}
box{<0,0,-0.050800><0.610119,0.036000,0.050800> rotate<0,0.000000,0> translate<18.131319,0.000000,33.096981> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<18.131319,0.000000,33.096981>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<18.131319,0.000000,32.181800>}
box{<0,0,-0.050800><0.915181,0.036000,0.050800> rotate<0,-90.000000,0> translate<18.131319,0.000000,32.181800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<18.131319,0.000000,32.181800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<18.741437,0.000000,32.181800>}
box{<0,0,-0.050800><0.610119,0.036000,0.050800> rotate<0,0.000000,0> translate<18.131319,0.000000,32.181800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<18.131319,0.000000,32.639391>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<18.436378,0.000000,32.639391>}
box{<0,0,-0.050800><0.305059,0.036000,0.050800> rotate<0,0.000000,0> translate<18.131319,0.000000,32.639391> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.066838,0.000000,33.096981>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.066838,0.000000,32.181800>}
box{<0,0,-0.050800><0.915181,0.036000,0.050800> rotate<0,-90.000000,0> translate<19.066838,0.000000,32.181800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.066838,0.000000,32.181800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.524428,0.000000,32.181800>}
box{<0,0,-0.050800><0.457591,0.036000,0.050800> rotate<0,0.000000,0> translate<19.066838,0.000000,32.181800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.524428,0.000000,32.181800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.676956,0.000000,32.334328>}
box{<0,0,-0.050800><0.215707,0.036000,0.050800> rotate<0,-44.997030,0> translate<19.524428,0.000000,32.181800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.676956,0.000000,32.334328>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.676956,0.000000,32.944450>}
box{<0,0,-0.050800><0.610122,0.036000,0.050800> rotate<0,90.000000,0> translate<19.676956,0.000000,32.944450> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.676956,0.000000,32.944450>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.524428,0.000000,33.096981>}
box{<0,0,-0.050800><0.215710,0.036000,0.050800> rotate<0,44.997617,0> translate<19.524428,0.000000,33.096981> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.524428,0.000000,33.096981>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.066838,0.000000,33.096981>}
box{<0,0,-0.050800><0.457591,0.036000,0.050800> rotate<0,0.000000,0> translate<19.066838,0.000000,33.096981> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.002356,0.000000,32.791919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.307416,0.000000,33.096981>}
box{<0,0,-0.050800><0.431421,0.036000,0.050800> rotate<0,-44.997324,0> translate<20.002356,0.000000,32.791919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.307416,0.000000,33.096981>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.307416,0.000000,32.181800>}
box{<0,0,-0.050800><0.915181,0.036000,0.050800> rotate<0,-90.000000,0> translate<20.307416,0.000000,32.181800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.002356,0.000000,32.181800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.612475,0.000000,32.181800>}
box{<0,0,-0.050800><0.610119,0.036000,0.050800> rotate<0,0.000000,0> translate<20.002356,0.000000,32.181800> }
//LED2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<6.654800,0.000000,18.034000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<6.654800,0.000000,20.574000>}
box{<0,0,-0.127000><2.540000,0.036000,0.127000> rotate<0,90.000000,0> translate<6.654800,0.000000,20.574000> }
object{ARC(1.524000,0.152400,140.196236,179.999846,0.036000) translate<5.080000,0.000000,19.303997>}
object{ARC(1.524000,0.152400,179.997604,221.630812,0.036000) translate<5.080000,0.000000,19.303937>}
object{ARC(1.524000,0.152400,0.000537,40.601702,0.036000) translate<5.080000,0.000000,19.303984>}
object{ARC(1.524000,0.152400,320.196236,359.999846,0.036000) translate<5.080000,0.000000,19.304003>}
object{ARC(1.524000,0.152400,35.537354,89.998691,0.036000) translate<5.079966,0.000000,19.304000>}
object{ARC(1.524000,0.152400,90.000000,143.130102,0.036000) translate<5.080000,0.000000,19.304000>}
object{ARC(1.524000,0.152400,270.000307,322.127183,0.036000) translate<5.079991,0.000000,19.304000>}
object{ARC(1.524000,0.152400,217.872817,269.999693,0.036000) translate<5.080009,0.000000,19.304000>}
object{ARC(0.635000,0.152400,90.000000,180.000000,0.036000) translate<5.080000,0.000000,19.304000>}
object{ARC(1.016000,0.152400,90.000000,180.000000,0.036000) translate<5.080000,0.000000,19.304000>}
object{ARC(0.635000,0.152400,270.000000,360.000000,0.036000) translate<5.080000,0.000000,19.304000>}
object{ARC(1.016000,0.152400,270.000000,360.000000,0.036000) translate<5.080000,0.000000,19.304000>}
object{ARC(2.032000,0.254000,39.807234,90.000342,0.036000) translate<5.080013,0.000000,19.304000>}
object{ARC(2.032000,0.254000,90.001692,151.928641,0.036000) translate<5.080059,0.000000,19.304000>}
object{ARC(2.032000,0.254000,269.998944,319.761966,0.036000) translate<5.080038,0.000000,19.304000>}
object{ARC(2.032000,0.254000,209.746365,270.001580,0.036000) translate<5.079944,0.000000,19.304000>}
object{ARC(2.032000,0.254000,151.698217,179.999918,0.036000) translate<5.080000,0.000000,19.303997>}
object{ARC(2.032000,0.254000,179.997652,211.605872,0.036000) translate<5.080000,0.000000,19.303916>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.035800,0.000000,20.142981>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.035800,0.000000,19.227800>}
box{<0,0,-0.050800><0.915181,0.036000,0.050800> rotate<0,-90.000000,0> translate<7.035800,0.000000,19.227800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.035800,0.000000,19.227800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.645919,0.000000,19.227800>}
box{<0,0,-0.050800><0.610119,0.036000,0.050800> rotate<0,0.000000,0> translate<7.035800,0.000000,19.227800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.581437,0.000000,20.142981>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.971319,0.000000,20.142981>}
box{<0,0,-0.050800><0.610119,0.036000,0.050800> rotate<0,0.000000,0> translate<7.971319,0.000000,20.142981> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.971319,0.000000,20.142981>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.971319,0.000000,19.227800>}
box{<0,0,-0.050800><0.915181,0.036000,0.050800> rotate<0,-90.000000,0> translate<7.971319,0.000000,19.227800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.971319,0.000000,19.227800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.581437,0.000000,19.227800>}
box{<0,0,-0.050800><0.610119,0.036000,0.050800> rotate<0,0.000000,0> translate<7.971319,0.000000,19.227800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.971319,0.000000,19.685391>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.276378,0.000000,19.685391>}
box{<0,0,-0.050800><0.305059,0.036000,0.050800> rotate<0,0.000000,0> translate<7.971319,0.000000,19.685391> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.906837,0.000000,20.142981>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.906837,0.000000,19.227800>}
box{<0,0,-0.050800><0.915181,0.036000,0.050800> rotate<0,-90.000000,0> translate<8.906837,0.000000,19.227800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.906837,0.000000,19.227800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.364428,0.000000,19.227800>}
box{<0,0,-0.050800><0.457591,0.036000,0.050800> rotate<0,0.000000,0> translate<8.906837,0.000000,19.227800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.364428,0.000000,19.227800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.516956,0.000000,19.380328>}
box{<0,0,-0.050800><0.215707,0.036000,0.050800> rotate<0,-44.997030,0> translate<9.364428,0.000000,19.227800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.516956,0.000000,19.380328>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.516956,0.000000,19.990450>}
box{<0,0,-0.050800><0.610122,0.036000,0.050800> rotate<0,90.000000,0> translate<9.516956,0.000000,19.990450> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.516956,0.000000,19.990450>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.364428,0.000000,20.142981>}
box{<0,0,-0.050800><0.215710,0.036000,0.050800> rotate<0,44.997617,0> translate<9.364428,0.000000,20.142981> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.364428,0.000000,20.142981>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.906837,0.000000,20.142981>}
box{<0,0,-0.050800><0.457591,0.036000,0.050800> rotate<0,0.000000,0> translate<8.906837,0.000000,20.142981> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.452475,0.000000,19.227800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.842356,0.000000,19.227800>}
box{<0,0,-0.050800><0.610119,0.036000,0.050800> rotate<0,0.000000,0> translate<9.842356,0.000000,19.227800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.842356,0.000000,19.227800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.452475,0.000000,19.837919>}
box{<0,0,-0.050800><0.862838,0.036000,0.050800> rotate<0,-44.997030,0> translate<9.842356,0.000000,19.227800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.452475,0.000000,19.837919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.452475,0.000000,19.990450>}
box{<0,0,-0.050800><0.152531,0.036000,0.050800> rotate<0,90.000000,0> translate<10.452475,0.000000,19.990450> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.452475,0.000000,19.990450>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.299947,0.000000,20.142981>}
box{<0,0,-0.050800><0.215710,0.036000,0.050800> rotate<0,44.997617,0> translate<10.299947,0.000000,20.142981> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.299947,0.000000,20.142981>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.994884,0.000000,20.142981>}
box{<0,0,-0.050800><0.305063,0.036000,0.050800> rotate<0,0.000000,0> translate<9.994884,0.000000,20.142981> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.994884,0.000000,20.142981>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.842356,0.000000,19.990450>}
box{<0,0,-0.050800><0.215710,0.036000,0.050800> rotate<0,-44.997617,0> translate<9.842356,0.000000,19.990450> }
//LED3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<23.571200,0.000000,19.812000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<23.571200,0.000000,17.272000>}
box{<0,0,-0.127000><2.540000,0.036000,0.127000> rotate<0,-90.000000,0> translate<23.571200,0.000000,17.272000> }
object{ARC(1.524000,0.152400,320.196236,359.999846,0.036000) translate<25.146000,0.000000,18.542003>}
object{ARC(1.524000,0.152400,359.997604,401.630812,0.036000) translate<25.146000,0.000000,18.542063>}
object{ARC(1.524000,0.152400,180.000537,220.601702,0.036000) translate<25.146000,0.000000,18.542016>}
object{ARC(1.524000,0.152400,140.196236,179.999846,0.036000) translate<25.146000,0.000000,18.541997>}
object{ARC(1.524000,0.152400,215.537354,269.998691,0.036000) translate<25.146034,0.000000,18.542000>}
object{ARC(1.524000,0.152400,270.000000,323.130102,0.036000) translate<25.146000,0.000000,18.542000>}
object{ARC(1.524000,0.152400,90.000307,142.127183,0.036000) translate<25.146009,0.000000,18.542000>}
object{ARC(1.524000,0.152400,37.872817,89.999693,0.036000) translate<25.145991,0.000000,18.542000>}
object{ARC(0.635000,0.152400,270.000000,360.000000,0.036000) translate<25.146000,0.000000,18.542000>}
object{ARC(1.016000,0.152400,270.000000,360.000000,0.036000) translate<25.146000,0.000000,18.542000>}
object{ARC(0.635000,0.152400,90.000000,180.000000,0.036000) translate<25.146000,0.000000,18.542000>}
object{ARC(1.016000,0.152400,90.000000,180.000000,0.036000) translate<25.146000,0.000000,18.542000>}
object{ARC(2.032000,0.254000,219.807234,270.000342,0.036000) translate<25.145988,0.000000,18.542000>}
object{ARC(2.032000,0.254000,270.001692,331.928641,0.036000) translate<25.145941,0.000000,18.542000>}
object{ARC(2.032000,0.254000,89.998944,139.761966,0.036000) translate<25.145962,0.000000,18.542000>}
object{ARC(2.032000,0.254000,29.746365,90.001580,0.036000) translate<25.146056,0.000000,18.542000>}
object{ARC(2.032000,0.254000,331.698217,359.999918,0.036000) translate<25.146000,0.000000,18.542003>}
object{ARC(2.032000,0.254000,359.997652,391.605872,0.036000) translate<25.146000,0.000000,18.542084>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.295722,0.000000,18.872981>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.295722,0.000000,17.957800>}
box{<0,0,-0.050800><0.915181,0.036000,0.050800> rotate<0,-90.000000,0> translate<19.295722,0.000000,17.957800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.295722,0.000000,17.957800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.905841,0.000000,17.957800>}
box{<0,0,-0.050800><0.610119,0.036000,0.050800> rotate<0,0.000000,0> translate<19.295722,0.000000,17.957800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.841359,0.000000,18.872981>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.231241,0.000000,18.872981>}
box{<0,0,-0.050800><0.610119,0.036000,0.050800> rotate<0,0.000000,0> translate<20.231241,0.000000,18.872981> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.231241,0.000000,18.872981>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.231241,0.000000,17.957800>}
box{<0,0,-0.050800><0.915181,0.036000,0.050800> rotate<0,-90.000000,0> translate<20.231241,0.000000,17.957800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.231241,0.000000,17.957800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.841359,0.000000,17.957800>}
box{<0,0,-0.050800><0.610119,0.036000,0.050800> rotate<0,0.000000,0> translate<20.231241,0.000000,17.957800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.231241,0.000000,18.415391>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.536300,0.000000,18.415391>}
box{<0,0,-0.050800><0.305059,0.036000,0.050800> rotate<0,0.000000,0> translate<20.231241,0.000000,18.415391> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<21.166759,0.000000,18.872981>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<21.166759,0.000000,17.957800>}
box{<0,0,-0.050800><0.915181,0.036000,0.050800> rotate<0,-90.000000,0> translate<21.166759,0.000000,17.957800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<21.166759,0.000000,17.957800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<21.624350,0.000000,17.957800>}
box{<0,0,-0.050800><0.457591,0.036000,0.050800> rotate<0,0.000000,0> translate<21.166759,0.000000,17.957800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<21.624350,0.000000,17.957800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<21.776878,0.000000,18.110328>}
box{<0,0,-0.050800><0.215707,0.036000,0.050800> rotate<0,-44.997030,0> translate<21.624350,0.000000,17.957800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<21.776878,0.000000,18.110328>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<21.776878,0.000000,18.720450>}
box{<0,0,-0.050800><0.610122,0.036000,0.050800> rotate<0,90.000000,0> translate<21.776878,0.000000,18.720450> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<21.776878,0.000000,18.720450>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<21.624350,0.000000,18.872981>}
box{<0,0,-0.050800><0.215710,0.036000,0.050800> rotate<0,44.997617,0> translate<21.624350,0.000000,18.872981> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<21.624350,0.000000,18.872981>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<21.166759,0.000000,18.872981>}
box{<0,0,-0.050800><0.457591,0.036000,0.050800> rotate<0,0.000000,0> translate<21.166759,0.000000,18.872981> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.102278,0.000000,18.720450>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.254806,0.000000,18.872981>}
box{<0,0,-0.050800><0.215710,0.036000,0.050800> rotate<0,-44.997617,0> translate<22.102278,0.000000,18.720450> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.254806,0.000000,18.872981>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.559869,0.000000,18.872981>}
box{<0,0,-0.050800><0.305062,0.036000,0.050800> rotate<0,0.000000,0> translate<22.254806,0.000000,18.872981> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.559869,0.000000,18.872981>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.712397,0.000000,18.720450>}
box{<0,0,-0.050800><0.215710,0.036000,0.050800> rotate<0,44.997617,0> translate<22.559869,0.000000,18.872981> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.712397,0.000000,18.720450>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.712397,0.000000,18.567919>}
box{<0,0,-0.050800><0.152531,0.036000,0.050800> rotate<0,-90.000000,0> translate<22.712397,0.000000,18.567919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.712397,0.000000,18.567919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.559869,0.000000,18.415391>}
box{<0,0,-0.050800><0.215707,0.036000,0.050800> rotate<0,-44.997030,0> translate<22.559869,0.000000,18.415391> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.559869,0.000000,18.415391>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.407338,0.000000,18.415391>}
box{<0,0,-0.050800><0.152531,0.036000,0.050800> rotate<0,0.000000,0> translate<22.407338,0.000000,18.415391> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.559869,0.000000,18.415391>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.712397,0.000000,18.262859>}
box{<0,0,-0.050800><0.215710,0.036000,0.050800> rotate<0,44.997617,0> translate<22.559869,0.000000,18.415391> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.712397,0.000000,18.262859>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.712397,0.000000,18.110328>}
box{<0,0,-0.050800><0.152531,0.036000,0.050800> rotate<0,-90.000000,0> translate<22.712397,0.000000,18.110328> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.712397,0.000000,18.110328>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.559869,0.000000,17.957800>}
box{<0,0,-0.050800><0.215707,0.036000,0.050800> rotate<0,-44.997030,0> translate<22.559869,0.000000,17.957800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.559869,0.000000,17.957800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.254806,0.000000,17.957800>}
box{<0,0,-0.050800><0.305062,0.036000,0.050800> rotate<0,0.000000,0> translate<22.254806,0.000000,17.957800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.254806,0.000000,17.957800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.102278,0.000000,18.110328>}
box{<0,0,-0.050800><0.215707,0.036000,0.050800> rotate<0,44.997030,0> translate<22.102278,0.000000,18.110328> }
//LED4 silk screen
object{ARC(0.324900,0.203200,359.982365,450.017635,0.036000) translate<13.336100,0.000000,28.068100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<13.661000,0.000000,28.068000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.311000,0.000000,28.068000>}
box{<0,0,-0.101600><2.650000,0.036000,0.101600> rotate<0,0.000000,0> translate<13.661000,0.000000,28.068000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.636000,0.000000,28.393000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.636000,0.000000,31.043000>}
box{<0,0,-0.101600><2.650000,0.036000,0.101600> rotate<0,90.000000,0> translate<16.636000,0.000000,31.043000> }
object{ARC(0.324900,0.203200,179.982365,270.017635,0.036000) translate<16.635900,0.000000,31.367900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.311000,0.000000,31.368000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<13.661000,0.000000,31.368000>}
box{<0,0,-0.101600><2.650000,0.036000,0.101600> rotate<0,0.000000,0> translate<13.661000,0.000000,31.368000> }
object{ARC(0.324900,0.203200,269.982365,360.017635,0.036000) translate<13.336100,0.000000,31.367900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<13.336000,0.000000,31.043000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<13.336000,0.000000,28.393000>}
box{<0,0,-0.101600><2.650000,0.036000,0.101600> rotate<0,-90.000000,0> translate<13.336000,0.000000,28.393000> }
object{ARC(0.324900,0.203200,89.982365,180.017635,0.036000) translate<16.635900,0.000000,28.068100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.236000,0.000000,28.843000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.861000,0.000000,28.468000>}
box{<0,0,-0.101600><0.530330,0.036000,0.101600> rotate<0,-44.997030,0> translate<15.861000,0.000000,28.468000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.861000,0.000000,30.968000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.236000,0.000000,30.593000>}
box{<0,0,-0.101600><0.530330,0.036000,0.101600> rotate<0,44.997030,0> translate<15.861000,0.000000,30.968000> }
object{ARC(1.165000,0.203200,243.215005,296.784995,0.036000) translate<14.986000,0.000000,29.683000>}
object{ARC(1.165000,0.203200,63.215005,116.784995,0.036000) translate<14.986000,0.000000,29.753000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.511000,0.000000,28.068000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.461000,0.000000,28.068000>}
box{<0,0,-0.101600><1.050000,0.036000,0.101600> rotate<0,0.000000,0> translate<14.461000,0.000000,28.068000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.461000,0.000000,31.368000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.511000,0.000000,31.368000>}
box{<0,0,-0.101600><1.050000,0.036000,0.101600> rotate<0,0.000000,0> translate<14.461000,0.000000,31.368000> }
difference{
cylinder{<14.986000,0,29.718000><14.986000,0.036000,29.718000>1.301600 translate<0,0.000000,0>}
cylinder{<14.986000,-0.1,29.718000><14.986000,0.135000,29.718000>1.098400 translate<0,0.000000,0>}}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.183100,0.000000,30.188703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.183100,0.000000,29.248100>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,-90.000000,0> translate<17.183100,0.000000,29.248100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.183100,0.000000,29.248100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.810169,0.000000,29.248100>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,0.000000,0> translate<17.183100,0.000000,29.248100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.745688,0.000000,30.188703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.118619,0.000000,30.188703>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,0.000000,0> translate<18.118619,0.000000,30.188703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.118619,0.000000,30.188703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.118619,0.000000,29.248100>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,-90.000000,0> translate<18.118619,0.000000,29.248100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.118619,0.000000,29.248100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.745688,0.000000,29.248100>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,0.000000,0> translate<18.118619,0.000000,29.248100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.118619,0.000000,29.718400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.432153,0.000000,29.718400>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<18.118619,0.000000,29.718400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.054137,0.000000,30.188703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.054137,0.000000,29.248100>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,-90.000000,0> translate<19.054137,0.000000,29.248100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.054137,0.000000,29.248100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.524438,0.000000,29.248100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<19.054137,0.000000,29.248100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.524438,0.000000,29.248100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.681206,0.000000,29.404866>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.996459,0> translate<19.524438,0.000000,29.248100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.681206,0.000000,29.404866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.681206,0.000000,30.031934>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,90.000000,0> translate<19.681206,0.000000,30.031934> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.681206,0.000000,30.031934>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.524438,0.000000,30.188703>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,44.997030,0> translate<19.524438,0.000000,30.188703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.524438,0.000000,30.188703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.054137,0.000000,30.188703>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<19.054137,0.000000,30.188703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.459956,0.000000,29.248100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.459956,0.000000,30.188703>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,90.000000,0> translate<20.459956,0.000000,30.188703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.459956,0.000000,30.188703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.989656,0.000000,29.718400>}
box{<0,0,-0.038100><0.665107,0.036000,0.038100> rotate<0,-44.997221,0> translate<19.989656,0.000000,29.718400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.989656,0.000000,29.718400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.616725,0.000000,29.718400>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,0.000000,0> translate<19.989656,0.000000,29.718400> }
//LED5 silk screen
object{ARC(0.324900,0.203200,359.982365,450.017635,0.036000) translate<3.430100,0.000000,14.606100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.755000,0.000000,14.606000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<6.405000,0.000000,14.606000>}
box{<0,0,-0.101600><2.650000,0.036000,0.101600> rotate<0,0.000000,0> translate<3.755000,0.000000,14.606000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<6.730000,0.000000,14.931000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<6.730000,0.000000,17.581000>}
box{<0,0,-0.101600><2.650000,0.036000,0.101600> rotate<0,90.000000,0> translate<6.730000,0.000000,17.581000> }
object{ARC(0.324900,0.203200,179.982365,270.017635,0.036000) translate<6.729900,0.000000,17.905900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<6.405000,0.000000,17.906000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.755000,0.000000,17.906000>}
box{<0,0,-0.101600><2.650000,0.036000,0.101600> rotate<0,0.000000,0> translate<3.755000,0.000000,17.906000> }
object{ARC(0.324900,0.203200,269.982365,360.017635,0.036000) translate<3.430100,0.000000,17.905900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.430000,0.000000,17.581000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.430000,0.000000,14.931000>}
box{<0,0,-0.101600><2.650000,0.036000,0.101600> rotate<0,-90.000000,0> translate<3.430000,0.000000,14.931000> }
object{ARC(0.324900,0.203200,89.982365,180.017635,0.036000) translate<6.729900,0.000000,14.606100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<6.330000,0.000000,15.381000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.955000,0.000000,15.006000>}
box{<0,0,-0.101600><0.530330,0.036000,0.101600> rotate<0,-44.997030,0> translate<5.955000,0.000000,15.006000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.955000,0.000000,17.506000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<6.330000,0.000000,17.131000>}
box{<0,0,-0.101600><0.530330,0.036000,0.101600> rotate<0,44.997030,0> translate<5.955000,0.000000,17.506000> }
object{ARC(1.165000,0.203200,243.215005,296.784995,0.036000) translate<5.080000,0.000000,16.221000>}
object{ARC(1.165000,0.203200,63.215005,116.784995,0.036000) translate<5.080000,0.000000,16.291000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.605000,0.000000,14.606000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.555000,0.000000,14.606000>}
box{<0,0,-0.101600><1.050000,0.036000,0.101600> rotate<0,0.000000,0> translate<4.555000,0.000000,14.606000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.555000,0.000000,17.906000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.605000,0.000000,17.906000>}
box{<0,0,-0.101600><1.050000,0.036000,0.101600> rotate<0,0.000000,0> translate<4.555000,0.000000,17.906000> }
difference{
cylinder{<5.080000,0,16.256000><5.080000,0.036000,16.256000>1.301600 translate<0,0.000000,0>}
cylinder{<5.080000,-0.1,16.256000><5.080000,0.135000,16.256000>1.098400 translate<0,0.000000,0>}}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.023100,0.000000,16.472703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.023100,0.000000,15.532100>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,-90.000000,0> translate<7.023100,0.000000,15.532100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.023100,0.000000,15.532100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.650169,0.000000,15.532100>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,0.000000,0> translate<7.023100,0.000000,15.532100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.585688,0.000000,16.472703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.958619,0.000000,16.472703>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,0.000000,0> translate<7.958619,0.000000,16.472703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.958619,0.000000,16.472703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.958619,0.000000,15.532100>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,-90.000000,0> translate<7.958619,0.000000,15.532100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.958619,0.000000,15.532100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.585688,0.000000,15.532100>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,0.000000,0> translate<7.958619,0.000000,15.532100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.958619,0.000000,16.002400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.272153,0.000000,16.002400>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<7.958619,0.000000,16.002400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.894138,0.000000,16.472703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.894138,0.000000,15.532100>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,-90.000000,0> translate<8.894138,0.000000,15.532100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.894138,0.000000,15.532100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.364438,0.000000,15.532100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<8.894138,0.000000,15.532100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.364438,0.000000,15.532100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.521206,0.000000,15.688866>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.996459,0> translate<9.364438,0.000000,15.532100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.521206,0.000000,15.688866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.521206,0.000000,16.315934>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,90.000000,0> translate<9.521206,0.000000,16.315934> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.521206,0.000000,16.315934>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.364438,0.000000,16.472703>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,44.997030,0> translate<9.364438,0.000000,16.472703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.364438,0.000000,16.472703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.894138,0.000000,16.472703>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<8.894138,0.000000,16.472703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.456725,0.000000,16.472703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.829656,0.000000,16.472703>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,0.000000,0> translate<9.829656,0.000000,16.472703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.829656,0.000000,16.472703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.829656,0.000000,16.002400>}
box{<0,0,-0.038100><0.470303,0.036000,0.038100> rotate<0,-90.000000,0> translate<9.829656,0.000000,16.002400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.829656,0.000000,16.002400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.143191,0.000000,16.159169>}
box{<0,0,-0.038100><0.350543,0.036000,0.038100> rotate<0,-26.563526,0> translate<9.829656,0.000000,16.002400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.143191,0.000000,16.159169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.299956,0.000000,16.159169>}
box{<0,0,-0.038100><0.156766,0.036000,0.038100> rotate<0,0.000000,0> translate<10.143191,0.000000,16.159169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.299956,0.000000,16.159169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.456725,0.000000,16.002400>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,44.997030,0> translate<10.299956,0.000000,16.159169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.456725,0.000000,16.002400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.456725,0.000000,15.688866>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,-90.000000,0> translate<10.456725,0.000000,15.688866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.456725,0.000000,15.688866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.299956,0.000000,15.532100>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.996459,0> translate<10.299956,0.000000,15.532100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.299956,0.000000,15.532100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.986422,0.000000,15.532100>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<9.986422,0.000000,15.532100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.986422,0.000000,15.532100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.829656,0.000000,15.688866>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,44.997030,0> translate<9.829656,0.000000,15.688866> }
//LED6 silk screen
object{ARC(0.324900,0.203200,179.982365,270.017635,0.036000) translate<26.795900,0.000000,16.889900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<26.471000,0.000000,16.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<23.821000,0.000000,16.890000>}
box{<0,0,-0.101600><2.650000,0.036000,0.101600> rotate<0,0.000000,0> translate<23.821000,0.000000,16.890000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<23.496000,0.000000,16.565000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<23.496000,0.000000,13.915000>}
box{<0,0,-0.101600><2.650000,0.036000,0.101600> rotate<0,-90.000000,0> translate<23.496000,0.000000,13.915000> }
object{ARC(0.324900,0.203200,359.982365,450.017635,0.036000) translate<23.496100,0.000000,13.590100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<23.821000,0.000000,13.590000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<26.471000,0.000000,13.590000>}
box{<0,0,-0.101600><2.650000,0.036000,0.101600> rotate<0,0.000000,0> translate<23.821000,0.000000,13.590000> }
object{ARC(0.324900,0.203200,89.982365,180.017635,0.036000) translate<26.795900,0.000000,13.590100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<26.796000,0.000000,13.915000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<26.796000,0.000000,16.565000>}
box{<0,0,-0.101600><2.650000,0.036000,0.101600> rotate<0,90.000000,0> translate<26.796000,0.000000,16.565000> }
object{ARC(0.324900,0.203200,269.982365,360.017635,0.036000) translate<23.496100,0.000000,16.889900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<23.896000,0.000000,16.115000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.271000,0.000000,16.490000>}
box{<0,0,-0.101600><0.530330,0.036000,0.101600> rotate<0,-44.997030,0> translate<23.896000,0.000000,16.115000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.271000,0.000000,13.990000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<23.896000,0.000000,14.365000>}
box{<0,0,-0.101600><0.530330,0.036000,0.101600> rotate<0,44.997030,0> translate<23.896000,0.000000,14.365000> }
object{ARC(1.165000,0.203200,63.215005,116.784995,0.036000) translate<25.146000,0.000000,15.275000>}
object{ARC(1.165000,0.203200,243.215005,296.784995,0.036000) translate<25.146000,0.000000,15.205000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.621000,0.000000,16.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<25.671000,0.000000,16.890000>}
box{<0,0,-0.101600><1.050000,0.036000,0.101600> rotate<0,0.000000,0> translate<24.621000,0.000000,16.890000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<25.671000,0.000000,13.590000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.621000,0.000000,13.590000>}
box{<0,0,-0.101600><1.050000,0.036000,0.101600> rotate<0,0.000000,0> translate<24.621000,0.000000,13.590000> }
difference{
cylinder{<25.146000,0,15.240000><25.146000,0.036000,15.240000>1.301600 translate<0,0.000000,0>}
cylinder{<25.146000,-0.1,15.240000><25.146000,0.135000,15.240000>1.098400 translate<0,0.000000,0>}}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.283022,0.000000,16.472703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.283022,0.000000,15.532100>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,-90.000000,0> translate<19.283022,0.000000,15.532100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.283022,0.000000,15.532100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.910091,0.000000,15.532100>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,0.000000,0> translate<19.283022,0.000000,15.532100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.845609,0.000000,16.472703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.218541,0.000000,16.472703>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,0.000000,0> translate<20.218541,0.000000,16.472703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.218541,0.000000,16.472703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.218541,0.000000,15.532100>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,-90.000000,0> translate<20.218541,0.000000,15.532100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.218541,0.000000,15.532100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.845609,0.000000,15.532100>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,0.000000,0> translate<20.218541,0.000000,15.532100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.218541,0.000000,16.002400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.532075,0.000000,16.002400>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<20.218541,0.000000,16.002400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.154059,0.000000,16.472703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.154059,0.000000,15.532100>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,-90.000000,0> translate<21.154059,0.000000,15.532100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.154059,0.000000,15.532100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.624359,0.000000,15.532100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<21.154059,0.000000,15.532100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.624359,0.000000,15.532100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.781128,0.000000,15.688866>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.996459,0> translate<21.624359,0.000000,15.532100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.781128,0.000000,15.688866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.781128,0.000000,16.315934>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,90.000000,0> translate<21.781128,0.000000,16.315934> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.781128,0.000000,16.315934>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.624359,0.000000,16.472703>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,44.997030,0> translate<21.624359,0.000000,16.472703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.624359,0.000000,16.472703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.154059,0.000000,16.472703>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<21.154059,0.000000,16.472703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.716647,0.000000,16.472703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.403113,0.000000,16.315934>}
box{<0,0,-0.038100><0.350543,0.036000,0.038100> rotate<0,-26.563526,0> translate<22.403113,0.000000,16.315934> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.403113,0.000000,16.315934>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.089578,0.000000,16.002400>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,-44.997030,0> translate<22.089578,0.000000,16.002400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.089578,0.000000,16.002400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.089578,0.000000,15.688866>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,-90.000000,0> translate<22.089578,0.000000,15.688866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.089578,0.000000,15.688866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.246344,0.000000,15.532100>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,44.997030,0> translate<22.089578,0.000000,15.688866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.246344,0.000000,15.532100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.559878,0.000000,15.532100>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<22.246344,0.000000,15.532100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.559878,0.000000,15.532100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.716647,0.000000,15.688866>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.996459,0> translate<22.559878,0.000000,15.532100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.716647,0.000000,15.688866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.716647,0.000000,15.845634>}
box{<0,0,-0.038100><0.156769,0.036000,0.038100> rotate<0,90.000000,0> translate<22.716647,0.000000,15.845634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.716647,0.000000,15.845634>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.559878,0.000000,16.002400>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.996459,0> translate<22.559878,0.000000,16.002400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.559878,0.000000,16.002400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.089578,0.000000,16.002400>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<22.089578,0.000000,16.002400> }
//R1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.191000,0.000000,28.397200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.191000,0.000000,26.974800>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,-90.000000,0> translate<4.191000,0.000000,26.974800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.461000,0.000000,28.397200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.461000,0.000000,26.974800>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,-90.000000,0> translate<5.461000,0.000000,26.974800> }
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-90.000000,0> translate<4.826000,0.000000,26.822400>}
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-90.000000,0> translate<4.826000,0.000000,28.549600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.295900,0.000000,30.010100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.355297,0.000000,30.010100>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,0.000000,0> translate<4.355297,0.000000,30.010100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.355297,0.000000,30.010100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.355297,0.000000,30.480400>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,90.000000,0> translate<4.355297,0.000000,30.480400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.355297,0.000000,30.480400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.512066,0.000000,30.637169>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,-44.997030,0> translate<4.355297,0.000000,30.480400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.512066,0.000000,30.637169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.825600,0.000000,30.637169>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<4.512066,0.000000,30.637169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.825600,0.000000,30.637169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.982366,0.000000,30.480400>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.997601,0> translate<4.825600,0.000000,30.637169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.982366,0.000000,30.480400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.982366,0.000000,30.010100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<4.982366,0.000000,30.010100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.982366,0.000000,30.323634>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.295900,0.000000,30.637169>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,-44.997030,0> translate<4.982366,0.000000,30.323634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.668831,0.000000,30.945619>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.355297,0.000000,31.259153>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,44.997030,0> translate<4.355297,0.000000,31.259153> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.355297,0.000000,31.259153>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.295900,0.000000,31.259153>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,0.000000,0> translate<4.355297,0.000000,31.259153> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.295900,0.000000,30.945619>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.295900,0.000000,31.572688>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,90.000000,0> translate<5.295900,0.000000,31.572688> }
//R2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.065000,0.000000,26.974800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.065000,0.000000,28.397200>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,90.000000,0> translate<12.065000,0.000000,28.397200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.795000,0.000000,26.974800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.795000,0.000000,28.397200>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,90.000000,0> translate<10.795000,0.000000,28.397200> }
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-270.000000,0> translate<11.430000,0.000000,28.549600>}
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-270.000000,0> translate<11.430000,0.000000,26.822400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.899900,0.000000,30.010100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.959297,0.000000,30.010100>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,0.000000,0> translate<10.959297,0.000000,30.010100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.959297,0.000000,30.010100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.959297,0.000000,30.480400>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,90.000000,0> translate<10.959297,0.000000,30.480400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.959297,0.000000,30.480400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.116066,0.000000,30.637169>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,-44.997030,0> translate<10.959297,0.000000,30.480400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.116066,0.000000,30.637169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.429600,0.000000,30.637169>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<11.116066,0.000000,30.637169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.429600,0.000000,30.637169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.586366,0.000000,30.480400>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.997601,0> translate<11.429600,0.000000,30.637169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.586366,0.000000,30.480400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.586366,0.000000,30.010100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<11.586366,0.000000,30.010100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.586366,0.000000,30.323634>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.899900,0.000000,30.637169>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,-44.997030,0> translate<11.586366,0.000000,30.323634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.899900,0.000000,31.572688>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.899900,0.000000,30.945619>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,-90.000000,0> translate<11.899900,0.000000,30.945619> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.899900,0.000000,30.945619>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.272831,0.000000,31.572688>}
box{<0,0,-0.038100><0.886809,0.036000,0.038100> rotate<0,44.997030,0> translate<11.272831,0.000000,31.572688> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.272831,0.000000,31.572688>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.116066,0.000000,31.572688>}
box{<0,0,-0.038100><0.156766,0.036000,0.038100> rotate<0,0.000000,0> translate<11.116066,0.000000,31.572688> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.116066,0.000000,31.572688>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.959297,0.000000,31.415919>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,-44.997030,0> translate<10.959297,0.000000,31.415919> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.959297,0.000000,31.415919>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.959297,0.000000,31.102384>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,-90.000000,0> translate<10.959297,0.000000,31.102384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.959297,0.000000,31.102384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.116066,0.000000,30.945619>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.996459,0> translate<10.959297,0.000000,31.102384> }
//R3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.763000,0.000000,26.974800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.763000,0.000000,28.397200>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,90.000000,0> translate<8.763000,0.000000,28.397200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.493000,0.000000,26.974800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.493000,0.000000,28.397200>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,90.000000,0> translate<7.493000,0.000000,28.397200> }
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-270.000000,0> translate<8.128000,0.000000,28.549600>}
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-270.000000,0> translate<8.128000,0.000000,26.822400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.597900,0.000000,30.010100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.657297,0.000000,30.010100>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,0.000000,0> translate<7.657297,0.000000,30.010100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.657297,0.000000,30.010100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.657297,0.000000,30.480400>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,90.000000,0> translate<7.657297,0.000000,30.480400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.657297,0.000000,30.480400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.814066,0.000000,30.637169>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,-44.997030,0> translate<7.657297,0.000000,30.480400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.814066,0.000000,30.637169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.127600,0.000000,30.637169>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<7.814066,0.000000,30.637169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.127600,0.000000,30.637169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.284366,0.000000,30.480400>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.997601,0> translate<8.127600,0.000000,30.637169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.284366,0.000000,30.480400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.284366,0.000000,30.010100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<8.284366,0.000000,30.010100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.284366,0.000000,30.323634>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.597900,0.000000,30.637169>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,-44.997030,0> translate<8.284366,0.000000,30.323634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.814066,0.000000,30.945619>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.657297,0.000000,31.102384>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.996459,0> translate<7.657297,0.000000,31.102384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.657297,0.000000,31.102384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.657297,0.000000,31.415919>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,90.000000,0> translate<7.657297,0.000000,31.415919> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.657297,0.000000,31.415919>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.814066,0.000000,31.572688>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,-44.997030,0> translate<7.657297,0.000000,31.415919> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.814066,0.000000,31.572688>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.970831,0.000000,31.572688>}
box{<0,0,-0.038100><0.156766,0.036000,0.038100> rotate<0,0.000000,0> translate<7.814066,0.000000,31.572688> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.970831,0.000000,31.572688>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.127600,0.000000,31.415919>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,44.997030,0> translate<7.970831,0.000000,31.572688> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.127600,0.000000,31.415919>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.127600,0.000000,31.259153>}
box{<0,0,-0.038100><0.156766,0.036000,0.038100> rotate<0,-90.000000,0> translate<8.127600,0.000000,31.259153> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.127600,0.000000,31.415919>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.284366,0.000000,31.572688>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.997601,0> translate<8.127600,0.000000,31.415919> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.284366,0.000000,31.572688>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.441134,0.000000,31.572688>}
box{<0,0,-0.038100><0.156769,0.036000,0.038100> rotate<0,0.000000,0> translate<8.284366,0.000000,31.572688> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.441134,0.000000,31.572688>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.597900,0.000000,31.415919>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.997601,0> translate<8.441134,0.000000,31.572688> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.597900,0.000000,31.415919>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.597900,0.000000,31.102384>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,-90.000000,0> translate<8.597900,0.000000,31.102384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.597900,0.000000,31.102384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.441134,0.000000,30.945619>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,-44.997030,0> translate<8.441134,0.000000,30.945619> }

texture{col_slk}
}
#end
translate<mac_x_ver,mac_y_ver,mac_z_ver>
rotate<mac_x_rot,mac_y_rot,mac_z_rot>
}//End union
#end

#if(use_file_as_inc=off)
object{  TCS32X0(-14.821000,0,-18.664000,pcb_rotate_x,pcb_rotate_y,pcb_rotate_z)
#if(pcb_upsidedown=on)
rotate pcb_rotdir*180
#end
}
#end


//Parts not found in 3dpack.dat or 3dusrpac.dat are:
//U$2		3,2
//U$3		3,2
//U$4		3,2
