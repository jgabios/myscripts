#!/bin/sh

#echo " finding files that contain $1"
grep -HInrEo -m 1 ".{0,20}$1.{0,20}"
