#!/bin/sh

for i in *.* ; do
echo $i
mogrify -resize "4000x400>" "$i" 
done
