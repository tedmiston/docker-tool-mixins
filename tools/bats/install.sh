#!/bin/bash

set -euo pipefail

source '/dtm/lib/install.sh'

readonly pkgs=(bash coreutils ncurses)
apk_add pkgs[@]

wget --quiet https://github.com/bats-core/bats-core/archive/master.zip --output-document=bats.zip
unzip -qq bats.zip
bash bats-core-master/install.sh /usr/local
