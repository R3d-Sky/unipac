#!/bin/bash

# Source functions

source functions/setbackend.sh
source functions/devpkg.sh
source functions/help.sh
source functions/root.sh
setbackend

BLANK=" "

# Test for GNU getopt from util-linux
getopt --test > /dev/null
if [[ $? -ne 4 ]]; then
    echo "`getopt --test` failed in this environment."
    echo "This script requires GNU getopt"
    exit 2
fi

# Get current operation
case $1 in
    "install")
        OPERATION="install"
        shift
        ;;
    "remove")
        OPERATION="remove"
        shift
        ;;
    "sync")
        OPERATION="update"
        shift
        ;;
    "help")
        run_help
        exit 0;
        ;;
    *)
        echo "Invalid syntax"
        run_help
        exit 1;
esac

# Options to parse via getopt
SHORT=d:y
LONG=dev:,yestoall

PARSED=$(getopt --options $SHORT --longoptions $LONG --name "$0" -- "$@")
if [[ $? -ne 0 ]]; then
    # getopt failed: probably because someone broke the script or terrible input
    echo "Unable to parse options"
    exit 3
fi

eval set -- "$PARSED"

# Sorting through options for packages and auto
while true; do
    case "$1" in
        -d|--dev)
           pkglist=$pkglist$BLANK$(devpkg $2)
            shift 2
            ;;
        -y|--yestoall)
            yestoall=true
            shift
            ;;
        --)
            shift
            ;;
        *)
            if [[ $1 != "" ]]; then
               pkglist=$pkglist$BLANK$1
            fi
            break
            ;;
    esac
done

# Perform action
case $OPERATION in
    "install")
        echo Running $install $pkglist as root...
        as_root "$install $pkglist"
        ;;
    "remove")
        echo Running $remove $pkglist as root...
        as_root $remove $pkglist
        ;;
    "update")
        echo Running $update as root...
        as_root $update
        ;;
    *)
        echo "Programming Error: File a bug!"
        exit 5
        ;;
esac



