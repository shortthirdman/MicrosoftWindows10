$linuxVMName=RHEL8x64ShortThirdManUSAInc
Set-VMSecurity -VMName $linuxVMName -VirtualizationBasedSecurityOptOut $true

Get-Command -Module hyper-v | Out-GridView

Get-Help Get-VM

Get-VM | where {$_.State -eq 'Running'}

Get-VM | where {$_.State -eq 'Off'}

Start-VM -Name $linuxVMName

Get-VM | where {$_.State -eq 'Off'} | Start-VM

Get-VM | where {$_.State -eq 'Running'} | Stop-VM

Get-VM -Name $linuxVMName | Checkpoint-VM -SnapshotName <name for snapshot>

Enter-PSSession -VMName $linuxVMName
Enter-PSSession -VMId <VMId>

Exit-PSSession

Invoke-Command -VMName $linuxVMName -ScriptBlock { command } 
Invoke-Command -VMId <VMId> -ScriptBlock { command }

Invoke-Command -VMName $linuxVMName -FilePath C:\host\script_path\script.ps1 
Invoke-Command -VMId <VMId> -FilePath C:\host\script_path\script.ps1

$s = New-PSSession -VMName $linuxVMName -Credential (Get-Credential)
$s = New-PSSession -VMId <VMId> -Credential (Get-Credential)

Copy-Item -ToSession $s -Path C:\host_path\data.txt -Destination C:\guest_path\
Copy-Item -FromSession $s -Path C:\guest_path\data.txt -Destination C:\host_path\
Remove-PSSession $s

[System.Environment]::OSVersion.Version
$PSVersionTable.PSVersion

Restart-Service -Name vmicvmsession

# $VMName = "RHEL8x64ShortThirdManUSAInc"

# $VM = @{
 # Name = $VMName
 # MemoryStartupBytes = 2147483648
 # Generation = 2
 # NewVHDPath = "C:\Virtual Machines\$VMName\$linuxVMName.vhdx"
 # NewVHDSizeBytes = 53687091200
 # BootDevice = "VHD"
 # Path = "C:\Virtual Machines\$VMName"
 # SwitchName = (Get-VMSwitch).Name
# }
# New-VM @VM

New-VM -Generation 1 -Name $linuxVMName -MemoryStartupBytes MEMORY_SIZE -BootDevice VHD -VHDPath PATH_TO_VHD
New-VHD -Path PATH_TO_DATA_DISK -SizeBytes DISK_SIZE
Add-VMHardDiskDrive -VMName $linuxVMName -Path PATH_TO_DATA_DISK
Start-VM -Name $linuxVMName
(Get-VMNetworkAdapter -VMName $linuxVMName).IpAddresses