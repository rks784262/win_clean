@echo off
:: Clean and Optimize Windows PC
echo Starting optimization...

:: Backup current registry settings
echo Backing up registry settings...
reg export "HKCU\Control Panel\Accessibility" "%temp%\Accessibility_Backup.reg" /y
reg export "HKCU\Control Panel\Keyboard" "%temp%\Keyboard_Backup.reg" /y
reg export "HKEY_CURRENT_USER\Control Panel\Mouse" "%temp%\Mouse_Backup.reg" /y
reg export "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services" "%temp%\Services_Backup.reg" /y

:: Keyboard and Mouse Settings
echo Adjusting keyboard and mouse settings...
reg add "HKCU\Control Panel\Accessibility\Keyboard Response" /v "AutoRepeatDelay" /t reg_SZ /d "200" /f
reg add "HKCU\Control Panel\Accessibility\Keyboard Response" /v "AutoRepeatRate" /t reg_SZ /d "6" /f
reg add "HKCU\Control Panel\Accessibility\Keyboard Response" /v "BounceTime" /t reg_SZ /d "0" /f
reg add "HKCU\Control Panel\Accessibility\Keyboard Response" /v "DelayBeforeAcceptance" /t reg_SZ /d "0" /f
reg add "HKCU\Control Panel\Accessibility\Keyboard Response" /v "Flags" /t reg_SZ /d "59" /f
reg add "HKCU\Control Panel\Accessibility\Keyboard Response" /v "Last BounceKey Setting" /t reg_DWORD /d "0" /f
reg add "HKCU\Control Panel\Accessibility\Keyboard Response" /v "Last Valid Delay" /t reg_DWORD /d "0" /f
reg add "HKCU\Control Panel\Accessibility\Keyboard Response" /v "Last Valid Repeat" /t reg_DWORD /d "0" /f
reg add "HKCU\Control Panel\Accessibility\Keyboard Response" /v "Last Valid Wait" /t reg_DWORD /d "1000" /f
reg add "HKCU\Control Panel\Accessibility\StickyKeys" /v "Flags" /t reg_SZ /d "506" /f
reg add "HKCU\Control Panel\Accessibility\ToggleKeys" /v "Flags" /t reg_SZ /d "58" /f
reg add "HKCU\Control Panel\Accessibility\MouseKeys" /v "Flags" /t reg_SZ /d "38" /f
reg add "HKCU\Control Panel\Keyboard" /v "InitialKeyboardIndicators" /t reg_SZ /d "0" /f
reg add "HKCU\Control Panel\Keyboard" /v "KeyboardDelay" /t reg_SZ /d "0" /f
reg add "HKCU\Control Panel\Keyboard" /v "KeyboardSpeed" /t reg_SZ /d "31" /f

:: Mouse Settings
reg add "HKEY_CURRENT_USER\Control Panel\Mouse" /v "MouseSensitivity" /t reg_SZ /d "10" /f
reg add "HKEY_CURRENT_USER\Control Panel\Mouse" /v "SmoothMouseXCurve" /t reg_BINARY /d "0000000000000000156e000000000000004001000000000029dc0300000000000000280000000000" /f
reg add "HKEY_CURRENT_USER\Control Panel\Mouse" /v "SmoothMouseYCurve" /t reg_BINARY /d "0000000000000000fd11010000000000002404000000000000fc12000000000000c0bb0100000000" /f

:: Network Configuration
echo Configuring network settings...
ipconfig /all
ipconfig /flushdns
ipconfig /release
ipconfig /renew

:: Disable unnecessary services (set to Disabled)
echo Disabling unnecessary services...
setlocal enabledelayedexpansion
for %%s in (
    xbgm
    XboxGipSvc
    WaaSMedicSvc
    W32Time
    spectrum
    wcncsvc
    WebClient
    SysMain
    NcaSvc
    diagsvc
    UserDataSvc
    stisvc
    AdobeFlashPlayerUpdateSvc
    TrkWks
    dmwappushservice
    PimIndexMaintenanceSvc
    DiagTrack
    GoogleChromeElevationService
    OneSyncSvc
    ibtsiva
    SNMPTRAP
    pla
    ssh-agent
    sshd
    DoSvc
    WbioSrvc
    PcaSvc
    NetTcpPortSharing
    wersvc
    gupdate
    gupdatem
    MSiSCSI
    SystemEventsBroker
    MSDTC
    VMCompute
    wuauserv
    WMPNetworkSvc
) do (
    reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\%%s" /v "Start" /t reg_DWORD /d "4" /f
)
endlocal

:: Adjust Internet Explorer Security Settings
echo Adjusting Internet Explorer security settings...
reg add "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main" /v "Disable Script Debugging (Internet Explorer)" /t reg_SZ /d "yes" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main" /v "Disable Script Debugging (Other)" /t reg_SZ /d "yes" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main" /v "Error DIALOGS" /t reg_SZ /d "no" /f

:: Run Windows Troubleshooter
echo Running Windows Troubleshooter...
start ms-settings:troubleshoot

:: Cleanup Temporary Files and Optimize System
echo Performing additional optimizations and cleanup...
del /q /s "%temp%\*.*"
netsh winsock reset
nvidia-smi -rac
powercfg /duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61
echo. | set /p dummyVar="Releasing unused memory..."
EmptyWorkingSet(HANDLE(-1))
defrag /C /O

echo All optimizations and cleanup complete.

:: Delete unnecessary temp files but do not delete critical files or apps
echo Cleaning up temporary files...
del /s /f /q c:\windows\temp\*.* >nul 2>&1
rd /s /q c:\windows\temp >nul 2>&1
md c:\windows\temp >nul 2>&1
del /s /f /q %temp%\*.* >nul 2>&1
rd /s /q %temp% >nul 2>&1
md %temp% >nul 2>&1
del /s /f /q c:\windows\tempor~1 >nul 2>&1
del /s /f /q c:\windows\temp >nul 2>&1
del /s /f /q c:\windows\tmp >nul 2>&1
del /s /f /q c:\windows\ff*.tmp >nul 2>&1
del /s /f /q c:\windows\history >nul 2>&1
del /s /f /q c:\windows\cookies >nul 2>&1
del /s /f /q c:\windows\recent >nul 2>&1
del /s /f /q c:\windows\spool\printers >nul 2>&1
del /s /f /q %userprofile%\Recent\*.* >nul 2>&1
del /s /f /q C:\Windows\Prefetch\*.* >nul 2>&1
del /s /f /q C:\Windows\Temp\*.* >nul 2>&1
del /s /f /q %USERPROFILE%\appdata\local\temp\*.* >nul 2>&1
del /Q C:\Users\%username%\AppData\Local\Microsoft\Windows\INetCache\IE\*.* >nul 2>&1
del /Q C:\Windows\Downloaded Program Files\*.* >nul 2>&1
rd /s /q %SYSTEMDRIVE%\$Recycle.bin >nul 2>&1
del /Q C:\Users\%username%\AppData\Local\Temp\*.* >nul 2>&1
del /Q C:\Windows\Temp\*.* >nul 2>&1
del /Q C:\Windows\Prefetch\*.* >nul 2>&1
del /s /f /q %SystemRoot%\setupapi.log >nul 2>&1
del /s /f /q %SystemRoot%\Panther\* >nul 2>&1
del /s /f /q %SystemRoot%\inf\setupapi.app.log >nul 2>&1
del /s /f /q %SystemRoot%\inf\setupapi.dev.log >nul 2>&1
del /s /f /q %SystemRoot%\inf\setupapi.offline.log >nul 2>&1

:: Remove User-Specific Registry Entries but keep essential settings
echo Removing non-essential user-specific registry entries...
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs" /va /f >nul 2>&1
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU" /va /f >nul 2>&1

:: Final Message
echo Optimization completed successfully!
pause
