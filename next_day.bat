::============================================================================
:: Author: BhasithaC.
:: Suggestion/Bugs Report: bhashitha-channa.widana-gamage@alstomgroup.com
:: Last Update: 2022-11-18
::============================================================================
@echo off
setlocal enabledelayedexpansion
:: Declare variables
	set inputDate=0
	set Year=0
	set Month=0
	set Day=0
	set leapYearFlag=0
	set /A remainder=1

:: Process
    :: Setting the inputDate
    if "%1"=="" (
		set inputDate=%date%
		set Year=!inputDate:~0,4!
		set Month=!inputDate:~5,2!
		set Day=!inputDate:~8,2!
		) else (
		set inputDate=%1
		set Year=!inputDate:~0,4!
		set Month=!inputDate:~4,2!
		set Day=!inputDate:~6,2!
		)
   
	:: Checking for leap year
   set /A remainder = !Year! %% 4
	if %remainder%==0 ( 
		set leapYearFlag=1
	)

	:: Jump to increments
   if !Month!==02 if !Day!==29 if !leapYearFlag!==1 goto incrementMonth
	if !Month!==02 if !Day!==28 if !leapYearFlag!==0 goto incrementMonth
	if !Month!==04 if !Day!==30 goto incrementMonth
	if !Month!==06 if !Day!==30 goto incrementMonth
	if !Month!==09 if !Day!==30 goto incrementMonth
	if !Month!==11 if !Day!==30 goto incrementMonth
	if !Month!==01 if !Day!==31 goto incrementMonth
	if !Month!==03 if !Day!==31 goto incrementMonth
	if !Month!==05 if !Day!==31 goto incrementMonth
	if !Month!==07 if !Day!==31 goto incrementMonth
	if !Month!==08 if !Day!==31 goto incrementMonth
	if !Month!==10 if !Day!==31 goto incrementMonth
   if !Month!==12 if !Day!==31 goto incrementYear
	
	:incrementDay
	   if !Day!!==08 set Day=8
		if !Day!!==09 set Day=9
	   set /A Day=!Day!+1
		if %Day% lss 10 set Day=0%Day%
		echo !Day!
	   goto printNextDate
	:incrementMonth
	   if !Month!!==08 set Month=8
		if !Month!!==09 set Month=9
	   set /A Month=!Month!+1
		if %Month% lss 10 set Month=0%Month%
		echo !Month!
		set Day=01
	   goto printNextDate
	:incrementYear
	   set /A Year=!Year!+1
		set Month=01
		set Day=01
	   goto printNextDate
	
   :printNextDate
	echo !Year!!Month!!Day!

:: Freeing variables from memory
endlocal
