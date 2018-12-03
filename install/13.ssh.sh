#!/bin/bash
INSTALLDIR=$(dirname "$BASH_SOURCE")
. "$INSTALLDIR/../utils/echo.sh"

title "Generating SSH Key..."
ssh-keygen -t rsa -b 4096 -C "$HOST"

xsel --clipboard -i < "$HOME/.ssh/id_rsa.pub"
process "SSH public key is now in clipboard"
