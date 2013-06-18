  #!/bin/bash

	echo -e "\e[1;34m[*] Checking connectivity\e[0m"
	echo
	sleep 2

	# Variables
	TESTHOST="google.com"
	TEST=`ping -c1 $TESTHOST | grep "1 packets transmitted" | cut -d "," -f3`
	PASS=" 0% packet loss"

	if [ "$TEST" = "$PASS" ]; then
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
	else
	    echo -e "\e[1;34m[*] You do not have an Internet connection.\e[0m"
	fi
