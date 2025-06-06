#!/bin/bash

set -ex

# Create directory for configuration
mkdir -p $PREFIX/lib

# get the (de)activate scripts
#CHANGE="deactivate"
#mkdir -p "${PREFIX}/etc/conda/${CHANGE}.d"
#cp "${RECIPE_DIR}/${CHANGE}.sh" "${PREFIX}/etc/conda/${CHANGE}.d/${PKG_NAME}_${CHANGE}.sh"
#
#CHANGE="activate"
#mkdir -p "${PREFIX}/etc/conda/${CHANGE}.d"
#cp "${RECIPE_DIR}/${CHANGE}.sh" "${PREFIX}/etc/conda/${CHANGE}.d/${PKG_NAME}_${CHANGE}.sh"
#sed -i.bak "s|@PKG_VERSION@|${PKG_VERSION}|g" "${PREFIX}/etc/conda/${CHANGE}.d/${PKG_NAME}_${CHANGE}.sh"
#sed -i.bak "s|@SHLIB_EXT@|${SHLIB_EXT}|g" "${PREFIX}/etc/conda/${CHANGE}.d/${PKG_NAME}_${CHANGE}.sh"
#if [[ ${target_platform} == "osx-64" ]]; then
#  sed -i.bak "s|@PLATFORM@|mac|g" "${PREFIX}/etc/conda/${CHANGE}.d/${PKG_NAME}_${CHANGE}.sh"
#  sed -i.bak "s|@ARCH@|x64|g" "${PREFIX}/etc/conda/${CHANGE}.d/${PKG_NAME}_${CHANGE}.sh"
#  sed -i.bak "s|@OS@|macos|g" "${PREFIX}/etc/conda/${CHANGE}.d/${PKG_NAME}_${CHANGE}.sh"
#  sed -i.bak "s|@VERTAIL@|dbru|g" "${PREFIX}/etc/conda/${CHANGE}.d/${PKG_NAME}_${CHANGE}.sh"
#  aver=$(echo ${PKG_VERSION} | tr -d ".")
#  sed -i.bak "s|@AVER@|${aver}|g" "${PREFIX}/etc/conda/${CHANGE}.d/${PKG_NAME}_${CHANGE}.sh"
#
#elif [[ ${target_platform} == "linux-64" ]]; then
#  sed -i.bak "s|@PLATFORM@|linux|g" "${PREFIX}/etc/conda/${CHANGE}.d/${PKG_NAME}_${CHANGE}.sh"
#  sed -i.bak "s|@ARCH@|x64|g" "${PREFIX}/etc/conda/${CHANGE}.d/${PKG_NAME}_${CHANGE}.sh"
#  sed -i.bak "s|@OS@|linux|g" "${PREFIX}/etc/conda/${CHANGE}.d/${PKG_NAME}_${CHANGE}.sh"
#  sed -i.bak "s|@VERTAIL@||g" "${PREFIX}/etc/conda/${CHANGE}.d/${PKG_NAME}_${CHANGE}.sh"
#  # the folder name for the version 23.7.0.25.1 is different than for the previous releases
#  aver=$(echo ${PKG_VERSION:0:6}.00.0 | tr -d ".")
#  sed -i.bak "s|@AVER@|${aver}|g" "${PREFIX}/etc/conda/${CHANGE}.d/${PKG_NAME}_${CHANGE}.sh"
#fi
#rm -f "${PREFIX}/etc/conda/${CHANGE}.d/${PKG_NAME}_${CHANGE}.sh.bak"


MAJOR_VERSION=$(echo $PKG_VERSION | cut -d. -f1)
MINOR_VERSION=$(echo $PKG_VERSION | cut -d. -f2)
PATCH_VERSION=$(echo $PKG_VERSION | cut -d. -f3)
SUBPATCH_VERSION=$(echo $PKG_VERSION | cut -d. -f4)


if [[ ${target_platform} == osx-* ]]; then
    echo dummy
    ## Install the main library file
    #cp -p lib/libmsodbcsql.${MAJOR_VERSION}.dylib $PREFIX/lib/
    ## Install resource files
    #cp -p share/msodbcsql${MAJOR_VERSION}/resources/en_US/msodbcsqlr${MAJOR_VERSION}.rll $PREFIX/share/msodbcsql${MAJOR_VERSION}/resources/en_US/
    #cp -p share/msodbcsql${MAJOR_VERSION}/resources/en_US/msodbcsqlr${MAJOR_VERSION}.rll $PREFIX/share/resources/en_US/
    ## Install header files
    #cp -p include/msodbcsql${MAJOR_VERSION}/msodbcsql.h $PREFIX/include/msodbcsql${MAJOR_VERSION}/
    ## Install documentation
    #cp -p share/doc/msodbcsql${MAJOR_VERSION}/LICENSE.txt $PREFIX/share/doc/msodbcsql${MAJOR_VERSION}/
    #cp -p share/doc/msodbcsql${MAJOR_VERSION}/RELEASE_NOTES $PREFIX/share/doc/msodbcsql${MAJOR_VERSION}/


elif [[ ${target_platform} == linux-64 ]]; then
    # For Linux, extract the .zip
    echo "dir is"
    echo $PREFIX/lib/
    mkdir -p tmp_extract
    ls tmp_extract
    unzip instantclient-basic-linux.x64-23.8.0.25.04.zip -d tmp_extract/
    echo "listing extracted..."
    #cd tmp_extract
    #ls .
    ls tmp_extract

    # Copy libs to target folder
    cp -p tmp_extract/instantclient_23_8/libclntshcore.so $PREFIX/lib/
    cp -p tmp_extract/instantclient_23_8/libclntshcore.so.12.1 $PREFIX/lib/
    cp -p tmp_extract/instantclient_23_8/libclntshcore.so.18.1 $PREFIX/lib/
    cp -p tmp_extract/instantclient_23_8/fips.so $PREFIX/lib/
    cp -p tmp_extract/instantclient_23_8/libclntshcore.so.20.1 $PREFIX/lib/
    cp -p tmp_extract/instantclient_23_8/legacy.so $PREFIX/lib/
    cp -p tmp_extract/instantclient_23_8/libclntsh.so $PREFIX/lib/
    cp -p tmp_extract/instantclient_23_8/libclntsh.so.10.1 $PREFIX/lib/
    cp -p tmp_extract/instantclient_23_8/libclntsh.so.11.1 $PREFIX/lib/
    cp -p tmp_extract/instantclient_23_8/libclntsh.so.12.1 $PREFIX/lib/
    cp -p tmp_extract/instantclient_23_8/libclntsh.so.18.1 $PREFIX/lib/
    cp -p tmp_extract/instantclient_23_8/libclntsh.so.19.1 $PREFIX/lib/
    cp -p tmp_extract/instantclient_23_8/libclntsh.so.20.1 $PREFIX/lib/
    cp -p tmp_extract/instantclient_23_8/libclntsh.so.21.1 $PREFIX/lib/
    cp -p tmp_extract/instantclient_23_8/libclntsh.so.22.1 $PREFIX/lib/
    cp -p tmp_extract/instantclient_23_8/libclntsh.so.23.1 $PREFIX/lib/
    cp -p tmp_extract/instantclient_23_8/libocci.so.21.1 $PREFIX/lib/
    cp -p tmp_extract/instantclient_23_8/libocci.so.22.1 $PREFIX/lib/
    cp -p tmp_extract/instantclient_23_8/libocci.so.23.1 $PREFIX/lib/
    cp -p tmp_extract/instantclient_23_8/libclntshcore.so.19.1 $PREFIX/lib/
    cp -p tmp_extract/instantclient_23_8/libocijdbc23.so $PREFIX/lib/
    cp -p tmp_extract/instantclient_23_8/libclntshcore.so.21.1 $PREFIX/lib/
    cp -p tmp_extract/instantclient_23_8/libclntshcore.so.22.1 $PREFIX/lib/
    cp -p tmp_extract/instantclient_23_8/libclntshcore.so.23.1 $PREFIX/lib/
    cp -p tmp_extract/instantclient_23_8/libnnz.so $PREFIX/lib/
    cp -p tmp_extract/instantclient_23_8/libocci.so $PREFIX/lib/
    cp -p tmp_extract/instantclient_23_8/libocci.so.10.1 $PREFIX/lib/
    cp -p tmp_extract/instantclient_23_8/libocci.so.11.1 $PREFIX/lib/
    cp -p tmp_extract/instantclient_23_8/libocci.so.12.1 $PREFIX/lib/
    cp -p tmp_extract/instantclient_23_8/libocci.so.18.1 $PREFIX/lib/
    cp -p tmp_extract/instantclient_23_8/libocci.so.19.1 $PREFIX/lib/
    cp -p tmp_extract/instantclient_23_8/libocci.so.20.1 $PREFIX/lib/
    cp -p tmp_extract/instantclient_23_8/libociei.so $PREFIX/lib/
    cp -p tmp_extract/instantclient_23_8/libtfojdbc1.so $PREFIX/lib/
    cp -p tmp_extract/instantclient_23_8/network $PREFIX/lib/
    cp -p tmp_extract/instantclient_23_8/ojdbc11.jar $PREFIX/lib/
    cp -p tmp_extract/instantclient_23_8/ojdbc17.jar $PREFIX/lib/
    cp -p tmp_extract/instantclient_23_8/ojdbc8.jar $PREFIX/lib/
    cp -p tmp_extract/instantclient_23_8/pkcs11.so $PREFIX/lib/
    cp -p tmp_extract/instantclient_23_8/ucp.jar $PREFIX/lib/
    cp -p tmp_extract/instantclient_23_8/ucp11.jar $PREFIX/lib/
    cp -p tmp_extract/instantclient_23_8/ucp17.jar $PREFIX/lib/
    cp -p tmp_extract/instantclient_23_8/uidrvci $PREFIX/lib/
    cp -p tmp_extract/instantclient_23_8/xstreams.jar $PREFIX/lib/
elif [[ ${target_platform} == linux-aarch64 ]]; then
    # For Linux, extract the .zip
    echo "dir is"
    echo $PREFIX/lib/
    mkdir -p tmp_extract
    ls tmp_extract
    echo "WHICH UNZIIIIIIIIIIIIIIIIIIIIP"
    which unzip
    unzip instantclient-basic-linux.arm64-23.8.0.25.04.zip -d tmp_extract/
    echo "listing extracted..."
    #cd tmp_extract
    #ls .
    ls tmp_extract

    # Copy libs to target folder
    echo "it's copying!"
    #export PREFIX=${CONDA_PREFIX}
    echo "prefix is: $PREFIX"
    cp -p tmp_extract/instantclient_23_8/libclntshcore.so $PREFIX/lib/
    cp -p tmp_extract/instantclient_23_8/libclntshcore.so.12.1 $PREFIX/lib/
    cp -p tmp_extract/instantclient_23_8/libclntshcore.so.18.1 $PREFIX/lib/
    cp -p tmp_extract/instantclient_23_8/fips.so $PREFIX/lib/
    cp -p tmp_extract/instantclient_23_8/libclntshcore.so.20.1 $PREFIX/lib/
    cp -p tmp_extract/instantclient_23_8/legacy.so $PREFIX/lib/
    cp -p tmp_extract/instantclient_23_8/libclntsh.so $PREFIX/lib/
    cp -p tmp_extract/instantclient_23_8/libclntsh.so.10.1 $PREFIX/lib/
    cp -p tmp_extract/instantclient_23_8/libclntsh.so.11.1 $PREFIX/lib/
    cp -p tmp_extract/instantclient_23_8/libclntsh.so.12.1 $PREFIX/lib/
    cp -p tmp_extract/instantclient_23_8/libclntsh.so.18.1 $PREFIX/lib/
    cp -p tmp_extract/instantclient_23_8/libclntsh.so.19.1 $PREFIX/lib/
    cp -p tmp_extract/instantclient_23_8/libclntsh.so.20.1 $PREFIX/lib/
    cp -p tmp_extract/instantclient_23_8/libclntsh.so.21.1 $PREFIX/lib/
    cp -p tmp_extract/instantclient_23_8/libclntsh.so.22.1 $PREFIX/lib/
    cp -p tmp_extract/instantclient_23_8/libclntsh.so.23.1 $PREFIX/lib/
    cp -p tmp_extract/instantclient_23_8/libocci.so.21.1 $PREFIX/lib/
    cp -p tmp_extract/instantclient_23_8/libocci.so.22.1 $PREFIX/lib/
    cp -p tmp_extract/instantclient_23_8/libocci.so.23.1 $PREFIX/lib/
    cp -p tmp_extract/instantclient_23_8/libclntshcore.so.19.1 $PREFIX/lib/
    cp -p tmp_extract/instantclient_23_8/libocijdbc23.so $PREFIX/lib/
    cp -p tmp_extract/instantclient_23_8/libclntshcore.so.21.1 $PREFIX/lib/
    cp -p tmp_extract/instantclient_23_8/libclntshcore.so.22.1 $PREFIX/lib/
    cp -p tmp_extract/instantclient_23_8/libclntshcore.so.23.1 $PREFIX/lib/
    cp -p tmp_extract/instantclient_23_8/libnnz.so $PREFIX/lib/
    cp -p tmp_extract/instantclient_23_8/libocci.so $PREFIX/lib/
    cp -p tmp_extract/instantclient_23_8/libocci.so.10.1 $PREFIX/lib/
    cp -p tmp_extract/instantclient_23_8/libocci.so.11.1 $PREFIX/lib/
    cp -p tmp_extract/instantclient_23_8/libocci.so.12.1 $PREFIX/lib/
    cp -p tmp_extract/instantclient_23_8/libocci.so.18.1 $PREFIX/lib/
    cp -p tmp_extract/instantclient_23_8/libocci.so.19.1 $PREFIX/lib/
    cp -p tmp_extract/instantclient_23_8/libocci.so.20.1 $PREFIX/lib/
    cp -p tmp_extract/instantclient_23_8/libociei.so $PREFIX/lib/
    cp -p tmp_extract/instantclient_23_8/libtfojdbc1.so $PREFIX/lib/
    cp -p tmp_extract/instantclient_23_8/pkcs11.so $PREFIX/lib/
    
    cp -p tmp_extract/instantclient_23_8/ojdbc11.jar $PREFIX/lib/
    cp -p tmp_extract/instantclient_23_8/ojdbc17.jar $PREFIX/lib/
    cp -p tmp_extract/instantclient_23_8/ojdbc8.jar $PREFIX/lib/
    cp -p tmp_extract/instantclient_23_8/ucp.jar $PREFIX/lib/
    cp -p tmp_extract/instantclient_23_8/ucp11.jar $PREFIX/lib/
    cp -p tmp_extract/instantclient_23_8/ucp17.jar $PREFIX/lib/
    cp -p tmp_extract/instantclient_23_8/uidrvci $PREFIX/lib/
    cp -p tmp_extract/instantclient_23_8/xstreams.jar $PREFIX/lib/

    cp -p -r tmp_extract/instantclient_23_8/network $PREFIX/lib/

    echo "copied!"
    echo "========================"
    echo "LISING FILES"
    ls $PREFIX/lib/
fi

