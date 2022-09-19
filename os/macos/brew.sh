#!/usr/bin/env bash

# terminate when an error occurs
set -o errexit
set -o pipefail

# detect uninitialised vars and terminate
set -o nounset

# prints every expression before executing it
set -o xtrace

# needed by homebrew for some package executables
export PATH="/usr/local/sbin:$PATH"
PACKAGES=(zsh 
          jq
          bat
          exa
          duti
          fzf
          git
          readline
	  zoxide
          xz
          diff-so-fancy
          ripgrep
          neofetch
          neovim
          python
          tmux 
          cmake
	  reattach-to-user-namespace)

# install homebrew and deps
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# add brew to path
# echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/sbrown/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

brew update
brew upgrade
brew install ${PACKAGES[@]}

$(brew --prefix)/opt/fzf/install --all \

# brew cask install hyper amethyst 
brew install --cask kitty alacritty amethyst visual-studio-code
