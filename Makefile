include ./.env.dist
-include ./.env
export

include ./.makefile/Makefile.color
include ./.makefile/Makefile.function
include ./.makefile/Makefile.elasticsearch
include ./.makefile/Makefile.maria
include ./.makefile/Makefile.minio
include ./.makefile/Makefile.mongodb
include ./.makefile/Makefile.mssql
include ./.makefile/Makefile.mysql
include ./.makefile/Makefile.oracle
include ./.makefile/Makefile.postgres
include ./.makefile/Makefile.redis


.DEFAULT_GOAL := help
OUTPUT := @
MAKEFLAGS += --no-print-directory

DOCKER_COMPOSE := docker compose

DEFAULT := $(DOCKER_COMPOSE) exec -e OUTPUT=$(OUTPUT) -it mysql
DEFAULT_EXECUTE := $(DEFAULT) bash

DOCKER_CONTAINER := $(DOCKER_CONTAINER)
DEV_IMAGE_TAG := $(DEV_IMAGE_TAG)
BASE_IMAGE_TAG := $(BASE_IMAGE_TAG)
PLATFORMS := $(PLATFORMS)

start:
	$(call measure_time, start-callback)

restart:
	$(call measure_time, restart-callback)

help:
	$(OUTPUT)printf $(COLOR_GREEN)
	$(OUTPUT)bash -c "tail -500 README.makefile.md"
	$(OUTPUT)printf $(COLOR_OFF)"\n\n"

build: \
	docker-login
	DOCKER_BUILDKIT=1 $(DOCKER_COMPOSE) build --pull --compress --parallel --force-rm

stop:
	$(DOCKER_COMPOSE) down --remove-orphans

console:
	$(OUTPUT)$(DEFAULT_EXECUTE)

clean-stack:
	$(DOCKER_COMPOSE) down -v --rmi all --remove-orphans

validate-docker-compose:
	$(OUTPUT)$(DOCKER_COMPOSE) config --quiet && \
	printf $(COLOR_GREEN)"docker-compose.yml OK\n"$(COLOR_OFF) || \
	printf $(COLOR_RED)"docker-compose.yml ERROR\n"$(COLOR_OFF) exit 1

docker-login:
	$(OUTPUT)echo ${DOCKER_PASS} | docker login -u ${DOCKER_REPO_USER} --password-stdin

fix-line-endings:
	$(OUTPUT)find . -type f -print0 | xargs -0 dos2unix

build-%:
	$(call measure_time, build-$*-callback)

start-callback: \
	docker-login \
	build
	$(OUTPUT)$(DOCKER_COMPOSE) up -d --force-recreate
	$(OUTPUT)printf $(COLOR_GREEN)"\n\n"
	$(OUTPUT)bash -c "tail -500 README.makefile.md"
	$(OUTPUT)printf $(COLOR_OFF)
	$(OUTPUT)printf $(COLOR_GREEN)"\n Docker containers built and started! \n\n"$(COLOR_OFF)

restart-callback: \
	clean-stack \
	start-callback

build-%-callback:
	$(call buildx-build, $*)


logo-callback:
	APP_NAME=$(APP_NAME)
	$(OUTPUT)printf $(COLOR_BLUE)
	$(OUTPUT)awk '{printf "%10s%s\n", "", $$0}' .makefile/assets/logo.asci
	$(OUTPUT)printf $(COLOR_WHITE)
	echo  '                                                             '
	echo  "                        $$APP_NAME                           "
	$(OUTPUT)printf $(COLOR_BLUE)
	echo  '                                                             '
	echo  '                Opillion GmbH & Co KG (GPL-3.0 2024)         '
	$(OUTPUT)printf $(COLOR_OFF)"\n\n"
