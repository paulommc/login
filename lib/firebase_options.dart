// File generated by FlutterFire CLI.
// ignore_for_file: type=lint, unnecessary_import
import 'package:firebase_core/firebase_core.dart' show Firebase, FirebaseOptions;
import 'package:flutter/foundation.dart'show defaultTargetPlatform, kIsWeb, TargetPlatform;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:login/main.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Firebase Test',
      home: MainApp(),
    )
  );
}


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
    apiKey: 'AIzaSyAPwUzvYIH8dSt5MsQ8cV8P2BUo6u7sItQ',
    appId: '1:459470333901:web:7dec4c8346e7b5064e8684',
    messagingSenderId: '459470333901',
    projectId: 'fatec-p2-mobile',
    authDomain: 'fatec-p2-mobile.firebaseapp.com',
    storageBucket: 'fatec-p2-mobile.firebasestorage.app',
    measurementId: 'G-LLK3N5TH6N',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAglMLqdhzkUUjrObGwfJ-xU5-RLbs0MaQ',
    appId: '1:459470333901:android:ef5f68ea202a0e944e8684',
    messagingSenderId: '459470333901',
    projectId: 'fatec-p2-mobile',
    storageBucket: 'fatec-p2-mobile.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBCD1MLBwoiV0LZ8f89nc0QyVJrElX5sJE',
    appId: '1:459470333901:ios:13c3b7fcc6a0f8bf4e8684',
    messagingSenderId: '459470333901',
    projectId: 'fatec-p2-mobile',
    storageBucket: 'fatec-p2-mobile.firebasestorage.app',
    iosBundleId: 'com.example.login',
  );
}
