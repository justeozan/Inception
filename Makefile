COMPOSE_FILE=srcs/docker-compose.yml


build:
	docker-compose -f $(COMPOSE_FILE) build

up:
	docker-compose -f $(COMPOSE_FILE) up -d

down:
	docker-compose -f $(COMPOSE_FILE) down

logs:
	docker-compose -f $(COMPOSE_FILE) logs -f

restart:
	docker-compose -f $(COMPOSE_FILE) down
	docker-compose -f $(COMPOSE_FILE) up -d

clean:
	docker-compose -f $(COMPOSE_FILE) down -v

status:
	docker-compose -f $(COMPOSE_FILE) ps

.PHONY: clean status restart logs down up build



