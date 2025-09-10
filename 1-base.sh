#!/bin/bash
REPO_PREFIX="repo-fi"

if [[ $EUID -ne 0 ]]; then
    echo "Please run as root."
    exit 1
fi

append() {
	echo "$1" >> $2
	echo -e "\e[33m$2 \e[90m+= \e[32m\"$1\"\e[m"
}

cp "files/rc.local" /etc/rc.local

read -p "rc.local: /run/user/1000? [y/N] " run_user_1000
if [ "$run_user_1000" = y ]; then
	append "mkdir -p /run/user/1000" /etc/rc.local
fi


rm -f /etc/xbps.d/*

add_repo() {
	local url="https://$REPO_PREFIX.voidlinux.org/current$1"
	read -p "Add repository $url? [Y/n] " answer
	if [ "$answer" != "n" ]; then
		append "repository=$url" /etc/xbps.d/00-repository-main.conf
	fi
}

add_repo ""
add_repo "/nonfree"
add_repo "/multilib"
add_repo "/multilib/nonfree"

bin/instf xbps/base-utils
