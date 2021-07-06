@echo off
::by @aaviator42

if "%1"=="" (
exit /b
)

if "%2"=="" (
exit /b
)

set a=%1
set b=%*
setlocal enabledelayedexpansion
for /f "delims=" %%A in ("%a%") do set b=!b:%%A =!

call :psd \"%a%/%b%\"

:psd
powershell wget %* -UseBasicParsing -OutFile nulx.txt >nul
