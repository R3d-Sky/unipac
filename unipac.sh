#!/bin/sh

# Pipe Failures
set -euf -o pipefail

# Source functions

# shellcheck source=functions/setbackend.sh
source functions/setbackend.sh
# shellcheck source=functions/devpkg.sh
source functions/devpkg.sh
# shellcheck source=functions/help.sh
source functions/help.sh
# shellcheck source=functions/getcommand.sh
source functions/getcommand.sh

# Get distro
setbackend

# Options to parse via getopt(s)
shortopts="d:p:y"
longopts="dev:,package:,yestoall"

# Check operation


# Exit if getcommand fails
if getcommand "$1"; then exit $?; fi
shift

# Test for GNU getopt from util-linux

getopt --test > /dev/null
if [ "$?" == 4 ] ; then
    parsedopts=$(getopt --options $shortopts --longoptions $longopts --name "$0" -- "$@")
    eval set -- "$parsedopts"

    # Sorting through options for packages and auto
    while true; do
        case "$1" in
            -d|--dev)
                cmdline="${cmdline} $(getdevpkg "$2")"
                shift 2
                ;;
            -y|--yestoall)
                noconfirm="true"
                shift
                ;;
            -p|--package)
                cmdline="${cmdline} $2"
                shift 2
                ;;
            *)
                shift
                break
                ;;
        esac
    done
else
    echo "'getopt --test' failed in this environment."
    echo "This script requires GNU getopt for long options."
    echo "Using shell built-in getopts."
    
    while getopts $shortopts name; do
        case $name in
            y)  
            noconfirm="true"
            ;;
            d)
            cmdline="${cmdline} $(getdevpkg "$OPTARG")"
            ;;
            p)
            cmdline="${cmdline} $OPTARG"
            ;;
            ?)   
            echo "Invalid option"
            exit 2
            ;;
        esac
    done

fi

# Perform action
case $operation in
    "install")
        install "${cmdline}"
        ;;
    "remove")
        remove "${cmdline}"
        ;;
    "update")
        update "${cmdline}"
        ;;
    *)
        echo "Programming Error: File a bug!"
        exit 5
        ;;
esac
return $?



