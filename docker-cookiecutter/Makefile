DOCKER_IMAGE_VERSION ?= latest
DOCKER_IMAGE = flemay/cookiecutter:$(DOCKER_IMAGE_VERSION)
COMPOSE_BUILD_MYIMAGE = DOCKER_IMAGE=$(DOCKER_IMAGE) docker-compose build --no-cache myimage
COMPOSE_RUN_MYIMAGE = DOCKER_IMAGE=$(DOCKER_IMAGE) docker-compose run --rm myimage
COMPOSE_RUN_MUSKETEERS = DOCKER_IMAGE=$(DOCKER_IMAGE) docker-compose run --rm musketeers
COMPOSE_PULL = DOCKER_IMAGE=$(DOCKER_IMAGE) docker-compose pull
ENVFILE ?= env.template

all:
	ENVFILE=env.example $(MAKE) envfile build test clean

ciTest: envfile build test clean

ciPush: envfile build test push clean

envfile:
	cp -f $(ENVFILE) .env

build:
	$(COMPOSE_BUILD_MYIMAGE)

pull:
	$(COMPOSE_PULL)

test:
	$(COMPOSE_RUN_MYIMAGE) ./scripts/test.sh

shell:
	$(COMPOSE_RUN_MYIMAGE)

push:
	$(COMPOSE_RUN_MUSKETEERS) ./scripts/push.sh

clean:
	docker-compose down --remove-orphans
	rm -f .env
