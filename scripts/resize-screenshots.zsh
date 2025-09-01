#!/usr/bin/env zsh

set -e

DEFAULT_PATH=~/Desktop/Screenshots
DEVICE_TYPE="iphone"

show_help() {
  echo "Usage: $0 [--path DIR] [--device iphone|ipad] [--help]"
  echo
  echo "Options:"
  echo "  --path DIR     Path to screenshots directory (default: $DEFAULT_PATH)"
  echo "  --device TYPE  Device type: iphone or ipad (default: iphone)"
  echo "  --help         Show this help message"
  exit 0
}

# Parse keyword arguments
while [[ $# -gt 0 ]]; do
  case "$1" in
    --path)
      SCREENSHOTS_DIR="$2"
      shift 2
      ;;
    --device)
      DEVICE_TYPE="$2"
      shift 2
      ;;
    --help)
      show_help
      ;;
    *)
      echo "❌ Unknown option: $1"
      echo "Run with --help for usage."
      exit 1
      ;;
  esac
done

SCREENSHOTS_DIR=${SCREENSHOTS_DIR:-$DEFAULT_PATH}

# Set sizes based on device type
case "$DEVICE_TYPE" in
  iphone)
    PORTRAIT_SIZE="1290x2796"
    LANDSCAPE_SIZE="2796x1290"
    ;;
  ipad)
    PORTRAIT_SIZE="2064x2752"
    LANDSCAPE_SIZE="2752x2064"
    ;;
  *)
    echo "❌ Unknown device type: $DEVICE_TYPE"
    echo "Run with --help for usage."
    exit 1
    ;;
esac

# Create output folder so originals stay safe
mkdir -p "$SCREENSHOTS_DIR/resized"

# Resize based on orientation
for img in "$SCREENSHOTS_DIR"/*.[Pp][Nn][Gg]; do
  filename=$(basename "$img")
  width=$(magick identify -format '%w' "$img")
  height=$(magick identify -format '%h' "$img")

  if [ "$width" -gt "$height" ]; then
    magick "$img" -resize "${LANDSCAPE_SIZE}!" "$SCREENSHOTS_DIR/resized/$filename"
    echo "Resized $filename -> $LANDSCAPE_SIZE (landscape)"
  else
    magick "$img" -resize "${PORTRAIT_SIZE}!" "$SCREENSHOTS_DIR/resized/$filename"
    echo "Resized $filename -> $PORTRAIT_SIZE (portrait)"
  fi
done
