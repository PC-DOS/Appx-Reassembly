@echo off
cd /d %~dp0
title UnpackAll
echo This tool unpacks all appx files in a specified directory.
echo=
echo Please input source directory:
set /p src=
echo=
echo Please input output directory:
set /p opt=
echo=
echo Processing...
for %%f in ("%src%\*.appx") do (7z x -o"%opt%\%%~nf" "%%f")
echo=
echo Operation finished. Press any key to exit.
pause > nul