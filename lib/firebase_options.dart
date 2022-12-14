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

  /* static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDmVIR2bn-MSeJnJ0qylNMsT8y-qeqqa-A',
    appId: '1:110311486730:android:b91e7b61ef5db7fb68f6f3',
    messagingSenderId: '110311486730',
    projectId: 'note-app1-7a1ed',
    storageBucket: 'note-app1-7a1ed.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBOCztKF94cR6byAfhEIjeBp21ALSUBu5w',
    appId: '1:110311486730:ios:b4bf7e735a6e9b4c68f6f3',
    messagingSenderId: '110311486730',
    projectId: 'note-app1-7a1ed',
    storageBucket: 'note-app1-7a1ed.appspot.com',
    iosClientId: '110311486730-gfan6fpu01alk2amhdlnk4fd2i9c2jfg.apps.googleusercontent.com',
    iosBundleId: 'com.example.mapExam',
  );*/

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDmVIR2bn-MSeJnJ0qylNMsT8y-qeqqa-A',
    appId: '1:110311486730:android:55ebeeca654409df68f6f3',
    messagingSenderId: '110311486730',
    projectId: 'note-app1-7a1ed',
    storageBucket: 'note-app1-7a1ed.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBOCztKF94cR6byAfhEIjeBp21ALSUBu5w',
    appId: '1:110311486730:ios:b53f856bc5e4aa4e68f6f3',
    messagingSenderId: '110311486730',
    projectId: 'note-app1-7a1ed',
    storageBucket: 'note-app1-7a1ed.appspot.com',
    iosClientId:
        '110311486730-61qdi9n62resovb9utpfln4t908be853.apps.googleusercontent.com',
    iosBundleId: 'com.example.mapExam',
  );
}
