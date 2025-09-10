#!/bin/sh
mkdir -p ~/dl
mkdir -p ~/doc
mkdir -p ~/img
mkdir -p ~/music
mkdir -p ~/.config/alacritty

cp files/i3-config ~/.config/i3/config
cp files/alacritty.toml ~/.config/alacritty/
cp files/xinitrc ~/.xinitrc
cp files/bash_profile ~/.bash_profile
cp files/user-dirs.dirs ~/.config/
