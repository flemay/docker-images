COMPOSE_BUILD_HUGO = docker-compose build --no-cache hugo
COMPOSE_RUN_HUGO = docker-compose run --rm hugo
COMPOSE_RUN_MUSKETEERS = docker-compose run --rm musketeers
ENVFILE ?= env.template

all:
	ENVFILE=env.example $(MAKE) envfile build test clean

ciTest: envfile build test clean

ciPush: envfile build test push clean

envfile:
	cp -f $(ENVFILE) .env

build:
	$(COMPOSE_BUILD_HUGO)

pull:
	docker-compose pull

test:
	$(COMPOSE_RUN_HUGO) ./scripts/test.sh

shell:
	$(COMPOSE_RUN_HUGO) bash

push:
	$(COMPOSE_RUN_MUSKETEERS) ./scripts/push.sh

clean:
	docker-compose down --remove-orphans
	rm -f .env
