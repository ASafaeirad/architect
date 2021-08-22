#!/bin/bash
. "$(dirname "$BASH_SOURCE")/../utils.sh"

title "Installing Volta"

export VOLTA_HOME="$XDG_CONFIG_HOME/volta"
curl https://get.volta.sh | bash
volta install node

progress "Done!"
