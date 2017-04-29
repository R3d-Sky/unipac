# FreeBSD beta support
# TODO: noconfirm support
source functions/root.sh

devpkg=""
functions="install remove update"

function install() {
    #if [[ "$noconfirm" == "true" ]]; then
    #    cmdline="-y $@"
    #else
    #    cmdline="$@"
    #fi
    echo "Running 'pkg install ${cmdline}' as root."
    as_root "pkg install ${cmdline}"
    return $?
}

function remove() {
    #if [[ "$noconfirm" == "true" ]]; then
    #    cmdline="-y $@"
    #else
    #    cmdline="$@"
    #fi
    echo "Running 'pkg delete ${cmdline}' as root."
    as_root "pkg delete ${cmdline}"
    return $?
}

function update() {
    #if [[ "$noconfirm" == "true" ]]; then
    #    cmdline="-y $@"
    #else
    #    cmdline="$@"
    #fi
    echo "Running 'emaint -a sync ${cmdline}' as root."
    as_root "emaint -a sync ${cmdline}"
    return $?
}

# function check() {
#     echo "Running '???'"
#     ???
#     return $?
# }
