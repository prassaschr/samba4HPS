#!/bin/sh
mkdir /usr/local/Development
mkdir /usr/local/Development/ESB
mkdir /usr/local/Development/sublime3
mv /tmp/eclipse /usr/local/Development/ESB
mv /tmp/sublime_text_3 /usr/local/Development/sublime3
dpkg -i /tmp/google-chrome-stable_current_amd64.deb
dpkg -i /tmp/VidyoDesktopInstaller-ubuntu64.deb
echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" | tee /etc/apt/sources.list.d/webupd8team-java.list
echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list
pip install PyMsgBox