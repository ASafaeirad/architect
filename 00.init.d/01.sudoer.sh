#!/bin/bash
. "$(dirname "$BASH_SOURCE")/../utils.sh"

RULE="$USER ALL=(ALL) NOPASSWD: ALL"
SUDOER="/etc/sudoers"
if sudo grep -Fxq "$RULE" "$SUDOER"; then
  progress "$USER already exists in sudoers"
else
  title "Adding $USER to sudoers"
  echo $RULE | sudo tee -a $SUDOER >/dev/null
  progress "Done!"
fi
