source functions/root.sh

devpkg=""
functions="install remove update"

function install() {
    if [[ "$noconfirm" == "true" ]]; then
        cmdline="-y $@"
    else
        cmdline="$@"
    fi
    echo "Running 'emerge ${cmdline}' as root."
    as_root "emerge ${cmdline}"
    return $?
}

function remove() {
    if [[ "$noconfirm" == "true" ]]; then
        cmdline="-y $@"
    else
        cmdline="$@"
    fi
    echo "Running 'emerge -cav ${cmdline}' as root."
    as_root "emerge -cav ${cmdline}"
    return $?
}

function update() {
    if [[ "$noconfirm" == "true" ]]; then
        cmdline="-y $@"
    else
        cmdline="$@"
    fi
    echo "Running 'emaint -a sync ${cmdline}' as root."
    as_root "emaint -a sync ${cmdline}"
    return $?
}

# function check() {
#     echo "Running '???'"
#     ???
#     return $?
# }

