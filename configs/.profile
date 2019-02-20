#!/bin/bash

export EDITOR=/usr/bin/nvim
export VISUAL=/usr/bin/code
export TERM=xterm-256color
export QT_QPA_PLATFORMTHEME="qt5ct"
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
export BROWSER=/usr/bin/chromium
export XDG_CONFIG_HOME="$HOME/.config"

[[ -d "$HOME/.local/bin" ]] && PATH="$HOME/.local/bin:$PATH"
[[ -d "/usr/local/bin" ]] && PATH="/usr/local/bin:$PATH"
[[ -f "$HOME/.aliases" ]] && . "$HOME/.aliases"

if test "$(yarn --version 2> /dev/null)"; then
    PATH="$PATH:$(yarn global bin)"
fi

# Export nvm and load NVM
[[ -d "$HOME/.nvm" ]] && export NVM_DIR="$HOME/.nvm"
