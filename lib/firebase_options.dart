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
    apiKey: 'AIzaSyBhq76wFn0rfRpI-eM0cZMZJ9NKVcNzyvY',
    appId: '1:1001768142153:web:0d80b21f7c1f4fe67ec698',
    messagingSenderId: '1001768142153',
    projectId: 'microclimat-monitoring-app',
    authDomain: 'microclimat-monitoring-app.firebaseapp.com',
    databaseURL: 'https://microclimat-monitoring-app-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'microclimat-monitoring-app.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCABVrAji5OfKd8CDBsipHbycRODD8R3FU',
    appId: '1:1001768142153:android:6d9437c4479fc7687ec698',
    messagingSenderId: '1001768142153',
    projectId: 'microclimat-monitoring-app',
    databaseURL: 'https://microclimat-monitoring-app-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'microclimat-monitoring-app.appspot.com',
  );
}
