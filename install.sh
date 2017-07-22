#!/bin/bash

# Init
supported=" - Ubuntu 14.04 and 16.04 LTS on i386 and amd64"

# Make sure only root can run our script
if [[ $EUID -ne 0 ]]; then
   echo "Execute: sudo /bin/sh install.sh" 1>&2
   exit 1
fi

yesno () {
	while read line; do
		case $line in
			y|Y|Yes|YES|yes|yES|yEs|YeS|yeS) return 0
			;;
			n|N|No|NO|no|nO) return 1
			;;
			*)
			printf "\nPlease enter y or n: "
			;;
		esac
	done
}

# Welcome Message
cat <<EOF

Welcome to the Anonymous Proxy Squid installer

 WARNING:

 The installation is quite stable and functional when run on a freshly
 installed supported Operating System.

 The systems currently supported by install.sh are:
EOF
echo "$supported"
cat <<EOF

 If your OS is not listed above, this script will fail.

EOF

printf " Continue? (y/n) "
if ! yesno; then
    exit 1
fi

# Operating System Update
apt-get update
apt-get upgrade -y
apt-get -f install -y

# Install Packages
apt-get install apache2-utils squid -y

# Go to the Squid main folder
cd /etc/squid/

# Download file from GitHub
mv -i squid.conf squid.conf.bak
wget https://raw.githubusercontent.com/zoilomora/squid/master/squid.conf

# Create cache file
mkdir list
touch list/not-to-cache.conf

# Create password file
touch passwd
chmod o+r passwd

# Create user
printf "New user: "
read line
if [ "$line" != "" ]
then
    htpasswd /etc/squid/passwd "$line"
fi

# Restart service
/etc/init.d/squid restart

exit 0