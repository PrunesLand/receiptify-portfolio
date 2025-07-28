# Receiptify

Receiptify is a Flutter application designed to simplify expense tracking by extracting information from receipts.
Users can capture images of their receipts using the device camera or select images from their gallery.
The app utilizes Optical Character Recognition (OCR) to extract text from the images.

The core functionality revolves around identifying key details such as the merchant name, date, total amount, and individual items from the receipt.
This information can then be used for personal finance management, budgeting, or expense reporting.

## Tech Stack

- **Flutter** (Dart) for cross-platform mobile development
- **go_router** for declarative routing
- **google_mlkit_text_recognition** for text recognition (OCR)
- **google_generative_ai** for interacting with Google's generative AI models (e.g., Gemini) for receipt data extraction.
- **camera** for camera integration
- **image_picker** for image selection
- **freezed** and **freezed_annotation** for immutable models and code generation
- **flutter_bloc** for state management
- **equatable** for simplifying equality comparisons in BLoC states and events.
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
## Deploy to firebase

```sh
firebase deploy --only hosting
```
## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
