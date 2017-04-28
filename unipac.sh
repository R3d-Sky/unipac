#!/bin/bash

# Source functions

source functions/setbackend.sh
source functions/devpkg.sh
source functions/help.sh
source functions/root.sh

# Get distro
setbackend

# Options to parse via getopt(s)
shortopts="d:y"
longopts="dev:,yestoall"

case $1 in
    "install")
        operation="install"
        shift
        ;;
    "remove")
        operation="remove"
        shift
        ;;
    "sync")
        operation="update"
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

# Test for GNU getopt from util-linux
getopt --test > /dev/null

if [[ $? == 4 ]]; then
    parsedopts=$(getopt --options $shortopts --longoptions $longopts --name "$0" -- "$@")
    eval set -- "$parsedopts"

    # Sorting through options for packages and auto
    while true; do
        case "$1" in
            -d|--dev)
                cmdline="$cmdline $(devpkg $2)"
                shift 2
                ;;
            -y|--yestoall)
                cmdline="$cmdline $noconfirm"
                shift
                ;;
            --)
                shift
                ;;
            *)
                if [[ -z "$1" ]]; then
                    break 2
                fi
                cmdline="$cmdline $1"
                shift
                ;;
        esac
    done
else
    echo "'getopt --test' failed in this environment."
    echo "This script requires GNU getopt for long options"
    echo "Using shell built-in getopts (UNSUPPORTED)"
    echo "Requires -p before each non-dev package"
    
    while getopts $shortopts name; do
        case $name in
            y)  
            cmdline="$cmdline $noconfirm"
            ;;
            d)
            cmdline="$cmdline $(devpkg $OPTARG)"
            ;;
            p)
            cmdline="$cmdline $OPTARG"
            ;;
            ?)   
            echo $OPTARG
            echo $name
            exit 2
            ;;
        esac
    done

fi

# Perform action
case $operation in
    "install")
        echo Running \'$install $cmdline\' as root...
        as_root "$install $cmdline"
        ;;
    "remove")
        echo Running \'$remove $cmdline\' as root...
        as_root $remove $cmdline
        ;;
    "update")
        echo Running \'$update\' as root...
        as_root $update $cmdline
        ;;
    *)
        echo "Programming Error: File a bug!"
        exit 5
        ;;
esac



