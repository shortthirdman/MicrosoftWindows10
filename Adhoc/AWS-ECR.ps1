https://aws_account_id.dkr.ecr.region.amazonaws.com

$AWS_ACCESS_KEY_ID = [Environment]::GetEnvironmentVariable('AWS_ACCESS_KEY_ID','Machine')
$AWS_SECRET_ACCESS_KEY = [Environment]::GetEnvironmentVariable('AWS_SECRET_ACCESS_KEY','Machine')
Set-AWSCredential -AccessKey $AWS_ACCESS_KEY_ID -SecretKey $AWS_SECRET_ACCESS_KEY -StoreAs DefaultProfile
$AWS_CRED = Get-AWSCredential -ProfileName DefaultProfile
Set-DefaultAWSRegion -Region us-east-1
(Get-ECRLoginCommand -Credential $AWS_CRED -Region us-east-1).Password | docker login --username AWS --password-stdin 206084440227.dkr.ecr.us-east-1.amazonaws.com
docker build -t shortthirdman/netstar-postgres .
docker tag shortthirdman/netstar-postgres:latest 206084440227.dkr.ecr.us-east-1.amazonaws.com/shortthirdman/netstar-postgres:latest
docker push 206084440227.dkr.ecr.us-east-1.amazonaws.com/shortthirdman/netstar-postgres:latest

Invoke-Expression –Command (Get-ECRLoginCommand –Region us-east-1).Command

Install-AWSToolsModule AWS.Tools.EC2,AWS.Tools.S3 -CleanUp
Install-AWSToolsModule AWS.Tools.IdentityManagement -Scope AllUsers

Install-Package -Name AWSPowerShell.NetCore -Source https://www.powershellgallery.com/api/v2/ -ProviderName NuGet -ExcludeVersion -Destination C:\Softwares\AWSPowerShell

Install-Module -Name AWSPowerShell.NetCore
Install-Module -Name AWSPowerShell
Install-Module -Name AWS.Tools.Common

New-Item -Path 'C:\Program Files\Amazon\ECSCLI' -ItemType Directory
Invoke-WebRequest -OutFile 'C:\Program Files\Amazon\ECSCLI\ecs-cli.exe' https://amazon-ecs-cli.s3.amazonaws.com/ecs-cli-windows-amd64-latest.exe
setx path "%path%;C:\Program Files\Amazon\ECSCLI"
ecs-cli --version
ecs-cli configure profile --profile-name profile_name --access-key $AWS_ACCESS_KEY_ID --secret-key $AWS_SECRET_ACCESS_KEY
ecs-cli configure --cluster cluster_name --default-launch-type launch_type --region region_name --config-name configuration_name

ECS_PROFILE
AWS_PROFILE
AWS_DEFAULT_PROFILE
AWS_SESSION_TOKEN
AWS_ACCESS_KEY_ID
AWS_SECRET_ACCESS_KEY
AWS_REGION
AWS_DEFAULT_REGION
AWS_ACCOUNT_ID

206084440227