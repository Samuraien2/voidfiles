#!/bin/bash
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    echo "Error: Script is being run directly, do '. $0'"
	exit 1
fi

cp -r home/.bashrc bin/ ~
. ~/.bashrc
