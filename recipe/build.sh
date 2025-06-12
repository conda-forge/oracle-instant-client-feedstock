#!/bin/bash

set -ex

# Create directory for configuration
mkdir -p $PREFIX/lib

MAJOR_VERSION=$(echo $PKG_VERSION | cut -d. -f1)
MINOR_VERSION=$(echo $PKG_VERSION | cut -d. -f2)
PATCH_VERSION=$(echo $PKG_VERSION | cut -d. -f3)
SUBPATCH_VERSION=$(echo $PKG_VERSION | cut -d. -f4)

OIC_FOLDER_NAME=instantclient_${MAJOR_VERSION}_${MINOR_VERSION}

if [[ ${target_platform} == osx-* ]]; then
    echo "building for osx"

elif [[ ${target_platform} == linux-64 ]]; then
    # Extract the .zip
    mkdir -p tmp_extract
    unzip instantclient-basic-linux.x64-$PKG_VERSION.zip -d tmp_extract/

    # Copy contents to target lib folder
    cp -r tmp_extract/${OIC_FOLDER_NAME}/* $PREFIX/lib/
elif [[ ${target_platform} == linux-aarch64 ]]; then
    # Extract the .zip file
    mkdir -p tmp_extract
    unzip instantclient-basic-linux.arm64-$PKG_VERSION.zip -d tmp_extract/

    # Copy contents to target lib folder
    cp -r tmp_extract/${OIC_FOLDER_NAME}/* $PREFIX/lib/
fi

if [[ ${target_platform} == linux-* ]]; then
    # Patch the RPATHs
    patchelf --set-rpath '$ORIGIN/../lib' $PREFIX/lib/libnnz.so
    patchelf --set-rpath '$ORIGIN/../lib' $PREFIX/lib/libclntsh.so
    patchelf --set-rpath '$ORIGIN/../lib' $PREFIX/lib/libclntsh.so.10.1
    patchelf --set-rpath '$ORIGIN/../lib' $PREFIX/lib/libclntsh.so.11.1
    patchelf --set-rpath '$ORIGIN/../lib' $PREFIX/lib/libclntsh.so.12.1
    patchelf --set-rpath '$ORIGIN/../lib' $PREFIX/lib/libclntsh.so.18.1
    patchelf --set-rpath '$ORIGIN/../lib' $PREFIX/lib/libclntsh.so.19.1
    patchelf --set-rpath '$ORIGIN/../lib' $PREFIX/lib/libclntsh.so.20.1
    patchelf --set-rpath '$ORIGIN/../lib' $PREFIX/lib/libclntsh.so.21.1
    patchelf --set-rpath '$ORIGIN/../lib' $PREFIX/lib/libclntsh.so.22.1
    patchelf --set-rpath '$ORIGIN/../lib' $PREFIX/lib/libclntsh.so.23.1
    patchelf --set-rpath '$ORIGIN/../lib' $PREFIX/lib/libocijdbc23.so
    patchelf --set-rpath '$ORIGIN/../lib' $PREFIX/lib/libociei.so
    patchelf --set-rpath '$ORIGIN/../lib' $PREFIX/lib/uidrvci
    patchelf --set-rpath '$ORIGIN/../lib' $PREFIX/lib/genezi
    patchelf --set-rpath '$ORIGIN/../lib' $PREFIX/lib/adrci
fi
