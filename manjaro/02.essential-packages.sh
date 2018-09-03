#! /bin/sh

# Sync pacman
pacman -Syu

# install zsh
pacman -S zsh
chsh -s $(which zsh)

## oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

## oh-my-zsh-plugins
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# git clone https://github.com/zsh-users/zsh-completions ~/.oh-my-zsh/custom/plugins/zsh-completions

# Install development tools
pacman -S neovim
pacman -S mongodb
pacman -S tmux
pacman -S yarn
systemctl enable mongodb.service

pacman -Rns $(pacman -Qtdq)
pacman-optimize

