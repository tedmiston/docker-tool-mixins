#!/bin/bash

set -euo pipefail

function get_tool_name() {
    local -r tool_name=$(basename "$(pwd)")

    echo "${tool_name}"
}
