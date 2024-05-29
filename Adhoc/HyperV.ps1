Dism /Online /Enable-Feature:Microsoft-Hyper-V /All
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V –All

Dism /Online /Disable-Feature:Microsoft-Hyper-V-All
Dism /Online /Cleanup-Image /RestoreHealth
Dism /online /Cleanup-Image /StartComponentCleanup
Disable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V-All