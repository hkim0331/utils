#!/bin/sh
#
# origin: ${utils}/todays.sh
#
# ~/Dcuments/todays/yyyy-mm-dd/ 以下にバックアップを作る。
#
# unreleased:
# * 引数がないときは todays-ls として動作するっつうのは？
#
# changed:
# * 2021-02-06 DEST を ~/todays から ~/Documents/todays に変更。

if [ $# -eq 0 ]; then
    echo "usage: $0 dir1 dir2 ..."
    echo 引数がないときは todays-ls として動作するのはどうか？
    exit 1
fi

DEST=~/Documents/todays/`date +%F`
mkdir -p ${DEST}
tar cf - $@ | (cd ${DEST} && tar xf -)
