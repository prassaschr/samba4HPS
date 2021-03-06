#!/bin/bash
#
#
####### Download massive user import scripts ###
#mkdir -p /home/smbadmin/CreateUsers
#chgrp -R smbadmin:smbadmin /home/public/CreateUsers
#wget -O /home/smbadmin/CreateUsers/addusers.sh https://raw.githubusercontent.com/prassaschr/samba4HPS/master/scripts/addusers.sh
#wget -O /home/smbadmin/CreateUsers/addusers.csv https://raw.githubusercontent.com/prassaschr/samba4HPS/master/scripts/addusers.csv
#wget -O /home/smbadmin/Desktop/addUsers.desktop https://raw.githubusercontent.com/prassaschr/samba4HPS/master/scripts/addUsers.desktop
#wget -O /home/smbadmin/Desktop/lxterminal.desktop https://raw.githubusercontent.com/prassaschr/samba4HPS/master/scripts/lxterminal.desktop
#chmod +x /home/smbadmin/CreateUsers/addusers.sh
#chmod +x /home/smbadmin/Desktop/addUsers.desktop
#chmod +x /home/smbadmin/Desktop/lxterminal.desktop
#chown smbadmin:smbadmin /home/smbadmin/CreateUsers/addusers.sh
#chown smbadmin:smbadmin /home/smbadmin/CreateUsers/addusers.csv
#chown smbadmin:smbadmin /home/smbadmin/Desktop/addUsers.desktop
#chown smbadmin:smbadmin /home/smbadmin/Desktop/lxterminal.desktop
apt-add-repository -y ppa:teejee2008/ppa
apt-get update
apt-get install timeshift
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
#wget -O /tmp/sshd_config  https://raw.githubusercontent.com/prassaschr/samba4HPS/master/scripts/sshd_config
#mv /etc/ssh/sshd_config /etc/ssh/sshd_config_bck
#mv /tmp/sshd_config /etc/ssh/sshd_config
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
mv /etc/samba/smb.conf /etc/samba/smb.conf.bak #kanei backup to arxiko smb.conf
mv /tmp/smb.conf /etc/samba/smb.conf
mkdir /etc/samba/smb.d # dimiourgei ton fakelo smb.d
wget -O /tmp/a.conf https://raw.githubusercontent.com/prassaschr/samba4HPS/master/samba/a.conf #periexei ta basika - global tou samba
wget -O /tmp/b.conf https://raw.githubusercontent.com/prassaschr/samba4HPS/master/samba/b.conf #paradeigma public share volume
wget -O /tmp/c.conf https://raw.githubusercontent.com/prassaschr/samba4HPS/master/samba/c.conf #paradeigma secret share volume
mv /tmp/a.conf /etc/samba/smb.d/a.conf
mv /tmp/b.conf /etc/samba/smb.d/b.conf
mv /tmp/c.conf /etc/samba/smb.d/c.conf
ls /etc/smb/smb.d/* | sed -e 's/^/include = /' > /etc/smb/includes.conf #dimiourgei to includes.conf pou periexei ola ta config files
#Dimiourgia ton shares, sto paradeigma exoume to share public kai to share secret
mkdir -p /home/public/
mkdir -p /home/secret/
#Dimiourgia ton groups
groupadd groupPublic
groupadd groupSecret
#Orismos ton groups sta shares
chgrp -R groupPublic /home/public/
chgrp -R groupSecret /home/secret/
#Orismos dikaiomaton sta shares
chmod 2770 /home/public/
chmod 2770 /home/secret/
#service smbd restart #samba restart
###########################################
#
#
######### Dimiourgia users ################
#multiple secondary groups with -G 
#primary group with -g 
#Mikro g kai megalo G kanoun tin diafora
# -s Change User Login Shell
# -M without home directory
useradd -M -s /sbin/nologin user1
#This creates the password for the user and suppresses (dahhhh!) output of passwd
echo -ne "user1p\nuser1p\n" | passwd -q "user1" > /dev/null
echo -ne "user1p\nuser1p\n" | smbpasswd -a -s "user1" > /dev/null
smbpasswd -e user1 > /dev/null
usermod -G groupPublic user1
#
useradd -M -s /sbin/nologin user2
#This creates the password for the user and suppresses (dahhhh!) output of passwd
echo -ne "user2p\nuser2p\n" | passwd -q "user2" > /dev/null
echo -ne "user1p\nuser2p\n" | smbpasswd -a -s "user2" > /dev/null
smbpasswd -e user2 > /dev/null
usermod -G groupPublic,groupSecret user2
#############################################   
#
#
####### Clamav initialization #############
mkdir -p /home/smbadmin/virus_quarantine #create virus quarantine
##### block of commands to run before scan in order to have the newest virus database signatures
####
## This should be a root cronjob.
echo -e "$(sudo crontab -u root -l)\n0 0 * * * service clamav-freshclam stop; freshclam --quiet; service clamav-freshclam start; clamscan --recursive=yes --no-summary --infected --move=/home/smbadmin/virus_quarantine 2>/dev/null" | sudo crontab -u root -
