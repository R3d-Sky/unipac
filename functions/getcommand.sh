# shellcheck source=functions/contains.sh
source functions/contains.sh

function getcommand() {
case $1 in
    "install")
        if contains "$functions install" ; then
            operation="install"
        else
            echo "Operation not supported on current platform."; return 2
        fi
        shift
        return 0;
        ;;
    "remove")
        if contains "$functions remove"; then
            operation="remove"
        else
            echo "Operation not supported on current platform."; return 2
        fi
        shift
        return 0;
        ;;
    "update")
        if contains "$functions update"; then
            operation="update"
        else
            echo "Operation not supported on current platform."; return 2
        fi
        shift
        return 0;
        ;;
    "help")
        run_help
        return 0;
        ;;
    *)
        echo "Invalid syntax"
        run_help
        return 1;
esac
}
