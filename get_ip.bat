::============================================================================
:: Author: BhasithaC.
:: Suggestion/Bugs Report: bhashitha-channa.widana-gamage@alstomgroup.com
:: Last Update: 2022-11-18
::============================================================================
@echo off
setlocal enabledelayedexpansion
:: Declare variables
    set ipAddressString="IPv4 Address"
    
:: Process
    for /F "usebackq tokens=2 delims=:" %%a in (
       `ipconfig ^| findstr /c:%ipAddressString%`
    ) do (
       echo Your IP Address is:%%a
       :: EOF is use to end the script
       goto :EOF 
    )

:: Freeing variables from memory
endlocal