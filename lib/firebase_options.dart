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
    apiKey: 'AIzaSyBnMakjcEhKPIV4mGKfNhGJWUkus5AUvp0',
    appId: '1:426543795616:web:1e81f59c56b43de38b68c5',
    messagingSenderId: '426543795616',
    projectId: 'flutter-map-deaa3',
    authDomain: 'flutter-map-deaa3.firebaseapp.com',
    storageBucket: 'flutter-map-deaa3.appspot.com',
    measurementId: 'G-B9MLLPE1W6',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCOhsMlaqk6Rch59uo-tc_ziJXqsb9KOoQ',
    appId: '1:426543795616:android:e7eee90dd84111a18b68c5',
    messagingSenderId: '426543795616',
    projectId: 'flutter-map-deaa3',
    storageBucket: 'flutter-map-deaa3.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCabYj6KDmi4d8sZ2HYWS3RvojCLTRNihA',
    appId: '1:426543795616:ios:c1d033aaecf28ada8b68c5',
    messagingSenderId: '426543795616',
    projectId: 'flutter-map-deaa3',
    storageBucket: 'flutter-map-deaa3.appspot.com',
    iosBundleId: 'com.example.flutterMaps',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCabYj6KDmi4d8sZ2HYWS3RvojCLTRNihA',
    appId: '1:426543795616:ios:a389041f1245c2dc8b68c5',
    messagingSenderId: '426543795616',
    projectId: 'flutter-map-deaa3',
    storageBucket: 'flutter-map-deaa3.appspot.com',
    iosBundleId: 'com.example.flutterMaps.RunnerTests',
  );
}
