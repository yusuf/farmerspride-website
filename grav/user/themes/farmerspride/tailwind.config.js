/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    './templates/**/*.twig',
    './src/**/*.css',
    '../../pages/**/*.md',
  ],
  safelist: ['text-body'],
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
          100: '#F7F4EE',
          200: '#EDE8DC',
          300: '#DDD5C4',
        },
        // Text
        dark:  '#1A1A1A',
        body:  '#3D3D3D',
        muted: '#6B6B6B',
      },
      fontFamily: {
        sans: ['Inter', 'system-ui', '-apple-system', 'sans-serif'],
      },
      fontSize: {
        'hero': ['clamp(2rem, 5vw, 3.5rem)', { lineHeight: '1.1', fontWeight: '700' }],
      },
      minHeight: {
        'hero':      '480px',
        'hero-lg':   '600px',
        'page-hero': '200px',
        'page-hero-lg': '260px',
      },
      boxShadow: {
        'card':       '0 2px 8px rgba(0,0,0,0.08)',
        'card-hover': '0 8px 24px rgba(0,0,0,0.12)',
      },
      maxWidth: {
        'container': '80rem', // max-w-7xl
      },
    },
  },
  plugins: [],
}
