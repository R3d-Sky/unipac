#!/bin/bash

source functions/root.sh

devpkg="-dev"

function install() {
    if [[ "$noconfirm" == "true" ]]; then
        cmdline="-y $@"
    else
        cmdline="$@"
    fi
    echo "Running 'apt-get install $cmdline' as root."
    as_root "apt-get install $cmdline"
    return $?
}

function remove() {
    if [[ "$noconfirm" == "true" ]]; then
        cmdline="-y $@"
    else
        cmdline="$@"
    fi
    echo "Running 'apt-get remove $cmdline' as root."
    as_root "apt-get remove $cmdline"
    return $?
}

function update() {
    if [[ "$noconfirm" == "true" ]]; then
        cmdline="-y $@"
    else
        cmdline="$@"
    fi
    echo "Running 'apt-get update $cmdline' as root."
    as_root "apt-get update $cmdline"
    return $?
}

# function check() {
#     echo "Running '???'"
#     ???
#     return $?
# }

