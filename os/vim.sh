#!/usr/bin/env bash

# terminate when an error occurs
set -o errexit
set -o pipefail

# detect uninitialised vars and terminate
set -o nounset

# prints every expression before executing it
set -o xtrace

# install packer
# git clone https://github.com/wbthomason/packer.nvim\
#  ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# install neovim plugins
# nvim +silent +PlugInstall +qall
# nvim +silent +PackerCompile +PackerSync
