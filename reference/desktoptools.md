# USB Drive manipulation
$ mount
```  /dev/sda5 on / type ext4 (rw,errors=remount-ro,user_xattr)    
  /dev/sdb1 on /media/E93D-1723 type vfat (rw,nosuid,nodev,uid=1000,gid=1000,shortname=mixed,dmask=0077,utf8=1,showexec,flush,uhelper=udisks)
```

sudo umount /dev/sdb1
sudo mkfs -t vfat /dev/sdb1
sudo eject /dev/sdb1


# ISO to USB
inputpath=</path/to/iso>
outputpath=</path/to/usb>
hdiutil convert -format UDRW -o inputpath outputpath
diskutil list
