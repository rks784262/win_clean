echo Performing additional optimizations and cleanup...
sfc /scannow

rem Clear temporary files
del /q /s "%temp%\*.*"
rd /s /q "%temp%"
md "%temp%"
del /q /s "C:\Windows\Temp\*.*"
rd /s /q "C:\Windows\Temp"
md "C:\Windows\Temp"

rem Reset network settings and scan system files
netsh winsock reset

rem Optimize NVIDIA settings
nvidia-smi -rac

rem Release unused memory
echo. | set /p dummyVar="Releasing unused memory..."
EmptyWorkingSet(HANDLE(-1))

rem Optimize system
defrag /C /O

rem Cleanup other directories
del /s /f /q "C:\Windows\Prefetch\*.*"
del /s /f /q "C:\Windows\Downloaded Program Files\*.*"
rd /s /q "%SYSTEMDRIVE%\$Recycle.bin"
del /s /f /q "%userprofile%\Recent\*.*"

rem Clean registry keys related to recent files
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs" /va /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs" /va /f
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\*Recent File List" /va /f

rem Exit script
echo All optimizations and cleanup complete.
exit
