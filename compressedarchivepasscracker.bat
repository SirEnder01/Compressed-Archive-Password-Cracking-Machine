@echo off
mode 80, 28
chcp 65001 >nul
title SirEnder01's archive password cracker
color B
echo  [33m╔══════════════════════════════════════════════════════════════════╗[0m
echo  [33m║  [90m[[32mW[90m][[32mi[90m][[32mn[90m][[32mR[90m][[32mA[90m][[32mR[90m] [[32;1mA[90m][[32;1mr[90m][[32;1mc[90m][[32;1mh[90m][[32;1mi[90m][[32;1mv[90m][[32;1me[90m] [[32mC[90m][[32mr[90m][[32ma[90m][[32mc[90m][[32mk[90m][[32me[90m][[32mr[90m][0m  [33m║[0m
echo  [33m║                                                                  ║[0m
echo  [33m║[36m Author: SirEnder01[0m                              [37m©SirEnder01 2024[33m ║[0m
echo  [33m╚══════════════════════════════════════════════════════════════════╝[0m
echo.
echo.
echo  [91m┌──────────────────────────────────────────────────┐[0m
echo  [91m│ [97mYOU MUST HAVE INSTALLED 7zip!                    [91m│[0m
echo  [91m│ [97mGet it on    https://www.7-zip.org/download.html [91m│[0m
echo  [91m│ [101;97mOTHERWISE, THIS PROGRAM WILL [4mNOT WORK[0m            [91m│[0m
echo  [91m└──────────────────────────────────────────────────┘[0m
echo.
echo [37m ═► [0m[36;1mCompatible with[0m    .zip, .rar, .7z, .tar, .wim  [36;1mfiles.[0m
echo.
echo  [95;1mNOTE[0m: [96mwordlist must have words in columns[0m
echo  [92mFor Example:[0m
echo     1234
echo     password1234
echo     p@assword123
echo.
echo.
echo.
if not exist "C:\Program Files\7-Zip\7z.exe" (
	color 4
	echo.
	echo.
	echo 7-Zip is not installed!
	echo You must install 7zip - https://www.7-zip.org/download.html
	echo.
	echo.
	pause
	exit
)

set /p archive="[33mEnter Archive Directory[0m: "
if not exist "%archive%" (
	color 4
	echo.
	echo.
	echo Archive not found. Make sure you didn't make a mistake!
	echo.
	echo.
	pause
	timeout 0.5 >nul
	exit
)

set /p wordlist="[33mEnter Wordlist Directory[0m: "
if not exist "%wordlist%" (
	color 4
	echo.
	echo.
	echo Wordlist not found. Make sure you didn't make a mistake!
	echo.
	echo.
	pause
	timeout 0.5 >null
	exit
)
color 6

for /f %%a in (%wordlist%) do (
	set pass=%%a
	call :attempt
)

color c
echo.
echo.
echo In this shitty wordlist there is no password for this!
echo Go get better!!
echo.
echo.
echo.
pause
timeout 0.5 >null
exit

:attempt
"C:\Program Files\7-Zip\7z.exe" x -p%pass% "%archive%" -o"cracked" -y >nul 2>&1
echo Attempting... [%pass%]
if /i %errorlevel% EQU 0 (
	color A
	echo.
	echo.
	echo Password Found: [93m%pass%[0m
	echo.
	echo Archive was extracted into folder "cracked"
	echo.
	echo.
	timeout 4 >null
	pause
	exit
)
