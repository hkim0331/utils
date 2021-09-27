#!/bin/sh
# 2021-04-09, 2021-04-10
#
# ~/Document/adoc/$1.adoc を code で開く。
# コマンド名とサフィックス、2度、adoc 打つのは面倒だ。

if [ -z "$1" ]; then
  echo '~/Documents/adoc/$1.adoc を code で開く。'
  echo usage: $0 '<thema>'
  exit 1
fi

if [ "$1" = "-l" -o "$1" = "--list" ]; then
    ls -l ${HOME}/Documents/adoc
else
    code "${HOME}/Documents/adoc/$1.adoc"
fi
