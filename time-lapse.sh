#!/bin/bash

# Description: make time lapse video
# Usage: time-lapse.sh <source-video> <destination-file> <frames>
# Source Video: the video that you are wanting to speed up
# Destination File: the file where the video will be saved
# Frames: the number of frames to pull per second (1 will speed it up the most, 10 will be slower)

mkdir ffmpeg_temp
ffmpeg -i $1 -r $3 -f image2 ffmpeg_temp/%05d.png
ffmpeg -i ffmpeg_temp/%05d.png -s 720�576 -b 9000k $2
rm -rf ./ffmpeg_temp

