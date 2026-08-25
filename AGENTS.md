# log.liken.sh

This repository is the liken devlog, a written journal of the project,
served at log.liken.sh. Chris writes every post.

## The content rule

Do not write, draft, or edit the body or the title of a post. There
are no exceptions: no test posts, no placeholder text, no sample
sentences, no rewrites for style. A stub may hold front matter only.

When Chris asks in the current conversation, and only then, you may:

* Report spelling and grammar problems in a post. Report them as a
  list. Do not apply a fix unless Chris says to apply it.
* Give a quote in your own voice for Chris to place. Chris attributes
  the quote to you in the post.

## Everything else

The rest of the repository is normal collaborative work: the layout
templates, the Hugo configuration, the theme, the build, hosting, and
DNS. Help with those freely.

## Where posts live

A post lives at `YYYY/MM/DD-slug.md` in the repository root, named
for the day it covers, and serves at `/YYYY/MM/DD/slug/`. Its front
matter carries a `slug` matching the filename's slug, so the URL
drops the `DD-` prefix. A backfilled post carries `backfilled: <date written>`, while `date`
stays the day the post is about.
Each new year adds one `permalinks` line in `hugo.yaml`, and nothing
else.

## Building the site

* `make build` renders the site to `dist/site`.
* `make serve` runs a local live preview with drafts visible.

The theme is the shared brand repository, taken as a git submodule at
`themes/brand`, the same pattern the other liken sites use.
