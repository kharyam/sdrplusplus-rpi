#!/bin/bash

sudo apt install -y cmake libhackrf-dev libhackrf0 libsoapysdr-dev librtaudio-dev libglfw3-dev libglew-dev libairspyhf-dev libiio-dev libad9361-dev libairspy-dev librtlsdr-dev portaudio19-dev libzstd1 libzstd-dev

cd ~/
git clone https://github.com/AlexandreRouma/SDRPlusPlus.git

cd SDRPlusPlus
mkdir build
cd build
# Disabled SDRPLAY due to an issue with a dependency not found:
#  .../SDRPlusPlus/source_modules/sdrplay_source/src/main.cpp:9:10: fatal error: sdrplay_api.h: No such file or directory
#    9 | #include <sdrplay_api.h>
#      |          ^~~~~~~~~~~~~~~
#    compilation terminated.
cmake .. -DOPT_BUILD_SDRPLAY_SOURCE:BOOL=OFF -DOPT_BUILD_NEW_PORTAUDIO_SINK:BOOL=ON -DOPT_BUILD_M17_DECODER:BOOL=ON
make -j3
sudo make install
sudo ldconfig
