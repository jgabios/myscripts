for i in *.* ; do
echo $i
NR=`echo "$i" | grep -o '[0-9]*'`
AA=`echo $i | sed 's/[0-9]*-//g'`
AA=`echo $AA | sed 's/\.png//g'`
mv "$i" "${AA}_${NR}.png"
#echo "${AA}_${NR}.png"
done
