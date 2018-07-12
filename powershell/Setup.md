# Getting Started
Quick reference guide for setting up PowerShell locally.

# Setup PowerShell ISE
Enable-PSRemoting

On the remote Powershell console, enable remote desktop and firewall using the following cmdlets:
1) Enable Remote Desktop
set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server'-name "fDenyTSConnections" -Value 0

2) Allow incoming RDP on firewall
Enable-NetFirewallRule -DisplayGroup "Remote Desktop"

3) Enable secure RDP authentication
set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp' -name "UserAuthentication" -Value 1   

# References
http://networkerslog.blogspot.com/2013/09/how-to-enable-remote-desktop-remotely.html
