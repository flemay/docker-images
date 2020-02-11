COMPOSE_BUILD_AWS = docker-compose build --no-cache aws
COMPOSE_RUN_AWS = docker-compose run --rm aws
COMPOSE_RUN_MUSKETEERS = docker-compose run --rm musketeers
ENVFILE ?= env.template

export IMAGE_NAME=flemay/aws:latest

all:
	ENVFILE=env.example $(MAKE) envfile build test clean

ciTest: envfile build test clean

ciPush: envfile build test push clean

envfile:
	cp -f $(ENVFILE) .env

build:
	$(COMPOSE_BUILD_AWS)

pull:
	docker-compose pull

test:
	$(COMPOSE_RUN_AWS) ./scripts/test.sh

shell:
	$(COMPOSE_RUN_AWS) bash

push:
	$(COMPOSE_RUN_MUSKETEERS) ./scripts/push.sh

clean:
	docker-compose down --remove-orphans
	rm -f .env
