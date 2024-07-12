@echo off
setlocal enabledelayedexpansion

:menu
cls
echo Select a utility to execute:
echo 1. ipconfig
echo 2. tasklist
echo 3. taskkill
echo 4. chkdsk
echo 5. format
echo 6. defrag
echo 7. find
echo 8. attrib
set /p choice=Enter your choice (1-8):

if "%choice%"=="1" goto ipconfig
if "%choice%"=="2" goto tasklist
if "%choice%"=="3" goto taskkill
if "%choice%"=="4" goto chkdsk
if "%choice%"=="5" goto format
if "%choice%"=="6" goto defrag
if "%choice%"=="7" goto find
if "%choice%"=="8" goto attrib
echo Invalid choice, please try again.
pause
goto menu

:ipconfig
ipconfig
pause
goto menu

:tasklist
tasklist
pause
goto menu

:taskkill
set /p pid=Enter the PID of the process to kill:
taskkill /PID %pid%
if errorlevel 1 (
    echo Failed to kill the process. Please check the PID and try again.
) else (
    echo Process terminated successfully.
)
pause
goto menu

:chkdsk
set /p drive=Enter the drive letter to check (e.g., C:):
chkdsk %drive%
pause
goto menu

:format
set /p drive=Enter the drive letter to format (e.g., D:):
echo Warning: Formatting will erase all data on %drive%
set /p confirm=Are you sure you want to format %drive%? (Y/N):
if /i "%confirm%"=="Y" (
    format %drive%
    if errorlevel 1 (
        echo Failed to format the drive. Please check the drive letter and try again.
    ) else (
        echo Drive formatted successfully.
    )
) else (
    echo Format operation cancelled.
)
pause
goto menu

:defrag
set /p drive=Enter the drive letter to defrag (e.g., C:):
defrag %drive%
pause
goto menu

:find
set /p search=Enter the text to search for:
set /p file=Enter the file to search in:
find "%search%" %file%
if errorlevel 1 (
    echo Text not found or an error occurred. Please check the inputs and try again.
) else (
    echo Search completed successfully.
)
pause
goto menu

:attrib
set /p file=Enter the file or directory to modify attributes:
set /p attributes=Enter the attributes to set (e.g., +r -h):
attrib %attributes% %file%
if errorlevel 1 (
    echo Failed to set attributes. Please check the inputs and try again.
) else (
    echo Attributes set successfully.
)
pause
goto menu
