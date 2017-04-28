#!/bin/sh

# TODO: Fallback to yum when dnf not found
source functions/root.sh

devpkg="-devel"
functions="install remove update"

function install() {
    if [[ "$noconfirm" == "true" ]]; then
        cmdline="-y $@"
    else
        cmdline="$@"
    fi
    echo "Running 'dnf install ${cmdline}' as root."
    as_root "dnf install ${cmdline}"
    return $?
}

function remove() {
    if [[ "$noconfirm" == "true" ]]; then
        cmdline="-y $@"
    else
        cmdline="$@"
    fi
    echo "Running 'dnf remove ${cmdline}' as root."
    as_root "dnf remove ${cmdline}"
    return $?
}

function update() {
    if [[ "$noconfirm" == "true" ]]; then
        cmdline="-y $@"
    else
        cmdline="$@"
    fi
    echo "Running 'dnf update ${cmdline}' as root."
    as_root "dnf update ${cmdline}"
    return $?
}

# function check() {
#     echo "Running '???'"
#     ???
#     return $?
# }

