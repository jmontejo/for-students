---
title: Using LXPLUS
link: start/lxplus.html
permalink: start/lxplus.html
tags: lxplus
output: true
layout: post
description: Basic instructions on how to connect to lxplus, and suggestions on text editors
image: images/start/lxplus/logo.png
---

## LXPLUS

[LXPLUS](https://information-technology.web.cern.ch/services/lxplus-service): cluster of PCs running Linux provided by the IT department for interactive work. The machines run CC7 (CERN CentOS 7) in 64 bit mode. 

How to connect to lxplus

From your terminal, type:
```
ssh username@lxplus.cern.ch
```
(use the same password of your account)

You will be connected to the machine with the best response. 
From the lxplus machines, you have access to the afs filesystem and also eos, which are suitable for file storing. 
AFS is a service that provides networked file storage. You will have your home directory in afs, but also a workspace with more
storage space.  
When you connect to lxplus, you are directed automatically to your home directory on [afs](https://information-technology.web.cern.ch/services/afs-service). 
Here you can keep your code files (e.g. clone here your GitHub repo, or write new code).

Another network file system widely used is [CVMFS](https://cvmfs.readthedocs.io/en/stable/cpt-quickstart.html).
You don't need it right now but it's good to know it exists.

When you have large files, the easiest option is to store them on [EOS](https://information-technology.web.cern.ch/services/eos-service), 
which is a disk-based storage service.
You can move to your eos space by:
```
cd /eos/user/<u>/<username>
```
where you need to replace `<username>` by your cern username, and `<u>` by its first letter. 
Files stored on eos are available also through [cernbox](https://information-technology.web.cern.ch/services/cernbox-service), which is
accessible [here](https://cernbox.cern.ch/).
The activation of the eos service is described below.

To recap, the storage spaces where you can keep your files are:
- afs home, `/afs/cern.ch/user/<u>/<username>` (default when you connect to lxplus), up to 10 GB, daily backup
- afs workspace, `/afs/cern.ch/work/<u>/<username>`, up to 100 GB
- eos, `/eos/user/<u>/<username>`, available through cernbox, up to 1 TB

## Activate eos service and increase your storage space 

You can manace your services on the [CERN Resources Portal](https://resources.web.cern.ch/resources/).
From there, select the tab `List services`. This will display all the available services:
![services](/jmontejo/students/images/start/lxplus/services.png)

Please make sure you have subscribed to the following services:
- LXPLUS and Linux (you should already be subscribed by default)
- AFS Workspaces (you should already be subscribed by default)
- EOS/CERNBox

Note: when you click on `AFS Workspaces`, you should check the settings (you can
select that from the menu on the left). Here you can increase the space in
your afs home and workspace up to 10 and 100 GB respectively,
and also see the path for how to find these areas from lxplus. 

## Text editors

If you wish to use programs with a graphical interface, you can do:
```
ssh -X username@lxplus.cern.ch
```
Please note that, depending on the internet connection, the graphical interface can be very slow (see below for suggestions on how to get around that for text editing)

One solution is to use a text editor that opens directly inside the shell, e.g. emacs with the option `--no-window-system`
(or the shorter version `-nw`). 
If you are in the same directory where you have your file (e.g. myfile.txt), typing 
```
emacs -nw myfile.txt
```
will open the file with emacs but inside the terminal, without the need of a graphical window.
This greatly reduces issues with slow connections. 
Once you do this, the commands you need to use is the same as for normal usage of emacs
(which you can easily find online if you don't already know them, see e.g. [here](https://www.gnu.org/software/emacs/manual/html_node/emacs/Basic.html), 
but there are several other useful resources online).
Emacs is already available on lxplus, so there's no need to install it there. 
This is just an example, there are several other text editors that can work from the terminal,
and you can of course use the one you are most comfortable with.

## ATLAS software

To setup the ATLAS software environment on lxplus, you can simply do:
```
setupATLAS
```
This is an alias for `/cvmfs/atlas.cern.ch/repo/ATLASLocalRootBase/user/atlasLocalSetup.sh`. 
After you type it you will see a list of commands you can type to setup various ATLAS computing tools. 
Which tools you need depends on the specific task you need to carry out.
E.g. to setup ROOT:
```
lsetup root
```

## Copy files to your local machine

To copy files on your computer:
```
scp usernam@lxplus.cern.ch:path-to-file new-file-name
```

The option `-r` allows you to copy a whole repository. 

## Additional information

- lxplus [guide](https://lxplusdoc.web.cern.ch/)
