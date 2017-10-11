# © 2017 Chris Greencorn

#!/bin/bash

# Remove unwanted packages
# - games, mostly

# Install Debian GIS Blend metapackages
in-target apt-get install -y gis-data gis-devel gis-gps gis-osm gis-remotesensing gis-statistics gis-web gis-workstation && \

# Install ArcheOS software - Can't find a pubkey that works, so doing it the hard way

## From Stable repos
in-target apt-get install -y blender meshlab whitedune invesalius && \ # 3D
	gpsbabel && \ # GPS
	librecad && \ # CAD
	pgadmin3 phpadmin postgresql postgis sqlite3 sqlitebrowser spatialite-bin && \ # DBs
	darktable gimp gimp-lensfun gimp-plugin-registry geeqie imagej inkscape shutter python-lxml && \ # Images
	bluefish icedove iceweasel mutt && \ # Internet
	ffmpeg ncmpcpp mpd audacious beets vlc && \ #Media
	geany libreoffice libreoffice-sdbc-postgresql && \ # Office & Dev
	bundlersfm* cmvspmvs* libvlfeat-utils* micmac* && \ # Photogrammetry/SfM
	texmaker texlive-fonts-extra jabref ipe scribus lyx pandoc && \ # Publishing
	marble marble-plugins r-base && \ # Science/Data Analysis
	fileroller less && \ # Utilities
	
## From Oldstable repos
# libvlfeat0 # ArcheOS Photogrammetry
	
## From Unstable repos
in-target cura && \ # ArcheOS Hardware

## From .deb
in-target dpkg --install tellervo.xx.xx all.deb && \ # Dendrochronology App in ArcheOS
in-target dpkg --install https://download1.rstudio.org/rstudio-xenial-1.1.383-amd64.deb && \ #RStudio
#ppt pptgui # ArcheOS Photogrammetry

## From source
# in-target *cloudcompare* && \ # Point Cloud Comparison, ArcheOS 3D

# Kali Linux
## https://blog.romaingre.net/2014/05/add-kali-repository-on-debian/
## https://www.blackmoreops.com/2013/10/30/add-official-kali-linux-repositories/
in-target apt-get install -y kali-linux-all/kali && \ # From Kali repo

# Install zsh and make default shell 
in-target apt-install zsh && in-target chsh -s /bin/zsh && \


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