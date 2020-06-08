########################################
# checks for uninstall.exe file -if found skip check ncpaservice and run uninstall.exe
# if .exe file not found Checks the ncpa group services status
# if found Delete the service
# Delete  the Nagios folder 
# Author : kamalnadh 
#######################################

if ( !( Test-Path "C:\Program Files (x86)\Nagios\NCPA\uninstall.exe") )
{

$ncpaservices = 'ncpapassive' ,'ncpalistener'

foreach ($servicename in $ncpaservices)
{

   if ($Service = Get-Service -Name $ServiceName -ErrorAction SilentlyContinue)
     {
       If ($service.Status -eq 'Running')
          {
           Stop-Service $serviceName
           Write-Host "Stopping $serviceName"
           sc.exe delete $servicename
           } 
       Else {
                Write-Host "$serviceName found, but it's not running."
                sc.exe delete $servicename
             }
    }
    
    Else { Write-Host "$serviceName not found" }

 }
    Remove-Item -Path "C:\Program Files (x86)\Nagios" -Force
}
 else
  {
  Start-Process -FilePath "C:\Program Files (x86)\Nagios\NCPA\uninstall.exe" -ArgumentList "/S","/v","/qn" –Wait
  Remove-Item -Path "C:\Program Files (x86)\Nagios" -Force
  }