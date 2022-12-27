::============================================================================
:: Author: BhasithaC.
:: Suggestion/Bugs Report: bhashitha-channa.widana-gamage@alstomgroup.com
:: Last Update: 2022-11-18
::============================================================================
@echo off
setlocal
:: Declare variables
    set /A dividend=355
    set /A divisor=113
    set /A rounds=10
    set /A quotient=dividend/divisor
    set output=%quotient%.

:: Process
    :divitionProcess
        set /A dividend=(dividend-quotient*divisor)*10
        if "%dividend%"=="0" (
            goto printOutput
        )
        
        set /A quotient=dividend/divisor
        set /A rounds=rounds-1
        
        if "%rounds%"=="-1" (
            goto printOutput
        )
        set output=%output%%quotient%
        goto divitionProcess

    :printOutput
        echo %output%

:: Freeing variables from memory
endlocal
