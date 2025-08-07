# Receiptify

Receiptify is a Flutter application designed to simplify expense tracking by extracting information from receipts.
Users can capture images of their receipts using the device camera or select images from their gallery.
The app utilizes Optical Character Recognition (OCR) to extract text from the images.

The core functionality revolves around identifying key details such as the merchant name, date, total amount, and individual items from the receipt.
This information can then be used for personal finance management, budgeting, or expense reporting.

## Tech Stack

- **Flutter**: for cross-platform mobile development
- **go_router**: for declarative routing
- **firebase_ai**: for interacting with Google's generative AI models (e.g., Gemini) for receipt data extraction.
- **camera**: for camera integration
- **image_picker**: for image selection
- **freezed**: for immutable models and code generation
- **flutter_bloc**: for state management
- **provider**: for state management
- **get_it**: for service location
- **dio**: for http requests
- **retrofit**: for type-safe http client
- **isar**: for local database
- **flutter_secure_storage**: for secure storage
- **firebase_core**: for firebase integration
- **firebase_auth**: for authentication
- **build_runner**: for code generation

## Features

- **User Onboarding**: Secure user registration and login.
- **Receipt Management**: Easily scan, and manage receipts.
- **Text Recognition (OCR)**: Extract text from receipts using the camera.
- **Expense Grouping**: Organize expenses into pocket groups.
- **Expense Statistics**: Visualize spending with statistics.
- **Payment Processing**: Handle payments within the app.
- **Settings**: Customize app settings.
- **Navigation Drawer**: Convenient access to all features.

## How to Run

1. **Clone the repository:**
   ```sh
   git clone https://github.com/your-username/receiptify.git
   cd receiptify
   ```
2. **Set up Firebase:**
   - Create a new Firebase project at [https://console.firebase.google.com/](https://console.firebase.google.com/).
   - Follow the instructions to add an Android and/or iOS app to your Firebase project.
   - Download the `google-services.json` file for Android and place it in the `android/app` directory.
   - Download the `GoogleService-Info.plist` file for iOS and place it in the `ios/Runner` directory.
3. **Install dependencies:**
   ```sh
   flutter pub get
   ```
4. **Run the app:**
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
## Project Structure

```
.
├── lib
│   ├── core
│   │   ├── auth
│   │   ├── services
│   │   └── theme
│   ├── features
│   │   ├── onboarding
│   │   ├── document
│   │   ├── camera_ocr
│   │   ├── pocket_group
│   │   ├── statistics
│   │   ├── payment
│   │   └── settings
│   ├── main.dart
│   └── ...
├── android
├── ios
├── web
├── macos
└── ...
```

- **`lib/`**: Contains the main Dart code for the application.
  - **`core/`**: Core components like services, theming, and authentication.
  - **`features/`**: Each feature of the application is organized into its own directory.
    - **`onboarding/`**: User registration and login.
    - **`document/`**: Receipt scanning, and management.
    - **`camera_ocr/`**: Text recognition from images.
    - **`pocket_group/`**: Grouping of expenses.
    - **`statistics/`**: Displaying expense statistics.
    - **`payment/`**: Payment processing.
    - **`settings/`**: App settings.
  - **`main.dart`**: The entry point of the application.
- **`android/`**, **`ios/`**, **`web/`**, **`macos/`**: Platform-specific code.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
