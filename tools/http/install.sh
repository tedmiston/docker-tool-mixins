#!/bin/bash

set -euo pipefail

source '/dtm/lib/install.sh'

readonly pkgs=(httpie)
apk_add pkgs[@]
