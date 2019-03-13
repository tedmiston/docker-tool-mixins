#!/bin/bash

set -euo pipefail

source '/dt/lib/install.sh'

readonly pkgs=(httpie)
apk_add pkgs[@]
