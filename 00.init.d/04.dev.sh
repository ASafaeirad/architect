#!/bin/bash
. "$(dirname "$BASH_SOURCE")/../utils.sh"

dev=(
  acpi
  alsa-utils
  autoconf
  automake
  bind-tools
  binutils
  curl
  dosfstools
  file
  findutils
  fx
  fzf
  gawk
  gcc
  git
  git-delta
  github-cli
  go
  grep
  gzip
  inxi
  jq
  less
  lm_sensors
  make
  mtools
  net-tools
  nmap
  ntp
  patch
  perl-rename
  pkgconf
  python
  python-pip
  rustup
  sed
  shellcheck
  sudo
  tree
  unrar
  unzip
  neovim
  wget
  which
  xdg-user-dirs
  xdg-utils
  zip
  zsh
)

title "Installing dev packages..."

sudo pacman -S --needed base-devel

for pkg in "${dev[@]}"; do
  pkg_name=$(echo "$pkg" | awk '{print $1}')
  progress "Installing $pkg_name"
  sudo pacman -Sq "$pkg" --noconfirm >/dev/null
done
