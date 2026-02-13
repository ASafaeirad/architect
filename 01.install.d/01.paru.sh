#!/bin/bash
. "$(dirname "$BASH_SOURCE")/../utils.sh"

if exists paru; then
  progress "paru already installed"
  exit 0
fi

title "Installing rustup"
sudo pacman -Sy rustup

title "Set rustup channel to stable"
rustup default stable

title "Installing paru"
PARU_TEMP_DIR=$(mktemp -d)
git clone https://aur.archlinux.org/paru.git "$PARU_TEMP_DIR"

pushd "$PARU_TEMP_DIR" || exit
makepkg -si
popd || exit

sudo sed -i 's/#BottomUp/BottomUp/' /etc/paru.conf
sudo sed -i 's/#Color/Color/' /etc/pacman.conf

progress "paru has been installed"
