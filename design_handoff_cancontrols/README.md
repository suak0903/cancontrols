# Handoff: CanControls Redesign

A modern redesign of [cancontrols.com](https://www.cancontrols.com) — single-page corporate site for a Computer-Vision / Image-Understanding company headquartered in Aachen, Germany.

## About the Design Files

The files in this bundle are **design references created in HTML/CSS/JS** — high-fidelity prototypes showing the intended look, behavior, and interactions. They are **not production code to copy directly**.

Your task is to **recreate these designs in the target codebase's existing environment** (e.g. Next.js / Astro / Nuxt / WordPress block theme / whatever the team uses) using its established patterns, component library, and build pipeline. If no environment exists yet, choose the most appropriate framework — for a marketing site like this, **Astro or Next.js with the App Router** are strong defaults.

Treat the bundled HTML as the contract for visuals and interactions. Treat token values (`tokens.css`) as the contract for design system values.

## Fidelity

**High-fidelity (hifi).** Final colors, typography, spacing, and interactions. Recreate pixel-perfectly using the target codebase's component patterns. All values in `tokens.css` are production-ready.

---

## Brand Foundation

- **Brand**: CanControls GmbH — *"The Art of Image Understanding"*
- **Founded**: 2005, Aachen (Germany)
- **Original logo URL**: `https://www.cancontrols.com/wp-content/uploads/General/CCLogo.png` — keep for now; in production, request a clean SVG from the client.
- **Primary accent**: Petrol `#095873` (from the core:form design system, used across sibling brands)
- **On-dark accent**: lighter petrol `#5BB0CF` (use everywhere accent appears on a dark surface — petrol on near-black is unreadable)

---

## Design Tokens

See `tokens.css` for the canonical list. Summary:

### Color

| Token | Hex | Use |
|---|---|---|
| `--ink` | `#0F1620` | Body text on light, headlines |
| `--ink-soft` | `#2A3540` | Secondary body text |
| `--mute` | `#6B7480` | Tertiary text, labels |
| `--paper` | `#F4F0E7` | Primary page background (warm off-white) |
| `--surface` | `#E9E2D2` | Section tint (oat/warm beige) |
| `--paper-soft` | `#FBF8F2` | Card/component background on paper |
| `--dark` | `#0C1218` | Dark sections (hero, contact, feature banner) |
| `--dark-2` | `#11181F` | Secondary dark (cards on dark) |
| `--on-dark` | `#EFEAE0` | Body text on dark |
| `--accent` | `#095873` | **Primary action color** (buttons, italic emphasis on light) |
| `--accent-dark` | `#06425A` | Hover state for `--accent` |
| `--accent-on-dark` | `#5BB0CF` | **Accent on dark sections** (dots, glows, italics on dark) |
| `--rule` | `rgba(15,22,32,.10)` | Dividers/borders on light |
| `--rule-soft` | `rgba(15,22,32,.06)` | Subtle dividers |
| `--on-dark-rule` | `rgba(239,234,224,.14)` | Borders on dark |

**Italic emphasis color on dark**: `#F1D8A6` (warm sand — used for `<em>` inside dark-section headlines).

### Typography

| Token | Family | Loaded from |
|---|---|---|
| `--font-body` | DM Sans | Google Fonts |
| `--font-display` | Bricolage Grotesque | Google Fonts |
| `--font-mono` | JetBrains Mono | Google Fonts |

**Type scale** (clamp-based, responsive):

| Element | Size | Weight | Family | Letter-spacing |
|---|---|---|---|---|
| `h1` | `clamp(40px, 5.8vw, 80px)` | 300 | display | -0.035em |
| `h2` | `clamp(32px, 4.4vw, 56px)` | 300 | display | -0.03em |
| `h3` | `clamp(22px, 2.2vw, 28px)` | 400 | display | -0.02em |
| `body` | 16px | 400 | body | normal |
| `.lead` | `clamp(20px, 2.1vw, 26px)` italic | 300 | display | -0.01em |
| `.label` (section nº) | 11px ALL CAPS | 500 | mono | 0.16em |
| `.btn` text | 11px ALL CAPS | 700 | body | 0.18em |

Italic accent treatment: `<em>` inside headlines is italic, same weight, in `--accent-dark` on light or `#F1D8A6` on dark.

### Spacing & Layout

| Token | Value | Use |
|---|---|---|
| `--nav-h` | 80px (72px mobile) | Header height; `scroll-margin-top` |
| `--container` | 1180px | Max content width |
| `--pad-x` | 40px desktop / 28px tablet / 20px mobile | Container horizontal padding |
| Section vertical padding | 120px desktop / 80px tablet / mobile | All major sections |

### Radius & Shadows

**No border-radius anywhere.** Sharp corners are part of the visual language (matches core:form / Pilaform sibling brands). The only exceptions: the location-pin dot (`50%`) and the compass-rose chip (`50%`) — both decorative.

Shadows are minimal. Only used on:
- Card hover: `box-shadow: 0 14px 32px rgba(0,0,0,.08)`
- Hero logo: `drop-shadow(0 1px 2px rgba(0,0,0,.35))`
- Location-pin glow: layered box-shadow rings using `--accent-on-dark`

### Motion

- Standard transition: `0.25s ease` (most micro-interactions)
- Smooth: `0.35s cubic-bezier(.22, 1, .36, 1)` (card lift, brand mark scale)
- Reveal: `0.6s cubic-bezier(.22, 1, .36, 1)` (area-tile image zoom on hover)
- Marquee speed: `65 px/s` (JS-driven rAF loop)
- Hero parallax: 50% (image scrolls at half page-scroll speed)
- Pin pulse: `2.6s ease-in-out infinite`

---

## Page Structure (in scroll order)

The page is a **single scroll** with anchor links. The nav reflects scroll order.

1. **Header / Nav** (fixed, transparent → dark on scroll)
2. **Hero** (full viewport, dark with parallax bg image + marquee strip)
3. **Intro strip** (4 metric tiles, paper bg)
4. **Manifesto / Mission** (oat surface, 2-col)
5. **Technologie** (5 cards in 3-col bento, paper)
6. **Feature banner** (centered statement, dark)
7. **Bereiche** (7 application areas, asymmetric grid, paper)
8. **Approach / Process** (4-step horizontal strip, oat surface)
9. **Unternehmen / Aachen** (2-col: copy + SVG map, paper)
10. **Kontakt** (2-col: CTA + info card, dark)
11. **Footer** (4-col + legal row, petrol bg)

---

## Components

### `Nav` (header)

- Fixed top, `z-index: 100`, `height: 80px` (72px mobile).
- States:
  - **Default (over hero)**: `background: transparent`, white text, white CTA outline.
  - **Scrolled** (`.scrolled`): `background: rgba(11,16,20,0.86)` + `backdrop-filter: blur(14px) saturate(140%)`, links fade to `rgba(239,234,224,0.85)`, CTA stays petrol.
- Scrolled trigger: `scrollY > 100px` desktop, `> 160px` tablet/mobile.
- Left: original `CCLogo.png` (38px height, white-on-dark with `drop-shadow`).
- Center/right: link group + language flags (🇩🇪 / 🇬🇧 SVG flags) + primary CTA "Projekt anfragen".
- CTA: `padding: 15px 48px`, petrol (`--accent`) bg, white text, no icon.
- Active section: link gets a 1.5px petrol underline (animated width 0→100%, except `#hero` and `#footer`).
- Mobile (`≤1023px`): collapse links into a **hamburger** that opens a full-screen overlay (`.nav__mobile`).

### `MobileMenu` (overlay)

- `position: fixed; inset: 0`, slides in from right (`transform: translateX(100%) → 0`, 0.4s).
- Dark gradient background `rgba(12,18,24,0.97)` + blur.
- Nav links rendered as 2-col rows: `[01]   Technologie` — mono index + display label.
- Hover/focus: index turns `--accent-on-dark`, row indents 4px left.
- Bottom: full-width CTA + contact info + language switcher.
- Close: hamburger ✕ or `Escape`.
- Locks `body` scroll while open.

### `Hero`

- `min-height: 100svh` (small-viewport-height for mobile address-bar correctness).
- **Background image** (`<img class="hero__img">`): the Gesichtsanalyse photo, `object-fit: cover`, `object-position: center 28%`, `opacity: 0.55`, `filter: saturate(.78) contrast(1.05)`, height **140%** (so parallax doesn't reveal void at bottom).
- **Parallax**: JS rAF loop sets `transform: translate3d(0, scrollY * 0.5, 0)` on the image. Respects `prefers-reduced-motion`.
- **Overlay**: layered linear-gradient (top 62% dark → mid clear → bottom 86% dark) + radial petrol glow top-right + radial amber glow bottom-left.
- **Grid texture**: 72px × 72px CSS-painted grid with radial mask, opacity 0.30.
- **Content** (centered vertically, bottom-aligned content block):
  - Mono eyebrow: `IMAGE UNDERSTANDING · AACHEN, GERMANY`
  - H1 (display, 80px max, weight 300): `The Art of Image Understanding.` — "Image Understanding" wrapped in `<em>` (italic + sand color).
  - Lead paragraph (54ch max).
  - Mono sub-row with 4 dot-separated keywords.
  - Two buttons: primary (petrol + arrow) + ghost (white outline).
- **Marquee strip** (bottom of hero, full-width):
  - `position: relative; z-index: 2`, dark backdrop with blur.
  - Auto-scrolls left at 65 px/s.
  - **Touch/mouse drag**: 1:1 finger-follow, releases into a 600ms fling that decays to auto-scroll speed.
  - Track width = `max-content`; contains **two identical copies** of the item list (for seamless wrap at `-half`).

### `IntroStrip`

- Border-bottom `--rule-soft`.
- 4 grid cells: `[mono label]` over `[display value]`.
- Display values: `20 ms`, `7 Anwendungen`, `2005 in Aachen`, `Image Understanding`.
- Italics inside values are `--accent-dark`.

### `Manifesto`

- Surface `--surface`.
- 2-col: large display quote left, body + stat-strip right.
- Stat strip: 3 cells with display numeric + mono label, top-bordered by `--rule`.

### `TechCard` (kurs-card)

- Container: `--paper-soft` background.
- Top **media block**: full-bleed image (240px tall, or 340px for feature variant) with bottom gradient overlay.
- Tag pill (top-left): dark glass background, mono label with petrol dot.
- Index (top-right): `01 / 05` in mono.
- Body: padded 26px; H3 with italic accent word; paragraph (max 46ch); mono "MEHR ERFAHREN" link bottom.
- Hover: `translateY(-3px)` + shadow.
- **Feature variant**: spans `grid-column: 1/2; grid-row: 1/3` (tall left card with bigger media + larger type).
- **Skills variant**: solid dark background, decorative petrol grid pattern in media, large `∞` circle badge in center.

### `FeatureBanner`

- Full-bleed dark section, ~140px vertical padding.
- Centered display quote (max 22ch), mono attribution under it.
- Layered radial gradients (petrol top-right, amber bottom-left) + grid mask.

### `AreaTile`

- Dark tile with bg image, `aspect-ratio: 4/5` (or 8/5 for large variants).
- Top meta-row: pill label + mono index.
- Bottom: H3 title with italic accent.
- Bottom-right: 38×38 arrow chip (white square, dark icon → on hover swaps to `--accent-on-dark` with offset translate).
- Image zooms `scale(1.04)` on hover.
- Variants: `--large` (`grid-column: span 6`, 8:5), `--med` (same), `--third` (`span 4`).

### `Step`

- 4-col strip with vertical divider rules between cells.
- Mono index (`STEP 01`, `STEP 02`, …) in petrol.
- Display H4 with italic accent.
- Body paragraph (max 34ch).

### `Pillar` (mini meta-card)

- Used in the company section. Bordered card, mono key + display value.

### `MapCard` (Aachen location SVG)

- `aspect-ratio: 5/6` (desktop) / `4/3` (tablet) / `1/1` (mobile).
- Dark layered radial gradient bg.
- Inline SVG (`viewBox="0 0 480 600"`) draws a stylized Aachen street map:
  - Building blocks (filled rects, opacity 0.06)
  - Old-town polygon blocks (opacity 0.10)
  - Horizontal + vertical secondary streets (white 0.12–0.14 alpha)
  - 8 radial avenues from city center (white 0.30 alpha)
  - Outer ring road (`Alleenring`) + inner ring (`Grabenring`) in `--accent-on-dark`
  - Dashed rail line, river meander
  - Mono micro-labels: MARKT, PONTSTR., JÜLICHER, ADALBERT, TRIERER, LÜTTICHER, VAALSER, ROERMONDER, HBF, DOM, RATHAUS
- **Pin** (center, animated halo): petrol dot with layered pulse rings.
- City label: display italic "Markt 45" + mono sub "Aachen · seit 2005".
- Corner chips (mono): top = coordinates + "HQ · Markt 45"; bottom = "DEU · NRW" + "CanControls GmbH".
- Bottom-left: 500m scale bar; bottom-right: N compass chip.

### `Contact`

- Dark section, `padding: 140px 0`.
- 2-col: left = label + H2 + lead + 2 buttons (mailto + tel). Right = `InfoCard`.
- `InfoCard`: glass card (`rgba(239,234,224,0.04)` + blur), bordered, 4 rows (Adresse / Tel / Fax / E-Mail). Each row is `[mono key 84px] [display value]`. E-mail value is a link with bottom border.

### `Footer`

- Background `--accent-dark` (petrol-dark `#06425A`).
- 4-col top: logo (inverted to white) + tagline / Unternehmen / Leistungen / Kontakt.
- Bottom strip (mono): copyright + legal links separated by `·`.
- Legal links are NOT underlined and stay light. No active-section underline applies here.

---

## Interactions & Behavior

| Behavior | Implementation |
|---|---|
| Nav transparency toggle | `scroll` listener; `nav.classList.toggle('scrolled', scrollY > THRESHOLD)` |
| Hero parallax | rAF loop; `heroImg.transform = translate3d(0, scrollY * 0.5, 0)px` |
| Active section underline | `IntersectionObserver` on each section; toggles `.is-active` on matching nav link. Excludes hero and footer. |
| Mobile menu open/close | Toggle class on `.nav__mobile` + lock `document.body.overflow` |
| Marquee auto-scroll | rAF loop, 65 px/s, modulo wrap at `-trackHalfWidth` |
| Marquee drag | `touchstart/mousedown` records start; `move` translates 1:1 with `preventDefault` once dx > 4px; `up` releases with fling = (last px/sec) decayed to auto-speed over 600ms |
| Card hover | `translateY(-3px)` + `box-shadow` + image scale |
| Area arrow hover | Background swap to `--accent-on-dark` + small translate |
| Smooth anchor scroll | `html { scroll-behavior: smooth }` |
| Reduced motion | All animations + parallax + marquee disabled under `@media (prefers-reduced-motion: reduce)` |

---

## Responsive

- Breakpoints used: **`1023px`** (tablet+small-desktop collapse) and **`640px`** (phone).
- At `≤1023px`: nav links collapse to hamburger, 2-col grids collapse to 1-col, tech bento collapses to 2-col with feature spanning both, area-tile thirds become halves, map card becomes 4:3 with SVG scaled 92%.
- At `≤640px`: tech grid 1-col, area-thirds full-width, map card becomes 1:1 with SVG scaled 85%, info-card padding tightens.

---

## Assets

| Asset | Source | Notes |
|---|---|---|
| Logo (`CCLogo.png`) | `https://www.cancontrols.com/wp-content/uploads/General/CCLogo.png` | Original from cancontrols.com — request clean SVG from client for production |
| Hero / Tech-card images | All from `cancontrols.com/wp-content/uploads/2015-2016/...` | Reused with original filenames (see `reference/CanControls.html` source) — verify licensing; replace with new client photography if possible |
| Fonts | Google Fonts (DM Sans, Bricolage Grotesque, JetBrains Mono) | Self-host for production (no Google CDN dependency) |
| Map | Inline SVG (hand-drawn, decorative) | Not a real geo map; replace with Mapbox/Leaflet only if interactive panning is needed |
| Flag icons (DE/EN) | Inline SVG flags | Already inline; no external dep |

---

## State Management

Minimal. Only client-side UI state:
- `isScrolled` — nav style toggle
- `activeSection` — for underline indicator
- `isMobileMenuOpen` — overlay visibility + body scroll lock
- `marqueePosition` — internal to rAF loop (not exposed as state)
- `isDragging` — gesture state for marquee

No data fetching, no server state.

---

## Files in this Bundle

```
design_handoff_cancontrols/
├── README.md            ← this file
├── tokens.css           ← all design tokens (drop-in for any project)
├── COPY.md              ← all text content, copy-paste-ready
└── reference/
    └── CanControls.html ← full reference prototype (open in browser)
```

---

## Recommended Implementation Approach

1. **Set up the framework** (Astro or Next.js App Router recommended for this content-driven marketing site).
2. **Drop in `tokens.css`** at the root of your design system or import as CSS Modules / Tailwind theme extension.
3. **Configure fonts** via the framework's font loader (`next/font` or Astro's `<link>` with `display: swap`).
4. **Build components in this order** (each can be tested in isolation):
   1. `Nav` + `MobileMenu` (foundation)
   2. `Hero` (most complex; parallax + marquee)
   3. `IntroStrip`, `Manifesto` (simple grid sections)
   4. `TechCard` + bento grid
   5. `AreaTile` + asymmetric grid
   6. `Step`, `Pillar`, `MapCard`
   7. `Contact` + `InfoCard`
   8. `Footer`
5. **Pull copy from `COPY.md`** into either MDX/Markdown content files or a CMS (Sanity/Storyblok) so the client can edit without code changes.
6. **Test with `prefers-reduced-motion: reduce`** — the prototype handles it; the production build must too.
7. **Lighthouse / accessibility pass** — focus visible rings exist in tokens; the prototype already has `:focus-visible` styles, but verify keyboard nav through the hamburger flow and language switcher.

---

## Questions for the Client

Items to confirm before / during implementation:

- [ ] Clean **SVG logo** (current source is a PNG from their CMS)
- [ ] Licensing on the existing image assets (current site's photos)
- [ ] CMS preference (or static MDX)
- [ ] Real **DE/EN content** for the EN locale (currently the EN flag is non-functional)
- [ ] Final phone/fax — confirm `+49 241 47582260` and `+49 241 47580118` are current
- [ ] Should `Stellen` (jobs) be a real subpage or anchor-jump on the homepage?
