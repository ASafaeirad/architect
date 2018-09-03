#! /bin/sh

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash

# echo 'export NVM_DIR="$HOME/.nvm"\n[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"\n' >> ~/.zshrc

## Install nvm and node
#! /bin/sh

if [ -n "$ZSH_VERSION" ]; then
    source ~/.zshrc
elif [ -n "$BASH_VERSION" ]; then
    source ~/.bashrc
fi

nvm install node
nvm install --lts --latest-npm
