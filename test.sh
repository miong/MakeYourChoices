echo "Running Unit tests"
rm -rf build/story_module.js
cp "build/make your choirces.js" build/story_module.js
echo ";" >> build/story_module.js
echo "module.exports.storyContent = storyContent;" >> build/story_module.js
cd  ./test
npm install inkjs assert semver
node main.js
