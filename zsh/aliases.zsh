# fzf
alias fzfi='rg --files --hidden --follow --no-ignore-vcs -g "!{node_modules,.git}" | fzf'

# basic unix
alias rm="nocorrect rm"
alias cl='clear'
alias lc=lc
alias lt=lt
alias mcm='make clean && make'
alias rwget='wget -mkEpnp'

# dotfiles
alias zrc="vim $HOME/dotfiles/zsh/zshrc"
alias vrc="vim $HOME/dotfiles/vim/vimrc"
alias trc="vim $HOME/dotfiles/tmux/tmux.conf"

# vim 
alias vim='nvim'
alias v='vim'
alias vf='vim $(fzfi)'

# git 
alias g=git

# tmux
alias tns='tmux new -s'
alias tat='tmux attach -t'
alias tks='tmux kill-session -t'
alias tls='tmux ls'

# text files short-cut
alias txt="cd $HOME/Library/Mobile\ Documents/iCloud~md~obsidian/Documents/txt"

# list images
type docker >/dev/null 2>&1 && alias dl="docker ps -a"

# remove all containers and images 
type docker >/dev/null 2>&1 && alias drm="docker system prune -a"

# if homebrew is installed
type brew >/dev/null 2>&1 && alias brewer='brew update && brew upgrade && brew cleanup && brew doctor'

# use coreutil's date, gdate if available
type date >/dev/null 2>&1 && alias date='gdate'
