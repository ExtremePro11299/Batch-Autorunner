setlocal EnableDelayedExpansion
@echo off
cls
cd /d "%~dp0"
:checkAutorun
if exist Autorun.cmd (
goto start
)
:autorunNE
cls
echo Autorun.cmd does not exist.
echo The autorun may have already been activated.
echo If you want to use this for another program, reinstall Autorun.cmd from GitHub.
echo What do you want to do?
echo 1) Deactivate Autorun
echo 2) Exit
set /p dinput=
if !dinput!==1 goto :autorunOff
if !dinput!==2 exit
goto :autorunNE
:start
echo What do you want to do?
echo 1) Activate Autorun
echo 2) Test Autorun (only works if autorun hasn't been activated yet)
echo 3) Exit
set /p binput=
if !binput!==1 goto setupp
if !binput!==2 call Autorun.cmd
if !binput!==3 exit
goto start
:setupp
echo This will make your program always run when you log in. Are you sure?
echo.
echo You can later always disable the runner in the Startup section of the Task Manager (ctrl+shift+esc to open)
echo For who should the autorun apply?
echo 1) Current user only
echo 2) All users (Requires admin priveleges)
set /p sinput=
if !sinput!==1 move "Autorun.cmd" "!USERPROFILE!\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"
if !sinput!==2 move "Autorun.cmd" "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup"
goto checkAutorun
:autorunOff
cls
echo For who did the autorun apply?
echo 1) For the current user only
echo 2) For all users
set /p sinput=
if !sinput!==1 move "!USERPROFILE!\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\Autorun.cmd" "%~dp0"
if !sinput!==2 move "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup\Autorun.cmd" "%~dp0"
echo Autorun has been deactivated.
echo.
goto checkAutorun
