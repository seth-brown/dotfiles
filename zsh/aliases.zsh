# fzf
alias fzfi='rg --files --hidden --follow --no-ignore-vcs -g "!{node_modules,.git}" | fzf'

# basic unix
alias cl='clear'
alias ll='ls -lh'
alias lc='ls -1'
alias ec='exa -1'
alias eg='exa -1 --git-ignore'
alias et='exa -T'
alias ea='exa -al'
alias mcm='make clean && make'

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

# if docker is installed, add these alias
type docker >/dev/null 2>&1 && alias dl="docker ps -a"
type docker >/dev/null 2>&1 && alias dk="docker rm $(docker ps -a -q)"
type docker >/dev/null 2>&1 && alias dr="docker rmi $(docker images | grep '^<none>' | awk '{print $3}')"
