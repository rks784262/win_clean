@echo off
:: Clean and Optimize Windows PC
echo Starting additional optimizations and cleanup...

:: Check and repair system files
echo Running System File Checker...
sfc /scannow

:: Clear temporary files
echo Clearing temporary files...
del /q /s "%temp%\*.*" >nul 2>&1
rd /s /q "%temp%" >nul 2>&1
md "%temp%" >nul 2>&1
del /q /s "C:\Windows\Temp\*.*" >nul 2>&1
rd /s /q "C:\Windows\Temp" >nul 2>&1
md "C:\Windows\Temp" >nul 2>&1

:: Reset network settings
echo Resetting network settings...
netsh winsock reset

:: Optimize NVIDIA settings
echo Optimizing NVIDIA settings...
nvidia-smi -rac

:: Release unused memory
echo Releasing unused memory...
echo. | set /p dummyVar="Releasing unused memory..."
EmptyWorkingSet(HANDLE(-1))

:: Optimize system
echo Optimizing disk performance...
defrag /C /O

:: Cleanup other directories
echo Cleaning up other directories...
del /s /f /q "C:\Windows\Prefetch\*.*" >nul 2>&1
del /s /f /q "C:\Windows\Downloaded Program Files\*.*" >nul 2>&1
rd /s /q "%SYSTEMDRIVE%\$Recycle.bin" >nul 2>&1
del /s /f /q "%userprofile%\Recent\*.*" >nul 2>&1

:: Clean registry keys related to recent files while keeping essential settings
echo Cleaning registry keys related to recent files...
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs" /va /f >nul 2>&1
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\*Recent File List" /va /f >nul 2>&1

:: Final Message
echo All optimizations and cleanup completed successfully!
pause
exit
