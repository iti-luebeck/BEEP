.SUBCKT nts4101p 1 2 3
**************************************
*      Model Generated by MODPEX     *
*Copyright(c) Symmetry Design Systems*
*         All Rights Reserved        *
*    UNPUBLISHED LICENSED SOFTWARE   *
*   Contains Proprietary Information *
*      Which is The Property of      *
*     SYMMETRY OR ITS LICENSORS      *
*Commercial Use or Resale Restricted *
*   by Symmetry License Agreement    *
**************************************
* Model generated on Oct 14, 04
* MODEL FORMAT: SPICE3
* Symmetry POWER MOS Model (Version 1.0)
* External Node Designations
* Node 1 -> Drain
* Node 2 -> Gate
* Node 3 -> Source
M1 9 7 8 8 MM L=100u W=100u
* Default values used in MM:
* The voltage-dependent capacitances are
* not included. Other default values are:
*   RS=0 RD=0 LD=0 CBD=0 CBS=0 CGBO=0
.MODEL MM PMOS LEVEL=1 IS=1e-32
+VTO=-0.857489 LAMBDA=0.00928734 KP=9.05103
+CGSO=5.59665e-06 CGDO=1.41916e-07
RS 8 3 0.00788898
D1 1 3 MD
.MODEL MD D IS=1e-08 RS=0.106323 N=1.30414 BV=20
+IBV=0.00025 EG=1 XTI=3.4881 TT=0
+CJO=9.0595e-11 VJ=3.28534 M=0.538669 FC=0.706749
RDS 3 1 2e+09
RD 9 1 0.0487441
RG 2 7 6.36156
D2 5 4 MD1
* Default values used in MD1:
*   RS=0 EG=1.11 XTI=3.0 TT=0
*   BV=infinite IBV=1mA
.MODEL MD1 D IS=1e-32 N=50
+CJO=3.08214e-10 VJ=0.5 M=0.548834 FC=1e-08
D3 5 0 MD2
* Default values used in MD2:
*   EG=1.11 XTI=3.0 TT=0 CJO=0
*   BV=infinite IBV=1mA
.MODEL MD2 D IS=1e-10 N=0.4 RS=3e-06
RL 5 10 1
FI2 7 9 VFI2 -1
VFI2 4 0 0
EV16 10 0 9 7 1
CAP 11 10 7.24805e-10
FI1 7 9 VFI1 -1
VFI1 11 6 0
RCAP 6 10 1
D4 6 0 MD3
* Default values used in MD3:
*   EG=1.11 XTI=3.0 TT=0 CJO=0
*   RS=0 BV=infinite IBV=1mA
.MODEL MD3 D IS=1e-10 N=0.4
.ENDS nts4101p
