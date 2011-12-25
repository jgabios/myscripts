#!/bin/sh

ffmpeg -i $1 -s 320x240 -r 15 $2
