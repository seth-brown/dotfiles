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
    shellcheck \
    diff-so-fancy \
    ripgrep \
    bat \
    exa \
    which \
    neofetch \
    tmux \
    neovim \
    nodejs \
    npm \
    eslint \
    flake8 \
    clang \
    boost \
    llvm-libs \
    make \
    cmake \
    gvim \
    python \
    python-pip 

$SHELL $CUR_DIR/os/base.sh

# these lines prevent python package build 
# problems by uninstalling and then
rm -rf /usr/lib/python3.?/site-packages/pip
pacman -Syu --noconfirm python-pip
pip install --user --upgrade neovim flake8

npm install -g @seth-brown/formd

$SHELL $CUR_DIR/os/symlinks.sh
$SHELL $CUR_DIR/os/vim.sh

# compile YouCompleteMe for vim
python $HOME/.config/nvim/plugged/YouCompleteMe/install.py --clang-completer --ts-completer --system-libclang
