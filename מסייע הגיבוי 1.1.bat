@echo off
color 72
chcp 1255>nul
title ����� ������ 1.1
echo.
echo ������ ����� ���� ����
set/p source=">>>"
echo.
echo ������ ����� ���� ����
set/p target=">>>"
robocopy /s /xc %source% %target%
pause