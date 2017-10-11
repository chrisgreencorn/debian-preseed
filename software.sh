#!/bin/bash
# Install Debian GIS Blend metapackages
in-target apt-get install -y gis-data gis-devel gis-gps gis-osm gis-remotesensing gis-statistics gis-web gis-workstation && \
# Install ArcheOS software

# Add Kali repos and download metapackage

# Install zsh and make default shell 
apt-install zsh && in-target chsh -s /bin/zsh && \
	