#!/bin/bash
. "$(dirname "$BASH_SOURCE")/../utils.sh"

title "Configuring timezone"
timedatectl set-ntp 1 --adjust-system-clock
progress "Done!"
