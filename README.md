# samples
Portfolio of some past work.

## Config files
An assortment of configuration files to programs I use frequently.
* conkyrc-desktop - <code> ~.conkyrc </code> file for my main desktop for use with [Conky](http://conky.sourceforge.net/).  It shows CPU usage, memory usage, hard drive usage by drive, and many other stats on a quick heads-up basis.
* bashrc - my .bashrc file.  It's got some stuff I wrote myself and stuff copy/pasted from various parts of the internet over the years.  The aliases to SaltStack and Packer are pretty useful.


## GNU bash
An assortment of scripts to do odd jobs.
* autostart.sh - I had a laptop that would never have the backlight set right, leaving the screen unreadably dark. This sets the backlight brightness to 100% at login, as well as starting a few other programs.
* pdf_tiff_tesseract.sh - This script takes a scanned PDF and runs it through [Tesseract OCR](https://code.google.com/p/tesseract-ocr/ "Tesseract OCR").  I normally used only flat pages, but you can pre-process through [unpaper](https://www.flameeyes.eu/projects/unpaper "unpaper") to get rid of that curved-book-scanned-flat look first.  It requires [ImageMagick](http://www.imagemagick.org/ "ImageMagick").
* sambasetup.sh - This script was written to make a student lab run smoother if they messed up and had to start from a clean image.  It disables SELinux, installs Samba, turns on the required services, and tells the student how to proceed with the next step of the lab assignment.
* tb_backup.sh - Calls rsync to copy stuff from my home directory to an external hard drive.  Ran on a cron job daily.
* vbox_set_dmi.sh - One class in undergrad required this software that would shut down if it detected it was running in a virtual machine by checking the DMI information.  This script sets a VirtualBox instance to my old undergrad laptop's information.  Problem solved!


## GNU Octave (or MATLAB)
Most of the code was written for Octave, but also runs in MATLAB.
* earthquake-analysis.m - Input a data file from an accelerometer, correct, calculate velocity and position, output some peak parameters and graphs.  See file for more details.
* hmkplot.m - More plots from vectors, without the accompanying calculations this time.
* kirsch.m - The [Kirsch equations](https://en.wikipedia.org/wiki/Kirsch_equations "Wikipedia") describe elastic stresses surrounding a circular hole in an infinitely solid material.  Just a quick solution of these.
* rc_beam.m - Solves a rectangular reinforced concrete beam in bending.
* stress.m - Solves 2D stresses at a given angle.


## SQL
I taught an introductory database development class.  If I find any more of my in-class examples, I'll put them here.
* dvd.sql - Over a few lectures, the concepts of tables, queries, and normalization were introduced in reference to a database that stores information a student would want to keep about DVDs in their collection.  This was developed in class as a result of that to show the syntax and structure while maintaining interactivity with students.

## TI Basic
My first language and a language I used from time to time throughout high school, undergrad, and graduate school to make my TI-89 Titanium be a bit more useful and do homework faster.
* cktfact.txt - Solves many basic circuit equations in an introductory electronics class.
* lrfd.txt - Given a bunch of loads, calculates the maximum design load using [Load and Resistance Factor Design](https://en.wikipedia.org/wiki/Limit_state_design "Wikipedia").
* settle.txt - Calculates the settlement of a layer of soil using [Terzaghi's solution](https://en.wikipedia.org/wiki/Consolidation_%28soil%29 "Wikipedia").
* tvm.txt - Works out the time value of money.
