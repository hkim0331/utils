#!/bin/sh

cd ${HOME}
mv .m2 .m2-`date +%F`

# choose hot projects
cd ${HOME}/projects
proj="r99c l22 typing-ex qa mt2"
for p in ${proj}; do
    (cd $p && lein deps)
done

# don't forget opencv setup
cd ${HOME}/clojure/opencv-setup/
make
