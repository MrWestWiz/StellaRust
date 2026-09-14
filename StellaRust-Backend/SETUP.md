# StellaRust Backend

This is the **backend portion** of the StellaRust project, containing:
- Rust smart contracts (Soroban)
- Oracle service
- Event indexer service
- E2E tests
- Build and deployment scripts

## Project Structure

```
StellaRust-Backend/
├── contracts/           # Soroban smart contracts
│   ├── escrow/         # Main escrow contract
│   └── oracle/         # Oracle contract
├── oracle-service/     # Oracle service (Rust)
├── services/           # Supporting services
│   └── event-indexer/  # Event indexing service
├── e2e-tests/          # End-to-end tests
├── scripts/            # Build and deployment scripts
├── Cargo.toml          # Rust workspace configuration
├── environments.toml   # Network configurations
└── docker-compose.yml  # Docker setup

```

## Frontend Repository

The frontend has been separated into: `../StellaRust-Frontend/`

## Quick Start

### Prerequisites

- Rust (1.70+)
- Soroban CLI
- Stellar CLI
- Docker (optional, for containerized deployment)

### Build Smart Contracts

```bash
# Build all contracts
cargo build --release --target wasm32-unknown-unknown

# Or use the build script
./scripts/build.sh
```

### Run Tests

```bash
# Run all tests
cargo test

# Or use the test script
./scripts/test.sh
```

### Setup Environment

```bash
# Copy environment template
cp .env.example .env

# Edit .env with your configuration
```

### Deploy to Testnet

```bash
# Generate deployer keys
stellar keys generate deployer --network testnet

# Deploy contracts
./scripts/deploy_testnet.sh
```

## Development

### Running Oracle Service

The oracle service monitors chess game results and submits them to the smart contract.

```bash
cd oracle-service
cargo run
```

### Running Event Indexer

```bash
cd services/event-indexer
cargo run
```

### Docker Deployment

```bash
# Start all services
docker-compose up -d

# View logs
docker-compose logs -f

# Stop services
docker-compose down
```

## Testing

### Unit Tests

```bash
cargo test -p escrow
cargo test -p oracle
```

### E2E Tests

```bash
# Build contracts first
cargo build --target wasm32-unknown-unknown --release

# Run E2E tests
cargo test -p e2e-tests
```

## Network Configuration

Configured in `environments.toml`:
- **testnet**: Stellar testnet (recommended for development)
- **mainnet**: Stellar mainnet (production)
- **futurenet**: Preview of upcoming features
- **standalone**: Local development node

## Architecture

The backend consists of:

1. **Escrow Contract**: Manages match creation, deposits, and payouts
2. **Oracle Contract**: Verifies game results from chess platforms
3. **Oracle Service**: Bridges chess APIs to blockchain
4. **Event Indexer**: Indexes contract events for queries

## API Documentation

See the main README.md for smart contract API reference.

## License

MIT License - see LICENSE file
