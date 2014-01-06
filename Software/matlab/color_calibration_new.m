% GregtagMacbeth ColorChecker scanned values from printout (by line)
%    1  2   3   4   5   6   7    8   9   10  11  12  13  14  15  16  17  18  21  22
X = [99 153 75  83  80  69  237  38  208 87  144 224 28  51  186 228 190 20  157 115
     20 120 128 106 96  174 121  97  97  77  179 160 85  131 65  181 102 119 173 125
     39 125 176 90  137 191 92   173 123 118 99  103 153 96  87  90  151 177 185 137];



% color sensor raw values from bad printout (by line)
%    1    2    3    4    5   6    7    8    9    10  11   12   13  14  15   16   17   18   21   22
T = [1100 2257 924  929 1212 1162 3105 642  2431 856 1752 2937 567 819 2135 3044 2174 645  1786 1162
     664  1333 1007 796 1136 1526 1104 764  823  561 1612 1471 657 986 636  1767 899  943  1481 939
     585  1151 1201 587 1395 1427 852  1130 851  694 817  926  967 643 647  931  1076 1210 1343 874];




% calculate matrix to transform to 8 bit sRGB values
M1 = X*pinv(T);

% GregtagMacbeth ColorChecker sRGB reference values from http://www.babelcolor.com
X = [116 81 67   % 1
     199 147 129 % 2
     91 122 156  % 3
     90 108 64   % 4
     130 128 176 % 5
     92 190 172  % 6
     224 124 47  % 7
     68 91 170   % 8
     198 82 97   % 9
     94 58 106   % 10
     159 189 63  % 11
     230 162 39  % 12
     35 63 147   % 13
     67 149 74   % 14
     180 49 57   % 15
     238 198 20  % 16
     193 84 151  % 17
     0 136 170   % 18
     161 163 163 % 21
     121 121 122 % 22
	 ];
X = X';

% calculate matrix to transform to 8 bit sRGB values	 
M2 = X*pinv(T);

sum(std((X-M1*T)'))
sum(std((X-M2*T)'))

%use M to calculate sRGB values for other sensor raw values
%rgb = M*[r_raw;g_raw;b_raw]

