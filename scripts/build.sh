#!/bin/sh

NDK_PATH=$1
SDK_VERSION=$2
TARGET_ARCH=$3

ABI="$TARGET_ARCH"
if [ "$TARGET_ARCH" = "arm" ]; then
    ABI="armeabi-v7a"
elif [ "$TARGET_ARCH" = "arm64" ]; then
    ABI="arm64-v8a"
fi

LIB="out/bin/$ABI"
mkdir -p $LIB

if [ "$TARGET_ARCH" = "arm64" ] || [ "$TARGET_ARCH" = "x86_64" ]; then
    export LDFLAGS="-Wl,-z,max-page-size=16384"
fi

cd node
make clean
./android-configure patch
./android-configure $NDK_PATH $SDK_VERSION $TARGET_ARCH
make -j$(($(nproc) - 1))
cp ./out/Release/obj.target/libnode.so "../$LIB"
cd ..