#!/bin/bash
. "$(dirname "$BASH_SOURCE")/../utils.sh"

title "Setting up NPM and Yarn"

defaultName=$(npm get init-author-name)
defaultEmail=$(npm get init-author-email)
defaultLicense="MIT"

read -rp "Name [$defaultName] " name
read -rp "Email [$defaultEmail] " email
read -rp "Default License [$defaultLicense] " license

npm set init-author-name "${name:-$defaultName}"
npm set init-author-email "${email:-$defaultEmail}"
npm set init-license "${license:-$defaultLicense}"
npm set color 'always'
npm set depth 0
npm set editor 'nvim'
npm set init-version '0.0.0'
npm set save true
npm set ignore-engines true

yarn config set init-author-email "${name:-$defaultEmail}"
yarn config set init-author-name "${email:-$defaultName}"
yarn config set init-license "${license:-$defaultLicense}"
yarn config set init-version "0.0.0"
yarn config set ignore-engines true

progress "NPM and Yarn setup compeleted"
