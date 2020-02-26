#!/bin/sh

INCREMENT=1
if [ -z "$1" ]
  then
    echo "No argument supplied"
  else
   INCREMENT=$1
fi

for i in `ls -vr` ; do
echo $i
NR=`echo "$i" | grep -o '[0-9]*'`
BNR=`expr $NR + $INCREMENT`
echo $BNR
AA=`echo $i | sed "s/$NR/$BNR/g"`
mv "$i" "$AA"
done

