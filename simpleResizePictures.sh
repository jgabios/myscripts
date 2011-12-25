#!/bin/sh

E_BADARGS=65

if [ $# -ne 2 ]
then
  echo "Usage: `basename $0` folder[./ for current folder] and width of the smalls generated"
  exit $E_BADARGS
fi

if [[ -d $1small ]]
then
 GG="f"
else
 mkdir $1small
fi

for i in $( ls $1 | grep ".jpg\|.JPG"); do
if [[ -f $1small/$i || -d $1small/$i ]]
then
 FFF="f"
else
 echo "NU EXISTA $i"
 convert $i -adaptive-resize $2x\> $1small/$i
 sleep 0.3s
fi
done
