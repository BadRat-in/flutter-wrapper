#!/usr/bin/env zsh
set -e

# Function to install a package if it's not already installed
install_if_missing() {
    local package_name=$1
    local install_command=$2

    if ! command -v $package_name &> /dev/null; then
        echo "Required command '$package_name' is not installed. Attempting to install..."
        if eval $install_command; then
            echo "'$package_name' installed successfully."
        else
            echo "Failed to install '$package_name'. Please install it manually and try again."
            exit 1
        fi
    fi
}

# Determine OS and set install command
OS_TYPE=$(uname -s)
case "$OS_TYPE" in
    Darwin)
        # macOS
        if ! command -v brew &> /dev/null; then
            echo "Homebrew is not installed. Please install it from https://brew.sh/ to manage dependencies."
            exit 1
        fi
        INSTALL_CMD="brew install imagemagick"
        ;;
    Linux)
        # Linux (Debian/Ubuntu-based)
        if command -v apt-get &> /dev/null; then
            INSTALL_CMD="sudo apt-get update && sudo apt-get install -y imagemagick"
        # Linux (Fedora/CentOS-based)
        elif command -v dnf &> /dev/null; then
            INSTALL_CMD="sudo dnf install -y ImageMagick"
        elif command -v yum &> /dev/null; then
            INSTALL_CMD="sudo yum install -y ImageMagick"
        else
            echo "Unsupported Linux distribution. Please install ImageMagick manually."
            exit 1
        fi
        ;;
    *)
        echo "Unsupported operating system: $OS_TYPE. Please install ImageMagick manually."
        exit 1
        ;;
esac

# Check for and install ImageMagick (the 'magick' command)
install_if_missing "magick" "$INSTALL_CMD"
