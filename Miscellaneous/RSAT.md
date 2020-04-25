## To check whether RSAT components are installed

`Get-WindowsCapability -Name RSAT* -Online`

## To view the status of installed RSAT components in a more convenient table

`Get-WindowsCapability -Name RSAT* -Online | Select-Object -Property DisplayName, State`

## To install all the available RSAT tools at once, run:

`Get-WindowsCapability -Name RSAT* -Online | Add-WindowsCapability –Online`

## To install only disabled RSAT components, run:

`Get-WindowsCapability -Online |? {$_.Name -like "*RSAT*" -and $_.State -eq "NotPresent"} | Add-WindowsCapability -Online`

## To install all the available RSAT tools, run:

`Add-WindowsCapability –online –Name "Rsat.ActiveDirectory.DS-LDS.Tools~~~~0.0.1.0"`

`Add-WindowsCapability -Online -Name "Rsat.FileServices.Tools~~~~0.0.1.0"`

`Add-WindowsCapability -Online -Name "Rsat.GroupPolicy.Management.Tools~~~~0.0.1.0"`

`Add-WindowsCapability -Online -Name "Rsat.IPAM.Client.Tools~~~~0.0.1.0"`

`Add-WindowsCapability -Online -Name "Rsat.LLDP.Tools~~~~0.0.1.0"`

`Add-WindowsCapability -Online -Name "Rsat.NetworkController.Tools~~~~0.0.1.0"`

`Add-WindowsCapability -Online -Name "Rsat.NetworkLoadBalancing.Tools~~~~0.0.1.0"`

`Add-WindowsCapability -Online -Name "Rsat.BitLocker.Recovery.Tools~~~~0.0.1.0"`

`Add-WindowsCapability -Online -Name "Rsat.CertificateServices.Tools~~~~0.0.1.0"`

`Add-WindowsCapability -Online -Name "Rsat.DHCP.Tools~~~~0.0.1.0"`

`Add-WindowsCapability -Online -Name "Rsat.FailoverCluster.Management.Tools~~~~0.0.1.0"`

`Add-WindowsCapability -Online -Name "Rsat.RemoteAccess.Management.Tools~~~~0.0.1.0"`

`Add-WindowsCapability -Online -Name "Rsat.RemoteDesktop.Services.Tools~~~~0.0.1.0"`

`Add-WindowsCapability -Online -Name "Rsat.ServerManager.Tools~~~~0.0.1.0"`

`Add-WindowsCapability -Online -Name "Rsat.Shielded.VM.Tools~~~~0.0.1.0"`

`Add-WindowsCapability -Online -Name "Rsat.StorageMigrationService.Management.Tools~~~~0.0.1.0"`

`Add-WindowsCapability -Online -Name "Rsat.StorageReplica.Tools~~~~0.0.1.0"`

`Add-WindowsCapability -Online -Name "Rsat.SystemInsights.Management.Tools~~~~0.0.1.0"`

`Add-WindowsCapability -Online -Name "Rsat.VolumeActivation.Tools~~~~0.0.1.0"`

`Add-WindowsCapability -Online -Name "Rsat.WSUS.Tools~~~~0.0.1.0"`

`Add-WindowsCapability –online –Name "Rsat.Dns.Tools~~~~0.0.1.0"`