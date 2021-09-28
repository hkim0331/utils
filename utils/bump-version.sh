#!/bin/sh
#
# bump-vesion script for clojure projects.
# confused using macos's /usr/bin/sed. so gsed.
#
# CAUSION
# The POSIX standard does not support back-references for
# "extended" regular expressions,
# this is a compatible extension to that standard.
#
# Use after adjusting for your project.

if [ -z "$1" ]; then
    echo "usage: $0 <version>"
    exit
fi

SED="/bin/sed"
if [ -x "${HOMEBREW_PREFIX}/bin/gsed" ]; then
    SED="${HOMEBREW_PREFIX}/bin/gsed -E"
fi

# project.clj
${SED} -i "s/(defproject \S+) \S+/\1 \"$1\"/" project.clj

# clj
#${SED} -i "s/(def \^:private version) .+/\1 \"$1\")/" src/core.clj

# cljs
#${SED} -i "s/(def \^:private version) .+/\1 \"$1\")/" src/main.cljs

