
$location = "C:\Program Files\WindowsApps"

#Take Ownsership of Files in WindowsApps
takeown -r -f $location

#Give NTFS security permissons to Local Admin group
$acl = Get-Acl $location
$Ar = New-Object System.Security.AccessControl.FileSystemAccessRule("BUILTIN\Administrators", "FullControl", "ContainerInherit,ObjectInherit", "None", "Allow")
$Acl.SetAccessRule($Ar)
Set-Acl $location $Acl

#Remove All Files
Get-ChildItem -Path $location -Include *.* -File -Recurse | foreach { $_.Delete()}
