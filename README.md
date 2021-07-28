# PrintNightmare

Here is a project that will help to fight against Windows security breach PrintNightmare! (CVE-2021-34527)

You have to know that a patch has been released by Microsoft against this breach but is not fully functional and fight only RCE (Remote code execution) while LPE (Local privilege elevation) is still working for potential attackers.


Here are some things to do :
-

- First of all, on a client, you NEED to update your computer with last microsoft fixs even if it is not fully patching.
- Then, on a server, if installing the microsoft patch is not possible, you HAVE TO switch off then disable at startup the Windows Print Spooler Service via Services.msc or via 2 Powershell commands :
       "Stop-Service -Name Spooler -Force"  and  "Set-Service -Name Spooler -StartupType Disabled".
- Launch the script powershell or batch that will update or create 3 registry keys : 
    - RegisterSpoolerRemoteRpcEndPoint with value 2 (DWORD) at HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Printers 
    - NoWarningNoElevationOnInstall with value 0 (DWORD) at HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Printers\PointAndPrint 
    - UpdatePromptSettings with value 0 (DWORD) at HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Printers\PointAndPrint
 
 Sources
 -
 I created this protocole with help of many websites tracing the breach : 
 - https://msrc.microsoft.com/update-guide/vulnerability/CVE-2021-34527
 - https://kb.cert.org/vuls/id/383432
 - https://wccftech.com/windows-printnightmare-patch-requires-additional-registry-settings/
 - https://www.ghacks.net/2021/07/03/workaround-for-the-windows-print-spooler-remote-code-execution-vulnerability/
