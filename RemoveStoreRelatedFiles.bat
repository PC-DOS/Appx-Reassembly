@echo off
cd /d %~dp0
title Remove Store Related Files
echo This tool removes store related files.
echo=
echo Press any key to continue...
pause > nul
del /s MDILFileList.xml
del /s AppxSignature.p7x
for /d %%d in (*) do (rd /s /q %%d\AppxMetadata)
echo=
echo Operation finished, press any key to exit.
pause > nul