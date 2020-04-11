#!/bin/bash
iptables -t nat -A POSTROUTING -o eth0 -s 10.77.66.0/24 -j MASQUERADE
ip6tables -t nat -A POSTROUTING -o eth0 -s fd00:feed:beef::/64 -j MASQUERADE
openvpn --daemon --cd /etc/openvpn/ --config server.conf
exec "$@"
