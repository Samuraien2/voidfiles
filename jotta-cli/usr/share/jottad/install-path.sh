#!/bin/sh

install_path() {
  d="${1##.}"
  if [ ! -z "$d" ] ; then 
    if [ -d "$1" -a ! -d "$d" ] ; then 
      mkdir "$d"
      chmod 0755 "$d"
    fi
    if [ -f "$1" ] ; then 
      cp -p "$1" "$d"
      if [ "$d" = "/etc/init.d/jottad" ] ; then
        chmod 0755 "$d"
      else
        chmod 0644 "$d"
      fi
    fi
  fi
}

for i in "$@" ; do
  install_path "$i"
done
