import-module ActiveDirectory

##### Get List of Servers - Full Details
#Get-ADComputer  -Filter {OperatingSystem -Like "Windows *Server*"}  -Property * -SearchBase "CN=Computers, DC=mydomain, DC=local" |

##### Get List of Servers - Summary View
# Get-ADComputer  -Filter {OperatingSystem -Like "Windows *Server*"} -Property * -SearchBase "DC=mydomain, DC=local" |Format-Table CanonicalName, Name, Created, IPv4Address, OperatingSystem,  # OperatingSystemServicePack, OperatingSystemVersion -Wrap -Auto

##### Export List of Servers to CSV
Get-ADComputer -Filter {OperatingSystem -Like "Windows *Server*"} -Property * -SearchBase "DC=mydomain, DC=local" |Select-Object Name, CanonicalName, Created, IPv4Address, OperatingSystem, OperatingSystemServicePack, OperatingSystemVersion | Export-CSV C:\WindowsServers.csv -NoTypeInformation -Encoding UTF8

##### Get List of Desktops - Summary View
Get-ADComputer -Filter * -Property * -SearchBase "OU=Windows 7 Desktops, OU=MyOU, DC=mydomain, DC=local" | Sort-Object Name |Format-Table CanonicalName, Name, Created, IPv4Address, OperatingSystem  # OperatingSystemServicePack, OperatingSystemVersion -Wrap -Auto

##### Get List of Desktops - Summary View, OS Details
Get-ADComputer -Filter * -Property * -SearchBase "OU=Windows 7 Desktops, OU=MyOU, DC=mydomain, DC=local" | Sort-Object Name |Format-Table CanonicalName, Name, IPv4Address, OperatingSystemVersion, OperatingSystem, Created  # OperatingSystemServicePack, OperatingSystemVersion -Wrap -Auto





################################################

#### Get Profile Names
# We need to load ActiveDirectory module first
import-module activedirectory


Get-ChildItem -Filter "(&(objectclass=user)(objectcategory=user)(homeDirectory=*))" `
-Path AD:\"OU=MyOU Users, OU=MyOU,DC=mydomain,DC=local" -Recurse |
foreach {
# I'm taking second element after Split. This is an OU user account sits in.
$OU = ($_.DistinguishedName -split ',')[1]
# Let's take a user an put him into an object
$user = [adsi]"LDAP://$($_.DistinguishedName)"
# Let's pipe the object into select and display only properties we need
$user | select @{N="User Name"; E={$_.name}},
@{N="Account Name"; E={$_.sAMAccountName}},
@{N="Profile Path"; E={$_.profilePath}},
@{N="HomeDirectory"; E={$_.homeDirectory}},
@{N="ScriptPath"; E={$_.scriptPath}},
@{N="OU"; E={$OU}}
} | Format-Table -Autosize

Write-Host "Press any key to continue ..."

$x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
