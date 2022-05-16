#!/bin/sh
if [ -z "$1" ]; then
   echo "usage: $1 <n>"
   echo "kill process which listens at port n"
   exit 1
fi

kill `lsof -t -i:$1`

