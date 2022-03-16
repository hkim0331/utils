#!/bin/sh
# from https://clojure.org/guides/deps_and_cli
#
# usage:
# % find-versions clojure.java-time/clojure.java-time

clj -X:deps find-versions :lib $1
