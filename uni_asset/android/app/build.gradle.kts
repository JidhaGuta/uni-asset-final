plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.uni_asset"  // (keep your actual namespace)
    compileSdk = 34

    ndkVersion = "27.0.12077973"  // ✅ Add this line

    defaultConfig {
        applicationId = "com.example.uni_asset"
        minSdk = 21
        targetSdk = 34
        versionCode = 1
        versionName = "1.0"
    }
}


flutter {
    source = "../.."
}
