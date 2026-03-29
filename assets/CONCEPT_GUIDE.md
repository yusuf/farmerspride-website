# Concept Image Guide — Farmer's Pride Website

This file tells Claude Code exactly which parts of the approved concept images to follow, which to use for visual tone only, and which to ignore. Read this before building any templates.

**The client approved these images as direction, not specification.** The content files and BRIEF.md define what gets built. These images define how it looks.

---

## Design Anchor — Contact Page (Image 4)

**Use this image as the global design reference for all structural elements.**

This is the most grounded and implementable concept. Build the following to match it precisely:

### Navbar (apply to every page)
- Background: white `#FFFFFF`
- Logo: left-aligned
- Navigation links: centred
- Primary CTA button: right side, dark green background, white text — "Call Us" / "Call Now"
- Single-layer navbar — no separate topbar above it in this implementation
- Sticky on scroll

### Page background (apply to every page)
- Pure white `#FFFFFF`
- Cards sit on white with subtle box-shadow for separation

### Contact blocks (contact page only)
- Three blocks stacked: Phone, WhatsApp, Email
- Each: dark green icon circle left, channel name bold, number/address, one-line description, CTA button
- Light green tint background on each block (`#E8F5E8`)

### Footer (apply to every page)
- Background: dark green `#1A4A1A`
- Multi-column layout
- White text throughout
- Contact info with clickable links

### What to ignore from this image
- The amber/orange "Send Message" button colour — the colour system uses AgroLink Blue (`#1A8FC1`) for secondary CTAs, not amber
- The "Gallery" nav item — not in the site structure
- The map embed — optional, include only if straightforward
- The social media icons row — include if time allows, not required for v1
- The "Partnering with Maldivian Farmers for a Better Tomorrow" footer tagline — use the approved tagline: "Right products. Clear guidance. Reliable supply."

---

## Homepage (Image 5)

**Use structurally. This is the most aligned concept with the content system.**

### What to use:
- Overall page layout and section rhythm
- Hero: full-width photo, dark overlay, white headline, two buttons side by side, trust line below
- Trust strip layout: white band with icons and labels separated by dividers
- Product category grid: 4 cards top row, 3 cards bottom row, centred
- "Why Choose" section: H2 + checklist with green tick marks
- CTA band at bottom: dark green background, white text, three buttons side by side

### What to ignore:
- The "Farmer's Pride" / "by AgroLink" logo treatment shown — use the actual approved logo files
- The amber "Browse Products" button colour — use AgroLink Blue (`#1A8FC1`) instead
- The "Whats4pp Us" label — use "WhatsApp Us"
- Any copy shown in the image — use content/home.md verbatim

---

## Products Page (Image 1)

**Use for visual tone and card style only. Do not follow the page structure literally.**

### What to use:
- Category card visual style: image top, name bold below, short description, button
- Image treatment: consistent crop height, object-cover
- Section heading style with horizontal rules

### What to ignore entirely:
- Tab / filter bar ("All, Seeds, Fertilizers & Compost...") — do NOT build
- "Featured Products" section — do NOT build
- "Best Sellers" section with prices — do NOT build
- Individual product cards with prices (Chilli Seeds MVR 50 etc.) — v1 is categories only
- "Gallery" nav item — not in the site structure
- "Follow Us" footer column — not required for v1

### Build this instead:
- 7 category sections stacked (as specified in BRIEF.md)
- Each section: image left + content right on desktop, stacked on mobile
- Category name H2, description, subcategory pills, CTA buttons

---

## About Page (Image 2)

**Use for visual tone only — two-column layout with image. Do not follow the page structure.**

### What to use:
- Overall two-column layout style (text left, image right on desktop)
- The warm, human photography style (real people, real context)
- Section heading treatment

### What to ignore entirely:
- "Meet Our Team" section with named profiles (Ahmed Rasheed, Aisha Hassan, Mohamed Ali) — do NOT build. The client has not approved staff profiles. This section does not exist in content/about.md.
- "Mission & Values" with three icons (Educate & Inspire, Quality Products, Community Support) — do NOT build. These labels do not match the brand system.
- "Why Choose Us?" with "Local Expertise / Personalized Service / Sustainable Solutions" — do NOT use. These labels are not in the content files.
- "Growing Knowledge, Growing Communities" subheadline — do NOT use. Not approved copy.
- "Friendly, Knowledgeable, Here to Help You Grow" tagline — do NOT use.
- "Partnering with Maldivian Farmers for a Better Tomorrow" — do NOT use.
- The green topbar / contact bar shown — the navbar design follows the contact page reference

### Build this instead:
- Follow about.twig spec in BRIEF.md exactly
- Pull all copy from content/about.md verbatim
- Use two-column layout for "Who we are" + "How we work"
- Include experience section with trust points
- Include dark green belief statement panel

---

## Services Page (Image 3)

**Ignore structurally. The business model shown in this concept is wrong for this client.**

### What to ignore entirely:
- "Agricultural Training / Workshops & Education" — this business does not offer training programmes
- "Market Access & Distribution / Connecting to Markets" — not a service AgroLink provides
- "Farm Support & Resources / Tools & Assistance" — misleading framing
- "Sustainability Initiatives / Eco-Friendly Solutions" — not in the brand system
- "Partnering for a Better Future" — not approved copy
- "Empowering Farmers, Strengthening Communities" — not approved copy
- The amber/orange CTA buttons — use AgroLink Blue (`#1A8FC1`)

### What to use:
- The two-column card grid layout style (image + content)
- The card visual treatment

### Build this instead:
- Follow services.twig spec in BRIEF.md exactly
- Pull all copy from content/services.md verbatim — the five services are: Product Guidance, Landscaping Support, After-Sales Support, Supply for Projects, Phone & Messaging Assistance

---

## During the Claude Code Session — Image Sharing Sequence

Share images at the right moment in the build session, not all at once at the start:

| Build phase | Image to share | What to say |
|---|---|---|
| Tailwind setup + base styles | Image 4 (contact) | "Match the navbar, footer, and page background from this" |
| Navbar + footer partials | Image 4 (contact) | "Build exactly this navbar and footer" |
| Homepage template | Image 5 (homepage) | "Match the section layout and visual rhythm — not the copy" |
| Products template | Image 1 (products) | "Card visual style only. No tabs, no featured products, no best sellers." |
| About template | Image 2 (about) | "Two-column layout style only. No team section. Use content/about.md verbatim." |
| Services template | None | "Use content/services.md only. The services mockup is not appropriate for this business." |
| Contact template | Image 4 (contact) | "Match this structurally — it is the design anchor." |

**If Claude Code asks which image to follow for a disputed element, always cite this file as the authority.**
