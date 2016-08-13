#!/bin/bash 

# Just a little jenkins install party script

# add repo keys
wget -q -O - http://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
echo 'jenkins keys downloaded'

# update your SOURCES
sudo echo 'deb http://pkg.jenkins.io/debian-stable binary/' | sudo tee -a /etc/apt/sources.list && echo 'updated apt sources, hooray!'

# installfest 
sudo apt-get update && sudo apt-get install -y jenkins && echo 'jenkins installed!'

echo ' '
echo 'thank you and have a nice day!'

# ref: Jenkins site, http://pkg.jenkins-ci.org/debian-stable/
# <36D6770
