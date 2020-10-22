@echo off

:: MajorGeeks.Com
:: Show or Hide Touch Keyboard Icon in Windows 10
:: https://www.majorgeeks.com/content/page/how_to_show_or_hide_touch_keyboard_icon_in_windows_10_taskbar.html

REG ADD "HKCU\SOFTWARE\Microsoft\TabletTip\1.7" /V TipbandDesiredVisibility /T REG_DWORD /D 1 /F

taskkill /f /im explorer.exe
start explorer.exe