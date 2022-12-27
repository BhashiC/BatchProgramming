::============================================================================
:: Author: BhasithaC.
:: Suggestion/Bugs Report: bhashitha-channa.widana-gamage@alstomgroup.com
:: Last Update: 2022-11-18
::============================================================================
@echo off
setlocal enabledelayedexpansion
:: Declare variables
set ipAddress=127.0.0.1
set bufferSize=32 64 2048 4096 32768 65000
set userInput=%1

:: Process
if not "%userInput%"=="" set ipAddress=%userInput%
echo Working IP address: %ipAddress%

echo Clearing old results...
for %%a in (%bufferSize%) do (
    if exist ping_%ipAddress%_%%a.txt (
        del ping_%ipAddress%_%%a.txt
    )   
)

echo Start ping %ipAddress% with several message sizes, it may take some minutes, please wait...
echo The ping result files are
for %%a in (%bufferSize%) do (
   ping %ipAddress% -w 1500 -n 10 -l %%a >> ping_%ipAddress%_%%a.txt
   echo   ping_%ipAddress%_%%a.txt
)

:: Freeing variables from memory
endlocal