# Assets — Brand Logo Files

Place the following logo files in this folder before running the Claude Code build session. Claude Code will copy them into the theme during setup.

## Logo System

The approved logo exists in three forms. Each has a specific use context:

| File | Form | Where used | Recommended size |
|---|---|---|---|
| `logo-navbar.png` | Rectangular horizontal lockup | White navbar (primary UI use) | 360×72px, transparent PNG |
| `logo-footer.png` | Same lockup, white / light version | Dark green footer background | 360×72px, white text PNG |
| `logo-badge.png` | Circular emblem with leaf motif | About page, badges, secondary use | 200×200px, transparent PNG |
| `favicon.png` | Simplified icon for browser tab | Browser tab and bookmarks | 32×32px PNG |

## About the Approved Logo

The official logo is the circular emblem showing two plants — a blue plant (AgroLink identity) and a green plant (Farmer's Pride identity) — with the text "Farmer's Pride by AgroLink" below.

For navbar use, a rectangular/horizontal version is recommended for usability at small sizes. If only the circular badge is available, it can be used in the navbar with the text "Farmer's Pride by AgroLink" as a separate text element alongside it.

## Fallback Behaviour

If logo files are missing when Claude Code runs, templates will render a text fallback:

- Navbar: **Farmer's Pride** `by AgroLink` in green/grey type
- Footer: same in white/light type

The site builds and runs correctly without any logo files. Upload them when ready and push to GitHub — they will be included in the next Coolify deploy.

## See Also

`IMAGE_MANIFEST.md` in this folder for all required hero and category image filenames.
