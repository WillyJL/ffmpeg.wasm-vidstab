#!/bin/bash

set -euo pipefail

CM_FLAGS=(
  -DCMAKE_INSTALL_PREFIX=$INSTALL_DIR
  -DCMAKE_TOOLCHAIN_FILE=$EM_TOOLCHAIN_FILE
  -DBUILD_SHARED_LIBS=OFF
)

mkdir -p build
cd build
emmake cmake .. -DCMAKE_C_FLAGS="$CXXFLAGS" ${CM_FLAGS[@]}
emmake make install
