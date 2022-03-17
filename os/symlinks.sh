#!/usr/bin/env bash

# terminate when an error occurs
set -o errexit
set -o pipefail

# detect uninitialised vars and terminate
set -o nounset

# prints every expression before executing it
set -o xtrace

CUR_DIR=$PWD

# prezto symlinks
ln -s "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/zlogin "${ZDOTDIR:-$HOME}/.zlogin"
ln -s "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/zlogout "${ZDOTDIR:-$HOME}/.zlogout"
ln -s "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/zpreztorc "${ZDOTDIR:-$HOME}/.zpreztorc"
ln -s "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/zprofile "${ZDOTDIR:-$HOME}/.zprofile"
ln -s "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/zshenv "${ZDOTDIR:-$HOME}/.zshenv"

# setup symlinks
ln -sfn $CUR_DIR/env/inputrc ~/.inputrc
ln -sfn $CUR_DIR/env/eslintrc.js ~/.eslintrc.js
ln -sfn $CUR_DIR/zsh/zshrc ~/.zshrc
ln -sfn $CUR_DIR/zsh/aliases.zsh ~/.zsh/aliases.zsh
ln -sfn $CUR_DIR/zsh/functions.zsh ~/.zsh/functions.zsh
ln -sfn $CUR_DIR/zsh/zpreztorc ~/.zpreztorc
ln -sfn $CUR_DIR/zsh/prompt_sbrown_setup ~/.zprezto/modules/prompt/functions/prompt_sbrown_setup

# terminals
ln -sfn $CUR_DIR/env/kitty $HOME/.config/kitty
ln -sfn $CUR_DIR/env/hyper.js $HOME/.hyper.js
ln -sfn $CUR_DIR/env/alacritty.yml $HOME/.config/alacritty/alacritty.yml

# vim
ln -sfn $CUR_DIR/nvim ~/.config/nvim
ln -sfn $CUR_DIR/nvim/snippets $HOME/.snippets

# tmux
ln -sfn $CUR_DIR/tmux/tmux.conf $HOME/.tmux.conf
ln -sfn $CUR_DIR/tmux/tmux.conf.linux $HOME/.tmux.conf.linux
ln -sfn $CUR_DIR/tmux/tmux.conf.mac $HOME/.tmux.conf.mac

# git
ln -sfn $CUR_DIR/git/gitconfig $HOME/.gitconfig
ln -sfn $CUR_DIR/git/gitignore_global $HOME/.gitignore_global

# JS/TS
ln -sfn $CUR_DIR/js/prettierrc.json $HOME/.prettierrc
ln -sfn $CUR_DIR/js/eslintrc $HOME/.eslintrc

# Rust
ln -sfn $CUR_DIR/rs/rustfmt.toml $HOME/.config/rustfmt/rustfmt.toml

# VS Code
ln -s $CUR_DIR/vscode/settings.json $HOME/Library/Application\ Support/Code/User/settings.json
ln -s $CUR_DIR/vscode/keybindings.json $HOME/Library/Application\ Support/Code/User/keybindings.json
ln -s $CUR_DIR/vscode/snippets $HOME/Library/Application\ Support/Code/User/snippets
