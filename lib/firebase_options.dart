// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyBlylfnd9pfSaFuH9t9XHBrQzHMZrgooSI',
    appId: '1:106502764517:web:b48e7a19231e23d100a10c',
    messagingSenderId: '106502764517',
    projectId: 'nuerotum',
    authDomain: 'nuerotum.firebaseapp.com',
    storageBucket: 'nuerotum.firebasestorage.app',
    measurementId: 'G-X15TPVFL46',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDVlHHiSHqG4-JQ2W-zTP63Ra3_xlHrMBE',
    appId: '1:106502764517:android:d21239d0525d187b00a10c',
    messagingSenderId: '106502764517',
    projectId: 'nuerotum',
    storageBucket: 'nuerotum.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC_NIXcwb7EWsPStyiwTsR608mCpr24e5o',
    appId: '1:106502764517:ios:61f697980ef8d99000a10c',
    messagingSenderId: '106502764517',
    projectId: 'nuerotum',
    storageBucket: 'nuerotum.firebasestorage.app',
    iosBundleId: 'com.example.brainTumrDetectionApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC_NIXcwb7EWsPStyiwTsR608mCpr24e5o',
    appId: '1:106502764517:ios:61f697980ef8d99000a10c',
    messagingSenderId: '106502764517',
    projectId: 'nuerotum',
    storageBucket: 'nuerotum.firebasestorage.app',
    iosBundleId: 'com.example.brainTumrDetectionApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBlylfnd9pfSaFuH9t9XHBrQzHMZrgooSI',
    appId: '1:106502764517:web:d8d512ff8bffbd2e00a10c',
    messagingSenderId: '106502764517',
    projectId: 'nuerotum',
    authDomain: 'nuerotum.firebaseapp.com',
    storageBucket: 'nuerotum.firebasestorage.app',
    measurementId: 'G-H2NTQEQSLF',
  );
}
