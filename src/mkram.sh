#!/bin/sh
#
# obsoleted by mkram.clj
#
# origin: ${utils}/mkram
#
# * https://www.tais-inc.com/tech/2018/11/11/mac-os-ramdisk.html
#
# size = 2048 * MB
# for example, if you wish 1GB RAM_DISK,
# size = 2048 * 1024 = 2097152
#
# $ mkram => スクリプト中で設定したデフォルトサイズの ramdisk を作成
# $ mkram [256|512|1G|2G] => 256MB, 512MB, 1GB, 2GB の ramdisk を作成
# デフォルトは 512MB
# $ mkram umount
# $ mkram help もしくは --help => ヘルプを表示

usage () {
    # not echo. cat.
    cat <<EOF
mkram [size]
  make /Volume/RAM_DISK with size MB.
  2G, 1G, 512(MB) and 256(MB) are available now.
  When size is not specified, 256 is used.
  If you wish other value, adjust the script. easy.

mkram umount
  umount ramdisk if mounted.

mkram help
  show this help.
EOF
}

umount () {
    diskutil umount /Volumes/RAM_DISK
}

case $1 in
    "")
        size=524288
        ;;
    "2G" | "2048")
        size=4194304
        ;;
    "1G" | "1024")
        size=2097152
        ;;
    "512")
        size=1048576
        ;;
    "256")
        size=524288
        ;;
    "umount" | "unmount")
        umount
        exit
        ;;
    *)
        usage
        exit
        ;;
esac

diskutil erasedisk APFS RAM_DISK $(hdid -nomount ram://$size)
