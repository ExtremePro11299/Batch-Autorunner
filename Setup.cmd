@echo off
if not exist Autorun.cmd (
echo Autorun.cmd does not exist.
echo The program may already have been set up.
echo If you want to use this for another program, reinstall Autorun.cmd from GitHub.
pause
exit
)
echo This will make your program always run when you log in. Are you sure?
echo You can disable the runner in the Startup section of the Task Manager (ctrl+shift+esc to open)
pause
move "Autorun.cmd" "%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"
