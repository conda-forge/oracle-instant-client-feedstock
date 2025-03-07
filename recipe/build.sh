# get the (de)activate scripts
CHANGE="deactivate"
mkdir -p "${PREFIX}/etc/conda/${CHANGE}.d"
cp "${RECIPE_DIR}/${CHANGE}.sh" "${PREFIX}/etc/conda/${CHANGE}.d/${PKG_NAME}_${CHANGE}.sh"

CHANGE="activate"
mkdir -p "${PREFIX}/etc/conda/${CHANGE}.d"
cp "${RECIPE_DIR}/${CHANGE}.sh" "${PREFIX}/etc/conda/${CHANGE}.d/${PKG_NAME}_${CHANGE}.sh"
sed -i.bak "s|@PKG_VERSION@|${PKG_VERSION}|g" "${PREFIX}/etc/conda/${CHANGE}.d/${PKG_NAME}_${CHANGE}.sh"
sed -i.bak "s|@SHLIB_EXT@|${SHLIB_EXT}|g" "${PREFIX}/etc/conda/${CHANGE}.d/${PKG_NAME}_${CHANGE}.sh"
if [[ ${target_platform} == "osx-64" ]]; then
  sed -i.bak "s|@PLATFORM@|mac|g" "${PREFIX}/etc/conda/${CHANGE}.d/${PKG_NAME}_${CHANGE}.sh"
  sed -i.bak "s|@ARCH@|x64|g" "${PREFIX}/etc/conda/${CHANGE}.d/${PKG_NAME}_${CHANGE}.sh"
  sed -i.bak "s|@OS@|macos|g" "${PREFIX}/etc/conda/${CHANGE}.d/${PKG_NAME}_${CHANGE}.sh"
  sed -i.bak "s|@VERTAIL@|dbru|g" "${PREFIX}/etc/conda/${CHANGE}.d/${PKG_NAME}_${CHANGE}.sh"
  aver=$(echo ${PKG_VERSION} | tr -d ".")
  sed -i.bak "s|@AVER@|${aver}|g" "${PREFIX}/etc/conda/${CHANGE}.d/${PKG_NAME}_${CHANGE}.sh"

elif [[ ${target_platform} == "linux-64" ]]; then
  sed -i.bak "s|@PLATFORM@|linux|g" "${PREFIX}/etc/conda/${CHANGE}.d/${PKG_NAME}_${CHANGE}.sh"
  sed -i.bak "s|@ARCH@|x64|g" "${PREFIX}/etc/conda/${CHANGE}.d/${PKG_NAME}_${CHANGE}.sh"
  sed -i.bak "s|@OS@|linux|g" "${PREFIX}/etc/conda/${CHANGE}.d/${PKG_NAME}_${CHANGE}.sh"
  sed -i.bak "s|@VERTAIL@||g" "${PREFIX}/etc/conda/${CHANGE}.d/${PKG_NAME}_${CHANGE}.sh"
  # the folder name for the version 23.7.0.25.1 is different than for the previous releases
  aver=$(echo ${PKG_VERSION:0:6}.00.0 | tr -d ".")
  sed -i.bak "s|@AVER@|${aver}|g" "${PREFIX}/etc/conda/${CHANGE}.d/${PKG_NAME}_${CHANGE}.sh"
fi
rm -f "${PREFIX}/etc/conda/${CHANGE}.d/${PKG_NAME}_${CHANGE}.sh.bak"
