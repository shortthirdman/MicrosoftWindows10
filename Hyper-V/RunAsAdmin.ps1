If (-NOT (([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)))
{
 # $arguments = "& '" + $myinvocation.MyCommand.Definition + "'"
 Start-Process powershell -Verb runAs -WorkingDirectory $PWD.Path
 # Start-Process powershell -Verb runAs -ArgumentList $arguments
 Break
}