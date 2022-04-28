#!/bin/sh
# origin: ${utils}/src/projects.sh
# synopsis: dirs のリポジトリを git pull/push する。

dirs="l22 literacy mt2 qa typing-ex"

# develop ブランチをチェックアウトし、プルする。
start_sub () {
    cd $1
    git checkout develop
    git fetch
    git pull
    echo '---'
}

start () {
    for i in $dirs; do
        start_sub $i
    done
}

# develop ブランチをコミットし、プッシュする。
finish_sub () {
    cd $1
    git checkout develop
    git add -u
    git commit -m "updated by projects.sh"
    git push
    echo '---'
}

finish () {
    for i in $dirs; do
        finish_sub $i
    done
}

if [ -z $1 ]; then
    echo $dirs
elif [ $1 = 'start' ]; then
    start
elif [ $1 = 'finish' ]; then
    finish
else
    echo "usage $0 [start|finish]"
    echo "when no args, list projects name."
fi
