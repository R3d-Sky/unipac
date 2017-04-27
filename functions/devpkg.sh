#!/bin/bash

# Finds appropriate -dev(el) package to install
# Expects to be called from main script - not standalone!

function devpkg() {
    # Requires calling setbackend or having variables set
    echo $@$devpkg
}
