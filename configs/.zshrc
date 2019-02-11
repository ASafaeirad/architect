#!/bin/bash
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export ZSH="$HOME/.oh-my-zsh"

## Options section
setopt nocheckjobs                                              # Don't warn about running processes when exiting
setopt numericglobsort                                          # Sort filenames numerically when it makes sense
setopt appendhistory                                            # Immediately append history instead of overwriting
setopt histignorealldups                                        # If a new command is a duplicate, remove the older one
zstyle ':completion:*' rehash true                              # automatically find new executables in path
WORDCHARS=${WORDCHARS//\/[&.;]}                                 # Don't consider certain characters part of the word

# Speed up completions
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

## Keybindings section
bindkey -e
bindkey '^H' backward-kill-word                                 # delete previous word with ctrl+backspace
bindkey '^z' undo
bindkey '^b' backward-word
bindkey '^w' forward-word                                       # ctrl+backspace
bindkey '5~' kill-word                                          # ctrl+del

ZSH_THEME="skill"
DISABLE_AUTO_UPDATE="true"
HISTFILE=~/.zhistory
HISTSIZE=1000
SAVEHIST=1000

plugins=(
    sudo
    nvm
    colored-man-pages
    zsh-autosuggestions
    zsh-completions
    history-substring-search
)

autoload -U compinit && compinit
bindkey '^ ' autosuggest-accept

[[ -f "$ZSH/oh-my-zsh.sh" ]] && . "$ZSH/oh-my-zsh.sh"

[[ -f "$HOME/.aliases" ]] && . "$HOME/.aliases"
[[ -f "$HOME/.profile" ]] && . "$HOME/.profile"

[[ -f /usr/share/z/z.sh ]] && . /usr/share/z/z.sh
