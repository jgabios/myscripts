#!/bin/sh
/usr/local/bin/wpa_supplicant -Dwext -iwlan0 -c/etc/wpa_supplicant.conf.acasa -B
sleep 1
dhclient wlan0
echo "nameserver 8.8.8.8" > /etc/resolv.conf
echo "nameserver 8.8.4.4" >> /etc/resolv.conf

