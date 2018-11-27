#!/bin/bash

. "$HOME/.profile"

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Path to your oh-my-zsh installation.
export ZSH=/home/monster/.oh-my-zsh

ZSH_THEME="skill"
DISABLE_AUTO_UPDATE="true"
HISTSIZE=1000
SAVEHIST=1000
# export UPDATE_ZSH_DAYS=7

plugins=(
    sudo
    nvm
    colored-man-pages
)

plugins+=(
    zsh-autosuggestions
    zsh-completions
)

autoload -U compinit && compinit
bindkey '^ ' autosuggest-accept

. $ZSH/oh-my-zsh.sh

