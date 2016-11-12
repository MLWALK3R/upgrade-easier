#!/bin/sh
echo -e "\E[33;40m[*] Checking if you're root\e[0m"
if [[ $EUID -ne 0 ]]; then
	echo -e "\E[33;40m[*] This script must be run as root\e[0m"
	exit 0
else
	echo "You're root great"
	echo -e "\E[33;40m[*] Checking Linux Distribution.\e[0m"
fi

if [ -f /etc/debian_version ];  then 
	echo "This is a Debian-Based Operating System"
	DISTRO=DEBIAN;
elif [ -f /etc/redhat-release ]; then
	echo "This is a RedHat-Based Operating System"
	DISTRO=REDHAT;
elif [ -f /etc/arch-release ]; then
	echo "This is a Arch-Based Operating System"
	DISTRO=ARCH;
elif [ -f /etc/manjaro-release ]; then
	echo "This is Manjaro Operating System"
	DISTRO=MJ;
else 
	echo -e "\E[33;40m No supported distribution found.\e[0m "
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
	exit 0
elif [ "$DISTRO" = "ARCH" -o "$DISTRO" = "MJ" ]; then
	echo -e "\E[33;40m[*] Cleaning up...\e[0m"
	echo
	pacman -Scc --noconfirm
	sleep 1
	echo -e "\E[33;40m[*] Upgrading...\e[0m"
	sleep 2
	pacman -Syu --noconfirm
	exit 0
fi
	
echo -e "\E[32;40m[*] All done!\e[0m"
