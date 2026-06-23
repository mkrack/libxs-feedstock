#!/bin/bash
set -ex

rm -rf build-shared build-static

# Build and install static LIBXS library first
cmake -B build-static -S . \
  ${CMAKE_ARGS} \
  -DBUILD_SHARED_LIBS="OFF" \
  -DBUILD_TESTING="OFF" \
  -DLIBXS_FORTRAN="ON"
cmake --build build-static --parallel "${CPU_COUNT}"
cmake --install build-static

# Build and install shared LIBXS library second (safely overwrites metadata)
cmake -B build-shared -S . \
  ${CMAKE_ARGS} \
  -DBUILD_SHARED_LIBS="ON" \
  -DBUILD_TESTING="OFF" \
  -DLIBXS_FORTRAN="ON"
cmake --build build-shared --parallel "${CPU_COUNT}"
cmake --install build-shared
