#!/bin/bash

iptables -A INPUT -p tcp -s 0/0 --sport 0:65535 -d 10.0.0.12 --dport 49164:49264 -m state --state NEW,ESTABLISHED -j DROP
iptables -A INPUT -p udp -s 0/0 --sport 0:65535 -d 10.0.0.12 --dport 6881 -m state --state NEW,ESTABLISHED -j DROP
