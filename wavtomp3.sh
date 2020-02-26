for i in *.wav ; do
echo $i
b=`basename "$i" .wav`
echo $b
lame -h -b 128 "$i" "$b.mp3"
done
