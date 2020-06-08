$driveinfo=Get-WmiObject Win32_PageFileusage | Select-Object Name 
$drivename=$driveinfo.name
$driveletter=$drivename.Split('\')
$driveletter[0]