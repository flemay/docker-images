COMPOSE_BUILD = docker compose build myimage
COMPOSE_RUN ?= docker compose run --rm myimage
ENVFILE ?= env.template

envfile:
	cp -f $(ENVFILE) .env

build:
	$(COMPOSE_BUILD)

test:
	$(COMPOSE_RUN) -c "make _test"
_test:
	make --version
	python --version
	python3 --version
	aws --version
	session-manager-plugin --version
	cfn-flip --version
	cfn-lint --version

shell:
	$(COMPOSE_RUN)

clean:
	docker compose down --remove-orphans
	docker rmi flemay/aws:local
