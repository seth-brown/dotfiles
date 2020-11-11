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

# search

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
type docker >/dev/null 2>&1 && alias drm="docker system prune -a"

# if homebrew is installed
type brew >/dev/null 2>&1 && alias brewer='brew update && brew upgrade && brew cleanup && brew doctor'

# pdfmerge OUTPUT.pdf *.pdf
PDFMERGE_PATH="/System/Library/Automator/Combine PDF Pages.action/Contents/Resources/join.py"
type $PDFMERGE_PATH >/dev/null 2>&1 && alias pdfmerge='"$PDFMERGE_PATH" -o'

# use exa if installed
function lc() {
    if hash exa 2>/dev/null; then
        exa -1
    else 
        ls -1
    fi
}

# use exa if installed
function lt() {
    if hash exa 2>/dev/null; then
        exa -T --level=2
    else 
        ls
    fi
}
