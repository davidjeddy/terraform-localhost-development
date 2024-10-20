#!/bin/bash

set -eo pipefail

# shellcheck disable=SC1091
source "./config.sh" || exiti 1

# logic

npm install fs, http, http-proxy

## Platform installers
if [[ $PLATFORM == "darwin" ]]
then
    brew install mkcert node shasum gpg
else
    asdf install mkcert Node.js shasum gpg
    asdf reshim
fi

# TODO submit citizen to asdf / brew?
git clone https://github.com/outsideris/citizen.git .tmp/citizen

printf "INFO: citizen version is %s\n" "$(./.tmp/citizen/bin/citizen --version)"
printf "INFO: mkcert version is %s\n" "$(mkcert -version)"
printf "INFO: node version is %s\n" "$(node --version)"
