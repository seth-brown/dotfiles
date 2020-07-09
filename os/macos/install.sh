#!/usr/bin/env bash

# terminate when an error occurs
set -o errexit
set -o pipefail

# detect uninitialised vars and terminate
set -o nounset

# prints every expression before executing it
set -o xtrace

CUR_DIR=$(pwd -P)

# needed by homebrew for some package executables
export PATH="/usr/local/sbin:$PATH"
PACKAGES="zsh \
          jq \
          bat \
          exa \
          fzf \
          git \
          readline \
          xz \
          diff-so-fancy \
          ripgrep \
          neofetch \
          neovim \
          python \
          tmux \
          cmake \
          reattach-to-user-namespace"

# install homebrew and deps
CI=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
brew update || brew update
brew upgrade
brew install $PACKAGES
brew cask install hyper amethyst
brew tap homebrew/cask-fonts
brew cask install font-fira-code

$SHELL $CUR_DIR/os/base.sh
$SHELL $CUR_DIR/os/symlinks.sh
$SHELL $CUR_DIR/os/python.sh
$SHELL $CUR_DIR/os/node.sh

# # install nodejs
# curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
# source $HOME/.nvm/nvm.sh
# nvm install node
# npm install -g @seth-brown/formd

$SHELL $CUR_DIR/os/vim.sh
