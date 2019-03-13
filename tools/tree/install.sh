#!/bin/bash

set -euo pipefail

source '/dtm/lib/install.sh'

readonly pkgs=(tree)
apk_add pkgs[@]
