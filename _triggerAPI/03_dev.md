---
title: Development
link: triggerAPI/dev.html
permalink: triggerAPI/dev.html
tags: trigger
layout: post
description: "Improvements and new features for TriggerAPI"
image: images/rpvmj/intro/logo.png
---

## Extensions and fixes of the current code

1. Include new UTT and Bphys-electrons categories. Check if TagAndProbe should be a category or a label
2. Treat run numbers different from compound trigger periods
3. Switch to Flag type for the enums. See [the docs](https://docs.python.org/3/library/enum.html)
4. Include heavy-ion periods and types

## Possible new features

1. Get lists of triggers based on tags defined in TriggerMenuMT, via a new method `getTriggersLabeled("your-favourite-tag")`
2. Get lists of triggers to be used in derivations, via a new method `getTriggersForDerivations(...)`. This would be an OR of primaries and specific labels.


## Documentation

1. Update the [twiki](https://twiki.cern.ch/twiki/bin/view/Atlas/TriggerAPI).
2. Comment the python code

## How to develop
