# StellaRust Frontend Prerequisites Checker
# Run this script to check if all required tools are installed

Write-Host "🔍 Checking StellaRust Frontend Prerequisites..." -ForegroundColor Cyan
Write-Host ""

$allGood = $true

# Check Node.js
Write-Host "Checking Node.js installation..." -ForegroundColor Yellow
try {
    $nodeVersion = node --version 2>$null
    if ($nodeVersion) {
        $versionNumber = [version]($nodeVersion -replace 'v','')
        if ($versionNumber.Major -ge 16) {
            Write-Host "✅ Node.js installed: $nodeVersion" -ForegroundColor Green
        } else {
            Write-Host "⚠️  Node.js $nodeVersion found (v16+ recommended)" -ForegroundColor Yellow
            Write-Host "   Upgrade from: https://nodejs.org/" -ForegroundColor Gray
        }
    } else {
        Write-Host "❌ Node.js not found" -ForegroundColor Red
        Write-Host "   Install from: https://nodejs.org/" -ForegroundColor Gray
        $allGood = $false
    }
} catch {
    Write-Host "❌ Node.js not found" -ForegroundColor Red
    Write-Host "   Install from: https://nodejs.org/" -ForegroundColor Gray
    $allGood = $false
}

Write-Host ""

# Check npm
Write-Host "Checking npm installation..." -ForegroundColor Yellow
try {
    $npmVersion = npm --version 2>$null
    if ($npmVersion) {
        Write-Host "✅ npm installed: v$npmVersion" -ForegroundColor Green
    } else {
        Write-Host "❌ npm not found" -ForegroundColor Red
        $allGood = $false
    }
} catch {
    Write-Host "❌ npm not found (should come with Node.js)" -ForegroundColor Red
    $allGood = $false
}

Write-Host ""

# Check if package.json exists
Write-Host "Checking project structure..." -ForegroundColor Yellow
if (Test-Path "package.json") {
    Write-Host "✅ package.json found" -ForegroundColor Green
} else {
    Write-Host "❌ package.json not found (are you in the right directory?)" -ForegroundColor Red
    $allGood = $false
}

Write-Host ""

# Check if node_modules exists
Write-Host "Checking dependencies..." -ForegroundColor Yellow
if (Test-Path "node_modules") {
    Write-Host "✅ node_modules found (dependencies installed)" -ForegroundColor Green
} else {
    Write-Host "⚠️  node_modules not found" -ForegroundColor Yellow
    Write-Host "   Run: npm install" -ForegroundColor Gray
}

Write-Host ""

# Check .env file
Write-Host "Checking environment configuration..." -ForegroundColor Yellow
if (Test-Path ".env") {
    Write-Host "✅ .env file found" -ForegroundColor Green
} else {
    Write-Host "⚠️  .env file not found" -ForegroundColor Yellow
    Write-Host "   Create from template: cp .env.example .env" -ForegroundColor Gray
    Write-Host "   Then edit with your contract addresses" -ForegroundColor Gray
}

Write-Host ""

# Check browser extensions (informational)
Write-Host "Browser wallet extension (recommended):" -ForegroundColor Yellow
Write-Host "ℹ️  Install Freighter wallet for Stellar interaction" -ForegroundColor Cyan
Write-Host "   Chrome: https://chrome.google.com/webstore (search 'Freighter')" -ForegroundColor Gray
Write-Host "   Firefox: https://addons.mozilla.org/ (search 'Freighter')" -ForegroundColor Gray

Write-Host ""
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Gray

if ($allGood) {
    Write-Host "✨ Core prerequisites met!" -ForegroundColor Green
    Write-Host ""
    Write-Host "Next steps:" -ForegroundColor Cyan
    Write-Host "  1. npm install                    # Install dependencies" -ForegroundColor White
    Write-Host "  2. cp .env.example .env          # Create environment file" -ForegroundColor White
    Write-Host "  3. # Edit .env with contract addresses from backend deployment" -ForegroundColor White
    Write-Host "  4. npm run dev                    # Start development server" -ForegroundColor White
    Write-Host ""
} else {
    Write-Host "⚠️  Some prerequisites are missing. Please install them first." -ForegroundColor Yellow
    Write-Host ""
    Write-Host "Quick install commands:" -ForegroundColor Cyan
    Write-Host "  • Node.js: winget install OpenJS.NodeJS" -ForegroundColor White
    Write-Host "  • Dependencies: npm install" -ForegroundColor White
    Write-Host ""
}

Write-Host "For more info, see SETUP.md" -ForegroundColor Gray
