#!/usr/bin/bash

# unipac.sh - Many distros, one package management solution (Hopefully).

function setbackend() {
    distro="$(egrep -i "^id=" /etc/os-release | cut -d"=" -f2)"  
    
    case $distro in
    "arch"|"archarm")
        $backend = "pacman"
        $install = "-S"
        $remove = "-Rns"
        $update = "-Syu"
        $check = "" # TODO: Find out this
        $devpkg = ""
        ;;
    "ubuntu"|"debian"|"linuxmint")
        $backend = "apt-get"
        $install = "install"
        $remove = "remove"
        $update = "update"
        ;;
    "gentoo")
        # TODO: Verify Gentoo syntax
        $backend = "emerge"
        $install = ""
        $remove = "--depclean"
        $update = "--sync"
        ;;
    "rhel"|"centos"|"fedora")
        # TODO: Verify .rpm sytnax
        $backend = "dnf"
        $install = "install"
        $remove = "remove"
        $update = "update"
        $check = "info installed"
        $devpkg = "-devel"
    *)
        $backend = $(which false)
        $install = ""
        $remove = ""
        ;;
    esac
}

function checkpkg() {
    
}
