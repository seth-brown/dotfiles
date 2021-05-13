Dotfiles
---------------

This repo is for configuring my terminal environment and other various system and development settings. My configuration is primarily targeted at macOS and Arch Linux as well as other Unix-like systems. The main toolchain uses a set of contemporary Unix tools like exa, bat, fzf, and ripgrep. I uses Alacritty as a terminal for OS cross-compatibility and the excellent [Operator Mono font](https://www.typography.com/blog/introducing-operator) with ligature support and italics thanks to [@kiliman](https://github.com/kiliman/operator-mono-lig). Other terminals can also be used like Kitty, Hyper, or iTerm2 configured with [Tokyo Night](https://github.com/folke/tokyonight.nvim) for theme consistancy.

![](dotfiles.jpg)

## Setup

Dotfiles can be installed with the following commands for Arch Linux or MacOS, respectively.

| OS     | Status | Snippet                                                |
|--------|--------|--------------------------------------------------------|
| Arch Linux | ![Arch Build Status](https://github.com/drbunsen/dotfiles/workflows/Arch%20Linux%20Build%20Status/badge.svg) | `./os/arch/install.sh` |
| MacOS      | ![MacOS Build Status](https://github.com/drbunsen/dotfiles/workflows/MacOS%20Build%20Status/badge.svg) | `./os/macos/install.sh` |


## Test with Docker

Build a test Arch Linux container using [Docker](https://www.docker.com) to validate the environment is set up correctly.

```shell
$ ./bin/archlinux-docker-setup.sh
```

## Noteworthy Packages

| Package                                                      | Description                                                      |
|--------------------------------------------------------------|------------------------------------------------------------------|
| [Alacritty](https://github.com/alacritty/alacritty)          | Cross-platform GPU-Accelerated Terminal Emulator                 |
| [zsh](https://github.com/zsh-users/zsh)                      | Z Shell (extended Bourne Shell)                                  |
| [prezto](https://github.com/sorin-ionescu/prezto)            | lightweight configuration framework for Zsh                      |
| [neovim](https://github.com/zsh-users/zsh)                   | extensible Vim-based text editor                                 |
| [tmux](https://github.com/tmux/tmux)                         | terminal multiplexer                                             |
| [fzf](https://github.com/junegunn/fzf)                       | fuzzy-finder for Zsh and Neovim                                  |
| [ripgrep](https://github.com/BurntSushi/ripgrep)             | faster grep with modern features                                 |
| [bat](https://github.com/sharkdp/bat)                        | modern cat clone                                                 |
| [exa](https://github.com/ogham/exa)                          | modern ls clone                                                  |
| [diff-so-fancy](https://github.com/so-fancy/diff-so-fancy)   | modern file differ                                               |
| [jq](https://stedolan.github.io/jq/)                         | sed for JSON data                                                |


## Language Support

Language support is minimal to keep the enviroment as light weight as possible and to allow individual customization. [`lspinstall`](https://github.com/kabouzeid/nvim-lspinstall) is provided for easy setup of whatever language servers are needed.
