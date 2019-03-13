#!/bin/bash

set -euo pipefail

source '/dtm/lib/install.sh'

function find_tools() {
    local -r tools_dir=${1}

    local -r tools=$(find "${tools_dir}" ! -path "${tools_dir}/_*" -maxdepth 1 -mindepth 1 -type d -print | sort)

    echo "${tools}"  # return
}

function _run_global_stage() {
    local -r tools_dir=${1}
    local -r stage_name=${2}

    (
        cd "${tools_dir}" &&
        if [[ -f "./_${stage_name}.sh" ]]; then
            echo "INFO: global ${stage_name}"
            "./_${stage_name}.sh"
        else
            echo "DEBUG: no global ${stage_name}"
        fi
    )

    echo
}

function run_global_setup() {
    _run_global_stage "${1}" 'setup'
}

function run_global_teardown() {
    _run_global_stage "${1}" 'teardown'
}

function run_stage() {
    local -r tool_dir=${1}
    local -r stage_name=${2}

    (
        cd "${tool_dir}" &&
        if [[ -f "./${stage_name}.sh" ]]; then
            echo "INFO: ${stage_name} ${tool_dir}"
            "./${stage_name}.sh"
        else
            echo "DEBUG: no ${stage_name} for ${tool_dir}"
        fi
    )

    echo
}

function run_setup() {
    run_stage "${1}" 'setup'
}

function run_install() {
    run_stage "${1}" 'install'
}

function run_teardown() {
    run_stage "${1}" 'teardown'
}

function run_verify() {
    run_stage "${1}" 'verify'
}

function install_docs() {
    # add docs for all packages
    # runs post-teardown so docs are not installed for removed packages

    local -r enabled=${1}

    if [[ "${INSTALL_DOCS}" == true ]];
    then
        local -r pkgs=('docs')
        apk_add pkgs
    else
        echo "DEBUG: not installing docs"
    fi

    echo
}
