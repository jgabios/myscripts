#!/bin/sh

MAINFOLDER=/j/netbeansWS/crawler
DISTFOLDER=$MAINFOLDER/dist
LIBFOLDER=$DISTFOLDER/lib

java -Dsun.net.client.defaultConnectTimeout=20000 -Dsun.net.client.defaultReadTimeout=20000 -DpictureFolder=/opt/jetty/webapps/compara/images/products/ -DSQL_MAP_RESOURCE_PATH=$MAINFOLDER/src/crawler/db/sql-map-config.xml -DSQL_DB_PROPERTIES_FILE=$MAINFOLDER/src/crawler/db/db.properties -cp $DISTFOLDER/crawler.jar:$LIBFOLDER/commons-collections-3.2.1.jar:$LIBFOLDER/commons-dbcp-1.2.2.jar:$LIBFOLDER/commons-pool-1.3.jar:$LIBFOLDER/commons-validator-1.3.1.jar:$LIBFOLDER/htmlparser.jar:$LIBFOLDER/ibatis-2.3.4.726.jar:$LIBFOLDER/jlinlib.jar:$LIBFOLDER/mysql-connector-java-5.0.3-bin.jar:$LIBFOLDER/log4j-1.2.8.jar crawler.robots.it.EmagYQLRobot > /tmp/logemag.dat 2>&1 &

tail -f /tmp/logemag.dat

