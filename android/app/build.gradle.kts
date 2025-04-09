plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.digited.ol.smarttv.ol_smart_tv"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "com.digited.ol.smarttv.ol_smart_tv"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        ndkVersion = "27.0.12077973"
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    signingConfigs {
        create("release") {
            storeFile = file("/Users/umbertogrimaldi/projects/open-learning-smart-tv/android/keystore/keystore.jks")
            storePassword = "Admin123*"
            keyAlias = "my-key-alias"
            keyPassword = "Admin123*"
        }
    }

    buildTypes {
        getByName("release") {
            isMinifyEnabled = true
            signingConfig = signingConfigs.getByName("release") // Assegna la configurazione di firma
        }
      //  release {
            // TODO: Add your own signing config for the release build.
            // Signing with the debug keys for now, so `flutter run --release` works.
        //    signingConfig = signingConfigs.getByName("debug")
        //}
    }

    flavorDimensions += "default"

    productFlavors {
        create("dev") {
            applicationId = "com.digited.ol.smarttv"
            dimension = "default"
        }

        create("production") {
            applicationId = "com.digited.ol.smarttv"
            dimension = "default"
        }
    }
}

flutter {
    source = "../.."
}
