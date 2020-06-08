#Import-Module ActiveDirectory

Param
(
    [string]$ouPath,
    [string]$ouName
)

 Write-Host "Example 1:'DC=Domain,DC=com' ---> this will create under root)"
 write-host "Example 2:'OU=SpecificOU,DC=Domain,DC=com'----> This will create under specificOU " 
 Write-Host "Example 3:'OU=ParentofNewOU,OU=AnotherParent,DC=domain,DC=com'----> This will Create child OU under two parent OU'S "

$ouPath= Read-Host "Please provide the path of the new OU In the above formate"

$ouName = Import-CSV -Path C:\Path\To\File.csv

foreach($ou in $ouName) {
    New-ADOrganizationalUnit -Name $ou -Path $ouPath
}
