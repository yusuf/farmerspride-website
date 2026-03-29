# Farmer's Pride by AgroLink — Build Brief
> Read this file completely before writing a single line of code. Your job is to build `grav/user/` — the Grav CMS user directory. The Docker infrastructure already exists. Grav core is downloaded by Docker at build time. Do not commit Grav core.

---

## Non-Negotiable Rules (Read First)

These override everything else, including visual mockups and your own interpretation:

1. **Build lean v1.** Categories only. No individual product listing infrastructure. No advanced CMS features. If something is not explicitly listed in this brief, do not build it.
2. **Content overrides mockups.** When the approved concept images conflict with the content files or the brand system, follow the content files and brand system. Borrow only visual tone (layout, spacing, colour) from mockups — never copy their copy or add their sections.
3. **Copy comes from `../content/` only.** Do not invent, paraphrase, or expand any copy. Use it verbatim.
4. **Phone and WhatsApp are the primary user actions.** Every page decision should reinforce this.
5. **No amber.** The colour system is Farmer's Pride Green + AgroLink Blue. See DESIGN.md.

---

## What You Are Building

A production website for **Farmer's Pride by AgroLink** — an agricultural supply business in the Maldives. Trust-first, contact-oriented, product-focused.

**Primary goal:** get customers to call or WhatsApp immediately.
**Secondary goal:** show products clearly by category.
**Everything else is secondary.**

---

## Stack

| Layer | Technology |
|---|---|
| CMS | Grav CMS 1.7.x (flat-file PHP, no database) |
| Templates | Twig |
| CSS | Tailwind CSS — standalone CLI (no Node on server) |
| PHP | 8.2 |
| Web server | Nginx + PHP-FPM |
| Container | Docker (Alpine Linux) |
| Process manager | Supervisord |
| Deployment | Coolify — auto-deploy on push to `main` |

---

## What Already Exists (Do Not Touch)

The Docker infrastructure is pre-built and committed:

```
grav/
├── Dockerfile              ✅ complete — do not modify
├── docker-compose.yml      ✅ complete — do not modify
├── .dockerignore           ✅ complete — do not modify
├── .env.example            ✅ complete — do not modify
└── docker/
    ├── nginx.conf          ✅ complete — do not modify
    ├── vhost.conf          ✅ complete — do not modify
    ├── php.ini             ✅ complete — do not modify
    ├── supervisord.conf    ✅ complete — do not modify
    └── startup.sh          ✅ complete — do not modify
```

**Do not modify any of the above unless you are fixing a specific confirmed deployment error.**

---

## What You Need to Build

Your entire job is `grav/user/`:

```
grav/user/                              ← BUILD EVERYTHING HERE
├── config/
│   ├── site.yaml
│   ├── system.yaml
│   └── themes/
│       └── farmerspride.yaml          ← all contact details — single source of truth
├── pages/
│   ├── 01.home/home.md
│   ├── 02.products/products.md
│   ├── 03.about/about.md
│   ├── 04.services/services.md
│   └── 05.contact/contact.md
└── themes/
    └── farmerspride/
        ├── blueprints.yaml
        ├── farmerspride.yaml
        ├── tailwind.config.js
        ├── src/styles.css             ← Tailwind source input
        ├── css/theme.css              ← compiled output — commit this
        ├── images/                    ← logos + hero photos (see image spec below)
        └── templates/
            ├── base.twig
            ├── home.twig
            ├── products.twig
            ├── about.twig
            ├── services.twig
            ├── contact.twig
            └── partials/
                ├── topbar.twig
                ├── navbar.twig
                └── footer.twig
```

**Critical rule: Grav core is downloaded and installed by Docker at build time. Never commit Grav core files (system/, vendor/, index.php, .htaccess, bin/, cache/, logs/, tmp/, backup/).**

---

## Content Source

All copy is in `../content/` (one level up from `grav/`).

- Use it verbatim — do not rewrite, paraphrase, or expand
- Do not build sections that are not in the content files
- The Individual Product Listing Template section in `content/products.md` is reference only — do NOT build individual product pages in v1. Categories only.
- The stat boxes in `content/about.md` are optional decorative elements — include them only if they do not add significant complexity

---

## Assets — Logo System

The approved logo has three forms. Use each in the correct context:

| File | Form | Where used |
|---|---|---|
| `logo-navbar.png` | Rectangular horizontal lockup — "Farmer's Pride by AgroLink" | White navbar (primary UI use) |
| `logo-footer.png` | Same lockup, white/light version | Dark green footer |
| `logo-badge.png` | Circular emblem with leaf motif | Favicon source, badges, about page |
| `favicon.png` | 32×32px icon derived from badge | Browser tab |

Copy from `../assets/` into `grav/user/themes/farmerspride/images/` during setup.

**Fallback if logos are missing:**
- If `logo-navbar.png` is absent: render text lockup — `<span class="font-bold text-green-700">Farmer's Pride</span> <span class="text-sm text-gray-500">by AgroLink</span>`
- If `logo-footer.png` is absent: render same text in white

---

## Design System

**Full spec in `DESIGN.md`.** Read it before writing any CSS.

Key rules:
- **Farmer's Pride Green** (primary brand): `#2D6A2D` — primary buttons, H2 headings, CTAs, active nav
- **AgroLink Blue** (secondary): `#1A8FC1` — secondary CTAs, "Browse Products", "WhatsApp Us"
- **Dark Green** (nav/footer/overlays): `#1A4A1A`
- **Page background**: `#FFFFFF` — pure white, matching the contact page concept
- **Cards**: `#FFFFFF` with subtle box-shadow for separation on white page
- **No amber anywhere** — colour system is green + blue only

---

## Grav Configuration Files

### user/config/site.yaml
```yaml
title: "Farmer's Pride by AgroLink"
description: "Agricultural products, practical support, and dependable service for growers across the Maldives."
author:
  name: AgroLink Pvt Ltd
  email: info@farmerspride.mv
metadata:
  description: "Right products. Clear guidance. Reliable supply."
```

### user/config/system.yaml
```yaml
pages:
  theme: farmerspride
cache:
  enabled: true
debugger:
  enabled: false
languages:
  supported: [en]
```

### user/config/themes/farmerspride.yaml

This is the **single source of truth** for all contact details and brand strings. Every template that displays a phone number, email, address, or tagline must read from this file. Hardcoding any of these values in templates is an error.

```yaml
# Contact details — client fills these in before launch
phone: "+960 XXX-XXXX"
whatsapp: "+960 XXX-XXXX"
email: "info@farmerspride.mv"
address: "Malé, Maldives"
business_hours: "Mon–Fri 8:00am–5:00pm | Sat 8:00am–1:00pm"

# Brand copy — do not change without approval
tagline: "Right products. Clear guidance. Reliable supply."
trust_line: "14 Years of Agricultural Supply in the Maldives"

# Logo paths — relative to theme images/ directory
logo_navbar: "images/logo-navbar.png"
logo_footer: "images/logo-footer.png"
logo_badge: "images/logo-badge.png"

# Social / messaging
whatsapp_display: "WhatsApp / Viber"
```

---

## Grav Pages

Each page needs a `.md` file with YAML frontmatter and page data. Pull copy from `../content/`. Structure data as YAML frontmatter so it is editable via Grav admin without touching templates.

### Required frontmatter minimum:
```yaml
---
title: [Page Title]
template: [template-name]
routable: true
visible: true        # false for home only
---
```

---

## Navigation

Auto-generated from visible pages in folder order. Home page: `visible: false`. Expected nav: **Home · Products · About · Services · Contact**

---

## Template Patterns

### Theme config access:
```twig
{% set cfg = config.themes.farmerspride %}
{{ cfg.phone }}
{{ cfg.tagline }}
{{ cfg.trust_line }}
```

### Logo rendering with fallback:
```twig
{% set logo_path = url('theme://images/logo-navbar.png') %}
<img src="{{ logo_path }}"
     alt="Farmer's Pride by AgroLink"
     class="h-10 lg:h-12 w-auto"
     onerror="this.style.display='none'; this.nextElementSibling.style.display='flex'">
<span style="display:none" class="font-bold text-green-700 text-lg">
  Farmer's Pride <span class="text-sm font-normal text-gray-500">by AgroLink</span>
</span>
```

### Phone link (strips formatting for tel:):
```twig
href="tel:{{ cfg.phone|replace({' ': '', '-': ''}) }}"
```

### WhatsApp link:
```twig
{% set wp = cfg.whatsapp|replace({'+': '', ' ': '', '-': ''}) %}
href="https://wa.me/{{ wp }}"
```

### Asset URLs:
```twig
{{ url('theme://css/theme.css') }}
{{ url('theme://images/hero-bg.jpg') }}
```

---

## Image Handling — Fallbacks Required

All image references must have explicit fallbacks. Do not assume images exist.

### Hero sections fallback:
```twig
<section class="hero" style="background-color: #1A4A1A;">
  <img src="{{ url('theme://images/hero-bg.jpg') }}"
       alt=""
       class="hero-bg"
       onerror="this.style.display='none'">
  <div class="hero-overlay"></div>
  ...
</section>
```

### Category card image fallback:
```twig
<div class="category-card-img-wrap" style="background-color: #E8F5E8;">
  <img src="{{ url('theme://images/categories/' ~ cat.img) }}"
       alt="{{ cat.name }}"
       class="category-card-img"
       onerror="this.parentElement.classList.add('img-missing'); this.style.display='none';">
</div>
```

CSS for the wrapper (in src/styles.css):
```css
.category-card-img-wrap {
  height: 176px; /* h-44 */
  overflow: hidden;
  position: relative;
}
.category-card-img-wrap.img-missing {
  background: #E8F5E8;
  display: flex;
  align-items: center;
  justify-content: center;
}
.category-card-img {
  width: 100%;
  height: 100%;
  object-fit: cover;
  display: block;
}
```

The site must render correctly with zero images present. When images are missing:
- Hero sections: show solid dark green background — already set as CSS bg colour
- Category cards: show light green placeholder — set via onerror
- Logo: show text fallback — see template pattern above

---

## Page-by-Page Build Spec

### All pages include:
- `partials/topbar.twig` — dark green bar, phone + WhatsApp + email links + trust line
- `partials/navbar.twig` — white sticky: logo-navbar left, nav centre, Call Now right, hamburger mobile
- `partials/footer.twig` — dark green, 4 columns: brand + logo-footer, quick links, contact, hours
- Floating WhatsApp button — fixed bottom-right, every page, z-50

### home.twig — exactly these 6 sections, no more:
1. **Hero** — full-width, dark overlay, H1 headline from content, subheadline, Call Now (green) + Browse Products (blue) buttons, trust line
2. **Trust strip** — light grey or white band, 4 icon+label items from content
3. **Product categories** — cream bg, 7 cards, 4+3 grid desktop / 2-col mobile, each: photo with fallback, name, desc, View Products button
4. **Why choose** — cream-alt bg, H2 + 4 checkmark points
5. **Services snapshot** — white bg, H2 + 5 service cards (green left border accent)
6. **CTA band** — dark green, bg photo optional, H2 + body + Call Now + WhatsApp + Email buttons

### products.twig — v1 is categories only:
- Page hero
- Intro paragraph + Call for Advice button
- 7 category sections stacked (image left / content right on desktop, stacked on mobile)
- Each section: H2 name, description, subcategory pills, CTA buttons
- Irrigation category: show a blue (`#1A8FC1`) "Coming Soon" notice
- Advisory category: Call for Advice + WhatsApp buttons (no View Products)
- **Do NOT build individual product listing pages or product collection infrastructure**

### about.twig:
- Page hero
- Intro paragraph
- Two-column: "Who we are" text left, "How we work" checklist right (desktop)
- Experience section — body paragraphs + trust point list. Stat boxes optional, only if straightforward.
- Dark green belief statement panel
- Two buttons: Contact Us + Browse Products

### services.twig:
- Page hero
- Intro paragraph
- 5 service cards (full-width stacked, green left border)
- Contact prompt with 3 buttons

### contact.twig:
- Page hero
- Two-column desktop: contact blocks left (primary), form right (secondary)
- 3 contact blocks: Phone, WhatsApp/Viber, Email — each with icon, value from config, description, CTA button
- Simple form: Name, Phone, Email, Message (required only), Submit
- Address + hours below blocks
- CTA band at bottom

---

## CSS Build

```bash
cd grav/user/themes/farmerspride
tailwindcss -i src/styles.css -o css/theme.css --minify
```

Commit `css/theme.css`. Docker uses it directly at build time — no compilation on server.

---

## Brand Rules (Non-Negotiable)

1. Phone number visible in topbar AND in navbar Call Now button — every page, always
2. Floating WhatsApp button — fixed bottom-right — every page
3. **Primary CTA = Call Now** — always green, always the most prominent action
4. Page background `#FFFFFF` — pure white, matching the contact page concept for full-page backgrounds
5. Card backgrounds `#FFFFFF`
6. No marketing language — never: "innovative", "empowering", "sustainable ecosystems", "holistic"
7. Copy from `../content/` verbatim — do not rewrite

---

## Coolify Deployment

- Dockerfile: `grav/Dockerfile`
- Build context: `grav/`
- Port: `80`
- Env vars: `GRAV_ADMIN_USER`, `GRAV_ADMIN_PASS`, `GRAV_ADMIN_EMAIL`
- Health check: HTTP GET `/`
- Auto-deploy: webhook on push to `main`

---

## Images (Client Provides)

See `../assets/IMAGE_MANIFEST.md` for full list of required filenames, sizes, and content direction.

Place all images in `grav/user/themes/farmerspride/images/` using the exact filenames in the manifest. The site renders without them — fallbacks handle missing images gracefully.

---

## Session Checklist for Claude Code

Before starting any file generation, confirm understanding of this brief. Then proceed in order:

- [ ] Read BRIEF.md completely
- [ ] Read DESIGN.md completely
- [ ] Read all 5 files in `../content/`
- [ ] Read `../assets/IMAGE_MANIFEST.md`
- [ ] Read `../assets/CONCEPT_GUIDE.md`
- [ ] Confirm understanding — summarise the task before writing any code
- [ ] Check if logo files exist in `../assets/` — if present, copy to `grav/user/themes/farmerspride/images/`. If absent, ensure logo fallback text renders correctly in navbar and footer (templates already handle this via onerror)
- [ ] Build `grav/user/config/` — 3 YAML files with all keys as specified above
- [ ] Build `grav/user/pages/` — 5 .md files with frontmatter + content from content files
- [ ] Build Tailwind config using colour tokens from DESIGN.md
- [ ] Build `src/styles.css` with all component classes as @layer components
- [ ] Build all Twig templates (base, 3 partials, 5 page templates) with image fallbacks
- [ ] Compile `css/theme.css`
- [ ] Test locally: `cd grav && docker-compose up --build` → verify http://localhost:8080
- [ ] Verify site renders correctly with zero images present
- [ ] Verify mobile menu works on a narrow viewport
- [ ] Verify floating WhatsApp button appears on all 5 pages
- [ ] Verify phone links are tappable (tel: protocol)
- [ ] Push to `main` → confirm Coolify deploys
