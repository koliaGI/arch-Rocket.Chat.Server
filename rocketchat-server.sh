#!/usr/bin/env bash

function export-config() {
	local config="/etc/rocketchat-server/rocketchat-server.conf"

	if [[ ! -r "${config}" ]] ; then
		echo "Could not read ${config}!"
		exit 1
	fi

	echo -n "Reading configuration from ${config}..."

	set -a
	. "${config}"
	set +a

	echo "done"
}

function main() {
	export-config

	echo "Starting rocketchat...done"
	node "/usr/share/rocketchat-server/main.js"
}

main "$@"
