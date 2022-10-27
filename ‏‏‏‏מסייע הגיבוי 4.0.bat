@echo off
chcp 1255>nul
title מסייע הגיבוי 4.0
setlocal enabledelayedexpansion
MODE CON: COLS=80 lines=27
color 70
:start
cls
echo.
echo                                 4.0 יוביגה עייסמ
echo                              ======================
echo.
echo      רוקמה תיקיתב םימייק אלש םיצבק תקחומו דבלב ונתשהש םיצבק הקיתעמ הנכותה
echo              תוהז הניהת יוביגהו רוקמה תויקית ךילהתה לש ומויסבש ךכ
echo.
echo.
echo                             רוקמה תיקית ביתנ תא סנכה
echo.
set fol=מקור
call :select_func
if not "%folder%" == "" (
set source="%folder%"
) else (set/p source=">>>")
if [%source%] == [] call :error
for %%f in (%source%) do set source=%%~f
if not exist "%source%\" call :error
echo.
echo.
echo                             יוביגה תיקית ביתנ תא סנכה
echo.
set fol=גיבוי
set folder=
call :select_func
if not "%folder%" == "" (
set target="%folder%"
) else (set/p target=">>>")

if [%target%] == [] call :error
for %%f in (%target%) do set target=%%~f
if not exist "%target%\" call :error
cls
echo.
echo.
cd /d "%target%"
robocopy /s /xc /purge "%source%" "%target%"

pause
goto start



:select_func
set "psCommand="(new-object -COM 'Shell.Application')^
.BrowseForFolder(0,'בחר תיקית %fol%',0,0).self.path""
for /f "usebackq delims=" %%I in (`powershell %psCommand%`) do set "folder=%%I"
exit /b


:error
echo. & timeout 2 | echo                                תינש הסנ יוגש ביתנה & goto start
exit /b

