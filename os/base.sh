#!/usr/bin/env bash

# terminate when an error occurs
set -o errexit
set -o pipefail

# detect uninitialised vars and terminate
set -o nounset

# prints every expression before executing it
set -o xtrace

CUR_DIR=$(pwd -P)

mkdir -p $HOME/{.zsh,.logs,.tmux,bin}
mkdir -p $HOME/.config/nvim/
mkdir -p $HOME/.config/alacritty/
mkdir -p $HOME/.local/share/nvim/site/autoload/
mkdir -p $HOME/.local/share/nvim/{undo,backup,swap}

# remove old prezto configs if they exist
declare -a PREZTO_ARR=("zprezto" "zlogin" "zlogout" "zpreztorc" "zprofile" "zshenv")
for i in "${PREZTO_ARR[@]}"
do
    rm -rf "${ZDOTDIR:-$HOME}"/."$i"
done

git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

# term envs
tic -x $CUR_DIR/tmux/xterm-256color-italic.terminfo
tic -x $CUR_DIR/tmux/tmux-256color.terminfo

# change default shell to zsh
# echo "$(which zsh)" >> /etc/shells
# chsh -s $(which zsh)
