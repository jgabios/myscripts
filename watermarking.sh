#!/bin/sh

for i in $( ls ); do
convert $i -font /usr/share/fonts/Plazan.ttf -pointsize 17 -draw "gravity SouthWest translate 12,-10 fill '#ECD6B1'text 1,11 'CASA BAMBUS' " -draw "gravity SouthWest translate 0,0 image Over 0,0 0,0 '/root/logobambus.png' " $i
echo item: $i
done

