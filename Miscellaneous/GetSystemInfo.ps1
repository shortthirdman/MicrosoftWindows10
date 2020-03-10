Write-Host -NoNewLine "$PSVersionTable.PSVersion"
Write-Host "Username : $Env:Username"
Write-Host "Current User's Domain : $Env:UserDomain"
Write-Host "Computer Name : $Env:ComputerName"

# Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux