---
title: Managing velocity
slug: managing-velocity
date: 2026-09-05
---

I've been discussing our velocity at length with my colleagues at work. We have
never been able to produce _this much code_ in _this little time_. With a
subsidized coding subscription from one of the frontier labs, each jockeying for
technical hearts and minds, it's never been a better time to be a software
_developer_. Being a software _engineer_, well, that's becoming more challenging
for sure.

Since I first heard it, that line ["software engineering is computer programming
integrated over time"](https://abseil.io/resources/swe-book/html/ch01.html)
keeps reverberating between my ears. I'm vibe coding an entire Kubernetes-based
Linux distribution; how on earth can I keep this chaos under control? To me, the
answer is: MORE AI!

I feel like the liken family of projects is extremely high quality, but I don't
deny that it is entirely vibe-coded. I have barely looked at the code myself,
even though there's still a [strong
instruction](https://github.com/liken-sh/liken/blob/main/AGENTS.md) to treat the
repo as a ["literate
programming"](https://www-cs-faculty.stanford.edu/~knuth/lp.html) project with
extraordinary levels of code commentary inline for anything tricky. How can I
claim that the quality is high without having even seen the code? By scaling up
my _quality control_ and _product ownership_ with AI agents.

This code has been read in full at great levels of detail with adversarial
prompts. Sometimes I just get bored and ask Fable to go look for problems or
gaps or shortcomings. When I got access to
[Astra](https://openai.com/index/gpt-6-astra/) today, the first thing I asked it
to do was find any security or reliability problems in liken proper and to
document them as open problems
([and](https://github.com/liken-sh/liken/blob/main/plans/open-problems/ci-executables-need-immutable-pins.md)
[it](https://github.com/liken-sh/liken/blob/main/plans/open-problems/disruption-approvals-can-be-reused.md)
[found](https://github.com/liken-sh/liken/blob/main/plans/open-problems/machine-operator-credentials-have-fleet-wide-access.md)
[quite](https://github.com/liken-sh/liken/blob/main/plans/open-problems/missing-facts-expose-system-disks.md)
[a](https://github.com/liken-sh/liken/blob/main/plans/open-problems/node-read-errors-bypass-draining.md)
[lot](https://github.com/liken-sh/liken/blob/main/plans/open-problems/release-downloads-can-block-upgrades.md)
[to](https://github.com/liken-sh/liken/blob/main/plans/open-problems/removed-devices-retain-stale-grants.md)
[fix](https://github.com/liken-sh/liken/blob/main/plans/open-problems/retargeting-overwrites-staged-releases.md)).
I continue to have the AI agents ratchet up code coverage and today we started
publishing code coverage reports on the documentation sites
([liken](https://liken.sh/coverage.html),
[media](https://media.liken.sh/coverage.html),
[audio](https://audio.liken.sh/coverage.html),
[bluetooth](https://bluetooth.liken.sh/coverage.html), and
[display](https://display.liken.sh/coverage.html)).

Meanwhile I test the product with an uncompromising eye. I will not let things
rest until every single part of it feels solid and reliable to me, and I can
test at a scale that matches the production of code. Building a system designed
as a love letter to Kubernetes implies a strong level of observability inherent
to the product. A lot of the in-cluster testing we do feeds back as new logging
or CRD `.status` fields that improve the legibility of the system. I've been
running liken as my homelab's only operating system for months now and any
friction I hit I can feed directly back into LLMs to resolve it. Before the last
year or two, I would get too exhausted mentally to _build_ and _test_ and
_product-manage_ my side projects, so it was very easy to make excuses to cut
corners. Now that I've scaled out testing and building, I can put all of my
energy into product-managing.

The commit history of the new `library-operator` tells this story well. It was a
twinkle in my eye in the last devlog, and now just 11 days later it feels better
to me than Jellyfin or [Moonfin](https://moonfin.io/). In 2024, just the work
that went into
[choosing](https://github.com/liken-sh/library-operator/blob/main/plans/rejected/toolkits-other-than-iced.md)
the [`iced`](https://iced.rs/) UI toolkit alone would have been enough to make
me quit this side project by now. Now the fun part to me is actually the pixel
pushing and solving the hardest design questions.

I'm especially proud of the franchises system, all of which would have been far
too exhausting to build without AI. While there are well-established sources for
box sets and collections, there is essentially nothing out there for
representing the narrative story lines of the huge franchises like the MCU or
The Walking Dead. So I had Fable turn a swarm of 20 Sonnets loose on it to
produce https://tangled.org/guid.foo/fiction-franchises to bring this into the
world. I had a few conversations with my daughter about the best way to visually
represent a multiversal timeline in narrative order, and we both agreed that
this was a completely unsolved problem in all of the apps and streaming services
we use. I made a number of
[failed](https://github.com/liken-sh/library-operator/commit/1f93ec61dca5f4a58f35c5c50f9def20f05e3fde)
[attempts](https://github.com/liken-sh/library-operator/commit/daed6ff26e11592beb8fcbecbaeb2366993daf4b)
that I hated, then realized that I could send Claude Design to go out and make
comps for me. It came up with the brilliant ["metro
map"](https://github.com/liken-sh/library-operator/commit/610f60d7b1bcfff4135a8d787568259145d09ea2)
design which we built out last night.

![The franchise page of the media browser, drawn as a metro map over the invented sample catalog](/images/franchise-metro-map.png)

So to those who are growing anxious about the velocity of the code changes and
trying to keep up with it: don't forget to zoom out. Maybe you don't need to
know what the code is doing. Maybe you don't need to steer the shape of the
classes and functions directly. Maybe you should let AIs sweat those details
like we've let compilers sweat the details of turning C into machine code for
many decades now.
