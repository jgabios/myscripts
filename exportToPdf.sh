#!/bin/sh

#export PATH=$PATH:/sdb1/apps/openoffice/opt/openoffice.org/basis3.2/program:/sdb1/apps/openoffice/opt/openoffice.org/program
#OO_CP=/sdb1/apps/openoffice/opt/openoffice.org/basis3.2/program/classes
OO_JCP=/sdb1/apps/openoffice/opt/openoffice.org/program
strace java -cp /j/netbeansWS/OOtest/dist/OOtest.jar:$OO_JCP/jurt.jar:$OO_JCP/java_uno.jar:$OO_JCP/juh.jar:$OO_JCP/ridl.jar:$OO_JCP/unoil.jar:$OO_JCP:unoloader.jar:$OO_JCP ootest.OOPdfExporter $1

