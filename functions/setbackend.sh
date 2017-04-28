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
        install="apt-get install"
        remove="apt-get remove"
        update="apt-get update"
        check=""                                                        # For future use
        noconfirm="-y"
        devpkg="-dev"
        ;;
    "gentoo")
        abdistro="gentoo"
        install="emerge"
        remove="emerge --depclean"
        update="emerge --sync"
        check=""                                                        # For future use
        noconfirm=""                                                    # noconfirm risky on Gentoo, disabled
        devpkg=""                                                       # Gentoo packages include headers by default
        ;;
    "rhel"|"centos"|"fedora")                                           # Found .rpm-based distro
        abdistro="rpm"
        install="dnf install"
        remove="dnf remove"
        update="dnf update"
        check="dnf info installed"                                      # For future use
        noconfirm="-y"
        devpkg="-devel"
        ;;
    *)
        echo "Unsupported distro :("
        return 2;
        ;;
    esac
}

