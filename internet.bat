@echo off
echo Starting Internet Booster...

rem Navigate to root directory
cd \

rem Show current TCP settings
echo.
echo Current TCP Global Settings:
netsh int tcp show global

rem Enable TCP Chimney Offload
echo.
echo Enabling TCP Chimney Offload...
netsh int tcp set global chimney=enabled

rem Disable TCP Heuristics
echo.
echo Disabling TCP Heuristics...
netsh int tcp set heuristics disabled

rem Set TCP Auto-Tuning Level to Normal
echo.
echo Setting TCP Auto-Tuning Level to Normal...
netsh int tcp set global autotuninglevel=normal

rem Set TCP Congestion Provider to CTCP
echo.
echo Setting TCP Congestion Provider to CTCP...
netsh int tcp set supplemental congestionprovider=ctcp

rem Display the new settings
echo.
echo Updated TCP Global Settings:
netsh int tcp show global

:: Detect the system architecture
if "%PROCESSOR_ARCHITECTURE%"=="AMD64" (
    echo.
    echo This is a 64-bit system.
) else (
    echo.
    echo This is a 32-bit system.
)

echo.
echo Internet Booster Completed. Please restart your computer for changes to take effect.
pause
