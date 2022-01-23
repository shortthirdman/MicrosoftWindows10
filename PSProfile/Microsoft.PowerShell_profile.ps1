Clear-History
$PwshHistoryFile = (Get-PSReadLineOption).HistorySavePath
Clear-Content -Path $PwshHistoryFile
Set-PSReadLineOption -HistorySaveStyle SaveNothing