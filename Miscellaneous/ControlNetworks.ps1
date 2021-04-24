Get-NetIPInterface -AddressFamily IPv6 | Format-Table
Get-NetIPConfiguration -All
Get-NetIPConfiguration | Get-NetIPAddress
(Get-WmiObject -Class Win32_NetworkAdapterConfiguration).Where{ $_.IPAddress } | Format-List
Get-NetAdapter

# Turn off Windows Firewall
netsh advfirewall set allprofiles state off
Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False

# Turn on Windows Firewall
netsh advfirewall set allprofiles state on
Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled True