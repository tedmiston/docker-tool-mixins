SHELL=bash

.PHONY: build
build:
	# docker build --no-cache -t foo .
	docker build -t foo .

.PHONY: run
run:
	docker run --rm foo

.PHONY: debug
debug:
# 	docker run --rm -it --entrypoint=sh foo
# 	docker run --rm -it foo
	docker run --rm -it --entrypoint=/bin/bash foo

.PHONY: lint
lint:
	export SHELLCHECK_OPTS='--exclude=SC1091 --exclude=SC2034' \
	&& shopt -s globstar \
	&& shellcheck **/*.sh
