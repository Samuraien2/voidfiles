#!/bin/sh

source="/usr/share/jottad"

cleanup_script="$source/cleanup.sh"
. "$source/init_detect.sh"

silent() {
  "$@" > /dev/null 2>&1
}

install_files() {
  platform="$1"
  version="$(version_${platform})"

  (
    cd "${source}/${platform}/${version}/files/" || exit 1

    # Write a cleanup script
    find . -print0 | xargs -r0 -n1 "$source/generate-cleanup.sh" > "$cleanup_script"

    # Actually do the installation
    find . -print0 | xargs -r0 -n1 "$source/install-path.sh"
  )
}

install_actions() {
  platform="$1"
  version="$(version_${platform})"
  

  actions="${source}/${platform}/${version}/install_actions.sh"
  if [ -f "$actions" ] ; then
    . "$actions"
  fi
}

install_service_restart() {
  echo "Starting jottad ($platform)..."
  case $platform in
    systemd) systemctl start jottad ;;
    upstart) initctl start jottad ;;
    sysv) /etc/init.d/jottad start ;;
  esac
}

platforms="systemd upstart sysv"
installed=0
for platform in $platforms ; do
  if has_$platform ; then
    install_files $platform
    install_actions $platform
    install_service_restart $platform
    installed=1
    break
  fi
done

if [ "$installed" -eq 0 ] ; then
  echo "Failed to detect any service platform, so no service was installed. Files are available in ${source} if you need them."
fi
