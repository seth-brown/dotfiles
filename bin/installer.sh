#!/usr/bin/env bash

# terminate when an error occurs
set -o errexit
set -o pipefail

# detect uninitialised vars and terminate
set -o nounset

# prints every expression before executing it
set -o xtrace

verify_os() {

    MINIMUM_MACOS_VERSION="10.10"
    MINIMUM_ARCH_VERSION="18.04"

    local os_name="$(get_os)"
    local os_version="$(get_os_version)"

    if [ "$os_name" == "macos" ]; then

        if is_supported_version "$os_version" "$MINIMUM_MACOS_VERSION"; then
            return 0
        else
            printf "Sorry, this installer is intended only for macOS %s+" "$MINIMUM_MACOS_VERSION"
        fi

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Check if the OS is `Ubuntu` and
    # it's above the required version.

    elif [ "$os_name" == "arch" ]; then

        if is_supported_version "$os_version" "$MINIMUM_UBUNTU_VERSION"; then
            return 0
        else
            printf "Sorry, this installer is intended only for macOS %s+" "$MINIMUM_MACOS_VERSION"
        fi

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    else
        printf "Sorry, this script is intended only for macOS or Arch Linux!"
    fi

    return 1
}
