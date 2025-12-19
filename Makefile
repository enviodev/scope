.PHONY: setup db-start db-stop db-reset db-setup api-install api-dev api-start

# Full setup
setup: db-setup api-install

# Database
db-start:
	docker compose up -d postgres minio

db-stop:
	docker compose down

db-reset:
	docker compose down -v

db-setup: db-start
	@echo "Waiting for PostgreSQL to be ready..."
	@until docker compose exec -T postgres pg_isready -U postgres > /dev/null 2>&1; do sleep 1; done
	@echo "PostgreSQL is ready."
	cd registry && bun install
	cd registry && bun run db:migration:apply

# Registry
registry-generate:
	cd registry && bun run generate:labels

registry-generate-chain:
	@test -n "$(CHAIN)" || (echo "Usage: make registry-generate-chain CHAIN=<chain_id>" && exit 1)
	cd registry && bun run generate:labels $(CHAIN)

registry-chains:
	cd registry && bun run chains:list

# API
api-install:
	cd api && bun install

api-dev:
	cd api && bun run dev

api-start:
	cd api && bun run start

# UI
ui-install:
	cd ui && bun install

ui-dev:
	cd ui && bun run dev
