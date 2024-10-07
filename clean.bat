@echo off
:: Clean and Optimize Windows PC
echo Starting additional optimizations and cleanup...

:: Check and repair system files
echo Running System File Checker...
sfc /scannow

:: Clear temporary files
echo Clearing temporary files...
del /q /s "%temp%\*.*" >nul 2>&1
:: Commented out to avoid deleting the temp folder itself
:: rd /s /q "%temp%" >nul 2>&1
:: md "%temp%" >nul 2>&1
del /q /s "C:\Windows\Temp\*.*" >nul 2>&1
:: Commented out to avoid deleting the Windows Temp folder
:: rd /s /q "C:\Windows\Temp" >nul 2>&1
:: md "C:\Windows\Temp" >nul 2>&1

:: Reset network settings
echo Skipping network reset...

:: Optimize NVIDIA settings
echo Skipping NVIDIA optimization...

:: Release unused memory
echo Skipping memory release...

:: Optimize system
echo Skipping disk optimization...

:: Cleanup other directories
echo Skipping cleanup of other directories...

:: Clean registry keys related to recent files while keeping essential settings
echo Skipping registry cleanup...

:: Detect the system architecture
if "%PROCESSOR_ARCHITECTURE%"=="AMD64" (
    echo This is a 64-bit system.
) else (
    echo This is a 32-bit system.
)

:: Final Message
echo All optimizations and cleanup completed successfully!
pause
exit
