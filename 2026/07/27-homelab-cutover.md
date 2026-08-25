---
title: Homelab cutover
slug: homelab-cutover
date: 2026-07-27
backfilled: 2026-08-25
---

Over the week leading up to the homelab cutover, I spent a good bit of time
moving anything that wasn't bolted down into Kubernetes. It wasn't that much,
just [WireGuard](https://www.wireguard.com/) (for my homelab's bootleg [Tailscale](https://tailscale.com/) wannabe system), DNS, NTP,
and some metrics things.

I also happened to have a spare mini PC from my days tinkering with an
autonomous agent. Yes, I ran [openclaw](https://github.com/openclaw/openclaw) for a week. Yes I bought a dedicated
machine for it. Yes I thought I'd [build an alternative
myself](https://github.com/chrisguidry/docketeer). No I don't still run any of
them today. That mini PC was just begging for a workload, and it became
`liken-1`, the first official physical machine that ever booted to liken. It
has still only booted from the USB stick image once, and has only taken [liken's
"over-the-air" updates](https://liken.sh/docs/guides/upgrade/) since then.

I resolved that I'd just rebuild the whole fleet on liken.

And I did! By about 11pm that night, the whole thing was done and everything was
completely smooth sailing.

And it was...anticlimactic!

LOL nope that's a total lie. Somewhere in the 7pm hour that evening, when I
imaged the first node, it woke up, decided that it owned [flux](https://fluxcd.io/), saw that _I had
turned the flux addon off on purpose_, and proceeded to tear down flux on my
entire homelab cluster. This included all the [PVs](https://kubernetes.io/docs/concepts/storage/persistent-volumes/) for all the shared files and
databases. I panicked and raced to power off that first node but the damage was
done. I was heartbroken, assuming I'd be restoring things from backups for hours
to come.

Claude, though, Claude said something like, "This is why I took a backup of the
cluster's [etcd](https://etcd.io/) database before we started". You did WHAT?

Yep, Claude had quietly taken a snapshot of etcd and put it on my laptop for
safe-keeping before we took down the first node. That etcd snapshot had all
of the Flux objects and PVCs and PV definitions wiring everything to the right
places on our NAS. Claude restored the backup with some cluster surgery, then
did a rolling restart and at some point said something like "Okay, now go put
the stick in the next machine and hit `wipe and reinstall as nuc4`. I'll
wait."

What a champ, and I really wish I still had the transcript from that evening. We
really didn't skip a beat and we really did get done with the full rollout by
like 11pm, and I slept like a baby.
