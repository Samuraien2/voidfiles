#!/bin/sh

VER=580.65.06    #BETA
#VER=575.64.05   #NEW_FEATURE_BRANCH
#VER=570.181     #STABLE

FILE=NVIDIA-Linux-x86_64-$VER.run
TARGET=NVIDIA-$VER.run
wget https://us.download.nvidia.com/XFree86/Linux-x86_64/$VER/$FILE
mv $FILE $TARGET
chmod +x $TARGET
