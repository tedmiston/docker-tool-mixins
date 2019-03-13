#!/bin/bash

set -euo pipefail

source '/dt/lib/verify.sh'

readonly verify_proc=$(infer_version_command)
readonly tree_stdout="$(${verify_proc})"
readonly tree_exit_code="${?}"

assert_exit_code "${tree_exit_code}"
assert_stdout_contains "${tree_stdout}" 'tree v1.8.0'
