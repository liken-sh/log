# go.mod pins Hugo as a tool directive, so `go tool hugo` builds the
# pinned version from source. The site needs no Hugo install, only
# the Go toolchain.
HUGO := go tool hugo

.PHONY: build
build:
	$(HUGO) --destination dist/site

# -D shows drafts in the preview. A post stays a draft until Chris
# publishes it, so the preview must show what the site will not.
.PHONY: serve
serve:
	$(HUGO) server -D
