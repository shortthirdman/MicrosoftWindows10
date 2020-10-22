:: MajorGeeks.Com
:: How to Reset Taskbar Toolbars in Windows 7 and 10
:: https://www.majorgeeks.com/content/page/how_to_reset_taskbar_toolbars_in_windows_7_and_10.html
 
REG DELETE HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Streams\Desktop /F

taskkill /f /im explorer.exe

start explorer.exe