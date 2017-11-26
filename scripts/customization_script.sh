# © 2017 Chris Greencorn

#!/bin/bash

# Make sure some basic tools are installed if not already
apt-get install -y curl git vim cmake build-essential libssl-dev gcc equivsufw rsync debian-goodies bash-completion command-not-found etherwake gnupg wicd wicd-curses

# Alter apt sources list to include contrib, nonfree, sid (unstable), oldstable, kali

cd /etc/apt/ && \
	rm sources.list && \
	wget https://raw.githubusercontent.com/chrisgreencorn/debian-preseed/master/sources.list /etc/apt/sources.list

# Now make your Intel wifi card useable
apt-get install firmware-iwlwifi
cd /etc/wicd/ && rm wireless-settings.conf
wget https://raw.githubusercontent.com/chrisgreencorn/debian-preseed/master/keys/network.gpg 
gpg --decrypt network.gpg --output wireless-settings.conf
cd /

# Update apt sources, upgrade OS, & update packages
apt-get update && apt-get -y upgrade && apt-get -y dist-upgrade && apt-get autoclean

# Install sudo and escalate privileges for user 'chris'
apt-get -y install sudo && \
	cd /etc/ && \
		rm sudoers
		wget https://raw.githubusercontent.com/chrisgreencorn/debian-preseed/master/sudoers /etc/sudoers && \

# Back home
cd /home/users/chris/

# Configure Git
mkdir /home/users/chris/Git && \
	git config --global user.name "Chris Greencorn" && \
	git config --global user.emaill "chrisgreencorn@gmail.com" && \

# Execute software suite installation script
cd /tmp/ && \
	# Install a pile of software
	wget https://raw.githubusercontent.com/chrisgreencorn/debian-preseed/master/software.sh && \
		/bin/bash software.sh && \
	# Place the appropriate config files
	wget https://raw.githubusercontent.com/chrisgreencorn/debian-preseed/master/config-and-dotfile.sh && \
		/bin/bash config_and_dotfile.sh && \
	#  Supply network preferences - Network Manager or Wicd?
	wget https://raw.githubusercontent.com/chrisgreencorn/debian-preseed/master/network.sh && \
		/bin/bash network.sh


# Bye
