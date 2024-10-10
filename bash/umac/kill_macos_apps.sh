#!/usr/bin/env bash

# cur_dir=$(pwd)

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)

source "${SCRIPT_DIR}/src/opts/apps.sh"

app=$1

# _close_func "prl_client_app"
_close_func "$app"
