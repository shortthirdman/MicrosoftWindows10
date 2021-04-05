Get-CimInstance -ClassName Win32_Desktop | Select-Object -ExcludeProperty "CIM*"
Get-CimInstance -ClassName Win32_BIOS
Get-CimInstance -ClassName Win32_QuickFixEngineering
Get-CimInstance -ClassName Win32_QuickFixEngineering -Property HotFixID
Get-CimInstance -ClassName Win32_ComputerSystem | Select-Object -Property SystemType
Get-CimInstance -ClassName Win32_OperatingSystem | Select-Object -Property BuildNumber,BuildType,OSType,ServicePackMajorVersion,ServicePackMinorVersion
Get-CimInstance -ClassName Win32_OperatingSystem | Select-Object -Property Build*,OSType,ServicePack*
Get-CimInstance -ClassName Win32_OperatingSystem | Select-Object -Property NumberOfLicensedUsers,NumberOfUsers,RegisteredUser
Get-CimInstance -ClassName Win32_LogicalDisk -Filter "DriveType=3"
Get-CimInstance -ClassName Win32_LogonSession
Get-CimInstance -ClassName Win32_LogicalDisk -Filter "DriveType=3" | Measure-Object -Property FreeSpace,Size -Sum | Select-Object -Property Property,Sum
Get-CimInstance -ClassName Win32_ComputerSystem -Property UserName
Get-CimInstance -ClassName Win32_LocalTime
Get-CimInstance -ClassName Win32_Service | Format-Table -Property Status,Name,DisplayName -AutoSize -Wrap
Get-CimInstance -ClassName Win32_Service | Select-Object -Property Status,Name,DisplayName

Get-Process | Where-Object -FilterScript {$_.Responding -eq $false} | Stop-Process
Get-Process -Name BadApp | Where-Object -FilterScript {$_.SessionId -neq 0} | Stop-Process
Invoke-Command -ComputerName Server01 {Stop-Process Powershell}

Start-Process PowerShell -Verb RunAs
powershell -Command "Start-Process PowerShell -Verb RunAs"