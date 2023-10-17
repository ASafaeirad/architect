#!/bin/bash
. "$(dirname "$BASH_SOURCE")/../utils.sh"

apps=(
  anydesk
  brave-bin
  discord
  firefox
  nemo
  peek
  persepolis-git
  slack-desktop
  telegram-desktop
  visual-studio-code-bin
)

title "Installing apps"

for pkg in "${apps[@]}"; do
  pkg_name=$(echo "$pkg" | awk '{print $1}')

  while true; do
    echo -en "Do you want to install ${CYAN}${pkg_name}?${NC} [y/N] "
    read -rn1 -p "" confirm
    case $confirm in
    [yY][eE][sS] | [yY])
      title "Installing $pkg_name"
      paru -Sq "$pkg" --noconfirm > /dev/null
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
