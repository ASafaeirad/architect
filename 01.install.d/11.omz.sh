#!/bin/bash
. "$(dirname "$BASH_SOURCE")/../utils.sh"

export ZSH="${XDG_CONFIG_HOME:-$HOME/.config}/oh-my-zsh"

echo $ZSH
if [ ! -d "$ZSH" ]; then
  title "Install Oh-My-ZSH"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended --keep-zshrc
fi

title "Install Oh-My-ZSH Plugins"
OMZ_CUSTOM="$ZSH/custom"

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
wget https://raw.githubusercontent.com/ASafaeirad/oh-my-zsh-skill-theme/master/skill.zsh-theme -P "$OMZ_CUSTOM/themes/"

progress "Done"

title "Install forgit"
rmexist "$OMZ_CUSTOM/plugins/zsh-forgit"
git clone https://github.com/wfxr/forgit.git ${ZSH_CUSTOM}/plugins/forgit

progress "Done"
