#!/bin/bash

set -euo pipefail

source '/dt/lib/verify.sh'

readonly verify_proc=$(infer_version_command)
readonly bat_stdout="$(${verify_proc})"
readonly bat_exit_code="${?}"

assert_exit_code "${bat_exit_code}"
assert_stdout_equals "${bat_stdout}" 'bat 0.10.0'
