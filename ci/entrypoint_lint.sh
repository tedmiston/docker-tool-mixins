#!/bin/bash

set -euo pipefail

apk update
apk add --no-cache bash

shellcheck $(bash -c "shopt -s globstar && ls **/*.sh")
