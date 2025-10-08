# Project Overview

This project is a `flutter-wrapper`, a developer-friendly tool that simplifies build management, asset generation, and screenshot resizing for Flutter and FlutterFlow projects on iOS and Android. It provides a unified command-line interface to manage different Flutter versions, automate versioning, and handle common asset-related tasks.

The main technologies used are **Zsh** for scripting and **ImageMagick** for image manipulation. The project is structured as a collection of scripts that can be added to the user's `$PATH` for easy access.

# Building and Running

This project is a collection of shell scripts, so there is no traditional "build" process. The scripts are meant to be executed directly.

**Key Commands:**

*   **Switching Flutter versions:**
    ```zsh
    # Switch to system Flutter
    flutter use flutter

    # Switch to FlutterFlow Flutter
    flutter use flutterflow
    ```

*   **Getting Help:**
    ```zsh
    # Show wrapper and native Flutter commands
    flutter help
    ```

*   **Running and building Flutter apps:**
    ```zsh
    # All standard Flutter commands are supported
    flutter create my_app
    flutter doctor
    flutter run
    flutter build apk
    ```

*   **Generating app icons:**
    ```zsh
    flutter icons [path/to/input_image.png]
    ```

*   **Resizing screenshots:**
    ```zsh
    flutter resize --path [path/to/screenshots] --device [iphone|ipad]
    ```

# Development Conventions

*   **Modularity:** The scripts are designed to be modular, with separate files for icon generation and screenshot resizing. This makes them easier to maintain and extend.
*   **Error Handling:** The scripts use `set -e` to exit immediately if a command fails, which is a good practice for shell scripting.
*   **Dependencies:** The scripts check for the required dependencies (e.g., ImageMagick) and provide instructions for installing them.
*   **Configuration:** The main `flutter` script uses a configuration file (`~/.flutter_wrapper_engine`) to store the user's preferred Flutter version.
