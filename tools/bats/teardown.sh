#!/bin/bash

set -euo pipefail

rm -rf ./bats-core-master
apk del .build-deps
