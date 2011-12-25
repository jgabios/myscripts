#!/bin/sh

#used to make a bridge for virtualbox 

modprobe tun
modprobe bridge
tunctl -t tap0
brctl addbr br0
brctl addif br0 tap0
ip link set up dev br0
ip addr add 192.168.1.1/24 dev br0
ip route add 192.168.1.0/24 dev br0
echo "DONE"

sleep 1 
INTIF="br0"
EXTIF="wlan0"
echo 1 > /proc/sys/net/ipv4/ip_forward

# clear existing iptable rules, set a default policy
iptables -P INPUT ACCEPT
iptables -F INPUT 
iptables -P OUTPUT ACCEPT
iptables -F OUTPUT 
iptables -P FORWARD ACCEPT
iptables -F FORWARD 
iptables -t nat -F

# set forwarding and nat rules
#iptables -A FORWARD -i $EXTIF -o $INTIF -j ACCEPT
#iptables -A FORWARD -i $INTIF -o $EXTIF -j ACCEPT
#iptables -t nat -A POSTROUTING -o $EXTIF -j MASQUERADE

