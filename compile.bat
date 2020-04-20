@echo off
cd  "%~dp0"
echo cleaning before compiling
"%~dp0\tools\gnu_coreutils\rm" -rf build/*
echo installing assets
"%~dp0\tools\gnu_coreutils\cp" -r assets build/.
echo installing html/js engine
"%~dp0\tools\gnu_coreutils\cp" src/html_engine/* build/.
echo compiling ink story
"%~dp0\tools\inklecate\inklecate" -v -o "build\story.js" "src\ink\make your choirces.ink"
echo var storyContent = > "build\make your choirces.js"
"%~dp0\tools\gnu_coreutils\cat" build\story.js >> "build\make your choirces.js"
"%~dp0\tools\gnu_coreutils\rm" build/story.js