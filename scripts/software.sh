# © 2017 Chris Greencorn

#!/bin/bash

# Remove unwanted packages
# - games, mostly

# Install Languages
#ruby, rbenv, python3, php5, perl, java, js, 

## Ruby

## Java
apt-get install -y \
	 java-common default-jre deault-java plugin

#######################################################################


###################################
# Replicate ArcheOS metapackages ##
###################################
	
##############################
## From Debian Stable Repos ##
##############################

apt-get install -y \
	blender meshlab whitedune invesalius # 3D
apt-get install -y \
	gpsbabel # GPS
apt-get install -y \
	librecad # CAD
apt-get install -y \
	pgadmin3 phpadmin postgresql postgis sqlite3 sqlitebrowser spatialite-bin # DBs
apt-get install -y \
	darktable gimp gimp-lensfun gimp-plugin-registry geeqie imagej inkscape shutter python-lxml  # Images
apt-get install -y \
	bluefish icedove iceweasel # Internet
apt-get install -y \
	geany libreoffice libreoffice-sdbc-postgresql # Office & Dev
apt-get install -y \
	micmac* \ # Photogrammetry/SfM
apt-get install -y \
	texmaker texlive-fonts-extra jabref ipe scribus lyx pandoc # Publishing
apt-get install -y \
	marble marble-plugins # Science
apt-get install -y \
	fileroller less # Utilities

#################################	
## From Debian Oldstable Repos ##
#################################

apt-get install -t oldstable libvlfeat0

###############	
## From .deb ##
###############

mkdir /usr/bin/tellervo && cd /usr/bin/tellervo
wget http://www.tellervo.org/download/binaries/desktop/1.3.0/Java/tellervo-1.3.0.jar # Tellervo - Dendrochronology

#################
## From source ##
#################

# *cloudcompare* && \ # Point Cloud Comparison, ArcheOS 3D

## PPTGUI
cd /tmp/ && \
	wget http://www.museidironzone.it/archeos/ppt-gui/osm-bundler_64bit.tar.gz /tmp/ppt-gui.tar.gz && \
	tar -xzf ppt-gui.tar.gz && \
	# Move files


### R/SPlus Python Interface
# http://www.omegahat.net/RSPython/


##############
## From Git ##
##############

### SfM tools
cd /home/users/chris/Git && \
	# BundlerSFM
	git clone https://github.com/snavely/bundler_sfm.git && \
	# CMVS-PMVS
	git clone https://github.com/pmoulon/CMVS-PMVS.git && \
	# (Lib)VLFeat
	git clone https://github.com/vlfeat/vlfeat.git && \
	# SfM Toolkit
	# git clone https://github.com/dddExperiments/SFMToolkit.git ** DEPENDENCIES ** 

### Cura 3D Printer Slicer
	git clone https://github.com/Ultimaker/cura-build.git &&

########################################################################################################################################################################

##############################################################################################################################################################
## Install from Debian Pure Blend metapackages, and secondarily individual packages included in metapackages, which you're prob not going to install wholly ##
##############################################################################################################################################################

apt-get install -y \
	gis-data gis-devel gis-gps gis-osm gis-remotesensing gis-statistics gis-web gis-workstation # GIS

apt-get install -y \ 
	Gstreamer1.0-plugins-good ffmpeg # Multimedia (just a few codecs - check out rest of blend)

apt-get install -y \
	r-base numpy scipy matplotlib glue emacs ess # Science

# Ham & Edu?

apt-get install -y \
	ncmpcpp mpd audacious audacity beets vlc lilypond denemo musescore score-reading-trainer fluidsynth qsynth freebirth glick hydrogen solfege sonic-pi # Music

apt-get install -y \
	gpredict stellarium xtide xtide-data # Astro

apt-get install -y \
	oregano xoscope electric pcb xcircuit # Electrical

apt-get install -y \
	arduino autoconf python3 python3-qyqt5 # Development

apt-get install -y \
	stopmotion pitivi vgrabbj openshot # Video
	
########################################################################################################################################################################

###################################
## Adding Kali Linux metapackage ##
###################################

## https://blog.romaingre.net/2014/05/add-kali-repository-on-debian/
## https://www.blackmoreops.com/2013/10/30/add-official-kali-linux-repositories/

########################
## Add to apt keyring ##
########################

apt-key

##################
## Install mpkg ##
##################

apt-get install -y -t kali kali-linux-all && \ # From Kali repo

########################################################################################################################################################################

###########################################
# Installing miscellaneous other software #
###########################################

##############
## From apt ##
##############

apt-get install -y \
	freecad \ # 3D CAD
	mutt procmail \ # CLI Mail
	hugin libimage-exiftool-perl \ # Image Processing

###############
## From .deb ##
###############

# Rstudio

dpkg --install https://download1.rstudio.org/rstudio-xenial-1.1.383-amd64.deb && \ #RStudio

#################
## From source ##
#################

# Atom editor

mkdir /home/users/chris/atom && cd /home/users/chris/atom/ 
wget https://github.com/atom/atom/releases/download/v1.21.1/atom-amd64.deb
dpkg --install atom-amd64.deb ## Atom Editor

#################
## From Github ##
#################
 
# rbenv 

git clone https://github.com/rbenv/rbenv.git ~/.rbenv && \
	echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile && \
	# preseed init prompts?
	/home/users/chris/.rbenv/bin/rbenv init
	# verify
	curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-doctor | bash
	# install ruby-build
	git clone https://github.com/rbenv/ruby-build.git && PREFIX=/usr/local ./ruby-build/install.sh
	
########################################################################################################################################################################



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