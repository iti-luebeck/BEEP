% GregtagMacbeth ColorChecker sRGB reference values from http://www.babelcolor.com
X = [116 81 67
     199 147 129
     91 122 156
     90 108 64
     130 128 176
     92 190 172
     224 124 47
     68 91 170
     198 82 97
     94 58 106
     159 189 63
     230 162 39
     35 63 147
     67 149 74
     180 49 57
     238 198 20
     193 84 151
     0 136 170
     245 245 243
     200 202 202
     161 163 163
     121 121 122
     82 84 86
     49 49 51];

% faster red green blue calibration
Xfast = [255 0 0
         0 255 0
         0 0 255];

% color sensor raw values from bad printout
T = [14833 7845 6489
     40804 19827 16112
     12201 12440 13781
     10597 8771 5839
     18529 17805 21140
     12787 18754 16515
     56843 18056 12957
     8295 11580 17638
     37403 11549 11057
     12113 6831 8028
     29978 25845 11711
     62399 26221 14701
     8496 10086 14877
     11360 12895 7687
     31967 9102 8688
     65535 33573 15697
     38044 11028 12257
     8093 12333 14578
     
     65535 56231 45538
     48360 36096 30675
     32335 23858 20916
     18017 13485 12120
     10470 8116 7291
     6271 4877 4279];

% color sensor raw values from bad printout	(red green blue)
Tfast = [3140 707 668
         843 1231 642
         523 673 1032];


% calculate matrix to transform to 8 bit sRGB values
M = pinv(T)*X;

Mfast = inv(Tfast)*Xfast;


%use M to calculate sRGB values for other sensor raw values
%rgb = [r_raw g_raw b_raw]*M
