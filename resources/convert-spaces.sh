#!/bin/sh
#
# 2020-04-03
#
# 全ての全角スペースを半角スペースに、
# 行末のスペースを削除。
#
# sed では \s がスペース文字を表さないの？ + も？
# → macos では gsed -r, linux では sed -E を使うべし。

if [ -e $HOMEBREW_PREFIX/bin/gsed ]; then
    SED='$HOMEBREW_PREFIX/bin/gsed -ri'
else
    SED='/usr/bin/sed -Ei'
fi
${SED} -e 's/　/ /g' \
       -e 's/\s+$//g'\
       $@
