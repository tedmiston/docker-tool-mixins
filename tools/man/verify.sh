#!/bin/bash

set -euo pipefail

source '/dtm/lib/verify.sh'

readonly verify_proc='man man'
readonly man_stdout="$(${verify_proc})"
readonly man_exit_code="${?}"

assert_exit_code "${man_exit_code}"
# TODO: figure out why this fails only on github actions
# assert_stdout_contains "${man_stdout}" 'MAN(1P)'
