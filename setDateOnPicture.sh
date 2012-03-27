#!/bin/sh

for i in $( ls | grep -ie '\.jpg'); do
TEX=`jhead -exifmap $i | awk '/File date/ {print $4}'`
convert $i -font /usr/share/fonts/Type1/couri.pfa -pointsize 37 -draw "gravity SouthWest translate 12,-10 fill '#ECD6B1'text 1,11 '$TEX' " $i.$TEX.jpg
echo item: $i
done

