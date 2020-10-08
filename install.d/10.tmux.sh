#!/bin/bash
. "$(dirname "$BASH_SOURCE")/../utils.sh"

title "Install tmux plugin manager"

git clone https://github.com/tmux-plugins/tpm "$HOME/.config/tmux/plugins/tpm"

progress "Tmux plugin manager installed successfully"
