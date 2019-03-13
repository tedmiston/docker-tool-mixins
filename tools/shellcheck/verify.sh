#!/bin/bash

set -euo pipefail

source '/dtm/lib/verify.sh'

readonly verify_proc=$(infer_version_command)
readonly shellcheck_stdout="$(${verify_proc})"
readonly shellcheck_exit_code="${?}"

assert_exit_code "${shellcheck_exit_code}"
assert_stdout_contains "${shellcheck_stdout}" '0.6.0'
