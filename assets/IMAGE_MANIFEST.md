# Image Manifest — Farmer's Pride Website

All images required for the website. Place in `grav/user/themes/farmerspride/images/` using the exact filenames below.

The site renders correctly without any of these — all templates have fallbacks. Add images when they are available and push to GitHub.

---

## Logo Files (from `assets/`)

| File | Context | Notes |
|---|---|---|
| `logo-navbar.png` | White navbar | Rectangular horizontal lockup |
| `logo-footer.png` | Dark green footer | White / light version of above |
| `logo-badge.png` | About page, secondary | Circular emblem |
| `favicon.png` | Browser tab | 32×32px |

---

## Hero Images

Full-width background photos used behind the dark overlay on each page header.

| Filename | Page | Size | Content direction |
|---|---|---|---|
| `hero-bg.jpg` | Homepage hero | 1920×1080px min | Agricultural fields, crops, Maldives context. Wide horizontal framing. |
| `hero-products.jpg` | Products page | 1920×600px | Product display — fertilizer bags, seeds, tools on natural background. |
| `hero-about.jpg` | About page | 1920×600px | Staff assisting a customer, or a grower with healthy crops. Warm and human. |
| `hero-services.jpg` | Services page | 1920×600px | Advisory context — person on phone in a garden or farm setting. |
| `hero-contact.jpg` | Contact page | 1920×600px | Farmer on mobile phone in field. Reinforces "call us" message. |
| `cta-bg.jpg` | CTA band (all pages) | 1920×600px | Dense green crop or plant texture. Dark overlay applied on top. |

**Photo rules:**
- Real photos only — no generic stock setups
- No heavy filters or artificial colour grading
- Maldives context preferred where possible
- People should look natural, not posed
- Fallback: solid `#1A4A1A` dark green — site still looks correct

---

## Category Card Images

Appear in the 7 product category cards on the homepage and products page.

| Filename | Category | Size | Content direction |
|---|---|---|---|
| `categories/cat-fertilizers.jpg` | Fertilizers | 800×600px | Fertilizer bags, granules, liquid bottles on soil or neutral bg |
| `categories/cat-seeds.jpg` | Seeds | 800×600px | Seed packets, seeds in hand, seedling trays |
| `categories/cat-protection.jpg` | Plant Protection | 800×600px | Spray bottles, pest control products, healthy vs affected plant |
| `categories/cat-plants.jpg` | Plants & Landscaping | 800×600px | Green seedlings, ornamental plants, landscaped garden |
| `categories/cat-pots.jpg` | Pots & Growing Supplies | 800×600px | Terracotta and plastic pots, growing media bags |
| `categories/cat-irrigation.jpg` | Irrigation | 800×600px | Drip lines, sprinklers, irrigation fittings — clean product shot |
| `categories/cat-advisory.jpg` | Advisory & Support | 800×600px | Staff member helping customer choose a product |

**Image style for cards:**
- Consistent crop — all 800×600px, object-cover applied
- Neutral or natural backgrounds preferred
- Avoid cluttered compositions
- Fallback: light green background `#E8F5E8`

---

## Notes

- JPEG quality 85% is sufficient for all hero and category images
- Images are served directly from the Grav theme — no CDN required for v1
- After adding images locally, run `git add . && git commit && git push` — Coolify redeploys automatically
- Images can be added at any time after initial launch — the site degrades gracefully without them
