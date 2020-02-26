#!/bin/sh

for i in *.* ; do
echo $i
mogrify -resize "600x" "$i" 
done
