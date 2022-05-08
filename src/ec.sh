#!/bin/sh
# emacs client launcher along with emacs server
# update: 2019-01-23
# 2022-05-07 brew, but exec-path doesn't include /opt/homebrew/bin etc.
#            fixed I missed using exec-path-from-shell.el

# macos defines TMPDIR, but ubuntu.
if [ `uname` = 'Linux' ]; then
    TMPDIR='/tmp'
fi

#ID_U=`id -u`
if [ ! -x ${TMPDIR}/emacs`id -u`/server ]; then
    # from emacs26+
    # emacs --fg-daemon
    # linux,
    # emacs --daemon
    # macos, use brew
    brew services start emacs
fi

# terminal emacs. for console emacs, try -c.
exec emacsclient --alternate-editor="" -t "$@"

