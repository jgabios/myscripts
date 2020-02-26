#!/bin/bash
CTX=1
for i in *.* ; do
echo $i
extension="${i##*.}"
mv "$i" "$CTX.$extension"
CTX=$((CTX+1))
done
