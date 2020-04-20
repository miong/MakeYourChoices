@echo off
echo "Searching current version"
"%~dp0\tools\gnu_coreutils\grep" C_GAME_VERSION src/ink/engine/constantes.ink > temp.txt
for /f "delims== tokens=1,2" %%G in (temp.txt) do set GAME_VERSION=%%H
del temp.txt
set GAME_VERSION=%GAME_VERSION:"=%
set GAME_VERSION=%GAME_VERSION: =%
echo "Game version is %GAME_VERSION%"
IF EXIST released/myc_%GAME_VERSION%.zip (
    echo "Error : release myc_%GAME_VERSION%.zip already exists."
	echo "Please remove it or change version before releasin."
	pause
) ELSE (
    echo "Making release from build"
	cd build
	"%~dp0\tools\7za.exe" a -r -tzip test.zip *.*
	cd ..
	"%~dp0\tools\gnu_coreutils\mv" build/test.zip released/myc_%GAME_VERSION%.zip
)