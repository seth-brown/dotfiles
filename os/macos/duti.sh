#!/usr/bin/env sh
#!/usr/bin/env sh

# terminate when an error occurs
set -o errexit
set -o pipefail

# detect uninitialised vars and terminate
set -o nounset

# prints every expression before executing it
set -o xtrace

# get app id's via:
# lsappinfo | grep 'bundleID="' | cut -d'"' -f2 | sort
# osascript -e 'id of app "SomeApp"'

EDITOR="com.qvacua.VimR"

duti -s $EDITOR public.plain-text all
duti -s $EDITOR public.unix-executable all
duti -s $EDITOR .c all
duti -s $EDITOR .cpp all
duti -s $EDITOR .cs all
duti -s $EDITOR .css all
duti -s $EDITOR .go all
duti -s $EDITOR .java all
duti -s $EDITOR .js all
duti -s $EDITOR .sass all
duti -s $EDITOR .scss all
duti -s $EDITOR .less all
duti -s $EDITOR .vue all
duti -s $EDITOR .cfg all
duti -s $EDITOR .json all
duti -s $EDITOR .jsx all
duti -s $EDITOR .hs all
duti -s $EDITOR .lua all
duti -s $EDITOR .md all
duti -s $EDITOR .markdown all
duti -s $EDITOR .php all
duti -s $EDITOR .pl all
duti -s $EDITOR .py all
duti -s $EDITOR .rb all
duti -s $EDITOR .rs all
duti -s $EDITOR .ts all
duti -s $EDITOR .tsx all
duti -s $EDITOR .sh all
duti -s $EDITOR .swift all
duti -s $EDITOR .toml all
duti -s $EDITOR .txt all
duti -s $EDITOR .tex all
duti -s $EDITOR .svg all
duti -s $EDITOR .conf all

duti -s com.apple.Preview pdf all
