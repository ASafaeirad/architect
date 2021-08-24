#!/bin/bash
. "$(dirname "$BASH_SOURCE")/../utils.sh"

apps=(
  anydesk
  brave-bin
  cheat-git
  cheese
  chromium
  discord
  firefox
  gimp
  gparted
  insomnia
  nemo
  pcmanfm
  peek
  persepolis-git
  slack
  telegram-desktop
  tor-browser
  typora
  visual-studio-code-bin
  vlc
)

title "Installing apps"

for pkg in "${apps[@]}"; do
  pkg_name=$(echo "$pkg" | awk '{print $1}')

  while true; do
    echo -en "Do you want to install ${CYAN}${pkg_name}?${NC} [y/N] "
    read -rn1 -p "" confirm
    case $confirm in
    [yY][eE][sS] | [yY])
      paru -Sq "$pkg" --noconfirm
      progress "$pkg_name Installed"
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
done