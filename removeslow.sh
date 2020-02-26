#!/bin/sh

tc qdisc del dev lo root netem delay 1400ms 3100ms

