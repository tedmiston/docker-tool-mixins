#!/bin/bash

set -euo pipefail

source '/dt/lib/core.sh'

readonly TOOLS_DIR=./tools
readonly INSTALL_DOCS=false
# readonly INSTALL_DOCS=true

readonly tools=$(find_tools ${TOOLS_DIR})

echo tools=
printf "%s\n\n" "${tools}"

run_global_setup "${TOOLS_DIR}"

for tool in ${tools}
do
	echo "* running ${tool}"
	(
        run_setup "${tool}" &&
        run_install "${tool}" &&
        run_teardown "${tool}" &&
        run_verify "${tool}"
	)
done

run_global_teardown "${TOOLS_DIR}"

install_docs ${INSTALL_DOCS}
