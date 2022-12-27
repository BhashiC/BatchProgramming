::============================================================================
:: Author: BhasithaC.
:: Suggestion/Bugs Report: bhashitha-channa.widana-gamage@alstomgroup.com
:: Last Update: 2022-11-18
::============================================================================
@echo off
setlocal
:: Declare variables
	set userInput=
	set printFlag=0

:: Process
	set /P userInput=What is your choice (Y/N)? 

	if "%userInput%"=="Y" set printFlag=1
	if "%userInput%"=="y" set printFlag=1

	if "%userInput%"=="N" set printFlag=2
	if "%userInput%"=="n" set printFlag=2

	if "%userInput%"=="" set printFlag=3

	if %printFlag%==1 (
		echo Hello
	) else if %printFlag%==2 (
		echo Bye
	) else if %printFlag%==3 (
		echo Nothing
	) else (
		echo Incorrect
	)  

:: Freeing variables from memory
endlocal