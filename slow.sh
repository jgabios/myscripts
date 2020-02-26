#!/bin/sh

tc qdisc add dev lo root netem delay 1400ms 3100ms

