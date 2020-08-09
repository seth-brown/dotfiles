#!/usr/bin/env bash

# terminate when an error occurs
set -o errexit
set -o pipefail

# detect uninitialised vars and terminate
set -o nounset

# prints every expression before executing it
set -o xtrace

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# install neovim plugins
nvim +silent +PlugInstall +qall

# # compile YouCompleteMe for vim
# python3 $HOME/.config/nvim/plugged/YouCompleteMe/install.py \
#     --clang-completer --ts-completer --system-libclang
