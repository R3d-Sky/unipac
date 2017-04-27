#!/bin/bash

# Outputs help for unipac.sh

function run_help() {
    echo "Unipac v0.0.1"
    echo "Usage: $0 [command] packages"
    echo
    echo "Unipac is a commandline wrapper that uses the distro's"
    echo "package manager to install, upgrade or remove packages."
    echo "It is currently in early alpha, so use wisely."
    echo "Primarily meant for automating scripts."

    echo "Commands:"
    echo "install: install packages"
    echo "remove: remove packages"
    echo "sync: update list of available packages"

    echo "Use -d [--dev] before a package name to automatically detect."
    echo "and install correct header package."
    
    echo "Use -y [--yestoall] to run without requiring user input."
    echo "(Disabled for now as a safety measure)"
}
