 #!/bin/bash

#######################################
# Setting up a default Debian Dev box #
#######################################

# First things first.
# This script contains a list of the default configurations for any standard box.

# Setup sudo
su -
update-alternatives --config editor
  select vi (BECAUSE VI)
usermod -a -G sudo $USERNAME
  # if you don't add the -a to append you will wipe out the user's other groups
restart user session
  (su username or logout)

# Setup SSH

  # on client system:
ssh-keygen -t rsa -b 4096

  # on server
vi /etc/ssh/sshd_config
  PermitRootLogin no

copy key into ~/.ssh/authorized_keys
chmod 700 ~ ~/.ssh
chmod 600 ~/.ssh/authorized_keys

# pen drive or scp
