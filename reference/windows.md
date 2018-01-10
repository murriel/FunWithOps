This document contains a list of useful systems administration and troubleshooting tasks.

[__TOC__]

# Server Config
## Time
w32tm /query /status

## Server info
winver
systeminfo

## Networking

### DNS
nslookup
  enter server IP address or domain name
  set q = MX (type)

### Permissions
icacls \\fileserver\$username /grant:r $username:(OI)(CI)(F)


# Software

## Install .NET 3.5 on Windows 2012 R2 via command line
_make sure you are at an elevated command prompt_
`DISM /Online /Enable-Feature /FeatureName:NetFx3 /All /LimitAccess /Source:F:\sources\sxs`
