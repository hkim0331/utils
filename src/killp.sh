#!/bin/sh
if [ -z "$1" ]; then
   echo "usage: $0 <port>"
   echo "kill process which listens at port <port>"
   exit 1
fi

kill `lsof -t -i:$1`

