Updating made easier
===================
Designed for updating linux servers with minimal effort.


Debian Based OSes
* apt-get update
* apt-get upgrade -y
* apt-get dist-upgrade -y

RHEL Based OSes 
* yum upgrade -y 

ARCH Based OSes 
* pacman -Scc --noconfirm
* pacman -Syu --noconfirm

Usage
===========
**Preferred method**

```bash
curl -s https://raw.githubusercontent.com/MLWALK3R/upgrade-easier/master/update.sh | bash
```

**Curl** Version
```bash
curl -o update.sh  https://raw.githubusercontent.com/MLWALK3R/upgrade-easier/master/update.sh && chmod +x update.sh && ./update.sh
```

**Wget** Version
```bash
wget https://raw.githubusercontent.com/MLWALK3R/upgrade-easier/master/update.sh && chmod +x update.sh && ./update.sh
```

