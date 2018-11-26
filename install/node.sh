#!/bin/bash
BASEDIR=$(dirname "${BASH_SOURCE[@]}")

. $BASEDIR/../utils/color.sh
. $BASEDIR/../utils/echo.sh

title "Installing NVM"
# curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash

grep -q -F '# Export nvm and load NVM' $HOME/.profile

if  [ $? -ne 0 ]; then
    title "Setup NVM"
    {
        echo -e '\n# Export nvm and load NVM'
        echo -e "if [ -d $HOME/.nvm ]; then"
        echo -e "  export NVM_DIR=\"$HOME/.nvm\""
        echo -e "  [ -s \"$NVM_DIR/nvm.sh\" ] && . \"$NVM_DIR/nvm.sh\""
        echo -e "fi"
    } >> "$HOME/.profile"
fi
. "$HOME/.profile"

# nvm install node
# nvm install --lts --latest-npm
