#!/usr/bin/env bash

# terminate when an error occurs
set -o errexit
set -o pipefail

# detect uninitialised vars and terminate
set -o nounset

# prints every expression before executing it
set -o xtrace

CUR_DIR=$(pwd -P)

# install main packages
pacman -Sy --noconfirm \
    git \
    zsh \
    fzf \
    base-devel \
    openssl \
    zlib \
    bzip2 \
    readline \
    sqlite curl \
    llvm \
    ncurses \
    xz \
    tk \
    libffi \
    python-pyopenssl \
    shellcheck \
    diff-so-fancy \
    ripgrep \
    bat \
    exa \
    which \
    neofetch \
    tmux \
    neovim \
    npm \
    eslint \
    flake8 \
    clang \
    boost \
    llvm-libs \
    make \
    cmake \
    gvim \
    kitty \
    python \
    python-pip 

$SHELL $CUR_DIR/os/base.sh
$SHELL $CUR_DIR/os/symlinks.sh
$SHELL $CUR_DIR/os/python.sh
$SHELL $CUR_DIR/os/node.sh
$SHELL $CUR_DIR/os/vim.sh
