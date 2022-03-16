#!/bin/sh
#
# improve db-conns
#
# origin: ${utils}/db-conns
#
# 2021-01-09 改良しようとしたが、ちょっと遅くなった。
#            すっきりしたからよしとしよう。
#
# 2021-01-17 Syntax error: "}" unexpected を解消。(0.9.7)
#            function f {} はダメで、
#            f () {} は行ける。

# 関数名に local は使えない。
pc () {
  # $1: port
  lsof -i:$1 >/dev/null
  [ "$?" = "0" ] &&  echo $1
}

docker () {
  # $1: port
  lsof -i:$1 | grep com.docke >/dev/null
  if [ "$?" = "0" ]; then
    echo " docker"
  fi
}

pfw () {
  # $1 port
  ps ax | grep "[s]sh -fN -L $1" | awk '{printf "pfw:%s",$9}'
}

cat << EOF
maria `pc 3306` `docker 3306` `pfw 3306`
pg    `pc 5432` `docker 5432` `pfw 5432`
redis `pc 6379` `docker 6379` `pfw 6379`
EOF

