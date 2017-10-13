# © 2017 Chris Greencorn

#!/bin/bash

# Make sure some basic tools are installed if not already
in-target apt-get install -y curl git vim cmake build-essential ufw rsync debian-goodies bash-completion command-not-found etherwake && \

# Alter apt sources list to include contrib, nonfree, sid (unstable), oldstable, kali

cd /target/etc/apt/ && \
	rm sources.list && \
	in-target wget https://raw.githubusercontent.com/chrisgreencorn/debian-preseed/master/sources.list -0 /etc/apt/sources.list && \

# Now make your Intel wifi card useable
in-target apt-get install firmware-iwlwifi

# Supply pubkeys for apt keyring [Kali mainly]
in-target apt-key **

# Update apt sources, upgrade OS, & update packages
in-target apt-get update && in-target apt-get -y upgrade && in-target apt-get -y dist-upgrade && \ 

# Install sudo and escalate privileges for user 'chris'
in-target apt-get -y install sudo && \
	cd /target/etc/; \
		rm sudoers
		in-target wget https://raw.githubusercontent.com/chrisgreencorn/debian-preseed/master/sudoers -0 /etc/sudoers && \

# Back home
cd /target/ && \

# Configure Git
in-target mkdir ~/Git && \
	in-target git config --global user.name "Chris Greencorn" && \
	in-target git config --global user.emaill "chrisgreencorn@gmail.com" && \

# Execute software suite installation script
cd /target/tmp/ && \
	# Install a pile of software
	wget https://raw.githubusercontent.com/chrisgreencorn/debian-preseed/master/software.sh -0 && \
		/bin/bash software.sh && \
	# Place the appropriate config files
	wget https://raw.githubusercontent.com/chrisgreencorn/debian-preseed/master/config-and-dotfile.sh -0 && \
		/bin/bash config_and_dotfile.sh && \
	#  Supply network preferences - Network Manager or Wicd?
	wget https://raw.githubusercontent.com/chrisgreencorn/debian-preseed/master/network.sh -0 && \
		/bin/bash network.sh


# Bye
cd /target/