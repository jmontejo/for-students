---
layout: post
title:  "Using LXPLUS"
date:   2019-08-18 12:11:22 +0200
permalink: start/lxplus.html
---

## Connect to LXPLUS

LXPLUS: cluster of PCs running Linux provided by the IT department for interactive work. The machines run CC7 (CERN CentOS 7) in 64 bit mode. 

How to connect to lxplus: 
From your terminal, type:
ssh username@lxplus.cern.ch
(use the same password of your account)
You will be connected to the machine with the best response. 
Once you connect, you are directed automatically to your home directory on afs (see below). Here you can keep your code files (e.g. clone here your GitHub repo, or write new code). 

Note: data should not be stored directly on the individual lxplus machines. From the lxplus machines, you have access to the afs filesystem and also eos, which are more suitable for file storing. 
AFS is a service that provides networked file storage. You will have your home directory in afs, but also work space. Another network file stystem widely used is CVMFS. You don’t need it right now but it’s good to know it exists. 

## Text editors

If you wish to use programs with a graphical interface, you can do:
ssh -X username@lxplus.cern.ch
Please note that, depending on the internet connection, the graphical interface can be very slow (see below for suggestions on how to get around that for text editing)

One solution is to use a text editor that opens directly inside the shell, e.g. emacs with the option --no-window-system (or the shorter version -nw). 
If you are in the same directory where you have your file (e.g. myfile.txt), typing 
emacs -nw myfile.txt
will open the file with emacs but inside the terminal, without the need of a graphical window. This greatly reduces issues with slow connections. 
Once you do this, the commands you need to use is the same as for normal usage of emacs (which you can easily find online if you don’t already know them, see e.g. here: https://www.gnu.org/software/emacs/manual/html_node/emacs/Basic.html but there are several other useful resources online). 
This is just an example, there are several other text editors that can work from the terminal, and you can of course use the one you are most comfortable with.
