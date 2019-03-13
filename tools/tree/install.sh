#!/bin/bash

set -euo pipefail

source '/dt/lib/install.sh'

readonly pkgs=(tree)
apk_add pkgs[@]
