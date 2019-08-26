#!/bin/bash

export EDITOR=/usr/bin/nvim
export VISUAL=/usr/bin/code
export TERM=xterm-256color
export QT_QPA_PLATFORMTHEME="qt5ct"
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
export BROWSER=/usr/bin/brave
export XDG_CONFIG_HOME="$HOME/.config"
[[ -d "$HOME/.local/bin" ]] && PATH="$HOME/.local/bin:$PATH"
[[ -f "$HOME/.aliases" ]] && . "$HOME/.aliases"

if test "$(yarn --version 2> /dev/null)" && ! echo "$PATH" | grep -q  "yarn"; then
  export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
fi

if test "$(go version 2> /dev/null)"; then
  export GOPATH=$HOME/go
fi
