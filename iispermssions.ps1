import-module WebAdministration

$acl = Get-Acl -Path "c:\foldername"
$appPoolSid=(Get-ItemProperty IIS:\AppPools\DefaultAppPool).applicationPoolSid
$identifier = New-Object System.Security.Principal.SecurityIdentifier $appPoolSid
$user = $identifier.Translate([System.Security.Principal.NTAccount])
$AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule("$user")
$acl.SetAccessRule($AccessRule)
$acl | Set-Acl -Path C:\foldername\