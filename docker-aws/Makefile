COMPOSE_BUILD_AWS = docker-compose build --no-cache aws
COMPOSE_RUN_AWS = docker-compose run --rm aws
ENVFILE ?= env.template

all:
	ENVFILE=env.example $(MAKE) envfile build test clean

ciTest: envfile build test clean

ciDeploy: envfile build test deploy clean

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

deploy:
	$(COMPOSE_RUN_AWS) ./scripts/deploy.sh

clean:
	docker-compose down --remove-orphans
	rm -f .env
