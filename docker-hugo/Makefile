COMPOSE_BUILD_HUGO = docker-compose build --no-cache hugo
COMPOSE_RUN_HUGO = docker-compose run --rm hugo
ENVFILE ?= env.template

all:
	ENVFILE=env.example $(MAKE) envfile build test clean

ciTest: envfile build test clean

ciDeploy: envfile build test deploy clean

envfile:
	cp -f $(ENVFILE) .env

pull:
	docker-compose pull

build:
	$(COMPOSE_BUILD_HUGO)

test:
	$(COMPOSE_RUN_HUGO) ./scripts/test.sh

shell:
	$(COMPOSE_RUN_HUGO)

deploy:
	$(COMPOSE_RUN_HUGO) ./scripts/deploy.sh

clean:
	docker-compose down --remove-orphans
	rm -f .env
