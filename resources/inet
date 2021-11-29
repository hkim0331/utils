#!/bin/sh
# display local ipv4 addresses
#
# origin: ${dotfile}/utils/inet

if [ `uname -s` = 'Darwin' ]; then
    cmd='ifconfig'
else
    cmd='ip a'
fi
$cmd | grep 'inet ' | awk '{print $2}'
