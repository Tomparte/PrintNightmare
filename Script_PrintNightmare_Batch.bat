@echo off

:: Add regKey that sets in 'Disabled' the policy 'Allow Print Spooler to accept client connections' :
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Printers" /v "RegisterSpoolerRemoteRpcEndPoint" /t REG_DWORD /d 2 /f >nul

:: Add regKeys 'NoWarningNoElevationOnInstall' and 'UpdatePromptSettings' set to 0 at 'HKLM\Soft\Policies\Ms\WNT\Printers\P&P' :
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Printers\PointAndPrint" /v "NoWarningNoElevationOnInstall" /t REG_DWORD /d 0 /f >nul
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Printers\PointAndPrint" /v "UpdatePromptSettings" /t REG_DWORD /d 0 /f >nul

echo The script has been executed!
echo Touch enter to conitnue and close the terminal!

pause