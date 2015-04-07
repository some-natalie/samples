#!/bin/bash

# This script will back up all things from the Home folder that goes to the 
# 1 TB external hard drive.

# Code
rsync -r -t -q --delete -s '/home/natalie/Code/' '/run/media/natalie/My Book/Code/'
echo "Code"

# Documents
rsync -r -t -q --delete -s '/home/natalie/Documents/Fall 2012/' '/run/media/natalie/My Book/Documents/School Stuff/Fall 2012/'
echo "Documents"

# Library
rsync -r -t -q --delete -s '/home/natalie/Library/Computers/' '/run/media/natalie/My Book/Library/Reference/Computers/'
rsync -r -t -q --delete -s '/home/natalie/Library/Construction and Building Systems/' '/run/media/natalie/My Book/Library/Reference/Construction and Building Systems/'
rsync -r -t -q --delete -s '/home/natalie/Library/Environmental Protection Agency/' '/run/media/natalie/My Book/Library/Reference/Environmental Protection Agency/'
rsync -r -t -q --delete -s '/home/natalie/Library/General Engineering/' '/run/media/natalie/My Book/Library/Reference/General Engineering/'
rsync -r -t -q --delete -s '/home/natalie/Library/General Science/' '/run/media/natalie/My Book/Library/Reference/General Science/'
rsync -r -t -q --delete -s '/home/natalie/Library/Geotechnical Engineering/' '/run/media/natalie/My Book/Library/Reference/Geotechnical Engineering/'
rsync -r -t -q --delete -s '/home/natalie/Library/Math/' '/run/media/natalie/My Book/Library/Reference/Math/'
rsync -r -t -q --delete -s '/home/natalie/Library/OSHA/' '/run/media/natalie/My Book/Library/Reference/OSHA/'
rsync -r -t -q --delete -s '/home/natalie/Library/Structural Engineering/' '/run/media/natalie/My Book/Library/Reference/Structural Engineering/'
rsync -r -t -q --delete -s '/home/natalie/Library/Unified Facilities Criteria/' '/run/media/natalie/My Book/Library/Reference/Unified Facilities Criteria/'
echo "Library"

# Music
rsync -r -t -q --delete -s '/home/natalie/Music/' '/run/media/natalie/My Book/Music/'
echo "Music"

# Sage Math
rsync -r -t -q --delete -s '/home/natalie/.sage/' '/run/media/natalie/My Book/Sage/'
echo "Sage Math"

# VirtualBox
rsync -r -t -q --delete -s '/home/natalie/VirtualBox VMs/' '/run/media/natalie/My Book/VirtualBox/VirtualBox VMs/'
rsync -r -t -q --delete -s '/home/natalie/.VirtualBox/' '/run/media/natalie/My Book/VirtualBox/VirtualBox/'
echo "VirtualBox"
