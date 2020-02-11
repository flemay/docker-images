COMPOSE_BUILD_MUSKETEERS = docker-compose build --no-cache musketeers
COMPOSE_RUN_MUSKETEERS = docker-compose run --rm musketeers
COMPOSE_RUN_MUSKETEERS_DOCKER_SOCK = docker-compose run --rm musketeers_docker_sock
COMPOSE_RUN_MUSKETEERS_TEST = docker-compose run --rm musketeers_test
ENVFILE ?= env.template

all:
	ENVFILE=env.example $(MAKE) envfile build test clean

ciTest: envfile build test clean

ciDeploy: envfile build test deploy clean

envfile:
	cp -f $(ENVFILE) .env

build:
	$(COMPOSE_BUILD_MUSKETEERS)

test:
	$(COMPOSE_RUN_MUSKETEERS) ./scripts/test.sh

shell:
	$(COMPOSE_RUN_MUSKETEERS)

shellDockerSock:
	$(COMPOSE_RUN_MUSKETEERS_DOCKER_SOCK)

shellTest:
	$(COMPOSE_RUN_MUSKETEERS_TEST)

clean:
	docker-compose down --remove-orphans
	rm -f .env

deploy:
	$(COMPOSE_RUN_MUSKETEERS) ./scripts/deploy.sh
