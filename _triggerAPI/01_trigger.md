---
title: Trigger
link: triggerAPI/trigger.html
permalink: triggerAPI/trigger.html
tags: trigger
layout: post
description: "The basics of the ATLAS trigger"
image: images/triggerAPI/trigger.png
---

## A hadron collider trigger

In a hadron collider like the LHC, the number of collisions that we produce is insanely high, up to 40 millions per second, and every collision that we store takes about 1 Mb in disk. You can do the math, and see that it is absolutely impossible to store every collision that we produce. In addition, the vast majority of the LHC collisions are very boring, just low-energy QCD which we already know very precisely. Therefore we introduce a *trigger*, which is a system that looks at every collisions, and decides if it looks interesting enough to store in disk or not. From the 40 million collisions per second, it stores just about 1000 of them to disk. Every collision that is not stored is lost forever, therefore it is critical to have a good trigger. 

In order to decide if the collision is interesting, it first has to reconstruct it. But reconstructing an event takes way more than 25 nanoseconds (1 over 40 million), the reconstruction of an ATLAS event takes about 1 second when done with full precision. So the trigger has to run a much faster reconstruction, which of course as worse precision. This is done in two steps, the Level-1 trigger (L1) and the High-level trigger (HLT).

#### A side note about rates
The number of events per second is a rate, and that's how we usually measure them. The collision rate is 40 MHz, and we store 1 kHz of events.

### L1
The L1 trigger is based on hardware, not on software. It takes 2.5 microseconds to decide if we store a collision or not. In the time it takes to decide, another 100 collisions have already happened. The L1 system has enough buffer to store in memory 100 collisions while they are processed, so that none is lost. From the 40 MHz collision rate, the L1 trigger accepts 100 kHz as a strict maximum. The reconstruction at L1 is really minimal, we just look at energy in the calorimeter and in the muon spectrometer. But there is no time to reconstruct tracks, run jet clustering, or any sophisticated reconstruction. 

### HLT
The High-level trigger is based on software, running on about 40000 computers. It reads every event accepted by L1, reconstructs it with some approximations, and decides which events to store. The HLT accepts about 1 kHz events on average.

## The trigger menu
In both steps, L1 and HLT, the trigger decides if the event is interesting or not. It does this based on the trigger menu. The trigger menu is a set of rules and criteria that we have defined, when they are met we store the event. Some examples at HLT are:
- At least one muon above 50 GeV
- At least one isolated muon above 26 GeV
- At least one jet above 420 GeV
- At least four jets above 120 GeV each
- The event is unbalanced, and there is more than 110 GeV of missing energy

At L1 the reconstruction is much less precise, and there are no tracks, so we need to be much looser in the selection to ensure we don't lose any of the interesting events. Some examples at L1 are:
- At least one muon above 20 GeV
- At least one jet above 100 GeV
- At least four jets above 15 GeV

When the energy threshold is very high, only very few events pass, so that the _rate_ of the trigger is very low. If the energy threshold is low, the rate is much higher. The sum of rates of all triggers in the menu have to satisfy the constraints of the system, maximum 100 kHz at L1, 1 kHz at HLT. Therefore the trigger menu is a compromise between what we want for physics (store as many events as possible, i.e. low thresholds) and what we can afford technically. If we want to store more events with missing energy (lower the threshold from 110 GeV to 100 GeV for example) we will need to raise the energy threshold for other objects, so that the total rate is not above the limit.

### Trigger turn-on
To fill

### Prescales
Most rules in the trigger menu mean "store *all* events that satisfy this criteria". So that we can use all the collisions produced by the LHC. However, what do we do if we want to study events with a jet of 200 GeV? Those events are below the trigger threshold (at least one jet above 420 GeV) and are not stored. There are other rules in the trigger menu which have a _prescale_ value. A rule with a prescale of 10 means "store 1 event from every 10 that satisfy this criteria". This is usually done to record events with low energy. The rate of a trigger is much higher if we lower the energy threshold, but the rate of a prescaled trigger is reduced by a factor equal to the prescale.

### How to read trigger names
To fill
