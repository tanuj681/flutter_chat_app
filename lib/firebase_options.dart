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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB7_lnb6TXhsKVqMSkF0MzpaCjS-4lQUrg',
    appId: '1:641546266359:android:349d0bdb451b58b08795f2',
    messagingSenderId: '641546266359',
    projectId: 'chatbytanuj',
    databaseURL: 'https://chatbytanuj-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'chatbytanuj.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA0OKvvMMSY0QGqUDxuMykgFokgn1BjItI',
    appId: '1:641546266359:ios:a708db559b9193df8795f2',
    messagingSenderId: '641546266359',
    projectId: 'chatbytanuj',
    databaseURL: 'https://chatbytanuj-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'chatbytanuj.firebasestorage.app',
    iosBundleId: 'com.example.chatProjectTanuj',
  );
}
