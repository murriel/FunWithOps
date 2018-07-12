 #!/bin/bash

#######################################
# Setting up a default Debian Dev box #
# for education and testing           #
#######################################

# First things first.
# This script contains a list of the default configurations for any standard box.

# Setup sudo
su -
echo 'select vi when you update alternatives!'
update-alternatives --config editor

usermod -a -G sudo $USERNAME
# if you don't add the -a to append you will wipe out the user's other groups

# Setup non-free network drivers
  echo 'deb http://httpredair.debian.org/debian/ jessie main contrib non-free' >> /etc/apt/sources.list

# Update the list of available packages and install the firmware-iwlwifi package:
  apt-get update && apt-get install firmware-iwlwifi

# As the iwlwifi module is automatically loaded for supported devices, reinsert this module to access installed firmware:
  modprobe -r iwlwifi ; modprobe iwlwifi

# Setup SSH on client system:
ssh-keygen -t rsa -b 4096
# for github 

# on server
vi /etc/ssh/sshd_config
  PermitRootLogin no

# copy key into ~/.ssh/authorized_keys
chmod 700 ~ ~/.ssh
chmod 600 ~/.ssh/authorized_keys

# Ask about your application installations

echo  'what application would you like to install?'

1.

read selection

apt-get update
apt-get upgrade
apt-get install sudo
apt-get install vim

apt-get install git
apt-get install screen
apt-get install unzip

apt-get install python-pip

# Optional Tools
Terraform # download from hashicorp and unzip executable. copy to /usr/local/bin
AWS Command Line Tools
Docker
Jenkins
