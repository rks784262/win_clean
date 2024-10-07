@echo off
:: Clean and Optimize Windows PC
echo Starting optimization...

:: Check and repair system files
echo Running System File Checker...
sfc /scannow

:: Backup current registry settings
echo Backing up registry settings...
reg export "HKCU\Control Panel\Accessibility" "%temp%\Accessibility_Backup.reg" /y
reg export "HKCU\Control Panel\Keyboard" "%temp%\Keyboard_Backup.reg" /y
reg export "HKEY_CURRENT_USER\Control Panel\Mouse" "%temp%\Mouse_Backup.reg" /y

:: Determine architecture and set variables accordingly
set ARCH=%PROCESSOR_ARCHITECTURE%

:: Keyboard and Mouse Settings
echo Adjusting keyboard and mouse settings...
:: Commented out to avoid changing system settings
:: reg add "HKCU\Control Panel\Accessibility\Keyboard Response" /v "AutoRepeatDelay" /t reg_SZ /d "200" /f
:: (Repeat for all other settings you want to keep as is)

:: Network Configuration
echo Configuring network settings...
ipconfig /all
ipconfig /flushdns
ipconfig /release
ipconfig /renew

:: Do not disable unnecessary services (set to Disabled)
echo Skipping disabling unnecessary services...

:: Adjust Internet Explorer Security Settings
echo Skipping adjustment of Internet Explorer security settings...

:: Run Windows Troubleshooter
echo Running Windows Troubleshooter...
start ms-settings:troubleshoot

:: Cleanup Temporary Files and Optimize System
echo Performing additional optimizations and cleanup...
del /q /s "%temp%\*.*"
netsh winsock reset

:: Commented out memory management and defrag commands
:: echo. | set /p dummyVar="Releasing unused memory..."
:: EmptyWorkingSet(HANDLE(-1))
:: defrag /C /O

echo All optimizations and cleanup complete.

:: Delete unnecessary temp files but do not delete critical files or apps
echo Cleaning up temporary files...
del /s /f /q c:\windows\temp\*.* >nul 2>&1
rd /s /q c:\windows\temp >nul 2>&1
md c:\windows\temp >nul 2>&1
del /s /f /q %temp%\*.* >nul 2>&1
rd /s /q %temp% >nul 2>&1
md %temp% >nul 2>&1

:: Final Message
echo Optimization completed successfully!
exit
