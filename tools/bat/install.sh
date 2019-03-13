#!/bin/bash

set -euo pipefail

# https://github.com/sharkdp/bat/releases

apk add less
wget --quiet https://github.com/sharkdp/bat/releases/download/v0.10.0/bat-v0.10.0-x86_64-unknown-linux-musl.tar.gz --output-document=bat.tar.gz
mkdir bat
tar x -f bat.tar.gz -C bat --strip-components=1
cp bat/bat /usr/bin

# user=sharkdp
# repo=bat
# version=v0.10.0
# # next 2 are custom to the bat release file naming convention... maybe would be more generic for the function to take in a template like:
# # "${repo}-${version}-x86_64-unknown-linux-musl.tar.gz"
# platform=x86_64
# package=unknown-linux-musl
# download_github_release ${user}/${repo} ${version} ${repo}-${version}-${platform}-${package}.tar.gz
