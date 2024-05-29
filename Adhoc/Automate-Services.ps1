$ServiceName = 'Serenade'
$arrService = Get-Service -Name $ServiceName

while ($arrService.Status -ne 'Running')
{

    Start-Service $ServiceName
    Write-Host "$ServiceName :: $arrService.Status" -ForegroundColor Cyan
    Write-Host "Starting $ServiceName" -ForegroundColor Cyan
    Start-Sleep -seconds 60
    $arrService.Refresh()
    if ($arrService.Status -eq 'Running')
    {
        Write-Host "$ServiceName is now Running" -ForegroundColor Green
    }
}







[Array] $Services = 'Service1','Service2','Service3','Service4','Service5';

# loop through each service, if its running, stop it
foreach($ServiceName in $Services)
{
    $arrService = Get-Service -Name $ServiceName
    write-host $ServiceName
    while ($arrService.Status -eq 'Running')
    {
        Stop-Service $ServiceName
        write-host $arrService.status
        write-host 'Service stopping'
        Start-Sleep -seconds 60
        $arrService.Refresh()
        if ($arrService.Status -eq 'Stopped')
            {
              Write-Host 'Service is now Stopped'
            }
     }
 }
 
 
 
 
 
 
 
# start the following Windows services in the specified order:
[Array] $Services = 'Service1','Service2','Service3','Service4','Service5';

# loop through each service, if its not running, start it
foreach($ServiceName in $Services)
{
    $arrService = Get-Service -Name $ServiceName
    write-host $ServiceName
    while ($arrService.Status -ne 'Running')
    {
        Start-Service $ServiceName
        write-host $arrService.status
        write-host 'Service starting'
        Start-Sleep -seconds 60
        $arrService.Refresh()
        if ($arrService.Status -eq 'Running')
        {
          Write-Host 'Service is now Running'
        }
    }
}