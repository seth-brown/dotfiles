#!/usr/bin/env bash

# terminate when an error occurs
set -o errexit
set -o pipefail

# detect uninitialised vars and terminate
set -o nounset

# prints every expression before executing it
set -o xtrace

CUR_DIR=$(pwd -P)

$SHELL $CUR_DIR/os/macos/brew.sh
$SHELL $CUR_DIR/os/base.sh
$SHELL $CUR_DIR/os/symlinks.sh
$SHELL $CUR_DIR/os/python.sh
$SHELL $CUR_DIR/os/node.sh

$SHELL $CUR_DIR/os/vim.sh
$SHELL $CUR_DIR/os/macos/duti.sh


