---
title: Introduction
link: triggerAPI/intro.html
permalink: triggerAPI/intro.html
tags: trigger
layout: post
description: "Introduction to TriggerAPI"
image: images/triggerAPI/triggerAPI.png
---

## TriggerAPI

TriggerAPI is a tool to retrieve information about ATLAS triggers and their prescales. A lot of information on how to use it is covered in the [twiki](https://twiki.cern.ch/twiki/bin/view/Atlas/TriggerAPI).
It is part of the athena framework that is used by ATLAS to reconstruct collisions.

### What does it do

All the triggers ever used by ATLAS and their prescale are stored in a database. TriggerAPI reads out that database, categorises all triggers, and provides the users with information so that they know if a given trigger was prescaled, what triggers are available for a given selection, or if there are better triggers than what they are using.

Triggers are categorised according to the objects that they use to select the event, such as electrons, muons, photons, jets, or missing transverse energy. The categories are represented by integer flags, and they can be combined.
Triggers are also categorised according to the period when they were running. During a year, several periods of data-taking are defined during which the triggers are mostly stable.

With this information, the user can retrieve the list of triggers with a selection in a certain period. For example, the list of all single-photon triggers in 2018. From all the possible single-photon triggers, some will be prescaled and are not very useful for physics, so analysers are mostly interested in _unprescaled_ triggers. Out of all the unprescaled triggers analysers, want the trigger that has the lowest energy threshold to select events. This is the lowest-unprescaled, and is the best trigger that one can use for analysis.
Let's write a small python script to understand the 2018 single photon triggers.

```python
# Import the main interface
from TriggerMenu.api.TriggerAPI import TriggerAPI
# Import the categories
from TriggerMenu.api.TriggerEnums import TriggerPeriod, TriggerType

# Get a dictionary with all the 2018 single photon triggers and their prescale, with loose identification
singlephoton = TriggerAPI.getAllHLT(TriggerPeriod.y2018, TriggerType.g_single, matchPattern="_loose$")

# Just for visualisation, sort them by their prescale and print
import operator
sortedbyPS = sorted(singlephoton.items(), key=operator.itemgetter(1))
for trigger, ps in sortedbyPS:
    print(trigger,ps)
```

The output of running that script should be

```
HLT_g35_loose  0.0
HLT_g25_loose  0.0
HLT_g20_loose  0.0
HLT_g50_loose  0.0
HLT_g6_loose   0.0
HLT_g12_loose  0.0
HLT_g24_loose  0.0
HLT_g10_loose  6.416367884677469e-06
HLT_g60_loose  0.001181198915307023
HLT_g70_loose  0.0019442415044786119
HLT_g80_loose  0.003045321602562602
HLT_g100_loose 0.006491357412516782
HLT_g120_loose 0.012073234213417489
HLT_g160_loose 0.6409154267306995
HLT_g180_loose 0.6472399811998114
HLT_g140_loose 1.0
HLT_g200_loose 1.0
```

From this one can see that there were two triggers that were fully active during 2018 without any prescale `HLT_g140_loose` and `HLT_g200_loose`. One selects any event containing a photon with momentum above 140 GeV, the other events with a photon above 200 GeV. That means the second is a subset of the first, since every photon above 200 GeV is also above 140 GeV. If a user wants to look at events with photons with less energy, it will need to use a trigger that has only recorded a fraction of events. For example `HLT_g100_loose` has stored events with a photon above 100 GeV, but only a 0.6% of the events. The rest of the events have not been stored, even if it had a photon above threshold. Storing all events is critical for analysis, so we usually work only with unprescaled triggers, and in particular the one with lowest threshold. This can be obtained directly with 
```python
print( TriggerAPI.getLowestUnprescaled(TriggerPeriod.y2018, TriggerType.g_single, matchPattern="_loose$") )
```
And the output will be `HLT_g140_loose`.

When reconstructing any object in the detector, we use some _identification_ criteria, which measures how probable it is that the energy deposited in the detector is indeed a photon (or any other object). Right now we are looking into _loose_, that means that we call a photon any energy deposit that looks roughly like a photon. With this we make sure that all or most of the real photons are identified, but unfortunately we also call photons a lot of stuff that is not actually a photon, like a $\pi_0$. These are usually called fake photons. By making the identification stronger, we reduce a lot of the fakes, but we also start to lose a small percent of the real photons. The optimal choice depends on the analysis. TriggerAPI is aware of all these variations, and shows the lowest-unprescaled of each kind, since they can not be compared directly. Let's look at all the options of multi-photon triggers:
```python
multiphoton = TriggerAPI.getLowestUnprescaled(TriggerPeriod.y2018, TriggerType.g_multi)
for trigger in multiphoton:
    print(trigger)
```
And the output:
```
HLT_g35_medium_g25_medium_L12EM20VH
HLT_2g22_tight_L12EM15VHI
HLT_2g50_loose_L12EM20VH
HLT_2g25_tight_L12EM20VH
HLT_2g20_tight_icalovloose_L12EM15VHI
HLT_2g25_loose_g15_loose
```

Focusing for a moment on the three triggers with same L12EM20VH, you can see how the energy threshold is much higher for the loose trigger `2g50_loose` than for for medium `g35_medium_g25_medium` or tight `2g25_tight`. It is up to the analyser to decide which one is best for the purpose of the analysis.

## Try out more of TriggerAPI

```
setupATLAS
asetup Athena,master,latest
runTriggerAPIExample.py
```

You will see a massive block of text running on the screen. But what exactly has run, and what does the output mean?. Let's try to inspect it in more detail.

First of all, we need to know what exactly has run. You can find the script with `which runTriggerAPIExample.py` and then open it to inspect it. You can also simply look at the source code in git [runTriggerAPIExample.py](https://gitlab.cern.ch/atlas/athena/-/blob/master/Trigger/TriggerCommon/TriggerMenuMT/scripts/runTriggerAPIExample.py). To better read the output let's dump it into a text file with `runTriggerAPIExample.py > example.log`.
