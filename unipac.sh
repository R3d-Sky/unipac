#!/bin/bash

# Source functions

source functions/setbackend.sh
source functions/devpkg.sh
source functions/help.sh

BLANK=" "

getopt --test > /dev/null
if [[ $? -ne 4 ]]; then
    echo "`getopt --test` failed in this environment."
    echo "This script requires GNU getopt"
    exit 2
fi

case $1 in
    install)
        OPERATION=install
        shift
        ;;
    remove)
        OPERATION=remove
        shift
        ;;
    sync)
        OPERATION=update
        shift
        ;;
    *)
        echo "Invalid syntax"
        run_help
        exit 2;
esac

SHORT=d:y
LONG=dev:,yestoall

PARSED=$(getopt --options $SHORT --longoptions $LONG --name "$0" -- "$@")
if [[ $? -ne 0 ]]; then
    # getopt failed: probably because someone broke the script or terrible input
    echo "Unable to parse options"
    exit 3
fi

eval set -- "$PARSED"

# now enjoy the options in order and nicely split until we see --
while true; do
    case "$1" in
        -d|--dev)
            pacName=$pacName$BLANK$(devpkg $2)
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
                pacName=$pacName$BLANK$1
            fi
            break
            ;;
    esac
done




