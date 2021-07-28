# PrintNightmare

Here is a project that will help to fight against Windows security breach PrintNightmare!
(CVE-2021-34527)

First of all, 
On a client, you NEED to update your computer with last microsoft fixs.
On a server, you HAVE TO switch off then disable at startup the Windows Print Spooler Service via Services.msc or via 2 Powershell commands :
      Stop-Service -Name Spooler -Force
      Set-Service -Name Spooler -StartupType Disabled
