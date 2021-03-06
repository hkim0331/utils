#!/bin/sh
# smtpauth-passwd
PATH='$HOMEBREW_PREFIX/openssl/bin:$HOMEBREW_PREFIX/bin:/usr/bin:/bin'
MAILADDR="$1"
PASSWORD="$2"

usage()
{
    echo "Usage: $0 mail-address password"
    exit 1
}

if [ -n "$MAILADDR" ]; then
    if [ -n "$PASSWORD" ]; then
        printf "%s\0%s\0%s" $MAILADDR $MAILADDR $PASSWORD | openssl base64 -e | tr -d '\n'
        echo
        exit 0
    else
        usage
    fi
else
    usage
fi
