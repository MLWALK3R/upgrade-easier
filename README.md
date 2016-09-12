Updating made easier
===================
Designed for updating linux servers with minimal effort.


Debian Based OSes
* apt-get update
* apt-get upgrade -y
* apt-get dist-upgrade -y

RHEL Based OSes 
* yum upgrade -y 

Usage
===========
**Prefered method** (Without downloading)

```bash
curl -s https://raw.githubusercontent.com/MLWALK3R/upgrade-easier/master/update.sh | bash
```

**Curl** verison
```bash
curl -o update.sh  https://raw.githubusercontent.com/MLWALK3R/upgrade-easier/master/update.sh && chmod +x update.sh && ./update.sh
```

**Wget** Version
```bash
wget https://raw.githubusercontent.com/MLWALK3R/upgrade-easier/master/update.sh && chmod +x update.sh && ./update.sh
```

