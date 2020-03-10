# Disable-HyperV-Features.ps1
# Author Swetank Mohanty
# Version 1.0

$myWindowsID = [System.Security.Principal.WindowsIdentity]::GetCurrent();
$myWindowsPrincipal = New-Object System.Security.Principal.WindowsPrincipal($myWindowsID);
$adminRole = [System.Security.Principal.WindowsBuiltInRole]::Administrator;

# $currentUser = New-Object Security.Principal.WindowsPrincipal $([Security.Principal.WindowsIdentity]::GetCurrent())
# $currentUser.IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)

<# If ($myWindowsPrincipal.IsInRole($adminRole))
{
    # We are running as an administrator, so change the title and background colour to indicate this
    $Host.UI.RawUI.WindowTitle = $myInvocation.MyCommand.Definition + "(Elevated)";
    $Host.UI.RawUI.BackgroundColor = "DarkBlue";
    Clear-Host;
} #>

If (-NOT (([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)))
{
 Start-Process powershell -Verb runAs -WorkingDirectory $PWD.Path
 Break
}

..\dgreadiness_v3.6\DG_Readiness_Tool_v3.6.ps1 -Ready -Path ..\dgreadiness_v3.6\
..\dgreadiness_v3.6\DG_Readiness_Tool_v3.6.ps1 -Disable -AutoReboot
& Disable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V-All
& bcdedit /set hypervisorlaunchtype off
# $Creds = Get-Credential
# Restart-Computer -ComputerName localhost -Credential $Creds -Force
