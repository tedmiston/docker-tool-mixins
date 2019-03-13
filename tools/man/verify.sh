#!/bin/bash

set -euo pipefail

source '/dt/lib/verify.sh'

readonly verify_proc='man man'
readonly man_stdout="$(${verify_proc})"
readonly man_exit_code="${?}"

assert_exit_code "${man_exit_code}"
assert_stdout_contains "${man_stdout}" 'MAN(1P)'
