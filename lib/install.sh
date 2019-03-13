#!/bin/bash

set -euo pipefail

function apk_add() {
    local -r packages=("${!1}")
    local -r enable_cache="${2:-false}"
    local -r virtual_name="${3:-}"

    local cache
    if [[ "${enable_cache}" == true ]];
    then
        cache=''
    else
        cache='--no-cache'
    fi

    local virtual
    if [[ "${virtual_name}" != '' ]];
    then
        virtual="--virtual ${virtual_name}"
    else
        virtual=''
    fi

    apk add --quiet ${cache} ${virtual} "${packages[@]}"
}
