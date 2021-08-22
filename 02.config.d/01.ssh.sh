#!/bin/bash
. "$(dirname "$BASH_SOURCE")/../utils.sh"

title "Generating SSH Key..."
ssh-keygen -t ed25519 -C "$USER@$HOST"
ssh-keygen -t rsa -b 4096 -C "$USER@$HOST"

xsel --clipboard -i < "$HOME/.ssh/id_ed25519.pub"

progress "SSH public key copied to clipboard"
