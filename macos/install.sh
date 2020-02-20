#!/usr/bin/env bash


# terminate when an error occurs
set -o errexit
set -o pipefail

# detect uninitialised vars and terminate
# set -o nounset

# prints every expression before executing it
# set -o xtrace

CUR_DIR=$(pwd -P)

# needed by homebrew for some package executables
export PATH="/usr/local/sbin:$PATH"
PACKAGES="zsh \
          jq \
          bat \
          exa \
          fzf \
          git \
          diff-so-fancy \
          ripgrep \
          neofetch \
          python3 \
          flake8 \
          neovim \
          tmux \
          reattach-to-user-namespace"

# install homebrewa and deps
# cmake macvim eslint nvm node may also be needed, but crash the test build
sudo chown -R $(whoami) $(brew --prefix)/*
CI=1 /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update || brew update
brew upgrade
brew install $PACKAGES
brew cask install hyper

# make
mkdir -p $HOME/{.zsh,.logs,.tmux,node}
mkdir -p $HOME/.config/nvim/
mkdir -p $HOME/.local/share/nvim/site/autoload/
mkdir -p $HOME/.local/share/nvim/{undo,backup,swap}

declare -a PREZTO_ARR=("zprezto" "zlogin" "zlogout" "zpreztorc" "zprofile" "zshenv")
for i in "${PREZTO_ARR[@]}"
do
    rm -rf "${ZDOTDIR:-$HOME}"/."$i"
done

git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
ln -s "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/zlogin "${ZDOTDIR:-$HOME}/.zlogin"
ln -s "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/zlogout "${ZDOTDIR:-$HOME}/.zlogout"
ln -s "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/zpreztorc "${ZDOTDIR:-$HOME}/.zpreztorc"
ln -s "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/zprofile "${ZDOTDIR:-$HOME}/.zprofile"
ln -s "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/zshenv "${ZDOTDIR:-$HOME}/.zshenv"

# setup symlinks
ln -sfn $CUR_DIR/env/inputrc ~/.inputrc
ln -sfn $CUR_DIR/zsh/zshrc ~/.zshrc
ln -sfn $CUR_DIR/zsh/aliases.zsh ~/.zsh/aliases.zsh
ln -sfn $CUR_DIR/zsh/functions.zsh ~/.zsh/functions.zsh
ln -sfn $CUR_DIR/zsh/zpreztorc ~/.zpreztorc
ln -sfn $CUR_DIR/zsh/prompt_sbrown_setup ~/.zprezto/modules/prompt/functions/prompt_sbrown_setup

pip3 install --user --upgrade neovim flake8
npm install typescript

# vim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

ln -nsf $CUR_DIR/vim/vimrc ~/.config/nvim/init.vim
nvim +silent +PlugInstall +qall

# compile YouCompleteMe
python3 $HOME/.config/nvim/plugged/YouCompleteMe/install.py --ts-completer

ln -sfn $CUR_DIR/vim/snippets $HOME/.snippets

##tmux
ln -sfn $CUR_DIR/tmux/tmux.conf $HOME/.tmux.conf
ln -sfn $CUR_DIR/tmux/tmux.conf.linux $HOME/.tmux.conf.linux
ln -sfn $CUR_DIR/tmux/tmux.conf.mac $HOME/.tmux.conf.mac

# git
ln -sfn $CUR_DIR/git/gitconfig $HOME/.gitconfig
ln -sfn $CUR_DIR/git/gitignore $HOME/.gitignore

# hyper
ln -sfn $CUR_DIR/env/hyper.js $HOME/.hyper.js

# change default shell to zsh
# chsh -s /usr/sbin/zsh
