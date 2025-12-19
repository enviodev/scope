# API

The backend API server for Scope. Built with Hono and Bun. Serves label data and contract information to the frontend.

## Development

### Environment

Create a `.env.local` file:

```
DATABASE_URL=postgresql://postgres:postgres@localhost:5432/scope

# Minio (optional, for contract source caching)
MINIO_ENDPOINT=localhost
MINIO_ACCESS_KEY=minio
MINIO_SECRET_KEY=minio123
MINIO_BUCKET=scope
```

### Setup

To install the dependencies:

```
bun install
```

To run the development server:

```
bun run dev
```

To run the production server:

```
bun run start
```

### Quick Start

From the repository root:

```
make setup       # Set up database and install dependencies
make api-dev     # Run API in development mode
```
