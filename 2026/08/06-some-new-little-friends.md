---
title: Some new little friends
slug: some-new-little-friends
date: 2026-08-06
backfilled: 2026-08-25
---

Riding high on the success of the homelab migration, I started thinking about
what my original vision had been for the homelab, years ago, in the 2010s. I'd
pictured a single brain with digital tentacles snaking through the walls and
lighting up every corner of the house as part of one expanded digital brain.

I'd realized much of this with [Home Assistant](https://www.home-assistant.io/),
for sure, and [Google Home](https://home.google.com/) let us pretend we owned a
whole home brain and voice. But there was still something very dull about how
the homelab had landed as a rack of computers tucked in a corner, with everyone
relying on Google TV dongles and speakers rather than talking with our actual
house. Now I had a vocabulary to express that whole house vision, liken with
follower nodes of any size, exposing hardware devices over
[DRA](https://kubernetes.io/docs/concepts/scheduling-eviction/dynamic-resource-allocation/)
for special cases.

The first target for me was our [zigbee2mqtt](https://www.zigbee2mqtt.io/) and
[NUT](https://networkupstools.org/) devices on those [Raspberry Pi
2s](https://www.raspberrypi.com/products/raspberry-pi-2-model-b/). With a couple
of very low-end mini PCs, they joined as the first non-leader nodes and the
Kubernetes DRA system lets me express exactly why the workloads land on the same
machines that the UPS and Zigbee radios are attached to.

That entire operation took less than a couple hours, and I realized that there
was really no going back.
