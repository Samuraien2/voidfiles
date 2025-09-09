#!/bin/bash

kv() {
	printf "\e[1;31m%s: \e[m%s\n" "$1" "$2"
}

kv "Host" "$(< /sys/class/dmi/id/product_name) $(< /sys/class/dmi/id/product_version)" 
kv "Kernel" $(uname -r)
kv "Uptime" "$(uptime -p | sed 's/^up //')"
kv "CPU" "$(lscpu | grep 'Model name' | awk -F: '{print $2}' | sed 's/^ *//')"
kv "CPU Temp" "$(s=$(< /sys/class/thermal/thermal_zone10/temp); echo ${s::-3})°C"
kv "Memory" "$(free -m | awk '/Mem:/ { printf "%dMiB / %dMiB\n", $3, $2 }')"
kv "Battery" "$(cat /sys/class/power_supply/BAT0/capacity)%"
kv "Disk" "$(df -h / | awk 'NR==2 {print $3" / " $2 " (" $5 ")"}')"
#kv "Public IP" $(wget -qO- icanhazip.com)
#kv "Local IP" $(hostname -I | awk '{print $1}')
