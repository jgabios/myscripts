#!/bin/sh

for i in *.* ; do
echo $i
mogrify -resize "400x" "$i" 
done
