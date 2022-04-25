export DOCKER_BUILDKIT=1
export COMPOSE_DOCKER_CLI_BUILD=1

.PHONY: build
build:
	docker-compose build

.PHONY: up
up:
	docker-compose up -d

.PHONY: destroy
destroy:
	docker-compose down --volumes --remove-orphans
