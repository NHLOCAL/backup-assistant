@echo off
chcp 1255>nul
title מסייע הגיבוי 3.0
setlocal enabledelayedexpansion
MODE CON: COLS=80 lines=27
color 70
:start
cls
echo.
echo                                 3.0 יוביגה עייסמ
echo                              ======================
echo.
echo      רוקמה תיקיתב םימייק אלש םיצבק תקחומו דבלב ונתשהש םיצבק הקיתעמ הנכותה
echo              תוהז הניהת יוביגהו רוקמה תויקית ךילהתה לש ומויסבש ךכ
echo.
echo.
echo                             רוקמה תיקית ביתנ תא סנכה
echo.
set/p source=">>>"
if not exist %source% echo. & timeout 2 | echo                                תינש הסנ יוגש ביתנה & goto start
echo.
echo.
echo                             יוביגה תיקית ביתנ תא סנכה
echo.
set/p target=">>>"
if not exist %target% echo. & timeout 2 | echo                                תינש הסנ יוגש ביתנה & goto start
cls
echo.
echo.
for %%i in (%source%) do set source=%%~i
for %%i in (%target%) do set target=%%~i
cd /d "%target%"
robocopy /s /xc /purge "%source%" "%target%"

pause
goto start
