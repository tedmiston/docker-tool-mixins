#!/bin/bash

set -euo pipefail

source '/dt/lib/verify.sh'

readonly verify_proc=$(infer_version_command)
readonly curl_stdout="$(${verify_proc})"
readonly curl_exit_code="${?}"

assert_exit_code "${curl_exit_code}"
assert_stdout_contains "${curl_stdout}" 'curl 7.64.0'
