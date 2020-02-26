#!/bin/sh

for i in `ls -v` ; do
echo $i
NR=`echo "$i" | grep -o '[0-9]*'`
BNR=`expr $NR - 1`
echo $BNR
AA=`echo $i | sed "s/$NR/$BNR/g"`
mv "$i" "$AA"
done

