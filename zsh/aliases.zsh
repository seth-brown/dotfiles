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

# list images
type docker >/dev/null 2>&1 && alias dl="docker ps -a"
# remove all containers and images 
type docker >/dev/null 2>&1 && alias drm="docker rm -vf $(docker ps -a -q) && docker rmi -f $(docker images -a -q)"

# if homebrew is installed
type brew >/dev/null 2>&1 && alias brewer='brew update && brew upgrade && brew cleanup && brew doctor'

