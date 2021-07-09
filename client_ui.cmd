@echo off
setlocal enabledelayedexpansion

::by @aaviator42

title ncRemRun Client
:n
echo --Enter hostname:
set /p a=
if "%a%"=="" goto :n


:m

echo:
echo --Enter command:
set /p b=
if "!b!"=="" goto :m
if "!b!"=="cls" cls && goto :m

set "b=!b:&=%%%%26!"

echo --Sending command...
call :psd \"!a!/!b!\"
echo --Command sent!

goto :m

:psd

powershell wget %* -UseBasicParsing -OutFile nulx.txt >nul
goto :eof
