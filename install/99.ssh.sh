#!/bin/bash
. "$(dirname "$BASH_SOURCE")/../utils/echo.sh"

title "Generating SSH Key..."
ssh-keygen -t rsa -b 4096 -C "$HOST"

xsel --clipboard -i <"$HOME/.ssh/id_rsa.pub"

progress "SSH public key copied to clipboard"
