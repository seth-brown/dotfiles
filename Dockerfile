FROM archlinux:latest
LABEL maintainer "Seth Brown <software@seth-brown.net>"

ENV LANG en_US.UTF-8
ENV TERM=xterm-256color
WORKDIR /root

RUN mkdir ./dotfiles
COPY bin ./dotfiles/bin
COPY env ./dotfiles/env
COPY arch ./dotfiles/arch
COPY git ./dotfiles/git
COPY zsh ./dotfiles/zsh
COPY vim ./dotfiles/vim
COPY tmux ./dotfiles/tmux

RUN cd ./dotfiles && ./bin/archlinux-install.sh
# CMD ["echo", "build passed!"]
CMD ["zsh"]
