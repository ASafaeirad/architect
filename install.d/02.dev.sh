#!/bin/bash
. "$(dirname "$BASH_SOURCE")/../utils.sh"

dev=(
  ack
  bat
  bind-tools
  diff-so-fancy
  docker
  docker-compose
  emojify
  gcc
  git
  go
  grep
  neovim
  net-tools
  numlockx
  python
  python-pip
  python2
  python2-pip
  shellcheck
  tree
  unrar
  unzip
  wget
  xsel
  yarn
  zip
  zsh
)

title "Installing dev packages..."

for pkg in "${dev[@]}"; do
  pkg_name=$(echo "$pkg" | awk '{print $1}')
  progress "Installing $pkg_name"
  sudo pacman -Sq "$pkg" --noconfirm
done
 
