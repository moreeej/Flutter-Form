#!/usr/bin/env bash
set -euo pipefail

export DEBIAN_FRONTEND=noninteractive

FLUTTER_DIR="$PWD/.flutter-sdk"

if [ ! -x "$FLUTTER_DIR/bin/flutter" ]; then
  rm -rf "$FLUTTER_DIR"
  git clone https://github.com/flutter/flutter.git -b stable "$FLUTTER_DIR" --depth 1
fi

export PATH="$FLUTTER_DIR/bin:$PATH"

flutter --version
flutter config --enable-web
flutter pub get
flutter build web --release
