echo Windows Update Medic Service
sc stop WaasMedicSvc
REG ADD HKLM\SYSTEM\CurrentControlSet\Services\WaasMedicSvc /v Start /f /t REG_DWORD /d 4
echo.


echo Windows Update Service
sc stop wuauserv
REG ADD HKLM\SYSTEM\CurrentControlSet\Services\wuauserv /v Start /f /t REG_DWORD /d 4
echo.


echo Update the Orchestrator service
sc stop UsoSvc
REG ADD HKLM\SYSTEM\CurrentControlSet\Services\UsoSvc /v Start /f /t REG_DWORD /d 4
echo.