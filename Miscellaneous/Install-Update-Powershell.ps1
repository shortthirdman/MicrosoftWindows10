pwsh -Command {Get-WinEvent -LogName security}
$PSVersionTable.OS
POWERSHELL_TELEMETRY_OPTOUT

iex "& { $(irm https://aka.ms/install-powershell.ps1) } -UseMSI"

Get-Module -ListAvailable PackageManagement, PowerShellGet
Install-PackageProvider Nuget –Force
Install-Module –Name PowerShellGet –Force
Exit
Install-Module –Name PowerShellGet –Force -AllowClobber
Update-Module -Name PowerShellGet
Set-ExecutionPolicy RemoteSigned