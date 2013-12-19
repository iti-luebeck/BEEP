<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE eagle SYSTEM "eagle.dtd">
<eagle version="6.5.0">
<drawing>
<settings>
<setting alwaysvectorfont="no"/>
<setting verticaltext="up"/>
</settings>
<grid distance="0.1" unitdist="inch" unit="inch" style="lines" multiple="1" display="no" altdistance="0.01" altunitdist="inch" altunit="inch"/>
<layers>
<layer number="1" name="Top" color="4" fill="1" visible="no" active="no"/>
<layer number="16" name="Bottom" color="1" fill="1" visible="no" active="no"/>
<layer number="17" name="Pads" color="2" fill="1" visible="no" active="no"/>
<layer number="18" name="Vias" color="2" fill="1" visible="no" active="no"/>
<layer number="19" name="Unrouted" color="6" fill="1" visible="no" active="no"/>
<layer number="20" name="Dimension" color="15" fill="1" visible="no" active="no"/>
<layer number="21" name="tPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="22" name="bPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="23" name="tOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="24" name="bOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="25" name="tNames" color="7" fill="1" visible="no" active="no"/>
<layer number="26" name="bNames" color="7" fill="1" visible="no" active="no"/>
<layer number="27" name="tValues" color="7" fill="1" visible="no" active="no"/>
<layer number="28" name="bValues" color="7" fill="1" visible="no" active="no"/>
<layer number="29" name="tStop" color="7" fill="3" visible="no" active="no"/>
<layer number="30" name="bStop" color="7" fill="6" visible="no" active="no"/>
<layer number="31" name="tCream" color="7" fill="4" visible="no" active="no"/>
<layer number="32" name="bCream" color="7" fill="5" visible="no" active="no"/>
<layer number="33" name="tFinish" color="6" fill="3" visible="no" active="no"/>
<layer number="34" name="bFinish" color="6" fill="6" visible="no" active="no"/>
<layer number="35" name="tGlue" color="7" fill="4" visible="no" active="no"/>
<layer number="36" name="bGlue" color="7" fill="5" visible="no" active="no"/>
<layer number="37" name="tTest" color="7" fill="1" visible="no" active="no"/>
<layer number="38" name="bTest" color="7" fill="1" visible="no" active="no"/>
<layer number="39" name="tKeepout" color="4" fill="11" visible="no" active="no"/>
<layer number="40" name="bKeepout" color="1" fill="11" visible="no" active="no"/>
<layer number="41" name="tRestrict" color="4" fill="10" visible="no" active="no"/>
<layer number="42" name="bRestrict" color="1" fill="10" visible="no" active="no"/>
<layer number="43" name="vRestrict" color="2" fill="10" visible="no" active="no"/>
<layer number="44" name="Drills" color="7" fill="1" visible="no" active="no"/>
<layer number="45" name="Holes" color="7" fill="1" visible="no" active="no"/>
<layer number="46" name="Milling" color="3" fill="1" visible="no" active="no"/>
<layer number="47" name="Measures" color="7" fill="1" visible="no" active="no"/>
<layer number="48" name="Document" color="7" fill="1" visible="no" active="no"/>
<layer number="49" name="Reference" color="7" fill="1" visible="no" active="no"/>
<layer number="51" name="tDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="52" name="bDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="91" name="Nets" color="2" fill="1" visible="yes" active="yes"/>
<layer number="92" name="Busses" color="1" fill="1" visible="yes" active="yes"/>
<layer number="93" name="Pins" color="2" fill="1" visible="no" active="yes"/>
<layer number="94" name="Symbols" color="4" fill="1" visible="yes" active="yes"/>
<layer number="95" name="Names" color="7" fill="1" visible="yes" active="yes"/>
<layer number="96" name="Values" color="7" fill="1" visible="yes" active="yes"/>
<layer number="97" name="Info" color="7" fill="1" visible="yes" active="yes"/>
<layer number="98" name="Guide" color="6" fill="1" visible="yes" active="yes"/>
<layer number="100" name="tCName" color="7" fill="1" visible="yes" active="yes"/>
<layer number="101" name="bCName" color="7" fill="1" visible="yes" active="yes"/>
</layers>
<schematic xreflabel="%F%N/%S.%C%R" xrefpart="/%S.%C%R">
<libraries>
<library name="Texas Instruments_By_element14_Batch_1">
<description>Developed by element14 :&lt;br&gt;
element14 CAD Library consolidation.ulp
at 30/07/2012 17:45:58</description>
<packages>
<package name="SOIC127P600X175-14N">
<smd name="1" x="-4.8006" y="7.62" dx="2.0574" dy="0.6096" layer="1"/>
<smd name="2" x="-4.8006" y="6.35" dx="2.0574" dy="0.6096" layer="1"/>
<smd name="3" x="-4.8006" y="5.08" dx="2.0574" dy="0.6096" layer="1"/>
<smd name="4" x="-4.8006" y="3.81" dx="2.0574" dy="0.6096" layer="1"/>
<smd name="5" x="-4.8006" y="2.54" dx="2.0574" dy="0.6096" layer="1"/>
<smd name="6" x="-4.8006" y="1.27" dx="2.0574" dy="0.6096" layer="1"/>
<smd name="7" x="-4.8006" y="0" dx="2.0574" dy="0.6096" layer="1"/>
<smd name="8" x="0" y="0" dx="2.0574" dy="0.6096" layer="1"/>
<smd name="9" x="0" y="1.27" dx="2.0574" dy="0.6096" layer="1"/>
<smd name="10" x="0" y="2.54" dx="2.0574" dy="0.6096" layer="1"/>
<smd name="11" x="0" y="3.81" dx="2.0574" dy="0.6096" layer="1"/>
<smd name="12" x="0" y="5.08" dx="2.0574" dy="0.6096" layer="1"/>
<smd name="13" x="0" y="6.35" dx="2.0574" dy="0.6096" layer="1"/>
<smd name="14" x="0" y="7.62" dx="2.0574" dy="0.6096" layer="1"/>
<wire x1="-3.556" y1="-0.5588" x2="-1.2446" y2="-0.5588" width="0.1524" layer="21"/>
<wire x1="-1.2446" y1="8.1788" x2="-2.0828" y2="8.1788" width="0.1524" layer="21"/>
<wire x1="-2.0828" y1="8.1788" x2="-2.6924" y2="8.1788" width="0.1524" layer="21"/>
<wire x1="-2.6924" y1="8.1788" x2="-3.556" y2="8.1788" width="0.1524" layer="21"/>
<wire x1="-2.0828" y1="8.1788" x2="-2.6924" y2="8.1788" width="0" layer="21" curve="-180"/>
<text x="-5.3848" y="8.0518" size="1.27" layer="21" ratio="6" rot="SR0">*</text>
<wire x1="-4.8006" y1="7.62" x2="-4.3942" y2="7.62" width="0.1524" layer="51"/>
<wire x1="-4.8006" y1="6.35" x2="-4.3942" y2="6.35" width="0.1524" layer="51"/>
<wire x1="-4.8006" y1="5.08" x2="-4.3942" y2="5.08" width="0.1524" layer="51"/>
<wire x1="-4.8006" y1="3.81" x2="-4.3942" y2="3.81" width="0.1524" layer="51"/>
<wire x1="-4.8006" y1="2.54" x2="-4.3942" y2="2.54" width="0.1524" layer="51"/>
<wire x1="-4.8006" y1="1.27" x2="-4.3942" y2="1.27" width="0.1524" layer="51"/>
<wire x1="-4.8006" y1="0" x2="-4.3942" y2="0" width="0.1524" layer="51"/>
<wire x1="0" y1="0" x2="-0.4064" y2="0" width="0.1524" layer="51"/>
<wire x1="0" y1="1.27" x2="-0.4064" y2="1.27" width="0.1524" layer="51"/>
<wire x1="0" y1="2.54" x2="-0.4064" y2="2.54" width="0.1524" layer="51"/>
<wire x1="0" y1="3.81" x2="-0.4064" y2="3.81" width="0.1524" layer="51"/>
<wire x1="0" y1="5.08" x2="-0.4064" y2="5.08" width="0.1524" layer="51"/>
<wire x1="0" y1="6.35" x2="-0.4064" y2="6.35" width="0.1524" layer="51"/>
<wire x1="0" y1="7.62" x2="-0.4064" y2="7.62" width="0.1524" layer="51"/>
<wire x1="-4.3942" y1="-0.5588" x2="-0.4064" y2="-0.5588" width="0.1524" layer="51"/>
<wire x1="-0.4064" y1="-0.5588" x2="-0.4064" y2="8.1788" width="0.1524" layer="51"/>
<wire x1="-0.4064" y1="8.1788" x2="-2.0828" y2="8.1788" width="0.1524" layer="51"/>
<wire x1="-2.0828" y1="8.1788" x2="-2.6924" y2="8.1788" width="0.1524" layer="51"/>
<wire x1="-2.6924" y1="8.1788" x2="-4.3942" y2="8.1788" width="0.1524" layer="51"/>
<wire x1="-4.3942" y1="8.1788" x2="-4.3942" y2="-0.5588" width="0.1524" layer="51"/>
<wire x1="-2.0828" y1="8.1788" x2="-2.6924" y2="8.1788" width="0" layer="51" curve="-180"/>
<text x="-5.3848" y="8.0518" size="1.27" layer="51" ratio="6" rot="SR0">*</text>
<text x="-6.985" y="8.9408" size="2.0828" layer="25" ratio="10" rot="SR0">&gt;NAME</text>
<text x="-7.8232" y="-3.4036" size="2.0828" layer="27" ratio="10" rot="SR0">&gt;VALUE</text>
</package>
</packages>
<symbols>
<symbol name="LM239AMDREP">
<pin name="VCC" x="-17.78" y="10.16" length="middle" direction="pwr"/>
<pin name="1IN+" x="-17.78" y="5.08" length="middle" direction="in"/>
<pin name="1IN-" x="-17.78" y="2.54" length="middle" direction="in"/>
<pin name="2IN+" x="-17.78" y="0" length="middle" direction="in"/>
<pin name="2IN-" x="-17.78" y="-2.54" length="middle" direction="in"/>
<pin name="3IN+" x="-17.78" y="-5.08" length="middle" direction="in"/>
<pin name="3IN-" x="-17.78" y="-7.62" length="middle" direction="in"/>
<pin name="4IN+" x="-17.78" y="-10.16" length="middle" direction="in"/>
<pin name="4IN-" x="-17.78" y="-12.7" length="middle" direction="in"/>
<pin name="GND" x="-17.78" y="-17.78" length="middle" direction="pas"/>
<pin name="1OUT" x="17.78" y="10.16" length="middle" direction="out" rot="R180"/>
<pin name="2OUT" x="17.78" y="7.62" length="middle" direction="out" rot="R180"/>
<pin name="OUT3" x="17.78" y="5.08" length="middle" direction="out" rot="R180"/>
<pin name="OUT4" x="17.78" y="2.54" length="middle" direction="out" rot="R180"/>
<wire x1="-12.7" y1="15.24" x2="-12.7" y2="-22.86" width="0.4064" layer="94"/>
<wire x1="-12.7" y1="-22.86" x2="12.7" y2="-22.86" width="0.4064" layer="94"/>
<wire x1="12.7" y1="-22.86" x2="12.7" y2="15.24" width="0.4064" layer="94"/>
<wire x1="12.7" y1="15.24" x2="-12.7" y2="15.24" width="0.4064" layer="94"/>
<text x="-5.3594" y="19.2786" size="2.0828" layer="95" ratio="10" rot="SR0">&gt;NAME</text>
<text x="-4.445" y="-28.0162" size="2.0828" layer="96" ratio="10" rot="SR0">&gt;VALUE</text>
</symbol>
</symbols>
<devicesets>
<deviceset name="LM239AMDREP" prefix="U">
<description>QUAD DIFFERENTIAL COMPARATORS</description>
<gates>
<gate name="A" symbol="LM239AMDREP" x="0" y="0"/>
</gates>
<devices>
<device name="" package="SOIC127P600X175-14N">
<connects>
<connect gate="A" pin="1IN+" pad="7"/>
<connect gate="A" pin="1IN-" pad="6"/>
<connect gate="A" pin="1OUT" pad="1"/>
<connect gate="A" pin="2IN+" pad="5"/>
<connect gate="A" pin="2IN-" pad="4"/>
<connect gate="A" pin="2OUT" pad="2"/>
<connect gate="A" pin="3IN+" pad="9"/>
<connect gate="A" pin="3IN-" pad="8"/>
<connect gate="A" pin="4IN+" pad="11"/>
<connect gate="A" pin="4IN-" pad="10"/>
<connect gate="A" pin="GND" pad="12"/>
<connect gate="A" pin="OUT3" pad="14"/>
<connect gate="A" pin="OUT4" pad="13"/>
<connect gate="A" pin="VCC" pad="3"/>
</connects>
<technologies>
<technology name="">
<attribute name="MPN" value="LM239AMDREP" constant="no"/>
<attribute name="OC_FARNELL" value="-" constant="no"/>
<attribute name="OC_NEWARK" value="79R8092" constant="no"/>
<attribute name="PACKAGE" value="SOIC-14" constant="no"/>
<attribute name="SUPPLIER" value="Texas Instruments" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="pinhead">
<description>&lt;b&gt;Pin Header Connectors&lt;/b&gt;&lt;p&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="1X07">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<wire x1="3.81" y1="0.635" x2="4.445" y2="1.27" width="0.1524" layer="21"/>
<wire x1="4.445" y1="1.27" x2="5.715" y2="1.27" width="0.1524" layer="21"/>
<wire x1="5.715" y1="1.27" x2="6.35" y2="0.635" width="0.1524" layer="21"/>
<wire x1="6.35" y1="0.635" x2="6.35" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="6.35" y1="-0.635" x2="5.715" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="5.715" y1="-1.27" x2="4.445" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="4.445" y1="-1.27" x2="3.81" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="1.27" x2="0.635" y2="1.27" width="0.1524" layer="21"/>
<wire x1="0.635" y1="1.27" x2="1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="1.27" y1="0.635" x2="1.27" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="1.27" y1="-0.635" x2="0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="1.27" y1="0.635" x2="1.905" y2="1.27" width="0.1524" layer="21"/>
<wire x1="1.905" y1="1.27" x2="3.175" y2="1.27" width="0.1524" layer="21"/>
<wire x1="3.175" y1="1.27" x2="3.81" y2="0.635" width="0.1524" layer="21"/>
<wire x1="3.81" y1="0.635" x2="3.81" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="3.81" y1="-0.635" x2="3.175" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="3.175" y1="-1.27" x2="1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="1.905" y1="-1.27" x2="1.27" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="0.635" x2="-3.175" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="1.27" x2="-1.905" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="1.27" x2="-1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="0.635" x2="-1.27" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="-0.635" x2="-1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="-1.27" x2="-3.175" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="-1.27" x2="-3.81" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="1.27" x2="-1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="-0.635" x2="-0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="0.635" y1="-1.27" x2="-0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-8.255" y1="1.27" x2="-6.985" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-6.985" y1="1.27" x2="-6.35" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-6.35" y1="0.635" x2="-6.35" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-6.35" y1="-0.635" x2="-6.985" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-6.35" y1="0.635" x2="-5.715" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-5.715" y1="1.27" x2="-4.445" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-4.445" y1="1.27" x2="-3.81" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="0.635" x2="-3.81" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="-0.635" x2="-4.445" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-4.445" y1="-1.27" x2="-5.715" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-5.715" y1="-1.27" x2="-6.35" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-8.89" y1="0.635" x2="-8.89" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-8.255" y1="1.27" x2="-8.89" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-8.89" y1="-0.635" x2="-8.255" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-6.985" y1="-1.27" x2="-8.255" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="6.985" y1="1.27" x2="8.255" y2="1.27" width="0.1524" layer="21"/>
<wire x1="8.255" y1="1.27" x2="8.89" y2="0.635" width="0.1524" layer="21"/>
<wire x1="8.89" y1="0.635" x2="8.89" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="8.89" y1="-0.635" x2="8.255" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="6.985" y1="1.27" x2="6.35" y2="0.635" width="0.1524" layer="21"/>
<wire x1="6.35" y1="-0.635" x2="6.985" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="8.255" y1="-1.27" x2="6.985" y2="-1.27" width="0.1524" layer="21"/>
<pad name="1" x="-7.62" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="2" x="-5.08" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="3" x="-2.54" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="4" x="0" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="5" x="2.54" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="6" x="5.08" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="7" x="7.62" y="0" drill="1.016" shape="long" rot="R90"/>
<text x="-8.9662" y="1.8288" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-8.89" y="-3.175" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="4.826" y1="-0.254" x2="5.334" y2="0.254" layer="51"/>
<rectangle x1="2.286" y1="-0.254" x2="2.794" y2="0.254" layer="51"/>
<rectangle x1="-0.254" y1="-0.254" x2="0.254" y2="0.254" layer="51"/>
<rectangle x1="-2.794" y1="-0.254" x2="-2.286" y2="0.254" layer="51"/>
<rectangle x1="-5.334" y1="-0.254" x2="-4.826" y2="0.254" layer="51"/>
<rectangle x1="-7.874" y1="-0.254" x2="-7.366" y2="0.254" layer="51"/>
<rectangle x1="7.366" y1="-0.254" x2="7.874" y2="0.254" layer="51"/>
</package>
<package name="1X07/90">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<wire x1="-8.89" y1="-1.905" x2="-6.35" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-6.35" y1="-1.905" x2="-6.35" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-6.35" y1="0.635" x2="-8.89" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-8.89" y1="0.635" x2="-8.89" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-7.62" y1="6.985" x2="-7.62" y2="1.27" width="0.762" layer="21"/>
<wire x1="-6.35" y1="-1.905" x2="-3.81" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="-1.905" x2="-3.81" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="0.635" x2="-6.35" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="6.985" x2="-5.08" y2="1.27" width="0.762" layer="21"/>
<wire x1="-3.81" y1="-1.905" x2="-1.27" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="-1.905" x2="-1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="0.635" x2="-3.81" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="6.985" x2="-2.54" y2="1.27" width="0.762" layer="21"/>
<wire x1="-1.27" y1="-1.905" x2="1.27" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="1.27" y1="-1.905" x2="1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="1.27" y1="0.635" x2="-1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="6.985" x2="0" y2="1.27" width="0.762" layer="21"/>
<wire x1="1.27" y1="-1.905" x2="3.81" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="3.81" y1="-1.905" x2="3.81" y2="0.635" width="0.1524" layer="21"/>
<wire x1="3.81" y1="0.635" x2="1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="2.54" y1="6.985" x2="2.54" y2="1.27" width="0.762" layer="21"/>
<wire x1="3.81" y1="-1.905" x2="6.35" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="6.35" y1="-1.905" x2="6.35" y2="0.635" width="0.1524" layer="21"/>
<wire x1="6.35" y1="0.635" x2="3.81" y2="0.635" width="0.1524" layer="21"/>
<wire x1="5.08" y1="6.985" x2="5.08" y2="1.27" width="0.762" layer="21"/>
<wire x1="6.35" y1="-1.905" x2="8.89" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="8.89" y1="-1.905" x2="8.89" y2="0.635" width="0.1524" layer="21"/>
<wire x1="8.89" y1="0.635" x2="6.35" y2="0.635" width="0.1524" layer="21"/>
<wire x1="7.62" y1="6.985" x2="7.62" y2="1.27" width="0.762" layer="21"/>
<pad name="1" x="-7.62" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="2" x="-5.08" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="3" x="-2.54" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="4" x="0" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="5" x="2.54" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="6" x="5.08" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="7" x="7.62" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<text x="-9.525" y="-3.81" size="1.27" layer="25" ratio="10" rot="R90">&gt;NAME</text>
<text x="10.795" y="-3.81" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
<rectangle x1="-8.001" y1="0.635" x2="-7.239" y2="1.143" layer="21"/>
<rectangle x1="-5.461" y1="0.635" x2="-4.699" y2="1.143" layer="21"/>
<rectangle x1="-2.921" y1="0.635" x2="-2.159" y2="1.143" layer="21"/>
<rectangle x1="-0.381" y1="0.635" x2="0.381" y2="1.143" layer="21"/>
<rectangle x1="2.159" y1="0.635" x2="2.921" y2="1.143" layer="21"/>
<rectangle x1="4.699" y1="0.635" x2="5.461" y2="1.143" layer="21"/>
<rectangle x1="7.239" y1="0.635" x2="8.001" y2="1.143" layer="21"/>
<rectangle x1="-8.001" y1="-2.921" x2="-7.239" y2="-1.905" layer="21"/>
<rectangle x1="-5.461" y1="-2.921" x2="-4.699" y2="-1.905" layer="21"/>
<rectangle x1="-2.921" y1="-2.921" x2="-2.159" y2="-1.905" layer="21"/>
<rectangle x1="-0.381" y1="-2.921" x2="0.381" y2="-1.905" layer="21"/>
<rectangle x1="2.159" y1="-2.921" x2="2.921" y2="-1.905" layer="21"/>
<rectangle x1="4.699" y1="-2.921" x2="5.461" y2="-1.905" layer="21"/>
<rectangle x1="7.239" y1="-2.921" x2="8.001" y2="-1.905" layer="21"/>
</package>
</packages>
<symbols>
<symbol name="PINHD7">
<wire x1="-6.35" y1="-10.16" x2="1.27" y2="-10.16" width="0.4064" layer="94"/>
<wire x1="1.27" y1="-10.16" x2="1.27" y2="10.16" width="0.4064" layer="94"/>
<wire x1="1.27" y1="10.16" x2="-6.35" y2="10.16" width="0.4064" layer="94"/>
<wire x1="-6.35" y1="10.16" x2="-6.35" y2="-10.16" width="0.4064" layer="94"/>
<text x="-6.35" y="10.795" size="1.778" layer="95">&gt;NAME</text>
<text x="-6.35" y="-12.7" size="1.778" layer="96">&gt;VALUE</text>
<pin name="1" x="-2.54" y="7.62" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="2" x="-2.54" y="5.08" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="3" x="-2.54" y="2.54" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="4" x="-2.54" y="0" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="5" x="-2.54" y="-2.54" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="6" x="-2.54" y="-5.08" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="7" x="-2.54" y="-7.62" visible="pad" length="short" direction="pas" function="dot"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="PINHD-1X7" prefix="JP" uservalue="yes">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<gates>
<gate name="A" symbol="PINHD7" x="0" y="0"/>
</gates>
<devices>
<device name="" package="1X07">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
<connect gate="A" pin="4" pad="4"/>
<connect gate="A" pin="5" pad="5"/>
<connect gate="A" pin="6" pad="6"/>
<connect gate="A" pin="7" pad="7"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="/90" package="1X07/90">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
<connect gate="A" pin="4" pad="4"/>
<connect gate="A" pin="5" pad="5"/>
<connect gate="A" pin="6" pad="6"/>
<connect gate="A" pin="7" pad="7"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
</libraries>
<attributes>
</attributes>
<variantdefs>
</variantdefs>
<classes>
<class number="0" name="default" width="0" drill="0">
</class>
</classes>
<parts>
<part name="U1" library="Texas Instruments_By_element14_Batch_1" deviceset="LM239AMDREP" device=""/>
<part name="JP1" library="pinhead" deviceset="PINHD-1X7" device=""/>
<part name="JP2" library="pinhead" deviceset="PINHD-1X7" device=""/>
</parts>
<sheets>
<sheet>
<plain>
</plain>
<instances>
<instance part="U1" gate="A" x="58.42" y="78.74"/>
<instance part="JP1" gate="A" x="109.22" y="78.74"/>
<instance part="JP2" gate="A" x="22.86" y="63.5" rot="R180"/>
</instances>
<busses>
</busses>
<nets>
<net name="N$1" class="0">
<segment>
<pinref part="U1" gate="A" pin="1OUT"/>
<wire x1="76.2" y1="88.9" x2="86.36" y2="88.9" width="0.1524" layer="91"/>
<wire x1="86.36" y1="88.9" x2="86.36" y2="86.36" width="0.1524" layer="91"/>
<pinref part="JP1" gate="A" pin="1"/>
<wire x1="86.36" y1="86.36" x2="106.68" y2="86.36" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$2" class="0">
<segment>
<pinref part="U1" gate="A" pin="2OUT"/>
<wire x1="76.2" y1="86.36" x2="83.82" y2="86.36" width="0.1524" layer="91"/>
<wire x1="83.82" y1="86.36" x2="83.82" y2="83.82" width="0.1524" layer="91"/>
<pinref part="JP1" gate="A" pin="2"/>
<wire x1="83.82" y1="83.82" x2="106.68" y2="83.82" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$3" class="0">
<segment>
<pinref part="U1" gate="A" pin="VCC"/>
<wire x1="40.64" y1="88.9" x2="38.1" y2="88.9" width="0.1524" layer="91"/>
<wire x1="38.1" y1="88.9" x2="38.1" y2="96.52" width="0.1524" layer="91"/>
<wire x1="38.1" y1="96.52" x2="99.06" y2="96.52" width="0.1524" layer="91"/>
<wire x1="99.06" y1="96.52" x2="99.06" y2="81.28" width="0.1524" layer="91"/>
<pinref part="JP1" gate="A" pin="3"/>
<wire x1="99.06" y1="81.28" x2="106.68" y2="81.28" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$4" class="0">
<segment>
<pinref part="U1" gate="A" pin="2IN-"/>
<wire x1="40.64" y1="76.2" x2="35.56" y2="76.2" width="0.1524" layer="91"/>
<wire x1="35.56" y1="76.2" x2="35.56" y2="99.06" width="0.1524" layer="91"/>
<wire x1="35.56" y1="99.06" x2="96.52" y2="99.06" width="0.1524" layer="91"/>
<wire x1="96.52" y1="99.06" x2="96.52" y2="78.74" width="0.1524" layer="91"/>
<pinref part="JP1" gate="A" pin="4"/>
<wire x1="96.52" y1="78.74" x2="106.68" y2="78.74" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$5" class="0">
<segment>
<pinref part="U1" gate="A" pin="2IN+"/>
<wire x1="40.64" y1="78.74" x2="33.02" y2="78.74" width="0.1524" layer="91"/>
<wire x1="33.02" y1="78.74" x2="33.02" y2="101.6" width="0.1524" layer="91"/>
<wire x1="33.02" y1="101.6" x2="93.98" y2="101.6" width="0.1524" layer="91"/>
<wire x1="93.98" y1="101.6" x2="93.98" y2="76.2" width="0.1524" layer="91"/>
<pinref part="JP1" gate="A" pin="5"/>
<wire x1="93.98" y1="76.2" x2="106.68" y2="76.2" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$6" class="0">
<segment>
<pinref part="JP1" gate="A" pin="6"/>
<wire x1="106.68" y1="73.66" x2="91.44" y2="73.66" width="0.1524" layer="91"/>
<wire x1="91.44" y1="73.66" x2="91.44" y2="104.14" width="0.1524" layer="91"/>
<wire x1="91.44" y1="104.14" x2="30.48" y2="104.14" width="0.1524" layer="91"/>
<wire x1="30.48" y1="104.14" x2="30.48" y2="81.28" width="0.1524" layer="91"/>
<pinref part="U1" gate="A" pin="1IN-"/>
<wire x1="30.48" y1="81.28" x2="40.64" y2="81.28" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$7" class="0">
<segment>
<pinref part="U1" gate="A" pin="1IN+"/>
<wire x1="40.64" y1="83.82" x2="27.94" y2="83.82" width="0.1524" layer="91"/>
<wire x1="27.94" y1="83.82" x2="27.94" y2="106.68" width="0.1524" layer="91"/>
<wire x1="27.94" y1="106.68" x2="88.9" y2="106.68" width="0.1524" layer="91"/>
<wire x1="88.9" y1="106.68" x2="88.9" y2="71.12" width="0.1524" layer="91"/>
<pinref part="JP1" gate="A" pin="7"/>
<wire x1="88.9" y1="71.12" x2="106.68" y2="71.12" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$8" class="0">
<segment>
<pinref part="U1" gate="A" pin="3IN-"/>
<wire x1="40.64" y1="71.12" x2="25.4" y2="71.12" width="0.1524" layer="91"/>
<pinref part="JP2" gate="A" pin="7"/>
</segment>
</net>
<net name="N$9" class="0">
<segment>
<pinref part="U1" gate="A" pin="3IN+"/>
<wire x1="40.64" y1="73.66" x2="27.94" y2="73.66" width="0.1524" layer="91"/>
<wire x1="27.94" y1="73.66" x2="27.94" y2="68.58" width="0.1524" layer="91"/>
<pinref part="JP2" gate="A" pin="6"/>
<wire x1="27.94" y1="68.58" x2="25.4" y2="68.58" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$10" class="0">
<segment>
<pinref part="U1" gate="A" pin="4IN+"/>
<wire x1="40.64" y1="68.58" x2="30.48" y2="68.58" width="0.1524" layer="91"/>
<wire x1="30.48" y1="68.58" x2="30.48" y2="63.5" width="0.1524" layer="91"/>
<pinref part="JP2" gate="A" pin="4"/>
<wire x1="30.48" y1="63.5" x2="25.4" y2="63.5" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$11" class="0">
<segment>
<pinref part="U1" gate="A" pin="4IN-"/>
<pinref part="JP2" gate="A" pin="5"/>
<wire x1="40.64" y1="66.04" x2="25.4" y2="66.04" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$12" class="0">
<segment>
<pinref part="U1" gate="A" pin="GND"/>
<pinref part="JP2" gate="A" pin="3"/>
<wire x1="40.64" y1="60.96" x2="25.4" y2="60.96" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$13" class="0">
<segment>
<pinref part="U1" gate="A" pin="OUT4"/>
<wire x1="76.2" y1="81.28" x2="78.74" y2="81.28" width="0.1524" layer="91"/>
<wire x1="78.74" y1="81.28" x2="78.74" y2="53.34" width="0.1524" layer="91"/>
<wire x1="78.74" y1="53.34" x2="43.18" y2="53.34" width="0.1524" layer="91"/>
<wire x1="43.18" y1="53.34" x2="43.18" y2="58.42" width="0.1524" layer="91"/>
<pinref part="JP2" gate="A" pin="2"/>
<wire x1="43.18" y1="58.42" x2="25.4" y2="58.42" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$14" class="0">
<segment>
<pinref part="U1" gate="A" pin="OUT3"/>
<wire x1="76.2" y1="83.82" x2="81.28" y2="83.82" width="0.1524" layer="91"/>
<wire x1="81.28" y1="83.82" x2="81.28" y2="50.8" width="0.1524" layer="91"/>
<wire x1="81.28" y1="50.8" x2="40.64" y2="50.8" width="0.1524" layer="91"/>
<wire x1="40.64" y1="50.8" x2="40.64" y2="55.88" width="0.1524" layer="91"/>
<pinref part="JP2" gate="A" pin="1"/>
<wire x1="40.64" y1="55.88" x2="25.4" y2="55.88" width="0.1524" layer="91"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
</eagle>
