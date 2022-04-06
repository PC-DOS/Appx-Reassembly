@echo off
cd /d %~dp0
title CreateAppxBundle
echo This tool packs all appx files in a specified directory into AppxBundle.
echo=
echo Please input source directory:
set /p src=
echo=
echo Please input output file name:
set /p opt=
echo=
echo Processing...
"C:\Program Files (x86)\Windows Kits\8.1\bin\x86\makeappx.exe" bundle /v /d "%src%" /p "%opt%"
echo=
echo Operation finished. Press any key to exit.
pause > nul