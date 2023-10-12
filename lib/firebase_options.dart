// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyByEkrMynTPt4D56cVxAXN9DmaYIRWk2AM',
    appId: '1:58443286682:web:29e8ca7eac3ff8541bf723',
    messagingSenderId: '58443286682',
    projectId: 'ser-manos-62724',
    authDomain: 'ser-manos-62724.firebaseapp.com',
    storageBucket: 'ser-manos-62724.appspot.com',
    measurementId: 'G-8Y48PP29PN',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDx6QA84ZGvTXQXxVhjKWOc1EJ9RXVBDh4',
    appId: '1:58443286682:android:5a51259bf67d613d1bf723',
    messagingSenderId: '58443286682',
    projectId: 'ser-manos-62724',
    storageBucket: 'ser-manos-62724.appspot.com',
  );
}
