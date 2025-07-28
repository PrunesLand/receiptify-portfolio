# Receiptify

A new Flutter project.

## Tech Stack

- **Flutter** (Dart) for cross-platform mobile development
- **go_router** for declarative routing
- **google_mlkit_text_recognition** for text recognition (OCR)
- **camera** for camera integration
- **image_picker** for image selection
- **freezed** and **freezed_annotation** for immutable models and code generation
- **flutter_bloc** for state management
- **build_runner** for code generation

## How to Run

1. Install dependencies:
   ```sh
   flutter pub get
   ```
2. Run the app:
   ```sh
   flutter run
   ```

## Updating Models

If you make changes to your model classes, rebuild the generated code with:
```sh
dart run build_runner build --delete-conflicting-outputs -v
```

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
