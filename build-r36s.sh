#!/bin/bash
set -e

docker build -f Dockerfile.build -t r36s-builder .

docker run --rm \
  -v "$(pwd)":/project \
  -w /project \
  -e PKG_CONFIG_ALLOW_CROSS=1 \
  -e PKG_CONFIG_PATH=/usr/lib/aarch64-linux-gnu/pkgconfig \
  -e CC_aarch64_unknown_linux_gnu=aarch64-linux-gnu-gcc \
  -e CXX_aarch64_unknown_linux_gnu=aarch64-linux-gnu-g++ \
  -e SDL2_DIR=/usr/lib/aarch64-linux-gnu/cmake/SDL2 \
  -e CARGO_TARGET_AARCH64_UNKNOWN_LINUX_GNU_LINKER=aarch64-linux-gnu-gcc \
  r36s-builder \
  cargo build --target aarch64-unknown-linux-gnu --release

echo ""
echo "Binario: target/aarch64-unknown-linux-gnu/release/$(basename $(pwd))"
