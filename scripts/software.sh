# © 2017 Chris Greencorn

#!/bin/bash

# Remove unwanted packages
# - games, mostly

# Install Languages
#ruby, python3, php5, perl, java, js,

apt-get install -y \ # Java
	 java-common default-jre deault-java plugin

apt-get install -y \ # Python
	python python3 python-pip python3-pip

apt-get install -y \ # Ruby
	ruby-full # rbenv later

apt-get install -y \ # Perl
	perl perl-doc 

apt-get install -y \ # NodeJS & NVM
	curl -sL https://raw.githubusercontent.com/creationix/nvm/v0.32.0/install.sh -o /tmp/install_nvm.sh
	bash /tmp/install_nvm.sh
	source ~/.profile
	nvm install 8.9.1 #current LTS a/o Nov 25 2017
	
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
# apt-get install -y \
#	micmac* \ # Photogrammetry/SfM
apt-get install -y \
	texmaker texlive-fonts-extra jabref ipe scribus lyx pandoc # Publishing
apt-get install -y \
	marble marble-plugins # Science
apt-get install -y \
	fileroller less # Utilities
=======
apt-get install -y \ # 3D
	blender meshlab whitedune invesalius
apt-get install -y \ # GPS
	gpsbabel
apt-get install -y \ # CAD
	librecad 
apt-get install -y \ # Databases
	pgadmin3 phpadmin postgresql postgis sqlite3 sqlitebrowser spatialite-bin
apt-get install -y \ # Image Processing
	darktable gimp gimp-lensfun gimp-plugin-registry geeqie imagej inkscape shutter python-lxml
apt-get install -y \ # Internet
	bluefish icedove iceweasel
apt-get install -y \ # Office and Development
	geany libreoffice libreoffice-sdbc-postgresql
apt-get install -y \ # Photogrammetry & Structure from Motion
	micmac* \ 
apt-get install -y \ # Publishing
	texmaker texlive-fonts-extra jabref ipe scribus lyx pandoc
apt-get install -y \ # Science
	marble marble-plugins
apt-get install -y \ Utilities
	fileroller less

#################################	
## From Debian Oldstable Repos ##
#################################

apt-get install -t oldstable libvlfeat0 # Dependency for Python Photogrammetry Toolkit

###############	
## From .deb ##
###############

mkdir /usr/bin/tellervo
wget http://www.tellervo.org/download/binaries/desktop/1.3.0/Java/tellervo-1.3.0.jar -O /usr/bin/tellervo/tellervo.jar # Tellervo - Dendrochronology

#################
## From source ##
#################

# *cloudcompare* && \ # Point Cloud Comparison, ArcheOS 3D

## PPTGUI
cd /tmp/ && \
	wget http://www.museidironzone.it/archeos/ppt-gui/osm-bundler_64bit.tar.gz -O /tmp/ppt-gui.tar.gz && \
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
	git clone https://github.com/Ultimaker/cura-build.git

cd /home/users/chris/

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
	gramps \ # Genealogy
	r-cran-rjags r-cran-coda \ # Bayesian & MCMC stats for R
	mayavi \ # 2D & 3D data viz
	maxima gnuplot gnuplot-doc gnuplot-qt gnuplot-x11 maxima-share maxima-doc maxima-emacs xmaxima wish \ # CLI math
	libsndfile1 # reading and writing sampled audio to file - dep for ChucK
	yacc lex # depends for ChucK
	keepnote # OneNote replacement	
	gnucash gnucash-docs dbus dbus-x11 python-gnucash # financial


###############
## From .deb ##
###############

# Rstudio

dpkg --install https://download1.rstudio.org/rstudio-xenial-1.1.383-amd64.deb  #RStudio


#################
## From source ##
#################

# Atom editor

mkdir /home/users/chris/atom

wget https://github.com/atom/atom/releases/download/v1.21.1/atom-amd64.deb -O /home/users/chris/atom/atom-amd64.deb
dpkg --install atom-amd64.deb ## Atom Editor
=======
wget https://github.com/atom/atom/releases/download/v1.21.1/atom-amd64.deb /home/users/chris/.atom/atom-amd64-v1.21.1.deb
dpkg --install atom-amd64-v1.21.1.deb ## Atom Editor

# RSPython

 wget http://www.omegahat.net/RSPython/RSPython_0.7-1.tar.gz /tmp/RSPython.tar.gz
 R CMD INSTALL --clean /tmp/RSPython.tar.gz

# Processing viz language

wget http://download.processing.org/processing-3.3.6-linux64.tgz /tmp/processing-3.3.6-linux64.tgz
tar -xzf processing-3.3.6-linux64.tgz /home/users/chris/.executables/processing
echo "alias processing='. /home/users/chris/.executables/processing/processing" >> /home/users/chris/.bashrc

# ChucK sound manipulation language

wget http://chuck.cs.princeton.edu/release/files/chuck-1.3.5.2.tgz /tmp/chuck.tgz
tar -xvzf /tmp/chuck.tgz 
cd /tmp/chuck/src/
make linux-alsa #linux-jack if you're using jack
make install
cd /

#################
## From Github ##
################# 


# rbenv
git clone https://github.com/rbenv/rbenv.git /home/users/chris/.rbenv && \ # rbenv
	echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> /home/users/chris/.bash_profile && \
	# preseed init prompts?
	/home/users/chris/.rbenv/bin/rbenv init
	# verify
	curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-doctor | bash	
	
# ruby-build	
git clone https://github.com/rbenv/ruby-build.git /home/users/chris/.rbenv/ruby-build && PREFIX=/usr/local ./ruby-build/install.sh
	
#PyCAM
git clone https://github.com/SebKuzminsky/pycam.git /home/users/chris/.pycam
echo "alias pycam='python /home/users/chris/.pycam/scripts/pycam'" >> /home/users/chris/.bashrc




################
## Java .JARs ##
################

# JSesh Hieroglyphs

wget https://downloads.sourceforge.net/project/jsesh/6.5.5/JSesh-install-6.5.5.jar /home/users/chris/.jars/JSesh-install-5.5.5.jar




#######################################################################################################################################################################

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
=======
# CAELinux 
# https://distrowatch.com/images/screenshots/cae-2010.png
# https://distrowatch.com/images/screenshots/cae-2011.png
