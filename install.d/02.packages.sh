#!/bin/bash
. "$(dirname "$BASH_SOURCE")/../utils.sh"

read -rn 1 -p "Update Mirrors? [y/N] " umirrors
echo

if [[ $umirrors =~ ^([Yy])$ ]]; then
  title "Update Mirrors"
  sudo pacman-mirrors --fasttrack
fi

read -rn 1 -p "Sync Mirrors? [y/N] " sync
echo

if [[ $sync =~ ^([Yy])$ ]]; then
  title "Sync Mirrors"
  yay -Syu --noconfirm
fi

remove=(
  i3-lock
  compton
  epdfview
  palemoon-bin
)

apps=(
  anydesk
  brave
  cheese
  cheat-git
  chromium
  firefox
  gimp
  gparted
  insomnia
  peek
  persepolis-git
  telegram-desktop-bin
  typora
  vlc
  vscodium-bin
  wireguard-tools
  wireguard-dkms
  # tor-browser
)

dev=(
  ack
  bat
  bind-tools
  deno_bin # deno takes times.
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
	xcwd
)

desktop=(
  blueman
  betterlockscreen-git
  capitaine-cursors
  clipit
  conky
  dunst
  ffmpegthumbnailer
  flameshot
  flasfocus-git
  i3-gaps
  i3exit
  lm_sensors
  hardcore-tray
  manjaro-pulse
  mpv
  neofetch
  nitrogen
  nmap
  pavucontrol
	pass
	pass-git-helper
  perl-rename
  picom
  polybar-git
	# privoxy
  ranger
  redshift
  slop
  termite
  tumbler
  viewnior
  volumeicon
  xwininfo
  xsensors
  # pcmanfm
  # nemo
)

title "Installing dev packages..."

for pkg in "${dev[@]}"; do
  pkg_name=$(echo "$pkg" | awk '{print $1}')
  progress "Installing $pkg_name"
  yay -S "$pkg" --noconfirm
done

title "Installing desktop apps..."

allpackages=("${desktop[@]}" "${apps[@]}")

for pkg in "${allpackages[@]}"; do
  pkg_name=$(echo "$pkg" | awk '{print $1}')
  progress "Installing $pkg_name"
  yay -S "$pkg" --noconfirm
done

for pkg in "${remove[@]}"; do
  pkg_name=$(echo "$pkg" | awk '{print $1}')
  progress "Removing $pkg_name"
  yay -Rns "$pkg" --noconfirm
done

title "Clean the nonneeded packages..."
yay -Yc
