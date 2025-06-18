#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source $CURRENT_DIR/shared.sh

main() {
    h=$(get_info host)
    case "${h}" in
        Mac.lan) echo "skye" ;;
        skye.lan) echo "skye" ;;
        skye.local) echo "skye" ;;
        *) echo "${h}" ;;
    esac
}

main
