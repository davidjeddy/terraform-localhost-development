#!/bin/bash

set -eo pipefail

# shellcheck disable=SC1091
source ./libs/bash/config.sh || exiti 1

# logic

## Platform installers
if [[ $PLATFORM == "darwin" ]]
then
    brew install mkcert node sha3sum gpg
else
    # sha3sum
    asdf install mkcert Node.js gpg
    asdf reshim
fi

## NPM packages for project

npm install
npm audit fix

# TODO submit citizen to asdf / brew or source as a git sub-module

## Citizen registry project

git submodule update --init --recursive
git submodule update --recursive --remote

# ADD citizen binary to PATH
if [[ $(cat "$HOME"/.bashrc) != *"citizen/bin"* ]]
then 
    printf "INFO: Adding Citizen bin to \$PATH\n"
    echo "export PATH=$(pwd)/citizen/bin:\$PATH" >> "$HOME"/.bashrc
    tail "$HOME"/.bashrc
fi
