#!/bin/bash

set -euo pipefail

source '/dt/lib/verify.sh'

readonly verify_proc=$(infer_version_command)
readonly bats_stdout="$(${verify_proc})"
readonly bats_exit_code="${?}"

assert_exit_code "${bats_exit_code}"
assert_stdout_equals "${bats_stdout}" 'Bats 1.1.0'
