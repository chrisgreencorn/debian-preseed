# © 2017 Chris Greencorn

#!/bin/bash
cd /target/etc/apt/ && \
	rm sources.list && \
	wget https://raw.githubusercontent.com/chrisgreencorn/debian-preseed/master/sources.list && \
		# Adds Contrib, Nonfree, Sid (Unstable), Oldstable, Kali

# Update sources, system, packages
in-target apt-get update && in-target apt-get -y upgrade && in-target apt-get -y dist-upgrade && \ 

# Install sudo and escalate privileges for user 'chris'
in-target apt-get -y install sudo && \
	cd /target/etc/; \
		rm sudoers
		wget https://raw.githubusercontent.com/chrisgreencorn/debian-preseed/master/sudoers && \

# Back home
cd /target/ && \

# Make sure basic tools are installed if not already
in-target apt-get install -y curl git vim cmake build-essential && \

# Execute software suite installation script
cd /target/tmp/ && \
	wget https://raw.githubusercontent.com/chrisgreencorn/debian-preseed/master/software.sh && \
		. software.sh && \
	wget https://raw.githubusercontent.com/chrisgreencorn/debian-preseed/master/config-and-dotfile.sh && \
		. config_and_dotfile.sh && \
	wget https://raw.githubusercontent.com/chrisgreencorn/debian-preseed/master/network.sh && \
		. network.sh