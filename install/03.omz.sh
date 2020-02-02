#!/bin/bash
. "$(dirname "$BASH_SOURCE")/../utils/echo.sh"

zsh_path="$(which zsh)"

if ! grep -q "$zsh_path" /etc/shells; then
    title "Adding $zsh_path to /etc/shells"
    echo "$zsh_path" | sudo tee -a /etc/shells
fi

if [[ "$SHELL" != "$zsh_path" ]]; then
    title "Change the default shell to zsh"
    chsh -s "$zsh_path"
    echo "default shell changed to $zsh_path"
fi

if [ ! -d "$HOME/.oh-my-zsh" ]; then
    title "Install Oh-My-ZSH"
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

title "Install Oh-My-ZSH Plugins"

progress "Install autosuggestions"
rm -rf "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"/plugins/zsh-autosuggestions

progress "Done"

progress "Install completions"
rm -rf "$HOME/.oh-my-zsh/custom/plugins/zsh-completions"
git clone https://github.com/zsh-users/zsh-completions "$HOME/.oh-my-zsh/custom/plugins/zsh-completions"

progress "Done"

title "Install Skill Theme"
rm "$HOME/.oh-my-zsh/custom/themes/skill-zsh.theme"
wget https://raw.githubusercontent.com/frontendmonster/oh-my-zsh-skill-theme/master/skill.zsh-theme -P $HOME/.oh-my-zsh/custom/themes/

progress "Done"

title "Install forgit"
rm "$HOME/.oh-my-zsh/custom/plugins/zsh-forgit"
wget https://raw.githubusercontent.com/wfxr/forgit/master/forgit.plugin.zsh -P $HOME/.oh-my-zsh/custom/plugins/forgit

