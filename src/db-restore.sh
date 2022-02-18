#!/bin/sh
# under construction

# FIXME: how about define database to restore app by app,
#        rather than using $1 as database name,
#        it is more safety. 2021-10-25

if [ -z "$1" ]; then
    echo usage: $0 yyyy-mm-dd.dump
    echo restore postgresql database from yyyy-mm-dd.dump
    echo caustion: mind this script drops database first.
    exit 1
fi

DB="qa"
PSQL="psql -h localhost -U postgres -W"
${PSQL} -c "drop database ${DB}"
createdb ${DB}
${PSQL} ${DB} < $1



