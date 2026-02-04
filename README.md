# Domislink Empire

A modern web application built with Next.js, React, and TypeScript, deployed on GitHub Pages.

## Features

- 🚀 Built with Next.js 14 for optimal performance
- ⚡ Static site generation for fast loading
- 🎨 Modern, responsive design
- 📱 Mobile-friendly interface
- 🔄 Automated deployment with GitHub Actions

## Getting Started

### Prerequisites

- Node.js 20 or higher
- npm or yarn

### Installation

1. Clone the repository:
```bash
git clone https://github.com/amaechiu-del/https-github.com-amaechiu-del-domislink-empire.git-
cd https-github.com-amaechiu-del-domislink-empire.git-
```

2. Install dependencies:
```bash
npm install
# or
yarn install
```

3. Run the development server:
```bash
npm run dev
# or
yarn dev
```

4. Open [http://localhost:3000](http://localhost:3000) in your browser to see the result.

## Building for Production

To create a production build:

```bash
npm run build
# or
yarn build
```

This will generate a static export in the `out` directory.

## Deployment

The application is automatically deployed to GitHub Pages when changes are pushed to the main branch. The deployment workflow is configured in `.github/workflows/nextjs.yml`.

## Project Structure

```
.
├── app/
│   ├── about/
│   │   └── page.tsx      # About page
│   ├── globals.css       # Global styles
│   ├── layout.tsx        # Root layout
│   └── page.tsx          # Home page
├── next.config.js        # Next.js configuration
├── package.json          # Dependencies and scripts
└── tsconfig.json         # TypeScript configuration
```

## Technologies Used

- [Next.js](https://nextjs.org/) - React framework
- [React](https://reactjs.org/) - UI library
- [TypeScript](https://www.typescriptlang.org/) - Type safety
- [GitHub Pages](https://pages.github.com/) - Hosting

## License

This project is open source and available under the MIT License.
