---
title: Replacing nuc2
slug: replacing-nuc2
date: 2026-08-04
backfilled: 2026-08-25
---

Due to the sheer humor of the universe, `nuc2` (a venerable old beast of 6
years) suffered a power supply failure of some sort, just one week after we
rolled the fleet to liken. I ordered a new mini PC to take its place.

The cluster carried on with four machines while the replacement shipped. nuc2's
[`Machine`](https://liken.sh/docs/reference/machine/) record read `Lost`, its
scrape targets came out, and the CI runner fleet dropped from five to four.

The replacement, a little Bmax, arrived two days later. Replacing a leader was:
boot the stick, read the hardware report, write the new nuc2 manifest, and
install it as nuc2. It rejoined the leader rotation the same afternoon. From a
dead power supply to a fully replaced leader in two days, and most of that was
shipping.
