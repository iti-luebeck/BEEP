<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE eagle SYSTEM "eagle.dtd">
<eagle version="6.4">
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
<library name="pinhead">
<description>&lt;b&gt;Pin Header Connectors&lt;/b&gt;&lt;p&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="1X03">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<wire x1="-3.175" y1="1.27" x2="-1.905" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="1.27" x2="-1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="0.635" x2="-1.27" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="-0.635" x2="-1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="0.635" x2="-0.635" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="1.27" x2="0.635" y2="1.27" width="0.1524" layer="21"/>
<wire x1="0.635" y1="1.27" x2="1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="1.27" y1="0.635" x2="1.27" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="1.27" y1="-0.635" x2="0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="0.635" y1="-1.27" x2="-0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="-1.27" x2="-1.27" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="0.635" x2="-3.81" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="1.27" x2="-3.81" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="-0.635" x2="-3.175" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="-1.27" x2="-3.175" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="1.27" y1="0.635" x2="1.905" y2="1.27" width="0.1524" layer="21"/>
<wire x1="1.905" y1="1.27" x2="3.175" y2="1.27" width="0.1524" layer="21"/>
<wire x1="3.175" y1="1.27" x2="3.81" y2="0.635" width="0.1524" layer="21"/>
<wire x1="3.81" y1="0.635" x2="3.81" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="3.81" y1="-0.635" x2="3.175" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="3.175" y1="-1.27" x2="1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="1.905" y1="-1.27" x2="1.27" y2="-0.635" width="0.1524" layer="21"/>
<pad name="1" x="-2.54" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="2" x="0" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="3" x="2.54" y="0" drill="1.016" shape="long" rot="R90"/>
<text x="-3.8862" y="1.8288" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.81" y="-3.175" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-0.254" y1="-0.254" x2="0.254" y2="0.254" layer="51"/>
<rectangle x1="-2.794" y1="-0.254" x2="-2.286" y2="0.254" layer="51"/>
<rectangle x1="2.286" y1="-0.254" x2="2.794" y2="0.254" layer="51"/>
</package>
<package name="1X03/90">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<wire x1="-3.81" y1="-1.905" x2="-1.27" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="-1.905" x2="-1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="0.635" x2="-3.81" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="0.635" x2="-3.81" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="6.985" x2="-2.54" y2="1.27" width="0.762" layer="21"/>
<wire x1="-1.27" y1="-1.905" x2="1.27" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="1.27" y1="-1.905" x2="1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="1.27" y1="0.635" x2="-1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="6.985" x2="0" y2="1.27" width="0.762" layer="21"/>
<wire x1="1.27" y1="-1.905" x2="3.81" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="3.81" y1="-1.905" x2="3.81" y2="0.635" width="0.1524" layer="21"/>
<wire x1="3.81" y1="0.635" x2="1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="2.54" y1="6.985" x2="2.54" y2="1.27" width="0.762" layer="21"/>
<pad name="1" x="-2.54" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="2" x="0" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="3" x="2.54" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<text x="-4.445" y="-3.81" size="1.27" layer="25" ratio="10" rot="R90">&gt;NAME</text>
<text x="5.715" y="-3.81" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
<rectangle x1="-2.921" y1="0.635" x2="-2.159" y2="1.143" layer="21"/>
<rectangle x1="-0.381" y1="0.635" x2="0.381" y2="1.143" layer="21"/>
<rectangle x1="2.159" y1="0.635" x2="2.921" y2="1.143" layer="21"/>
<rectangle x1="-2.921" y1="-2.921" x2="-2.159" y2="-1.905" layer="21"/>
<rectangle x1="-0.381" y1="-2.921" x2="0.381" y2="-1.905" layer="21"/>
<rectangle x1="2.159" y1="-2.921" x2="2.921" y2="-1.905" layer="21"/>
</package>
<package name="1X08">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<wire x1="5.715" y1="1.27" x2="6.985" y2="1.27" width="0.1524" layer="21"/>
<wire x1="6.985" y1="1.27" x2="7.62" y2="0.635" width="0.1524" layer="21"/>
<wire x1="7.62" y1="0.635" x2="7.62" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="7.62" y1="-0.635" x2="6.985" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="2.54" y1="0.635" x2="3.175" y2="1.27" width="0.1524" layer="21"/>
<wire x1="3.175" y1="1.27" x2="4.445" y2="1.27" width="0.1524" layer="21"/>
<wire x1="4.445" y1="1.27" x2="5.08" y2="0.635" width="0.1524" layer="21"/>
<wire x1="5.08" y1="0.635" x2="5.08" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="5.08" y1="-0.635" x2="4.445" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="4.445" y1="-1.27" x2="3.175" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="3.175" y1="-1.27" x2="2.54" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="5.715" y1="1.27" x2="5.08" y2="0.635" width="0.1524" layer="21"/>
<wire x1="5.08" y1="-0.635" x2="5.715" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="6.985" y1="-1.27" x2="5.715" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="1.27" x2="-0.635" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="1.27" x2="0" y2="0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="0.635" x2="0" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="-0.635" x2="-0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="0" y1="0.635" x2="0.635" y2="1.27" width="0.1524" layer="21"/>
<wire x1="0.635" y1="1.27" x2="1.905" y2="1.27" width="0.1524" layer="21"/>
<wire x1="1.905" y1="1.27" x2="2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="2.54" y1="0.635" x2="2.54" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="2.54" y1="-0.635" x2="1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="1.905" y1="-1.27" x2="0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="0.635" y1="-1.27" x2="0" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="0.635" x2="-4.445" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-4.445" y1="1.27" x2="-3.175" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="1.27" x2="-2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="0.635" x2="-2.54" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="-0.635" x2="-3.175" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="-1.27" x2="-4.445" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-4.445" y1="-1.27" x2="-5.08" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="1.27" x2="-2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="-0.635" x2="-1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="-1.27" x2="-1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-9.525" y1="1.27" x2="-8.255" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-8.255" y1="1.27" x2="-7.62" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-7.62" y1="0.635" x2="-7.62" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-7.62" y1="-0.635" x2="-8.255" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-7.62" y1="0.635" x2="-6.985" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-6.985" y1="1.27" x2="-5.715" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-5.715" y1="1.27" x2="-5.08" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="0.635" x2="-5.08" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="-0.635" x2="-5.715" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-5.715" y1="-1.27" x2="-6.985" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-6.985" y1="-1.27" x2="-7.62" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-10.16" y1="0.635" x2="-10.16" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-9.525" y1="1.27" x2="-10.16" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-10.16" y1="-0.635" x2="-9.525" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-8.255" y1="-1.27" x2="-9.525" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="8.255" y1="1.27" x2="9.525" y2="1.27" width="0.1524" layer="21"/>
<wire x1="9.525" y1="1.27" x2="10.16" y2="0.635" width="0.1524" layer="21"/>
<wire x1="10.16" y1="0.635" x2="10.16" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="10.16" y1="-0.635" x2="9.525" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="8.255" y1="1.27" x2="7.62" y2="0.635" width="0.1524" layer="21"/>
<wire x1="7.62" y1="-0.635" x2="8.255" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="9.525" y1="-1.27" x2="8.255" y2="-1.27" width="0.1524" layer="21"/>
<pad name="1" x="-8.89" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="2" x="-6.35" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="3" x="-3.81" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="4" x="-1.27" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="5" x="1.27" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="6" x="3.81" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="7" x="6.35" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="8" x="8.89" y="0" drill="1.016" shape="long" rot="R90"/>
<text x="-10.2362" y="1.8288" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-10.16" y="-3.175" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="6.096" y1="-0.254" x2="6.604" y2="0.254" layer="51"/>
<rectangle x1="3.556" y1="-0.254" x2="4.064" y2="0.254" layer="51"/>
<rectangle x1="1.016" y1="-0.254" x2="1.524" y2="0.254" layer="51"/>
<rectangle x1="-1.524" y1="-0.254" x2="-1.016" y2="0.254" layer="51"/>
<rectangle x1="-4.064" y1="-0.254" x2="-3.556" y2="0.254" layer="51"/>
<rectangle x1="-6.604" y1="-0.254" x2="-6.096" y2="0.254" layer="51"/>
<rectangle x1="-9.144" y1="-0.254" x2="-8.636" y2="0.254" layer="51"/>
<rectangle x1="8.636" y1="-0.254" x2="9.144" y2="0.254" layer="51"/>
</package>
<package name="1X08/90">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<wire x1="-10.16" y1="-1.905" x2="-7.62" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-7.62" y1="-1.905" x2="-7.62" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-7.62" y1="0.635" x2="-10.16" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-10.16" y1="0.635" x2="-10.16" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-8.89" y1="6.985" x2="-8.89" y2="1.27" width="0.762" layer="21"/>
<wire x1="-7.62" y1="-1.905" x2="-5.08" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="-1.905" x2="-5.08" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="0.635" x2="-7.62" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-6.35" y1="6.985" x2="-6.35" y2="1.27" width="0.762" layer="21"/>
<wire x1="-5.08" y1="-1.905" x2="-2.54" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="-1.905" x2="-2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="0.635" x2="-5.08" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="6.985" x2="-3.81" y2="1.27" width="0.762" layer="21"/>
<wire x1="-2.54" y1="-1.905" x2="0" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="0" y1="-1.905" x2="0" y2="0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="0.635" x2="-2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="6.985" x2="-1.27" y2="1.27" width="0.762" layer="21"/>
<wire x1="0" y1="-1.905" x2="2.54" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="2.54" y1="-1.905" x2="2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="2.54" y1="0.635" x2="0" y2="0.635" width="0.1524" layer="21"/>
<wire x1="1.27" y1="6.985" x2="1.27" y2="1.27" width="0.762" layer="21"/>
<wire x1="2.54" y1="-1.905" x2="5.08" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="5.08" y1="-1.905" x2="5.08" y2="0.635" width="0.1524" layer="21"/>
<wire x1="5.08" y1="0.635" x2="2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="3.81" y1="6.985" x2="3.81" y2="1.27" width="0.762" layer="21"/>
<wire x1="5.08" y1="-1.905" x2="7.62" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="7.62" y1="-1.905" x2="7.62" y2="0.635" width="0.1524" layer="21"/>
<wire x1="7.62" y1="0.635" x2="5.08" y2="0.635" width="0.1524" layer="21"/>
<wire x1="6.35" y1="6.985" x2="6.35" y2="1.27" width="0.762" layer="21"/>
<wire x1="7.62" y1="-1.905" x2="10.16" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="10.16" y1="-1.905" x2="10.16" y2="0.635" width="0.1524" layer="21"/>
<wire x1="10.16" y1="0.635" x2="7.62" y2="0.635" width="0.1524" layer="21"/>
<wire x1="8.89" y1="6.985" x2="8.89" y2="1.27" width="0.762" layer="21"/>
<pad name="1" x="-8.89" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="2" x="-6.35" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="3" x="-3.81" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="4" x="-1.27" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="5" x="1.27" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="6" x="3.81" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="7" x="6.35" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="8" x="8.89" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<text x="-10.795" y="-3.81" size="1.27" layer="25" ratio="10" rot="R90">&gt;NAME</text>
<text x="12.065" y="-3.81" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
<rectangle x1="-9.271" y1="0.635" x2="-8.509" y2="1.143" layer="21"/>
<rectangle x1="-6.731" y1="0.635" x2="-5.969" y2="1.143" layer="21"/>
<rectangle x1="-4.191" y1="0.635" x2="-3.429" y2="1.143" layer="21"/>
<rectangle x1="-1.651" y1="0.635" x2="-0.889" y2="1.143" layer="21"/>
<rectangle x1="0.889" y1="0.635" x2="1.651" y2="1.143" layer="21"/>
<rectangle x1="3.429" y1="0.635" x2="4.191" y2="1.143" layer="21"/>
<rectangle x1="5.969" y1="0.635" x2="6.731" y2="1.143" layer="21"/>
<rectangle x1="8.509" y1="0.635" x2="9.271" y2="1.143" layer="21"/>
<rectangle x1="-9.271" y1="-2.921" x2="-8.509" y2="-1.905" layer="21"/>
<rectangle x1="-6.731" y1="-2.921" x2="-5.969" y2="-1.905" layer="21"/>
<rectangle x1="-4.191" y1="-2.921" x2="-3.429" y2="-1.905" layer="21"/>
<rectangle x1="-1.651" y1="-2.921" x2="-0.889" y2="-1.905" layer="21"/>
<rectangle x1="0.889" y1="-2.921" x2="1.651" y2="-1.905" layer="21"/>
<rectangle x1="3.429" y1="-2.921" x2="4.191" y2="-1.905" layer="21"/>
<rectangle x1="5.969" y1="-2.921" x2="6.731" y2="-1.905" layer="21"/>
<rectangle x1="8.509" y1="-2.921" x2="9.271" y2="-1.905" layer="21"/>
</package>
</packages>
<symbols>
<symbol name="PINHD3">
<wire x1="-6.35" y1="-5.08" x2="1.27" y2="-5.08" width="0.4064" layer="94"/>
<wire x1="1.27" y1="-5.08" x2="1.27" y2="5.08" width="0.4064" layer="94"/>
<wire x1="1.27" y1="5.08" x2="-6.35" y2="5.08" width="0.4064" layer="94"/>
<wire x1="-6.35" y1="5.08" x2="-6.35" y2="-5.08" width="0.4064" layer="94"/>
<text x="-6.35" y="5.715" size="1.778" layer="95">&gt;NAME</text>
<text x="-6.35" y="-7.62" size="1.778" layer="96">&gt;VALUE</text>
<pin name="1" x="-2.54" y="2.54" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="2" x="-2.54" y="0" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="3" x="-2.54" y="-2.54" visible="pad" length="short" direction="pas" function="dot"/>
</symbol>
<symbol name="PINHD8">
<wire x1="-6.35" y1="-10.16" x2="1.27" y2="-10.16" width="0.4064" layer="94"/>
<wire x1="1.27" y1="-10.16" x2="1.27" y2="12.7" width="0.4064" layer="94"/>
<wire x1="1.27" y1="12.7" x2="-6.35" y2="12.7" width="0.4064" layer="94"/>
<wire x1="-6.35" y1="12.7" x2="-6.35" y2="-10.16" width="0.4064" layer="94"/>
<text x="-6.35" y="13.335" size="1.778" layer="95">&gt;NAME</text>
<text x="-6.35" y="-12.7" size="1.778" layer="96">&gt;VALUE</text>
<pin name="1" x="-2.54" y="10.16" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="2" x="-2.54" y="7.62" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="3" x="-2.54" y="5.08" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="4" x="-2.54" y="2.54" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="5" x="-2.54" y="0" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="6" x="-2.54" y="-2.54" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="7" x="-2.54" y="-5.08" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="8" x="-2.54" y="-7.62" visible="pad" length="short" direction="pas" function="dot"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="PINHD-1X3" prefix="JP" uservalue="yes">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<gates>
<gate name="A" symbol="PINHD3" x="0" y="0"/>
</gates>
<devices>
<device name="" package="1X03">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="/90" package="1X03/90">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="PINHD-1X8" prefix="JP" uservalue="yes">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<gates>
<gate name="A" symbol="PINHD8" x="0" y="0"/>
</gates>
<devices>
<device name="" package="1X08">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
<connect gate="A" pin="4" pad="4"/>
<connect gate="A" pin="5" pad="5"/>
<connect gate="A" pin="6" pad="6"/>
<connect gate="A" pin="7" pad="7"/>
<connect gate="A" pin="8" pad="8"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="/90" package="1X08/90">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
<connect gate="A" pin="4" pad="4"/>
<connect gate="A" pin="5" pad="5"/>
<connect gate="A" pin="6" pad="6"/>
<connect gate="A" pin="7" pad="7"/>
<connect gate="A" pin="8" pad="8"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="BEEP">
<packages>
<package name="F50360">
<description>&lt;b&gt;Full color Z-Power LED RGB&lt;/b&gt;&lt;p&gt;
Source: http://www.seoulsemicon.co.kr .. F50360.pdf</description>
<wire x1="2.9" y1="-2.25" x2="2.9" y2="2.25" width="0.2032" layer="51"/>
<wire x1="2.75" y1="2.4" x2="-2.75" y2="2.4" width="0.2032" layer="51"/>
<wire x1="-2.9" y1="2.25" x2="-2.9" y2="-2.25" width="0.2032" layer="51"/>
<wire x1="-2.75" y1="-2.4" x2="2.75" y2="-2.4" width="0.2032" layer="51"/>
<wire x1="-2.9" y1="2.25" x2="-2.75" y2="2.4" width="0.2032" layer="51" curve="90"/>
<wire x1="2.75" y1="2.4" x2="2.9" y2="2.25" width="0.2032" layer="51" curve="90"/>
<wire x1="2.9" y1="-2.25" x2="2.75" y2="-2.4" width="0.2032" layer="51" curve="90"/>
<wire x1="-2.75" y1="-2.4" x2="-2.9" y2="-2.25" width="0.2032" layer="51" curve="90"/>
<circle x="0" y="0" radius="2" width="0.2032" layer="51"/>
<circle x="-2" y="-1.35" radius="0.2" width="0" layer="21"/>
<smd name="NC" x="0" y="0" dx="3.5" dy="4.7" layer="1"/>
<smd name="GA" x="2.55" y="0" dx="0.6" dy="1.2" layer="1" rot="R180"/>
<smd name="GC" x="-2.55" y="0" dx="0.6" dy="1.2" layer="1"/>
<smd name="BA" x="2.55" y="1.825" dx="0.6" dy="1.05" layer="1" rot="R180"/>
<smd name="BC" x="-2.55" y="1.825" dx="0.6" dy="1.05" layer="1"/>
<smd name="RC" x="-2.55" y="-1.825" dx="0.6" dy="1.05" layer="1"/>
<smd name="RA" x="2.55" y="-1.825" dx="0.6" dy="1.05" layer="1" rot="R180"/>
<text x="-2.525" y="2.6" size="1.27" layer="25">&gt;NAME</text>
<text x="-2.575" y="-3.9" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-1.25" y1="-0.5" x2="-0.25" y2="0.5" layer="51" rot="R270"/>
<rectangle x1="0.25" y1="0.25" x2="1.25" y2="1.25" layer="51" rot="R270"/>
<rectangle x1="0.25" y1="-1.25" x2="1.25" y2="-0.25" layer="51" rot="R270"/>
<rectangle x1="-0.5" y1="-1.25" x2="-0.25" y2="-1" layer="51" rot="R270"/>
<rectangle x1="-0.5" y1="1" x2="-0.25" y2="1.25" layer="51" rot="R270"/>
<rectangle x1="-1.25" y1="1" x2="-1" y2="1.25" layer="51" rot="R270"/>
</package>
<package name="5050LED">
<smd name="G1" x="-2.7" y="0" dx="1" dy="3" layer="1" rot="R90"/>
<smd name="G2" x="2.7" y="0" dx="1" dy="3" layer="1" rot="R90"/>
<smd name="B2" x="2.7" y="-1.8" dx="1.4" dy="3" layer="1" rot="R90"/>
<smd name="B1" x="-2.7" y="-1.8" dx="1.4" dy="3" layer="1" rot="R90"/>
<smd name="R1" x="-2.7" y="1.8" dx="1.4" dy="3" layer="1" rot="R90"/>
<smd name="R2" x="2.7" y="1.8" dx="1.4" dy="3" layer="1" rot="R90"/>
<wire x1="-2.5" y1="-2.5" x2="2.5" y2="-2.5" width="0.127" layer="21"/>
<wire x1="2.5" y1="-2.5" x2="2.5" y2="2.5" width="0.127" layer="21"/>
<wire x1="2.5" y1="2.5" x2="-2.5" y2="2.5" width="0.127" layer="21"/>
<wire x1="-2.5" y1="2.5" x2="-2.5" y2="-2.5" width="0.127" layer="21"/>
<text x="-3.4" y="-4.3" size="1.27" layer="25">&gt;NAME</text>
</package>
</packages>
<symbols>
<symbol name="LED-RGB-D">
<wire x1="6.35" y1="0.889" x2="5.08" y2="-1.143" width="0.254" layer="94"/>
<wire x1="5.08" y1="-1.143" x2="3.81" y2="0.889" width="0.254" layer="94"/>
<wire x1="6.35" y1="-1.143" x2="5.08" y2="-1.143" width="0.254" layer="94"/>
<wire x1="5.08" y1="-1.143" x2="3.81" y2="-1.143" width="0.254" layer="94"/>
<wire x1="6.35" y1="0.889" x2="3.81" y2="0.889" width="0.254" layer="94"/>
<wire x1="3.048" y1="0.635" x2="2.159" y2="-0.254" width="0.1524" layer="94"/>
<wire x1="3.81" y1="-0.127" x2="2.921" y2="-1.016" width="0.1524" layer="94"/>
<wire x1="1.27" y1="0.889" x2="0" y2="-1.143" width="0.254" layer="94"/>
<wire x1="0" y1="-1.143" x2="-1.27" y2="0.889" width="0.254" layer="94"/>
<wire x1="1.27" y1="-1.143" x2="0" y2="-1.143" width="0.254" layer="94"/>
<wire x1="0" y1="-1.143" x2="-1.27" y2="-1.143" width="0.254" layer="94"/>
<wire x1="1.27" y1="0.889" x2="-1.27" y2="0.889" width="0.254" layer="94"/>
<wire x1="-2.032" y1="0.635" x2="-2.921" y2="-0.254" width="0.1524" layer="94"/>
<wire x1="-1.27" y1="-0.127" x2="-2.159" y2="-1.016" width="0.1524" layer="94"/>
<wire x1="-3.81" y1="0.889" x2="-5.08" y2="-1.143" width="0.254" layer="94"/>
<wire x1="-5.08" y1="-1.143" x2="-6.35" y2="0.889" width="0.254" layer="94"/>
<wire x1="-3.81" y1="-1.143" x2="-5.08" y2="-1.143" width="0.254" layer="94"/>
<wire x1="-5.08" y1="-1.143" x2="-6.35" y2="-1.143" width="0.254" layer="94"/>
<wire x1="-3.81" y1="0.889" x2="-6.35" y2="0.889" width="0.254" layer="94"/>
<wire x1="-7.112" y1="0.635" x2="-8.001" y2="-0.254" width="0.1524" layer="94"/>
<wire x1="-6.35" y1="-0.127" x2="-7.239" y2="-1.016" width="0.1524" layer="94"/>
<wire x1="0" y1="1.651" x2="0" y2="-0.889" width="0.1524" layer="94"/>
<wire x1="5.08" y1="1.651" x2="5.08" y2="-0.889" width="0.1524" layer="94"/>
<text x="7.62" y="0.254" size="1.778" layer="95">&gt;NAME</text>
<text x="7.62" y="-1.905" size="1.778" layer="96">&gt;VALUE</text>
<text x="-5.334" y="1.524" size="0.4064" layer="94" font="vector" rot="R180">RED</text>
<text x="-0.254" y="1.524" size="0.4064" layer="94" font="vector" rot="R180">GREEN</text>
<text x="4.826" y="1.524" size="0.4064" layer="94" font="vector" rot="R180">BLUE</text>
<pin name="BC" x="5.08" y="-2.54" visible="off" length="short" direction="pas" rot="R90"/>
<pin name="GC" x="0" y="-2.54" visible="off" length="short" direction="pas" rot="R90"/>
<pin name="RC" x="-5.08" y="-2.54" visible="off" length="short" direction="pas" rot="R90"/>
<pin name="RA" x="-5.08" y="2.54" visible="off" length="short" direction="pas" rot="R270"/>
<pin name="GA" x="0" y="2.54" visible="off" length="short" direction="pas" rot="R270"/>
<pin name="BA" x="5.08" y="2.54" visible="off" length="short" direction="pas" rot="R270"/>
<polygon width="0.1524" layer="94">
<vertex x="2.032" y="0.127"/>
<vertex x="1.778" y="-0.635"/>
<vertex x="2.54" y="-0.381"/>
</polygon>
<polygon width="0.1524" layer="94">
<vertex x="2.794" y="-0.635"/>
<vertex x="2.54" y="-1.397"/>
<vertex x="3.302" y="-1.143"/>
</polygon>
<polygon width="0.1524" layer="94">
<vertex x="-3.048" y="0.127"/>
<vertex x="-3.302" y="-0.635"/>
<vertex x="-2.54" y="-0.381"/>
</polygon>
<polygon width="0.1524" layer="94">
<vertex x="-2.286" y="-0.635"/>
<vertex x="-2.54" y="-1.397"/>
<vertex x="-1.778" y="-1.143"/>
</polygon>
<polygon width="0.1524" layer="94">
<vertex x="-8.128" y="0.127"/>
<vertex x="-8.382" y="-0.635"/>
<vertex x="-7.62" y="-0.381"/>
</polygon>
<polygon width="0.1524" layer="94">
<vertex x="-7.366" y="-0.635"/>
<vertex x="-7.62" y="-1.397"/>
<vertex x="-6.858" y="-1.143"/>
</polygon>
</symbol>
</symbols>
<devicesets>
<deviceset name="F50360" prefix="LED">
<description>&lt;b&gt;Full color Z-Power LED RGB&lt;/b&gt; P5-II Series&lt;p&gt;
Source: http://www.seoulsemicon.co.kr .. F50360.pdf</description>
<gates>
<gate name="G$1" symbol="LED-RGB-D" x="0" y="0"/>
</gates>
<devices>
<device name="" package="F50360">
<connects>
<connect gate="G$1" pin="BA" pad="BA"/>
<connect gate="G$1" pin="BC" pad="BC"/>
<connect gate="G$1" pin="GA" pad="GA"/>
<connect gate="G$1" pin="GC" pad="GC"/>
<connect gate="G$1" pin="RA" pad="RA"/>
<connect gate="G$1" pin="RC" pad="RC"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="5050" package="5050LED">
<connects>
<connect gate="G$1" pin="BA" pad="B1"/>
<connect gate="G$1" pin="BC" pad="B2"/>
<connect gate="G$1" pin="GA" pad="G1"/>
<connect gate="G$1" pin="GC" pad="G2"/>
<connect gate="G$1" pin="RA" pad="R1"/>
<connect gate="G$1" pin="RC" pad="R2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="jumper">
<description>&lt;b&gt;Jumpers&lt;/b&gt;&lt;p&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="07">
<description>&lt;b&gt;JUMPER&lt;/b&gt;</description>
<wire x1="-2.6162" y1="0" x2="2.6162" y2="0" width="0.6096" layer="21"/>
<wire x1="3.81" y1="0" x2="2.54" y2="0" width="0.6096" layer="51"/>
<wire x1="-3.81" y1="0" x2="-2.54" y2="0" width="0.6096" layer="51"/>
<pad name="1" x="-3.81" y="0" drill="0.8128" diameter="1.6002" shape="octagon"/>
<pad name="2" x="3.81" y="0" drill="0.8128" diameter="1.6002" shape="octagon"/>
<text x="-2.54" y="0.635" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="3.7" y="0" size="0.02" layer="27">&gt;VALUE</text>
</package>
<package name="05">
<description>&lt;b&gt;JUMPER&lt;/b&gt;</description>
<wire x1="-1.3462" y1="0" x2="1.3462" y2="0" width="0.6096" layer="21"/>
<wire x1="2.54" y1="0" x2="1.397" y2="0" width="0.6096" layer="51"/>
<wire x1="-2.54" y1="0" x2="-1.397" y2="0" width="0.6096" layer="51"/>
<pad name="1" x="-2.54" y="0" drill="0.8128" diameter="1.6002" shape="octagon"/>
<pad name="2" x="2.54" y="0" drill="0.8128" diameter="1.6002" shape="octagon"/>
<text x="-2.54" y="0.889" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="2.5001" y="0" size="0.02" layer="27">&gt;VALUE</text>
</package>
<package name="10">
<description>&lt;b&gt;JUMPER&lt;/b&gt;</description>
<wire x1="-3.8862" y1="0" x2="3.8862" y2="0" width="0.6096" layer="21"/>
<wire x1="5.08" y1="0" x2="3.937" y2="0" width="0.6096" layer="51"/>
<wire x1="-5.08" y1="0" x2="-3.937" y2="0" width="0.6096" layer="51"/>
<pad name="1" x="-5.08" y="0" drill="0.8128" diameter="1.6002" shape="octagon"/>
<pad name="2" x="5.08" y="0" drill="0.8128" diameter="1.6002" shape="octagon"/>
<text x="-3.175" y="0.635" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="5" y="0" size="0.02" layer="27">&gt;VALUE</text>
</package>
<package name="12">
<description>&lt;b&gt;JUMPER&lt;/b&gt;</description>
<wire x1="-5.1562" y1="0" x2="5.1562" y2="0" width="0.6096" layer="21"/>
<wire x1="6.35" y1="0" x2="5.207" y2="0" width="0.6096" layer="51"/>
<wire x1="-6.35" y1="0" x2="-5.207" y2="0" width="0.6096" layer="51"/>
<pad name="1" x="-6.35" y="0" drill="0.8128" diameter="1.6002" shape="octagon"/>
<pad name="2" x="6.35" y="0" drill="0.8128" diameter="1.6002" shape="octagon"/>
<text x="-3.175" y="0.635" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="6.3" y="0" size="0.02" layer="27">&gt;VALUE</text>
</package>
<package name="15">
<description>&lt;b&gt;JUMPER&lt;/b&gt;</description>
<wire x1="-6.4262" y1="0" x2="6.4262" y2="0" width="0.6096" layer="21"/>
<wire x1="7.62" y1="0" x2="6.477" y2="0" width="0.6096" layer="51"/>
<wire x1="-7.62" y1="0" x2="-6.477" y2="0" width="0.6096" layer="51"/>
<pad name="1" x="-7.62" y="0" drill="0.8128" diameter="1.6002" shape="octagon"/>
<pad name="2" x="7.62" y="0" drill="0.8128" diameter="1.6002" shape="octagon"/>
<text x="-5.715" y="0.635" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="7.5999" y="0" size="0.02" layer="27">&gt;VALUE</text>
</package>
<package name="20">
<description>&lt;b&gt;JUMPER&lt;/b&gt;</description>
<wire x1="-8.9662" y1="0" x2="8.9662" y2="0" width="0.6096" layer="21"/>
<wire x1="10.16" y1="0" x2="9.017" y2="0" width="0.6096" layer="51"/>
<wire x1="-10.16" y1="0" x2="-9.017" y2="0" width="0.6096" layer="51"/>
<pad name="1" x="-10.16" y="0" drill="0.8128" diameter="1.6002" shape="octagon"/>
<pad name="2" x="10.16" y="0" drill="0.8128" diameter="1.6002" shape="octagon"/>
<text x="-8.255" y="0.635" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="10.1001" y="0" size="0.02" layer="27">&gt;VALUE</text>
</package>
<package name="25">
<description>&lt;b&gt;JUMPER&lt;/b&gt;</description>
<wire x1="-11.5062" y1="0" x2="11.5062" y2="0" width="0.6096" layer="21"/>
<wire x1="12.7" y1="0" x2="11.557" y2="0" width="0.6096" layer="51"/>
<wire x1="-12.7" y1="0" x2="-11.557" y2="0" width="0.6096" layer="51"/>
<pad name="1" x="-12.7" y="0" drill="0.8128" diameter="1.6002" shape="octagon"/>
<pad name="2" x="12.7" y="0" drill="0.8128" diameter="1.6002" shape="octagon"/>
<text x="-10.795" y="0.635" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="12.5999" y="0" size="0.02" layer="27">&gt;VALUE</text>
</package>
<package name="30">
<description>&lt;b&gt;JUMPER&lt;/b&gt;</description>
<wire x1="-14.0462" y1="0" x2="14.0462" y2="0" width="0.6096" layer="21"/>
<wire x1="15.24" y1="0" x2="14.097" y2="0" width="0.6096" layer="51"/>
<wire x1="-15.24" y1="0" x2="-14.097" y2="0" width="0.6096" layer="51"/>
<pad name="1" x="-15.24" y="0" drill="0.8128" diameter="1.6002" shape="octagon"/>
<pad name="2" x="15.24" y="0" drill="0.8128" diameter="1.6002" shape="octagon"/>
<text x="-13.335" y="0.635" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="15.2001" y="0" size="0.02" layer="27">&gt;VALUE</text>
</package>
</packages>
<symbols>
<symbol name="J">
<wire x1="-2.54" y1="0" x2="-1.27" y2="1.27" width="0.1524" layer="94"/>
<wire x1="-1.27" y1="1.27" x2="1.27" y2="1.27" width="0.1524" layer="94"/>
<wire x1="2.54" y1="0" x2="1.27" y2="1.27" width="0.1524" layer="94"/>
<circle x="-2.54" y="0" radius="0.254" width="0.4064" layer="94"/>
<circle x="2.54" y="0" radius="0.254" width="0.4064" layer="94"/>
<text x="-2.54" y="1.905" size="1.778" layer="95">&gt;NAME</text>
<text x="-2.54" y="-2.54" size="1.778" layer="96">&gt;VALUE</text>
<pin name="1" x="-5.08" y="0" visible="pad" length="short" direction="pas" swaplevel="1"/>
<pin name="2" x="5.08" y="0" visible="pad" length="short" direction="pas" swaplevel="1" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="J" prefix="J">
<description>Bridge</description>
<gates>
<gate name="1" symbol="J" x="0" y="0"/>
</gates>
<devices>
<device name="5MM" package="05">
<connects>
<connect gate="1" pin="1" pad="1"/>
<connect gate="1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="7MM" package="07">
<connects>
<connect gate="1" pin="1" pad="1"/>
<connect gate="1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="10MM" package="10">
<connects>
<connect gate="1" pin="1" pad="1"/>
<connect gate="1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="12MM" package="12">
<connects>
<connect gate="1" pin="1" pad="1"/>
<connect gate="1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="15MM" package="15">
<connects>
<connect gate="1" pin="1" pad="1"/>
<connect gate="1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="20MM" package="20">
<connects>
<connect gate="1" pin="1" pad="1"/>
<connect gate="1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="25MM" package="25">
<connects>
<connect gate="1" pin="1" pad="1"/>
<connect gate="1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="30MM" package="30">
<connects>
<connect gate="1" pin="1" pad="1"/>
<connect gate="1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="frames">
<description>&lt;b&gt;Frames for Sheet and Layout&lt;/b&gt;</description>
<packages>
</packages>
<symbols>
<symbol name="A4L-LOC">
<wire x1="256.54" y1="3.81" x2="256.54" y2="8.89" width="0.1016" layer="94"/>
<wire x1="256.54" y1="8.89" x2="256.54" y2="13.97" width="0.1016" layer="94"/>
<wire x1="256.54" y1="13.97" x2="256.54" y2="19.05" width="0.1016" layer="94"/>
<wire x1="256.54" y1="19.05" x2="256.54" y2="24.13" width="0.1016" layer="94"/>
<wire x1="161.29" y1="3.81" x2="161.29" y2="24.13" width="0.1016" layer="94"/>
<wire x1="161.29" y1="24.13" x2="215.265" y2="24.13" width="0.1016" layer="94"/>
<wire x1="215.265" y1="24.13" x2="256.54" y2="24.13" width="0.1016" layer="94"/>
<wire x1="246.38" y1="3.81" x2="246.38" y2="8.89" width="0.1016" layer="94"/>
<wire x1="246.38" y1="8.89" x2="256.54" y2="8.89" width="0.1016" layer="94"/>
<wire x1="246.38" y1="8.89" x2="215.265" y2="8.89" width="0.1016" layer="94"/>
<wire x1="215.265" y1="8.89" x2="215.265" y2="3.81" width="0.1016" layer="94"/>
<wire x1="215.265" y1="8.89" x2="215.265" y2="13.97" width="0.1016" layer="94"/>
<wire x1="215.265" y1="13.97" x2="256.54" y2="13.97" width="0.1016" layer="94"/>
<wire x1="215.265" y1="13.97" x2="215.265" y2="19.05" width="0.1016" layer="94"/>
<wire x1="215.265" y1="19.05" x2="256.54" y2="19.05" width="0.1016" layer="94"/>
<wire x1="215.265" y1="19.05" x2="215.265" y2="24.13" width="0.1016" layer="94"/>
<text x="217.17" y="15.24" size="2.54" layer="94" font="vector">&gt;DRAWING_NAME</text>
<text x="217.17" y="10.16" size="2.286" layer="94" font="vector">&gt;LAST_DATE_TIME</text>
<text x="230.505" y="5.08" size="2.54" layer="94" font="vector">&gt;SHEET</text>
<text x="216.916" y="4.953" size="2.54" layer="94" font="vector">Sheet:</text>
<frame x1="0" y1="0" x2="260.35" y2="179.07" columns="6" rows="4" layer="94"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="A4L-LOC" prefix="FRAME" uservalue="yes">
<description>&lt;b&gt;FRAME&lt;/b&gt;&lt;p&gt;
DIN A4, landscape with location and doc. field</description>
<gates>
<gate name="G$1" symbol="A4L-LOC" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="Branding">
<packages>
<package name="COPPER7">
<polygon width="0" layer="100">
<vertex x="0" y="3.78939375"/>
<vertex x="0" y="-0.00038125"/>
<vertex x="1.280978125" y="-0.00038125"/>
<vertex x="1.280978125" y="0.9456375"/>
<vertex x="0.57118125" y="0.9456375"/>
<vertex x="0.57118125" y="1.65543125"/>
<vertex x="1.280978125" y="1.65543125"/>
<vertex x="1.280978125" y="2.131675"/>
<vertex x="0.57118125" y="2.131675"/>
<vertex x="0.57118125" y="2.841475"/>
<vertex x="1.280978125" y="2.841475"/>
<vertex x="1.280978125" y="3.78939375"/>
</polygon>
<polygon width="0" layer="100">
<vertex x="1.280978125" y="3.78939375"/>
<vertex x="1.280978125" y="2.841475"/>
<vertex x="1.56543125" y="2.841475"/>
<vertex x="1.609103125" y="2.83919375"/>
<vertex x="1.650503125" y="2.83425"/>
<vertex x="1.689234375" y="2.82438125"/>
<vertex x="1.727971875" y="2.812228125"/>
<vertex x="1.76709375" y="2.79779375"/>
<vertex x="1.80355" y="2.778425"/>
<vertex x="1.835071875" y="2.7583"/>
<vertex x="1.866590625" y="2.733996875"/>
<vertex x="1.89355625" y="2.70969375"/>
<vertex x="1.917865625" y="2.683490625"/>
<vertex x="1.939503125" y="2.65195625"/>
<vertex x="1.958871875" y="2.62044375"/>
<vertex x="1.973690625" y="2.588159375"/>
<vertex x="1.983178125" y="2.554740625"/>
<vertex x="1.990778125" y="2.520565625"/>
<vertex x="1.993053125" y="2.484103125"/>
<vertex x="1.990778125" y="2.447646875"/>
<vertex x="1.983178125" y="2.411190625"/>
<vertex x="1.973690625" y="2.379671875"/>
<vertex x="1.958871875" y="2.34510625"/>
<vertex x="1.939503125" y="2.316621875"/>
<vertex x="1.917865625" y="2.287375"/>
<vertex x="1.89355625" y="2.260034375"/>
<vertex x="1.866590625" y="2.233834375"/>
<vertex x="1.835071875" y="2.211425"/>
<vertex x="1.80355" y="2.192440625"/>
<vertex x="1.76709375" y="2.173071875"/>
<vertex x="1.727971875" y="2.15863125"/>
<vertex x="1.689234375" y="2.14648125"/>
<vertex x="1.650503125" y="2.13850625"/>
<vertex x="1.609103125" y="2.134328125"/>
<vertex x="1.56543125" y="2.131675"/>
<vertex x="1.280978125" y="2.131675"/>
<vertex x="1.280978125" y="1.65543125"/>
<vertex x="1.56543125" y="1.65543125"/>
<vertex x="1.609103125" y="1.65543125"/>
<vertex x="1.650503125" y="1.64821875"/>
<vertex x="1.689234375" y="1.640246875"/>
<vertex x="1.727971875" y="1.626196875"/>
<vertex x="1.76709375" y="1.61175625"/>
<vertex x="1.80355" y="1.59466875"/>
<vertex x="1.835071875" y="1.572646875"/>
<vertex x="1.866590625" y="1.550996875"/>
<vertex x="1.89355625" y="1.52669375"/>
<vertex x="1.917865625" y="1.499728125"/>
<vertex x="1.939503125" y="1.47010625"/>
<vertex x="1.958871875" y="1.43896875"/>
<vertex x="1.973690625" y="1.407446875"/>
<vertex x="1.983178125" y="1.37288125"/>
<vertex x="1.990778125" y="1.33945625"/>
<vertex x="1.993053125" y="1.305284375"/>
<vertex x="1.990778125" y="1.268828125"/>
<vertex x="1.983178125" y="1.232371875"/>
<vertex x="1.973690625" y="1.19856875"/>
<vertex x="1.958871875" y="1.16439375"/>
<vertex x="1.939503125" y="1.132859375"/>
<vertex x="1.917865625" y="1.103628125"/>
<vertex x="1.89355625" y="1.077040625"/>
<vertex x="1.866590625" y="1.050078125"/>
<vertex x="1.835071875" y="1.028425"/>
<vertex x="1.80355" y="1.0083"/>
<vertex x="1.76709375" y="0.989315625"/>
<vertex x="1.727971875" y="0.974875"/>
<vertex x="1.689234375" y="0.96273125"/>
<vertex x="1.650503125" y="0.952853125"/>
<vertex x="1.609103125" y="0.9456375"/>
<vertex x="1.56543125" y="0.9456375"/>
<vertex x="1.280978125" y="0.9456375"/>
<vertex x="1.280978125" y="-0.00038125"/>
<vertex x="1.708603125" y="-0.00038125"/>
<vertex x="1.93456875" y="0.017090625"/>
<vertex x="2.143828125" y="0.068359375"/>
<vertex x="2.33560625" y="0.15570625"/>
<vertex x="2.508409375" y="0.279134375"/>
<vertex x="2.656521875" y="0.424965625"/>
<vertex x="2.760953125" y="0.585990625"/>
<vertex x="2.821721875" y="0.758409375"/>
<vertex x="2.84375" y="0.9456375"/>
<vertex x="2.841475" y="1.025771875"/>
<vertex x="2.831596875" y="1.105525"/>
<vertex x="2.814503125" y="1.18375625"/>
<vertex x="2.7902" y="1.259328125"/>
<vertex x="2.760953125" y="1.332246875"/>
<vertex x="2.727159375" y="1.40250625"/>
<vertex x="2.685765625" y="1.47010625"/>
<vertex x="2.637153125" y="1.533903125"/>
<vertex x="2.58626875" y="1.59466875"/>
<vertex x="2.525503125" y="1.650503125"/>
<vertex x="2.4598" y="1.70404375"/>
<vertex x="2.38915625" y="1.752653125"/>
<vertex x="2.31396875" y="1.796334375"/>
<vertex x="2.233834375" y="1.832796875"/>
<vertex x="2.14876875" y="1.86696875"/>
<vertex x="2.05875625" y="1.89355625"/>
<vertex x="2.146103125" y="1.917865625"/>
<vertex x="2.228896875" y="1.94938125"/>
<vertex x="2.304090625" y="1.98584375"/>
<vertex x="2.377003125" y="2.027240625"/>
<vertex x="2.44270625" y="2.07356875"/>
<vertex x="2.505746875" y="2.124459375"/>
<vertex x="2.566509375" y="2.180284375"/>
<vertex x="2.622725" y="2.24105"/>
<vertex x="2.719946875" y="2.36751875"/>
<vertex x="2.787925" y="2.501196875"/>
<vertex x="2.829321875" y="2.644746875"/>
<vertex x="2.84375" y="2.792865625"/>
<vertex x="2.84375" y="2.841475"/>
<vertex x="2.821721875" y="3.025659375"/>
<vertex x="2.760953125" y="3.201121875"/>
<vertex x="2.656521875" y="3.359103125"/>
<vertex x="2.508409375" y="3.50759375"/>
<vertex x="2.33105625" y="3.631403125"/>
<vertex x="2.138890625" y="3.718371875"/>
<vertex x="1.93229375" y="3.7723"/>
<vertex x="1.708603125" y="3.78939375"/>
</polygon>
<polygon width="0" layer="100">
<vertex x="3.414928125" y="3.78939375"/>
<vertex x="3.414928125" y="0.9456375"/>
<vertex x="3.419871875" y="0.8484125"/>
<vertex x="3.436959375" y="0.75309375"/>
<vertex x="3.46126875" y="0.666125"/>
<vertex x="3.5" y="0.58105625"/>
<vertex x="3.546334375" y="0.497884375"/>
<vertex x="3.604434375" y="0.420790625"/>
<vertex x="3.672415625" y="0.345215625"/>
<vertex x="3.750271875" y="0.27495625"/>
<vertex x="3.923071875" y="0.153428125"/>
<vertex x="4.114853125" y="0.068359375"/>
<vertex x="4.326390625" y="0.017090625"/>
<vertex x="4.55501875" y="-0.00038125"/>
<vertex x="5.689775" y="-0.00038125"/>
<vertex x="5.689775" y="0.9456375"/>
<vertex x="4.55501875" y="0.9456375"/>
<vertex x="4.496528125" y="0.947534375"/>
<vertex x="4.438040625" y="0.952853125"/>
<vertex x="4.384878125" y="0.96500625"/>
<vertex x="4.328665625" y="0.9821"/>
<vertex x="4.280053125" y="1.00146875"/>
<vertex x="4.234103125" y="1.025771875"/>
<vertex x="4.19043125" y="1.05273125"/>
<vertex x="4.149034375" y="1.08121875"/>
<vertex x="4.112578125" y="1.115778125"/>
<vertex x="4.08105625" y="1.152240625"/>
<vertex x="4.051815625" y="1.188696875"/>
<vertex x="4.02750625" y="1.23008125"/>
<vertex x="4.01041875" y="1.275665625"/>
<vertex x="3.995990625" y="1.322378125"/>
<vertex x="3.988384375" y="1.368703125"/>
<vertex x="3.986109375" y="1.4196"/>
<vertex x="3.986109375" y="1.65543125"/>
<vertex x="5.12353125" y="1.65543125"/>
<vertex x="5.12353125" y="2.131675"/>
<vertex x="3.986109375" y="2.131675"/>
<vertex x="3.986109375" y="2.841475"/>
<vertex x="5.689775" y="2.841475"/>
<vertex x="5.689775" y="3.78939375"/>
</polygon>
<polygon width="0" layer="100">
<vertex x="6.258678125" y="3.78939375"/>
<vertex x="6.258678125" y="0.9456375"/>
<vertex x="6.263621875" y="0.8484125"/>
<vertex x="6.280709375" y="0.75309375"/>
<vertex x="6.30729375" y="0.666125"/>
<vertex x="6.34375" y="0.58105625"/>
<vertex x="6.392359375" y="0.497884375"/>
<vertex x="6.448184375" y="0.420790625"/>
<vertex x="6.516165625" y="0.345215625"/>
<vertex x="6.594021875" y="0.27495625"/>
<vertex x="6.769096875" y="0.153428125"/>
<vertex x="6.96126875" y="0.068359375"/>
<vertex x="7.17016875" y="0.017090625"/>
<vertex x="7.398790625" y="-0.00038125"/>
<vertex x="8.53621875" y="-0.00038125"/>
<vertex x="8.53621875" y="0.9456375"/>
<vertex x="7.398790625" y="0.9456375"/>
<vertex x="7.34026875" y="0.947534375"/>
<vertex x="7.28181875" y="0.952853125"/>
<vertex x="7.22861875" y="0.96500625"/>
<vertex x="7.172409375" y="0.9821"/>
<vertex x="7.12383125" y="1.00146875"/>
<vertex x="7.077840625" y="1.025771875"/>
<vertex x="7.034159375" y="1.05273125"/>
<vertex x="6.995065625" y="1.08121875"/>
<vertex x="6.958603125" y="1.115778125"/>
<vertex x="6.92480625" y="1.152240625"/>
<vertex x="6.897840625" y="1.188696875"/>
<vertex x="6.87353125" y="1.23008125"/>
<vertex x="6.85416875" y="1.275665625"/>
<vertex x="6.842015625" y="1.322378125"/>
<vertex x="6.832134375" y="1.368703125"/>
<vertex x="6.829859375" y="1.4196"/>
<vertex x="6.829859375" y="1.65543125"/>
<vertex x="7.967259375" y="1.65543125"/>
<vertex x="7.967259375" y="2.131675"/>
<vertex x="6.829859375" y="2.131675"/>
<vertex x="6.829859375" y="2.841475"/>
<vertex x="8.53621875" y="2.841475"/>
<vertex x="8.53621875" y="3.78939375"/>
</polygon>
<polygon width="0" layer="100">
<vertex x="9.10245" y="3.78939375"/>
<vertex x="9.10245" y="-0.00038125"/>
<vertex x="9.67358125" y="-0.00038125"/>
<vertex x="9.67358125" y="1.65543125"/>
<vertex x="10.157490625" y="1.65543125"/>
<vertex x="10.157490625" y="2.131675"/>
<vertex x="9.67358125" y="2.131675"/>
<vertex x="9.67358125" y="2.841475"/>
<vertex x="10.157490625" y="2.841475"/>
<vertex x="10.157490625" y="3.78939375"/>
</polygon>
<polygon width="0" layer="100">
<vertex x="10.157490625" y="3.78939375"/>
<vertex x="10.157490625" y="2.841475"/>
<vertex x="10.66793125" y="2.841475"/>
<vertex x="10.711540625" y="2.83919375"/>
<vertex x="10.75298125" y="2.83425"/>
<vertex x="10.79393125" y="2.82438125"/>
<vertex x="10.833059375" y="2.812228125"/>
<vertex x="10.86953125" y="2.79779375"/>
<vertex x="10.906" y="2.778425"/>
<vertex x="10.939740625" y="2.7583"/>
<vertex x="10.969" y="2.733996875"/>
<vertex x="10.998259375" y="2.70969375"/>
<vertex x="11.02255" y="2.683490625"/>
<vertex x="11.04466875" y="2.65195625"/>
<vertex x="11.061259375" y="2.62044375"/>
<vertex x="11.07616875" y="2.588159375"/>
<vertex x="11.08828125" y="2.554740625"/>
<vertex x="11.095490625" y="2.520565625"/>
<vertex x="11.09773125" y="2.484103125"/>
<vertex x="11.095490625" y="2.447646875"/>
<vertex x="11.08828125" y="2.411190625"/>
<vertex x="11.07616875" y="2.379671875"/>
<vertex x="11.061259375" y="2.34510625"/>
<vertex x="11.04466875" y="2.316621875"/>
<vertex x="11.02255" y="2.287375"/>
<vertex x="10.998259375" y="2.260034375"/>
<vertex x="10.969" y="2.233834375"/>
<vertex x="10.939740625" y="2.211425"/>
<vertex x="10.906" y="2.192440625"/>
<vertex x="10.86953125" y="2.173071875"/>
<vertex x="10.833059375" y="2.15863125"/>
<vertex x="10.79393125" y="2.14648125"/>
<vertex x="10.75298125" y="2.13850625"/>
<vertex x="10.711540625" y="2.134328125"/>
<vertex x="10.66793125" y="2.131675"/>
<vertex x="10.157490625" y="2.131675"/>
<vertex x="10.157490625" y="1.65543125"/>
<vertex x="10.811009375" y="1.65543125"/>
<vertex x="10.92531875" y="1.660371875"/>
<vertex x="11.03696875" y="1.67480625"/>
<vertex x="11.14406875" y="1.696828125"/>
<vertex x="11.243540625" y="1.72835"/>
<vertex x="11.3435" y="1.76709375"/>
<vertex x="11.435759375" y="1.815703125"/>
<vertex x="11.52578125" y="1.87115"/>
<vertex x="11.61083125" y="1.937228125"/>
<vertex x="11.75895" y="2.083065625"/>
<vertex x="11.86331875" y="2.243703125"/>
<vertex x="11.926809375" y="2.416128125"/>
<vertex x="11.948440625" y="2.60335"/>
<vertex x="11.948440625" y="2.841475"/>
<vertex x="11.926809375" y="3.025659375"/>
<vertex x="11.86331875" y="3.201121875"/>
<vertex x="11.75895" y="3.359103125"/>
<vertex x="11.61083125" y="3.50759375"/>
<vertex x="11.435759375" y="3.631403125"/>
<vertex x="11.2413" y="3.718371875"/>
<vertex x="11.03473125" y="3.7723"/>
<vertex x="10.811009375" y="3.78939375"/>
</polygon>
</package>
<package name="COPPER2">
<polygon width="0" layer="100">
<vertex x="0" y="1.082684375"/>
<vertex x="0" y="-0.000109375"/>
<vertex x="0.36599375" y="-0.000109375"/>
<vertex x="0.36599375" y="0.27018125"/>
<vertex x="0.16319375" y="0.27018125"/>
<vertex x="0.16319375" y="0.47298125"/>
<vertex x="0.36599375" y="0.47298125"/>
<vertex x="0.36599375" y="0.60905"/>
<vertex x="0.16319375" y="0.60905"/>
<vertex x="0.16319375" y="0.81185"/>
<vertex x="0.36599375" y="0.81185"/>
<vertex x="0.36599375" y="1.082684375"/>
</polygon>
<polygon width="0" layer="100">
<vertex x="0.36599375" y="1.082684375"/>
<vertex x="0.36599375" y="0.81185"/>
<vertex x="0.447265625" y="0.81185"/>
<vertex x="0.45974375" y="0.811196875"/>
<vertex x="0.471571875" y="0.8097875"/>
<vertex x="0.4826375" y="0.806965625"/>
<vertex x="0.49370625" y="0.80349375"/>
<vertex x="0.504884375" y="0.79936875"/>
<vertex x="0.5153" y="0.7938375"/>
<vertex x="0.52430625" y="0.7880875"/>
<vertex x="0.5333125" y="0.781140625"/>
<vertex x="0.541015625" y="0.774196875"/>
<vertex x="0.5479625" y="0.7667125"/>
<vertex x="0.55414375" y="0.757703125"/>
<vertex x="0.559678125" y="0.748696875"/>
<vertex x="0.5639125" y="0.739475"/>
<vertex x="0.566621875" y="0.729925"/>
<vertex x="0.56879375" y="0.7201625"/>
<vertex x="0.56944375" y="0.70974375"/>
<vertex x="0.56879375" y="0.699328125"/>
<vertex x="0.566621875" y="0.6889125"/>
<vertex x="0.5639125" y="0.67990625"/>
<vertex x="0.559678125" y="0.67003125"/>
<vertex x="0.55414375" y="0.661890625"/>
<vertex x="0.5479625" y="0.6535375"/>
<vertex x="0.541015625" y="0.645725"/>
<vertex x="0.5333125" y="0.6382375"/>
<vertex x="0.52430625" y="0.6318375"/>
<vertex x="0.5153" y="0.6264125"/>
<vertex x="0.504884375" y="0.620878125"/>
<vertex x="0.49370625" y="0.616753125"/>
<vertex x="0.4826375" y="0.61328125"/>
<vertex x="0.471571875" y="0.611003125"/>
<vertex x="0.45974375" y="0.609809375"/>
<vertex x="0.447265625" y="0.60905"/>
<vertex x="0.36599375" y="0.60905"/>
<vertex x="0.36599375" y="0.47298125"/>
<vertex x="0.447265625" y="0.47298125"/>
<vertex x="0.45974375" y="0.47298125"/>
<vertex x="0.471571875" y="0.47091875"/>
<vertex x="0.4826375" y="0.468640625"/>
<vertex x="0.49370625" y="0.464628125"/>
<vertex x="0.504884375" y="0.460503125"/>
<vertex x="0.5153" y="0.45561875"/>
<vertex x="0.52430625" y="0.449328125"/>
<vertex x="0.5333125" y="0.443140625"/>
<vertex x="0.541015625" y="0.436196875"/>
<vertex x="0.5479625" y="0.42849375"/>
<vertex x="0.55414375" y="0.42003125"/>
<vertex x="0.559678125" y="0.411134375"/>
<vertex x="0.5639125" y="0.402128125"/>
<vertex x="0.566621875" y="0.392253125"/>
<vertex x="0.56879375" y="0.382703125"/>
<vertex x="0.56944375" y="0.3729375"/>
<vertex x="0.56879375" y="0.362521875"/>
<vertex x="0.566621875" y="0.35210625"/>
<vertex x="0.5639125" y="0.342446875"/>
<vertex x="0.559678125" y="0.332684375"/>
<vertex x="0.55414375" y="0.323675"/>
<vertex x="0.5479625" y="0.315321875"/>
<vertex x="0.541015625" y="0.307725"/>
<vertex x="0.5333125" y="0.300021875"/>
<vertex x="0.52430625" y="0.2938375"/>
<vertex x="0.5153" y="0.2880875"/>
<vertex x="0.504884375" y="0.2826625"/>
<vertex x="0.49370625" y="0.2785375"/>
<vertex x="0.4826375" y="0.275065625"/>
<vertex x="0.471571875" y="0.27224375"/>
<vertex x="0.45974375" y="0.27018125"/>
<vertex x="0.447265625" y="0.27018125"/>
<vertex x="0.36599375" y="0.27018125"/>
<vertex x="0.36599375" y="-0.000109375"/>
<vertex x="0.488171875" y="-0.000109375"/>
<vertex x="0.552734375" y="0.004884375"/>
<vertex x="0.612521875" y="0.01953125"/>
<vertex x="0.667315625" y="0.0444875"/>
<vertex x="0.7166875" y="0.079753125"/>
<vertex x="0.75900625" y="0.12141875"/>
<vertex x="0.78884375" y="0.167425"/>
<vertex x="0.80620625" y="0.2166875"/>
<vertex x="0.8125" y="0.27018125"/>
<vertex x="0.81185" y="0.293078125"/>
<vertex x="0.809028125" y="0.3158625"/>
<vertex x="0.80414375" y="0.338215625"/>
<vertex x="0.7972" y="0.359809375"/>
<vertex x="0.78884375" y="0.380640625"/>
<vertex x="0.7791875" y="0.400715625"/>
<vertex x="0.7673625" y="0.42003125"/>
<vertex x="0.753471875" y="0.438259375"/>
<vertex x="0.738934375" y="0.45561875"/>
<vertex x="0.721571875" y="0.471571875"/>
<vertex x="0.7028" y="0.48686875"/>
<vertex x="0.682615625" y="0.500759375"/>
<vertex x="0.661134375" y="0.5132375"/>
<vertex x="0.6382375" y="0.52365625"/>
<vertex x="0.613934375" y="0.53341875"/>
<vertex x="0.588215625" y="0.541015625"/>
<vertex x="0.613171875" y="0.5479625"/>
<vertex x="0.636828125" y="0.556965625"/>
<vertex x="0.6583125" y="0.567384375"/>
<vertex x="0.67914375" y="0.5792125"/>
<vertex x="0.697915625" y="0.592446875"/>
<vertex x="0.715928125" y="0.6069875"/>
<vertex x="0.7332875" y="0.6229375"/>
<vertex x="0.74935" y="0.6403"/>
<vertex x="0.777128125" y="0.676434375"/>
<vertex x="0.79655" y="0.714628125"/>
<vertex x="0.808378125" y="0.755640625"/>
<vertex x="0.8125" y="0.7979625"/>
<vertex x="0.8125" y="0.81185"/>
<vertex x="0.80620625" y="0.864475"/>
<vertex x="0.78884375" y="0.91460625"/>
<vertex x="0.75900625" y="0.95974375"/>
<vertex x="0.7166875" y="1.00216875"/>
<vertex x="0.666015625" y="1.03754375"/>
<vertex x="0.6111125" y="1.062390625"/>
<vertex x="0.552084375" y="1.0778"/>
<vertex x="0.488171875" y="1.082684375"/>
</polygon>
<polygon width="0" layer="100">
<vertex x="0.97569375" y="1.082684375"/>
<vertex x="0.97569375" y="0.27018125"/>
<vertex x="0.97710625" y="0.242403125"/>
<vertex x="0.9819875" y="0.21516875"/>
<vertex x="0.988934375" y="0.190321875"/>
<vertex x="1" y="0.166015625"/>
<vertex x="1.0132375" y="0.142253125"/>
<vertex x="1.0298375" y="0.120225"/>
<vertex x="1.0492625" y="0.098634375"/>
<vertex x="1.07150625" y="0.078559375"/>
<vertex x="1.120878125" y="0.0438375"/>
<vertex x="1.175671875" y="0.01953125"/>
<vertex x="1.2361125" y="0.004884375"/>
<vertex x="1.301434375" y="-0.000109375"/>
<vertex x="1.62565" y="-0.000109375"/>
<vertex x="1.62565" y="0.27018125"/>
<vertex x="1.301434375" y="0.27018125"/>
<vertex x="1.284721875" y="0.270725"/>
<vertex x="1.2680125" y="0.27224375"/>
<vertex x="1.252821875" y="0.275715625"/>
<vertex x="1.2367625" y="0.2806"/>
<vertex x="1.222871875" y="0.286134375"/>
<vertex x="1.20974375" y="0.293078125"/>
<vertex x="1.197265625" y="0.30078125"/>
<vertex x="1.1854375" y="0.30891875"/>
<vertex x="1.175021875" y="0.31879375"/>
<vertex x="1.166015625" y="0.3292125"/>
<vertex x="1.1576625" y="0.339628125"/>
<vertex x="1.150715625" y="0.351453125"/>
<vertex x="1.145834375" y="0.364475"/>
<vertex x="1.1417125" y="0.377821875"/>
<vertex x="1.1395375" y="0.391059375"/>
<vertex x="1.1388875" y="0.4056"/>
<vertex x="1.1388875" y="0.47298125"/>
<vertex x="1.463865625" y="0.47298125"/>
<vertex x="1.463865625" y="0.60905"/>
<vertex x="1.1388875" y="0.60905"/>
<vertex x="1.1388875" y="0.81185"/>
<vertex x="1.62565" y="0.81185"/>
<vertex x="1.62565" y="1.082684375"/>
</polygon>
<polygon width="0" layer="100">
<vertex x="1.78819375" y="1.082684375"/>
<vertex x="1.78819375" y="0.27018125"/>
<vertex x="1.78960625" y="0.242403125"/>
<vertex x="1.7944875" y="0.21516875"/>
<vertex x="1.802084375" y="0.190321875"/>
<vertex x="1.8125" y="0.166015625"/>
<vertex x="1.8263875" y="0.142253125"/>
<vertex x="1.8423375" y="0.120225"/>
<vertex x="1.8617625" y="0.098634375"/>
<vertex x="1.88400625" y="0.078559375"/>
<vertex x="1.934028125" y="0.0438375"/>
<vertex x="1.988934375" y="0.01953125"/>
<vertex x="2.04861875" y="0.004884375"/>
<vertex x="2.113940625" y="-0.000109375"/>
<vertex x="2.43891875" y="-0.000109375"/>
<vertex x="2.43891875" y="0.27018125"/>
<vertex x="2.113940625" y="0.27018125"/>
<vertex x="2.09721875" y="0.270725"/>
<vertex x="2.08051875" y="0.27224375"/>
<vertex x="2.06531875" y="0.275715625"/>
<vertex x="2.049259375" y="0.2806"/>
<vertex x="2.03538125" y="0.286134375"/>
<vertex x="2.022240625" y="0.293078125"/>
<vertex x="2.009759375" y="0.30078125"/>
<vertex x="1.998590625" y="0.30891875"/>
<vertex x="1.988171875" y="0.31879375"/>
<vertex x="1.978515625" y="0.3292125"/>
<vertex x="1.9708125" y="0.339628125"/>
<vertex x="1.963865625" y="0.351453125"/>
<vertex x="1.958334375" y="0.364475"/>
<vertex x="1.9548625" y="0.377821875"/>
<vertex x="1.9520375" y="0.391059375"/>
<vertex x="1.9513875" y="0.4056"/>
<vertex x="1.9513875" y="0.47298125"/>
<vertex x="2.276359375" y="0.47298125"/>
<vertex x="2.276359375" y="0.60905"/>
<vertex x="1.9513875" y="0.60905"/>
<vertex x="1.9513875" y="0.81185"/>
<vertex x="2.43891875" y="0.81185"/>
<vertex x="2.43891875" y="1.082684375"/>
</polygon>
<polygon width="0" layer="100">
<vertex x="2.6007" y="1.082684375"/>
<vertex x="2.6007" y="-0.000109375"/>
<vertex x="2.76388125" y="-0.000109375"/>
<vertex x="2.76388125" y="0.47298125"/>
<vertex x="2.902140625" y="0.47298125"/>
<vertex x="2.902140625" y="0.60905"/>
<vertex x="2.76388125" y="0.60905"/>
<vertex x="2.76388125" y="0.81185"/>
<vertex x="2.902140625" y="0.81185"/>
<vertex x="2.902140625" y="1.082684375"/>
</polygon>
<polygon width="0" layer="100">
<vertex x="2.902140625" y="1.082684375"/>
<vertex x="2.902140625" y="0.81185"/>
<vertex x="3.04798125" y="0.81185"/>
<vertex x="3.060440625" y="0.811196875"/>
<vertex x="3.07228125" y="0.8097875"/>
<vertex x="3.08398125" y="0.806965625"/>
<vertex x="3.095159375" y="0.80349375"/>
<vertex x="3.10558125" y="0.79936875"/>
<vertex x="3.116" y="0.7938375"/>
<vertex x="3.125640625" y="0.7880875"/>
<vertex x="3.134" y="0.781140625"/>
<vertex x="3.142359375" y="0.774196875"/>
<vertex x="3.1493" y="0.7667125"/>
<vertex x="3.15561875" y="0.757703125"/>
<vertex x="3.160359375" y="0.748696875"/>
<vertex x="3.16461875" y="0.739475"/>
<vertex x="3.16808125" y="0.729925"/>
<vertex x="3.170140625" y="0.7201625"/>
<vertex x="3.17078125" y="0.70974375"/>
<vertex x="3.170140625" y="0.699328125"/>
<vertex x="3.16808125" y="0.6889125"/>
<vertex x="3.16461875" y="0.67990625"/>
<vertex x="3.160359375" y="0.67003125"/>
<vertex x="3.15561875" y="0.661890625"/>
<vertex x="3.1493" y="0.6535375"/>
<vertex x="3.142359375" y="0.645725"/>
<vertex x="3.134" y="0.6382375"/>
<vertex x="3.125640625" y="0.6318375"/>
<vertex x="3.116" y="0.6264125"/>
<vertex x="3.10558125" y="0.620878125"/>
<vertex x="3.095159375" y="0.616753125"/>
<vertex x="3.08398125" y="0.61328125"/>
<vertex x="3.07228125" y="0.611003125"/>
<vertex x="3.060440625" y="0.609809375"/>
<vertex x="3.04798125" y="0.60905"/>
<vertex x="2.902140625" y="0.60905"/>
<vertex x="2.902140625" y="0.47298125"/>
<vertex x="3.088859375" y="0.47298125"/>
<vertex x="3.12151875" y="0.474390625"/>
<vertex x="3.15341875" y="0.478515625"/>
<vertex x="3.18401875" y="0.484809375"/>
<vertex x="3.212440625" y="0.4938125"/>
<vertex x="3.241" y="0.504884375"/>
<vertex x="3.267359375" y="0.518771875"/>
<vertex x="3.29308125" y="0.5346125"/>
<vertex x="3.31738125" y="0.55349375"/>
<vertex x="3.3597" y="0.5951625"/>
<vertex x="3.38951875" y="0.641059375"/>
<vertex x="3.407659375" y="0.690321875"/>
<vertex x="3.413840625" y="0.7438125"/>
<vertex x="3.413840625" y="0.81185"/>
<vertex x="3.407659375" y="0.864475"/>
<vertex x="3.38951875" y="0.91460625"/>
<vertex x="3.3597" y="0.95974375"/>
<vertex x="3.31738125" y="1.00216875"/>
<vertex x="3.267359375" y="1.03754375"/>
<vertex x="3.2118" y="1.062390625"/>
<vertex x="3.15278125" y="1.0778"/>
<vertex x="3.088859375" y="1.082684375"/>
</polygon>
</package>
<package name="COPPER3">
<polygon width="0" layer="100">
<vertex x="0" y="1.624025"/>
<vertex x="0" y="-0.0001625"/>
<vertex x="0.548990625" y="-0.0001625"/>
<vertex x="0.548990625" y="0.405271875"/>
<vertex x="0.244790625" y="0.405271875"/>
<vertex x="0.244790625" y="0.70946875"/>
<vertex x="0.548990625" y="0.70946875"/>
<vertex x="0.548990625" y="0.913575"/>
<vertex x="0.244790625" y="0.913575"/>
<vertex x="0.244790625" y="1.217775"/>
<vertex x="0.548990625" y="1.217775"/>
<vertex x="0.548990625" y="1.624025"/>
</polygon>
<polygon width="0" layer="100">
<vertex x="0.548990625" y="1.624025"/>
<vertex x="0.548990625" y="1.217775"/>
<vertex x="0.6709" y="1.217775"/>
<vertex x="0.689615625" y="1.216796875"/>
<vertex x="0.707359375" y="1.214678125"/>
<vertex x="0.72395625" y="1.21045"/>
<vertex x="0.740559375" y="1.205240625"/>
<vertex x="0.757325" y="1.19905625"/>
<vertex x="0.77295" y="1.190753125"/>
<vertex x="0.786459375" y="1.182128125"/>
<vertex x="0.79996875" y="1.1717125"/>
<vertex x="0.811525" y="1.161296875"/>
<vertex x="0.82194375" y="1.15006875"/>
<vertex x="0.831215625" y="1.136553125"/>
<vertex x="0.839515625" y="1.123046875"/>
<vertex x="0.84586875" y="1.1092125"/>
<vertex x="0.849934375" y="1.0948875"/>
<vertex x="0.853190625" y="1.08024375"/>
<vertex x="0.854165625" y="1.064615625"/>
<vertex x="0.853190625" y="1.048990625"/>
<vertex x="0.849934375" y="1.03336875"/>
<vertex x="0.84586875" y="1.019859375"/>
<vertex x="0.839515625" y="1.00504375"/>
<vertex x="0.831215625" y="0.9928375"/>
<vertex x="0.82194375" y="0.980303125"/>
<vertex x="0.811525" y="0.9685875"/>
<vertex x="0.79996875" y="0.95735625"/>
<vertex x="0.786459375" y="0.947753125"/>
<vertex x="0.77295" y="0.93961875"/>
<vertex x="0.757325" y="0.931315625"/>
<vertex x="0.740559375" y="0.925128125"/>
<vertex x="0.72395625" y="0.91991875"/>
<vertex x="0.707359375" y="0.916503125"/>
<vertex x="0.689615625" y="0.9147125"/>
<vertex x="0.6709" y="0.913575"/>
<vertex x="0.548990625" y="0.913575"/>
<vertex x="0.548990625" y="0.70946875"/>
<vertex x="0.6709" y="0.70946875"/>
<vertex x="0.689615625" y="0.70946875"/>
<vertex x="0.707359375" y="0.70638125"/>
<vertex x="0.72395625" y="0.7029625"/>
<vertex x="0.740559375" y="0.696940625"/>
<vertex x="0.757325" y="0.690753125"/>
<vertex x="0.77295" y="0.68343125"/>
<vertex x="0.786459375" y="0.673990625"/>
<vertex x="0.79996875" y="0.6647125"/>
<vertex x="0.811525" y="0.654296875"/>
<vertex x="0.82194375" y="0.642740625"/>
<vertex x="0.831215625" y="0.63004375"/>
<vertex x="0.839515625" y="0.6167"/>
<vertex x="0.84586875" y="0.603190625"/>
<vertex x="0.849934375" y="0.588378125"/>
<vertex x="0.853190625" y="0.574053125"/>
<vertex x="0.854165625" y="0.55940625"/>
<vertex x="0.853190625" y="0.543784375"/>
<vertex x="0.849934375" y="0.528159375"/>
<vertex x="0.84586875" y="0.513671875"/>
<vertex x="0.839515625" y="0.499025"/>
<vertex x="0.831215625" y="0.4855125"/>
<vertex x="0.82194375" y="0.472984375"/>
<vertex x="0.811525" y="0.4615875"/>
<vertex x="0.79996875" y="0.450034375"/>
<vertex x="0.786459375" y="0.440753125"/>
<vertex x="0.77295" y="0.432128125"/>
<vertex x="0.757325" y="0.42399375"/>
<vertex x="0.740559375" y="0.417803125"/>
<vertex x="0.72395625" y="0.4126"/>
<vertex x="0.707359375" y="0.408365625"/>
<vertex x="0.689615625" y="0.405271875"/>
<vertex x="0.6709" y="0.405271875"/>
<vertex x="0.548990625" y="0.405271875"/>
<vertex x="0.548990625" y="-0.0001625"/>
<vertex x="0.732259375" y="-0.0001625"/>
<vertex x="0.8291" y="0.007325"/>
<vertex x="0.918784375" y="0.029296875"/>
<vertex x="1.000975" y="0.06673125"/>
<vertex x="1.07503125" y="0.119628125"/>
<vertex x="1.138509375" y="0.182128125"/>
<vertex x="1.183265625" y="0.2511375"/>
<vertex x="1.209309375" y="0.32503125"/>
<vertex x="1.21875" y="0.405271875"/>
<vertex x="1.217775" y="0.439615625"/>
<vertex x="1.213540625" y="0.473796875"/>
<vertex x="1.206215625" y="0.507325"/>
<vertex x="1.1958" y="0.5397125"/>
<vertex x="1.183265625" y="0.5709625"/>
<vertex x="1.16878125" y="0.601075"/>
<vertex x="1.15104375" y="0.63004375"/>
<vertex x="1.130209375" y="0.6573875"/>
<vertex x="1.1084" y="0.68343125"/>
<vertex x="1.082359375" y="0.707359375"/>
<vertex x="1.0542" y="0.73030625"/>
<vertex x="1.023925" y="0.7511375"/>
<vertex x="0.9917" y="0.76985625"/>
<vertex x="0.95735625" y="0.785484375"/>
<vertex x="0.9209" y="0.80013125"/>
<vertex x="0.882325" y="0.811525"/>
<vertex x="0.919759375" y="0.82194375"/>
<vertex x="0.955240625" y="0.83545"/>
<vertex x="0.98746875" y="0.851075"/>
<vertex x="1.018715625" y="0.86881875"/>
<vertex x="1.046875" y="0.888671875"/>
<vertex x="1.073890625" y="0.91048125"/>
<vertex x="1.09993125" y="0.93440625"/>
<vertex x="1.124025" y="0.96045"/>
<vertex x="1.165690625" y="1.01465"/>
<vertex x="1.194825" y="1.071940625"/>
<vertex x="1.212565625" y="1.1334625"/>
<vertex x="1.21875" y="1.19694375"/>
<vertex x="1.21875" y="1.217775"/>
<vertex x="1.209309375" y="1.2967125"/>
<vertex x="1.183265625" y="1.371909375"/>
<vertex x="1.138509375" y="1.439615625"/>
<vertex x="1.07503125" y="1.50325625"/>
<vertex x="0.999025" y="1.556315625"/>
<vertex x="0.91666875" y="1.5935875"/>
<vertex x="0.828125" y="1.6167"/>
<vertex x="0.732259375" y="1.624025"/>
</polygon>
<polygon width="0" layer="100">
<vertex x="1.463540625" y="1.624025"/>
<vertex x="1.463540625" y="0.405271875"/>
<vertex x="1.465659375" y="0.36360625"/>
<vertex x="1.47298125" y="0.32275625"/>
<vertex x="1.4834" y="0.28548125"/>
<vertex x="1.5" y="0.249021875"/>
<vertex x="1.51985625" y="0.213378125"/>
<vertex x="1.54475625" y="0.1803375"/>
<vertex x="1.57389375" y="0.14795"/>
<vertex x="1.607259375" y="0.1178375"/>
<vertex x="1.681315625" y="0.06575625"/>
<vertex x="1.763509375" y="0.029296875"/>
<vertex x="1.85416875" y="0.007325"/>
<vertex x="1.95215" y="-0.0001625"/>
<vertex x="2.438475" y="-0.0001625"/>
<vertex x="2.438475" y="0.405271875"/>
<vertex x="1.95215" y="0.405271875"/>
<vertex x="1.927084375" y="0.4060875"/>
<vertex x="1.90201875" y="0.408365625"/>
<vertex x="1.879234375" y="0.413575"/>
<vertex x="1.85514375" y="0.4209"/>
<vertex x="1.834309375" y="0.4292"/>
<vertex x="1.814615625" y="0.439615625"/>
<vertex x="1.7959" y="0.45116875"/>
<vertex x="1.77815625" y="0.46338125"/>
<vertex x="1.762534375" y="0.478190625"/>
<vertex x="1.749025" y="0.49381875"/>
<vertex x="1.73649375" y="0.509440625"/>
<vertex x="1.726075" y="0.527178125"/>
<vertex x="1.71875" y="0.5467125"/>
<vertex x="1.71256875" y="0.566734375"/>
<vertex x="1.70930625" y="0.5865875"/>
<vertex x="1.70833125" y="0.6084"/>
<vertex x="1.70833125" y="0.70946875"/>
<vertex x="2.1958" y="0.70946875"/>
<vertex x="2.1958" y="0.913575"/>
<vertex x="1.70833125" y="0.913575"/>
<vertex x="1.70833125" y="1.217775"/>
<vertex x="2.438475" y="1.217775"/>
<vertex x="2.438475" y="1.624025"/>
</polygon>
<polygon width="0" layer="100">
<vertex x="2.682290625" y="1.624025"/>
<vertex x="2.682290625" y="0.405271875"/>
<vertex x="2.684409375" y="0.36360625"/>
<vertex x="2.69173125" y="0.32275625"/>
<vertex x="2.703125" y="0.28548125"/>
<vertex x="2.71875" y="0.249021875"/>
<vertex x="2.73958125" y="0.213378125"/>
<vertex x="2.76350625" y="0.1803375"/>
<vertex x="2.79264375" y="0.14795"/>
<vertex x="2.826009375" y="0.1178375"/>
<vertex x="2.901040625" y="0.06575625"/>
<vertex x="2.9834" y="0.029296875"/>
<vertex x="3.07293125" y="0.007325"/>
<vertex x="3.170909375" y="-0.0001625"/>
<vertex x="3.65838125" y="-0.0001625"/>
<vertex x="3.65838125" y="0.405271875"/>
<vertex x="3.170909375" y="0.405271875"/>
<vertex x="3.14583125" y="0.4060875"/>
<vertex x="3.12078125" y="0.408365625"/>
<vertex x="3.09798125" y="0.413575"/>
<vertex x="3.073890625" y="0.4209"/>
<vertex x="3.05306875" y="0.4292"/>
<vertex x="3.033359375" y="0.439615625"/>
<vertex x="3.014640625" y="0.45116875"/>
<vertex x="2.997884375" y="0.46338125"/>
<vertex x="2.982259375" y="0.478190625"/>
<vertex x="2.967775" y="0.49381875"/>
<vertex x="2.95621875" y="0.509440625"/>
<vertex x="2.9458" y="0.527178125"/>
<vertex x="2.9375" y="0.5467125"/>
<vertex x="2.93229375" y="0.566734375"/>
<vertex x="2.92805625" y="0.5865875"/>
<vertex x="2.92708125" y="0.6084"/>
<vertex x="2.92708125" y="0.70946875"/>
<vertex x="3.414540625" y="0.70946875"/>
<vertex x="3.414540625" y="0.913575"/>
<vertex x="2.92708125" y="0.913575"/>
<vertex x="2.92708125" y="1.217775"/>
<vertex x="3.65838125" y="1.217775"/>
<vertex x="3.65838125" y="1.624025"/>
</polygon>
<polygon width="0" layer="100">
<vertex x="3.90105" y="1.624025"/>
<vertex x="3.90105" y="-0.0001625"/>
<vertex x="4.14581875" y="-0.0001625"/>
<vertex x="4.14581875" y="0.70946875"/>
<vertex x="4.353209375" y="0.70946875"/>
<vertex x="4.353209375" y="0.913575"/>
<vertex x="4.14581875" y="0.913575"/>
<vertex x="4.14581875" y="1.217775"/>
<vertex x="4.353209375" y="1.217775"/>
<vertex x="4.353209375" y="1.624025"/>
</polygon>
<polygon width="0" layer="100">
<vertex x="4.353209375" y="1.624025"/>
<vertex x="4.353209375" y="1.217775"/>
<vertex x="4.57196875" y="1.217775"/>
<vertex x="4.590659375" y="1.216796875"/>
<vertex x="4.60841875" y="1.214678125"/>
<vertex x="4.62596875" y="1.21045"/>
<vertex x="4.642740625" y="1.205240625"/>
<vertex x="4.65836875" y="1.19905625"/>
<vertex x="4.674" y="1.190753125"/>
<vertex x="4.688459375" y="1.182128125"/>
<vertex x="4.701" y="1.1717125"/>
<vertex x="4.713540625" y="1.161296875"/>
<vertex x="4.72395" y="1.15006875"/>
<vertex x="4.73343125" y="1.136553125"/>
<vertex x="4.740540625" y="1.123046875"/>
<vertex x="4.74693125" y="1.1092125"/>
<vertex x="4.75211875" y="1.0948875"/>
<vertex x="4.755209375" y="1.08024375"/>
<vertex x="4.75616875" y="1.064615625"/>
<vertex x="4.755209375" y="1.048990625"/>
<vertex x="4.75211875" y="1.03336875"/>
<vertex x="4.74693125" y="1.019859375"/>
<vertex x="4.740540625" y="1.00504375"/>
<vertex x="4.73343125" y="0.9928375"/>
<vertex x="4.72395" y="0.980303125"/>
<vertex x="4.713540625" y="0.9685875"/>
<vertex x="4.701" y="0.95735625"/>
<vertex x="4.688459375" y="0.947753125"/>
<vertex x="4.674" y="0.93961875"/>
<vertex x="4.65836875" y="0.931315625"/>
<vertex x="4.642740625" y="0.925128125"/>
<vertex x="4.62596875" y="0.91991875"/>
<vertex x="4.60841875" y="0.916503125"/>
<vertex x="4.590659375" y="0.9147125"/>
<vertex x="4.57196875" y="0.913575"/>
<vertex x="4.353209375" y="0.913575"/>
<vertex x="4.353209375" y="0.70946875"/>
<vertex x="4.633290625" y="0.70946875"/>
<vertex x="4.68228125" y="0.7115875"/>
<vertex x="4.73013125" y="0.717775"/>
<vertex x="4.77603125" y="0.7272125"/>
<vertex x="4.818659375" y="0.740721875"/>
<vertex x="4.8615" y="0.757325"/>
<vertex x="4.901040625" y="0.778159375"/>
<vertex x="4.93961875" y="0.801921875"/>
<vertex x="4.97606875" y="0.830240625"/>
<vertex x="5.03955" y="0.89274375"/>
<vertex x="5.08428125" y="0.9615875"/>
<vertex x="5.111490625" y="1.035484375"/>
<vertex x="5.120759375" y="1.115721875"/>
<vertex x="5.120759375" y="1.217775"/>
<vertex x="5.111490625" y="1.2967125"/>
<vertex x="5.08428125" y="1.371909375"/>
<vertex x="5.03955" y="1.439615625"/>
<vertex x="4.97606875" y="1.50325625"/>
<vertex x="4.901040625" y="1.556315625"/>
<vertex x="4.8177" y="1.5935875"/>
<vertex x="4.72916875" y="1.6167"/>
<vertex x="4.633290625" y="1.624025"/>
</polygon>
</package>
<package name="COPPER1">
<polygon width="0" layer="100">
<vertex x="0" y="0.541340625"/>
<vertex x="0" y="-0.000053125"/>
<vertex x="0.182996875" y="-0.000053125"/>
<vertex x="0.182996875" y="0.135090625"/>
<vertex x="0.081596875" y="0.135090625"/>
<vertex x="0.081596875" y="0.236490625"/>
<vertex x="0.182996875" y="0.236490625"/>
<vertex x="0.182996875" y="0.304525"/>
<vertex x="0.081596875" y="0.304525"/>
<vertex x="0.081596875" y="0.405925"/>
<vertex x="0.182996875" y="0.405925"/>
<vertex x="0.182996875" y="0.541340625"/>
</polygon>
<polygon width="0" layer="100">
<vertex x="0.182996875" y="0.541340625"/>
<vertex x="0.182996875" y="0.405925"/>
<vertex x="0.223634375" y="0.405925"/>
<vertex x="0.229871875" y="0.4056"/>
<vertex x="0.2357875" y="0.40489375"/>
<vertex x="0.24131875" y="0.403484375"/>
<vertex x="0.246853125" y="0.401746875"/>
<vertex x="0.252440625" y="0.399684375"/>
<vertex x="0.25765" y="0.39691875"/>
<vertex x="0.262153125" y="0.39404375"/>
<vertex x="0.26665625" y="0.390571875"/>
<vertex x="0.270509375" y="0.3871"/>
<vertex x="0.27398125" y="0.38335625"/>
<vertex x="0.277071875" y="0.37885"/>
<vertex x="0.2798375" y="0.37435"/>
<vertex x="0.28195625" y="0.3697375"/>
<vertex x="0.2833125" y="0.3649625"/>
<vertex x="0.284396875" y="0.36008125"/>
<vertex x="0.284721875" y="0.354871875"/>
<vertex x="0.284396875" y="0.3496625"/>
<vertex x="0.2833125" y="0.34445625"/>
<vertex x="0.28195625" y="0.339953125"/>
<vertex x="0.2798375" y="0.335015625"/>
<vertex x="0.277071875" y="0.330946875"/>
<vertex x="0.27398125" y="0.32676875"/>
<vertex x="0.270509375" y="0.3228625"/>
<vertex x="0.26665625" y="0.31911875"/>
<vertex x="0.262153125" y="0.31591875"/>
<vertex x="0.25765" y="0.31320625"/>
<vertex x="0.252440625" y="0.3104375"/>
<vertex x="0.246853125" y="0.308375"/>
<vertex x="0.24131875" y="0.306640625"/>
<vertex x="0.2357875" y="0.3055"/>
<vertex x="0.229871875" y="0.304903125"/>
<vertex x="0.223634375" y="0.304525"/>
<vertex x="0.182996875" y="0.304525"/>
<vertex x="0.182996875" y="0.236490625"/>
<vertex x="0.223634375" y="0.236490625"/>
<vertex x="0.229871875" y="0.236490625"/>
<vertex x="0.2357875" y="0.235459375"/>
<vertex x="0.24131875" y="0.234321875"/>
<vertex x="0.246853125" y="0.2323125"/>
<vertex x="0.252440625" y="0.23025"/>
<vertex x="0.25765" y="0.227809375"/>
<vertex x="0.262153125" y="0.2246625"/>
<vertex x="0.26665625" y="0.221571875"/>
<vertex x="0.270509375" y="0.2181"/>
<vertex x="0.27398125" y="0.214246875"/>
<vertex x="0.277071875" y="0.210015625"/>
<vertex x="0.2798375" y="0.205565625"/>
<vertex x="0.28195625" y="0.2010625"/>
<vertex x="0.2833125" y="0.196125"/>
<vertex x="0.284396875" y="0.19135"/>
<vertex x="0.284721875" y="0.18646875"/>
<vertex x="0.284396875" y="0.1812625"/>
<vertex x="0.2833125" y="0.176053125"/>
<vertex x="0.28195625" y="0.171225"/>
<vertex x="0.2798375" y="0.166340625"/>
<vertex x="0.277071875" y="0.1618375"/>
<vertex x="0.27398125" y="0.1576625"/>
<vertex x="0.270509375" y="0.1538625"/>
<vertex x="0.26665625" y="0.1500125"/>
<vertex x="0.262153125" y="0.14691875"/>
<vertex x="0.25765" y="0.14404375"/>
<vertex x="0.252440625" y="0.14133125"/>
<vertex x="0.246853125" y="0.13926875"/>
<vertex x="0.24131875" y="0.137534375"/>
<vertex x="0.2357875" y="0.136121875"/>
<vertex x="0.229871875" y="0.135090625"/>
<vertex x="0.223634375" y="0.135090625"/>
<vertex x="0.182996875" y="0.135090625"/>
<vertex x="0.182996875" y="-0.000053125"/>
<vertex x="0.2440875" y="-0.000053125"/>
<vertex x="0.276365625" y="0.002440625"/>
<vertex x="0.3062625" y="0.009765625"/>
<vertex x="0.333659375" y="0.02224375"/>
<vertex x="0.35834375" y="0.039875"/>
<vertex x="0.379503125" y="0.060709375"/>
<vertex x="0.394421875" y="0.0837125"/>
<vertex x="0.403103125" y="0.10834375"/>
<vertex x="0.40625" y="0.135090625"/>
<vertex x="0.405925" y="0.1465375"/>
<vertex x="0.4045125" y="0.15793125"/>
<vertex x="0.402071875" y="0.169109375"/>
<vertex x="0.3986" y="0.179903125"/>
<vertex x="0.394421875" y="0.190321875"/>
<vertex x="0.38959375" y="0.200359375"/>
<vertex x="0.38368125" y="0.210015625"/>
<vertex x="0.3767375" y="0.219128125"/>
<vertex x="0.369465625" y="0.227809375"/>
<vertex x="0.3607875" y="0.2357875"/>
<vertex x="0.3514" y="0.243434375"/>
<vertex x="0.341309375" y="0.250378125"/>
<vertex x="0.330565625" y="0.25661875"/>
<vertex x="0.31911875" y="0.261828125"/>
<vertex x="0.306965625" y="0.266709375"/>
<vertex x="0.294109375" y="0.270509375"/>
<vertex x="0.3065875" y="0.27398125"/>
<vertex x="0.3184125" y="0.278484375"/>
<vertex x="0.32915625" y="0.283690625"/>
<vertex x="0.339571875" y="0.28960625"/>
<vertex x="0.348959375" y="0.296225"/>
<vertex x="0.3579625" y="0.30349375"/>
<vertex x="0.36664375" y="0.31146875"/>
<vertex x="0.374675" y="0.32015"/>
<vertex x="0.3885625" y="0.338215625"/>
<vertex x="0.398275" y="0.3573125"/>
<vertex x="0.4041875" y="0.377821875"/>
<vertex x="0.40625" y="0.39898125"/>
<vertex x="0.40625" y="0.405925"/>
<vertex x="0.403103125" y="0.4322375"/>
<vertex x="0.394421875" y="0.457303125"/>
<vertex x="0.379503125" y="0.479871875"/>
<vertex x="0.35834375" y="0.501084375"/>
<vertex x="0.333009375" y="0.518771875"/>
<vertex x="0.30555625" y="0.531196875"/>
<vertex x="0.276040625" y="0.5389"/>
<vertex x="0.2440875" y="0.541340625"/>
</polygon>
<polygon width="0" layer="100">
<vertex x="0.487846875" y="0.541340625"/>
<vertex x="0.487846875" y="0.135090625"/>
<vertex x="0.488553125" y="0.121203125"/>
<vertex x="0.49099375" y="0.107584375"/>
<vertex x="0.494465625" y="0.0951625"/>
<vertex x="0.5" y="0.083009375"/>
<vertex x="0.50661875" y="0.071125"/>
<vertex x="0.51491875" y="0.0601125"/>
<vertex x="0.52463125" y="0.049315625"/>
<vertex x="0.535753125" y="0.039278125"/>
<vertex x="0.5604375" y="0.02191875"/>
<vertex x="0.5878375" y="0.009765625"/>
<vertex x="0.61805625" y="0.002440625"/>
<vertex x="0.650715625" y="-0.000053125"/>
<vertex x="0.812825" y="-0.000053125"/>
<vertex x="0.812825" y="0.135090625"/>
<vertex x="0.650715625" y="0.135090625"/>
<vertex x="0.6423625" y="0.1353625"/>
<vertex x="0.63400625" y="0.136121875"/>
<vertex x="0.6264125" y="0.137859375"/>
<vertex x="0.61838125" y="0.1403"/>
<vertex x="0.6114375" y="0.143065625"/>
<vertex x="0.604871875" y="0.1465375"/>
<vertex x="0.598634375" y="0.150390625"/>
<vertex x="0.59271875" y="0.154459375"/>
<vertex x="0.5875125" y="0.159396875"/>
<vertex x="0.583009375" y="0.16460625"/>
<vertex x="0.57883125" y="0.1698125"/>
<vertex x="0.575359375" y="0.175725"/>
<vertex x="0.572915625" y="0.1822375"/>
<vertex x="0.57085625" y="0.1889125"/>
<vertex x="0.56976875" y="0.195528125"/>
<vertex x="0.56944375" y="0.2028"/>
<vertex x="0.56944375" y="0.236490625"/>
<vertex x="0.731934375" y="0.236490625"/>
<vertex x="0.731934375" y="0.304525"/>
<vertex x="0.56944375" y="0.304525"/>
<vertex x="0.56944375" y="0.405925"/>
<vertex x="0.812825" y="0.405925"/>
<vertex x="0.812825" y="0.541340625"/>
</polygon>
<polygon width="0" layer="100">
<vertex x="0.894096875" y="0.541340625"/>
<vertex x="0.894096875" y="0.135090625"/>
<vertex x="0.894803125" y="0.121203125"/>
<vertex x="0.89724375" y="0.107584375"/>
<vertex x="0.901040625" y="0.0951625"/>
<vertex x="0.90625" y="0.083009375"/>
<vertex x="0.91319375" y="0.071125"/>
<vertex x="0.92116875" y="0.0601125"/>
<vertex x="0.93088125" y="0.049315625"/>
<vertex x="0.942003125" y="0.039278125"/>
<vertex x="0.9670125" y="0.02191875"/>
<vertex x="0.994465625" y="0.009765625"/>
<vertex x="1.024309375" y="0.002440625"/>
<vertex x="1.05696875" y="-0.000053125"/>
<vertex x="1.219459375" y="-0.000053125"/>
<vertex x="1.219459375" y="0.135090625"/>
<vertex x="1.05696875" y="0.135090625"/>
<vertex x="1.048609375" y="0.1353625"/>
<vertex x="1.040259375" y="0.136121875"/>
<vertex x="1.032659375" y="0.137859375"/>
<vertex x="1.02463125" y="0.1403"/>
<vertex x="1.017690625" y="0.143065625"/>
<vertex x="1.01111875" y="0.1465375"/>
<vertex x="1.00488125" y="0.150390625"/>
<vertex x="0.99929375" y="0.154459375"/>
<vertex x="0.9940875" y="0.159396875"/>
<vertex x="0.989259375" y="0.16460625"/>
<vertex x="0.98540625" y="0.1698125"/>
<vertex x="0.981934375" y="0.175725"/>
<vertex x="0.979165625" y="0.1822375"/>
<vertex x="0.97743125" y="0.1889125"/>
<vertex x="0.97601875" y="0.195528125"/>
<vertex x="0.97569375" y="0.2028"/>
<vertex x="0.97569375" y="0.236490625"/>
<vertex x="1.13818125" y="0.236490625"/>
<vertex x="1.13818125" y="0.304525"/>
<vertex x="0.97569375" y="0.304525"/>
<vertex x="0.97569375" y="0.405925"/>
<vertex x="1.219459375" y="0.405925"/>
<vertex x="1.219459375" y="0.541340625"/>
</polygon>
<polygon width="0" layer="100">
<vertex x="1.30035" y="0.541340625"/>
<vertex x="1.30035" y="-0.000053125"/>
<vertex x="1.381940625" y="-0.000053125"/>
<vertex x="1.381940625" y="0.236490625"/>
<vertex x="1.45106875" y="0.236490625"/>
<vertex x="1.45106875" y="0.304525"/>
<vertex x="1.381940625" y="0.304525"/>
<vertex x="1.381940625" y="0.405925"/>
<vertex x="1.45106875" y="0.405925"/>
<vertex x="1.45106875" y="0.541340625"/>
</polygon>
<polygon width="0" layer="100">
<vertex x="1.45106875" y="0.541340625"/>
<vertex x="1.45106875" y="0.405925"/>
<vertex x="1.523990625" y="0.405925"/>
<vertex x="1.53021875" y="0.4056"/>
<vertex x="1.536140625" y="0.40489375"/>
<vertex x="1.541990625" y="0.403484375"/>
<vertex x="1.54758125" y="0.401746875"/>
<vertex x="1.552790625" y="0.399684375"/>
<vertex x="1.558" y="0.39691875"/>
<vertex x="1.56281875" y="0.39404375"/>
<vertex x="1.567" y="0.390571875"/>
<vertex x="1.57118125" y="0.3871"/>
<vertex x="1.57465" y="0.38335625"/>
<vertex x="1.577809375" y="0.37885"/>
<vertex x="1.58018125" y="0.37435"/>
<vertex x="1.582309375" y="0.3697375"/>
<vertex x="1.584040625" y="0.3649625"/>
<vertex x="1.58506875" y="0.36008125"/>
<vertex x="1.585390625" y="0.354871875"/>
<vertex x="1.58506875" y="0.3496625"/>
<vertex x="1.584040625" y="0.34445625"/>
<vertex x="1.582309375" y="0.339953125"/>
<vertex x="1.58018125" y="0.335015625"/>
<vertex x="1.577809375" y="0.330946875"/>
<vertex x="1.57465" y="0.32676875"/>
<vertex x="1.57118125" y="0.3228625"/>
<vertex x="1.567" y="0.31911875"/>
<vertex x="1.56281875" y="0.31591875"/>
<vertex x="1.558" y="0.31320625"/>
<vertex x="1.552790625" y="0.3104375"/>
<vertex x="1.54758125" y="0.308375"/>
<vertex x="1.541990625" y="0.306640625"/>
<vertex x="1.536140625" y="0.3055"/>
<vertex x="1.53021875" y="0.304903125"/>
<vertex x="1.523990625" y="0.304525"/>
<vertex x="1.45106875" y="0.304525"/>
<vertex x="1.45106875" y="0.236490625"/>
<vertex x="1.54443125" y="0.236490625"/>
<vertex x="1.560759375" y="0.237196875"/>
<vertex x="1.576709375" y="0.239259375"/>
<vertex x="1.592009375" y="0.242403125"/>
<vertex x="1.60621875" y="0.24690625"/>
<vertex x="1.6205" y="0.252440625"/>
<vertex x="1.63368125" y="0.2593875"/>
<vertex x="1.646540625" y="0.26730625"/>
<vertex x="1.658690625" y="0.276746875"/>
<vertex x="1.67985" y="0.29758125"/>
<vertex x="1.694759375" y="0.320528125"/>
<vertex x="1.70383125" y="0.3451625"/>
<vertex x="1.70691875" y="0.37190625"/>
<vertex x="1.70691875" y="0.405925"/>
<vertex x="1.70383125" y="0.4322375"/>
<vertex x="1.694759375" y="0.457303125"/>
<vertex x="1.67985" y="0.479871875"/>
<vertex x="1.658690625" y="0.501084375"/>
<vertex x="1.63368125" y="0.518771875"/>
<vertex x="1.6059" y="0.531196875"/>
<vertex x="1.576390625" y="0.5389"/>
<vertex x="1.54443125" y="0.541340625"/>
</polygon>
</package>
<package name="COPPER4">
<polygon width="0" layer="100">
<vertex x="0" y="2.16536875"/>
<vertex x="0" y="-0.000215625"/>
<vertex x="0.7319875" y="-0.000215625"/>
<vertex x="0.7319875" y="0.5403625"/>
<vertex x="0.3263875" y="0.5403625"/>
<vertex x="0.3263875" y="0.945959375"/>
<vertex x="0.7319875" y="0.945959375"/>
<vertex x="0.7319875" y="1.2181"/>
<vertex x="0.3263875" y="1.2181"/>
<vertex x="0.3263875" y="1.6237"/>
<vertex x="0.7319875" y="1.6237"/>
<vertex x="0.7319875" y="2.16536875"/>
</polygon>
<polygon width="0" layer="100">
<vertex x="0.7319875" y="2.16536875"/>
<vertex x="0.7319875" y="1.6237"/>
<vertex x="0.89453125" y="1.6237"/>
<vertex x="0.9194875" y="1.622396875"/>
<vertex x="0.94314375" y="1.619571875"/>
<vertex x="0.965275" y="1.61393125"/>
<vertex x="0.9874125" y="1.6069875"/>
<vertex x="1.00976875" y="1.598740625"/>
<vertex x="1.0306" y="1.587671875"/>
<vertex x="1.0486125" y="1.576171875"/>
<vertex x="1.066625" y="1.562284375"/>
<vertex x="1.08203125" y="1.548396875"/>
<vertex x="1.095925" y="1.533425"/>
<vertex x="1.1082875" y="1.515403125"/>
<vertex x="1.11935625" y="1.497396875"/>
<vertex x="1.127825" y="1.478946875"/>
<vertex x="1.13324375" y="1.459853125"/>
<vertex x="1.1375875" y="1.440325"/>
<vertex x="1.1388875" y="1.4194875"/>
<vertex x="1.1375875" y="1.39865625"/>
<vertex x="1.13324375" y="1.377825"/>
<vertex x="1.127825" y="1.3598125"/>
<vertex x="1.11935625" y="1.340059375"/>
<vertex x="1.1082875" y="1.323784375"/>
<vertex x="1.095925" y="1.307071875"/>
<vertex x="1.08203125" y="1.291446875"/>
<vertex x="1.066625" y="1.276475"/>
<vertex x="1.0486125" y="1.263671875"/>
<vertex x="1.0306" y="1.252825"/>
<vertex x="1.00976875" y="1.24175625"/>
<vertex x="0.9874125" y="1.233503125"/>
<vertex x="0.965275" y="1.226559375"/>
<vertex x="0.94314375" y="1.222003125"/>
<vertex x="0.9194875" y="1.219615625"/>
<vertex x="0.89453125" y="1.2181"/>
<vertex x="0.7319875" y="1.2181"/>
<vertex x="0.7319875" y="0.945959375"/>
<vertex x="0.89453125" y="0.945959375"/>
<vertex x="0.9194875" y="0.945959375"/>
<vertex x="0.94314375" y="0.941840625"/>
<vertex x="0.965275" y="0.937284375"/>
<vertex x="0.9874125" y="0.92925625"/>
<vertex x="1.00976875" y="0.921003125"/>
<vertex x="1.0306" y="0.911240625"/>
<vertex x="1.0486125" y="0.89865625"/>
<vertex x="1.066625" y="0.886284375"/>
<vertex x="1.08203125" y="0.872396875"/>
<vertex x="1.095925" y="0.8569875"/>
<vertex x="1.1082875" y="0.840059375"/>
<vertex x="1.11935625" y="0.82226875"/>
<vertex x="1.127825" y="0.80425625"/>
<vertex x="1.13324375" y="0.784503125"/>
<vertex x="1.1375875" y="0.765403125"/>
<vertex x="1.1388875" y="0.745875"/>
<vertex x="1.1375875" y="0.72504375"/>
<vertex x="1.13324375" y="0.7042125"/>
<vertex x="1.127825" y="0.684896875"/>
<vertex x="1.11935625" y="0.66536875"/>
<vertex x="1.1082875" y="0.647346875"/>
<vertex x="1.095925" y="0.63064375"/>
<vertex x="1.08203125" y="0.615453125"/>
<vertex x="1.066625" y="0.60004375"/>
<vertex x="1.0486125" y="0.587671875"/>
<vertex x="1.0306" y="0.576171875"/>
<vertex x="1.00976875" y="0.565325"/>
<vertex x="0.9874125" y="0.557071875"/>
<vertex x="0.965275" y="0.55013125"/>
<vertex x="0.94314375" y="0.5444875"/>
<vertex x="0.9194875" y="0.5403625"/>
<vertex x="0.89453125" y="0.5403625"/>
<vertex x="0.7319875" y="0.5403625"/>
<vertex x="0.7319875" y="-0.000215625"/>
<vertex x="0.97634375" y="-0.000215625"/>
<vertex x="1.10546875" y="0.009765625"/>
<vertex x="1.22504375" y="0.0390625"/>
<vertex x="1.33463125" y="0.088975"/>
<vertex x="1.433375" y="0.15950625"/>
<vertex x="1.5180125" y="0.2428375"/>
<vertex x="1.5776875" y="0.334853125"/>
<vertex x="1.6124125" y="0.433375"/>
<vertex x="1.625" y="0.5403625"/>
<vertex x="1.6237" y="0.58615625"/>
<vertex x="1.61805625" y="0.631728125"/>
<vertex x="1.6082875" y="0.67643125"/>
<vertex x="1.5944" y="0.719615625"/>
<vertex x="1.5776875" y="0.761284375"/>
<vertex x="1.558375" y="0.80143125"/>
<vertex x="1.534725" y="0.840059375"/>
<vertex x="1.50694375" y="0.876515625"/>
<vertex x="1.47786875" y="0.911240625"/>
<vertex x="1.44314375" y="0.94314375"/>
<vertex x="1.4056" y="0.973740625"/>
<vertex x="1.36523125" y="1.001515625"/>
<vertex x="1.32226875" y="1.026475"/>
<vertex x="1.276475" y="1.0473125"/>
<vertex x="1.22786875" y="1.066840625"/>
<vertex x="1.17643125" y="1.08203125"/>
<vertex x="1.22634375" y="1.095925"/>
<vertex x="1.27365625" y="1.11393125"/>
<vertex x="1.316625" y="1.13476875"/>
<vertex x="1.3582875" y="1.158425"/>
<vertex x="1.39583125" y="1.184896875"/>
<vertex x="1.43185625" y="1.213975"/>
<vertex x="1.466575" y="1.245875"/>
<vertex x="1.4987" y="1.2806"/>
<vertex x="1.55425625" y="1.35286875"/>
<vertex x="1.5931" y="1.42925625"/>
<vertex x="1.61675625" y="1.511284375"/>
<vertex x="1.625" y="1.595925"/>
<vertex x="1.625" y="1.6237"/>
<vertex x="1.6124125" y="1.728946875"/>
<vertex x="1.5776875" y="1.8292125"/>
<vertex x="1.5180125" y="1.9194875"/>
<vertex x="1.433375" y="2.004340625"/>
<vertex x="1.33203125" y="2.0750875"/>
<vertex x="1.222225" y="2.124784375"/>
<vertex x="1.10416875" y="2.1556"/>
<vertex x="0.97634375" y="2.16536875"/>
</polygon>
<polygon width="0" layer="100">
<vertex x="1.9513875" y="2.16536875"/>
<vertex x="1.9513875" y="0.5403625"/>
<vertex x="1.9542125" y="0.484809375"/>
<vertex x="1.963975" y="0.430340625"/>
<vertex x="1.97786875" y="0.380640625"/>
<vertex x="2" y="0.33203125"/>
<vertex x="2.026475" y="0.28450625"/>
<vertex x="2.059675" y="0.24045"/>
<vertex x="2.098525" y="0.197265625"/>
<vertex x="2.1430125" y="0.15711875"/>
<vertex x="2.24175625" y="0.087671875"/>
<vertex x="2.35134375" y="0.0390625"/>
<vertex x="2.472225" y="0.009765625"/>
<vertex x="2.60286875" y="-0.000215625"/>
<vertex x="3.2513" y="-0.000215625"/>
<vertex x="3.2513" y="0.5403625"/>
<vertex x="2.60286875" y="0.5403625"/>
<vertex x="2.56944375" y="0.541446875"/>
<vertex x="2.536025" y="0.5444875"/>
<vertex x="2.50564375" y="0.55143125"/>
<vertex x="2.473525" y="0.5612"/>
<vertex x="2.44574375" y="0.57226875"/>
<vertex x="2.4194875" y="0.58615625"/>
<vertex x="2.39453125" y="0.601559375"/>
<vertex x="2.370875" y="0.617840625"/>
<vertex x="2.35004375" y="0.6375875"/>
<vertex x="2.33203125" y="0.658425"/>
<vertex x="2.315325" y="0.67925625"/>
<vertex x="2.30143125" y="0.702903125"/>
<vertex x="2.29166875" y="0.728953125"/>
<vertex x="2.283425" y="0.75564375"/>
<vertex x="2.279075" y="0.782115625"/>
<vertex x="2.277775" y="0.8112"/>
<vertex x="2.277775" y="0.945959375"/>
<vertex x="2.92773125" y="0.945959375"/>
<vertex x="2.92773125" y="1.2181"/>
<vertex x="2.277775" y="1.2181"/>
<vertex x="2.277775" y="1.6237"/>
<vertex x="3.2513" y="1.6237"/>
<vertex x="3.2513" y="2.16536875"/>
</polygon>
<polygon width="0" layer="100">
<vertex x="3.5763875" y="2.16536875"/>
<vertex x="3.5763875" y="0.5403625"/>
<vertex x="3.5792125" y="0.484809375"/>
<vertex x="3.588975" y="0.430340625"/>
<vertex x="3.60416875" y="0.380640625"/>
<vertex x="3.625" y="0.33203125"/>
<vertex x="3.652775" y="0.28450625"/>
<vertex x="3.684675" y="0.24045"/>
<vertex x="3.723525" y="0.197265625"/>
<vertex x="3.7680125" y="0.15711875"/>
<vertex x="3.86805625" y="0.087671875"/>
<vertex x="3.97786875" y="0.0390625"/>
<vertex x="4.097240625" y="0.009765625"/>
<vertex x="4.22788125" y="-0.000215625"/>
<vertex x="4.877840625" y="-0.000215625"/>
<vertex x="4.877840625" y="0.5403625"/>
<vertex x="4.22788125" y="0.5403625"/>
<vertex x="4.194440625" y="0.541446875"/>
<vertex x="4.161040625" y="0.5444875"/>
<vertex x="4.130640625" y="0.55143125"/>
<vertex x="4.09851875" y="0.5612"/>
<vertex x="4.070759375" y="0.57226875"/>
<vertex x="4.04448125" y="0.58615625"/>
<vertex x="4.01951875" y="0.601559375"/>
<vertex x="3.99718125" y="0.617840625"/>
<vertex x="3.97634375" y="0.6375875"/>
<vertex x="3.95703125" y="0.658425"/>
<vertex x="3.941625" y="0.67925625"/>
<vertex x="3.92773125" y="0.702903125"/>
<vertex x="3.91666875" y="0.728953125"/>
<vertex x="3.909725" y="0.75564375"/>
<vertex x="3.904075" y="0.782115625"/>
<vertex x="3.902775" y="0.8112"/>
<vertex x="3.902775" y="0.945959375"/>
<vertex x="4.55271875" y="0.945959375"/>
<vertex x="4.55271875" y="1.2181"/>
<vertex x="3.902775" y="1.2181"/>
<vertex x="3.902775" y="1.6237"/>
<vertex x="4.877840625" y="1.6237"/>
<vertex x="4.877840625" y="2.16536875"/>
</polygon>
<polygon width="0" layer="100">
<vertex x="5.2014" y="2.16536875"/>
<vertex x="5.2014" y="-0.000215625"/>
<vertex x="5.527759375" y="-0.000215625"/>
<vertex x="5.527759375" y="0.945959375"/>
<vertex x="5.80428125" y="0.945959375"/>
<vertex x="5.80428125" y="1.2181"/>
<vertex x="5.527759375" y="1.2181"/>
<vertex x="5.527759375" y="1.6237"/>
<vertex x="5.80428125" y="1.6237"/>
<vertex x="5.80428125" y="2.16536875"/>
</polygon>
<polygon width="0" layer="100">
<vertex x="5.80428125" y="2.16536875"/>
<vertex x="5.80428125" y="1.6237"/>
<vertex x="6.095959375" y="1.6237"/>
<vertex x="6.12088125" y="1.622396875"/>
<vertex x="6.144559375" y="1.619571875"/>
<vertex x="6.167959375" y="1.61393125"/>
<vertex x="6.19031875" y="1.6069875"/>
<vertex x="6.211159375" y="1.598740625"/>
<vertex x="6.232" y="1.587671875"/>
<vertex x="6.25128125" y="1.576171875"/>
<vertex x="6.268" y="1.562284375"/>
<vertex x="6.28471875" y="1.548396875"/>
<vertex x="6.2986" y="1.533425"/>
<vertex x="6.311240625" y="1.515403125"/>
<vertex x="6.32071875" y="1.497396875"/>
<vertex x="6.329240625" y="1.478946875"/>
<vertex x="6.336159375" y="1.459853125"/>
<vertex x="6.34028125" y="1.440325"/>
<vertex x="6.341559375" y="1.4194875"/>
<vertex x="6.34028125" y="1.39865625"/>
<vertex x="6.336159375" y="1.377825"/>
<vertex x="6.329240625" y="1.3598125"/>
<vertex x="6.32071875" y="1.340059375"/>
<vertex x="6.311240625" y="1.323784375"/>
<vertex x="6.2986" y="1.307071875"/>
<vertex x="6.28471875" y="1.291446875"/>
<vertex x="6.268" y="1.276475"/>
<vertex x="6.25128125" y="1.263671875"/>
<vertex x="6.232" y="1.252825"/>
<vertex x="6.211159375" y="1.24175625"/>
<vertex x="6.19031875" y="1.233503125"/>
<vertex x="6.167959375" y="1.226559375"/>
<vertex x="6.144559375" y="1.222003125"/>
<vertex x="6.12088125" y="1.219615625"/>
<vertex x="6.095959375" y="1.2181"/>
<vertex x="5.80428125" y="1.2181"/>
<vertex x="5.80428125" y="0.945959375"/>
<vertex x="6.17771875" y="0.945959375"/>
<vertex x="6.243040625" y="0.948784375"/>
<vertex x="6.306840625" y="0.95703125"/>
<vertex x="6.368040625" y="0.969615625"/>
<vertex x="6.42488125" y="0.987628125"/>
<vertex x="6.482" y="1.00976875"/>
<vertex x="6.53471875" y="1.03754375"/>
<vertex x="6.586159375" y="1.069228125"/>
<vertex x="6.634759375" y="1.1069875"/>
<vertex x="6.7194" y="1.190325"/>
<vertex x="6.779040625" y="1.282115625"/>
<vertex x="6.81531875" y="1.38064375"/>
<vertex x="6.82768125" y="1.487628125"/>
<vertex x="6.82768125" y="1.6237"/>
<vertex x="6.81531875" y="1.728946875"/>
<vertex x="6.779040625" y="1.8292125"/>
<vertex x="6.7194" y="1.9194875"/>
<vertex x="6.634759375" y="2.004340625"/>
<vertex x="6.53471875" y="2.0750875"/>
<vertex x="6.4236" y="2.124784375"/>
<vertex x="6.305559375" y="2.1556"/>
<vertex x="6.17771875" y="2.16536875"/>
</polygon>
</package>
<package name="COPPER5">
<polygon width="0" layer="100">
<vertex x="0" y="2.706709375"/>
<vertex x="0" y="-0.000271875"/>
<vertex x="0.914984375" y="-0.000271875"/>
<vertex x="0.914984375" y="0.67545625"/>
<vertex x="0.4079875" y="0.67545625"/>
<vertex x="0.4079875" y="1.18245"/>
<vertex x="0.914984375" y="1.18245"/>
<vertex x="0.914984375" y="1.522625"/>
<vertex x="0.4079875" y="1.522625"/>
<vertex x="0.4079875" y="2.029625"/>
<vertex x="0.914984375" y="2.029625"/>
<vertex x="0.914984375" y="2.706709375"/>
</polygon>
<polygon width="0" layer="100">
<vertex x="0.914984375" y="2.706709375"/>
<vertex x="0.914984375" y="2.029625"/>
<vertex x="1.118165625" y="2.029625"/>
<vertex x="1.149359375" y="2.02799375"/>
<vertex x="1.17893125" y="2.024465625"/>
<vertex x="1.20659375" y="2.017415625"/>
<vertex x="1.234265625" y="2.008734375"/>
<vertex x="1.262209375" y="1.998425"/>
<vertex x="1.28825" y="1.984590625"/>
<vertex x="1.310765625" y="1.970215625"/>
<vertex x="1.33328125" y="1.95285625"/>
<vertex x="1.352540625" y="1.93549375"/>
<vertex x="1.36990625" y="1.91678125"/>
<vertex x="1.385359375" y="1.89425625"/>
<vertex x="1.39919375" y="1.87174375"/>
<vertex x="1.40978125" y="1.848684375"/>
<vertex x="1.41655625" y="1.824815625"/>
<vertex x="1.421984375" y="1.80040625"/>
<vertex x="1.423609375" y="1.774359375"/>
<vertex x="1.421984375" y="1.74831875"/>
<vertex x="1.41655625" y="1.72228125"/>
<vertex x="1.40978125" y="1.699765625"/>
<vertex x="1.39919375" y="1.675075"/>
<vertex x="1.385359375" y="1.65473125"/>
<vertex x="1.36990625" y="1.633840625"/>
<vertex x="1.352540625" y="1.614309375"/>
<vertex x="1.33328125" y="1.59559375"/>
<vertex x="1.310765625" y="1.579590625"/>
<vertex x="1.28825" y="1.56603125"/>
<vertex x="1.262209375" y="1.55219375"/>
<vertex x="1.234265625" y="1.54188125"/>
<vertex x="1.20659375" y="1.5332"/>
<vertex x="1.17893125" y="1.52750625"/>
<vertex x="1.149359375" y="1.52451875"/>
<vertex x="1.118165625" y="1.522625"/>
<vertex x="0.914984375" y="1.522625"/>
<vertex x="0.914984375" y="1.18245"/>
<vertex x="1.118165625" y="1.18245"/>
<vertex x="1.149359375" y="1.18245"/>
<vertex x="1.17893125" y="1.1773"/>
<vertex x="1.20659375" y="1.17160625"/>
<vertex x="1.234265625" y="1.16156875"/>
<vertex x="1.262209375" y="1.15125625"/>
<vertex x="1.28825" y="1.13905"/>
<vertex x="1.310765625" y="1.12331875"/>
<vertex x="1.33328125" y="1.10785625"/>
<vertex x="1.352540625" y="1.09049375"/>
<vertex x="1.36990625" y="1.071234375"/>
<vertex x="1.385359375" y="1.050075"/>
<vertex x="1.39919375" y="1.027834375"/>
<vertex x="1.40978125" y="1.00531875"/>
<vertex x="1.41655625" y="0.98063125"/>
<vertex x="1.421984375" y="0.95675625"/>
<vertex x="1.423609375" y="0.93234375"/>
<vertex x="1.421984375" y="0.90630625"/>
<vertex x="1.41655625" y="0.880265625"/>
<vertex x="1.40978125" y="0.85611875"/>
<vertex x="1.39919375" y="0.831709375"/>
<vertex x="1.385359375" y="0.809184375"/>
<vertex x="1.36990625" y="0.78830625"/>
<vertex x="1.352540625" y="0.769315625"/>
<vertex x="1.33328125" y="0.75005625"/>
<vertex x="1.310765625" y="0.734590625"/>
<vertex x="1.28825" y="0.720215625"/>
<vertex x="1.262209375" y="0.70665625"/>
<vertex x="1.234265625" y="0.696340625"/>
<vertex x="1.20659375" y="0.687665625"/>
<vertex x="1.17893125" y="0.680609375"/>
<vertex x="1.149359375" y="0.67545625"/>
<vertex x="1.118165625" y="0.67545625"/>
<vertex x="0.914984375" y="0.67545625"/>
<vertex x="0.914984375" y="-0.000271875"/>
<vertex x="1.22043125" y="-0.000271875"/>
<vertex x="1.381834375" y="0.01220625"/>
<vertex x="1.53130625" y="0.048828125"/>
<vertex x="1.668290625" y="0.11121875"/>
<vertex x="1.79171875" y="0.19938125"/>
<vertex x="1.897515625" y="0.303546875"/>
<vertex x="1.972109375" y="0.418565625"/>
<vertex x="2.015515625" y="0.54171875"/>
<vertex x="2.03125" y="0.67545625"/>
<vertex x="2.029625" y="0.73269375"/>
<vertex x="2.02256875" y="0.789659375"/>
<vertex x="2.010359375" y="0.845540625"/>
<vertex x="1.993" y="0.89951875"/>
<vertex x="1.972109375" y="0.95160625"/>
<vertex x="1.94796875" y="1.001790625"/>
<vertex x="1.91840625" y="1.050075"/>
<vertex x="1.88368125" y="1.09564375"/>
<vertex x="1.847334375" y="1.13905"/>
<vertex x="1.80393125" y="1.17893125"/>
<vertex x="1.757" y="1.217175"/>
<vertex x="1.706540625" y="1.25189375"/>
<vertex x="1.652834375" y="1.28309375"/>
<vertex x="1.59559375" y="1.309140625"/>
<vertex x="1.534834375" y="1.33355"/>
<vertex x="1.470540625" y="1.352540625"/>
<vertex x="1.53293125" y="1.36990625"/>
<vertex x="1.59206875" y="1.392415625"/>
<vertex x="1.64578125" y="1.418459375"/>
<vertex x="1.697859375" y="1.44803125"/>
<vertex x="1.744790625" y="1.48111875"/>
<vertex x="1.78981875" y="1.51746875"/>
<vertex x="1.83321875" y="1.55734375"/>
<vertex x="1.873375" y="1.60075"/>
<vertex x="1.94281875" y="1.691084375"/>
<vertex x="1.991375" y="1.78656875"/>
<vertex x="2.02094375" y="1.88910625"/>
<vertex x="2.03125" y="1.99490625"/>
<vertex x="2.03125" y="2.029625"/>
<vertex x="2.015515625" y="2.161184375"/>
<vertex x="1.972109375" y="2.286515625"/>
<vertex x="1.897515625" y="2.399359375"/>
<vertex x="1.79171875" y="2.505425"/>
<vertex x="1.665040625" y="2.593859375"/>
<vertex x="1.52778125" y="2.65598125"/>
<vertex x="1.380209375" y="2.6945"/>
<vertex x="1.22043125" y="2.706709375"/>
</polygon>
<polygon width="0" layer="100">
<vertex x="2.439234375" y="2.706709375"/>
<vertex x="2.439234375" y="0.67545625"/>
<vertex x="2.442765625" y="0.606009375"/>
<vertex x="2.45496875" y="0.537925"/>
<vertex x="2.472334375" y="0.475803125"/>
<vertex x="2.5" y="0.4150375"/>
<vertex x="2.53309375" y="0.35563125"/>
<vertex x="2.57459375" y="0.3005625"/>
<vertex x="2.62315625" y="0.24658125"/>
<vertex x="2.678765625" y="0.196396875"/>
<vertex x="2.80219375" y="0.109590625"/>
<vertex x="2.93918125" y="0.048828125"/>
<vertex x="3.09028125" y="0.01220625"/>
<vertex x="3.253584375" y="-0.000271875"/>
<vertex x="4.064125" y="-0.000271875"/>
<vertex x="4.064125" y="0.67545625"/>
<vertex x="3.253584375" y="0.67545625"/>
<vertex x="3.21180625" y="0.676809375"/>
<vertex x="3.17003125" y="0.680609375"/>
<vertex x="3.13205625" y="0.689290625"/>
<vertex x="3.09190625" y="0.7015"/>
<vertex x="3.05718125" y="0.715334375"/>
<vertex x="3.024359375" y="0.73269375"/>
<vertex x="2.993165625" y="0.75195"/>
<vertex x="2.96359375" y="0.7723"/>
<vertex x="2.93755625" y="0.796984375"/>
<vertex x="2.915040625" y="0.82303125"/>
<vertex x="2.89415625" y="0.84906875"/>
<vertex x="2.876790625" y="0.87863125"/>
<vertex x="2.864584375" y="0.911190625"/>
<vertex x="2.85428125" y="0.94455625"/>
<vertex x="2.84884375" y="0.97764375"/>
<vertex x="2.84721875" y="1.014"/>
<vertex x="2.84721875" y="1.18245"/>
<vertex x="3.659665625" y="1.18245"/>
<vertex x="3.659665625" y="1.522625"/>
<vertex x="2.84721875" y="1.522625"/>
<vertex x="2.84721875" y="2.029625"/>
<vertex x="4.064125" y="2.029625"/>
<vertex x="4.064125" y="2.706709375"/>
</polygon>
<polygon width="0" layer="100">
<vertex x="4.470484375" y="2.706709375"/>
<vertex x="4.470484375" y="0.67545625"/>
<vertex x="4.474015625" y="0.606009375"/>
<vertex x="4.48621875" y="0.537925"/>
<vertex x="4.505209375" y="0.475803125"/>
<vertex x="4.53125" y="0.4150375"/>
<vertex x="4.56596875" y="0.35563125"/>
<vertex x="4.60584375" y="0.3005625"/>
<vertex x="4.65440625" y="0.24658125"/>
<vertex x="4.710015625" y="0.196396875"/>
<vertex x="4.83506875" y="0.109590625"/>
<vertex x="4.972334375" y="0.048828125"/>
<vertex x="5.12155" y="0.01220625"/>
<vertex x="5.28485" y="-0.000271875"/>
<vertex x="6.0973" y="-0.000271875"/>
<vertex x="6.0973" y="0.67545625"/>
<vertex x="5.28485" y="0.67545625"/>
<vertex x="5.24305" y="0.676809375"/>
<vertex x="5.2013" y="0.680609375"/>
<vertex x="5.1633" y="0.689290625"/>
<vertex x="5.12315" y="0.7015"/>
<vertex x="5.08845" y="0.715334375"/>
<vertex x="5.0556" y="0.73269375"/>
<vertex x="5.0244" y="0.75195"/>
<vertex x="4.996475" y="0.7723"/>
<vertex x="4.97043125" y="0.796984375"/>
<vertex x="4.946290625" y="0.82303125"/>
<vertex x="4.92703125" y="0.84906875"/>
<vertex x="4.909665625" y="0.87863125"/>
<vertex x="4.895834375" y="0.911190625"/>
<vertex x="4.88715625" y="0.94455625"/>
<vertex x="4.88009375" y="0.97764375"/>
<vertex x="4.87846875" y="1.014"/>
<vertex x="4.87846875" y="1.18245"/>
<vertex x="5.6909" y="1.18245"/>
<vertex x="5.6909" y="1.522625"/>
<vertex x="4.87846875" y="1.522625"/>
<vertex x="4.87846875" y="2.029625"/>
<vertex x="6.0973" y="2.029625"/>
<vertex x="6.0973" y="2.706709375"/>
</polygon>
<polygon width="0" layer="100">
<vertex x="6.50175" y="2.706709375"/>
<vertex x="6.50175" y="-0.000271875"/>
<vertex x="6.9097" y="-0.000271875"/>
<vertex x="6.9097" y="1.18245"/>
<vertex x="7.25535" y="1.18245"/>
<vertex x="7.25535" y="1.522625"/>
<vertex x="6.9097" y="1.522625"/>
<vertex x="6.9097" y="2.029625"/>
<vertex x="7.25535" y="2.029625"/>
<vertex x="7.25535" y="2.706709375"/>
</polygon>
<polygon width="0" layer="100">
<vertex x="7.25535" y="2.706709375"/>
<vertex x="7.25535" y="2.029625"/>
<vertex x="7.61995" y="2.029625"/>
<vertex x="7.6511" y="2.02799375"/>
<vertex x="7.6807" y="2.024465625"/>
<vertex x="7.70995" y="2.017415625"/>
<vertex x="7.7379" y="2.008734375"/>
<vertex x="7.76395" y="1.998425"/>
<vertex x="7.79" y="1.984590625"/>
<vertex x="7.8141" y="1.970215625"/>
<vertex x="7.835" y="1.95285625"/>
<vertex x="7.8559" y="1.93549375"/>
<vertex x="7.87325" y="1.91678125"/>
<vertex x="7.88905" y="1.89425625"/>
<vertex x="7.9009" y="1.87174375"/>
<vertex x="7.91155" y="1.848684375"/>
<vertex x="7.9202" y="1.824815625"/>
<vertex x="7.92535" y="1.80040625"/>
<vertex x="7.92695" y="1.774359375"/>
<vertex x="7.92535" y="1.74831875"/>
<vertex x="7.9202" y="1.72228125"/>
<vertex x="7.91155" y="1.699765625"/>
<vertex x="7.9009" y="1.675075"/>
<vertex x="7.88905" y="1.65473125"/>
<vertex x="7.87325" y="1.633840625"/>
<vertex x="7.8559" y="1.614309375"/>
<vertex x="7.835" y="1.59559375"/>
<vertex x="7.8141" y="1.579590625"/>
<vertex x="7.79" y="1.56603125"/>
<vertex x="7.76395" y="1.55219375"/>
<vertex x="7.7379" y="1.54188125"/>
<vertex x="7.70995" y="1.5332"/>
<vertex x="7.6807" y="1.52750625"/>
<vertex x="7.6511" y="1.52451875"/>
<vertex x="7.61995" y="1.522625"/>
<vertex x="7.25535" y="1.522625"/>
<vertex x="7.25535" y="1.18245"/>
<vertex x="7.72215" y="1.18245"/>
<vertex x="7.8038" y="1.18598125"/>
<vertex x="7.88355" y="1.196290625"/>
<vertex x="7.96005" y="1.21201875"/>
<vertex x="8.0311" y="1.234534375"/>
<vertex x="8.1025" y="1.262209375"/>
<vertex x="8.1684" y="1.29693125"/>
<vertex x="8.2327" y="1.336534375"/>
<vertex x="8.29345" y="1.383734375"/>
<vertex x="8.39925" y="1.48790625"/>
<vertex x="8.4738" y="1.60264375"/>
<vertex x="8.51915" y="1.72580625"/>
<vertex x="8.5346" y="1.859534375"/>
<vertex x="8.5346" y="2.029625"/>
<vertex x="8.51915" y="2.161184375"/>
<vertex x="8.4738" y="2.286515625"/>
<vertex x="8.39925" y="2.399359375"/>
<vertex x="8.29345" y="2.505425"/>
<vertex x="8.1684" y="2.593859375"/>
<vertex x="8.0295" y="2.65598125"/>
<vertex x="7.88195" y="2.6945"/>
<vertex x="7.72215" y="2.706709375"/>
</polygon>
</package>
<package name="COPPER6">
<polygon width="0" layer="100">
<vertex x="0" y="3.248053125"/>
<vertex x="0" y="-0.000325"/>
<vertex x="1.09798125" y="-0.000325"/>
<vertex x="1.09798125" y="0.810546875"/>
<vertex x="0.489584375" y="0.810546875"/>
<vertex x="0.489584375" y="1.418940625"/>
<vertex x="1.09798125" y="1.418940625"/>
<vertex x="1.09798125" y="1.82715"/>
<vertex x="0.489584375" y="1.82715"/>
<vertex x="0.489584375" y="2.43555"/>
<vertex x="1.09798125" y="2.43555"/>
<vertex x="1.09798125" y="3.248053125"/>
</polygon>
<polygon width="0" layer="100">
<vertex x="1.09798125" y="3.248053125"/>
<vertex x="1.09798125" y="2.43555"/>
<vertex x="1.341796875" y="2.43555"/>
<vertex x="1.37923125" y="2.43359375"/>
<vertex x="1.414715625" y="2.429359375"/>
<vertex x="1.4479125" y="2.420896875"/>
<vertex x="1.48111875" y="2.41048125"/>
<vertex x="1.514653125" y="2.398109375"/>
<vertex x="1.5459" y="2.381509375"/>
<vertex x="1.57291875" y="2.364259375"/>
<vertex x="1.5999375" y="2.343425"/>
<vertex x="1.623046875" y="2.32259375"/>
<vertex x="1.6438875" y="2.3001375"/>
<vertex x="1.66243125" y="2.27310625"/>
<vertex x="1.679034375" y="2.24609375"/>
<vertex x="1.6917375" y="2.218421875"/>
<vertex x="1.699865625" y="2.189778125"/>
<vertex x="1.70638125" y="2.1604875"/>
<vertex x="1.70833125" y="2.12923125"/>
<vertex x="1.70638125" y="2.097984375"/>
<vertex x="1.699865625" y="2.0667375"/>
<vertex x="1.6917375" y="2.03971875"/>
<vertex x="1.679034375" y="2.010090625"/>
<vertex x="1.66243125" y="1.985675"/>
<vertex x="1.6438875" y="1.960609375"/>
<vertex x="1.623046875" y="1.937171875"/>
<vertex x="1.5999375" y="1.9147125"/>
<vertex x="1.57291875" y="1.895509375"/>
<vertex x="1.5459" y="1.8792375"/>
<vertex x="1.514653125" y="1.862634375"/>
<vertex x="1.48111875" y="1.85025625"/>
<vertex x="1.4479125" y="1.839840625"/>
<vertex x="1.414715625" y="1.83300625"/>
<vertex x="1.37923125" y="1.829425"/>
<vertex x="1.341796875" y="1.82715"/>
<vertex x="1.09798125" y="1.82715"/>
<vertex x="1.09798125" y="1.418940625"/>
<vertex x="1.341796875" y="1.418940625"/>
<vertex x="1.37923125" y="1.418940625"/>
<vertex x="1.414715625" y="1.412759375"/>
<vertex x="1.4479125" y="1.405925"/>
<vertex x="1.48111875" y="1.393884375"/>
<vertex x="1.514653125" y="1.38150625"/>
<vertex x="1.5459" y="1.366859375"/>
<vertex x="1.57291875" y="1.347984375"/>
<vertex x="1.5999375" y="1.329425"/>
<vertex x="1.623046875" y="1.30859375"/>
<vertex x="1.6438875" y="1.28548125"/>
<vertex x="1.66243125" y="1.260090625"/>
<vertex x="1.679034375" y="1.233403125"/>
<vertex x="1.6917375" y="1.206384375"/>
<vertex x="1.699865625" y="1.17675625"/>
<vertex x="1.70638125" y="1.14810625"/>
<vertex x="1.70833125" y="1.1188125"/>
<vertex x="1.70638125" y="1.087565625"/>
<vertex x="1.699865625" y="1.05631875"/>
<vertex x="1.6917375" y="1.02734375"/>
<vertex x="1.679034375" y="0.998053125"/>
<vertex x="1.66243125" y="0.971021875"/>
<vertex x="1.6438875" y="0.945965625"/>
<vertex x="1.623046875" y="0.923178125"/>
<vertex x="1.5999375" y="0.900065625"/>
<vertex x="1.57291875" y="0.881509375"/>
<vertex x="1.5459" y="0.864259375"/>
<vertex x="1.514653125" y="0.8479875"/>
<vertex x="1.48111875" y="0.835609375"/>
<vertex x="1.4479125" y="0.825196875"/>
<vertex x="1.414715625" y="0.81673125"/>
<vertex x="1.37923125" y="0.810546875"/>
<vertex x="1.341796875" y="0.810546875"/>
<vertex x="1.09798125" y="0.810546875"/>
<vertex x="1.09798125" y="-0.000325"/>
<vertex x="1.464515625" y="-0.000325"/>
<vertex x="1.658203125" y="0.014646875"/>
<vertex x="1.837565625" y="0.05859375"/>
<vertex x="2.001946875" y="0.1334625"/>
<vertex x="2.1500625" y="0.23925625"/>
<vertex x="2.27701875" y="0.364259375"/>
<vertex x="2.36653125" y="0.502278125"/>
<vertex x="2.41861875" y="0.6500625"/>
<vertex x="2.4375" y="0.810546875"/>
<vertex x="2.43555" y="0.879234375"/>
<vertex x="2.427084375" y="0.947590625"/>
<vertex x="2.41243125" y="1.014646875"/>
<vertex x="2.3916" y="1.079425"/>
<vertex x="2.36653125" y="1.141925"/>
<vertex x="2.3375625" y="1.202146875"/>
<vertex x="2.3020875" y="1.260090625"/>
<vertex x="2.260415625" y="1.314775"/>
<vertex x="2.216803125" y="1.366859375"/>
<vertex x="2.164715625" y="1.414715625"/>
<vertex x="2.1084" y="1.460609375"/>
<vertex x="2.047846875" y="1.502275"/>
<vertex x="1.983403125" y="1.5397125"/>
<vertex x="1.9147125" y="1.57096875"/>
<vertex x="1.841803125" y="1.600259375"/>
<vertex x="1.764646875" y="1.623046875"/>
<vertex x="1.839515625" y="1.6438875"/>
<vertex x="1.910484375" y="1.670896875"/>
<vertex x="1.9749375" y="1.702153125"/>
<vertex x="2.03743125" y="1.7376375"/>
<vertex x="2.093746875" y="1.77734375"/>
<vertex x="2.147784375" y="1.8209625"/>
<vertex x="2.1998625" y="1.8688125"/>
<vertex x="2.24805" y="1.9209"/>
<vertex x="2.331384375" y="2.029303125"/>
<vertex x="2.38965" y="2.143884375"/>
<vertex x="2.425134375" y="2.266925"/>
<vertex x="2.4375" y="2.3938875"/>
<vertex x="2.4375" y="2.43555"/>
<vertex x="2.41861875" y="2.593421875"/>
<vertex x="2.36653125" y="2.74381875"/>
<vertex x="2.27701875" y="2.87923125"/>
<vertex x="2.1500625" y="3.006509375"/>
<vertex x="1.998046875" y="3.11263125"/>
<vertex x="1.8333375" y="3.187175"/>
<vertex x="1.656253125" y="3.2334"/>
<vertex x="1.464515625" y="3.248053125"/>
</polygon>
<polygon width="0" layer="100">
<vertex x="2.92708125" y="3.248053125"/>
<vertex x="2.92708125" y="0.810546875"/>
<vertex x="2.93131875" y="0.7272125"/>
<vertex x="2.9459625" y="0.645509375"/>
<vertex x="2.966803125" y="0.5709625"/>
<vertex x="3" y="0.498046875"/>
<vertex x="3.0397125" y="0.42675625"/>
<vertex x="3.0895125" y="0.360678125"/>
<vertex x="3.1477875" y="0.295896875"/>
<vertex x="3.21451875" y="0.235675"/>
<vertex x="3.362634375" y="0.131509375"/>
<vertex x="3.527015625" y="0.05859375"/>
<vertex x="3.7083375" y="0.014646875"/>
<vertex x="3.904303125" y="-0.000325"/>
<vertex x="4.87695" y="-0.000325"/>
<vertex x="4.87695" y="0.810546875"/>
<vertex x="3.904303125" y="0.810546875"/>
<vertex x="3.854165625" y="0.812171875"/>
<vertex x="3.8040375" y="0.81673125"/>
<vertex x="3.758465625" y="0.827146875"/>
<vertex x="3.7102875" y="0.8418"/>
<vertex x="3.668615625" y="0.858403125"/>
<vertex x="3.62923125" y="0.879234375"/>
<vertex x="3.591796875" y="0.902340625"/>
<vertex x="3.5563125" y="0.926759375"/>
<vertex x="3.525065625" y="0.95638125"/>
<vertex x="3.498046875" y="0.9876375"/>
<vertex x="3.4729875" y="1.018884375"/>
<vertex x="3.452146875" y="1.05435625"/>
<vertex x="3.437503125" y="1.093428125"/>
<vertex x="3.4251375" y="1.133465625"/>
<vertex x="3.4186125" y="1.173175"/>
<vertex x="3.4166625" y="1.2168"/>
<vertex x="3.4166625" y="1.418940625"/>
<vertex x="4.391596875" y="1.418940625"/>
<vertex x="4.391596875" y="1.82715"/>
<vertex x="3.4166625" y="1.82715"/>
<vertex x="3.4166625" y="2.43555"/>
<vertex x="4.87695" y="2.43555"/>
<vertex x="4.87695" y="3.248053125"/>
</polygon>
<polygon width="0" layer="100">
<vertex x="5.36458125" y="3.248053125"/>
<vertex x="5.36458125" y="0.810546875"/>
<vertex x="5.36881875" y="0.7272125"/>
<vertex x="5.3834625" y="0.645509375"/>
<vertex x="5.406253125" y="0.5709625"/>
<vertex x="5.4375" y="0.498046875"/>
<vertex x="5.4791625" y="0.42675625"/>
<vertex x="5.5270125" y="0.360678125"/>
<vertex x="5.5852875" y="0.295896875"/>
<vertex x="5.65201875" y="0.235675"/>
<vertex x="5.802084375" y="0.131509375"/>
<vertex x="5.966803125" y="0.05859375"/>
<vertex x="6.145859375" y="0.014646875"/>
<vertex x="6.34181875" y="-0.000325"/>
<vertex x="7.316759375" y="-0.000325"/>
<vertex x="7.316759375" y="0.810546875"/>
<vertex x="6.34181875" y="0.810546875"/>
<vertex x="6.291659375" y="0.812171875"/>
<vertex x="6.241559375" y="0.81673125"/>
<vertex x="6.195959375" y="0.827146875"/>
<vertex x="6.14778125" y="0.8418"/>
<vertex x="6.106140625" y="0.858403125"/>
<vertex x="6.06671875" y="0.879234375"/>
<vertex x="6.02928125" y="0.902340625"/>
<vertex x="5.99576875" y="0.926759375"/>
<vertex x="5.964515625" y="0.95638125"/>
<vertex x="5.935546875" y="0.9876375"/>
<vertex x="5.9124375" y="1.018884375"/>
<vertex x="5.891596875" y="1.05435625"/>
<vertex x="5.875003125" y="1.093428125"/>
<vertex x="5.8645875" y="1.133465625"/>
<vertex x="5.8561125" y="1.173175"/>
<vertex x="5.8541625" y="1.2168"/>
<vertex x="5.8541625" y="1.418940625"/>
<vertex x="6.82908125" y="1.418940625"/>
<vertex x="6.82908125" y="1.82715"/>
<vertex x="5.8541625" y="1.82715"/>
<vertex x="5.8541625" y="2.43555"/>
<vertex x="7.316759375" y="2.43555"/>
<vertex x="7.316759375" y="3.248053125"/>
</polygon>
<polygon width="0" layer="100">
<vertex x="7.8021" y="3.248053125"/>
<vertex x="7.8021" y="-0.000325"/>
<vertex x="8.291640625" y="-0.000325"/>
<vertex x="8.291640625" y="1.418940625"/>
<vertex x="8.70641875" y="1.418940625"/>
<vertex x="8.70641875" y="1.82715"/>
<vertex x="8.291640625" y="1.82715"/>
<vertex x="8.291640625" y="2.43555"/>
<vertex x="8.70641875" y="2.43555"/>
<vertex x="8.70641875" y="3.248053125"/>
</polygon>
<polygon width="0" layer="100">
<vertex x="8.70641875" y="3.248053125"/>
<vertex x="8.70641875" y="2.43555"/>
<vertex x="9.143940625" y="2.43555"/>
<vertex x="9.18131875" y="2.43359375"/>
<vertex x="9.216840625" y="2.429359375"/>
<vertex x="9.251940625" y="2.420896875"/>
<vertex x="9.28548125" y="2.41048125"/>
<vertex x="9.316740625" y="2.398109375"/>
<vertex x="9.348" y="2.381509375"/>
<vertex x="9.37691875" y="2.364259375"/>
<vertex x="9.402" y="2.343425"/>
<vertex x="9.42708125" y="2.32259375"/>
<vertex x="9.4479" y="2.3001375"/>
<vertex x="9.466859375" y="2.27310625"/>
<vertex x="9.48108125" y="2.24609375"/>
<vertex x="9.493859375" y="2.218421875"/>
<vertex x="9.504240625" y="2.189778125"/>
<vertex x="9.51041875" y="2.1604875"/>
<vertex x="9.512340625" y="2.12923125"/>
<vertex x="9.51041875" y="2.097984375"/>
<vertex x="9.504240625" y="2.0667375"/>
<vertex x="9.493859375" y="2.03971875"/>
<vertex x="9.48108125" y="2.010090625"/>
<vertex x="9.466859375" y="1.985675"/>
<vertex x="9.4479" y="1.960609375"/>
<vertex x="9.42708125" y="1.937171875"/>
<vertex x="9.402" y="1.9147125"/>
<vertex x="9.37691875" y="1.895509375"/>
<vertex x="9.348" y="1.8792375"/>
<vertex x="9.316740625" y="1.862634375"/>
<vertex x="9.28548125" y="1.85025625"/>
<vertex x="9.251940625" y="1.839840625"/>
<vertex x="9.216840625" y="1.83300625"/>
<vertex x="9.18131875" y="1.829425"/>
<vertex x="9.143940625" y="1.82715"/>
<vertex x="8.70641875" y="1.82715"/>
<vertex x="8.70641875" y="1.418940625"/>
<vertex x="9.26658125" y="1.418940625"/>
<vertex x="9.364559375" y="1.423175"/>
<vertex x="9.460259375" y="1.435546875"/>
<vertex x="9.552059375" y="1.454425"/>
<vertex x="9.63731875" y="1.481440625"/>
<vertex x="9.723" y="1.514653125"/>
<vertex x="9.80208125" y="1.556315625"/>
<vertex x="9.879240625" y="1.603840625"/>
<vertex x="9.952140625" y="1.66048125"/>
<vertex x="10.0791" y="1.7854875"/>
<vertex x="10.168559375" y="1.923175"/>
<vertex x="10.22298125" y="2.070965625"/>
<vertex x="10.24151875" y="2.231440625"/>
<vertex x="10.24151875" y="2.43555"/>
<vertex x="10.22298125" y="2.593421875"/>
<vertex x="10.168559375" y="2.74381875"/>
<vertex x="10.0791" y="2.87923125"/>
<vertex x="9.952140625" y="3.006509375"/>
<vertex x="9.80208125" y="3.11263125"/>
<vertex x="9.6354" y="3.187175"/>
<vertex x="9.458340625" y="3.2334"/>
<vertex x="9.26658125" y="3.248053125"/>
</polygon>
</package>
</packages>
<symbols>
<symbol name="LOGO">
<polygon width="0" layer="95">
<vertex x="-7.62" y="2.87341875"/>
<vertex x="-7.62" y="-2.54054375"/>
<vertex x="-5.79003125" y="-2.54054375"/>
<vertex x="-5.79003125" y="-1.189090625"/>
<vertex x="-6.804028125" y="-1.189090625"/>
<vertex x="-6.804028125" y="-0.1751"/>
<vertex x="-5.79003125" y="-0.1751"/>
<vertex x="-5.79003125" y="0.50525"/>
<vertex x="-6.804028125" y="0.50525"/>
<vertex x="-6.804028125" y="1.51925"/>
<vertex x="-5.79003125" y="1.51925"/>
<vertex x="-5.79003125" y="2.87341875"/>
</polygon>
<polygon width="0" layer="95">
<vertex x="-5.79003125" y="2.87341875"/>
<vertex x="-5.79003125" y="1.51925"/>
<vertex x="-5.38366875" y="1.51925"/>
<vertex x="-5.32128125" y="1.515990625"/>
<vertex x="-5.262140625" y="1.50893125"/>
<vertex x="-5.206809375" y="1.49483125"/>
<vertex x="-5.15146875" y="1.47746875"/>
<vertex x="-5.09558125" y="1.45685"/>
<vertex x="-5.0435" y="1.42918125"/>
<vertex x="-4.99846875" y="1.40043125"/>
<vertex x="-4.953440625" y="1.365709375"/>
<vertex x="-4.91491875" y="1.330990625"/>
<vertex x="-4.880190625" y="1.293559375"/>
<vertex x="-4.84928125" y="1.248509375"/>
<vertex x="-4.821609375" y="1.203490625"/>
<vertex x="-4.800440625" y="1.15736875"/>
<vertex x="-4.786890625" y="1.10963125"/>
<vertex x="-4.77603125" y="1.060809375"/>
<vertex x="-4.77278125" y="1.00871875"/>
<vertex x="-4.77603125" y="0.956640625"/>
<vertex x="-4.786890625" y="0.904559375"/>
<vertex x="-4.800440625" y="0.85953125"/>
<vertex x="-4.821609375" y="0.81015"/>
<vertex x="-4.84928125" y="0.769459375"/>
<vertex x="-4.880190625" y="0.72768125"/>
<vertex x="-4.91491875" y="0.68861875"/>
<vertex x="-4.953440625" y="0.651190625"/>
<vertex x="-4.99846875" y="0.61918125"/>
<vertex x="-5.0435" y="0.592059375"/>
<vertex x="-5.09558125" y="0.564390625"/>
<vertex x="-5.15146875" y="0.543759375"/>
<vertex x="-5.206809375" y="0.5264"/>
<vertex x="-5.262140625" y="0.515009375"/>
<vertex x="-5.32128125" y="0.509040625"/>
<vertex x="-5.38366875" y="0.50525"/>
<vertex x="-5.79003125" y="0.50525"/>
<vertex x="-5.79003125" y="-0.1751"/>
<vertex x="-5.32128125" y="-0.1751"/>
<vertex x="-5.262140625" y="-0.1854"/>
<vertex x="-5.206809375" y="-0.196790625"/>
<vertex x="-5.15146875" y="-0.216859375"/>
<vertex x="-5.09558125" y="-0.237490625"/>
<vertex x="-5.0435" y="-0.2619"/>
<vertex x="-4.99846875" y="-0.293359375"/>
<vertex x="-4.953440625" y="-0.324290625"/>
<vertex x="-4.91491875" y="-0.359009375"/>
<vertex x="-4.880190625" y="-0.39753125"/>
<vertex x="-4.84928125" y="-0.43985"/>
<vertex x="-4.821609375" y="-0.48433125"/>
<vertex x="-4.800440625" y="-0.529359375"/>
<vertex x="-4.786890625" y="-0.578740625"/>
<vertex x="-4.77603125" y="-0.626490625"/>
<vertex x="-4.77278125" y="-0.675309375"/>
<vertex x="-4.77603125" y="-0.727390625"/>
<vertex x="-4.786890625" y="-0.77946875"/>
<vertex x="-4.800440625" y="-0.827759375"/>
<vertex x="-4.821609375" y="-0.87658125"/>
<vertex x="-4.84928125" y="-0.92163125"/>
<vertex x="-4.880190625" y="-0.963390625"/>
<vertex x="-4.91491875" y="-1.00136875"/>
<vertex x="-4.953440625" y="-1.039890625"/>
<vertex x="-4.99846875" y="-1.07081875"/>
<vertex x="-5.0435" y="-1.09956875"/>
<vertex x="-5.09558125" y="-1.126690625"/>
<vertex x="-5.15146875" y="-1.14731875"/>
<vertex x="-5.206809375" y="-1.16466875"/>
<vertex x="-5.262140625" y="-1.17878125"/>
<vertex x="-5.32128125" y="-1.189090625"/>
<vertex x="-5.79003125" y="-1.189090625"/>
<vertex x="-5.79003125" y="-2.54054375"/>
<vertex x="-5.179140625" y="-2.54054375"/>
<vertex x="-4.85633125" y="-2.5155875"/>
<vertex x="-4.557390625" y="-2.44234375"/>
<vertex x="-4.28341875" y="-2.3175625"/>
<vertex x="-4.036559375" y="-2.1412375"/>
<vertex x="-3.82496875" y="-1.932903125"/>
<vertex x="-3.67578125" y="-1.70286875"/>
<vertex x="-3.58896875" y="-1.456559375"/>
<vertex x="-3.5575" y="-1.189090625"/>
<vertex x="-3.56075" y="-1.074609375"/>
<vertex x="-3.574859375" y="-0.96068125"/>
<vertex x="-3.59928125" y="-0.84891875"/>
<vertex x="-3.634" y="-0.740959375"/>
<vertex x="-3.67578125" y="-0.636790625"/>
<vertex x="-3.724059375" y="-0.53641875"/>
<vertex x="-3.783190625" y="-0.43985"/>
<vertex x="-3.852640625" y="-0.348709375"/>
<vertex x="-3.92533125" y="-0.2619"/>
<vertex x="-4.012140625" y="-0.182140625"/>
<vertex x="-4.106" y="-0.10565"/>
<vertex x="-4.20691875" y="-0.036209375"/>
<vertex x="-4.31433125" y="0.026190625"/>
<vertex x="-4.428809375" y="0.07828125"/>
<vertex x="-4.55033125" y="0.1271"/>
<vertex x="-4.67891875" y="0.16508125"/>
<vertex x="-4.554140625" y="0.199809375"/>
<vertex x="-4.435859375" y="0.24483125"/>
<vertex x="-4.328440625" y="0.29691875"/>
<vertex x="-4.22428125" y="0.356059375"/>
<vertex x="-4.13041875" y="0.422240625"/>
<vertex x="-4.040359375" y="0.494940625"/>
<vertex x="-3.953559375" y="0.574690625"/>
<vertex x="-3.87325" y="0.6615"/>
<vertex x="-3.734359375" y="0.84216875"/>
<vertex x="-3.63725" y="1.033140625"/>
<vertex x="-3.578109375" y="1.238209375"/>
<vertex x="-3.5575" y="1.449809375"/>
<vertex x="-3.5575" y="1.51925"/>
<vertex x="-3.58896875" y="1.78236875"/>
<vertex x="-3.67578125" y="2.03303125"/>
<vertex x="-3.82496875" y="2.25871875"/>
<vertex x="-4.036559375" y="2.47085"/>
<vertex x="-4.28991875" y="2.64771875"/>
<vertex x="-4.564440625" y="2.771959375"/>
<vertex x="-4.85958125" y="2.849"/>
<vertex x="-5.179140625" y="2.87341875"/>
</polygon>
<polygon width="0" layer="95">
<vertex x="-2.74153125" y="2.87341875"/>
<vertex x="-2.74153125" y="-1.189090625"/>
<vertex x="-2.73446875" y="-1.32798125"/>
<vertex x="-2.710059375" y="-1.46415"/>
<vertex x="-2.67533125" y="-1.58839375"/>
<vertex x="-2.62" y="-1.709921875"/>
<vertex x="-2.553809375" y="-1.8287375"/>
<vertex x="-2.470809375" y="-1.938871875"/>
<vertex x="-2.373690625" y="-2.0468375"/>
<vertex x="-2.26246875" y="-2.14720625"/>
<vertex x="-2.015609375" y="-2.320815625"/>
<vertex x="-1.741640625" y="-2.44234375"/>
<vertex x="-1.439440625" y="-2.5155875"/>
<vertex x="-1.11283125" y="-2.54054375"/>
<vertex x="0.50825" y="-2.54054375"/>
<vertex x="0.50825" y="-1.189090625"/>
<vertex x="-1.11283125" y="-1.189090625"/>
<vertex x="-1.196390625" y="-1.18638125"/>
<vertex x="-1.279940625" y="-1.17878125"/>
<vertex x="-1.355890625" y="-1.16141875"/>
<vertex x="-1.436190625" y="-1.137"/>
<vertex x="-1.505640625" y="-1.10933125"/>
<vertex x="-1.57128125" y="-1.074609375"/>
<vertex x="-1.63366875" y="-1.0361"/>
<vertex x="-1.692809375" y="-0.9954"/>
<vertex x="-1.744890625" y="-0.94603125"/>
<vertex x="-1.78991875" y="-0.893940625"/>
<vertex x="-1.831690625" y="-0.841859375"/>
<vertex x="-1.86641875" y="-0.782740625"/>
<vertex x="-1.89083125" y="-0.71761875"/>
<vertex x="-1.911440625" y="-0.650890625"/>
<vertex x="-1.922309375" y="-0.584709375"/>
<vertex x="-1.925559375" y="-0.512"/>
<vertex x="-1.925559375" y="-0.1751"/>
<vertex x="-0.30066875" y="-0.1751"/>
<vertex x="-0.30066875" y="0.50525"/>
<vertex x="-1.925559375" y="0.50525"/>
<vertex x="-1.925559375" y="1.51925"/>
<vertex x="0.50825" y="1.51925"/>
<vertex x="0.50825" y="2.87341875"/>
</polygon>
<polygon width="0" layer="95">
<vertex x="1.32096875" y="2.87341875"/>
<vertex x="1.32096875" y="-1.189090625"/>
<vertex x="1.32803125" y="-1.32798125"/>
<vertex x="1.352440625" y="-1.46415"/>
<vertex x="1.39041875" y="-1.58839375"/>
<vertex x="1.4425" y="-1.709921875"/>
<vertex x="1.511940625" y="-1.8287375"/>
<vertex x="1.591690625" y="-1.938871875"/>
<vertex x="1.688809375" y="-2.0468375"/>
<vertex x="1.80003125" y="-2.14720625"/>
<vertex x="2.050140625" y="-2.320815625"/>
<vertex x="2.32466875" y="-2.44234375"/>
<vertex x="2.6231" y="-2.5155875"/>
<vertex x="2.9497" y="-2.54054375"/>
<vertex x="4.5746" y="-2.54054375"/>
<vertex x="4.5746" y="-1.189090625"/>
<vertex x="2.9497" y="-1.189090625"/>
<vertex x="2.8661" y="-1.18638125"/>
<vertex x="2.7826" y="-1.17878125"/>
<vertex x="2.7066" y="-1.16141875"/>
<vertex x="2.6263" y="-1.137"/>
<vertex x="2.5569" y="-1.10933125"/>
<vertex x="2.4912" y="-1.074609375"/>
<vertex x="2.4288" y="-1.0361"/>
<vertex x="2.37295" y="-0.9954"/>
<vertex x="2.320859375" y="-0.94603125"/>
<vertex x="2.27258125" y="-0.893940625"/>
<vertex x="2.234059375" y="-0.841859375"/>
<vertex x="2.19933125" y="-0.782740625"/>
<vertex x="2.17166875" y="-0.71761875"/>
<vertex x="2.154309375" y="-0.650890625"/>
<vertex x="2.140190625" y="-0.584709375"/>
<vertex x="2.136940625" y="-0.512"/>
<vertex x="2.136940625" y="-0.1751"/>
<vertex x="3.7618" y="-0.1751"/>
<vertex x="3.7618" y="0.50525"/>
<vertex x="2.136940625" y="0.50525"/>
<vertex x="2.136940625" y="1.51925"/>
<vertex x="4.5746" y="1.51925"/>
<vertex x="4.5746" y="2.87341875"/>
</polygon>
<polygon width="0" layer="95">
<vertex x="5.3835" y="2.87341875"/>
<vertex x="5.3835" y="-2.54054375"/>
<vertex x="6.1994" y="-2.54054375"/>
<vertex x="6.1994" y="-0.1751"/>
<vertex x="6.8907" y="-0.1751"/>
<vertex x="6.8907" y="0.50525"/>
<vertex x="6.1994" y="0.50525"/>
<vertex x="6.1994" y="1.51925"/>
<vertex x="6.8907" y="1.51925"/>
<vertex x="6.8907" y="2.87341875"/>
</polygon>
<polygon width="0" layer="95">
<vertex x="6.8907" y="2.87341875"/>
<vertex x="6.8907" y="1.51925"/>
<vertex x="7.6199" y="1.51925"/>
<vertex x="7.6822" y="1.515990625"/>
<vertex x="7.7414" y="1.50893125"/>
<vertex x="7.7999" y="1.49483125"/>
<vertex x="7.8558" y="1.47746875"/>
<vertex x="7.9079" y="1.45685"/>
<vertex x="7.96" y="1.42918125"/>
<vertex x="8.0082" y="1.40043125"/>
<vertex x="8.05" y="1.365709375"/>
<vertex x="8.0918" y="1.330990625"/>
<vertex x="8.1265" y="1.293559375"/>
<vertex x="8.1581" y="1.248509375"/>
<vertex x="8.1818" y="1.203490625"/>
<vertex x="8.2031" y="1.15736875"/>
<vertex x="8.2204" y="1.10963125"/>
<vertex x="8.2307" y="1.060809375"/>
<vertex x="8.2339" y="1.00871875"/>
<vertex x="8.2307" y="0.956640625"/>
<vertex x="8.2204" y="0.904559375"/>
<vertex x="8.2031" y="0.85953125"/>
<vertex x="8.1818" y="0.81015"/>
<vertex x="8.1581" y="0.769459375"/>
<vertex x="8.1265" y="0.72768125"/>
<vertex x="8.0918" y="0.68861875"/>
<vertex x="8.05" y="0.651190625"/>
<vertex x="8.0082" y="0.61918125"/>
<vertex x="7.96" y="0.592059375"/>
<vertex x="7.9079" y="0.564390625"/>
<vertex x="7.8558" y="0.543759375"/>
<vertex x="7.7999" y="0.5264"/>
<vertex x="7.7414" y="0.515009375"/>
<vertex x="7.6822" y="0.509040625"/>
<vertex x="7.6199" y="0.50525"/>
<vertex x="6.8907" y="0.50525"/>
<vertex x="6.8907" y="-0.1751"/>
<vertex x="7.8243" y="-0.1751"/>
<vertex x="7.9876" y="-0.168040625"/>
<vertex x="8.1471" y="-0.14741875"/>
<vertex x="8.3001" y="-0.115959375"/>
<vertex x="8.4422" y="-0.07093125"/>
<vertex x="8.585" y="-0.01558125"/>
<vertex x="8.7168" y="0.053859375"/>
<vertex x="8.8454" y="0.13306875"/>
<vertex x="8.9669" y="0.22746875"/>
<vertex x="9.1785" y="0.435809375"/>
<vertex x="9.3276" y="0.665290625"/>
<vertex x="9.4183" y="0.911609375"/>
<vertex x="9.4492" y="1.17906875"/>
<vertex x="9.4492" y="1.51925"/>
<vertex x="9.4183" y="1.78236875"/>
<vertex x="9.3276" y="2.03303125"/>
<vertex x="9.1785" y="2.25871875"/>
<vertex x="8.9669" y="2.47085"/>
<vertex x="8.7168" y="2.64771875"/>
<vertex x="8.439" y="2.771959375"/>
<vertex x="8.1439" y="2.849"/>
<vertex x="7.8243" y="2.87341875"/>
</polygon>
</symbol>
</symbols>
<devicesets>
<deviceset name="LOGO-COPPER">
<gates>
<gate name="G$1" symbol="LOGO" x="0" y="-2.54"/>
</gates>
<devices>
<device name="2" package="COPPER2">
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="3" package="COPPER3">
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="1" package="COPPER1">
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="4" package="COPPER4">
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="5" package="COPPER5">
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="6" package="COPPER6">
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="7" package="COPPER7">
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
<part name="RGB" library="pinhead" deviceset="PINHD-1X3" device=""/>
<part name="LED1" library="BEEP" deviceset="F50360" device="5050" value="F503605050"/>
<part name="J1" library="jumper" deviceset="J" device="7MM"/>
<part name="LED2" library="BEEP" deviceset="F50360" device="5050" value="F503605050"/>
<part name="J2" library="jumper" deviceset="J" device="7MM"/>
<part name="LED3" library="BEEP" deviceset="F50360" device="5050" value="F503605050"/>
<part name="J3" library="jumper" deviceset="J" device="7MM"/>
<part name="LED4" library="BEEP" deviceset="F50360" device="5050" value="F503605050"/>
<part name="J4" library="jumper" deviceset="J" device="7MM"/>
<part name="LED5" library="BEEP" deviceset="F50360" device="5050" value="F503605050"/>
<part name="J5" library="jumper" deviceset="J" device="7MM"/>
<part name="LED6" library="BEEP" deviceset="F50360" device="5050" value="F503605050"/>
<part name="J6" library="jumper" deviceset="J" device="7MM"/>
<part name="LED7" library="BEEP" deviceset="F50360" device="5050" value="F503605050"/>
<part name="J7" library="jumper" deviceset="J" device="7MM"/>
<part name="LED8" library="BEEP" deviceset="F50360" device="5050" value="F503605050"/>
<part name="J8" library="jumper" deviceset="J" device="7MM"/>
<part name="JP1" library="pinhead" deviceset="PINHD-1X8" device=""/>
<part name="FRAME1" library="frames" deviceset="A4L-LOC" device=""/>
<part name="U$5" library="Branding" deviceset="LOGO-COPPER" device="7"/>
</parts>
<sheets>
<sheet>
<plain>
</plain>
<instances>
<instance part="RGB" gate="A" x="55.88" y="96.52" rot="R180"/>
<instance part="LED1" gate="G$1" x="73.66" y="73.66" smashed="yes">
<attribute name="NAME" x="76.2" y="76.454" size="1.778" layer="95"/>
</instance>
<instance part="J1" gate="1" x="73.66" y="83.82" smashed="yes" rot="R90">
<attribute name="NAME" x="71.755" y="83.82" size="1.778" layer="95" rot="R90"/>
</instance>
<instance part="LED2" gate="G$1" x="91.44" y="73.66" smashed="yes">
<attribute name="NAME" x="93.98" y="76.454" size="1.778" layer="95"/>
</instance>
<instance part="J2" gate="1" x="91.44" y="83.82" smashed="yes" rot="R90">
<attribute name="NAME" x="89.535" y="83.82" size="1.778" layer="95" rot="R90"/>
</instance>
<instance part="LED3" gate="G$1" x="109.22" y="73.66" smashed="yes">
<attribute name="NAME" x="111.76" y="76.454" size="1.778" layer="95"/>
</instance>
<instance part="J3" gate="1" x="109.22" y="83.82" smashed="yes" rot="R90">
<attribute name="NAME" x="107.315" y="83.82" size="1.778" layer="95" rot="R90"/>
</instance>
<instance part="LED4" gate="G$1" x="127" y="73.66" smashed="yes">
<attribute name="NAME" x="129.54" y="76.454" size="1.778" layer="95"/>
</instance>
<instance part="J4" gate="1" x="127" y="83.82" smashed="yes" rot="R90">
<attribute name="NAME" x="125.095" y="83.82" size="1.778" layer="95" rot="R90"/>
</instance>
<instance part="LED5" gate="G$1" x="144.78" y="73.66" smashed="yes">
<attribute name="NAME" x="147.32" y="76.454" size="1.778" layer="95"/>
</instance>
<instance part="J5" gate="1" x="144.78" y="83.82" smashed="yes" rot="R90">
<attribute name="NAME" x="142.875" y="83.82" size="1.778" layer="95" rot="R90"/>
</instance>
<instance part="LED6" gate="G$1" x="162.56" y="73.66" smashed="yes">
<attribute name="NAME" x="165.1" y="76.454" size="1.778" layer="95"/>
</instance>
<instance part="J6" gate="1" x="162.56" y="83.82" smashed="yes" rot="R90">
<attribute name="NAME" x="160.655" y="83.82" size="1.778" layer="95" rot="R90"/>
</instance>
<instance part="LED7" gate="G$1" x="180.34" y="73.66" smashed="yes">
<attribute name="NAME" x="182.88" y="76.454" size="1.778" layer="95"/>
</instance>
<instance part="J7" gate="1" x="180.34" y="83.82" smashed="yes" rot="R90">
<attribute name="NAME" x="178.435" y="83.82" size="1.778" layer="95" rot="R90"/>
</instance>
<instance part="LED8" gate="G$1" x="198.12" y="73.66" smashed="yes">
<attribute name="NAME" x="200.66" y="76.454" size="1.778" layer="95"/>
</instance>
<instance part="J8" gate="1" x="198.12" y="83.82" smashed="yes" rot="R90">
<attribute name="NAME" x="196.215" y="83.82" size="1.778" layer="95" rot="R90"/>
</instance>
<instance part="JP1" gate="A" x="134.62" y="55.88" rot="R270"/>
<instance part="FRAME1" gate="G$1" x="0" y="0"/>
<instance part="U$5" gate="G$1" x="182.88" y="12.7"/>
</instances>
<busses>
</busses>
<nets>
<net name="N$2" class="0">
<segment>
<pinref part="RGB" gate="A" pin="2"/>
<wire x1="58.42" y1="96.52" x2="73.66" y2="96.52" width="0.1524" layer="91"/>
<pinref part="J1" gate="1" pin="2"/>
<wire x1="73.66" y1="96.52" x2="91.44" y2="96.52" width="0.1524" layer="91"/>
<wire x1="91.44" y1="96.52" x2="109.22" y2="96.52" width="0.1524" layer="91"/>
<wire x1="109.22" y1="96.52" x2="127" y2="96.52" width="0.1524" layer="91"/>
<wire x1="127" y1="96.52" x2="144.78" y2="96.52" width="0.1524" layer="91"/>
<wire x1="144.78" y1="96.52" x2="162.56" y2="96.52" width="0.1524" layer="91"/>
<wire x1="162.56" y1="96.52" x2="180.34" y2="96.52" width="0.1524" layer="91"/>
<wire x1="180.34" y1="96.52" x2="198.12" y2="96.52" width="0.1524" layer="91"/>
<wire x1="73.66" y1="88.9" x2="73.66" y2="96.52" width="0.1524" layer="91"/>
<junction x="73.66" y="96.52"/>
<pinref part="J2" gate="1" pin="2"/>
<wire x1="91.44" y1="96.52" x2="91.44" y2="88.9" width="0.1524" layer="91"/>
<junction x="91.44" y="96.52"/>
<pinref part="J3" gate="1" pin="2"/>
<wire x1="109.22" y1="96.52" x2="109.22" y2="88.9" width="0.1524" layer="91"/>
<junction x="109.22" y="96.52"/>
<pinref part="J4" gate="1" pin="2"/>
<wire x1="127" y1="96.52" x2="127" y2="88.9" width="0.1524" layer="91"/>
<junction x="127" y="96.52"/>
<pinref part="J5" gate="1" pin="2"/>
<wire x1="144.78" y1="96.52" x2="144.78" y2="88.9" width="0.1524" layer="91"/>
<junction x="144.78" y="96.52"/>
<pinref part="J6" gate="1" pin="2"/>
<wire x1="162.56" y1="88.9" x2="162.56" y2="96.52" width="0.1524" layer="91"/>
<junction x="162.56" y="96.52"/>
<pinref part="J7" gate="1" pin="2"/>
<wire x1="180.34" y1="96.52" x2="180.34" y2="88.9" width="0.1524" layer="91"/>
<junction x="180.34" y="96.52"/>
<pinref part="J8" gate="1" pin="2"/>
<wire x1="198.12" y1="96.52" x2="198.12" y2="88.9" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$7" class="0">
<segment>
<pinref part="JP1" gate="A" pin="8"/>
<wire x1="127" y1="58.42" x2="73.66" y2="58.42" width="0.1524" layer="91"/>
<pinref part="LED1" gate="G$1" pin="RC"/>
<pinref part="LED1" gate="G$1" pin="GC"/>
<wire x1="68.58" y1="71.12" x2="73.66" y2="71.12" width="0.1524" layer="91"/>
<pinref part="LED1" gate="G$1" pin="BC"/>
<wire x1="73.66" y1="71.12" x2="78.74" y2="71.12" width="0.1524" layer="91"/>
<junction x="73.66" y="71.12"/>
<wire x1="73.66" y1="58.42" x2="73.66" y2="71.12" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$8" class="0">
<segment>
<pinref part="JP1" gate="A" pin="7"/>
<wire x1="129.54" y1="58.42" x2="129.54" y2="60.96" width="0.1524" layer="91"/>
<wire x1="129.54" y1="60.96" x2="91.44" y2="60.96" width="0.1524" layer="91"/>
<pinref part="LED2" gate="G$1" pin="RC"/>
<pinref part="LED2" gate="G$1" pin="GC"/>
<wire x1="86.36" y1="71.12" x2="91.44" y2="71.12" width="0.1524" layer="91"/>
<pinref part="LED2" gate="G$1" pin="BC"/>
<wire x1="91.44" y1="71.12" x2="96.52" y2="71.12" width="0.1524" layer="91"/>
<junction x="91.44" y="71.12"/>
<wire x1="91.44" y1="60.96" x2="91.44" y2="71.12" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$9" class="0">
<segment>
<pinref part="JP1" gate="A" pin="6"/>
<wire x1="132.08" y1="58.42" x2="132.08" y2="63.5" width="0.1524" layer="91"/>
<wire x1="132.08" y1="63.5" x2="109.22" y2="63.5" width="0.1524" layer="91"/>
<pinref part="LED3" gate="G$1" pin="RC"/>
<pinref part="LED3" gate="G$1" pin="GC"/>
<wire x1="104.14" y1="71.12" x2="109.22" y2="71.12" width="0.1524" layer="91"/>
<pinref part="LED3" gate="G$1" pin="BC"/>
<wire x1="109.22" y1="71.12" x2="114.3" y2="71.12" width="0.1524" layer="91"/>
<junction x="109.22" y="71.12"/>
<wire x1="109.22" y1="63.5" x2="109.22" y2="71.12" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$10" class="0">
<segment>
<pinref part="JP1" gate="A" pin="5"/>
<wire x1="134.62" y1="58.42" x2="134.62" y2="66.04" width="0.1524" layer="91"/>
<wire x1="134.62" y1="66.04" x2="127" y2="66.04" width="0.1524" layer="91"/>
<pinref part="LED4" gate="G$1" pin="RC"/>
<pinref part="LED4" gate="G$1" pin="GC"/>
<wire x1="121.92" y1="71.12" x2="127" y2="71.12" width="0.1524" layer="91"/>
<pinref part="LED4" gate="G$1" pin="BC"/>
<wire x1="127" y1="71.12" x2="132.08" y2="71.12" width="0.1524" layer="91"/>
<junction x="127" y="71.12"/>
<wire x1="127" y1="66.04" x2="127" y2="71.12" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$14" class="0">
<segment>
<pinref part="JP1" gate="A" pin="4"/>
<wire x1="137.16" y1="58.42" x2="137.16" y2="66.04" width="0.1524" layer="91"/>
<wire x1="137.16" y1="66.04" x2="144.78" y2="66.04" width="0.1524" layer="91"/>
<pinref part="LED5" gate="G$1" pin="RC"/>
<pinref part="LED5" gate="G$1" pin="GC"/>
<wire x1="139.7" y1="71.12" x2="144.78" y2="71.12" width="0.1524" layer="91"/>
<pinref part="LED5" gate="G$1" pin="BC"/>
<wire x1="144.78" y1="71.12" x2="149.86" y2="71.12" width="0.1524" layer="91"/>
<junction x="144.78" y="71.12"/>
<wire x1="144.78" y1="66.04" x2="144.78" y2="71.12" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$15" class="0">
<segment>
<pinref part="JP1" gate="A" pin="3"/>
<wire x1="139.7" y1="58.42" x2="139.7" y2="63.5" width="0.1524" layer="91"/>
<wire x1="139.7" y1="63.5" x2="162.56" y2="63.5" width="0.1524" layer="91"/>
<pinref part="LED6" gate="G$1" pin="RC"/>
<pinref part="LED6" gate="G$1" pin="GC"/>
<wire x1="157.48" y1="71.12" x2="162.56" y2="71.12" width="0.1524" layer="91"/>
<pinref part="LED6" gate="G$1" pin="BC"/>
<wire x1="162.56" y1="71.12" x2="167.64" y2="71.12" width="0.1524" layer="91"/>
<junction x="162.56" y="71.12"/>
<wire x1="162.56" y1="63.5" x2="162.56" y2="71.12" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$16" class="0">
<segment>
<pinref part="JP1" gate="A" pin="2"/>
<wire x1="142.24" y1="58.42" x2="142.24" y2="60.96" width="0.1524" layer="91"/>
<wire x1="142.24" y1="60.96" x2="180.34" y2="60.96" width="0.1524" layer="91"/>
<pinref part="LED7" gate="G$1" pin="BC"/>
<pinref part="LED7" gate="G$1" pin="GC"/>
<wire x1="185.42" y1="71.12" x2="180.34" y2="71.12" width="0.1524" layer="91"/>
<pinref part="LED7" gate="G$1" pin="RC"/>
<wire x1="180.34" y1="71.12" x2="175.26" y2="71.12" width="0.1524" layer="91"/>
<junction x="180.34" y="71.12"/>
<wire x1="180.34" y1="60.96" x2="180.34" y2="71.12" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$17" class="0">
<segment>
<pinref part="JP1" gate="A" pin="1"/>
<wire x1="144.78" y1="58.42" x2="198.12" y2="58.42" width="0.1524" layer="91"/>
<pinref part="LED8" gate="G$1" pin="RC"/>
<pinref part="LED8" gate="G$1" pin="GC"/>
<wire x1="193.04" y1="71.12" x2="198.12" y2="71.12" width="0.1524" layer="91"/>
<pinref part="LED8" gate="G$1" pin="BC"/>
<wire x1="198.12" y1="71.12" x2="203.2" y2="71.12" width="0.1524" layer="91"/>
<junction x="198.12" y="71.12"/>
<wire x1="198.12" y1="58.42" x2="198.12" y2="71.12" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$5" class="0">
<segment>
<pinref part="J1" gate="1" pin="1"/>
<pinref part="LED1" gate="G$1" pin="GA"/>
<wire x1="73.66" y1="78.74" x2="73.66" y2="76.2" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$12" class="0">
<segment>
<pinref part="J2" gate="1" pin="1"/>
<pinref part="LED2" gate="G$1" pin="GA"/>
<wire x1="91.44" y1="78.74" x2="91.44" y2="76.2" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$19" class="0">
<segment>
<pinref part="J3" gate="1" pin="1"/>
<pinref part="LED3" gate="G$1" pin="GA"/>
<wire x1="109.22" y1="78.74" x2="109.22" y2="76.2" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$22" class="0">
<segment>
<pinref part="J4" gate="1" pin="1"/>
<pinref part="LED4" gate="G$1" pin="GA"/>
<wire x1="127" y1="78.74" x2="127" y2="76.2" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$25" class="0">
<segment>
<pinref part="J5" gate="1" pin="1"/>
<pinref part="LED5" gate="G$1" pin="GA"/>
<wire x1="144.78" y1="78.74" x2="144.78" y2="76.2" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$28" class="0">
<segment>
<pinref part="LED6" gate="G$1" pin="GA"/>
<pinref part="J6" gate="1" pin="1"/>
<wire x1="162.56" y1="76.2" x2="162.56" y2="78.74" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$31" class="0">
<segment>
<pinref part="LED7" gate="G$1" pin="GA"/>
<pinref part="J7" gate="1" pin="1"/>
<wire x1="180.34" y1="76.2" x2="180.34" y2="78.74" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$33" class="0">
<segment>
<pinref part="LED8" gate="G$1" pin="RA"/>
<pinref part="LED7" gate="G$1" pin="RA"/>
<pinref part="LED6" gate="G$1" pin="RA"/>
<pinref part="LED5" gate="G$1" pin="RA"/>
<pinref part="LED4" gate="G$1" pin="RA"/>
<pinref part="LED3" gate="G$1" pin="RA"/>
<pinref part="LED2" gate="G$1" pin="RA"/>
<pinref part="LED1" gate="G$1" pin="RA"/>
<pinref part="RGB" gate="A" pin="3"/>
<wire x1="58.42" y1="99.06" x2="68.58" y2="99.06" width="0.1524" layer="91"/>
<wire x1="68.58" y1="99.06" x2="86.36" y2="99.06" width="0.1524" layer="91"/>
<wire x1="86.36" y1="99.06" x2="104.14" y2="99.06" width="0.1524" layer="91"/>
<wire x1="104.14" y1="99.06" x2="121.92" y2="99.06" width="0.1524" layer="91"/>
<wire x1="121.92" y1="99.06" x2="139.7" y2="99.06" width="0.1524" layer="91"/>
<wire x1="139.7" y1="99.06" x2="157.48" y2="99.06" width="0.1524" layer="91"/>
<wire x1="157.48" y1="99.06" x2="175.26" y2="99.06" width="0.1524" layer="91"/>
<wire x1="175.26" y1="99.06" x2="193.04" y2="99.06" width="0.1524" layer="91"/>
<junction x="68.58" y="99.06"/>
<junction x="86.36" y="99.06"/>
<junction x="104.14" y="99.06"/>
<junction x="121.92" y="99.06"/>
<junction x="139.7" y="99.06"/>
<junction x="157.48" y="99.06"/>
<junction x="175.26" y="99.06"/>
<wire x1="68.58" y1="76.2" x2="68.58" y2="99.06" width="0.1524" layer="91"/>
<wire x1="86.36" y1="76.2" x2="86.36" y2="99.06" width="0.1524" layer="91"/>
<wire x1="104.14" y1="76.2" x2="104.14" y2="99.06" width="0.1524" layer="91"/>
<wire x1="121.92" y1="76.2" x2="121.92" y2="99.06" width="0.1524" layer="91"/>
<wire x1="139.7" y1="76.2" x2="139.7" y2="99.06" width="0.1524" layer="91"/>
<wire x1="157.48" y1="76.2" x2="157.48" y2="99.06" width="0.1524" layer="91"/>
<wire x1="175.26" y1="76.2" x2="175.26" y2="99.06" width="0.1524" layer="91"/>
<wire x1="193.04" y1="76.2" x2="193.04" y2="99.06" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$34" class="0">
<segment>
<pinref part="J8" gate="1" pin="1"/>
<pinref part="LED8" gate="G$1" pin="GA"/>
<wire x1="198.12" y1="78.74" x2="198.12" y2="76.2" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$35" class="0">
<segment>
<pinref part="LED8" gate="G$1" pin="BA"/>
<pinref part="LED7" gate="G$1" pin="BA"/>
<pinref part="LED6" gate="G$1" pin="BA"/>
<pinref part="LED5" gate="G$1" pin="BA"/>
<pinref part="LED4" gate="G$1" pin="BA"/>
<pinref part="LED3" gate="G$1" pin="BA"/>
<pinref part="LED2" gate="G$1" pin="BA"/>
<pinref part="LED1" gate="G$1" pin="BA"/>
<pinref part="RGB" gate="A" pin="1"/>
<wire x1="58.42" y1="93.98" x2="78.74" y2="93.98" width="0.1524" layer="91"/>
<wire x1="78.74" y1="93.98" x2="96.52" y2="93.98" width="0.1524" layer="91"/>
<wire x1="96.52" y1="93.98" x2="114.3" y2="93.98" width="0.1524" layer="91"/>
<wire x1="114.3" y1="93.98" x2="132.08" y2="93.98" width="0.1524" layer="91"/>
<wire x1="132.08" y1="93.98" x2="149.86" y2="93.98" width="0.1524" layer="91"/>
<wire x1="149.86" y1="93.98" x2="167.64" y2="93.98" width="0.1524" layer="91"/>
<wire x1="167.64" y1="93.98" x2="185.42" y2="93.98" width="0.1524" layer="91"/>
<wire x1="185.42" y1="93.98" x2="203.2" y2="93.98" width="0.1524" layer="91"/>
<junction x="78.74" y="93.98"/>
<junction x="96.52" y="93.98"/>
<junction x="114.3" y="93.98"/>
<junction x="132.08" y="93.98"/>
<junction x="149.86" y="93.98"/>
<junction x="167.64" y="93.98"/>
<junction x="185.42" y="93.98"/>
<wire x1="78.74" y1="76.2" x2="78.74" y2="93.98" width="0.1524" layer="91"/>
<wire x1="96.52" y1="76.2" x2="96.52" y2="93.98" width="0.1524" layer="91"/>
<wire x1="114.3" y1="76.2" x2="114.3" y2="93.98" width="0.1524" layer="91"/>
<wire x1="132.08" y1="76.2" x2="132.08" y2="93.98" width="0.1524" layer="91"/>
<wire x1="149.86" y1="76.2" x2="149.86" y2="93.98" width="0.1524" layer="91"/>
<wire x1="167.64" y1="76.2" x2="167.64" y2="93.98" width="0.1524" layer="91"/>
<wire x1="185.42" y1="76.2" x2="185.42" y2="93.98" width="0.1524" layer="91"/>
<wire x1="203.2" y1="76.2" x2="203.2" y2="93.98" width="0.1524" layer="91"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
</eagle>
