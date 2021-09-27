#!/bin/sh
# date: 2021-05-08
# origin: ${dotfiles}/utils/bak
# synopsis: create backup file(s)
# usage: bak file1 file2 ...

if [ -z $1 ]; then
  echo "ファイル f のコピーを f-{yyyy-mm-dd}で作る。"
  echo usage: $0 file1 file2 ...
  exit 1
fi

# ループの中で date するのは非効率。
# ループの前に ext 作って使い回す。
ext=`date +-%F`
for i in $@; do
  cp $i $i${ext}
done

