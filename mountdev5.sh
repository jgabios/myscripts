#!/bin/sh

sudo sshfs -o allow_other username@someserver.com:/www/html ~/code/dev5 -p 3311 -o IdentityFile=~/.ssh/td_rsa
