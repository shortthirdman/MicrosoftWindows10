@echo off

:: MajorGeeks.Com
:: How to Show Seconds in Windows 10 Clock
:: https://www.majorgeeks.com/content/page/show_seconds_in_windows_10_clock.html


REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /V ShowSecondsInSystemClock /T REG_DWORD /D 0 /F

taskkill /f /im explorer.exe
start explorer.exe

