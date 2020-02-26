for i in *.* ; do
echo $i
LL=`echo $i | tr '[:upper:]' '[:lower:]'`
mv "$i" "$LL"
done
