# Registry

The label registry for Scope. Stores and generates labels for known addresses (protocols, smart accounts, modules, etc.).

## Development

### Environment

Create a `.env.local` file:

```
DATABASE_URL=postgresql://postgres:postgres@localhost:5432/scope

# RPC endpoints (format: RPC_<chainId>)
# Mainnets
RPC_1=
RPC_10=
RPC_143=
...

```

If no custom RPC is set for a chain, the default public RPC from viem will be used.

### Setup

To install the dependencies:

```
bun install
```

To apply database migrations:

```
bun run db:migration:apply
```

### Generating Labels

Generate labels for all enabled chains:

```
bun run generate:labels
```

Generate labels for a specific chain:

```
bun run generate:labels 8453    # Base
bun run generate:labels 42161   # Arbitrum
```

List available chains and their RPC status:

```
bun run generate:labels --list
```

### Quick Start

From the repository root:

```
make setup
```
