#!/bin/bash
. "$(dirname "$BASH_SOURCE")/../utils.sh"

OMZ_HOME="$XDG_CONFIG_HOME/oh-my-zsh"

if [ ! -d "$OMZ_HOME" ]; then
  title "Install Oh-My-ZSH"
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

title "Install Oh-My-ZSH Plugins"
OMZ_CUSTOM="$OMZ_HOME/custom"

progress "Install autosuggestions"
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
