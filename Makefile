SHELL=bash

.PHONY: build
build:
	docker build --no-cache -t tedmiston/docker-tool-mixins .

.PHONY: run
run:
	docker run --rm -it --entrypoint=/bin/bash tedmiston/docker-tool-mixins

.PHONY: lint
lint:
	export SHELLCHECK_OPTS='--exclude=SC1091 --exclude=SC2034' \
	&& shopt -s globstar \
	&& shellcheck **/*.sh
