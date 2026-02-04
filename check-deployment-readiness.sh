#!/bin/bash

# Deployment Readiness Checker for Next.js Project
# This script checks if the repository is ready for deployment to GitHub Pages

echo "========================================="
echo "   DEPLOYMENT READINESS CHECKER"
echo "========================================="
echo ""

# Initialize counters
READY=true
WARNINGS=0
ERRORS=0

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Check 1: package.json exists
echo "Checking for package.json..."
if [ -f "package.json" ]; then
    echo -e "${GREEN}✓${NC} package.json found"
    
    # Check if Next.js is a dependency
    if grep -q '"next"' package.json; then
        echo -e "${GREEN}✓${NC} Next.js is listed as a dependency"
    else
        echo -e "${RED}✗${NC} Next.js not found in dependencies"
        READY=false
        ERRORS=$((ERRORS + 1))
    fi
else
    echo -e "${RED}✗${NC} package.json not found"
    READY=false
    ERRORS=$((ERRORS + 1))
fi
echo ""

# Check 2: Next.js configuration
echo "Checking for Next.js configuration..."
if [ -f "next.config.js" ] || [ -f "next.config.mjs" ] || [ -f "next.config.ts" ]; then
    echo -e "${GREEN}✓${NC} Next.js config found"
    
    # Check for static export configuration
    if grep -q "output.*:.*['\"]export['\"]" next.config.* 2>/dev/null; then
        echo -e "${GREEN}✓${NC} Static export is configured (required for GitHub Pages)"
    else
        echo -e "${YELLOW}⚠${NC} Static export may not be configured - check next.config for output: 'export'"
        WARNINGS=$((WARNINGS + 1))
    fi
else
    echo -e "${YELLOW}⚠${NC} Next.js config not found (optional but recommended)"
    WARNINGS=$((WARNINGS + 1))
fi
echo ""

# Check 3: Application source code
echo "Checking for application source code..."
HAS_CODE=false

if [ -d "pages" ] || [ -d "src/pages" ]; then
    echo -e "${GREEN}✓${NC} Pages directory found (Pages Router)"
    HAS_CODE=true
elif [ -d "app" ] || [ -d "src/app" ]; then
    echo -e "${GREEN}✓${NC} App directory found (App Router)"
    HAS_CODE=true
else
    echo -e "${RED}✗${NC} No pages/ or app/ directory found"
    READY=false
    ERRORS=$((ERRORS + 1))
fi

# Check for at least one page file
if [ "$HAS_CODE" = true ]; then
    if find pages app src/pages src/app -name "*.js" -o -name "*.jsx" -o -name "*.ts" -o -name "*.tsx" 2>/dev/null | grep -q .; then
        echo -e "${GREEN}✓${NC} Page components found"
    else
        echo -e "${RED}✗${NC} No page components found"
        READY=false
        ERRORS=$((ERRORS + 1))
    fi
fi
echo ""

# Check 4: GitHub Actions workflow
echo "Checking for GitHub Actions workflow..."
if [ -f ".github/workflows/nextjs.yml" ] || find .github/workflows -name "*nextjs*.yml" 2>/dev/null | grep -q .; then
    echo -e "${GREEN}✓${NC} Next.js deployment workflow found"
else
    echo -e "${YELLOW}⚠${NC} No Next.js deployment workflow found"
    WARNINGS=$((WARNINGS + 1))
fi
echo ""

# Check 5: .gitignore
echo "Checking for .gitignore..."
if [ -f ".gitignore" ]; then
    echo -e "${GREEN}✓${NC} .gitignore found"
    
    # Check for common Next.js ignores
    if grep -q "node_modules" .gitignore && grep -q ".next" .gitignore; then
        echo -e "${GREEN}✓${NC} Common Next.js directories are ignored"
    else
        echo -e "${YELLOW}⚠${NC} .gitignore may be missing Next.js-specific entries"
        WARNINGS=$((WARNINGS + 1))
    fi
else
    echo -e "${YELLOW}⚠${NC} .gitignore not found (recommended)"
    WARNINGS=$((WARNINGS + 1))
fi
echo ""

# Check 6: Dependencies installation
echo "Checking for node_modules..."
if [ -d "node_modules" ]; then
    echo -e "${GREEN}✓${NC} node_modules directory exists (dependencies installed)"
else
    echo -e "${YELLOW}⚠${NC} node_modules not found - run npm install or yarn install"
    WARNINGS=$((WARNINGS + 1))
fi
echo ""

# Summary
echo "========================================="
echo "            SUMMARY"
echo "========================================="
echo ""

if [ "$READY" = true ] && [ "$ERRORS" -eq 0 ]; then
    echo -e "${GREEN}✓ REPOSITORY IS READY FOR DEPLOYMENT${NC}"
    echo ""
    echo "Next steps:"
    echo "1. Ensure all changes are committed"
    echo "2. Push to the main branch to trigger deployment"
    echo "3. Monitor the GitHub Actions workflow"
    echo "4. Access your site at: https://<username>.github.io/<repo-name>/"
    exit 0
else
    echo -e "${RED}✗ REPOSITORY IS NOT READY FOR DEPLOYMENT${NC}"
    echo ""
    echo "Issues found:"
    echo "  - Errors: $ERRORS"
    echo "  - Warnings: $WARNINGS"
    echo ""
    echo "Please fix the errors above before deploying."
    echo ""
    echo "Quick Start Guide:"
    echo "1. Initialize a Next.js project: npx create-next-app@latest ."
    echo "2. Configure for static export in next.config.js"
    echo "3. Commit and push to main branch"
    exit 1
fi
