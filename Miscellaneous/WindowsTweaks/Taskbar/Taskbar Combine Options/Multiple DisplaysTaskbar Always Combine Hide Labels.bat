:: MajorGeeks.Com
:: How to Always, Sometimes, or Never Combine Taskbar Buttons in Windows 10
:: https://www.majorgeeks.com/content/page/how_to_alwayssometimesor_never_combine_taskbar_buttons_in_windows_10.html

REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced /V MMTaskbarEnabled /T REG_dWORD /D 1 /F
REG ADD HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced /V MMTaskbarGlomLevel /T REG_dWORD /D 0 /F

taskkill /f /im explorer.exe
start explorer.exe