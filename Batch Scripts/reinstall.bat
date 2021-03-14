Rundll32 setupapi,InstallHinfSection Ndi-Steelhead 132 %windir%\inf\netrass.inf
sc start mpssvc
netsh advfirewall reset
netsh advfirewall set domainprofile state on
netsh advfirewall set privateprofile state on