# Deployment Readiness Guide

## Understanding Deployment Readiness

This repository contains a GitHub Actions workflow configured to automatically deploy a Next.js website to GitHub Pages. However, **the actual Next.js application is currently missing**.

## Current Repository Status

### ✅ What You Have
- **GitHub Actions Workflow**: `.github/workflows/nextjs.yml`
  - Configured for automatic deployment to GitHub Pages
  - Triggers on push to `main` branch
  - Handles build, static export, and deployment

### ❌ What's Missing
- **package.json**: Node.js project configuration and dependencies
- **next.config.js**: Next.js framework configuration
- **Application Code**: The actual website pages and components
- **Assets**: Images, styles, and other static files

## Why This Matters

The deployment workflow expects to find and build a Next.js application. Without the application code:
- ✗ The workflow will **fail** when triggered
- ✗ No website will be deployed
- ✗ GitHub Pages will show a 404 error

## How to Get Deployment Ready

### Step 1: Assess Your Situation

**Do you have an existing Next.js project?**
- **YES**: Proceed to "Adding Existing Code" section
- **NO**: Proceed to "Creating New Project" section

### Step 2a: Creating a New Next.js Project

If you're starting fresh:

```bash
# Navigate to your repository
cd /path/to/your/repository

# Create a new Next.js app (interactive)
npx create-next-app@latest .

# Answer the prompts:
# ✔ Would you like to use TypeScript? → Yes/No
# ✔ Would you like to use ESLint? → Yes
# ✔ Would you like to use Tailwind CSS? → Yes/No  
# ✔ Would you like to use `src/` directory? → Yes
# ✔ Would you like to use App Router? → Yes
# ✔ Would you like to customize the default import alias? → No
```

### Step 2b: Adding Existing Code

If you have a Next.js project elsewhere:

```bash
# Copy these files/directories to your repository:
# - package.json
# - package-lock.json (or yarn.lock)
# - next.config.js (or .mjs, .ts)
# - pages/ or app/ directory
# - public/ directory
# - src/ directory (if applicable)
# - Any other source files

# DO NOT copy:
# - node_modules/
# - .next/
# - out/
# - .env.local (secrets should never be committed)
```

### Step 3: Configure for Static Export

Edit your `next.config.js`:

```javascript
/** @type {import('next').NextConfig} */
const nextConfig = {
  // Enable static export (required for GitHub Pages)
  output: 'export',
  
  // Disable image optimization (not available in static export)
  images: {
    unoptimized: true,
  },
  
  // Optional: if deploying to a repository subdirectory
  // basePath: '/repository-name',
  // assetPrefix: '/repository-name',
}

module.exports = nextConfig
```

### Step 4: Create/Update .gitignore

Ensure your `.gitignore` includes:

```gitignore
# Dependencies
node_modules/
/.pnp
.pnp.js

# Testing
/coverage

# Next.js
/.next/
/out/

# Production
/build

# Environment variables
.env*.local
.env

# Debug
npm-debug.log*
yarn-debug.log*
yarn-error.log*

# OS files
.DS_Store
*.pem

# IDE
.vscode/
.idea/
*.swp
*.swo
```

### Step 5: Test Locally

Before deploying:

```bash
# Install dependencies
npm install

# Run development server
npm run dev
# Visit http://localhost:3000

# Test production build
npm run build
# Verify build succeeds and output is in ./out/

# (Optional) Serve the static export
npx serve out
# Verify the static site works correctly
```

### Step 6: Check Readiness

Run the automated checker:

```bash
chmod +x check-deployment-readiness.sh
./check-deployment-readiness.sh
```

This will verify:
- All required files exist
- Next.js is properly configured
- Application has pages/components
- Build artifacts are ignored

### Step 7: Deploy

Once ready:

```bash
# Stage all changes
git add .

# Commit with a descriptive message
git commit -m "Add Next.js application for deployment"

# Push to main branch (this triggers deployment)
git push origin main
```

### Step 8: Monitor Deployment

1. Go to your repository on GitHub
2. Click the **"Actions"** tab
3. Watch the workflow run:
   - **Build job**: Installs dependencies and builds the site
   - **Deploy job**: Publishes to GitHub Pages
4. Once complete, your site will be live!

## Deployment Configuration

### GitHub Pages Setup

Ensure GitHub Pages is configured:

1. Go to repository **Settings**
2. Navigate to **Pages** section
3. Under **Source**, select:
   - Source: **GitHub Actions**
   - (Not "Deploy from a branch")

### Branch Configuration

The workflow is configured to deploy from the `main` branch. If your default branch has a different name:

1. Edit `.github/workflows/nextjs.yml`
2. Update the branch name:
   ```yaml
   on:
     push:
       branches: ["your-branch-name"]
   ```

## Troubleshooting

### Workflow Fails: "Unable to determine package manager"

**Problem**: No `package.json` found

**Solution**: Add your Next.js application code or initialize a new project

### Workflow Fails: "next: command not found"

**Problem**: Next.js not in dependencies

**Solution**: Add Next.js to `package.json`:
```bash
npm install next@latest react@latest react-dom@latest
```

### Site Deploys but Shows 404

**Problem**: GitHub Pages can't find your files

**Solutions**:
- Verify `output: 'export'` in `next.config.js`
- Check that build creates `./out/` directory
- Ensure `basePath` matches repository name (for non-root deploys)

### Images Not Loading

**Problem**: Image optimization requires a server

**Solution**: Add to `next.config.js`:
```javascript
images: {
  unoptimized: true,
}
```

### CSS Not Loading

**Problem**: Asset paths are incorrect

**Solution**: Add `basePath` and `assetPrefix` to `next.config.js`:
```javascript
basePath: '/repository-name',
assetPrefix: '/repository-name',
```

### API Routes Don't Work

**Problem**: API routes require a Node.js server

**Solution**: Static export doesn't support API routes. Options:
- Use client-side fetching to external APIs
- Use serverless functions (Vercel, Netlify)
- Deploy to a platform that supports SSR

## Verification Checklist

Before considering your repository deployment-ready:

- [ ] `package.json` exists with Next.js, React, and React-DOM
- [ ] `next.config.js` exists with `output: 'export'`
- [ ] At least one page exists in `pages/` or `app/`
- [ ] `.gitignore` excludes `node_modules/`, `.next/`, `out/`
- [ ] Local build succeeds: `npm run build`
- [ ] Static export created in `./out/` directory
- [ ] No secrets or API keys in the code
- [ ] GitHub Actions workflow exists
- [ ] GitHub Pages is enabled in repository settings
- [ ] Repository is pushed to GitHub
- [ ] You're ready to push to `main` branch

## Quick Reference

### Check Status
```bash
./check-deployment-readiness.sh
```

### Local Development
```bash
npm run dev          # Start dev server
npm run build        # Build for production
npm run start        # Start production server (not for GitHub Pages)
```

### Deployment
```bash
git add .
git commit -m "Deploy website"
git push origin main
```

### Your Site URL
```
https://<username>.github.io/<repository-name>/
```

## Additional Resources

- [Next.js Documentation](https://nextjs.org/docs)
- [Next.js Static Exports](https://nextjs.org/docs/app/building-your-application/deploying/static-exports)
- [GitHub Pages Documentation](https://docs.github.com/en/pages)
- [GitHub Actions for Next.js](https://github.com/actions/starter-workflows/blob/main/pages/nextjs.yml)

## Summary

**Your repository is NOT ready for deployment yet** because it lacks the actual Next.js application code. Follow this guide to:

1. Add or create a Next.js application
2. Configure it for static export
3. Test locally
4. Push to the main branch
5. Monitor the automated deployment

Once complete, your website will automatically deploy to GitHub Pages whenever you push changes to the main branch.
