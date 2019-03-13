#!/bin/bash

set -euo pipefail

apk update
apk add --no-cache bash

export SHELLCHECK_OPTS='--exclude=SC1091 --exclude=SC2034'
shellcheck $(bash -c "shopt -s globstar && ls **/*.sh")
