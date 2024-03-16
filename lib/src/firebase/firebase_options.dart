import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  final PlatformConfig androidConfig;
  final PlatformConfig iosConfig;

  DefaultFirebaseOptions({
    required this.androidConfig,
    required this.iosConfig,
  });

  FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return androidConfig.options;
      case TargetPlatform.iOS:
        return iosConfig.options;
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
}

class PlatformConfig {
  final String? apiKey;
  final String? appId;
  final String? messagingSenderId;
  final String? projectId;
  final String? storageBucket;
  final String? bundleId;

  PlatformConfig({
    required this.apiKey,
    required this.appId,
    required this.messagingSenderId,
    required this.projectId,
    required this.storageBucket,
    required this.bundleId,
  });

  FirebaseOptions get options => FirebaseOptions(
        apiKey: apiKey ?? '',
        appId: appId ?? '',
        messagingSenderId: messagingSenderId ?? '',
        projectId: projectId ?? '',
        storageBucket: storageBucket,
        iosBundleId: bundleId,
      );
}
