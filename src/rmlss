#!/bin/sh
# remove local snap shots.
# no use?

for d in `tmutil listlocalsnapshots / | awk -F'.' '{print $4}'`; do
 sudo tmutil deletelocalsnapshots $d;
done
