#!/bin/bash
. "$(dirname "$BASH_SOURCE")/../utils.sh"

title "Installing Volta"
sudo pacman -Rns nodejs npm
export VOLTA_HOME="$XDG_CONFIG_HOME/volta"
curl https://get.volta.sh | bash
$VOLTA_HOME/bin/volta install node

progress "Done!"
