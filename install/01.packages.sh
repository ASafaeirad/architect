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
  compton
  epdfview
  palemoon-bin
)

apps=(
  anydesk
  betterlockscreen-git
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
  docker
  docker-compose
  diff-so-fancy
  emojify
  gcc
  git
  go
  grep
  neovim
  net-tools
  numlockx
  python
  python2
  python-pip
  python2-pip
  shellcheck
  tmux
  tree
  unrar
  unzip
  wget
  yarn
  xsel
  zip
  zsh
)

desktop=(
  blueman
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
  perl-rename
  picom
  polybar-git
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
  sudo pacman -S "$pkg" --noconfirm
done

if test ! "$(yay --version)"; then
  title "Installing yay"
  mkdir -p /tmp/yay
  git clone https://aur.archlinux.org/yay.git /tmp/yay
  cd /tmp/yay || exit
  makepkg -si
fi

allpackages=("${desktop[@]}" "${apps[@]}")

title "Installing packages..."

for pkg in "${allpackages[@]}"; do
  pkg_name=$(echo "$pkg" | awk '{print $1}')
  progress "Installing $pkg_name"
  yay -S "$pkg" --noconfirm
done

# for aur in "${remove[@]}"; do
#     progress "Installing $aur_name"
#     yay -S "$aur" --noconfirm
# done

title "Clean the nonneeded packages..."
yay -Yc
