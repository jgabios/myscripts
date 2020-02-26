for i in *.* ; do
echo $i
AA=`echo $i | sed 's/\.png/\.gif/g'`
convert "$i" "$AA"
done
