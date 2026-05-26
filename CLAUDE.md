# CanControls Redesign Prototype

Static one-page HTML/CSS/JS prototype rebuilding the CanControls site ([cancontrols.com](https://www.cancontrols.com)) — a Computer Vision / Image Understanding company in Aachen, Germany (founded 2005 by Dr. Ulrich Canzler).

This is a **handoff prototype** based on the design system in [design_handoff_cancontrols/](design_handoff_cancontrols/). The production team will rebuild in Next.js/Astro/Vue using the prototype as the visual + interaction contract.

Deployed at https://ak0903.github.io/.

## Project layout

```
.
├── index.html                # Full one-pager (HTML + inline CSS + inline JS)
├── README.md                 # Handoff-agent instructions (from Claude Design)
├── fonts/                    # 4× variable woff2 (self-hosted, no Google Fonts)
├── media/                    # 23 images: hero / tech / bereich photos + award logos + favicon
└── design_handoff_cancontrols/
    ├── README.md             # Full design-system docs (color, type, components, breakpoints)
    ├── COPY.md               # Source copy
    ├── tokens.css            # Canonical design tokens
    ├── assets/               # Original image download scripts
    └── reference/CanControls.html   # Original prototype reference
```

## Hard constraints

- **Fully offline-runnable.** Double-click `index.html` and it works — no Google Fonts, no CDN, no external image URLs. Fonts in `fonts/`, images in `media/`. `mailto:` / `tel:` links are fine (no network).
- **No `border-radius` anywhere.** Sharp corners are part of the brand language. Exceptions: location-pin dot, compass-rose chip — both decorative `50%`.
- **`<img>` over `background-image`** for content photos in cards (Bereiche tiles use real `<img class="area__img">` with `object-fit:cover` — `background:cover` shorthand had cross-browser cropping quirks).
- **No Google Maps embed.** Aachen location is hand-drawn inline SVG (`.map-card`).

## Section order

Mono labels (`001 — Mission`, `002 — Technologie`, …) show section numbers in the section headers.

| # | Section | ID | Notes |
|---|---|---|---|
| Hero | `#top` | dark, parallax bg, marquee strip |
| 001 | Mission / Manifesto | — | oat surface |
| 002 | Technologie | `#technologie` | 5 cards, bento layout (1.4fr/1fr/1fr), 1 feature spanning 2 rows |
| — | Feature banner | — | dark, centered quote |
| 003 | Bereiche | `#bereiche` | 7 cards, 4-col grid, Automobilbau is feature (`span 2`) |
| 004 | Ansatz / Approach | — | oat surface, 4-step strip |
| 005 | Unternehmen | `#unternehmen` | copy + Aachen SVG map, `align-items:end` so map bottom = pillars bottom |
| 006 | Anerkennung | `#anerkennung` | 5 awards + 1 partner card; logos top-right at 32 px |
| 007 | Karriere | `#stellen` | 4 job categories, oat surface |
| 008 | Kontakt | `#kontakt` | dark — H2/lead left, form right (no info-card, footer has all addresses) |
| — | Footer | — | petrol-dark `--accent-dark`, full contact info |

## Design tokens (excerpt — full list in `design_handoff_cancontrols/tokens.css`)

| Token | Value | Use |
|---|---|---|
| `--accent` | `#095873` | Petrol — buttons, italic accent on light |
| `--accent-dark` | `#06425A` | Hover for accent |
| `--accent-on-dark` | `#5BB0CF` | Petrol on dark sections (petrol on near-black is unreadable) |
| `--paper` | `#F4F0E7` | Warm off-white page bg |
| `--surface` | `#E9E2D2` | Oat section tint |
| `--paper-soft` | `#FBF8F2` | Card bg on paper |
| `--dark` | `#0C1218` | Dark section bg |
| `--ink` | `#0F1620` | Body text on light |
| `#F1D8A6` | (literal) | Warm sand — italic emphasis on dark headlines only |

Fonts: **DM Sans** (body, variable wght), **Bricolage Grotesque** (display, variable opsz+wght), **JetBrains Mono** (mono labels, variable wght). All `.woff2` files in `fonts/`, loaded via inline `@font-face`.

## Component conventions

- `.kurs-card` — canonical content card. Photo media on top, body below (H3 with italic accent, paragraph, `Mehr erfahren` mono link). Used in both Technologie AND Bereiche sections (Bereiche refactored away from the old full-bleed `.area` tiles).
- Photo media uses `::before` pseudo-element with `background-image` so the image can `transform:scale(1.04)` on `.kurs-card:hover .m-<name>::before` without affecting the tag pill or section counter (which are children of `.kurs-card__media`).
- Card hover effect = **box-shadow only** (`0 14px 32px rgba(0,0,0,.08)`). No `translateY` — that felt twitchy in early iterations.
- Section labels: `<span class="label">003 — Bereiche</span>` (mono caps, petrol-dark on light); `<span class="label label--on-dark">008 — Kontakt</span>` on dark sections.
- Section padding: `80px 0` desktop, `54px 0` tablet/mobile. Dark hero-style sections (`.feature-banner`, used to be `.contact`) at `94px 0` desktop. (Originally `120px / 140px / 80px` — globally reduced 33 % per user.)

## Interactions

- **Nav transparency**: scroll listener toggles `.scrolled` on `<header class="nav">` past 100 px desktop / 160 px tablet+mobile.
- **Hero parallax**: rAF loop sets `transform:translate3d(0, scrollY*.5, 0)` on `.hero__img`. Respects `prefers-reduced-motion`.
- **Active section indicator**: scroll-spy in `<script>` toggles `.is-active` on `[href^="#"]` anchors inside **both** `.nav__links` (desktop) and `.nav__mobile-links` (mobile).
- **Mobile menu**:
  - Width: `clamp(300px, 45%, 440px)` — never full-width, even on phones. Slides in from right.
  - Height: `100vh; 100lvh;` (cascade) — `lvh` is stable AND fills the full screen when the URL bar collapses. `svh` and `bottom:0` were tried and rejected (gap / twitch respectively).
  - `overflow:hidden` so a scrollbar can never appear, no matter what.
  - Internal `.nav__mobile-art` has a fixed `height:240px` (was `flex:1` originally — that pushed icons off-screen on phones with URL bar showing).
  - Closes on: Escape key, link click, OR click outside menu (excluding burger button itself).
- **Marquee** under hero: rAF auto-scroll at 65 px/s, touch+mouse drag with 600 ms fling-release.
- **Forms**: contact form `cfSubmit()` is prototype-grade — opens user's `mailto:` client with prefilled subject + body. **Production must POST to a real endpoint.**

## Things tried & rolled back (don't reintroduce)

| What | Why rolled back |
|---|---|
| `transform:translateY(-3px)` on card hover | User: "Die Technologiekarten twitchen so nach oben" |
| Google Fonts CDN `<link>` | Site must run offline by double-clicking `index.html` |
| `background:cover` shorthand for Bereiche tiles | Inconsistent cropping; switched to `<img class="area__img">` with `object-fit:cover` |
| Mobile menu `height:100svh` | Left a visible gap when URL bar collapsed; use `100lvh` instead |
| Mobile menu `bottom:0` | Caused twitch during scroll when URL bar changed; use explicit height |
| Mobile menu mail/phone icons removed | User restored them ("das meinte ich nicht"); leave them |
| `.info-card` in `.contact__inner` | User: footer already has all addresses |

## Unused media (kept for future use)

These files are downloaded but not referenced — keep until the client decides:

- `Auszeichnungen.jpg`, `CCLogo-trans.png`, `Kompetenzen.jpg`, `Partnerschaften.jpg`, `Stellenangebote.jpg`

A Microsoft "unternimm was." logo is **not** downloaded — the partner card on `#anerkennung` is intentionally logo-less.

## Original-content gaps

The original cancontrols.com `/bereiche` page only has body copy for **Automobilbau**. For the other 6 areas (Luft- und Raumfahrt, Medizintechnik, Straßenwesen, Unterhaltung, Exponate, Sicherheit) I wrote concise 2-sentence German placeholders in the brand voice. The client should review or replace these before launch.

## Open client items (carry forward)

- Clean **SVG logo** (current is a PNG from the CMS)
- Licensing on existing image assets (current site's photos, faces may need model release)
- CMS preference (or static MDX)
- Real **DE/EN content** for EN locale (currently the EN flag is decorative)
- Confirm phone/fax: `+49 241 47582260` / `+49 241 47580118`
- Real copy for the 6 Bereiche without source text
- Microsoft "unternimm was." logo if the partner card should display one
- Backend endpoint for the contact form
