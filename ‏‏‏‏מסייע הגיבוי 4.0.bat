@echo off
chcp 1255>nul
title ����� ������ 4.0
setlocal enabledelayedexpansion
MODE CON: COLS=80 lines=27
color 70
:start
cls
echo.
echo                                 4.0 ������ �����
echo                              ======================
echo.
echo      ����� ������ ������ ��� ����� ������ ���� ������ ����� ������ ������
echo              ���� ����� ������� ����� ������ ������ �� ������� ��
echo.
echo.
echo                             ����� ����� ���� �� ����
echo.
set fol=����
call :select_func
if not "%folder%" == "" (
set source="%folder%"
) else (set/p source=">>>")
if [%source%] == [] call :error
for %%f in (%source%) do set source=%%~f
if not exist "%source%\" call :error
echo.
echo.
echo                             ������ ����� ���� �� ����
echo.
set fol=�����
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
.BrowseForFolder(0,'��� ����� %fol%',0,0).self.path""
for /f "usebackq delims=" %%I in (`powershell %psCommand%`) do set "folder=%%I"
exit /b


:error
echo. & timeout 2 | echo                                ���� ��� ���� ����� & goto start
exit /b

