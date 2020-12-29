#!/bin/bash
. "$(dirname "$BASH_SOURCE")/../utils.sh"

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

title "Running Neovim Python install"


if exists pip3; then
  warn "Command pip3 Not Found!"
else
  pip3 install --user neovim
fi
