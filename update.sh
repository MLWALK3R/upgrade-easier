#!/bin/sh
echo -e "\E[33;40m[*]Checking if you're root\e[0m"
if [[ $EUID -ne 0 ]]; then
   echo "\E[33;40mThis script must be run as root\e[0m"
   else echo "You're root great"
echo -e "\E[33;40m[*] Checking Linux Distribution.\e[0m"

if [ -f /etc/debian_version ];  then 
    echo "This is a Debian-Based Operating System"
    DISTRO=DEBIAN;
elif [ -f /etc/redhat-release ]; then
    echo "This is a RedHat-Based Operating System"
    DISTRO=REDHAT;
else 
    echo -e "\E[33;40m no supported distribution found.\e[0m "
exit 0
fi
	sleep 1
	if [ "$DISTRO" = "DEBIAN" ]; then
		echo -e "\E[33;40m[*] Cleaning Up!...\e[0m"
		echo
		apt-get install -f -y;apt-get autoremove -y;apt-get autoclean -y; apt-get clean
		sleep 1
		echo -e "\E[33;40m[*] Updating apt cache.\e[0m"
		apt-get update
		sleep 1
		echo -e "\E[33;40m[*] Upgrading..\e[0m"
		sleep 2
		apt-get upgrade -y
		echo -e "\E[33;40m[*] Distribution Upgrades... \e[0m"
		sleep 1
		echo
		apt-get dist-upgrade -y
		echo
		sleep 2
		echo -e "\E[32;40m[*]All done!\e[0m"
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
