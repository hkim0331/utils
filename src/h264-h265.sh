#!/bin/sh
# utils/h264-h265.sh
# 2019-01-28
# 2019-01-29 '-vtag hvc1' necessary for macos/ios.

# software encode
#ffmpeg -i $1 -vcodec libx265 -vtag hvc1 $2

# hardware encode?
# without -b:v 5000k, default low bit rate
ffmpeg -i $1 -vcodec hevc_videotoolbox -b:v 5000k -vtag hvc1 $2






