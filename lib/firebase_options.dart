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
    apiKey: 'AIzaSyCUikUYUoJ45wkwKMnwd1VIa3Ib3qAvnjw',
    appId: '1:90221663236:web:d869fb34a582969d65d151',
    messagingSenderId: '90221663236',
    projectId: 'ludokhel-bd729',
    authDomain: 'ludokhel-bd729.firebaseapp.com',
    storageBucket: 'ludokhel-bd729.appspot.com',
    measurementId: 'G-8BLEN5E257',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCFHcKfk7SxzW6kgN3sglsplNSfzbXQWhM',
    appId: '1:90221663236:ios:4e5c37c90aa643b065d151',
    messagingSenderId: '90221663236',
    projectId: 'ludokhel-bd729',
    storageBucket: 'ludokhel-bd729.appspot.com',
    iosBundleId: 'com.example.ludokhell',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCUikUYUoJ45wkwKMnwd1VIa3Ib3qAvnjw',
    appId: '1:90221663236:web:2cba0de93a53c74865d151',
    messagingSenderId: '90221663236',
    projectId: 'ludokhel-bd729',
    authDomain: 'ludokhel-bd729.firebaseapp.com',
    storageBucket: 'ludokhel-bd729.appspot.com',
    measurementId: 'G-CNTDNK3HJQ',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCFHcKfk7SxzW6kgN3sglsplNSfzbXQWhM',
    appId: '1:90221663236:ios:4e5c37c90aa643b065d151',
    messagingSenderId: '90221663236',
    projectId: 'ludokhel-bd729',
    storageBucket: 'ludokhel-bd729.appspot.com',
    iosBundleId: 'com.example.ludokhell',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAiqpY70kejdGuKWJYxbdQvp2BbRl6cmBM',
    appId: '1:90221663236:android:22c8d9d91f360d7265d151',
    messagingSenderId: '90221663236',
    projectId: 'ludokhel-bd729',
    storageBucket: 'ludokhel-bd729.appspot.com',
  );

}