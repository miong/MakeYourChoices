#!/bin/bash

check_installed () {
  [ -z "$(which $1)" ] && echo "Please install $1" && exit -127
}

check_installed mono

echo cleaning before compiling
rm -rf build/*
echo installing assets
cp -r assets build/.
echo installing html/js engine
cp src/html_engine/* build/.
echo compiling ink story
mono "tools/inklecate/inklecate.exe" -v -o "build/story.js" "src/ink/make your choirces.ink"
echo var storyContent = > "build/make your choirces.js"
cat build/story.js >> "build/make your choirces.js"
rm build/story.js
