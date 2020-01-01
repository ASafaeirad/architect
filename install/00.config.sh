#!/bin/bash
. "$(dirname "$BASH_SOURCE")/../utils/echo.sh"

title "Configuring timezone"
timedatectl set-local-rtc 1 --adjust-system-clock

title "Add $USER to sudoers"
echo "$USER ALL=(ALL) NOPASSWD: ALL" | sudo tee -a /etc/sudoers >/dev/null
