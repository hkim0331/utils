#!/bin/sh
# origin: ${dotfiles}/utils/mount-nfs
# usage: sudo mount-nfs

HOST=`hostname`
#echo HOST: $HOST

if [ ! -d /Volumes/nfs ]; then
    mkdir /Volumes/nfs
fi

if [ ${HOST} = "imac3.local" ]; then
    NFS=ds218j.local:/volume1/NFS
else
    NFS=syno2.local:/volume1/nfs
fi

/sbin/mount_nfs -o vers=3 ${NFS} /Volumes/nfs
