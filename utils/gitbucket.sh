#!/bin/sh
# /dev/null, OK?

ssh syno2.local '/var/packages/Java8/target/j2sdk-image/bin/java -jar gitbucket/gitbucket.war' >/dev/null

