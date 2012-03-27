#!/bin/sh

# this script gets the date from the EXIF header, then writes it on the image at the bottom on the right.
# this happens for all images in the current directory

for i in $( ls ); do
TEXTI=`identify -format %[exif:DateTime] $i | awk '{print $1}'`
convert -font /usr/share/fonts/TTF/utkal.ttf -fill white -pointsize 30 -gravity SouthWest -draw "text 1,11 '$TEXTI'" $i _$i
echo item: $i
echo $TEXTI
done

