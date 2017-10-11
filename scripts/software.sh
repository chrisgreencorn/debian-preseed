# © 2017 Chris Greencorn

#!/bin/bash

# Remove unwanted packages
# - games, mostly

# Install Debian GIS Blend metapackages
in-target apt-get install -y gis-data gis-devel gis-gps gis-osm gis-remotesensing gis-statistics gis-web gis-workstation && \

# Install ArcheOS software - Can't find a pubkey that works, so doing it the hard way

## From (stable) repos
in-target apt-get install -y blender meshlab whitedune invesalius && \ # 3D
	gpsbabel && \ # GPS
	librecad && \ # CAD
	pgadmin3 phpadmin postgresql postgis sqlite3 sqlitebrowser spatialite-bin && \ # DBs
	darktable gimp gimp-lensfun gimp-plugin-registry geeqie imagej inkscape shutter python-lxml && \ # Images
	bluefish icedove iceweasel mutt && \ # Internet
	ffmpeg ncmpcpp mpd audacious beets vlc && \ #Media
	geany libreoffice libreoffice-sdbc-postgresql && \ # Office & Dev
	micmac* && \ # Photogrammetry/SfM
	texmaker texlive-fonts-extra jabref ipe scribus lyx pandoc && \ # Publishing
	marble marble-plugins r-base && \ # Science/Data Analysis
	fileroller less && \ # Utilities
	
## From (oldstable) repos
# in-target apt-get install -t oldrelease libvlfeat0 # ArcheOS Photogrammetry ??
	
## From (unstable) repos
in-target apt-get install -t unstable cura && \ # ArcheOS Hardware

## From .deb
in-target dpkg --install tellervo.xx.xx all.deb && \ # Dendrochronology App in ArcheOS
in-target dpkg --install https://download1.rstudio.org/rstudio-xenial-1.1.383-amd64.deb && \ #RStudio
#ppt pptgui # ArcheOS Photogrammetry

## From source
# in-target *cloudcompare* && \ # Point Cloud Comparison, ArcheOS 3D
### Python Photogrammetry Toolbox (Details on how to extract so that everything is in $PATH seen in Github dir [https://github.com/archeos/ppt-gui/tree/master/ppt-gui-package/])
cd /target/tmp/ && \
	in-target wget http://www.museidironzone.it/archeos/ppt-gui/osm-bundler_64bit.tar.gz /tmp/ppt-gui.tar.gz && \
	in-target tar -xzf ppt-gui.tar.gz
	# Move files

# From Git
in-target mkdir ~/Git && cd ~/Git && \
	# BundlerSFM
	in-target git clone https://github.com/snavely/bundler_sfm.git
	# CMVS-PMVS
	in-target git clone https://github.com/pmoulon/CMVS-PMVS.git
	# (Lib)VLFeat
	in-target git clone https://github.com/vlfeat/vlfeat.git
	# SfM Toolkit
	# in-target git clone https://github.com/dddExperiments/SFMToolkit.git ** DEPENDENCIES ** 
	

# Kali Linux
## https://blog.romaingre.net/2014/05/add-kali-repository-on-debian/
## https://www.blackmoreops.com/2013/10/30/add-official-kali-linux-repositories/
in-target apt-get install -y kali-linux-all/kali && \ # From Kali repo

# Some more to add
# 	gramps
# 	[jsesh or openglyph]
# 	numpy
# 	scipy
# 	matplotlib
# 	r/splus python interface
# 	gutenbrowser
# 	keepnote
# 	ufw
# 	[biolinux?]
# 	[CAElinux?]
# 	gnuplot
# 	gnucash
# 	frysk
# 	maxima
# 	mayavi
# 	mercurial
# 	subversion
# 	emacs
# 	ess
# 	jags