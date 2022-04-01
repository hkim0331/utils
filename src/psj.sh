#!/bin/sh
# ${utils}/src/psj.sh

lsof -i4TCP | grep java | awk '{print $1, $2}' | uniq

