---
title: Okay, this thing might be real
slug: okay-this-thing-might-be-real
date: 2026-07-10
backfilled: 2026-08-25
---

After a crazy week of hacking, my conviction really started to sharpen that I
had something really interesting on my hands. It was the server Linux
distribution I'd always wanted: [Kubernetes](https://kubernetes.io/). We'd made something that I wanted,
so it might be something someone else wanted too.

I was still in a mode where I was laser-focused on replacing the distro of my
homelab, but I took a beat to make sure the project was real. I made a [GitHub
org](https://github.com/liken-sh), I gave it [a website](https://liken.sh/). I even started the first version of that website
on a little 1GB [Linode](https://www.linode.com/).

![Deployed my blog on Kubernetes](/images/deployed-my-blog-on-kubernetes.jpg)

Needless to say, I've since rethought that deployment architecture. At the time
I felt that I should have at least one place to dogfood it for "real". A cloud
provider instance did serve well as a real persistent deployment, but the true
endgame was always physical hardware, which would take another couple of weeks.
