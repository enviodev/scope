# Scope

A block explorer with native support for ERC-4337 account abstraction.

Originally developed by [destiner](https://github.com/destiner). Now maintained and developed by [Envio](https://envio.dev).

## Structure

This monorepo contains four services:

### ui

The frontend application. Built with Nuxt.js. Provides the user interface for exploring blocks, transactions, addresses, and user operations.

### api

The backend API server. Built with Hono and Bun. Serves label data and contract information to the frontend.

### registry

The label registry. Stores and generates labels for known addresses (protocols, smart accounts, modules, etc.).

### indexer

An indexer for ERC-4337 events. Built with Envio HyperIndex. Indexes UserOperationEvent and AccountDeployed events from EntryPoint contracts across multiple chains. Deployed using Envio's hosted service.

## Local Development

### Prerequisites

- Docker
- Bun
- pnpm (for indexer)

### Quick Start

```
make setup      # Start services, apply migrations, install dependencies
make api-dev    # Run API server
make ui-dev     # Run UI (in another terminal)
```

### Commands

Database:

```
make db-start   # Start PostgreSQL and Minio
make db-stop    # Stop all containers
make db-reset   # Stop and remove all data
make db-setup   # Start database and apply migrations
```

Registry:

```
make registry-generate              # Generate labels for all chains
make registry-generate-chain CHAIN=8453  # Generate labels for specific chain
make registry-chains                # List available chains
```

API:

```
make api-install  # Install API dependencies
make api-dev      # Run API in development mode
make api-start    # Run API in production mode
```

UI:

```
make ui-install   # Install UI dependencies
make ui-dev       # Run UI in development mode
```

## License

MIT
