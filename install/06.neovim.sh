#!/bin/bash
. "$(dirname "$BASH_SOURCE")/../utils/echo.sh"

title "Running Neovim Python install"

if test ! "$(pip2 --version 2>/dev/null)"; then
  warn "Command pip2 Not Found!"
else
  pip2 install --user neovim
fi

if test ! "$(pip3 --version 2>/dev/null)"; then
  warn "Command pip3 Not Found!"
else
  pip3 install --user neovim
fi
