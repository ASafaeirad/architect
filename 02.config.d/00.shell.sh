#!/bin/bash
. "$(dirname "$BASH_SOURCE")/../utils.sh"

ZSH_PATH="$(which zsh)"

title "Adding zshenv"
sudo tee /etc/zsh/zshenv > /dev/null <<'_EOF'
ZDOTDIR=$HOME/.config/zsh
_EOF

if ! grep -q "$ZSH_PATH" /etc/shells; then
  title "Adding $ZSH_PATH to /etc/shells"
  echo "$ZSH_PATH" | sudo tee -a /etc/shells
fi

if [[ "$SHELL" != "$ZSH_PATH" ]]; then
  title "Change the default shell to zsh"
  chsh -s "$ZSH_PATH"
  progress "Default shell has been changed to $ZSH_PATH"
fi
