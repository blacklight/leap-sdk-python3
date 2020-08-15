#!/bin/bash


SDK_PATH=./leap/LeapSDK
ARCH=$(uname -m | sed -e 's/x86_64/x64/')
SWIG=swig

[ -f ./LeapSDK.tar.gz ] || wget -O LeapSDK.tar.gz http://warehouse.leapmotion.com/apps/4185/download/
mkdir -p leap
tar xvf LeapSDK.tar.gz -C leap --strip-components 1
cp -r ${SDK_PATH}/include ./include
wget http://tinyurl.com/leap-i-patch -O Leap.i.diff
patch -p0 < Leap.i.diff
[ ! -z "$(type -p "swig-3")" ] && SWIG=swig-3
[ ! -z "$(type -p "swig3.0")" ] && SWIG=swig3.0

${SWIG} -c++ -python -o LeapPython.cpp -interface LeapPython ./include/Leap.i
g++ -fPIC $(pkg-config --cflags --libs python3) -I${SDK_PATH}/include LeapPython.cpp ${SDK_PATH}/lib/${ARCH}/libLeap.so -shared -o LeapPython.so

