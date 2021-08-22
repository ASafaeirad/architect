#!/bin/bash
. "$(dirname "$BASH_SOURCE")/../utils.sh"

title "Installing tmux"
pacman -Sq tmux --noconfirm
progress "Done!"

title "Installing tmux plugin manager"
git clone https://github.com/tmux-plugins/tpm "$HOME/.config/tmux/plugins/tpm"
progress "Done!"
