@echo off
cd /d %~dp0
title UnpackAll
echo This tool Packs all appx files in a specified directory.
echo=
echo Please input source directory:
set /p src=
echo=
echo Please input output directory:
set /p opt=
md "%opt%"
echo=
echo Processing...
for /d %%f in ("%src%\*") do ("C:\Program Files (x86)\Windows Kits\8.1\bin\x86\makeappx.exe" pack /v /d "%%f" /p "%opt%%%~nf%%~xf.appx" /l)
echo=
echo Operation finished. Press any key to exit.
pause > nul