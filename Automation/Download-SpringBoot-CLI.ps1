$releaseVersion=Read-Host -Prompt 'Provide version of the release '
$releaseVersion=$releaseVersion + '.RELEASE'
$resourceUrl='https://repo.spring.io/release/org/springframework/boot/spring-boot-cli/' + $releaseVersion + '/spring-boot-cli-' + $releaseVersion + '-bin.zip'
$downloadLocation=Read-Host -Prompt 'Please provide the download directory '
$startTime = Get-Date

Write-Host "Downloading Spring Boot CLI $releaseVersion" $downloadLocation -ForegroundColor Green

$wc = New-Object System.Net.WebClient
$wc.DownloadFile($resourceUrl, $downloadLocation)

Write-Output "Time taken: $((Get-Date).Subtract($startTime).Seconds) second(s)"

# Write-Host "Copying" $Path -ForegroundColor Green
# Copy-Item -Source \\server\share\file -Destination C:\path\

# Import-Module BitsTransfer
# Start-BitsTransfer -Source $resourceUrl -Destination $downloadLocation
# Start-BitsTransfer -Source $resourceUrl -Destination $output -Asynchronous

# Write-Output "Time taken: $((Get-Date).Subtract($startTime).Seconds) second(s)"