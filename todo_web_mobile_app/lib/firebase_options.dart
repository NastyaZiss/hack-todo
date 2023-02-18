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
    apiKey: 'AIzaSyB3432E3u1F0wrbZ2PUiupH2O3Mjok8MyM',
    appId: '1:599547609689:web:887d937e71d02e345b2748',
    messagingSenderId: '599547609689',
    projectId: 'hack-project-666d7',
    authDomain: 'hack-project-666d7.firebaseapp.com',
    storageBucket: 'hack-project-666d7.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC3TYc5_mgOQJAcTHAIBiH5PRAuulTl4ZI',
    appId: '1:599547609689:android:b3928a89e896ebd45b2748',
    messagingSenderId: '599547609689',
    projectId: 'hack-project-666d7',
    storageBucket: 'hack-project-666d7.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBc0KZWTWD_CwjutbRWXL01OeSLVV3T_wE',
    appId: '1:599547609689:ios:f6e57442d7e5c3b35b2748',
    messagingSenderId: '599547609689',
    projectId: 'hack-project-666d7',
    storageBucket: 'hack-project-666d7.appspot.com',
    iosClientId: '599547609689-aobkhslq7h6ti4upuv0mv6gt4lr74dh5.apps.googleusercontent.com',
    iosBundleId: 'com.example.todoWebMobileApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBc0KZWTWD_CwjutbRWXL01OeSLVV3T_wE',
    appId: '1:599547609689:ios:5989af033156595f5b2748',
    messagingSenderId: '599547609689',
    projectId: 'hack-project-666d7',
    storageBucket: 'hack-project-666d7.appspot.com',
    iosClientId: '599547609689-3rtdb8j7rrvpisv7tgc2fu2mtrsvjuft.apps.googleusercontent.com',
    iosBundleId: 'com.example.todoWebMobileApp.RunnerTests',
  );
}