#!/usr/bin/bash

# Use /etc/os-release to get ID and compare to a set of known values

function setbackend() {
    distro="$(egrep -i "^id=" /etc/os-release | cut -d"=" -f2)"         # Filters to ID in /etc/os-release
                                                                        # sourcing it is bad because we don't assume POSIX Complicance
    case $distro in
    "arch"|"archarm")                                                   # Found Archlinux-like
        abdistro="arch"
        source backends/arch.sh
        ;;
    "ubuntu"|"debian"|"linuxmint")                                      # Found .deb-based distro
        abdistro="deb"
        source backends/debian.sh
        ;;
    "gentoo")
        abdistro="gentoo"
        source backends/gentoo.sh                                                       # Gentoo packages include headers by default
        ;;
    "rhel"|"centos"|"fedora")                                           # Found .rpm-based distro
        abdistro="rpm"
        source backends/rpm.sh
        ;;
    *)
        echo "Unsupported distro :("
        return 2;
        ;;
    esac
}

