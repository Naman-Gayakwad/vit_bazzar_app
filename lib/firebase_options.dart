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
    apiKey: 'AIzaSyDFcuKwVKg4Oa-UntQGoscf7YmiZYcrDhY',
    appId: '1:673785503092:web:074ad63a4e737bc16b6021',
    messagingSenderId: '673785503092',
    projectId: 'vit-bazzar-app',
    authDomain: 'vit-bazzar-app.firebaseapp.com',
    storageBucket: 'vit-bazzar-app.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAhilV5mScW5cao93JL7Zi8YVqD9JKc74s',
    appId: '1:673785503092:android:32fb67de2f6665fb6b6021',
    messagingSenderId: '673785503092',
    projectId: 'vit-bazzar-app',
    storageBucket: 'vit-bazzar-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDFOaG3OmUOW8zHtwNimrvI7w0ofq6oMlI',
    appId: '1:673785503092:ios:5f2afab23e6206166b6021',
    messagingSenderId: '673785503092',
    projectId: 'vit-bazzar-app',
    storageBucket: 'vit-bazzar-app.appspot.com',
    androidClientId: '673785503092-hvq1o14teg226je4tc8eh5oalbmj4tr9.apps.googleusercontent.com',
    iosClientId: '673785503092-cj624t2c78g65n0qf9211n43kgl44h51.apps.googleusercontent.com',
    iosBundleId: 'com.example.vitBazzarApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDFOaG3OmUOW8zHtwNimrvI7w0ofq6oMlI',
    appId: '1:673785503092:ios:5f2afab23e6206166b6021',
    messagingSenderId: '673785503092',
    projectId: 'vit-bazzar-app',
    storageBucket: 'vit-bazzar-app.appspot.com',
    androidClientId: '673785503092-hvq1o14teg226je4tc8eh5oalbmj4tr9.apps.googleusercontent.com',
    iosClientId: '673785503092-cj624t2c78g65n0qf9211n43kgl44h51.apps.googleusercontent.com',
    iosBundleId: 'com.example.vitBazzarApp',
  );
}
