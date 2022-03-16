#!/bin/sh

# don't forget opencv setup
cd ${HOME}/clojure/opencv-setup/
make

# choose hot projects
cd ${HOME}/projects
proj="r99c typing-ex"
for p in ${proj}; do
    (cd $p && lein deps)
done
