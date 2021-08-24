#!/bin/bash
. "$(dirname "$BASH_SOURCE")/../utils.sh"

title "Installing tmux"
sudo pacman -Sq tmux --noconfirm
progress "Done!"

TPM_HOME="${XDG_CONFIG_HOME:-$HOME/.config}/tmux/plugins/tpm"

if [ ! -d "$TPM_HOME" ]; then
  title "Installing tmux plugin manager"
  git clone https://github.com/tmux-plugins/tpm "$TPM_HOME"
  progress "Done!"
fi
