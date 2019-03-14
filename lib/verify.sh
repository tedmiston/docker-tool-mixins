
set -euo pipefail

source '/dtm/lib/utils.sh'

function infer_version_command() {
    local -r tool_name=$(get_tool_name)
    local -r command="${tool_name} --version"

    echo "${command}"
}

function assert_exit_code() {
    local -r exit_code="${1}"
    local -r expected="${2:-0}"  # 0 is desired almost always

    if [[ "$exit_code" == "${expected}" ]]; then
        echo "TEST PASS: exit code (${exit_code})"
    else
        echo "TEST FAIL: exit code (${exit_code} != ${expected})"
        exit 1
    fi
}

function assert_stdout_contains() {
    local -r stdout="${1}"
    local -r expected="${2}"

    if echo "${stdout}" | grep -q "${expected}"; then
        echo "TEST PASS: stdout"
    else
        echo "TEST FAIL: stdout"
        echo "${stdout}"
        exit 1
    fi
}

function assert_stdout_equals() {
    local -r stdout="${1}"
    local -r expected="${2}"

    if [[ "${stdout}" == "${expected}" ]]; then
        echo "TEST PASS: stdout (${stdout})"
    else
        echo "TEST FAIL: stdout"
        echo "${stdout}"
        exit 1
    fi
}
