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
fi