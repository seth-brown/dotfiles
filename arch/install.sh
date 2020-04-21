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

# these 2 lines prevent python package build problems by uninstalling and then
# reinstalling pip
rm -rf /usr/lib/python3.?/site-packages/pip
pacman -Syu --noconfirm python-pip

pip install --user --upgrade neovim flake8
npm install typescript

# vim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

ln -nsf $CUR_DIR/vim/vimrc ~/.config/nvim/init.vim
nvim +silent +PlugInstall +qall

# compile YouCompleteMe
python $HOME/.config/nvim/plugged/YouCompleteMe/install.py --clang-completer --ts-completer --system-libclang

# ln -sfn $ROOT/dotfiles/vim/snippets $ROOT/.snippets
ln -sfn $CUR_DIR/vim/snippets $HOME/.snippets

##tmux
ln -sfn $CUR_DIR/tmux/tmux.conf $HOME/.tmux.conf
ln -sfn $CUR_DIR/tmux/tmux.conf.linux $HOME/.tmux.conf.linux
ln -sfn $CUR_DIR/tmux/tmux.conf.mac $HOME/.tmux.conf.mac

# git
ln -sfn $CUR_DIR/git/gitconfig $HOME/.gitconfig
ln -sfn $CUR_DIR/git/gitignore $HOME/.gitignore

# term envs
tic -x $CUR_DIR/tmux/xterm-256color-italic.terminfo
tic -x $CUR_DIR/tmux/tmux-256color.terminfo

# hyper
ln -sfn $CUR_DIR/env/hyper.js $HOME/.hyper.js

# change default shell to zsh
chsh -s /usr/sbin/zsh
