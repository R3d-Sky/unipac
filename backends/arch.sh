#!/bin/bash

source functions/root.sh

# Arch Linux includes headers
devpkg=""

function install() {
    if [[ "$noconfirm" == "true" ]]; then
        cmdline="--noconfirm $@"
    else
        cmdline="$@"
    fi
    echo "Running 'pacman -S $cmdline' as root."
    as_root "pacman -S $cmdline"
    return $?
}

function remove() {
    if [[ "$noconfirm" == "true" ]]; then
        cmdline="--noconfirm $@"
    else
        cmdline="$@"
    fi
    echo "Running 'pacman -Rns $cmdline' as root."
    as_root "pacman -Rns $cmdline"
    return $?
}

function update() {
    if [[ "$noconfirm" == "true" ]]; then
        cmdline="--noconfirm $@"
    else
        cmdline="$@"
    fi
    echo "Running 'pacman -Syu $cmdline' as root."
    as_root "pacman -Syu $cmdline"
    return $?
}

function check() {
    echo "Running 'pacman -Q $@'"
    pacman -Q "$@"
    return $?
}

