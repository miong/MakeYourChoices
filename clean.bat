@echo off
echo cleaning before compiling
"%~dp0\tools\gnu_coreutils\rm" -rf build/*
echo compile is required > build\compile.me