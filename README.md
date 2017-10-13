# debian-preseed

A collection of scripts and a preseed file to automate the setup of my Debian installs when I brick the previous one.

Currently designed for scripts to be called from `auto` command, after `Esc`ing from the Debian install menu. 

## Objectives:
 - Turnkey Debian install
 - Non-standard packages installed
     - Integration of various repos that aren't (stable), and representing the range of my interests and practical uses, even if packages deviate from free software/Debian ethos, incl.:
         - Media software and codecs - audio, video, images
         - Office and Publishing software - mail, word processor, tabular, slides, financial, *tex, vector graphics
         - Archaeological/Geophysics/Data science/Programming/Historical/Cultural Heritage/Archiving/Data prez software (whew)
         - Maker software 
     - Also in no way a minimal install - in fact, looking for the greatest coverage, rather than small size, and will require a certain level of hardware to support this
- Dotfiles and config looked after in install process
   - mail
   - network
   - bash and terminal programs (ncurses stuff)
 - Functional hardware (Lenovo X200)
   - primarily firmware-iwlwifi from contrib/nonfree
   - also map for Lenovo-specific fkey functions
  
## Inspiration
This particular preseed takes inspiration from a few variations on Debian:
- [ArcheOS](http://www.archeos.eu/): A currently dormant Debian-based distro (pretty well straight Debian XFCE + some extra repos) centred around tools useful in archaeology and a variety of geophysical professions. I haven't been able to find a functional GPG key for apt so I've had to work around that and pull from a few different repos, clone from git, use .DEBs, or compile from source, where possible using the former three because I'm not really familiar with the maintenance of packages built from source yet. 
- [Debian "Pure Blends"](https://www.debian.org/blends/):
  - [GIS](https://www.debian.org/blends/gis/): This Debian blend fills a sizeable gap that the absence of functional ArcheOS repos leaves - a comprehensive suite of geophysical applications. There was a lot of overlap between the ArcheOS-GIS metapackage and these GIS Blend metapackages, so I just elected to use them instead. 
  - [Debian Edu](https://wiki.debian.org/DebianEdu/): More pulling random packages that I find useful than any whole metapackage.
  - More to come
- [Kali Linux](https://www.kali.org/): I'm pretty damn paranoid about... well, everything. Pretty self-explanatory.

## Progress

Here I'll report plain-text what I've done. It's available in the commit history obviously but this will be a bit clearer, and a place for me to refer back to my previous work.
### 2017
- October 11: Created repo, populated with basic scripts, and worked on `preseed.cfg`, `customization_script.sh`, and `software.sh`, mostly. `customization_script.sh` calls the others, which seemed to make the most sense to me - more isolation between major groups of actions means I can debug easier. I may condense or alternately explode them further later on.
- October 12: Worked on `software.sh` and `customization_script.sh`. Left some direction in the comments in each file about where to take them. Wrote up the preliminary contents of this readme.

## Long-term

1. **Compile Debian image using these preseed scripts** 
