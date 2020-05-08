#!/usr/bin/env bash

# terminate when an error occurs
set -o errexit
set -o pipefail

# detect uninitialised vars and terminate
set -o nounset

# prints every expression before executing it
set -o xtrace

docker build  -t dotfiles . &&  docker run --hostname arch-env -ti dotfiles
