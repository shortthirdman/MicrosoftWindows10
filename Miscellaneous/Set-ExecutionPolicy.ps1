Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Set-ExecutionPolicy -ExecutionPolicy Undefined -Scope LocalMachine
Set-ExecutionPolicy -ExecutionPolicy Undefined -Scope CurrentUser
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
Set-ExecutionPolicy -ExecutionPolicy <PolicyName> -Scope <scope>
Set-ExecutionPolicy -ExecutionPolicy <PolicyName>


Get-ExecutionPolicy -Scope CurrentUser
Get-ExecutionPolicy -List
Get-ExecutionPolicy


Set-ExecutionPolicy AllSigned -Scope CurrentUser -Force

Set-ExecutionPolicy Bypass -Scope CurrentUser -Force

Set-ExecutionPolicy Default -Scope CurrentUser -Force

Set-ExecutionPolicy RemoteSigned -Scope CurrentUser -Force

Set-ExecutionPolicy Restricted -Scope CurrentUser -Force

Set-ExecutionPolicy Undefined -Scope CurrentUser -Force

Set-ExecutionPolicy Unrestricted -Scope CurrentUser -Force
