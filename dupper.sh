#!/bin/sh

# finds duplicate files likes fdupes

OUTF=rem-duplicates.sh;
echo "#! /bin/sh" > $OUTF;
find "$@" -type f -print0 |
  xargs -0 -n1 md5sum |
    sort --key=1,32 | uniq -w 32 -d --all-repeated=separate |
    sed -r 's/^[0-9a-f]*( )*//;s/([^a-zA-Z0-9./_-])/\\\1/g;s/(.+)/#rm \1/' >> $OUTF;
chmod a+x $OUTF; ls -l $OUTF

