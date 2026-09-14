# StellaRust Backend Prerequisites Checker
# Run this script to check if all required tools are installed

Write-Host "🔍 Checking StellaRust Backend Prerequisites..." -ForegroundColor Cyan
Write-Host ""

$allGood = $true

# Check Rust
Write-Host "Checking Rust installation..." -ForegroundColor Yellow
try {
    $rustVersion = rustc --version 2>$null
    if ($rustVersion) {
        Write-Host "✅ Rust installed: $rustVersion" -ForegroundColor Green
    } else {
        Write-Host "❌ Rust not found" -ForegroundColor Red
        Write-Host "   Install from: https://rustup.rs/" -ForegroundColor Gray
        $allGood = $false
    }
} catch {
    Write-Host "❌ Rust not found" -ForegroundColor Red
    Write-Host "   Install from: https://rustup.rs/" -ForegroundColor Gray
    $allGood = $false
}

Write-Host ""

# Check Cargo
Write-Host "Checking Cargo installation..." -ForegroundColor Yellow
try {
    $cargoVersion = cargo --version 2>$null
    if ($cargoVersion) {
        Write-Host "✅ Cargo installed: $cargoVersion" -ForegroundColor Green
    } else {
        Write-Host "❌ Cargo not found" -ForegroundColor Red
        $allGood = $false
    }
} catch {
    Write-Host "❌ Cargo not found (should come with Rust)" -ForegroundColor Red
    $allGood = $false
}

Write-Host ""

# Check WebAssembly target
Write-Host "Checking WebAssembly target..." -ForegroundColor Yellow
$targets = rustup target list 2>$null | Select-String "wasm32-unknown-unknown"
if ($targets -match "installed") {
    Write-Host "✅ wasm32-unknown-unknown target installed" -ForegroundColor Green
} else {
    Write-Host "⚠️  wasm32-unknown-unknown target not installed" -ForegroundColor Yellow
    Write-Host "   Run: rustup target add wasm32-unknown-unknown" -ForegroundColor Gray
    $allGood = $false
}

Write-Host ""

# Check Stellar CLI
Write-Host "Checking Stellar CLI..." -ForegroundColor Yellow
try {
    $stellarVersion = stellar --version 2>$null
    if ($stellarVersion) {
        Write-Host "✅ Stellar CLI installed: $stellarVersion" -ForegroundColor Green
    } else {
        Write-Host "⚠️  Stellar CLI not found" -ForegroundColor Yellow
        Write-Host "   Install: cargo install --locked stellar-cli" -ForegroundColor Gray
        Write-Host "   Docs: https://developers.stellar.org/docs/tools/developer-tools" -ForegroundColor Gray
    }
} catch {
    Write-Host "⚠️  Stellar CLI not found (optional for testing)" -ForegroundColor Yellow
    Write-Host "   Install: cargo install --locked stellar-cli" -ForegroundColor Gray
}

Write-Host ""

# Check Docker (optional)
Write-Host "Checking Docker (optional)..." -ForegroundColor Yellow
try {
    $dockerVersion = docker --version 2>$null
    if ($dockerVersion) {
        Write-Host "✅ Docker installed: $dockerVersion" -ForegroundColor Green
    } else {
        Write-Host "ℹ️  Docker not found (optional for containerized deployment)" -ForegroundColor Cyan
    }
} catch {
    Write-Host "ℹ️  Docker not found (optional for containerized deployment)" -ForegroundColor Cyan
}

Write-Host ""
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Gray

if ($allGood) {
    Write-Host "✨ All prerequisites met! You're ready to build." -ForegroundColor Green
    Write-Host ""
    Write-Host "Next steps:" -ForegroundColor Cyan
    Write-Host "  1. cargo build --release --target wasm32-unknown-unknown" -ForegroundColor White
    Write-Host "  2. cargo test" -ForegroundColor White
    Write-Host ""
} else {
    Write-Host "⚠️  Some prerequisites are missing. Please install them first." -ForegroundColor Yellow
    Write-Host ""
    Write-Host "Quick install commands:" -ForegroundColor Cyan
    Write-Host "  • Rust: winget install Rustlang.Rustup" -ForegroundColor White
    Write-Host "  • WASM target: rustup target add wasm32-unknown-unknown" -ForegroundColor White
    Write-Host "  • Stellar CLI: cargo install --locked stellar-cli" -ForegroundColor White
    Write-Host ""
}

Write-Host "For more info, see SETUP.md" -ForegroundColor Gray
