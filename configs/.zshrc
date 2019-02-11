#!/bin/bash
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="skill"
DISABLE_AUTO_UPDATE="true"
HISTSIZE=1000
SAVEHIST=1000

plugins=(
    sudo
    nvm
    colored-man-pages
    zsh-autosuggestions
    zsh-completions
)

autoload -U compinit && compinit
bindkey '^ ' autosuggest-accept

[ -f "$ZSH/oh-my-zsh.sh" ] && . "$ZSH/oh-my-zsh.sh"

[ -f /usr/share/z/z.sh ] && . /usr/share/z/z.sh

[ -f "$HOME/.aliases" ] && . "$HOME/.aliases"
[ -f "$HOME/.profile" ] && . "$HOME/.profile"
