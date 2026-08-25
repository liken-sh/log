---
title: Hatching liken
slug: hatching-liken
date: 2026-07-04
backfilled: 2026-08-25
---

Heading into a 10-day stretch of relaxation and lake time, I started thinking
about catching up on some maintenance on my homelab. My homelab has never been
in better shape since the advent of AI coding agents. It has fully automated
image updates with [flux](https://fluxcd.io/); the machines themselves were
fairly well-maintained with [Ansible](https://www.ansible.com/). It was a
shining beacon of Infrastructure-as-Code (perhaps even too much, given some
serious circularity in the fact that my internal
[gitea](https://about.gitea.com/) instance runs on the same cluster it manages,
but alas).

But not everything smelled like fresh cut grass here. The five mini PCs backing
the [`k3s`](https://k3s.io/) cluster were all running [Ubuntu
22.04](https://releases.ubuntu.com/22.04/) and had a gajillion pending updates
requiring reboots. I was 4 minor versions behind on `k3s`. My
[zigbee](https://csa-iot.org/all-solutions/zigbee/) and
[UPS](https://en.wikipedia.org/wiki/Uninterruptible_power_supply) controllers
were running on [Raspberry Pi
2s](https://www.raspberrypi.com/products/raspberry-pi-2-model-b/) (yes, 2s) and
were literally still running [Raspbian](https://www.raspbian.org/), which hasn't
even existed since
[2020](https://www.raspberrypi.com/news/latest-raspberry-pi-os-update-may-2020/).
I was drowning in updates, and there's really no good time to take the cluster
down to apply them.

I started thinking very hard about why I even had Ubuntu and Raspbian in the mix
at all. Just about everything was already running in
[K8s](https://kubernetes.io/), except a few oddballs, like
[WireGuard](https://www.wireguard.com/) and [`bind9`](https://www.isc.org/bind/)
for DNS. Surely any service that can run on a host OS can also run under K8s,
right? Why do I even need SSH on these machines? Can't I just boot straight from
Linux to `k3s`?

It turns out that, yes, yes we can.

Almost.

So the gears start turning: _`k3s` probably doesn't actually expect itself to be
[pid 1](https://0pointer.de/blog/projects/systemd.html) and it would be
thoroughly unreasonable for [Rancher](https://www.rancher.com/) to give it
support for that. So maybe we'd just need a tiny little
[`init`](https://github.com/liken-sh/liken/commit/dec98b0a177e12ce4e59d66be8b6d9d0c4a5c79c)
shim. How does Linux even actually boot up anyway? And how on earth would we
give a pod access to a device like a GPU or a zigbee dongle if there's no
[udev](https://www.freedesktop.org/software/systemd/man/latest/udev.html)
running? Do there need to be users? What does [systemd](https://systemd.io/)
actually do?_

So I started pulling threads to see what I could learn here. And it didn't take
long before [Claude](https://claude.com/claude-code) and I had a very small
[proof-of-concept booting
up](https://github.com/liken-sh/liken/commit/3d35e26df8ec1ad1750ada3419072265adbd5674)
on [QEMU](https://www.qemu.org/). I'm not even sure when I could [first run
`kubectl` against
it](https://github.com/liken-sh/liken/commit/4c7bc63d6fd4f448e37b0833b5ec9e282e9ca63e),
but from that moment, I knew for sure I was going to take this to its logical
conclusion.

(And yes, I did still spend plenty of time with my family by the lake!)
