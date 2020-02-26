#!/bin/bash
#####################################
if [ -z $1 ];then echo Give target directory; exit 0;fi
FFILES=()
while IFS= read -r -d $'\0' le; do
FFILES+=("$le")
done < <(find "$1" -print0)

for file in "${FFILES[@]}"; do
#echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
#echo $file
directory=$(dirname "$file")
oldfilename=$(basename "$file")
extension="${oldfilename##*.}"
newfilename="$oldfilename"
if [ "mp3" == "$extension" ]; then
IS_128=`mp3check -l "$directory/$oldfilename" | grep 128kbps`
else
IS_128=`ogginfo "$directory/$oldfilename" | grep Nominal | grep "128"`
fi
#echo "IS_128 line = $IS_128"
NEWDIR="/tmp/output/$directory"
if ! [ -d "$NEWDIR" ]; then
mkdir -p $NEWDIR
fi
AA=0

if [[ $IS_128 != *"128"* ]]; then
ffmpeg -i "$file" -vn -ar 44100 -ac 2 -ab 128k "$NEWDIR/$newfilename"
AA=1
else
AA=0
cp -v "$file" "$NEWDIR/$newfilename"
fi

if [ "mp3" == "$extension" -a $AA == 1 ]; then
if [ -f "$NEWDIR/$newfilename" ]; then
echo ""
#sox "$NEWDIR/$newfilename" "$NEWDIR/_$newfilename" trim 0.08
fi
fi
done

