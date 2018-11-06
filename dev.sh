#!/usr/bin/env bash
# shellcheck disable=SC1090

set -e
set -o pipefail

BASE_DIR="$( dirname "$( realpath -s "${BASH_SOURCE[0]}" )" )/"
cd "$BASE_DIR" || exit 1

mv log.txt log_old.txt &>/dev/null || true
exec 3> log.txt

command="$1"; shift || true
for file in ./inc/*.sh; do
	cd "$BASE_DIR"
	[[ -f "$file" ]] && source "$file"
done

[[ -n "$command" ]] || exit 0
for file in ./inc/$command/*.sh; do
	cd "$BASE_DIR"
	[[ -f "$file" ]] && source "$file"
done
