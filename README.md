# Node for Android

## Setup

**Ubuntu**
```bash
dpkg --add-architecture i386
apt install git make clang gcc-multilib g++-multilib zlib1g-dev zlib1g-dev:i386
```

**Fedora**
```bash
dnf install zlib-ng-compat.i686 zlib-ng-compat.x86_64
```

## Building
```bash
git clone --recursive https://github.com/Stremio/node-android
./scripts/patch.sh
./scripts/build.sh <NDK_PATH> <SDK_VERSION> <TARGET_ARCH>
./scripts/headers.sh
```
