<# 
Autor : Tomparte
Version : 1.0

Comments : this script helps to protect against security breach 'PrintNightmare' by :
  1. Creating and update regKey in HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Printers :
                         - RegisterSpoolerRemoteRpcEndPoint = 2 (DWORD)
    (similar to Disabling the “Allow Print Spooler to accept client connections” in group policy management).
      
  2. Creating or updating following registry keys in HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Printers\PointAndPrint : 
                         - NoWarningNoElevationOnInstall = 0 (DWORD)
                         - UpdatePromptSettings = 0 (DWORD) 
        
------------------------------------------------------------------------------------------------------------------------------------------------------------------#>



#var
$path = "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Printers"
$value = "2"


#test if-else
if(Test-Path $path)
{
#change values to 2
New-ItemProperty -Path $path -Name "RegisterSpoolerRemoteRpcEndPoint" -Value $value -PropertyType DWORD -Force
}

else
{
#create folder Point&Print
New-Item -Path $path -Force
#create and set values regKey to 2
New-ItemProperty -Path $path -Name "RegisterSpoolerRemoteRpcEndPoint" -Value $value -PropertyType DWORD -Force
}


#-----------------------------------------------------------------------------------------------------------------------------------------------------------------


#var
$path2 = "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Printers\PointAndPrint"
$value2 = "0"


#test if-else
if(Test-Path $path2)
{
#change values to 0
New-ItemProperty -Path $path2 -Name "NoWarningNoElevationOnInstall" -Value $value2 -PropertyType DWORD -Force
New-ItemProperty -Path $path2 -Name "UpdatePromptSettings" -Value $value2 -PropertyType DWORD -Force
}

else
{
#create folder Point&Print
New-Item -Path $path2 -Force
#create and set values regKeys to 0
New-ItemProperty -Path $path2 -Name "NoWarningNoElevationOnInstall" -Value $value2 -PropertyType DWORD -Force
New-ItemProperty -Path $path2 -Name "UpdatePromptSettings" -Value $value2 -PropertyType DWORD -Force
}
