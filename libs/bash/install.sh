#!/bin/bash

set -eo pipefail

# shellcheck disable=SC1091
source "./config.sh" || exiti 1

# logic

npm install
npm audit fix

## Platform installers
if [[ $PLATFORM == "darwin" ]]
then
    brew install mkcert node shasum gpg
else
    asdf install mkcert Node.js shasum gpg
    asdf reshim
fi

# TODO submit citizen to asdf / brew or source as a git sub-module
git clone https://github.com/outsideris/citizen.git .tmp/citizen
