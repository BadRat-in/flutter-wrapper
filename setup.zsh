#!/usr/bin/env zsh
set -e

TARGET="$HOME/flutter-wrapper"

if [ ! -d "$TARGET" ]; then
  git clone https://github.com/badrat-in/flutter-wrapper.git "$TARGET"
  echo "[INFO] Cloned flutter-wrapper into $TARGET"
fi

if ! grep -q "flutter-wrapper/bin" "$HOME/.zshrc"; then
  echo "export PATH=\"$TARGET/bin:\$PATH\"" >> "$HOME/.zshrc"
  echo "[INFO] Added flutter-wrapper to PATH in .zshrc"
fi

source "$HOME/.zshrc"
echo "[SUCCESS] Setup complete!"
