#!/usr/bin/env bash

# shell script to change master to main
# after this script is executed, change the default branch in github to main:
# settings > branches > main

# terminate when an error occurs
set -o errexit
set -o pipefail

# detect uninitialised vars and terminate
set -o nounset

# prints every expression before executing it
set -o xtrace

git branch -m master main
git push origin HEAD:master
git push origin HEAD
git branch -u origin/main main


