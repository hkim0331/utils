#!/bin/sh
#
# origin: ${utils}/pidof.sh
#
#http://www.macosxhints.com/article.php?story=20030618114543169

ps axc | awk "{if (\$5==\"$1\") print \$1}"

