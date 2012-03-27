#!/bin/sh

rsync -e 'ssh -p 228' -avz /j/netbeansWS/ --exclude='*.jar' --exclude='*.class' --exclude='dist/' --exclude='build/' --exclude='nbproject/' username@www.myserver.ro:/home/username/backup-notebook/
