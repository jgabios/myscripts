OLDIFS=$IFS
IFS=$(echo -en "\n\b")

for i in *.* ; do
echo "$i"
#AA=`echo $i | sed 's/Fr//g'`
#AA=`echo "$i" | sed 's/[0-9]\.[0-9]*//g'`
AA=`echo "$i" | sed 's/\.sjs/\.html/g'`
echo $AA
mv "$i" "$AA"
done

IFS=$OLDIFS
