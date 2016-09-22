#!/bin/bash

#######################################
# Setting up a default Debian Dev box #
#######################################

# Setup non-free network drivers
echo 'deb http://httpredir.debian.org/debian/ jessie main contrib non-free' >> /etc/apt/sources.list

# Update the list of available packages and install the firmware-iwlwifi package:
apt-get update && apt-get install firmware-iwlwifi
# As the iwlwifi module is automatically loaded for supported devices, reinsert this module to access installed firmware:
modprobe -r iwlwifi ; modprobe iwlwifi



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

# Tools
Terraform # download from hashicorp and unzip executable. copy to /usr/local/bin
AWS Command Line Tools

# Servers
Docker
Jenkins

USE SERVER installation
