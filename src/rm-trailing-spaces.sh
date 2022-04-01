#!/bin/sh

if [ -z "$1" ]; then
   echo "remove trailing spaces"
   echo "usage: $0 file"
   exit 1
fi

# macos /usr/bin/sed is not good.
if [ -f /opt/homebrew/bin/gsed ]; then
    SED=/opt/homebrew/bin/gsed
else
    SED=/usr/bin/sed
fi
${SED} -i 's/\s\s*$//g' $1

