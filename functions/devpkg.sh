#!/bin/bash

# Expects to be called from main script - not standalone!

function devpkg() {
    # Requires calling setbackend or having variables set
    if [[ $backend = "" ]] then;
        setbackend;
    fi
    echo $@$devpkg
}
