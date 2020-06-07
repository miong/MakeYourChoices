@echo off
cd  "%~dp0"
"%~dp0\tools\gnu_coreutils\rm" -rf build/story_module.js
"%~dp0\tools\gnu_coreutils\cp" "build/make your choirces.js" "build/story_module.js"
echo ; >> "build\story_module.js"
echo module.exports.storyContent = storyContent; >> "build\story_module.js"
cd  "%~dp0\test"
call npm install inkjs assert semver
node main.js
pause
