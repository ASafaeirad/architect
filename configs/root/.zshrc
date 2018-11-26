export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/home/monster/.oh-my-zsh

# Set zsh-theme.
ZSH_THEME="node"

DISABLE_AUTO_UPDATE="true"
# CASE_SENSITIVE="true"
# HYPHEN_INSENSITIVE="true"
# export UPDATE_ZSH_DAYS=7
# DISABLE_LS_COLORS="true"
# DISABLE_AUTO_TITLE="true"
# ENABLE_CORRECTION="true"
# COMPLETION_WAITING_DOTS="true"
# DISABLE_UNTRACKED_FILES_DIRTY="true"
# HIST_STAMPS="mm/dd/yyyy"

# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Load zsh-plugins
plugins=(
    sudo
    nvm
    colored-man-pages
)

plugins+=(
    zsh-autosuggestions
#    zsh-syntax-highlighting
    zsh-completions
)

autoload -U compinit && compinit
bindkey '^ ' autosuggest-accept

source $ZSH/oh-my-zsh.sh

# User configuration
# export MANPATH="/usr/local/man:$MANPATH"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vi'
else
  export EDITOR='nvim'
fi

# Export and load NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Alias definitions.
 if [ -f ~/.aliases ]; then
    . ~/.aliases
 fi

# Export yarn bin file
export PATH="$PATH:$(yarn global bin)"

