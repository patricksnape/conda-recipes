#!/bin/bash

# tested on OSX 10.8.5, ubuntu 12.04

# compilation fails when enabling rtm intrinsics with gcc 4.8.1
# sed -i "s|RTM_KEY = -mrtm||g" build/linux.gcc.inc

MACOSX_DEPLOYMENT_TARGET=10.9 make -j$CPU_COUNT cpp0x=1 stdlib=libc++

# filter libtbb.dylib ( or .so ), libtbbmalloc.dylib ( or .so )
cp `find . -name "*lib*" | grep tbb | grep release` $PREFIX/lib

# copy the include files
cp -r ./include/tbb $PREFIX/include/tbb
