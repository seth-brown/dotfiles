#!/usr/bin/env zsh

# terminate when an error occurs
set -o errexit
set -o pipefail

# detect uninitialised vars and terminate
set -o nounset

# prints every expression before executing it
set -o xtrace

rm -rf $(pyenv root)
rm -rf ~/.pyenv
curl https://pyenv.run | bash
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# PIP="pip"
# if ! type "$PIP" > /dev/null; then
#     PIP="pip3"
# fi

# https://github.com/neovim/neovim/wiki/Following-HEAD#20181118
python3 -m pip install flake8 pynvim

# poetry
curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python3
source $HOME/.poetry/env
