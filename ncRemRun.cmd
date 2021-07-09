@echo off
::ncRemRun by @aaviator42
title ncRemRun by @aaviator42

setlocal enabledelayedexpansion



echo ncRemRun by @aaviator42

:main

:: You can change the port in the below command. Default is "80"
(echo ncRemRun lis10er) | nc -w 1 -l -p 80 | findstr "GET" > par.txt
set /p req=<par.txt
set req=%req: HTTP/1.1=%
set req=%req:GET /=%

if "%req%" == "%reqPrev%" (
	goto :main 
)

if "%req%" == "favicon.ico" (
	goto :main 
)

if "%req%" == "" (
	goto :main 
)

if "%req%" == "null" (
	set reqPrev=null
	goto :main 
)

set reqPrev=%req%
echo Request recieved: !req!

powershell -c "Add-Type -AN System.Web; [System.Web.HttpUtility]::UrlDecode(\"%req%\")" > comx.txt

set /p com=<comx.txt
if not "!com!" == "" (
echo Command recieved: !com!
!com!
)

goto :main
