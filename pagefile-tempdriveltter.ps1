

#this Script is for Azure temp drive reallocation to T drive
$TempDriveLetter ="D"
$drivefile=Get-WmiObject Win32_PageFileusage | Select-Object Name 
$drivename=$drivefile.name
$driveletter=$drivename.Split('\')
$driveinfo=$driveletter[0]
$drive = Get-WmiObject -Class win32_volume -Filter "DriveLetter = '$driveinfo'"
$pagefile=Get-WmiObject Win32_PageFilesetting
$pagefile.Delete()


#$drive = Get-WmiObject win32_volume | Select-Object Name ,@{ DriveLetter='$driveinfo' }

echo "select volume 3", "assign letter=$TempDriveLetter" | diskpart

Set-WMIInstance -Class Win32_PageFileSetting -Arguments @{ Name = "$TempDriveLetter\pagefile.sys"} 

