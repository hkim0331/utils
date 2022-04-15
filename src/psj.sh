#!/bin/sh
# ${utils}/src/psj.sh

lsof -i4TCP -n | grep java | awk '{print $1, $2}' | uniq

