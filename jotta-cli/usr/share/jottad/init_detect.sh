#!/bin/sh

version_systemd() {
  # Treat all systemd versions the same
  echo default
}

version_upstart() {
  version="$(initctl --version | head -1 | tr -d '()' | awk '{print $NF}')"

  case $version in
    0.6.5) echo $version ;;
    *) echo "1.5" ;; # default modern assumption
  esac
}

version_sysv() {
  echo lsb-3.1
}

has_systemd() {
  # Some OS vendors put systemd in ... different places ...
  [ -d "/lib/systemd/system/" -o -d "/usr/lib/systemd/system" ] && silent which systemctl
}

has_upstart() {
  [ -d "/etc/init" ] && silent which initctl
}

has_sysv() {
  [ -d "/etc/init.d" ] 
}

has_daemontools() {
  [ -d "/service" ] && silent which sv
}

