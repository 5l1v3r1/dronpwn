#!/bin/bash

# Copyright (C) 2016 - 2018 Entynetproject
#
# Licensed under the Apache License, Version 2.0 (the "License"); you may not
# use the software except in compliance with the License.
#
# You may obtain a copy of the License at:
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
# License for the specific language governing permissions and limitations under
# the License.
#
# Disclaimer:
# Usage of the dronpwn for attacking targets without prior mutual consent 
# is illegal. It is the end user's responsibility to obey all applicable local, 
# state, federal, and international laws. Developers assume no liability and 
# are not responsible for any misuse or damage caused by this program.

RS="\033[1;31m"
YS="\033[1;33m"
CE="\033[0m"

#blue start 
	BS="\033[1;34m"
#color end
	CE="\033[0m"
#red start
	RS="\033[31m"
#green start
	GNS="-e \033[1;32m"
#white start
   WHS="\033[0;97m"

if [[ $EUID -ne 0 ]]
then
   sleep 1
   echo -e ""$RS"[-] "$WHS"This script must be run as root!"$CE"" 1>&2
   sleep 1
   exit
fi

if [[ -d ~/dronpwn ]]
then
sleep 0
else
cd ~
{
git clone https://github.com/entynetproject/dronpwn.git
} &> /dev/null
fi
sleep 0.5
clear
sleep 0.5
cd ~/dronpwn

if [[ -f /etc/dronpwn.conf ]]
then

CONF="$( cat /etc/dronpwn.conf )"
sleep 1

if [[ "$CONF" = "arm" ]]
then
if [[ -d /System/Library/CoreServices/SpringBoard.app ]]
then
else 
echo -e ""$BS"[*]"$WHS" Installing dependencies..."$CE""
pkg update
pkg -y install perl
pkg -y install dhclient
pkg -y install iwconfig
pkg -y install airmon-ng
pkg -y install aireplay-ng
pkg -y install aircrack-ng
pkg -y install airodump-ng
pkg -y install nodejs
fi
fi

if [[ "$CONF" = "amd" ]]
then
if [[ -d /System/Library/CoreServices/Finder.app ]]
then
echo -e ""$BS"[*]"$WHS" Installing dependencies..."$CE""
else 
echo -e ""$BS"[*]"$WHS" Installing dependencies..."$CE""
apt-get update
apt-get -y install perl
apt-get -y install dhclient
apt-get -y install iwconfig
apt-get -y install airmon-ng
apt-get -y install aireplay-ng
apt-get -y install aircrack-ng
apt-get -y install airodump-ng
apt-get -y install nodejs
fi
fi

if [[ "$CONF" = "intel" ]]
then
if [[ -d /System/Library/CoreServices/Finder.app ]]
then
echo -e ""$BS"[*]"$WHS" Installing dependencies..."$CE""
else 
echo -e ""$BS"[*]"$WHS" Installing dependencies..."$CE""
apt-get update
apt-get -y install perl
apt-get -y install dhclient
apt-get -y install iwconfig
apt-get -y install airmon-ng
apt-get -y install aireplay-ng
apt-get -y install aircrack-ng
apt-get -y install airodump-ng
apt-get -y install nodejs
fi
fi

else
read -e -p $'Select your architecture (amd/intel/arm): \033[0m' CONF
if [[ "$CONF" = "" ]]
then
exit
else
if [[ "$CONF" = "arm" ]]
then
read -e -p $'Is this a single board computer (yes/no): \033[0m' PI
if [[ "$PI" = "yes" ]]
then
echo "amd" >> /etc/dronpwn.conf
CONF="amd"
else
echo "$CONF" >> /etc/dronpwn.conf
fi
else
echo "$CONF" >> /etc/dronpwn.conf
fi
fi
sleep 1

if [[ "$CONF" = "arm" ]]
then
if [[ -d /System/Library/CoreServices/SpringBoard.app ]]
then
else 
echo -e ""$BS"[*]"$WHS" Installing dependencies..."$CE""
pkg update
pkg -y install perl
pkg -y install dhclient
pkg -y install iwconfig
pkg -y install airmon-ng
pkg -y install aireplay-ng
pkg -y install aircrack-ng
pkg -y install airodump-ng
pkg -y install nodejs
fi
fi

if [[ "$CONF" = "amd" ]]
then
if [[ -d /System/Library/CoreServices/Finder.app ]]
then
echo -e ""$BS"[*]"$WHS" Installing dependencies..."$CE""
else 
echo -e ""$BS"[*]"$WHS" Installing dependencies..."$CE""
apt-get update
apt-get -y install perl
apt-get -y install dhclient
apt-get -y install iwconfig
apt-get -y install airmon-ng
apt-get -y install aireplay-ng
apt-get -y install aircrack-ng
apt-get -y install airodump-ng
apt-get -y install nodejs
fi
fi

if [[ "$CONF" = "intel" ]]
then
if [[ -d /System/Library/CoreServices/Finder.app ]]
then
echo -e ""$BS"[*]"$WHS" Installing dependencies..."$CE""
else 
echo -e ""$BS"[*]"$WHS" Installing dependencies..."$CE""
apt-get update
apt-get -y install perl
apt-get -y install dhclient
apt-get -y install iwconfig
apt-get -y install airmon-ng
apt-get -y install aireplay-ng
apt-get -y install aircrack-ng
apt-get -y install airodump-ng
apt-get -y install nodejs
fi
fi
fi

{
pip3 install -r requirements.txt
} &> /dev/null

{
cd ~/dronpwn/bin
cp dronpwn /usr/local/bin
chmod +x /usr/local/bin/dronpwn
cp dronpwn /bin
chmod +x /bin/dronpwn
cp dronpwn /data/data/com.termux/files/usr/bin
chmod +x /data/data/com.termux/files/usr/bin/dronpwn
} &> /dev/null
