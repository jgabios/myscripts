#!/bin/sh

SAVEIFS=$IFS
IFS=$(echo -en "\n\b")
for i in $( ls ); do
JJ=`echo "$i" | sed "s/ /_/g"`
if [ "$i" != "$JJ" ]; then
mv "$i" "$JJ"
else
echo " no space in $i"
fi
done

IFS=$SAVEIFS
