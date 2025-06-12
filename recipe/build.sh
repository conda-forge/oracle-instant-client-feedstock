#!/bin/bash

set -ex

# Create directory for configuration
mkdir -p $PREFIX/lib

MAJOR_VERSION=$(echo $PKG_VERSION | cut -d. -f1)
MINOR_VERSION=$(echo $PKG_VERSION | cut -d. -f2)
PATCH_VERSION=$(echo $PKG_VERSION | cut -d. -f3)
SUBPATCH_VERSION=$(echo $PKG_VERSION | cut -d. -f4)


if [[ ${target_platform} == osx-* ]]; then
    echo "building for osx"

elif [[ ${target_platform} == linux-64 ]]; then
    # For Linux, extract the .zip
    mkdir -p tmp_extract
    unzip instantclient-basic-linux.x64-23.8.0.25.04.zip -d tmp_extract/
    echo "listing extracted..."

    # Copy libs to target folder
    cp tmp_extract/instantclient_23_8/libclntshcore.so $PREFIX/lib/
    cp tmp_extract/instantclient_23_8/libclntshcore.so.12.1 $PREFIX/lib/
    cp tmp_extract/instantclient_23_8/libclntshcore.so.18.1 $PREFIX/lib/
    cp tmp_extract/instantclient_23_8/fips.so $PREFIX/lib/
    cp tmp_extract/instantclient_23_8/libclntshcore.so.20.1 $PREFIX/lib/
    cp tmp_extract/instantclient_23_8/legacy.so $PREFIX/lib/
    cp tmp_extract/instantclient_23_8/libclntsh.so $PREFIX/lib/
    cp tmp_extract/instantclient_23_8/libclntsh.so.10.1 $PREFIX/lib/
    cp tmp_extract/instantclient_23_8/libclntsh.so.11.1 $PREFIX/lib/
    cp tmp_extract/instantclient_23_8/libclntsh.so.12.1 $PREFIX/lib/
    cp tmp_extract/instantclient_23_8/libclntsh.so.18.1 $PREFIX/lib/
    cp tmp_extract/instantclient_23_8/libclntsh.so.19.1 $PREFIX/lib/
    cp tmp_extract/instantclient_23_8/libclntsh.so.20.1 $PREFIX/lib/
    cp tmp_extract/instantclient_23_8/libclntsh.so.21.1 $PREFIX/lib/
    cp tmp_extract/instantclient_23_8/libclntsh.so.22.1 $PREFIX/lib/
    cp tmp_extract/instantclient_23_8/libclntsh.so.23.1 $PREFIX/lib/
    cp tmp_extract/instantclient_23_8/libocci.so.21.1 $PREFIX/lib/
    cp tmp_extract/instantclient_23_8/libocci.so.22.1 $PREFIX/lib/
    cp tmp_extract/instantclient_23_8/libocci.so.23.1 $PREFIX/lib/
    cp tmp_extract/instantclient_23_8/libclntshcore.so.19.1 $PREFIX/lib/
    cp tmp_extract/instantclient_23_8/libocijdbc23.so $PREFIX/lib/
    cp tmp_extract/instantclient_23_8/libclntshcore.so.21.1 $PREFIX/lib/
    cp tmp_extract/instantclient_23_8/libclntshcore.so.22.1 $PREFIX/lib/
    cp tmp_extract/instantclient_23_8/libclntshcore.so.23.1 $PREFIX/lib/
    cp tmp_extract/instantclient_23_8/libnnz.so $PREFIX/lib/
    cp tmp_extract/instantclient_23_8/libocci.so $PREFIX/lib/
    cp tmp_extract/instantclient_23_8/libocci.so.10.1 $PREFIX/lib/
    cp tmp_extract/instantclient_23_8/libocci.so.11.1 $PREFIX/lib/
    cp tmp_extract/instantclient_23_8/libocci.so.12.1 $PREFIX/lib/
    cp tmp_extract/instantclient_23_8/libocci.so.18.1 $PREFIX/lib/
    cp tmp_extract/instantclient_23_8/libocci.so.19.1 $PREFIX/lib/
    cp tmp_extract/instantclient_23_8/libocci.so.20.1 $PREFIX/lib/
    cp tmp_extract/instantclient_23_8/libociei.so $PREFIX/lib/
    cp tmp_extract/instantclient_23_8/libtfojdbc1.so $PREFIX/lib/
    cp -r tmp_extract/instantclient_23_8/network $PREFIX/lib/
    cp tmp_extract/instantclient_23_8/ojdbc11.jar $PREFIX/lib/
    cp tmp_extract/instantclient_23_8/ojdbc17.jar $PREFIX/lib/
    cp tmp_extract/instantclient_23_8/ojdbc8.jar $PREFIX/lib/
    cp tmp_extract/instantclient_23_8/pkcs11.so $PREFIX/lib/
    cp tmp_extract/instantclient_23_8/ucp.jar $PREFIX/lib/
    cp tmp_extract/instantclient_23_8/ucp11.jar $PREFIX/lib/
    cp tmp_extract/instantclient_23_8/ucp17.jar $PREFIX/lib/
    cp tmp_extract/instantclient_23_8/uidrvci $PREFIX/lib/
    cp tmp_extract/instantclient_23_8/xstreams.jar $PREFIX/lib/
elif [[ ${target_platform} == linux-aarch64 ]]; then
    # For Linux, extract the .zip
    mkdir -p tmp_extract
    unzip instantclient-basic-linux.arm64-23.8.0.25.04.zip -d tmp_extract/
    echo "listing extracted..."

    # Copy libs to target folder
    echo "it's copying!"

    cp tmp_extract/instantclient_23_8/libclntshcore.so $PREFIX/lib/
    cp tmp_extract/instantclient_23_8/libclntshcore.so.12.1 $PREFIX/lib/
    cp tmp_extract/instantclient_23_8/libclntshcore.so.18.1 $PREFIX/lib/
    cp tmp_extract/instantclient_23_8/fips.so $PREFIX/lib/
    cp tmp_extract/instantclient_23_8/libclntshcore.so.20.1 $PREFIX/lib/
    cp tmp_extract/instantclient_23_8/legacy.so $PREFIX/lib/
    cp tmp_extract/instantclient_23_8/libclntsh.so $PREFIX/lib/
    cp tmp_extract/instantclient_23_8/libclntsh.so.10.1 $PREFIX/lib/
    cp tmp_extract/instantclient_23_8/libclntsh.so.11.1 $PREFIX/lib/
    cp tmp_extract/instantclient_23_8/libclntsh.so.12.1 $PREFIX/lib/
    cp tmp_extract/instantclient_23_8/libclntsh.so.18.1 $PREFIX/lib/
    cp tmp_extract/instantclient_23_8/libclntsh.so.19.1 $PREFIX/lib/
    cp tmp_extract/instantclient_23_8/libclntsh.so.20.1 $PREFIX/lib/
    cp tmp_extract/instantclient_23_8/libclntsh.so.21.1 $PREFIX/lib/
    cp tmp_extract/instantclient_23_8/libclntsh.so.22.1 $PREFIX/lib/
    cp tmp_extract/instantclient_23_8/libclntsh.so.23.1 $PREFIX/lib/
    cp tmp_extract/instantclient_23_8/libocci.so.21.1 $PREFIX/lib/
    cp tmp_extract/instantclient_23_8/libocci.so.22.1 $PREFIX/lib/
    cp tmp_extract/instantclient_23_8/libocci.so.23.1 $PREFIX/lib/
    cp tmp_extract/instantclient_23_8/libclntshcore.so.19.1 $PREFIX/lib/
    cp tmp_extract/instantclient_23_8/libocijdbc23.so $PREFIX/lib/
    cp tmp_extract/instantclient_23_8/libclntshcore.so.21.1 $PREFIX/lib/
    cp tmp_extract/instantclient_23_8/libclntshcore.so.22.1 $PREFIX/lib/
    cp tmp_extract/instantclient_23_8/libclntshcore.so.23.1 $PREFIX/lib/
    cp tmp_extract/instantclient_23_8/libnnz.so $PREFIX/lib/
    cp tmp_extract/instantclient_23_8/libocci.so $PREFIX/lib/
    cp tmp_extract/instantclient_23_8/libocci.so.10.1 $PREFIX/lib/
    cp tmp_extract/instantclient_23_8/libocci.so.11.1 $PREFIX/lib/
    cp tmp_extract/instantclient_23_8/libocci.so.12.1 $PREFIX/lib/
    cp tmp_extract/instantclient_23_8/libocci.so.18.1 $PREFIX/lib/
    cp tmp_extract/instantclient_23_8/libocci.so.19.1 $PREFIX/lib/
    cp tmp_extract/instantclient_23_8/libocci.so.20.1 $PREFIX/lib/
    cp tmp_extract/instantclient_23_8/libociei.so $PREFIX/lib/
    cp tmp_extract/instantclient_23_8/libtfojdbc1.so $PREFIX/lib/
    cp tmp_extract/instantclient_23_8/pkcs11.so $PREFIX/lib/

    cp tmp_extract/instantclient_23_8/ojdbc11.jar $PREFIX/lib/
    cp tmp_extract/instantclient_23_8/ojdbc17.jar $PREFIX/lib/
    cp tmp_extract/instantclient_23_8/ojdbc8.jar $PREFIX/lib/
    cp tmp_extract/instantclient_23_8/ucp.jar $PREFIX/lib/
    cp tmp_extract/instantclient_23_8/ucp11.jar $PREFIX/lib/
    cp tmp_extract/instantclient_23_8/ucp17.jar $PREFIX/lib/
    cp tmp_extract/instantclient_23_8/uidrvci $PREFIX/lib/
    cp tmp_extract/instantclient_23_8/xstreams.jar $PREFIX/lib/

    cp -r tmp_extract/instantclient_23_8/network $PREFIX/lib/

    #patchelf --set-rpath ../lib $PREFIX/lib/libclntsh.so.23.1

    echo "cwd is: $PWD"

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

    echo "copied!"
    echo "========================"
fi

