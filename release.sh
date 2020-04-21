#!/bin/bash

check_installed () {
  [ -z "$(which $1)" ] && echo "Please install $1" && exit -127
}

check_installed zip

GAME_VERSION=$(grep C_GAME_VERSION src/ink/engine/constantes.ink | awk '{print $4}' | xargs echo)

if [ -f "released/myc_${GAME_VERSION}.zip" ]
then
  echo "Error : release myc_${GAME_VERSION}.zip already exists."
  echo "Please remove it or change version before releasing."
else
  echo "Making release from build"
  cd build
  zip test.zip *.*
  cd ..
  mv build/test.zip released/myc_${GAME_VERSION}.zip
fi
