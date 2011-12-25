#/bin/sh

# i often had files with numbers 1 per line and wanted to add them up and find out the sum
# this script does this job
# you can call it without arguments:
# ./add.sh , and then you enter number followed by <ENTER>, and when you are done type Ctrl+D, and you get the sum
# or, ./add.sh < filewithnumbers.dat

let summ=0

while read NR; do
let summ=$summ+$NR
done

echo $summ

