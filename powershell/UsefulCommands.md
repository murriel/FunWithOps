# Install .NET 3.5 on Windows 2012 R2 via command line
_make sure you are at an elevated command prompt_
`DISM /Online /Enable-Feature /FeatureName:NetFx3 /All /LimitAccess /Source:F:\sources\sxs`

# Create Directories.
set var user="username" # enter user here
mkdir \\fileserver\users\$username
mkdir \\fileserver\users\$username\[standard folder]
mkdir \\fileserver\data\users\$username

# change the below to use: Get-ACL or SEt-ACL or Cmd.exe pipe.
icacls \\fileserver\users\$username /grant:r $username:(OI)(CI)(F)
