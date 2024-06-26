#!/bin/bash
. "$(dirname "$BASH_SOURCE")/../utils.sh"

title "Installing xf86-input-libinput"
sudo pacman -S xf86-input-libinput --noconfirm >/dev/null

title "Configuring touchpad tapping behavoir"
sudo tee /etc/X11/xorg.conf.d/30-touchpad.conf >/dev/null <<'_EOF'
Section "InputClass"
    Identifier "touchpad"
    Driver "libinput"
    MatchIsTouchpad "on"
    Option "Tapping" "on"
    Option "TappingButtonMap" "lrm"
    Option "NaturalScrolling" "true"
EndSection
_EOF

progress "Done!"
