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
        return ios;
      case TargetPlatform.macOS:
        return macos;
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
    apiKey: 'AIzaSyBSkMxztWukUZPoMKSc36rc1FnBvEcfUE0',
    appId: '1:897188779737:web:ef4aba1da9d4f8267a10c8',
    messagingSenderId: '897188779737',
    projectId: 'femalefellows-11bb9',
    authDomain: 'femalefellows-11bb9.firebaseapp.com',
    storageBucket: 'femalefellows-11bb9.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD6ia65YcPcg1oH183S96WLphlrRl9hNI4',
    appId: '1:897188779737:android:028c2746f0e4f4277a10c8',
    messagingSenderId: '897188779737',
    projectId: 'femalefellows-11bb9',
    storageBucket: 'femalefellows-11bb9.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD3E05dK1KWqgIcgDaFXsueu2hZO-tMmgM',
    appId: '1:897188779737:ios:94b55591295f338a7a10c8',
    messagingSenderId: '897188779737',
    projectId: 'femalefellows-11bb9',
    storageBucket: 'femalefellows-11bb9.appspot.com',
    iosBundleId: 'com.example.vsFemalefellows',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD3E05dK1KWqgIcgDaFXsueu2hZO-tMmgM',
    appId: '1:897188779737:ios:62c1c2ccbf33bf327a10c8',
    messagingSenderId: '897188779737',
    projectId: 'femalefellows-11bb9',
    storageBucket: 'femalefellows-11bb9.appspot.com',
    iosBundleId: 'com.example.vsFemalefellows.RunnerTests',
  );
}
