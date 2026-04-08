# Domislink Empire

A modern web application built with [Next.js](https://nextjs.org), styled with [Tailwind CSS](https://tailwindcss.com), and deployed to [GitHub Pages](https://pages.github.com/).

## Getting Started

Install dependencies:

```bash
npm install
```

Start the development server:

```bash
npm run dev
```

Open [http://localhost:3000](http://localhost:3000) in your browser to see the app.

## Building for Production

```bash
npm run build
```

This generates a static export in the `./out` directory, ready for deployment to GitHub Pages.

## Deployment

The app is automatically deployed to GitHub Pages on every push to the `main` branch via the workflow in `.github/workflows/nextjs.yml`.

## Tech Stack

- **Framework**: [Next.js 16](https://nextjs.org/docs) with App Router
- **Language**: [TypeScript](https://www.typescriptlang.org/)
- **Styling**: [Tailwind CSS v4](https://tailwindcss.com/)
- **Linting**: [ESLint](https://eslint.org/) with `eslint-config-next`
- **Deployment**: [GitHub Pages](https://pages.github.com/) via GitHub Actions
