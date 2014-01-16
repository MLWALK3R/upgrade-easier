#!/bin/sh
echo -e "\E[33;40m[*]Checking if you're root\e[0m"
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root"

   else echo "You're root great"

echo -e "\E[33;40m[*] Checking Linux Distribution.\e[0m"

if [ -f /etc/debian_version ];  then 
    echo "This is a Debian-Based Operating System"
    DISTRO=DEBIAN;
elif [ -f /etc/redhat-release ]; then
    echo "This is a RedHat-Based Operating System"
    DISTRO=REDHAT;
else 
    echo -e "\E[33;40m no supported distribution found running\e[0m "
exit 0
fi
echo -e "\E[33;40m[*] Checking connectivity\e[0m"
echo
sleep 2
# Variables
TESTHOST="google.com"
TEST=`ping -c1 $TESTHOST | grep "1 packets transmitted" | cut -d "," -f3`
PASS=" 0% packet loss"
if [ "$TEST" = "$PASS" ]; then
	echo -e "\E[32;40m[*] Congratz bro! t3h Interntz is working.\e[0m"
	sleep 3
	echo
	sleep 1
	if [ "$DISTRO" = "DEBIAN" ]; then
		echo -e "\E[33;40m[*] Updating the cache.\e[0m"
		echo
		apt-get update
		sleep 1
		echo -e "\E[33;40m[*] Cleaning Up!...\e[0m"
		apt-get install -f -y
		sleep 1
		apt-get autoremove -y
		sleep 1
		apt-get autoclean -y
		sleep 1
		echo -e "\E[33;40m[*] Upgrading...\e[0m"
		sleep 2
		apt-get upgrade -y
		echo -e "\E[33;40m[*] Distribution Upgrades.. This may take a while. \e[0m"
		sleep 1
		echo
		apt-get dist-upgrade -y
		echo
		sleep 2
		echo -e "\E[32;40m[*]All done.\e[0m"
		exit 0
	elif [ "$DISTRO" = "REDHAT" ]; then
		echo -e "\E[33;40m[*] Updating the cache.\e[0m"
		echo
		yum clean metadata
		yum clean headers
		yum clean packages
		sleep 1
		echo -e "\E[33;40m[*] Upgrading...\e[0m"
		sleep 2
		yum upgrade --skip-broken -y
		echo -e "\E[32;40m[*]All done.\e[0m"
		exit 0
		fi
	fi
fi
