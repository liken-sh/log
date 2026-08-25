---
title: The hardware operators
slug: hardware-operators
date: 2026-08-16
backfilled: 2026-08-25
---

I kept pressing Claude to cough up ideas for how we could extend this hardware
system more broadly. I expressed a whole-home A/V vision, but what I wasn't
seeing at the time was that we were missing a key layer of abstraction between
liken and a multimedia fever dream.

liken sees hardware the same way that the kernel does, because, well, that's all
there are, liken and the kernel. The kernel doesn't see a pair of Bluetooth
headphones, it sees a [Bluetooth](https://www.bluetooth.com/) _radio_ that acts
as a gateway to an alien network of other devices. It doesn't see a monitor, it
sees a _GPU_ that has two HDMI ports. It doesn't see audio channels, it sees a
_sound card_ with some PCM sinks. I could easily claim the radios and the GPUs
and the cards, but they weren't really shaped correctly to just hand to a
workload. A music player doesn't want a Bluetooth radio, it wants a socket to
stream audio to some speakers.

I noticed a common pattern: userspace services that owned a lower-level liken
device (like a Bluetooth radio), handled the
[`bluetoothd`/`bluez`](https://github.com/bluez/bluez) user-space side, and then
published back to the cluster resources like a game controller or a Bluetooth
speaker. This pattern played out the same way across
[displays](https://display.liken.sh/), [audio](https://audio.liken.sh/), and
[bluetooth](https://bluetooth.liken.sh/), so I focused on trying to give them as
common a shape as we could.

The results are pretty cool! The audio-operator and display-operator didn't even
need any new
[CRDs](https://kubernetes.io/docs/concepts/extend-kubernetes/api-extension/custom-resources/)
because they just claimed a liken resource and republished the child devices as
new
[`ResourceSlices`](https://kubernetes.io/docs/concepts/scheduling-eviction/dynamic-resource-allocation/)
in-cluster. Bluetooth was an interesting exploration and I learned a lot about
Bluetooth pairing and protocol negotiation.

I think the real joy came when I realized we could have the bluetooth-operator
and audio-operator collaborate on exposing things like Bluetooth speakers and
headsets. We still don't have microphones implemented yet (even now in late
August) but the groundwork is definitely all there.
