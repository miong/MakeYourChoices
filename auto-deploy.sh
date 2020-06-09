#!/bin/bash

set -e

if [[ -z "${BUTLER_API_KEY}" ]]; then
  echo "Unable to deploy! No BUTLER_API_KEY environment variable specified!"
  exit 1
fi

prepare_butler() {
    echo "Preparing butler..."
    download_if_not_exist http://dl.itch.ovh/butler/linux-amd64/head/butler butler
    chmod +x butler
	./butler upgrade --assume-yes | true #If update fails then no error
}

prepare_and_push() {
    echo "Push $2 build to itch.io $1:$3..."
    ./butler push $2 $1:$3
}

download_if_not_exist() {
    if [ ! -f $2 ]; then
        curl -L -O $1 > $2
    fi
}

GAME_VERSION=$(grep C_GAME_VERSION src/ink/engine/constantes.ink | awk '{print $4}' | xargs echo)
project="gmion/make-your-choices"
artifact="released/myc_${GAME_VERSION}.zip"
platform="HTML5"

prepare_butler

prepare_and_push "$project" "$artifact" "$platform"

echo "Done."
exit 0
