#!/bin/sh
printf "#!/bin/sh\nloadkeys no\n" > /etc/rc.local
update
instf xbps/pre
update
instf xbps/main
instf xbps/devel
