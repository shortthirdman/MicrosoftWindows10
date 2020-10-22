:: MajorGeeks.Com
:: How to Clear Windows Update History in Windows 10
:: https://www.majorgeeks.com/content/page/clear_windows_update_history.html

@echo off
powershell -windowstyle hidden -command "Start-Process cmd -ArgumentList '/s,/c,net stop usosvc & net stop wuauserv & del %systemroot%\SoftwareDistribution\DataStore\Logs\edb.log & del /f /q C:\ProgramData\USOPrivate\UpdateStore\* & net start usosvc & net start wuauserv & UsoClient.exe RefreshSettings' -Verb runAs"


