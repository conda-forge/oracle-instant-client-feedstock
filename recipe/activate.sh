pkgver="@PKG_VERSION@"
shlibext="@SHLIB_EXT@"
platform="@PLATFORM@"
arch="@ARCH@"
platformos="@OS@"
vertail="@VERTAIL@"
aver="@AVER@"
majver=$(echo $pkgver | cut -d'.' -f1)
minver=$(echo $pkgver | cut -d'.' -f2)
uver=${majver}_${minver}
oracle_download_base_url=${ORACLE_DOWNLOAD_BASE_URL:-https://download.oracle.com/otn_software/${platform}/instantclient/${aver}}
oracle_download_url=$oracle_download_base_url/instantclient-basic-${platformos}.${arch}-${pkgver}${vertail}.zip

if [ ! -d ${CONDA_PREFIX}/oracle_instant_client/instantclient_${uver} ]; then
  mkdir -p ${CONDA_PREFIX}/oracle_instant_client
  pushd ${CONDA_PREFIX}/oracle_instant_client >& /dev/null
  echo "Downloading instantclient from $oracle_download_url"
  curl -Ls $oracle_download_url > ${CONDA_PREFIX}/oracle_instant_client/instantclient-basic-${platformos}.${arch}-${pkgver}${vertail}.zip
  file instantclient-basic-${platformos}.${arch}-${pkgver}${vertail}.zip
  unzip -qq instantclient-basic-${platformos}.${arch}-${pkgver}${vertail}.zip
  popd >& /dev/null

  mkdir -p ${CONDA_PREFIX}/lib
  rm -f ${CONDA_PREFIX}/oracle_instant_client/instantclient_${uver}/CONDA_LINKS
  for lib in $(ls ${CONDA_PREFIX}/oracle_instant_client/instantclient_${uver}/*${shlibext}*); do
    rm -f ${CONDA_PREFIX}/lib/$(basename $lib)
    ln -s $lib ${CONDA_PREFIX}/lib/$(basename $lib)
    echo ${CONDA_PREFIX}/lib/$(basename $lib) >> ${CONDA_PREFIX}/oracle_instant_client/instantclient_${uver}/CONDA_LINKS
  done
fi

export CONDA_BACKUP_ORACLE_HOME=${ORACLE_HOME}
export ORACLE_HOME=${CONDA_PREFIX}/oracle_instant_client/instantclient_${uver}
