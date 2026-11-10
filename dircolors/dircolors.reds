# reds dircolors -- generated from `dircolors -p` (coreutils 8.32)
# tuned for redshift -O 1000: only red-channel brightness survives, so types are
# told apart by brightness tier + bold/italic/underline rather than hue.
#   dirs: bold bright   links: italic   exec: underline   specials: bold mid
#   archives/images/audio: mid tiers    backup/temp: dim   broken links: struck

# Configuration file for dircolors, a utility to help you set the
# LS_COLORS environment variable used by GNU ls with the --color option.
# Copyright (C) 1996-2020 Free Software Foundation, Inc.
# Copying and distribution of this file, with or without modification,
# are permitted provided the copyright notice and this notice are preserved.
# The keywords COLOR, OPTIONS, and EIGHTBIT (honored by the
# slackware version of dircolors) are recognized but ignored.
# Below are TERM entries, which can be a glob patterns, to match
# against the TERM environment variable to determine if it is colorizable.
TERM alacritty*
TERM Eterm
TERM ansi
TERM *color*
TERM con[0-9]*x[0-9]*
TERM cons25
TERM console
TERM cygwin
TERM dtterm
TERM gnome
TERM hurd
TERM jfbterm
TERM konsole
TERM kterm
TERM linux
TERM linux-c
TERM mlterm
TERM putty
TERM rxvt*
TERM screen*
TERM st
TERM terminator
TERM tmux*
TERM vt100
TERM xterm*
# Below are the color init strings for the basic file types.
# One can use codes for 256 or more colors supported by modern terminals.
# The default color codes use the capabilities of an 8 color terminal
# with some additional attributes as per the following codes:
# Attribute codes:
# 00=none 01=bold 04=underscore 05=blink 07=reverse 08=concealed
# Text color codes:
# 30=black 31=red 32=green 33=yellow 34=blue 35=magenta 36=cyan 37=white
# Background color codes:
# 40=black 41=red 42=green 43=yellow 44=blue 45=magenta 46=cyan 47=white
#NORMAL 00 # no color code at all
#FILE 00 # regular file: use no color at all
RESET 0 # reset to "normal" color
DIR 01;38;5;214 # directory
LINK 03;38;5;216 # symbolic link. (If you set this to 'target' instead of a
 # numerical value, the color is as for the file pointed to.)
MULTIHARDLINK 00 # regular file with more than one link
FIFO 01;38;5;137 # pipe
SOCK 01;38;5;137 # socket
DOOR 01;38;5;137 # door
BLK 01;04;38;5;137 # block device driver
CHR 01;04;38;5;137 # character device driver
ORPHAN 03;09;38;5;196;48;5;52 # symlink to nonexistent file, or non-stat'able file ...
MISSING 03;09;38;5;196;48;5;52 # ... and the files they point to
SETUID 01;38;5;16;48;5;196 # file that is setuid (u+s)
SETGID 01;38;5;16;48;5;172 # file that is setgid (g+s)
CAPABILITY 01;38;5;16;48;5;137 # file with capability
STICKY_OTHER_WRITABLE 01;38;5;16;48;5;214 # dir that is sticky and other-writable (+t,o+w)
OTHER_WRITABLE 01;38;5;214;48;5;88 # dir that is other-writable (o+w) and not sticky
STICKY 01;38;5;214;48;5;52 # dir with the sticky bit set (+t) and not other-writable
# This is for files with execute permission:
EXEC 04;38;5;209
# List any file extensions like '.gz' or '.tar' that you would like ls
# to colorize below. Put the extension, a space, and the color init string.
# (and any comments you want to add after a '#')
# If you use DOS-style suffixes, you may want to uncomment the following:
#.cmd 01;32 # executables (bright green)
#.exe 01;32
#.com 01;32
#.btm 01;32
#.bat 01;32
# Or if you want to colorize scripts even if they do not have the
# executable bit actually set.
#.sh 01;32
#.csh 01;32
 # archives or compressed (bright red)
.tar 38;5;173
.tgz 38;5;173
.arc 38;5;173
.arj 38;5;173
.taz 38;5;173
.lha 38;5;173
.lz4 38;5;173
.lzh 38;5;173
.lzma 38;5;173
.tlz 38;5;173
.txz 38;5;173
.tzo 38;5;173
.t7z 38;5;173
.zip 38;5;173
.z 38;5;173
.dz 38;5;173
.gz 38;5;173
.lrz 38;5;173
.lz 38;5;173
.lzo 38;5;173
.xz 38;5;173
.zst 38;5;173
.tzst 38;5;173
.bz2 38;5;173
.bz 38;5;173
.tbz 38;5;173
.tbz2 38;5;173
.tz 38;5;173
.deb 38;5;173
.rpm 38;5;173
.jar 38;5;173
.war 38;5;173
.ear 38;5;173
.sar 38;5;173
.rar 38;5;173
.alz 38;5;173
.ace 38;5;173
.zoo 38;5;173
.cpio 38;5;173
.7z 38;5;173
.rz 38;5;173
.cab 38;5;173
.wim 38;5;173
.swm 38;5;173
.dwm 38;5;173
.esd 38;5;173
# image formats
.jpg 38;5;137
.jpeg 38;5;137
.mjpg 38;5;137
.mjpeg 38;5;137
.gif 38;5;137
.bmp 38;5;137
.pbm 38;5;137
.pgm 38;5;137
.ppm 38;5;137
.tga 38;5;137
.xbm 38;5;137
.xpm 38;5;137
.tif 38;5;137
.tiff 38;5;137
.png 38;5;137
.svg 38;5;137
.svgz 38;5;137
.mng 38;5;137
.pcx 38;5;137
.mov 38;5;137
.mpg 38;5;137
.mpeg 38;5;137
.m2v 38;5;137
.mkv 38;5;137
.webm 38;5;137
.webp 38;5;137
.ogm 38;5;137
.mp4 38;5;137
.m4v 38;5;137
.mp4v 38;5;137
.vob 38;5;137
.qt 38;5;137
.nuv 38;5;137
.wmv 38;5;137
.asf 38;5;137
.rm 38;5;137
.rmvb 38;5;137
.flc 38;5;137
.avi 38;5;137
.fli 38;5;137
.flv 38;5;137
.gl 38;5;137
.dl 38;5;137
.xcf 38;5;137
.xwd 38;5;137
.yuv 38;5;137
.cgm 38;5;137
.emf 38;5;137
# https://wiki.xiph.org/MIME_Types_and_File_Extensions
.ogv 38;5;137
.ogx 38;5;137
# audio formats
.aac 38;5;131
.au 38;5;131
.flac 38;5;131
.m4a 38;5;131
.mid 38;5;131
.midi 38;5;131
.mka 38;5;131
.mp3 38;5;131
.mpc 38;5;131
.ogg 38;5;131
.ra 38;5;131
.wav 38;5;131
# https://wiki.xiph.org/MIME_Types_and_File_Extensions
.oga 38;5;131
.opus 38;5;131
.spx 38;5;131
.xspf 38;5;131

# reds: backup / temp files, dimmed
*~ 38;5;94
*# 38;5;94
.bak 38;5;94
.old 38;5;94
.orig 38;5;94
.swp 38;5;94
.swo 38;5;94
.tmp 38;5;94
.part 38;5;94
.rej 38;5;94
.dpkg-dist 38;5;94
.dpkg-old 38;5;94
