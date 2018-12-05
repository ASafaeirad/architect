#!/bin/bash

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

#     * cd around for a while to build up the db
#     * PROFIT!!
#     * optionally:
#         set $_Z_CMD in .bashrc/.zshrc to change the command (default z).
#         set $_Z_DATA in .bashrc/.zshrc to change the datafile (default ~/.z).
#         set $_Z_NO_RESOLVE_SYMLINKS to prevent symlink resolution.
#         set $_Z_NO_PROMPT_COMMAND if you're handling PROMPT_COMMAND yourself.
#         set $_Z_EXCLUDE_DIRS to an array of directories to exclude.
#         set $_Z_OWNER to your username if you want use z while sudo with $HOME kept
#
# USE:
#     * z foo     # cd to most frecent dir matching foo
#     * z foo bar # cd to most frecent dir matching foo and bar
#     * z -r foo  # cd to highest ranked dir matching foo
#     * z -t foo  # cd to most recently accessed dir matching foo
#     * z -l foo  # list matches instead of cd
#     * z -c foo  # restrict matches to subdirs of $PWD
. /usr/share/z/z.sh

. $ZSH/oh-my-zsh.sh

 if [ -f "$HOME/.aliases" ]; then
    . "$HOME/.aliases"
 fi

. "$HOME/.profile"
