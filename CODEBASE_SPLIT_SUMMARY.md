# Checkmate-Escrow Codebase Split Summary

## Overview

The Checkmate-Escrow monorepo has been successfully divided into two independent codebases:

1. **Checkmate-Backend** - Rust smart contracts and services
2. **Checkmate-Frontend** - React/TypeScript web application

## Directory Structure

```
StellaRust/
├── Checkmate-Escrow/          # Original repository (preserved)
├── StellaRust-Backend/        # NEW: Backend-only codebase
└── StellaRust-Frontend/       # NEW: Frontend-only codebase
```

## What's in Each Codebase?

### StellaRust-Backend (`./StellaRust-Backend/`)

**Smart Contracts:**
- `contracts/escrow/` - Main escrow contract for managing chess match stakes
- `contracts/oracle/` - Oracle contract for verifying game results

**Services:**
- `oracle-service/` - Rust service that bridges chess APIs to blockchain
- `services/event-indexer/` - Indexes contract events for queries

**Testing & Tools:**
- `e2e-tests/` - End-to-end integration tests
- `scripts/` - Build, test, and deployment scripts
- `Makefile` - Convenience commands

**Configuration:**
- `Cargo.toml` - Rust workspace configuration
- `Cargo.lock` - Dependency lock file
- `environments.toml` - Network configurations (testnet, mainnet, etc.)
- `docker-compose.yml` - Docker orchestration
- `.env.example` - Environment variable template

**Documentation:**
- `README.md` - Full project documentation
- `SETUP.md` - Backend-specific setup guide
- `LICENSE` - MIT license

### StellaRust-Frontend (`./StellaRust-Frontend/`)

**Application Code:**
- `src/` - React/TypeScript source code
  - Components, hooks, services, utilities
- `public/` - Static assets

**Configuration:**
- `package.json` - Node.js dependencies and scripts
- `package-lock.json` - Dependency lock file
- `vite.config.ts` - Vite bundler configuration
- `tsconfig.json` - TypeScript configuration
- `eslint.config.js` - Linting rules
- `jest.config.js` - Testing configuration

**Documentation:**
- `README.md` - Frontend documentation
- `SETUP.md` - Frontend-specific setup guide
- `LICENSE` - MIT license

## How to Use

### Backend Development

```bash
cd StellaRust-Backend

# Install Rust (if not installed)
# Windows: https://rustup.rs/
# Or: winget install Rustlang.Rustup

# Add WebAssembly target
rustup target add wasm32-unknown-unknown

# Install Stellar/Soroban CLI
# cargo install --locked stellar-cli

# Build contracts
cargo build --release --target wasm32-unknown-unknown

# Run tests
cargo test

# Deploy to testnet
./scripts/deploy_testnet.sh
```

### Frontend Development

```bash
cd StellaRust-Frontend

# Install Node.js (if not installed)
# Windows: https://nodejs.org/
# Or: winget install OpenJS.NodeJS

# Install dependencies
npm install

# Create .env file
cp .env.example .env
# Edit .env with deployed contract addresses

# Start development server
npm run dev

# Build for production
npm run build
```

## Next Steps

### 1. Install Prerequisites

**For Backend:**
- Install Rust: https://rustup.rs/
- Install Stellar CLI: https://developers.stellar.org/docs/tools/developer-tools
- Install Soroban CLI (included with Stellar CLI)

**For Frontend:**
- Install Node.js: https://nodejs.org/ (v16 or higher)
- Install a Stellar wallet browser extension (Freighter recommended)

### 2. Build and Run Backend

```bash
cd Checkmate-Backend
cargo build --release --target wasm32-unknown-unknown
cargo test
```

### 3. Deploy Contracts (Testnet)

```bash
cd Checkmate-Backend

# Generate deployer identity
stellar keys generate deployer --network testnet

# Deploy contracts
./scripts/deploy_testnet.sh

# Note the deployed contract addresses
```

### 4. Configure Frontend

```bash
cd Checkmate-Frontend

# Install dependencies
npm install

# Create .env and add contract addresses from step 3
echo "VITE_STELLAR_NETWORK=testnet" > .env
echo "VITE_STELLAR_RPC_URL=https://soroban-testnet.stellar.org" >> .env
echo "VITE_CONTRACT_ESCROW=<your-contract-address>" >> .env
```

### 5. Run Frontend

```bash
npm run dev
# Open http://localhost:5173
```

## Key Differences from Original

### Backend Changes
- ✅ Contains only Rust/blockchain code
- ✅ Independent Cargo workspace
- ✅ Can be built and tested separately
- ✅ Docker configuration for service deployment

### Frontend Changes
- ✅ Contains only React/TypeScript code
- ✅ Independent npm package
- ✅ Requires backend contract addresses in config
- ✅ Vite-based development server

## Benefits of This Split

1. **Separation of Concerns**: Backend and frontend can evolve independently
2. **Different Build Tools**: Cargo for Rust, npm for TypeScript
3. **Team Organization**: Backend and frontend developers can work in parallel
4. **Deployment Flexibility**: Deploy contracts and UI separately
5. **Cleaner Dependencies**: No mixing of Rust and Node.js dependencies

## Architecture Flow

```
┌─────────────────────────┐
│  Checkmate-Frontend     │
│  (React + TypeScript)   │
└───────────┬─────────────┘
            │
            │ Stellar SDK
            │ WebSocket
            │
            ▼
┌─────────────────────────┐
│  Stellar Blockchain     │
│  (Smart Contracts)      │
└───────────┬─────────────┘
            │
            │ Oracle Calls
            │
            ▼
┌─────────────────────────┐
│  Oracle Service         │
│  (Rust Backend)         │
└───────────┬─────────────┘
            │
            │ REST API
            │
            ▼
┌─────────────────────────┐
│  Chess Platforms        │
│  (Lichess, Chess.com)   │
└─────────────────────────┘
```

## Git Workflow (Optional)

If you want to version control each separately:

```bash
# Initialize backend repo
cd StellaRust-Backend
git init
git add .
git commit -m "Initial backend split from monorepo"
git remote add origin <your-backend-repo-url>
git push -u origin main

# Initialize frontend repo
cd ../StellaRust-Frontend
git init
git add .
git commit -m "Initial frontend split from monorepo"
git remote add origin <your-frontend-repo-url>
git push -u origin main
```

## Troubleshooting

### Backend Issues

**Cargo not found:**
```bash
# Install Rust
winget install Rustlang.Rustup
# Or visit: https://rustup.rs/
```

**WebAssembly target missing:**
```bash
rustup target add wasm32-unknown-unknown
```

**Soroban CLI not found:**
```bash
cargo install --locked stellar-cli
```

### Frontend Issues

**Node/npm not found:**
```bash
# Install Node.js
winget install OpenJS.NodeJS
# Or visit: https://nodejs.org/
```

**Dependencies won't install:**
```bash
# Clear cache and retry
npm cache clean --force
rm -rf node_modules package-lock.json
npm install
```

**Contract connection fails:**
- Verify contract addresses in `.env`
- Check RPC URL is correct
- Ensure contracts are deployed to the network you're targeting

## Success Indicators

✅ **Backend is ready when:**
- `cargo build` succeeds
- `cargo test` passes
- Contracts deploy to testnet successfully

✅ **Frontend is ready when:**
- `npm install` completes
- `npm run dev` starts dev server
- Browser opens at http://localhost:5173
- Wallet connects successfully

## Support

- Backend docs: `./StellaRust-Backend/README.md`
- Frontend docs: `./StellaRust-Frontend/README.md`
- Original repo: `./Checkmate-Escrow/README.md`

---

**Date**: September 14, 2026
**Original Repository**: https://github.com/StellarCheckMate/Checkmate-Escrow.git
**Split by**: Kiro AI
