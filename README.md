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

- Supports standard Flutter commands, including `create`, `doctor`, etc.
- Provides a unified help command to show wrapper and native Flutter options.

```zsh
# Get a unified list of wrapper and Flutter commands
flutter help

# Any standard command works
flutter create my_app
flutter doctor
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

## Installation

The recommended way to install is to use the remote installer script.

```zsh
zsh -c "$(curl -fsSL https://raw.githubusercontent.com/badrat-in/flutter-wrapper/main/setup.zsh)"
```

The setup script will automatically:

- Check for `git` (a required dependency).
- Clone the repository to `~/.flutter-wrapper`.
- Add the wrapper's `bin` directory to your `.zshrc` file.

After the script finishes, restart your terminal or run `source ~/.zshrc` to apply the changes.

### Manual Installation

If you prefer, you can clone the repository and add the `bin` directory to your system's `PATH` manually.

```zsh
git clone https://github.com/badrat-in/flutter-wrapper.git ~/.flutter-wrapper
export PATH="$HOME/.flutter-wrapper/bin:$PATH"
```

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

We actively welcome contributions! If you have an idea for a feature that you think should be part of this wrapper, we encourage you to build it and submit a pull request. This project is built for the community, by the community.

### Reporting Bugs & Proposing Solutions

If you encounter a bug, please [open an issue](https://github.com/badrat-in/flutter-wrapper/issues). To help us resolve it quickly, please include:
- A clear, descriptive title.
- Detailed steps to reproduce the bug.
- Any relevant error messages and the output of `flutter --version`.

If you have a solution in mind, please feel free to describe it in the issue or, even better, submit a pull request with the fix.

### Suggesting & Adding Features

Have an idea for a new feature? Don't hesitate to [open an issue](https://github.com/badrat-in/flutter-wrapper/issues) to start a discussion. If you believe your feature would be a great addition, we encourage you to implement it and open a pull request.

### Submitting Pull Requests

1.  **Fork** the repository.
2.  **Create a new branch** (`git checkout -b feature/your-amazing-feature`).
3.  **Make your changes.** Keep them focused and modular.
4.  **Commit** your changes with a clear, descriptive message.
5.  **Push** your branch to your fork (`git push origin feature/your-amazing-feature`).
6.  **Open a pull request** against the `main` branch.
7.  Clearly describe the problem and solution in your pull request description.

---

## License

This project is licensed under **Mozilla Public License 2.0 (MPL-2.0)**.
