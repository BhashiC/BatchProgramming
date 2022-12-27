::============================================================================
:: Author: BhasithaC.
:: Suggestion/Bugs Report: bhashitha-channa.widana-gamage@alstomgroup.com
:: Last Update: 2022-11-18
::============================================================================
@echo off
setlocal
:: Declare variables
	set arg1=%1
	set arg2=%2
	set /A startNum=1
	set /A endNum=10
	set /A increment=1
	set allowPrint=0

:: Process
	:: No user arguments
	if "%arg1%"=="" (
		if "%arg2%"=="" (
			set allowPrint=1
			goto printNumbers
		)
	)
	:: Only one user argument
	if not "%arg1%"=="" (
		if "%arg2%"=="" (
			if %arg1% lss 0 (
				set increment=-1
			)
			set endNum=%arg1%
			set allowPrint=1
			goto printNumbers
		)
	)
	:: Two unequal user arguments
	if not "%arg1%"=="" (
		if not "%arg2%"=="" (
			if %arg2% lss %arg1% (
				set increment=-1
			)
			set startNum=%arg1%
			set endNum=%arg2%
			set allowPrint=1
			goto printNumbers
		)
	)
	:: Two equal user arguments
	if %arg1%==%arg2% (
		echo %arg1%
		goto printNumbers
		)
	)
	

	:printNumbers
		if "%allowPrint%"=="1" (
			for /L %%i in (%startNum%, %increment%, %endNum%) do echo %%i
		)

:: Freeing variables from memory
endlocal