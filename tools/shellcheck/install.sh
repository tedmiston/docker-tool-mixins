#!/bin/bash

set -euo pipefail

source '_vars.sh'

wget -qO- "https://storage.googleapis.com/shellcheck/shellcheck-${SHELLCHECK_VERSION}.linux.x86_64.tar.xz" | tar -xJv
cp "shellcheck-${SHELLCHECK_VERSION}/shellcheck" /usr/bin/
