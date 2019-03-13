#!/bin/bash

set -euo pipefail

source '/dt/lib/install.sh'

readonly pkgs=(curl xz)
apk_add pkgs[@] false '.build-deps'
