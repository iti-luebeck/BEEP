#!/bin/sh
for f in `ls *.pov`
do
	"povray" +W1600 +H1200 +A0.3 +FN -d +L"/usr/share/fonts/" +L"$HOME/eagle3d/povray" +O"$f.png" $f&
done
