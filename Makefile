.DEFAULT_GOAL = all

P_DATA = /home/ozasahin/data/wordpress
DB_DATA = /home/ozasahin/data/mariadb
DOCKER_COMPOSE = docker-compose -f srcs/docker-compose.yml

all: build up

build:
	$(DOCKER_COMPOSE) build

up: build
	@mkdir -p $(WP_DATA)
	@mkdir -p $(DB_DATA)
	$(DOCKER_COMPOSE) up -d

down:
	$(DOCKER_COMPOSE) down

start:
	$(DOCKER_COMPOSE) start

stop:
	$(DOCKER_COMPOSE) stop

logs:
	$(DOCKER_COMPOSE) logs -f

restart:
	$(DOCKER_COMPOSE) down
	$(DOCKER_COMPOSE) up -d

clean:
	@docker stop $$(docker ps -qa) || true
	@docker rm $$(docker ps -qa) || true
	@docker rmi -f $$(docker images -qa) || true
	@rm -rf $(WP_DATA) || true
	@rm -rf $(DB_DATA) || true

status:
	$(DOCKER_COMPOSE) ps

.PHONY: all build up down start logs restart clean status



