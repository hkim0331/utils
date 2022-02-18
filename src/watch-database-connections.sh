#!/bin/bash
#
# mariadb, postgres, redis の起動状況、ポートフォワード状態を表示する。
# --loop オプションで、60 秒ごとにループする。
#
# hkimura, 2020-11-02.
#
# シェルスクリプトには戻り値はなく、関数が標準出力に書き出したものを
# value=`func` のように受け取る。

function port {
    ps ax | grep "[s]sh -fN -L $1" | awk '{print $9}'
}

### mariadb
m=`pidof mariadbd`
mpf=`port 3306`

### postgres
p=`pidof postgres`
ppf=`port 5432`

## redis
r=`pidof redis-server`
rpf=`port 6379`

echo -e "maria\t${m}\tpfw:${mpf}"
echo -e "pg   \t${p}\tpfw:${ppf}"
echo -e "redis\t${r}\tpfw:${rpf}"

if [ "$1" = '--loop' ]; then
    sleep 60
    clear
    exec $0 --loop
fi
