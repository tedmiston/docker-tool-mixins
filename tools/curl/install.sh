#!/bin/bash

set -euo pipefail

source '/dtm/lib/install.sh'

readonly pkgs=(curl)
apk_add pkgs[@]
