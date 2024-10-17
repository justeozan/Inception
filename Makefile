.DEFAULT_GOAL = all

WP_DATA = /home/ozasahin/data/wordpress
DB_DATA = /home/ozasahin/data/mariadb
DOCKER_COMPOSE = docker-compose -f srcs/docker-compose.yml

all: up

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

clean: down
	docker stop $$(docker ps -qa) || true
	sudo docker rm $$(docker ps -qa) || true
	sudo docker rmi -f $$(docker images -qa) || true
	rm -rf $(WP_DATA) || true
	rm -rf $(DB_DATA) || true

prune: clean
	sudo docker system prune -a --volumes -f
	sudo docker volume rm mariadb_data wordpress_data

re: clean up

status:
	$(DOCKER_COMPOSE) ps

.PHONY: all build up down start logs restart clean re prune status



