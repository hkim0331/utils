#!/bin/sh
# origin: ${utils}/todays-ls.sh
#
# ~/Documents/todays/yyyy-mm-dd/ 以下のフォルダをリストする
#
# changed:
# * 2021-02-06 ~/todays -> ~/Documents/todays
# * 2021-02-06 2020 and 2021 only.

cd ~/Documents/todays
for i in 2020-*-* 2021-*-*; do
    ls -dF1 $i/*
done
