#!/bin/bash

set -euo pipefail

source '/dtm/lib/install.sh'

# https://stackoverflow.com/questions/39055223/how-to-get-man-working-in-an-alpine-linux-docker-container

readonly pkgs=(man man-pages mdocml-apropos)
apk_add pkgs[@]
