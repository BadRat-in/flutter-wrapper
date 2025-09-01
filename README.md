# Flutter Wrapper

A developer-friendly **Flutter & FlutterFlow wrapper** that simplifies build management, asset generation, and screenshot resizing for iOS and Android.

It provides:

- Automatic version and build number handling for both platforms.
- Switch between **system Flutter** and **FlutterFlow Flutter** for the current terminal session.
- Scripts for generating app icons and launch images.
- Scripts for resizing screenshots for App Store / Play Store.
- Optional setup script to bootstrap developer environment.

---

## Repository Structure

```
.
├── bin
│   └── flutter                 # Wrapper executable for Flutter/FlutterFlow commands
├── scripts
│   ├── generate-icons.zsh      # Generate iOS/Android app icons and launch images
│   └── resize-screenshots.zsh  # Resize screenshots for App Store / Play Store
└── setup.zsh                    # Optional setup script for initial environment setup
```

---

## Features

### 1. Flutter/FlutterFlow Wrapper (`bin/flutter`)

- Wraps Flutter and FlutterFlow binaries.
- Automatically detects version and build number from `pubspec.yaml`.
- Supports switching Flutter versions per session using `use`:

```zsh
# Switch to system Flutter
flutter use flutter

# Switch to FlutterFlow Flutter
flutter use flutterflow
```

> The wrapper remembers the chosen Flutter version **for the current terminal session**. Once a session ends, the default version will be used unless you run `use` again.

- Supports standard Flutter commands:

```zsh
flutter run
flutter build apk
flutter build appbundle
flutter build ipa
```

---

### 2. Asset Scripts

#### `scripts/generate-icons.zsh`

- Generates all required **iOS app icons**.
- Generates **Android launcher icons**, including adaptive icons.
- Updates iOS storyboard background color.
- Updates Android `launch_background.xml`.

#### `scripts/resize-screenshots.zsh`

- Resizes screenshots for **iPhone** or **iPad**.
- Automatically detects portrait/landscape orientation.
- Keeps original screenshots safe in a `resized` folder.

---

### 3. Optional Setup (`setup.zsh`)

- Clones wrapper repo into `~/.zsh/flutter-wrapper`.
- Adds wrapper to `$PATH` in `.zshrc`.
- Reloads shell to enable immediate use.

> Developers with the wrapper already installed do **not** need to run this again.

---

## Installation

### 1. Manual Installation

Clone the repo and add the `bin` folder to your `$PATH`:

```zsh
git clone https://github.com/badrat-in/flutter-wapper.git ~/.zsh/flutter-wrapper
export PATH="$HOME/.zsh/flutter-wrapper/bin:$PATH"
```

---

### 2. Setup Script

For first-time setup:

```zsh
~/.zsh/flutter-wrapper/setup.zsh
```

This will automatically:

- Clone the wrapper to a standard location.
- Add it to `$PATH` in `.zshrc`.
- Reload the shell.

---

## Usage

### 1. Switch Flutter Version

```zsh
flutter use flutter        # Use system Flutter
flutter use flutterflow    # Use FlutterFlow Flutter
```

> Version selection persists for the current terminal session.

### 2. Run & Build Commands

```zsh
flutter run                  # Run app on connected device/emulator
flutter build apk            # Build Android APK
flutter build appbundle      # Build Android App Bundle
flutter build ipa            # Build iOS IPA
```

> The wrapper automatically handles version and build numbers based on `pubspec.yaml`.

### 3. Asset Scripts

```zsh
# Generate app icons
flutter icons [input_image.png]

# Resize screenshots
flutter resize --path ~/Desktop/Screenshots --device iphone

# Or Any default command provided by Flutter
flutter <command>
```

---

## Contributing

- Open issues for bugs or feature requests.
- Pull requests welcome. Keep scripts modular (`generate-icons`, `resize-screenshots`).
- Follow coding standards and include tests when applicable.

---

## License

This project is licensed under **Mozilla Public License 2.0 (MPL-2.0)**.
