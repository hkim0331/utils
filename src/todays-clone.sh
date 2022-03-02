#!/bin/sh
# origin: ${utils}/todays-clone.sh
#
# usage: todays-clone name
# copy newest folder named 'name' found in todays-ls to current dir.
# 'name' must be a exact full name.
#
# example:
# $ todays-clone find-black-spots
#
# see: todays
#
clone () {
    name=$1
    from=`todays-ls | grep ${name} | tail -1`
    date=`echo $from | cut -d '/' -f 1`
    here=`pwd`
    cd ~/Documents/todays/$date
    tar cf - $name | (cd $here && tar xf -)
}

if [ $# = 0 ]; then
    echo usage: $0 name
    exit 1
fi

for i in $@; do
    clone $i
done
