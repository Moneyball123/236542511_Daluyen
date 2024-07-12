@echo off
setlocal enabledelayedexpansion

rem Define source and destination directories
set sourceDir=C:\
set archiveDir=Z:\ArchivedFiles

rem Create the archive directory if it doesn't exist
if not exist "%archiveDir%" (
    mkdir "%archiveDir%"
)

rem Find and sort text files on C: by date, move older files to the archive directory
echo Sorting and archiving text files from %sourceDir% to %archiveDir%...
forfiles /p %sourceDir% /s /m *.txt /d -30 /c "cmd /c move @path %archiveDir%"

rem Sort archived files by size
echo Sorting archived files by size...
set fileList=tempFileList.txt
dir "%archiveDir%" /s /b /o-s *.txt > %fileList%

rem Display the sorted files and prompt the user for deletion
echo The following old, large files were archived:
type %fileList%
echo.

set /p confirm=Do you want to delete these old, large files? (Y/N):
if /i "%confirm%"=="Y" (
    echo Deleting files...
    for /f "delims=" %%f in (%fileList%) do (
        del "%%f"
    )
    echo Files deleted.
) else (
    echo Deletion cancelled.
)

rem Clean up
del %fileList%
echo Script complete.
pause
endlocal
