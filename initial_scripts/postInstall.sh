#!/bin/sh
echo "deb http://download.webmin.com/download/repository sarge contrib" | tee -a /etc/apt/sources.list
cd /root
wget http://www.webmin.com/jcameron-key.asc
apt-key add /root/jcameron-key.asc #Download the script to /tmp and all the files to tmp
apt-get update
apt-get upgrade
apt-get install -y rsync ssh openssh-client openssh-server curl libcurl3 libopts25 ntp ntp-doc fail2ban python3-pyinotify python3-systemd whois  attr libaio1 libavahi-client3 libavahi-common-data libavahi-common3 libcups2 libfile-copy-recursive-perl libgpgme11 libldb1 libpython2.7 libtalloc2 libtdb1 libtevent0 libwbclient0 python-crypto python-dnspython python-ldb python-samba python-talloc python-tdb samba samba-common samba-common-bin samba-dsdb-modules samba-libs samba-vfs-modules tdb-tools update-inetd libarchive13 liblzo2-2  libsmbclientpython-samba smbclient zip unzip python-talloc cifs-utils fuse libntfs-3g871 ntfs-3g apt-transport-https webmin
echo "PermitRootLogin yes" | tee -a /etc/ssh/sshd_config