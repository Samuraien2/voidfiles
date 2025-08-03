#!/bin/sh
VER=575.64.05
FILE=NVIDIA-Linux-x86_64-$VER.run
wget https://us.download.nvidia.com/XFree86/Linux-x86_64/$VER/$FILE
mv $FILE NVIDIA-$VER.run
