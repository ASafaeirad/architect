#!/bin/bash
. "$(dirname "$BASH_SOURCE")/../utils.sh"

title "Configuring timezone"
timedatectl set-local-rtc 1 --adjust-system-clock
progress "Done!"


RULE="$USER ALL=(ALL) NOPASSWD: ALL"
SUDOER="/etc/sudoers"
if sudo grep -Fxq "$RULE" "$SUDOER"
then
  progress "$USER already exists in sudoers"
else
  title "Adding $USER to sudoers"
  echo $RULE | sudo tee -a $SUDOER > /dev/null
  progress "Done!"
fi



title "Fixing max watches"
if [ ! -f /etc/sysctl.d/40-max-user-watches.conf ]; then
  echo fs.inotify.max_user_watches=524288 | sudo tee /etc/sysctl.d/40-max-user-watches.conf && sudo sysctl --system
fi

progress "Done!"

