# Listing BIOS Information
Get-CimInstance -ClassName Win32_BIOS

# Listing Desktop Settings
Get-CimInstance -ClassName Win32_Desktop

# Listing Processor Information
Get-CimInstance -ClassName Win32_Processor

# Listing Computer Manufacturer and Model
Get-CimInstance -ClassName Win32_ComputerSystem | Select-Object -Property SystemType
Get-CimInstance -ClassName Win32_ComputerSystem

# Listing Operating System Version Information
Get-CimInstance -ClassName Win32_OperatingSystem

# Getting Available Disk Space
Get-CimInstance -ClassName Win32_LogicalDisk -Filter "DriveType=3"

Get-CimInstance -ClassName Win32_LogicalDisk -Filter "DriveType=3" | Measure-Object -Property FreeSpace,Size -Sum | Select-Object -Property Property,Sum


# Getting Logon Session Information
Get-CimInstance -ClassName Win32_LogonSession

Get-Service -Name * | Where-Object {$_.RequiredServices -or $_.DependentServices} | Format-Table -Property Status, Name, RequiredServices, DependentServices -auto
Invoke-Command -ComputerName Server01 {Restart-Service Spooler}