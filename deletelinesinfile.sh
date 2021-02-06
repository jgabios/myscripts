OLDIFS=$IFS
IFS=$(echo -en "\n\b")

for i in *.* ; do
echo "$i"
sed -i '/include("\|<?\|?>/d' "$i"
done

IFS=$OLDIFS
