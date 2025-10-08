#!/usr/bin/env zsh
set -e

# Helper to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

main() {
    # 1. Check for Git dependency
    if ! command_exists git; then
        echo "Error: Git is not installed. Please install Git and run this command again." >&2
        exit 1
    fi

    # 2. Define target directory and clone if it doesn't exist
    local TARGET="$HOME/.flutter-wrapper"
    if [ ! -d "$TARGET" ]; then
        echo "[INFO] Cloning flutter-wrapper into $TARGET..."
        git clone https://github.com/badrat-in/flutter-wrapper.git "$TARGET"
    else
        echo "[INFO] flutter-wrapper is already installed in $TARGET."
    fi

    # 3. Add to PATH in .zshrc if it's not already there
    if ! grep -q "$TARGET/bin" "$HOME/.zshrc"; then
        echo "[INFO] Adding flutter-wrapper to your PATH in .zshrc..."
        printf "\n# Flutter Wrapper\nexport PATH=\"%s/bin:\$PATH\"\n" "$TARGET" >> "$HOME/.zshrc"
    else
        echo "[INFO] flutter-wrapper is already configured in your PATH."
    fi

    # 4. Final instructions
    echo ""
    echo "✅ Setup complete!"
    echo "Please restart your terminal or run 'source ~/.zshrc' to apply the changes."
    echo "After that, run 'flutter help' to get started."
}

# Run the setup
main

