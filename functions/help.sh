#!/bin/bash

# Outputs help for unipac.sh

function run_help() {
    echo "Unipac v0.99"
    echo "Usage: $0 [command] packages"
    echo
    echo "Unipac is a commandline wrapper that uses the distro's"
    echo "package manager to install, upgrade or remove packages."
    echo "It is currently in beta, so use wisely."
    echo "Primarily meant for automating scripts."
    echo
    echo "Commands:"
    echo "install: install packages"
    echo "remove: remove packages"
    echo "sync: update list of available packages"
    echo
    echo "Use -d [--dev] before a package name to automatically detect"
    echo "and install correct header package."
    echo
    echo "Use -p [--package] to install a standard package."
    echo
    echo "Use -y [--yestoall] to run without requiring user input."
}
