#!/bin/sh

EMACS_PATH=$(test -n "$XDG_CONFIG_HOME" && echo "$XDG_CONFIG_HOME/emacs" || echo "~/.emacs.d")

# git clone --depth 1 https://github.com/hlissner/doom-emacs $EMACS_PATH

"$EMACS_PATH/bin/doom" install
