

#create the folder that needs to shared

$NewDir = New-Item -ItemType Directory -Path c:\charan

# check the existing folder exist and shared 
Get-WmiObject Win32_Share -Filter "path='C:\\kamal(foldername)'"

# share the folder that is created 
$Shares= [WMICLASS]"Win32_Share"
[void]$Shares.Create("C:\Charan","certobjectshare", 0, 25, "certobject manager folder.") 


#set permissions for the created shared folder 
$acl = Get-Acl -Path "c:\charan"
$AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule("cscmws\cert publishers","write",“ContainerInherit, ObjectInherit”, “None”,"allow")
$acl.SetAccessRule($AccessRule)
$acl | Set-Acl -Path C:\charan\


