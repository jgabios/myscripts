for i in *.* ; do
echo $i
mv "$i" "$1$i"
done
