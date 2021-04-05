Get-NetIPInterface -AddressFamily IPv6 | Format-Table
Get-NetIPConfiguration -All
Get-NetIPConfiguration | Get-NetIPAddress
(Get-WmiObject -Class Win32_NetworkAdapterConfiguration).Where{ $_.IPAddress } | Format-List
Get-NetAdapter