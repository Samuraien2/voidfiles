chmod 0644 /etc/systemd/system/jottad.service
systemctl --system daemon-reload
systemctl enable jottad
