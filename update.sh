
	echo -e "\e[1;34m[*] Checking connectivity\e[0m"
	echo
	sleep 2
    netstat -rn | grep '^default' && echo connection is up || echo connection is down
	echo -e "\e[1;34m[*] Congratz bro! t3h Interntz is working.\e[0m"
	sleep 3
	echo
	echo -e "\e[1;34m[*] Updating the cache.\e[0m"
	echo
	apt-get update
	sleep 1
	echo -e "\e[1;34m[*] Upgrading...\e[0m"
	sleep 2
	apt-get upgrade -y
	echo -e " Distribution Upgrades.. This may take a while."
	sleep 1
	echo
	apt-get dist-upgrade -y
	echo
	sleep 2
	echo -e "\e[1;34m[*]All done.\e[0m"
	fi
