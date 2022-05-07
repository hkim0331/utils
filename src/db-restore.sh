#!/bin/sh

if [ -z "$1" ]; then
    echo "usage: $0 yyyy-mm-dd.sql"
    echo "       $0 --last"
    echo restore postgresql database from db-yyyy-mm-dd.sql
    echo mind: this script drops database first.
    exit 1
elif [ "--last" = "$1" ]; then
    DUMP=`ls -t l22* | head -1`
else
    DUMP=$1
fi

#echo ${DUMP}

PSQL="psql -h localhost -U postgres"
${PSQL} -c "drop database l22"
${PSQL} -c "create database l22 owner='postgres'"
${PSQL} l22 < ${DUMP}

