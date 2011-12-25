#!/bin/sh

for i in $( ls ); do
if [[ -f $1small250/$i || -d $1small250/$i ]]
then
 FFF="f"
else
 echo "NU EXISTA $i"
 INFO=`convert $1$i -virtual-pixel edge -blur 0x10 -fuzz 5% -trim info: | awk '{print $3 " " $4}'`
 FF=${INFO% *}
 LL=${INFO#* }
 DM=${LL#*+}
 echo "$FF+$DM"
 convert $1$i -crop $FF+$DM +repage /tmp/tmpfile
 convert /tmp/tmpfile -adaptive-resize 250x\> $1small250/$i
 rm /tmp/tmpfile
fi
done
