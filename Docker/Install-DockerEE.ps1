# Download Docker
Invoke-WebRequest -UseBasicParsing -OutFile docker-19.03.5.zip https://download.docker.com/components/engine/windows-server/19.03/docker-19.03.5.zip

# Stop Docker service
Stop-Service docker

# Extract the archive.
Expand-Archive docker-19.03.5.zip -DestinationPath $Env:ProgramFiles -Force

# Clean up the zip file.
Remove-Item -Force docker-19.03.5.zip

# Install Docker. This requires rebooting.
$null = Install-WindowsFeature containers

# Add Docker to the path for the current session.
$env:path += ";$env:ProgramFiles\docker"

# Optionally, modify PATH to persist across sessions.
$newPath = "$env:ProgramFiles\docker;" +
[Environment]::GetEnvironmentVariable("PATH",
[EnvironmentVariableTarget]::Machine)

[Environment]::SetEnvironmentVariable("PATH", $newPath,
[EnvironmentVariableTarget]::Machine)

# Register the Docker daemon as a service.
dockerd --register-service

# Start the Docker service.
Start-Service docker


Install-Package -Name docker -ProviderName DockerMsftProvider -Force -RequiredVersion 19.03
Update-Module DockerMsftProvider
Install-Package -Name docker -ProviderName DockerMsftProvider -RequiredVersion 19.03 -Update -Force