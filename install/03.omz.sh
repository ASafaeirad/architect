#!/bin/bash
. "$(dirname "$BASH_SOURCE")/../utils.sh"

zsh_path="$(which zsh)"

if ! grep -q "$zsh_path" /etc/shells; then
  title "Adding $zsh_path to /etc/shells"
  echo "$zsh_path" | sudo tee -a /etc/shells
fi

if [[ "$SHELL" != "$zsh_path" ]]; then
  title "Change the default shell to zsh"
  chsh -s "$zsh_path"
  progress "Default shell has been changed to $zsh_path"
fi

if [ ! -d "$HOME/.oh-my-zsh" ]; then
  title "Install Oh-My-ZSH"
  sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

title "Install Oh-My-ZSH Plugins"

progress "Install autosuggestions"

OMZ_CUSTOM="$HOME/.oh-my-zsh/custom"

rmexist "$OMZ_CUSTOM/plugins/zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM:-$OMZ_CUSTOM}"/plugins/zsh-autosuggestions

progress "Done"

progress "Install completions"
rmexist "$OMZ_CUSTOM/plugins/zsh-completions"
git clone https://github.com/zsh-users/zsh-completions "$OMZ_CUSTOM/plugins/zsh-completions"

progress "Done"

title "Install Skill Theme"
rmexist "$OMZ_CUSTOM/themes/skill-zsh.theme"
wget https://raw.githubusercontent.com/frontendmonster/oh-my-zsh-skill-theme/master/skill.zsh-theme -P "$OMZ_CUSTOM/themes/"

progress "Done"

title "Install forgit"
rmexist "$OMZ_CUSTOM/plugins/zsh-forgit"
wget https://raw.githubusercontent.com/wfxr/forgit/master/forgit.plugin.zsh -P "$OMZ_CUSTOM/plugins/forgit"

progress "Done"
