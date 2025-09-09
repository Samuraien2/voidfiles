#/bin/sh
set -x
mkdir -p ~/.local/share/fonts/JetBrainsMono/
curl -Lo /tmp/JetBrainsMono.tar.xz https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/JetBrainsMono.tar.xz
tar -xf /tmp/JetBrainsMono.tar.xz -C ~/.local/share/fonts/JetBrainsMono
fc-cache -f
set +x
