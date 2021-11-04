---
title: Introduction
link: triggerAPI/intro.html
permalink: triggerAPI/intro.html
tags: trigger
layout: post
description: "Introduction to TriggerAPI"
image: images/rpvmj/intro/logo.png
---

## TriggerAPI

TriggerAPI is a tool to retrieve information about ATLAS triggers and their prescales. A lot of information on how to use it is covered in the [twiki](https://twiki.cern.ch/twiki/bin/view/Atlas/TriggerAPI).
It is part of the athena framework that is used by ATLAS to reconstruct collisions.

#### What does it do

All the triggers ever used by ATLAS and their prescale are stored in a database. TriggerAPI reads out that database, categorizes all triggers, and provides the users with information so that they know if a given trigger was prescaled, what triggers are available for a given selection, or if there are better triggers than what they are using.

Triggers are categorized according to the objects that they use to select the event, such as electrons, muons, photons, jets, or missing transverse energy. The categories are represented by integer flags, and they can be combined.
Triggers are also categorized according to the period when they were running. During a year, several periods of data-taking are defined during which the triggers are mostly stable.

With this information, the user can retrieve the list of triggers with a selection in a certain period. For example, the list of all single-photon triggers in 2018. From all the possible single-photon triggers, some will be prescaled and are not very useful for physics, so analysers are mostly interested in _unprescaled_ triggers. Out of all the unprescaled triggers analysers want the trigger that has the lowest threshold to select events. This is the lowest-unprescaled, and is the best trigger that one can use for analysis.

#### Try out TriggerAPI

```
setupATLAS
asetup Athena,master,latest
runTriggerAPIExample.py
```

You will see a massive block of text running on the screen. But what exactly has run, and what does the output mean?. Let's try to inspect it in more detail.

First of all, we need to know what exactly has run. You can find the script with `which runTriggerAPIExample.py` and then open it to inspect it. You can also simply look at the source code in git [runTriggerAPIExample.py](https://gitlab.cern.ch/atlas/athena/-/blob/master/Trigger/TriggerCommon/TriggerMenuMT/scripts/runTriggerAPIExample.py). To better read the output let's dump it into a text file with `runTriggerAPIExample.py > example.log`.


