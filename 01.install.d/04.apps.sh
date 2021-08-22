#!/bin/bash
. "$(dirname "$BASH_SOURCE")/../utils.sh"

apps=(
  anydesk
  brave-bin
  cheese
  cheat-git
  chromium
	discord
  firefox
  gimp
  gparted
  insomnia
  peek
  persepolis-git
  telegram-desktop
  typora
  vlc
  visual-studio-code-bin
  tor-browser
  pcmanfm
  nemo
)

title "Installing apps"

for pkg in "${apps[@]}"; do
  pkg_name=$(echo "$pkg" | awk '{print $1}')

  while true
  do
    echo -en "Do you want to install ${CYAN}${pkg_name}?${NC} [y/N] "
    read -rn1 -p "" confirm
    case $confirm in
      [yY][eE][sS]|[yY])
        paru -Sq "$pkg" --noconfirm
        progress "$pkg_name Installed"
	break
	;;
      [nN][oO]|[nN])
        echo
        break
        ;;
      *)
        echo "Invalid input..."
        ;;
    esac
  done
done


