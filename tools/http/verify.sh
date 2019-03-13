#!/bin/bash

set -euo pipefail

source '/dt/lib/verify.sh'

readonly verify_proc=$(infer_version_command)
readonly httpie_stdout="$(${verify_proc})"
readonly httpie_exit_code="${?}"

assert_exit_code "${httpie_exit_code}"
assert_stdout_equals "${httpie_stdout}" '1.0.2'
