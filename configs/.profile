#!/bin/bash

export EDITOR=/usr/bin/nvim
export TERM=xterm-256color

if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "/usr/local/bin" ] ; then
    PATH="/usr/local/bin:$PATH"
fi

# Export nvm and load NVM
if [ -d /home/monster/.nvm ]; then
  export NVM_DIR="/home/monster/.nvm"
fi

if test "$(yarn --version 2> /dev/null)"; then
    PATH="$PATH:$(yarn global bin)"
fi

 if [ -f "$HOME/.aliases" ]; then
    . "$HOME/.aliases"
 fi
