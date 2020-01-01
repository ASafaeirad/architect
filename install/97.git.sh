#!/bin/bash
. "$(dirname "$BASH_SOURCE")/../utils/echo.sh"

title "Setting up Git"

defaultName=$(git config --global user.name)
defaultEmail=$(git config --global user.email)
defaultGithub=$(git config --global github.user)

read -rp "Name [$defaultName] " name
read -rp "Email [$defaultEmail] " email
read -rp "Github username [$defaultGithub] " github

git config --global user.name "${name:-$defaultName}"
git config --global user.email "${email:-$defaultEmail}"
git config --global github.user "${github:-$defaultGithub}"
git config --global core.excludesfile ~/.gitignore_global

if [[ "$(uname)" == "Darwin" ]]; then
    git config --global credential.helper "osxkeychain"
else
    read -rn 1 -p "Save user and password to an unencrypted file to avoid writing? [y/N] " save
    if [[ $save =~ ^([Yy])$ ]]; then
        git config --global credential.helper "store"
    else
        git config --global credential.helper "cache --timeout 3600"
    fi
fi

progress "Git setup compeleted"
