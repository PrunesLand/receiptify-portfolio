# Receiptify

Receiptify is a powerful, feature-rich Flutter application designed to streamline expense tracking and management. It empowers users to effortlessly digitize their receipts, extract crucial information using cutting-edge AI, and gain valuable insights into their spending habits. This project showcases a complete end-to-end mobile application development lifecycle, from initial design and development to CI/CD and deployment.

## Features

- **User Authentication:** Secure sign-in and registration using Firebase Authentication.
- **Receipt Scanning:** Digitize receipts using the device camera or by selecting images from the gallery.
- **AI-Powered OCR:** Leverages the Gemini API to accurately extract text and key information from receipts, such as merchant name, date, total amount, and individual items.
- **Expense Management:** Organize expenses into customizable "pocket groups" for better budgeting and tracking.
- **Data Visualization:** Visualize spending patterns and gain insights through intuitive charts and graphs.
- **CI/CD Pipeline:** Automated build, test, and deployment pipeline using GitHub Actions and Fastlane.

## Demo

![Demo GIF](path/to/your/demo.gif)

## Tech Stack

### Frontend

- **Flutter & Dart:** For building a high-performance, cross-platform mobile application.
- **flutter_bloc & Provider:** For robust and scalable state management.
- **go_router:** For declarative and type-safe navigation.
- **Dio & Retrofit:** For efficient and type-safe HTTP requests.
- **Isar:** For a fast and easy-to-use local database.
- **flutter_secure_storage:** For securely storing sensitive user data.

### Backend

- **Firebase:**
    - **Authentication:** For secure user sign-in and registration.
    - **Distribution:** For quickly deploying the app to internal testers.
    - **App Check:** For enhancing security by verifying app integrity.

### AI

- **Gemini API:** For state-of-the-art Optical Character Recognition (OCR) to extract information from receipts.

### CI/CD

- **GitHub Actions:** For orchestrating the entire CI/CD pipeline.
- **Fastlane:** For automating the build and deployment process for Android.

## Project Structure

```
.
├── android
│   ├── app
│   ├── fastlane
│   └── ...
├── lib
│   ├── app.dart
│   ├── core
│   ├── features
│   ├── main_dev.dart
│   └── main_prod.dart
├── .github
│   └── workflows
│       └── android-distribution.yml
└── ...
```

- **`lib/`**: Contains the main Dart code for the application.
  - **`core/`**: Core components like services, theming, and authentication.
  - **`features/`**: Each feature of the application is organized into its own directory.
- **`android/`**: Platform-specific code for Android.
  - **`fastlane/`**: Contains the Fastlane configuration for automating builds and deployments.
- **`.github/workflows/`**: Contains the GitHub Actions workflow for the CI/CD pipeline.

## CI/CD Pipeline

The CI/CD pipeline is built using GitHub Actions and Fastlane, and it automates the process of building, testing, and deploying the application. The pipeline is triggered on every push to the `main` branch and performs the following steps:

1.  **Build:** The Flutter application is built for Android in release mode.
2.  **Test:** Unit and widget tests are run to ensure the code quality and prevent regressions.
3.  **Deploy to Firebase App Distribution:** The release build is deployed to Firebase App Distribution for internal testing.
4.  **Deploy to Google Play Store:** The release build is deployed to the Google Play Store for production.

The pipeline is connected to Firebase using secrets stored in GitHub Actions, which allows it to securely authenticate and deploy the application.

## Authentication

The application uses Firebase Authentication to provide a secure and easy-to-use authentication system. Users can sign up for a new account using their email and password, or sign in to an existing account. The authentication process is seamlessly integrated into the application, providing a smooth user experience.

## How to Run

1. **Clone the repository:**
   ```sh
   git clone https://github.com/your-username/receiptify-portfolio.git
   cd receiptify-portfolio
   ```
2. **Set up Firebase:**
   - Create a new Firebase project at [https://console.firebase.google.com/](https://console.firebase.google.com/).
   - Follow the instructions to add an Android app to your Firebase project.
   - Download the `google-services.json` file for Android and place it in the `android/app` directory.
   - Run the following command to generate the `lib/firebase_options.dart` file:
        ```sh
        flutterfire configure
        ```
3. **Secrets Management:**
    - Create a file named `.env` in the `android` directory.
    - Add the following environment variables to the `.env` file:
        ```
        FIREBASE_APP_ID_ANDROID=<your_firebase_app_id_android>
        FIREBASE_TOKEN=<your_firebase_token>
        GOOGLE_PLAY_JSON_KEY=<your_google_play_json_key>
        ```
4. **Install dependencies:**
   ```sh
   flutter pub get
   ```
5. **Run the app:**
   ```sh
   flutter run
   ```

## Updating Models

If you make changes to your model classes, rebuild the generated code with:
```sh
dart run build_runner build --delete-conflicting-outputs -v
```

## Building for Release

To build the app for release, you can use Fastlane.

1. **Set up Fastlane:**
   - Install Fastlane by following the instructions at [https://docs.fastlane.tools/](https://docs.fastlane.tools/).
   - Navigate to the `android` directory and run `fastlane install_plugins`.
2. **Deploy to Google Play:**
   - Make sure you have set up your Google Play credentials correctly in your environment variables.
   - Run the following command to build and upload the app to the Google Play Store:
        ```sh
        fastlane android deploy
        ```
