# Powershell script to uninstall Sophos
# Can be used in conjunction with SCCM to remove mass deployment of Sophos. Sophos does not have a MSI file to propagate a clean uninstall directly. The script below stops all the Sophos services and removes the specific components of Sophos to perform a clean install in the correct order.
# Author - Vikram Bedi
# vikram.bedi.it@gmail.com 
#Powershell v2.0
#v1.0 Initial Script

Get-Service | Where-Object {$_.DisplayName -like "Sophos*"} | Stop-Service # Shuts down all the Sohos Services
(Start-Process -FilePath "MsiExec.exe" -ArgumentList "/X {FED1005D-CBC8-45D5-A288-FFC7BB304121} /qn REBOOT=REALLYSUPPRESS " -wait -PassThru).ExitCode # Uninstalls "Sophos Remote Management System 4.0.6"
Start-Sleep -Seconds 30
(Start-Process -FilePath "MsiExec.exe" -ArgumentList "/X {1093B57D-A613-47F3-90CF-0FD5C5DCFFE6} /qn REBOOT=REALLYSUPPRESS " -wait -PassThru).ExitCode # Uninstalls "Sophos System Protection 1.3.0"
Start-Sleep -Seconds 30
(Start-Process -FilePath "MsiExec.exe" -ArgumentList "/X {66967E5F-43E8-4402-87A4-04685EE5C2CB} /qn REBOOT=REALLYSUPPRESS " -wait -PassThru).ExitCode # Uninstalls "Sophos Network Threat Protection 1.2.2.50"
Start-Sleep -Seconds 30
(Start-Process -FilePath "MsiExec.exe" -ArgumentList "/X {09863DA9-7A9B-4430-9561-E04D178D7017} /qn REBOOT=REALLYSUPPRESS " -wait -PassThru).ExitCode # Uninstalls "Sophos Anti Virus 10.6.3.537"
Start-Sleep -Seconds 30
(Start-Process -FilePath "MsiExec.exe" -ArgumentList "/X {BCF53039-A7FC-4C79-A3E3-437AE28FD918} /qn REBOOT=REALLYSUPPRESS " -wait -PassThru).ExitCode # Uninstalls "Sophos AutoUpdate 5.2.0.276"
Start-Sleep -Seconds 30