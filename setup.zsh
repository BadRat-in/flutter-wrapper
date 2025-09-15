#!/usr/bin/env zsh
set -e

TARGET="$HOME/flutter-wapper"

if [ ! -d "$TARGET" ]; then
  git clone https://github.com/badrat-in/flutter-wapper.git "$TARGET"
  echo "[INFO] Cloned flutter-wapper into $TARGET"
fi

if ! grep -q "flutter-wapper/bin" "$HOME/.zshrc"; then
  echo "export PATH=\"$TARGET/bin:\$PATH\"" >> "$HOME/.zshrc"
  echo "[INFO] Added flutter-wapper to PATH in .zshrc"
fi

source "$HOME/.zshrc"
echo "[SUCCESS] Setup complete!"
