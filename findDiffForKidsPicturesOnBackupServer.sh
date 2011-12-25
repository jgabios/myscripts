#!/bin/sh

rsync -nrvv -e "ssh -p 228" --size-only /sdb1/allcdpictures/* username@myserver.ro:/home/username/backup/poze-copii/ | grep -v uptodate
## only for the files in the /sdb1/allcdpictures/ not in the subfolders
#rsync -nvv -e "ssh -p 228" --size-only /sdb1/allcdpictures/* username@www.myserver.ro:/backup/poze-copii/ | grep -v uptodate
