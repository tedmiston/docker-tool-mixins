#!/bin/bash

set -euo pipefail

source '/dt/lib/install.sh'

readonly pkgs=(curl)
apk_add pkgs[@]
