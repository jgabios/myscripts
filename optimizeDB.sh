#!/bin/sh

if [ $# -ne 1 ]
then
 echo "you should provide DNAME as argument to $0"
 exit 65
fi
DBNAME=$1
for table in $(mysql -u root -D $DBNAME -e 'show tables' | awk '!/Tables/ {print $1}'); do
mysql -s -s -u root -D $DBNAME -e "analyze table $table"
mysql -s -s -u root -D $DBNAME -e "optimize table $table"
echo " $table -> optimized"
done
