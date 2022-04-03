#!/bin/sh

if [ -z "$1" ]; then
    echo "usage: $0 file_or_dir"
    exit 1
fi
tar cf - $1 | (cd ~/ramdisk && tar xf -)
