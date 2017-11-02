$NewServer = Read-Host "What is your server"
$NewServerDisk = $NewServer + "_disk0.vhd"

New-VM -NoVHD -MemoryStartupBytes 4294967296 -Name $NewServer -path "D:\Hyper-V"   -Verbose

New-VHD -Path "D:\hyper-v\$NewServer\Virtual Hard Disks\$NewServerDisk" -SizeBytes 80GB -Dynamic
Add-VMHardDiskDrive -VMName $NewServer -Path "D:\hyper-v\$NewServer\Virtual Hard Disks\$NewServerDisk"

Add-VMDvdDrive -VMName $NewServer -Path D:\ISOs\WindowsServer2008R2.ISO
Set-VMNetworkAdapter -VMName $NewServer -Name "Public"

Start-VM -Name $NewServer
