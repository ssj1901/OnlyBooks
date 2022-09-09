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
    apiKey: 'AIzaSyAyEIK9RKtPhEp8hNrfagpNHhP79egDY40',
    appId: '1:681606043251:web:3d4c96eda3f1c00e48fc06',
    messagingSenderId: '681606043251',
    projectId: 'onlybooks-db397',
    authDomain: 'onlybooks-db397.firebaseapp.com',
    storageBucket: 'onlybooks-db397.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAPxIFvTQm7qxXFCLJfkIip5icRs5wLdIo',
    appId: '1:681606043251:android:46a9473bbe8f164a48fc06',
    messagingSenderId: '681606043251',
    projectId: 'onlybooks-db397',
    storageBucket: 'onlybooks-db397.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCubOe6QVFbveM97wWZE9DEHZOK9_XD19g',
    appId: '1:681606043251:ios:06a1eab1f6fe45ff48fc06',
    messagingSenderId: '681606043251',
    projectId: 'onlybooks-db397',
    storageBucket: 'onlybooks-db397.appspot.com',
    iosClientId: '681606043251-6iaos9lbaoqmso3mte1t1sdeasholtlm.apps.googleusercontent.com',
    iosBundleId: 'com.example.onlybook',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCubOe6QVFbveM97wWZE9DEHZOK9_XD19g',
    appId: '1:681606043251:ios:06a1eab1f6fe45ff48fc06',
    messagingSenderId: '681606043251',
    projectId: 'onlybooks-db397',
    storageBucket: 'onlybooks-db397.appspot.com',
    iosClientId: '681606043251-6iaos9lbaoqmso3mte1t1sdeasholtlm.apps.googleusercontent.com',
    iosBundleId: 'com.example.onlybook',
  );
}