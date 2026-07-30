#!/bin/bash
set -ex

cmake -B build -S . \
  ${CMAKE_ARGS} \
  -DBUILD_SHARED_LIBS="ON" \
  -DBUILD_TESTING="OFF" \
  -DLIBXS_FORTRAN="ON" \
  -GNinja
cmake --build build --parallel "${CPU_COUNT}"
cmake --install build
