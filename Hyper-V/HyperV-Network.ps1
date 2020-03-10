Get-NetIPInterface -InterfaceAlias "vEthernet (Default Switch)" -AddressFamily IPv4 | Get-NetIPAddress | ForEach-Object { $_.IPAddress }

Set-NetConnectionProfile -Name 'Network 2' -NetworkCategory Private
Set-NetConnectionProfile -interfacealias "vEthernet (DockerNAT)" -NetworkCategory Private
Set-NetConnectionProfile -interfacealias "vEthernet (Default Switch)" -NetworkCategory Private

(Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion").CurrentBuild
Get-VMNetworkAdapter -ManagementOS
Get-NetAdapter | Format-Table Name,InterfaceDescription,ifIndex,Status,LinkSpeed,MediaConnectionState
Get-NetIPInterface