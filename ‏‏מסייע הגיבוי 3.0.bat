@echo off
chcp 1255>nul
title ����� ������ 3.0
setlocal enabledelayedexpansion
MODE CON: COLS=80 lines=27
color 70
:start
cls
echo.
echo                                 3.0 ������ �����
echo                              ======================
echo.
echo      ����� ������ ������ ��� ����� ������ ���� ������ ����� ������ ������
echo              ���� ����� ������� ����� ������ ������ �� ������� ��
echo.
echo.
echo                             ����� ����� ���� �� ����
echo.
set/p source=">>>"
if not exist %source% echo. & timeout 2 | echo                                ���� ��� ���� ����� & goto start
echo.
echo.
echo                             ������ ����� ���� �� ����
echo.
set/p target=">>>"
if not exist %target% echo. & timeout 2 | echo                                ���� ��� ���� ����� & goto start
cls
echo.
echo.
for %%i in (%source%) do set source=%%~i
for %%i in (%target%) do set target=%%~i
cd /d "%target%"
robocopy /s /xc /purge "%source%" "%target%"

pause
goto start
