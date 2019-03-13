#!/bin/bash

set -euo pipefail

source '_vars.sh'

rm -fr "shellcheck-${SHELLCHECK_VERSION}"
