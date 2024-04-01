import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
      case TargetPlatform.windows:
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBDZXM5hvUM1jLLCIy4AQA6Y8HwIAgZsck',
    appId: '1:393453520810:android:c6614a2fb0788531bacdd3',
    messagingSenderId: '393453520810',
    projectId: 'login-register-app-20231',
    databaseURL: '',
    storageBucket: '',
  );
}
