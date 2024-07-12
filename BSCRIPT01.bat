@echo off
rem Open five websites in the default web browser
start https://www.google.com
start https://www.microsoft.com
start https://www.github.com
start https://www.stackoverflow.com
start https://www.wikipedia.org

rem Launch the Calculator application
start calc

rem Launch the Notepad application
start notepad

rem Wait for 60 seconds (1 minute) before initiating shutdown
timeout /t 60

rem Initiate system shutdown with a 30-second delay
shutdown /s /t 30

rem Inform the user of the pending shutdown
echo The system will shut down in 30 seconds.
