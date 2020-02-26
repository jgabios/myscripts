for i in *.mp3 ; do
echo $i
b=`basename "$i" .mp3`
echo $b
ffmpeg -i "$i" -acodec libvorbis -aq 60 "$b.ogg"
done
