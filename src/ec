#!/bin/sh
# emacs client launcher
# update: 2019-01-23

# macos defines TMPDIR, ubuntu not.
if [ `uname` = 'Linux' ]; then
    TMPDIR='/tmp'
fi
ID_U=`id -u`
if [ ! -x ${TMPDIR}/emacs${ID_U}/server ]; then
    emacs --daemon
fi
# terminal emacs. for console emacs, try -c.
exec emacsclient --alternate-editor="" -t "$@"

