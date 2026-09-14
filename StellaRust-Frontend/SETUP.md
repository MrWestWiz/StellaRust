# StellaRust Frontend

This is the **frontend portion** of the Checkmate-Escrow project - a React/TypeScript web application for interacting with the Checkmate-Escrow smart contracts.

## Project Structure

```
StellaRust-Frontend/
├── src/                # Source code
│   ├── components/     # React components
│   ├── hooks/          # Custom React hooks
│   ├── services/       # API services
│   └── utils/          # Utility functions
├── public/             # Static assets
├── package.json        # Dependencies
├── vite.config.ts      # Vite configuration
└── tsconfig.json       # TypeScript configuration
```

## Backend Repository

The backend (Rust smart contracts) has been separated into: `../StellaRust-Backend/`

## Quick Start

### Prerequisites

- Node.js (v16+)
- npm or yarn
- A Stellar wallet (Freighter recommended)

### Install Dependencies

```bash
npm install
```

### Setup Environment

Create a `.env` file in the root:

```env
# Network configuration
VITE_STELLAR_NETWORK=testnet
VITE_STELLAR_RPC_URL=https://soroban-testnet.stellar.org

# Contract addresses (after backend deployment)
VITE_CONTRACT_ESCROW=<your-escrow-contract-id>
VITE_CONTRACT_ORACLE=<your-oracle-contract-id>

# API endpoints
VITE_API_URL=http://localhost:3000
```

### Development

```bash
# Start development server
npm run dev

# Open browser at http://localhost:5173
```

### Build for Production

```bash
# Create production build
npm run build

# Preview production build
npm run preview
```

### Testing

```bash
# Run tests
npm test

# Run tests with coverage
npm run test:coverage

# Run Lighthouse audit
npm run lighthouse
```

### Linting

```bash
# Run ESLint
npm run lint

# Fix linting issues
npm run lint:fix
```

## Features

- **Wallet Integration**: Connect with Freighter or other Stellar wallets
- **Match Creation**: Create chess matches with custom stakes
- **Deposit Management**: Deposit tokens into escrow
- **Real-time Updates**: WebSocket integration for live match updates
- **Match History**: View completed and active matches
- **Responsive Design**: Mobile-friendly interface

## Technology Stack

- **React**: UI framework
- **TypeScript**: Type-safe development
- **Vite**: Build tool and dev server
- **Stellar SDK**: Blockchain interaction
- **TailwindCSS** (if applicable): Styling

## Connecting to Backend

1. Deploy the backend contracts (see `../StellaRust-Backend/`)
2. Update `.env` with deployed contract addresses
3. Start the frontend dev server
4. Connect your Stellar wallet

## Troubleshooting

### Wallet Connection Issues

- Make sure Freighter extension is installed
- Check that you're on the correct network (testnet/mainnet)
- Try disconnecting and reconnecting

### Contract Not Found

- Verify contract addresses in `.env`
- Ensure backend is deployed to the correct network
- Check RPC URL is correct

### Transaction Failures

- Ensure you have sufficient XLM for fees
- Check that contracts are initialized
- Verify token allowances

## Contributing

See the main repository for contribution guidelines.

## License

MIT License - see LICENSE file
