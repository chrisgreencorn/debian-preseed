# © 2017 Chris Greencorn

#!/bin/bash

# Remove unwanted packages
# - games, mostly

# Install Languages
#ruby, rbenv, python3, php5, perl, java, js, 

# Install from Debian Pure Blend metapackages, and secondarily individual packages included in metapackages, which you're prob not going to install wholly
## GIS
in-target apt-get install -y \
	gis-data gis-devel gis-gps gis-osm gis-remotesensing gis-statistics gis-web gis-workstation
## Multimedia	
in-target apt-get install -y \ 
	Gstreamer1.0-plugins-good ffmpeg # just a few codecs - check out rest of blend
## Science
in-target apt-get install -y \
	r-base numpy scipy matplotlib glue emacs ess
## Ham
## Edu
### Music - redundant with Multimedia^? some of these prob aren't in the blend
in-target apt-get install -y \
	ncmpcpp mpd audacious audacity beets vlc lilypond denemo musescore score-reading-trainer fluidsynth qsynth freebirth glick hydrogen solfege sonic-pi
### Development
### Astro
in-target apt-get install -y \
	gpredict stellarium xtide xtide-data
### Electrical
in-target apt-get install -y \
	oregano xoscope electric pcb xcircuit 
### Development
in-target apt-get install -y \
	arduino autoconf python3 python3-qyqt5 
### Video - redundant with Multimedia^?	
in-target apt-get install -y \
	stopmotion pitivi vgrabbj openshot
	

# Replicate ArcheOS metapackages - Lists in Github repo (minus GIS: pure blend solves this)
	
## From (stable) repos
in-target apt-get install -y blender meshlab whitedune invesalius \ # 3D
	gpsbabel \ # GPS
	librecad freecad \ # CAD
	pgadmin3 phpadmin postgresql postgis sqlite3 sqlitebrowser spatialite-bin \ # DBs
	darktable gimp gimp-lensfun gimp-plugin-registry geeqie imagej inkscape shutter python-lxml hugin libimage-exiftool-perl \ # Images
	bluefish icedove iceweasel mutt procmail \ # Internet
	geany libreoffice libreoffice-sdbc-postgresql \ # Office & Dev
	micmac* \ # Photogrammetry/SfM
	texmaker texlive-fonts-extra jabref ipe scribus lyx pandoc \ # Publishing
	marble marble-plugins \ # Science
	fileroller less \ # Utilities
	
	
## From (oldstable) repos
# in-target apt-get install -t oldrelease libvlfeat0 # ArcheOS Photogrammetry ??
	
## From (unstable) repos
in-target apt-get install cura/unstable && \ # ArcheOS Hardware

## From .deb
in-target dpkg --install tellervo.xx.xx all.deb && \ # Dendrochronology App in ArcheOS
in-target dpkg --install https://download1.rstudio.org/rstudio-xenial-1.1.383-amd64.deb && \ #RStudio

## From source
# in-target *cloudcompare* && \ # Point Cloud Comparison, ArcheOS 3D
### Python Photogrammetry Toolbox (Details on how to extract so that everything is in $PATH seen in Github dir [https://github.com/archeos/ppt-gui/tree/master/ppt-gui-package/])
cd /target/tmp/ && \
	in-target wget http://www.museidironzone.it/archeos/ppt-gui/osm-bundler_64bit.tar.gz /tmp/ppt-gui.tar.gz && \
	in-target tar -xzf ppt-gui.tar.gz && \
	# Move files
### R/SPlus Python Interface
in-target # http://www.omegahat.net/RSPython/

# From Git
in-target mkdir ~/Git && cd ~/Git && \
	# BundlerSFM
	in-target git clone https://github.com/snavely/bundler_sfm.git && \
	# CMVS-PMVS
	in-target git clone https://github.com/pmoulon/CMVS-PMVS.git && \
	# (Lib)VLFeat
	in-target git clone https://github.com/vlfeat/vlfeat.git && \
	# SfM Toolkit
	# in-target git clone https://github.com/dddExperiments/SFMToolkit.git ** DEPENDENCIES ** 
	

# Kali Linux
## https://blog.romaingre.net/2014/05/add-kali-repository-on-debian/
## https://www.blackmoreops.com/2013/10/30/add-official-kali-linux-repositories/
in-target apt-get install -y -t kali kali-linux-all && \ # From Kali repo

# Some more to add
# 	gramps
# 	[jsesh or openglyph]
# 	r/splus python interface
# 	gutenbrowser
# 	keepnote
# caelinux
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