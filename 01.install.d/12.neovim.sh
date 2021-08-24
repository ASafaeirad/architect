#!/bin/bash
. "$(dirname "$BASH_SOURCE")/../utils.sh"

title "Installing neovim"
sudo pacman -Sq neovim --noconfirm
progress "Done!"

title "Installing VIM Plug"
VIM_PLUG_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/nvim/site/autoload/plug.vim"
curl -fLo "$VIM_PLUG_DIR" --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
progress "Done!"
mkdir -p "${$XDG_CONFIG_HOME:-$HOME/.config}/wakatime"

title "Running Neovim Python install"
if [ ! -x "$(command -v pip3)" ]; then
  warn "Command pip3 Not Found!"
else
  pip3 install --user neovim
fi
progress "Done!"
