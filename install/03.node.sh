#!/bin/bash
INSTALLDIR=$(dirname "$BASH_SOURCE")
. "$INSTALLDIR/../utils/echo.sh"

[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

if ! test "$(nvm --version)"; then
    title "Installing NVM"
    curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash

    grep -q -F '# Export nvm and load NVM' "$HOME/.profile"

    if  [ $? -ne 0 ]; then
        title "Setup NVM"
        {
            echo -e '\n# Export nvm and load NVM'
            echo -e "if [ -d $HOME/.nvm ]; then"
            echo -e "  export NVM_DIR=\"$HOME/.nvm\""
            echo -e "fi"
        } >> "$HOME/.profile"
    fi

    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

    . "$HOME/.profile"

    nvm install node
    nvm install --lts --latest-npm
fi

packages=(
    @storybook/cli@next
    create-react-app
    eslint
    flow
    fx
    hyperlayout
    lerna
    terminalizer
)

for package in "${packages[@]}"; do
    package_name=$( echo "$package" | awk '{print $1}' )
    if test "$( which $package_name 2> /dev/null )"; then
        warn "$package_name already installed..."
    else
        progress "Installing $package_name"
        yarn global add "$package"
    fi
done
