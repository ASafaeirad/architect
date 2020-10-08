#!/bin/bash
. "$(dirname "$BASH_SOURCE")/../utils.sh"

title "Configuring timezone"
timedatectl set-local-rtc 1 --adjust-system-clock
progress "Done!"

title "Adding $USER to sudoers"
echo "$USER ALL=(ALL) NOPASSWD: ALL" | sudo tee -a /etc/sudoers >/dev/null
progress "Done!"

title "Fixing max watches"
if [ ! -f /etc/sysctl.d/40-max-user-watches.conf ]; then
  echo fs.inotify.max_user_watches=524288 | sudo tee /etc/sysctl.d/40-max-user-watches.conf && sudo sysctl --system
fi
progress "Done!"
