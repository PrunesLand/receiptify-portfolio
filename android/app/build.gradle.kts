plugins {
    id("com.android.application")
    // START: FlutterFire Configuration
    id("com.google.gms.google-services")
    // END: FlutterFire Configuration
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

// Import Properties and FileInputStream
import java.util.Properties
        import java.io.FileInputStream

        dependencies {

            // Import the Firebase BoM

            implementation(platform("com.google.firebase:firebase-bom:33.16.0"))


            // When using the BoM, don't specify versions in Firebase dependencies

            implementation("com.google.firebase:firebase-analytics")


            // Add the dependencies for any other desired Firebase products

            // https://firebase.google.com/docs/android/setup#available-libraries

        }


android {
    namespace = "com.receiptify"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = "27.0.12077973"

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        applicationId = "com.receiptify"
        minSdk = 23
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    // Corrected signingConfigs block for Kotlin Script
    signingConfigs {
        create("release") {
            val propertiesFile = project.rootProject.file("android/key.properties")
            if (propertiesFile.exists()) {
                val properties = Properties()
                properties.load(FileInputStream(propertiesFile))
                keyAlias = properties.getProperty("keyAlias")
                keyPassword = properties.getProperty("keyPassword")
                storeFile = file(properties.getProperty("storeFile"))
                storePassword = properties.getProperty("storePassword")
            }
        }
    }

    buildTypes {
        release {
            // Point to the release signing config
            signingConfig = signingConfigs.getByName("release")
        }
    }
}

flutter {
    source = "../.."
}
