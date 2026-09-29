# Assets Repo

This repository exists to keep all assets for Chaostreff Osnabrück e.V. and their hackspace Rabbithole in one place. Please use the vectorized versions whenever possible. Some things might be work in progress. When adding new things, please make sure to choose self descriptive names and folders.

## Licensing

License information follows the [REUSE specification](https://reuse.software/). See [`REUSE.toml`](REUSE.toml) for the full details. A summary:

| Path | Copyright | License |
|------|-----------|---------|
| `diday/events/` | Nils Israel, Stella Schiffczyk, MultisampledNight | CC0-1.0 AND CC-BY-4.0 |
| `diday/event-banner/` | Benjamin Zöllner | pending |
| `diday/talk-diday-www/` | Nils Israel and third parties (see below) | CC-BY-NC-4.0 and others |
| `chaostreff/`, `chaostalks/`, `rabbithole/`, `osna.social/` | Chaostreff Osnabrück e.V. | pending |
| `fonts/` | respective authors | OFL-1.1 |

* The DIDAY logo embedded in `diday/events/` is © 2026 Stella Schiffczyk, licensed CC-BY-4.0, from [DI-Day/website](https://codeberg.org/DI-Day/website).
* The pixeled background in `diday/events/` is © 2025 MultisampledNight, licensed CC-BY-4.0, from [DI-Day/creative-identity](https://codeberg.org/DI-Day/creative-identity).
* The Chaostreff Osnabrück e.V. logo embedded in `diday/events/` has no open license (all rights reserved). If you reuse or adapt these graphics, you must replace or remove the Chaostreff Osnabrück e.V. logo.

### `diday/talk-diday-www/` - "Digital Independence Day: Wieso, weshalb, warum?" talk

Marp slide deck for the DIDAY talk given at Digitale Woche Osnabrück, 2026-09-24. The talk's own content is © 2026 Nils Israel, licensed **CC-BY-NC-4.0 (non-commercial)**. `slides.md` also quotes third-party sources directly; those quotations are individually referenced in-slide, not separately license-annotated. Fonts and the Chaostreff logo are symlinked in from `fonts/` and `chaostreff/logo/` and carry those directories' licenses. Bundled third-party assets:

* The DIDAY logo/favicon are © 2026 Stella Schiffczyk, CC-BY-4.0 (same source as `diday/events/`).
* `assets/icons/mail.svg` is from [Lucide](https://lucide.dev), © Lucide Contributors, ISC.
* `assets/icons/mastodon.svg` and `matrix.svg` are from [Simple Icons](https://simpleicons.org), © Simple Icons Collaborators, CC0-1.0.
* `assets/twemoji/` is [Twemoji](https://github.com/twitter/twemoji), © Twitter, Inc and other contributors, CC-BY-4.0.
* `assets/media/nichts-zu-verbergen.jpg` is © Alex Snaps, CC-BY-2.0 ([Flickr](https://www.flickr.com/photos/alexsnaps/7166752339/)); see the in-slide credit.
* `assets/media/diday-39c3.jpg` is a still from the "Die Känguru-Rebellion" talk at 39C3, via [tube.funfacts.de](https://tube.funfacts.de/w/71fg7mAm2AqyEPxXNAgEpn), **CC-BY-NC-4.0 (non-commercial)** - see the in-slide credit.
* `assets/media/map_events.jpg` is a screenshot of [events.diday.org](https://events.diday.org) (built and run by CCC Flensburg), which renders its map with [OpenStreetMap](https://www.openstreetmap.org/copyright) data, © OpenStreetMap contributors, ODbL-1.0. The screenshot itself is © Nils Israel, CC-BY-NC-4.0 like the rest of his own talk content; the map data within it is ODbL-1.0; the platform's own content/branding is not covered by either license.
* `assets/media/rabbithole-left.jpg` and `rabbithole-right.jpg` are crops of [`rabbithole/inside/long-exposure.jpg`](rabbithole/inside/long-exposure.jpg), © Tim Klausmeyer, **CC-BY-NC-4.0 (non-commercial)**. This overrides the general "pending" license shown for `rabbithole/` in the table above - that one photo is externally licensed, not Chaostreff Osnabrück e.V. all-rights-reserved.
* The deck also displays the Chaostreff Osnabrück e.V. logo (see above, no open license).

## Chaostreff Osnabrück Logo

The font used in our logo is [DejaVuSans Mono](https://github.com/dejavu-fonts/dejavu-fonts). Because not all systems have this font installed, text should be converted to paths so it renders the same on all machines.
