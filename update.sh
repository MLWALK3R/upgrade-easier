	echo -e "\e[1;34m[*] Going to update the system! \e[0m"
	sleep 1
	echo
	sleep 1
	echo -e "\e[1;34m[*] Updating the cache.\e[0m"
	echo
	apt-get update
	sleep 1
	echo -e "\e[1;34m[*] Cleaning Up!...\e[0m"
	apt-get install -f -y
	sleep 1
	apt-get autoremove -y
	sleep 1
	apt-get autoclean -y
	sleep 1
	echo -e "\e[1;34m[*] Upgrading...\e[0m"
	sleep 2
	apt-get upgrade -y
	echo -e "\e[1;34m[*] Distribution Upgrades.. This may take a while. \e[0m"
	sleep 1
	echo
	apt-get dist-upgrade -y
	echo
	sleep 2
	echo -e "\e[1;34m[*]All done.\e[0m"
	exit 0
