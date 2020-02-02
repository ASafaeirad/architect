#!/bin/bash
. "$(dirname "$BASH_SOURCE")/../utils/echo.sh"

read -rn 1 -p "Update Mirrors? [y/N] " umirrors
echo

if [[ $umirrors =~ ^([Yy])$ ]]; then
    title "Update Mirrors"
    sudo pacman-mirrors --fasttrack
fi

if test ! "$(yay --version)"; then
    title "Installing yay"
    mkdir -p /tmp/yay
    git clone https://aur.archlinux.org/yay.git /tmp/yay
    cd /tmp/yay || exit
    makepkg -si
fi

read -rn 1 -p "Sync Mirrors? [y/N] " sync
echo
if [[ $sync =~ ^([Yy])$ ]]; then
    title "Sync Mirrors"
    sudo yay -Syu --noconfirm
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
    # tor-browser
)

dev=(
    ack
    bat
    bind-tools
    docker
    docker-compose
    gcc
    git
    go
    grep
    neovim
    net-tools
    numlockx
    python
    python2
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
		emojify
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
    manjaro-pulse
		mpv
    nitrogen
    neofetch
		nmap
    pavucontrol
    picom
    polybar-git
    ranger
    redshift
    termite
    tumbler
    viewnior
    volumeicon
    # pcmanfm
    # nemo
)

allpackages=("${dev[@]}" "${desktop[@]}" "${apps[@]}")

title "Installing packages..."

for pkg in "${allpackages[@]}"; do
    echo pkg
    pkg_name=$(echo "$pkg" | awk '{print $1}')
    progress "Installing $pkg_name"
    yay -Sy "$pkg" --noconfirm
done

# for aur in "${remove[@]}"; do
#     progress "Installing $aur_name"
#     yay -S "$aur" --noconfirm
# done

title "Clean the nonneeded packages..."
yay -Yc
