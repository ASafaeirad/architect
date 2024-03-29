#!/bin/bash
. "$(dirname "$BASH_SOURCE")/../utils.sh"

title "Installing DOOM Emacs"

pacman -S --noconfirm emacs > /dev/null
EMACS_PATH="${XDG_CONFIG_HOME:-$HOME/.config}/emacs"
git clone --depth 1 https://github.com/hlissner/doom-emacs $EMACS_PATH
"$EMACS_PATH/bin/doom" install

progress "Done!"
