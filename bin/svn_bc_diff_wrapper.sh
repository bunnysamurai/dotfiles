#!/bin/bash
# Svn calls diff programs with the parameters that the program 'diff' expects
# Here is an example set of parameters:
# $0:  /home/mzwagerman/bin/echo.sh
# $1:  -u
# $2:  -L
# $3:  sim/rotate_png.py   (revision 19114)
# $4:  -L
# $5:  sim/rotate_png.py   (working copy)
# $6:  /home/mzwagerman/Checkouts/GNTX/shared/.svn/pristine/36/361bdbdb0ddd8aacc5d0a5e5f76575b6b2921784.svn-base
# $7:  /home/mzwagerman/Checkouts/GNTX/shared/video_rotator_forward_bilinear/trunk/sim/rotate_png.py

exec 1>&- #< Close Stdout so jsvn can process the stdout

# Call Beyond Compare with the correct parameters
/usr/bin/bcompare "$6" "$7" -title1="$3" -title2="$5" -leftreadonly &
sleep 1
#exit 0

