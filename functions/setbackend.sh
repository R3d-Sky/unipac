# Use /etc/os-release to get ID and compare to a set of known values

function setbackend() {
    distro="$(egrep -i "^id=" /etc/os-release | cut -d"=" -f2)"

    case $distro in
    "arch"|"archarm")
        abdistro="arch"
        # shellcheck source=backends/arch.sh
        source backends/arch.sh
        ;;
    "ubuntu"|"debian"|"linuxmint")
        abdistro="deb"
        # shellcheck source=backends/debian.sh
        source backends/debian.sh
        ;;
    "gentoo")
        abdistro="gentoo"
        # shellcheck source=backends/gentoo.sh
        source backends/gentoo.sh
        ;;
    "rhel"|"centos"|"fedora")
        abdistro="rpm"
        # shellcheck source=backends/rpm.sh
        source backends/rpm.sh
        ;;
    *)
        echo "Unsupported distro :("
        return 2;
        ;;
    esac
    
    functions="$functions help"
}

