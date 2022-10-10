@echo off
color 72
chcp 1255>nul
title מסייע הגיבוי 1.1
echo.
echo הקתעהל היקית ביתנ סנכה
set/p source=">>>"
echo.
echo הקבדהל היקית ביתנ סנכה
set/p target=">>>"
robocopy /s /xc %source% %target%
pause