---
title: Development
link: triggerAPI/dev.html
permalink: triggerAPI/dev.html
tags: trigger
layout: post
description: "Improvements and new features for TriggerAPI"
image: images/triggerAPI/dev.jpeg
---

## How to develop

First you need to download athena, which is the ATLAS framework. Athena is kept in git, the best is to go through the [ATLAS git tutorial](https://atlassoftwaredocs.web.cern.ch/gittutorial/), which also contains instructions on how to work with the packages
Since we are only using one package you can use the _sparse checkout_. 
First create and cd to some folder where you will be working.

```
setupATLAS
asetup Athena,latest,master
lsetup git
git atlas init-workdir https://:@gitlab.cern.ch:8443/atlas/athena.git
cd athena
#TriggerAPI is part of the TriggerMenuMT package
git atlas addpkg TriggerMenuMT
git fetch upstream
git checkout -b master_triggerAPI_development upstream/master --no-track
```

The TriggerAPI code lives in `Trigger/TriggerCommon/TriggerMenuMT/python/TriggerAPI`. After developing you will need to build the package in a folder outside of athena.

```
mkdir build
cd build
cmake  ../athena/Projects/WorkDir
make -j8
```

In order to run it is best to have outside yet another folder, so that it doesn't interfere with the build

```
mkdir run
cd run
source ../build/x86_64-centos7-gcc8-opt/setup.sh
```

And now you can write here your python scripts to test, or run `runTriggerAPIExample.py` for example. Once everything is setup, since the code is in python there is no need to compile. But every time you start a new working session you need to prepare the environment. The best practice is to put the following into a `setup.sh` and just `source setup.sh` in every session.
```
setupATLAS
asetup Athena,latest,master
lsetup git
source build/x86_64-centos7-gcc8-opt/setup.sh
```

The asetup call configures the ATLAS athena framework, this is already precompiled and installed in lxplus. The source build/... tells the system to use your packages instead of the official ones. If you modify TriggerAPI but forget this source, every script will use the official package and you won't see your modifications.

With this, the structure of your work folder should be the following:
```
|- workfolder
    |- athena
    |- build
    |- run
    |- setup.sh
```


# Work plan

The goal is to go through the following milestones

## First week

- Learn to use the terminal, if needed go through [tutorial 1](https://www.freecodecamp.org/news/linux-command-line-bash-tutorial/) or [tutorial 2](https://ryanstutorials.net/linuxtutorial/commandline.php)
- Learn to use python, if needed go through [tutorial 1](https://www.learnpython.org) or [tutorial 2](https://realpython.com/python-first-steps/)
- Learn to use git, if needed go through [tutorial 1](https://www.freecodecamp.org/news/learn-git-and-version-control-in-an-hour/) or [tutorial 2](https://towardsdatascience.com/version-control-with-git-get-started-in-less-than-15-minutes-696b4ce7ce92)

*Milestone 1:* create a project in [gitlab](https://gitlab.cern.ch/), check it out in your workfolder in lxplus, and create a python script in the project. The script has to read the following file `/afs/cern.ch/user/j/jmontejo/public/HSSIP/combinedCLs_RPV1L_GG_rpvHF.json` (use the python json library). Every entry in the json contains the CLs values of an analysis, for different gluino masses and lifetimes (the physics is not relevant now). For every lifetime value find the maximum gluino mass for which CLs is less than 0.05.

- Setup the ATLAS athena framework, follow instructions in [ATLAS git tutorial](https://atlassoftwaredocs.web.cern.ch/gittutorial/)
- Setup the working area as described here
- Create your own fork of athena

*Milestone 2:* modify TriggerAPI, adding a print statement with your name in the function getLowestUnprescaled. Commit to your fork, and open a merge request to [my fork](https://gitlab.cern.ch/jmontejo/athena). Then write a new python script in your project, which gets the list of all the muon lowest unprescaled triggers in 2018. Check that your name is printed out when using getLowestUnprescaled..

## Second week

We will work on extending the features of TriggerAPI, depending on time and status of the previous week

#### Extensions and fixes of the current code

1. Switch to Flag type for the enums. See [the docs](https://docs.python.org/3/library/enum.html)
2. Treat run numbers different from compound trigger periods
3. Include heavy-ion periods and types
4. Include new UTT and Bphys-electrons categories. Check if TagAndProbe should be a category or a label

#### Heavy-ion developments

The following steps are needed to include heavy-ions into TriggerAPI

1. New periods y2015PbPb (led-led collisions), y2016pPb (proton-led), y2017XeXe (xenon-xenon), and y2018PbPb
2. New categories upc (contains "upc"), minbias (contains "zdcpeb"), and ucc (contains "ucc")
3. Add the new GRLs
    - https://atlas-groupdata.web.cern.ch/atlas-groupdata/GoodRunsLists/data15_hi/20190708/data15_hi.periodAllYear_DetStatus-v105-pro22-13_Unknown_PHYS_HeavyIonP_All_Good_tolerable_L1CALmisconfigSatBCID.xml
    - https://atlas-groupdata.web.cern.ch/atlas-groupdata/GoodRunsLists/data16_hip/20190708/data16_hip5TeV.periodAllYear_DetStatus-v105-pro22-13_Unknown_PHYS_HeavyIonP_All_Good.xml
    - https://atlas-groupdata.web.cern.ch/atlas-groupdata/GoodRunsLists/data16_hip/20190708/data16_hip8TeV.periodAllYear_DetStatus-v105-pro22-13_Unknown_PHYS_HeavyIonP_All_Good.xml
    - https://atlas-groupdata.web.cern.ch/atlas-groupdata/GoodRunsLists/data17_hi/20190706/data17_hi.periodAllYear_DetStatus-v105-pro22-13_Unknown_PHYS_StandardGRL_All_Good.xml
    - https://atlas-groupdata.web.cern.ch/atlas-groupdata/GoodRunsLists/data18_hi/20190731/data18_hi.periodAllYear_DetStatus-v106-pro22-14_Unknown_PHYS_HeavyIonP_All_Good.xml

#### Possible new features

1. Get lists of triggers based on tags defined in TriggerMenuMT, via a new method `getTriggersLabeled("your-favourite-tag")`
2. Get lists of triggers to be used in derivations, via a new method `getTriggersForDerivations(...)`. This would be an OR of primaries and specific labels.


#### Documentation

1. Update the [twiki](https://twiki.cern.ch/twiki/bin/view/Atlas/TriggerAPI).
2. Comment the python code

