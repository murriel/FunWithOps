To-Do: Add TOC here
# System Administration Utilities

# systems monitoring

# searching and finding

find /home/directory -type f -name filename.txt

# folder comparisons
diff -rq folder1 folder2

# Operating System Version
lsb_release -a

# Redirect STDOUT to Screen and append to file
echo ""2>&1 | tee file.name
echo 'text to append' >> file2

# Getting around the shell
Re-run a command from history

!n 	(command # "n")

# SSH and scp
ssh-keygen -lf .ssh/somekey.pub
scp -i <keyfile> sourcefile user@host:/path/to/dest
<!-- add stuff on ssh agent forwarding here -->
ssh-add
ssh -A

# Size Issues

## Temp partition too small
dd if=/dev   of=/ussr/temp-disk # get teh final command for this?
umount /tmp
mount -t ext3 -o rw,noexec,nosuid,loop /usr/temp-disk /tmp
chmod 1777 /tmp
mount

# when var is too small and you need to reclaim space
sudo apt-get clean

# todo
lsof
fuser
strace
