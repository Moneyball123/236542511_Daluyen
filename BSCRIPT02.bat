@echo off
setlocal enabledelayedexpansion

:menu
cls
echo Select a shape:
echo 1. Circle
echo 2. Triangle
echo 3. Quadrilateral
set /p choice=Enter your choice (1/2/3):

if "%choice%"=="1" goto circle
if "%choice%"=="2" goto triangle
if "%choice%"=="3" goto quadrilateral
echo Invalid choice, please try again.
goto menu

:circle
set /p radius=Enter the radius of the circle:
set /a area=314 * radius * radius / 100
echo The area of the circle is: !area!
pause
goto end

:triangle
set /p a=Enter the length of the first side:
set /p b=Enter the length of the second side:
set /p c=Enter the length of the third side:
set /a s=(a+b+c)/2
set /a area=s * (s-a) * (s-b) * (s-c)
set /a area=sqrt(area)
if "%a%"=="%b%" if "%b%"=="%c%" (
    echo The triangle is equilateral.
) else if "%a%"=="%b%" if not "%b%"=="%c%" (
    echo The triangle is isosceles.
) else if not "%a%"=="%b%" if not "%b%"=="%c%" if not "%a%"=="%c%" (
    echo The triangle is scalene.
)
echo The area of the triangle is: !area!
pause
goto end

:quadrilateral
set /p length=Enter the length:
set /p width=Enter the width:
set /a area=length * width
if "%length%"=="%width%" (
    echo The quadrilateral is a square.
) else (
    echo The quadrilateral is a rectangle.
)
echo The area of the quadrilateral is: !area!
pause
goto end

:end
echo Script complete.
pause
