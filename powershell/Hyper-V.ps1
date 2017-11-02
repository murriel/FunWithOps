﻿# Get-VM -ComputerName DEV01
# New-VM -ComputerName DEV01 -Name DEV02 -Path C:\\hyperv -MemoryStartupBytes 2048MB
# New-VHD -ComputerName DEV01 -Path "C:\\hyperv\DEV02\Virtual Hard Disks\DEV02_disk0.vhd" -SizeBytes 20GB -Dynamic
# Add-VMHardDiskDrive -ComputerName DEV01 -VMName DEV02 -Path "C:\\hyperv\DEV02\Virtual Hard Disks\DEV02_disk0.vhd"
# Set-VMDvdDrive -ComputerName DEV01 -VMName DEV02 -ControllerNumber 1 -path C:\\ubuntu-14.04.2-server-amd64.iso

# MASTER Creation Document
# Define variable for new name
# READ variable <servername>
# example servername DEV01

cd D:\Hyper-V
MKDIR <servername>\Virtual Hard Disks # will create children automatically
COPY !Templates\_disk0.vhd <servername>


# Move VMs
Move-VM -Name ts-pri -DestinationHost SERVERNAME -DestinationStoragePath "D:\Hyper-V\ts-pri\Virtual Hard Disks"


# Notes
# Cannot move VM from another system if Kerberos Constrained Delegation is not set up. Must be logged in to the host system.
# If you are on core you can do this too but must use command line.
# VM must be off
# Network names must match OR you will have to take the following corrective action:
# Turn off network
# Rename networks AND reboot host VM. If no reboot it will maintain the old VM.
