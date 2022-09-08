#!/bin/sh
# under construction

## must change
DB=qa

if [ -z $1 ]; then
    echo usage: $0 db_to_dump
    echo 'dump local postgresql database as $date-$1.sql'
    exit 1
fi
pg_dump -h localhost -U postgres -W ${DB} > `date +${DB}-%F.sql`

