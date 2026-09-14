# StellaRust Workspace

This workspace contains the Checkmate-Escrow project, split into separate backend and frontend codebases for independent development and deployment.

## 📁 Project Structure

```
StellaRust/
│
├── 📄 CODEBASE_SPLIT_SUMMARY.md    # Detailed split documentation
├── 📄 README.md                     # This file
│
├── 📂 Checkmate-Escrow/             # ✅ Original monorepo (preserved)
│   └── Full project with all components
│
├── 📂 StellaRust-Backend/           # 🚀 Backend (Rust + Smart Contracts)
│   ├── contracts/                   # Soroban smart contracts
│   ├── oracle-service/              # Oracle service
│   ├── services/                    # Supporting services
│   ├── e2e-tests/                   # Integration tests
│   ├── scripts/                     # Build & deployment scripts
│   ├── Cargo.toml                   # Rust workspace
│   ├── SETUP.md                     # Backend setup guide
│   └── check-prerequisites.ps1      # Prerequisites checker
│
└── 📂 StellaRust-Frontend/          # 💻 Frontend (React + TypeScript)
    ├── src/                         # React application
    ├── public/                      # Static assets
    ├── package.json                 # Node.js dependencies
    ├── SETUP.md                     # Frontend setup guide
    └── check-prerequisites.ps1      # Prerequisites checker
```

## 🎯 Quick Start

### Option 1: Check Prerequisites First (Recommended)

**Backend:**
```powershell
cd StellaRust-Backend
.\check-prerequisites.ps1
```

**Frontend:**
```powershell
cd StellaRust-Frontend
.\check-prerequisites.ps1
```

### Option 2: Jump Right In

**Backend:**
```bash
cd StellaRust-Backend
# See SETUP.md for full instructions
cargo build --release --target wasm32-unknown-unknown
cargo test
```

**Frontend:**
```bash
cd StellaRust-Frontend
# See SETUP.md for full instructions
npm install
npm run dev
```

## 📚 Documentation

| Document | Description |
|----------|-------------|
| `CODEBASE_SPLIT_SUMMARY.md` | Complete overview of the codebase split |
| `StellaRust-Backend/SETUP.md` | Backend setup and development guide |
| `StellaRust-Frontend/SETUP.md` | Frontend setup and development guide |
| `StellaRust-Backend/README.md` | Full backend documentation |
| `StellaRust-Frontend/README.md` | Frontend documentation |

## 🔧 What Each Project Does

### StellaRust-Backend

**Purpose:** Blockchain infrastructure for chess betting platform

**Contains:**
- ✅ Soroban smart contracts (escrow + oracle)
- ✅ Rust oracle service for game result verification
- ✅ Event indexer service
- ✅ E2E test suite
- ✅ Deployment scripts

**Build Output:** WebAssembly contracts deployable to Stellar

### StellaRust-Frontend

**Purpose:** Web interface for interacting with smart contracts

**Contains:**
- ✅ React web application
- ✅ Stellar wallet integration
- ✅ Match creation and management UI
- ✅ Real-time updates via WebSocket
- ✅ Responsive design

**Build Output:** Static web application (HTML/CSS/JS)

## 🛠️ Prerequisites

### For Backend Development

- **Rust** (1.70+) - [Install](https://rustup.rs/)
- **Soroban CLI** - `cargo install --locked stellar-cli`
- **WebAssembly target** - `rustup target add wasm32-unknown-unknown`
- **Docker** (optional) - For containerized deployment

### For Frontend Development

- **Node.js** (v16+) - [Install](https://nodejs.org/)
- **npm** - Comes with Node.js
- **Stellar Wallet** - Freighter browser extension recommended

## 🚀 Development Workflow

### 1. Deploy Backend Contracts

```bash
cd StellaRust-Backend

# Install prerequisites
rustup target add wasm32-unknown-unknown

# Build contracts
cargo build --release --target wasm32-unknown-unknown

# Deploy to testnet
stellar keys generate deployer --network testnet
./scripts/deploy_testnet.sh

# Note the contract addresses from output
```

### 2. Configure Frontend

```bash
cd StellaRust-Frontend

# Install dependencies
npm install

# Create environment configuration
cp .env.example .env

# Edit .env with contract addresses from step 1
# VITE_CONTRACT_ESCROW=<address-from-deployment>
# VITE_CONTRACT_ORACLE=<address-from-deployment>
```

### 3. Run Frontend

```bash
npm run dev
# Opens at http://localhost:5173
```

## 🏗️ Architecture

```
┌─────────────────────┐
│   Web Browser       │
│  (Frontend UI)      │
└──────────┬──────────┘
           │
           │ Stellar SDK
           │
┌──────────▼──────────┐
│  Stellar Network    │
│  (Smart Contracts)  │
└──────────┬──────────┘
           │
           │ Oracle Calls
           │
┌──────────▼──────────┐
│  Oracle Service     │
│  (Backend)          │
└──────────┬──────────┘
           │
           │ API Requests
           │
┌──────────▼──────────┐
│  Chess Platforms    │
│  (Lichess/Chess.com)│
└─────────────────────┘
```

## 💡 Why Split the Codebase?

✅ **Independent Development** - Frontend and backend teams work in parallel  
✅ **Different Tech Stacks** - Rust (Cargo) vs TypeScript (npm)  
✅ **Separate Deployments** - Deploy contracts and UI independently  
✅ **Cleaner Dependencies** - No mixing of Rust and Node.js toolchains  
✅ **Better Organization** - Clear separation of concerns  

## 📦 Original Repository

The original monorepo is preserved in `Checkmate-Escrow/` for reference.

**Original Source:** https://github.com/StellarCheckMate/Checkmate-Escrow.git

## 🤝 Contributing

1. Choose your area: Backend or Frontend
2. See respective SETUP.md for contribution guidelines
3. Follow the development workflow above

## 📄 License

MIT License - See LICENSE files in respective project directories

---

**Created:** September 14, 2026  
**Split by:** Kiro AI  
**Workspace:** c:\Users\USER\Desktop\StellaRust
