#!/bin/bash
# A very simple script to set up Samba.  Run as root.

# Disable SELinux
setenforce 0

# Install samba and caja properties
yum install caja-share samba system-config-samba samba-client -y

# Enable the service
systemctl nmb enable
systemctl smb enable

# Start the service
service nmb start
service smb start

# Prompt user
echo 'Please edit /etc/samba/smb.conf to set up sharing to other machines.  Edit /etc/fstab to access shares on other machines.'
