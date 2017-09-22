#!/bin/bash
wget -O /tmp/webmin_1.850_all.deb https://sourceforge.net/projects/webadmin/files/webmin/1.850/webmin_1.850_all.deb
wget -O /tmp/usermin_1.720_all.deb https://sourceforge.net/projects/webadmin/files/usermin/1.720/usermin_1.720_all.deb
wget -O /tmp/sshd_config  https://raw.githubusercontent.com/prassaschr/samba4HPS/master/scripts/sshd_config
wget -O /tmp/smb.conf  https://raw.githubusercontent.com/prassaschr/samba4HPS/master/samba/smb.conf
mv /etc/samba/smb.conf /etc/samba/smb.conf.bck
mv /etc/ssh/sshd_config /etc/ssh/sshd_config_bck
mv /tmp/sshd_config /etc/ssh/sshd_config
mv /tmp/smb.conf /etc/samba/smb.conf
dpkg -i /tmp/webmin_1.850_all.deb
dpkg -i /tmp/usermin_1.720_all.deb
#Regenerate new SSH Server keys
#rm -v /etc/ssh/ssh_host_*
#dpkg-reconfigure openssh-server
#/etc/init.d/ssh restart