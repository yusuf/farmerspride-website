# Farmer's Pride — Design System
> Reference for all visual decisions. Claude Code reads this before writing any CSS or templates.

---

## Logo & Brand Colour Logic

The approved logo defines the two-brand colour system:

| Brand | Colour | Hex | Role |
|---|---|---|---|
| **AgroLink** | Blue (left plant in logo) | `#1A8FC1` | Corporate identity, secondary actions |
| **Farmer's Pride** | Green (right plant in logo) | `#2D6A2D` | Primary brand, customer-facing elements |

The website is **Farmer's Pride by AgroLink** — so green leads, blue supports.

---

## Design Anchor

**The contact page concept is the visual reference for all global elements.**
Build the navbar, footer, and page background to match Image 4 (contact page) exactly.
Other concept images provide section-level inspiration only — see `assets/CONCEPT_GUIDE.md` for
explicit instructions on what to use and what to ignore from each image.

---

## Approved Visual Direction

The client approved concept images showing:
- White page background (#FFFFFF) — as shown in the contact page concept
- White sticky navbar with logo left, nav centre
- Dark navy-green bar above navbar with contact details
- Full-width hero photos with dark overlay and white text
- White product/category cards with subtle box-shadow — shadow provides separation on white page
- AgroLink Blue secondary buttons alongside Farmer's Pride Green primary buttons
- Dark green footer
- Floating WhatsApp button bottom-right

---

## Colour Palette

### Farmer's Pride — Green (Primary Brand)
```
--fp-green-950:  #0A1F0A    deepest shadow
--fp-green-900:  #1A4A1A    navbar bg, footer bg, dark overlays
--fp-green-800:  #1E5C1E
--fp-green-700:  #2D6A2D    PRIMARY — buttons, headings, section titles
--fp-green-600:  #3A7D3A
--fp-green-100:  #E8F5E8    light section backgrounds, card tints
--fp-green-50:   #F1FAF1
```

### AgroLink — Blue (Corporate Identity / Secondary)
```
--al-blue-800:   #0F5A7A    deep blue
--al-blue-700:   #1A8FC1    PRIMARY BLUE — AgroLink identity, secondary CTAs
--al-blue-600:   #2BA3D9
--al-blue-100:   #D6EAF8    light blue tints, info panels
--al-blue-50:    #EBF5FB
```

### Page Backgrounds
```
--page-bg:    #FFFFFF    MAIN PAGE BACKGROUND — pure white
--cream-50:   #FDFCF8
--cream-100:  #F7F4EE    Available for section alternates if needed
--cream-200:  #EDE8DC    alternate section backgrounds
--cream-300:  #DDD5C4
```

### Text
```
--dark:   #1A1A1A    headings, primary text
--body:   #3D3D3D    body text
--muted:  #6B6B6B    secondary / caption text
--white:  #FFFFFF
```

### Utility
```
--gray-line:  #D0D0D0    dividers, borders
--whatsapp:   #25D366    WhatsApp floating button
```

### Tailwind Config
Map these as custom colours in `tailwind.config.js`:
```js
theme: {
  extend: {
    colors: {
      // Farmer's Pride Green — primary brand
      green: {
        950: '#0A1F0A',
        900: '#1A4A1A',
        800: '#1E5C1E',
        700: '#2D6A2D',
        600: '#3A7D3A',
        100: '#E8F5E8',
        50:  '#F1FAF1',
      },
      // AgroLink Blue — corporate identity / secondary
      blue: {
        800: '#0F5A7A',
        700: '#1A8FC1',
        600: '#2BA3D9',
        100: '#D6EAF8',
        50:  '#EBF5FB',
      },
      // Page backgrounds
      cream: {
        50:  '#FDFCF8',
        100: '#F7F4EE',   // alternate sections only
        200: '#EDE8DC',
        300: '#DDD5C4',
      },
      // Text
      dark:  '#1A1A1A',
      body:  '#3D3D3D',
      muted: '#6B6B6B',
    }
  }
}
```

---

## Typography

### Font
- **Family**: Inter (Google Fonts)
- **Load in base.twig**: `https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap`
- **Fallback**: `system-ui, -apple-system, sans-serif`

### Scale
```
Hero headline:    clamp(2rem, 5vw, 3.5rem)   weight 700   line-height 1.1
Page H1:          2.5rem → 3rem               weight 700   line-height 1.15   color: #1A1A1A
Section H2:       1.75rem → 2.25rem           weight 700   line-height 1.2    color: #2D6A2D
Subsection H3:    1.25rem → 1.5rem            weight 700   line-height 1.3    color: #1A1A1A
Body:             1rem                         weight 400   line-height 1.6    color: #3D3D3D
Small / meta:     0.875rem                     weight 400   line-height 1.5    color: #6B6B6B
Label (caps):     0.75rem                      weight 700   tracking: 0.1em    color: #2D6A2D  UPPERCASE
```

---

## Spacing System

Use these consistently:
```
XS:    4px    gap between icon and label
S:     8px    button internal padding (sm)
M:    16px    paragraph spacing
L:    24px    card gap
XL:   32px    between content blocks
2XL:  48px    section sub-elements
3XL:  64px    section top/bottom padding (mobile)
4XL:  80px    section top/bottom padding (desktop)
```

Tailwind equivalents: `gap-4`, `gap-6`, `py-14 md:py-20`, `px-4 sm:px-6`
Container: `max-w-7xl mx-auto px-4 sm:px-6`

---

## Component Patterns

Define all of these as Tailwind `@layer components` in `src/styles.css`.

### Buttons

```
.btn-primary
  bg: #2D6A2D  (Farmer's Pride Green)
  text: white   hover: #1E5C1E
  padding: px-6 py-3   font: semibold   border-radius: 0.375rem
  focus ring: green-700

.btn-secondary
  bg: #1A8FC1  (AgroLink Blue)
  text: white   hover: #0F5A7A
  Same padding / radius
  focus ring: blue-700

.btn-outline
  bg: transparent  border: 2px white  text: white
  hover: bg-white text-green-900
  For use on dark green backgrounds

.btn-outline-green
  bg: transparent  border: 2px #2D6A2D  text: #2D6A2D
  hover: bg-green-700 text-white
  For use on light / cream backgrounds

.btn-sm    px-4 py-2 text-sm
.btn-lg    px-8 py-4 text-lg
```

**Button colour usage:**
- **Primary (green)**: Call Now, View Products, main page CTA — anything that drives direct contact
- **Secondary (blue)**: Browse Products, WhatsApp Us, Email Inquiry, secondary actions
- **Never use amber** — the approved colour system uses green + blue, not green + amber

### Cards
```
.card
  bg: white  border-radius: 0.625rem
  box-shadow: 0 2px 8px rgba(0,0,0,0.08)
  hover shadow: 0 8px 24px rgba(0,0,0,0.12)
  overflow: hidden

.category-card    extends .card — image top, content below
.service-card     white bg, border-left: 4px solid #2D6A2D, p-6
.contact-block    bg: #E8F5E8, border: 1px solid #d1e9d1, rounded, flex row with icon
.product-card     extends .card — image top, specs + price + CTA below
```

### Layout Components
```
.hero
  min-height: 480px (mobile) → 600px (desktop)
  bg: #1A4A1A  overflow: hidden  position: relative
  background image with gradient overlay: rgba(26,74,26,0.65) → rgba(26,74,26,0.4)

.page-hero
  min-height: 200px (mobile) → 260px (desktop)
  Same treatment, shorter

.cta-band
  bg: #1A4A1A  py-14 md:py-20  text-center
  Optional bg image with opacity-20 overlay

.trust-strip
  bg: white  border-bottom: 1px solid #E5E7EB
  flex row, items centred, gap and dividers between items
  4 items: icon + label

.section          py-14 md:py-20  bg: #FFFFFF        (primary sections)
.section-alt      py-14 md:py-20  bg: #F7F4EE    (alternate sections — use sparingly)

.section-title-ruled
  H2 with ::before and ::after horizontal rules
  Rules: 1px height, #D0D0D0, max-width 120px each side
```

### Navigation
```
.topbar
  bg: #1A4A1A  text: white  text-sm
  Contains: trust line left  |  phone + WhatsApp + email right

.navbar
  bg: white  sticky top-0 z-50
  border-bottom: 1px solid #F3F4F6  subtle box-shadow
  Height: 64px mobile → 80px desktop
  Contains: logo left | nav links centre (desktop) | Call Now button right | hamburger (mobile)

Nav links:
  color: #1A1A1A  font: medium
  hover: color #2D6A2D
  active: color #2D6A2D  border-bottom: 2px solid #2D6A2D

Mobile menu:
  bg: white, stacked links, border-bottom between each
  Two buttons at bottom: Call Now (green) + WhatsApp Us (blue)

.footer
  bg: #1A4A1A  text: white
  4-column grid desktop, 2-column mobile
  Columns: Brand (logo + tagline), Quick Links, Contact, Visit/Hours
  Bottom bar: border-top #1E5C1E, copyright centred
```

### Form Elements
```
.form-input
  border: 1px solid #D1D5DB  border-radius: 0.375rem
  padding: px-4 py-3  bg: white  color: #1A1A1A
  focus: ring-2 ring-green-700 border-transparent
  placeholder: color #9CA3AF

.form-label   text-sm font-semibold color #1A1A1A  mb-1.5
.form-group   mb-5
```

---

## Layout Rules

1. Left-align all body text. Centre only short headings and section labels.
2. Maximum two-column layout for most content.
3. Visual hierarchy: section label (caps, green) → H2 → body text
4. Minimum 20% whitespace on any page or section.
5. Body text never smaller than 16px (1rem).
6. Line length: max 65 characters for body text (`max-w-2xl` or `max-w-prose`).

---

## Imagery Rules

- **Hero images**: real agricultural photos — crops, greenhouses, farms, Maldives context
- **Category images**: real product or crop photos on natural backgrounds
- **No**: generic stock with fake setups, heavy filters, over-styled lifestyle shots
- **Fallback**: if no image, use solid `#1A4A1A` for heroes. Cards are white — shadow provides separation.
- All images: `loading="lazy"` except above-the-fold hero (`loading="eager"`)
- Category images: `object-cover` cropped to consistent height (176px / h-44)

---

## Where Each Colour Appears

| Element | Colour | Hex |
|---|---|---|
| Primary CTA buttons (Call Now) | Farmer's Pride Green | `#2D6A2D` |
| Secondary CTA buttons (Browse Products, WhatsApp) | AgroLink Blue | `#1A8FC1` |
| Section H2 headings | Farmer's Pride Green | `#2D6A2D` |
| Section label caps | Farmer's Pride Green | `#2D6A2D` |
| Nav link hover / active | Farmer's Pride Green | `#2D6A2D` |
| Navbar Call Now button | Farmer's Pride Green | `#2D6A2D` |
| Topbar background | Dark Green | `#1A4A1A` |
| Navbar background | White | `#FFFFFF` |
| Footer background | Dark Green | `#1A4A1A` |
| Hero section overlay | Dark Green | `#1A4A1A` |
| CTA band background | Dark Green | `#1A4A1A` |
| Page background | White | `#FFFFFF` |
| Card backgrounds | White | `#FFFFFF` |
| Alternate section bg | Light Green | `#E8F5E8` | (optional, use sparingly) |
| Card backgrounds | White | `#FFFFFF` |
| Info panels / blue accents | Light Blue | `#D6EAF8` |
| Service card left border | Farmer's Pride Green | `#2D6A2D` |
| WhatsApp floating button | WhatsApp Green | `#25D366` |

---

## Voice & Copy Rules

Every line of copy must pass this test: **would a knowledgeable colleague say this on the phone?**

| Never write | Write instead |
|---|---|
| "Innovative agricultural ecosystem solutions" | "Right products for the right growing situation" |
| "Empowering sustainable futures" | "We help you grow more reliably" |
| "Leveraging 14 years of industry expertise" | "We have been doing this for 14 years" |
| "Our comprehensive range of horticultural inputs" | "We stock fertilizers, seeds, and everything you need" |
| "We are passionate about your growing journey" | "Call us. We will help you choose the right product." |

Copy is defined in `../content/`. Do not rewrite it.

---

## Mobile-First Rules

- Design mobile first. Scale up for desktop.
- Minimum tap target: 44×44px for all interactive elements
- Phone number must be tappable (tel: link) on mobile
- WhatsApp floating button: 56px diameter, fixed bottom-right, z-index 50
- Mobile menu: hamburger top-right, full-width slide-down panel
- Hero on mobile: minimum 480px tall, CTA buttons stack vertically
- Product category grid: 2 columns mobile, 3 tablet, 4 desktop
- Contact blocks: stack vertically on mobile

---

## Accessibility

- All images need meaningful `alt` text (decorative images: `alt=""`)
- Focusable elements need visible `:focus` styles
- Nav has `role="navigation"` and `aria-label="Main navigation"`
- Mobile menu button needs `aria-expanded` toggle
- Color contrast: all text must meet WCAG AA
  - Green `#2D6A2D` on white: passes AA ✓
  - Blue `#1A8FC1` on white: passes AA ✓
  - White on `#1A4A1A`: passes AA ✓
