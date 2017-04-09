# /bin/bash

# This is a script for updating Digital Ocean Ubuntu servers. You may need to reboot after running this.

finished_correctly()
{
    if [ 0 -ne $? ]
    then
        echo "Error running $1"
        exit $2
    fi
}

# Install all of the meta data for apt-get
sudo apt-get update
finished_correctly "apt-get update" 1

# Install all of the normal updates
sudo apt-get upgrade -y
finished_correctly "apt-get upgrade" 2

# Install all of the critical security updates and clean up not needed updates
sudo apt-get dist-upgrade -y
finished_correctly "apt-get dist-upgrade" 3

echo "update completed, please reboot"
