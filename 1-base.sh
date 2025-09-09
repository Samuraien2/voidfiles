#!/bin/bash
REPO_FILE=/etc/xbps.d/00-repository-main.conf

if [[ $EUID -ne 0 ]]; then
    echo "Please run as root."
    exit 1
fi

cp --preserve=mode,ownership files/rc.local /etc/rc.local


rm -f /etc/xbps.d/*

add_repo() {
	local url="https://repo-fi.voidlinux.org/current$1"
	read -p "Add repository $url? [Y/n] " answer
	if [[ ! "$answer" =~ ^[nN] ]]; then
		echo "Adding $url to $REPO_FILE"
		echo "repository=$url" >> $REPO_FILE
	fi
}

add_repo ""
add_repo "/nonfree"
add_repo "/multilib"
add_repo "/multilib/nonfree"

bin/instf xbps/base-utils
