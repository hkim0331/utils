#!/bin/sh
# origin: ${utils}/todays-ls.sh
#
# ~/Documents/todays/yyyy-mm-dd/ 以下のフォルダをリストする
#
# changed:
# * 2021-02-06 ~/todays -> ~/Documents/todays
# * 2021-02-06 2020 and 2021 only.
# * 2022-04-03 2021 and 2022 only again (forgot commit).

cd ~/Documents/todays
for i in 2021-*-* 2022-*-*; do
    ls -dF1 $i/*
done
