#!/bin/bash
. "$(dirname "$BASH_SOURCE")/../utils.sh"

if exists yay; then
  progress "yay already installed"
  exit 0
fi

title "Installing yay"
YAY_TEMP_DIR=$(mktemp -d)
git clone https://aur.archlinux.org/yay.git "$YAY_TEMP_DIR"
pushd "$YAY_TEMP_DIR" || exit
makepkg -si
popd || exit

progress "yay has been installed"
