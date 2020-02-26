#!/bin/sh

SAVEIFS=$IFS
IFS=$(echo -en "\n\b")
for i in *; do
JJ=`echo "$i" | sed "s/\.png\|\.gif\|\.jpg\|\.jpeg//g"`
echo "\"$JJ\": {\n\"image\": \"/plugins/img/cityroom-plugin/stuff/$i\"\n},"
done

IFS=$SAVEIFS
