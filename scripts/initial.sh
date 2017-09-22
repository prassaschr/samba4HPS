#!/bin/bash
#
#
####### Download massive user import scripts ###
wget -O /home/smbadmin/addusers.sh https://raw.githubusercontent.com/prassaschr/samba4HPS/master/scripts/addusers.sh
wget -O /home/smbadmin/addusers.csv https://raw.githubusercontent.com/prassaschr/samba4HPS/master/scripts/addusers.csv
chmod +x /home/smbadmin/addusers.sh
chown smbadmin:smbadmin /home/smbadmin/addusers.sh
chown smbadmin:smbadmin /home/smbadmin/addusers.csv
################################################
#
#
####### Download backup script #################
wget -O /home/smbadmin/backup_script.sh https://raw.githubusercontent.com/prassaschr/samba4HPS/master/scripts/backup_script.sh
chown smbadmin:smbadmin /home/smbadmin/backup_script.sh
###############################################
#
#
####### Enable SSH root login ##################
wget -O /tmp/sshd_config  https://raw.githubusercontent.com/prassaschr/samba4HPS/master/scripts/sshd_config
mv /etc/ssh/sshd_config /etc/ssh/sshd_config_bck
mv /tmp/sshd_config /etc/ssh/sshd_config
################################################
#
#
###### Webmin and usermin installation #########
wget -O /tmp/webmin_1.850_all.deb https://sourceforge.net/projects/webadmin/files/webmin/1.850/webmin_1.850_all.deb
wget -O /tmp/usermin_1.720_all.deb https://sourceforge.net/projects/webadmin/files/usermin/1.720/usermin_1.720_all.deb
dpkg -i /tmp/webmin_1.850_all.deb
dpkg -i /tmp/usermin_1.720_all.deb
###############################################
#
#
####### SSH Server Keys regenaration ##########
#Regenerate new SSH Server keys
#rm -v /etc/ssh/ssh_host_*
#dpkg-reconfigure openssh-server
#/etc/init.d/ssh restart
###############################################
#
#
####### Samba server initialization ###########
wget -O /tmp/smb.conf  https://raw.githubusercontent.com/prassaschr/samba4HPS/master/samba/smb.conf #periexei mono to include = /etc/samba/includes.conf
mv /etc/samba/smb.conf /etc/samba/smb.conf.bak #kanei bakup to arxiko smb.conf
mv /tmp/smb.conf /etc/samba/smb.conf
mkdir /etc/samba/smb.d # dimiourgei ton fakelo smb.d
wget -O /tmp/a.conf https://raw.githubusercontent.com/prassaschr/samba4HPS/master/samba/a.conf #periexei ta basika - global tou samba
wget -O /tmp/b.conf https://raw.githubusercontent.com/prassaschr/samba4HPS/master/samba/b.conf #paradeigma public share volume
wget -O /tmp/c.conf https://raw.githubusercontent.com/prassaschr/samba4HPS/master/samba/c.conf #paradeigma secret share volume
mv /tmp/a.conf /etc/samba/smb.d/a.conf
mv /tmp/b.conf /etc/samba/smb.d/b.conf
mv /tmp/c.conf /etc/samba/smb.d/c.conf
ls /etc/smb/smb.d/* | sed -e 's/^/include = /' > /etc/smb/includes.conf #dimiourgei to includes.conf pou periexei ola ta config files
service smbd restart #samba restart
###########################################
#
#
