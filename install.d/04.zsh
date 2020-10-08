#!/bin/bash
. "$(dirname "$BASH_SOURCE")/../utils.sh"

zsh_path="$(which zsh)"

if ! grep -q "$zsh_path" /etc/shells; then
  title "Adding $zsh_path to /etc/shells"
  echo "$zsh_path" | sudo tee -a /etc/shells
fi

if [[ "$SHELL" != "$zsh_path" ]]; then
  title "Change the default shell to zsh"
  chsh -s "$zsh_path"
  progress "Default shell has been changed to $zsh_path"
fi
