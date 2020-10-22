:: MajorGeeks.Com
:: How to Clear Windows Update History in Windows 10
:: https://www.majorgeeks.com/content/page/clear_windows_update_history.html

@echo off
powershell -windowstyle hidden -command "Start-Process cmd -ArgumentList '/s,/c,net stop wuauserv & del %systemroot%\SoftwareDistribution\DataStore\Logs\edb.log & net start wuauserv' -Verb runAs"


