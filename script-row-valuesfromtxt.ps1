#######################################################
##*** Script Variables to be updated before ****
##====================================================

## Enter the location that the req file will be placed that came from the Issing CA.
$tempfolderreq = "c:\temp\foldername"
##=====================================================

## ROOTCA CRT and ROOT CRL have been copied to on the Issuing CA (No need to change anything here)
$SubIssreq = Get-ChildItem $tempfolderreq\*.req
certreq -submit -q $SubIssreq | out-file -FilePath c:\temp\filename.txt
 
  ( Get-Content c:\temp\filename.txt )  -replace ':','=' | out-file -FilePath c:\temp\output.txt 

  $finaloutput= get-content c:\temp\output.txt | ConvertFrom-StringData
  Write-Output  $finaloutput.requestid[0]

