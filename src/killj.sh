#!/bin/sh
# synopsis: kill active jvm
# origin: ${util}/src/killj.js
# utils version: 0.4.0-SNAPSHOT
# usage:  % killj.sh

kill `lsof -i4TCP -n | grep java | awk '{print $2}' | uniq`

