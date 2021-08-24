#!/bin/bash
. "$(dirname "$BASH_SOURCE")/../utils.sh"

mkdir -m 700 "${XDG_DATA_HOME:-$HOME/.local/share}/gnupg"

while true; do
  echo -en "Do you want to generate GPG key? [y/N] "
  read -rn1 -p "" confirm
  case $confirm in
  [yY][eE][sS] | [yY])
    title "Generating GPG Key..."
    gpg --full-gen-key
    progress "GPG key successfully created"
    break
    ;;
  [nN][oO] | [nN])
    echo
    break
    ;;
  *)
    echo "Invalid input..."
    ;;
  esac
done
