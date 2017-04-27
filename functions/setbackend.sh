#!/usr/bin/bash

# Expects to be called from main script - not standalone!

function setbackend() {
    distro="$(egrep -i "^id=" /etc/os-release | cut -d"=" -f2)"  
    
    case $distro in
    "arm"|"archarm")
        install="pacman -S"
        remove="pacman -Rns"
        update="pacman -Syu"
        check="pacman -Q"
        devpkg="" # Arch Linux packages include headers by default
        ;;
    "ubuntu"|"debian"|"linuxmint")
        install="apt-get install"
        remove="apt-get remove"
        update="apt-get update"
        check="" # TODO: Find out this as well
        devpkg="-dev"
        ;;
    "gentoo")
        install="emerge"
        remove="emerge --depclean"
        update="emerge --sync"
        check="" # TODO: Find me all the things
        devpkg="" # Gentoo packages include headers by default
        ;;
    "rhel"|"centos"|"fedora")
        backend="dnf"
        install="install"
        remove="remove"
        update="update"
        check="info installed"
        devpkg="-devel"
        ;;
    *)
        backend=$(which false)
        install=""
        remove=""
        ;;
    esac
}

