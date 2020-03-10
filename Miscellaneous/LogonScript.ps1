If (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))
{   
$arguments = "& '" + $myinvocation.mycommand.definition + "'"
Start-Process powershell -Verb runAs -ArgumentList $arguments
Break
}

Install-Package OpenSSL.Light

Get-Process | Protect-CmsMessage -To "*myRecipient*" | Set-Content encrypted.txt

$protected = "Hello World" | Protect-CmsMessage -To *me@somewhere.com*

$protected | Unprotect-CmsMessage

