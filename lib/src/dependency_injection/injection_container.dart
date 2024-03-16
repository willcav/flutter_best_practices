import 'dart:async';

import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../features/user/feature.dart';
import '../firebase/firebase_options.dart';
import '../firebase/firebase_service.dart';
import '../settings/settings_controller.dart';
import '../settings/settings_service.dart';

Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  SL.I.registerLazySingleton<Environment>(() => Environment());

  await _initFirebaseConfig();

  SL.I.registerLazySingleton<SettingsController>(
      () => SettingsController(SettingsService()));

  await InitializationResources().initialize();
  SL.I<SettingsController>().loadSettings();
}

// Implement the environment with your conditions.
// Based on your flavors and environments.
class Environment {
  String get baseUrl => dotenv.env['BASE_URL'] ?? '';
}

// Initialize your resources using your strategies
class InitializationResources {
  static final packages = <CommonPackage>[
    NetworkPackage(),
    StoragePackage(),
    CredentialManagerPackage(),
    AuthPackage(),
  ];

  static final features = <CommonFeature>[
    UserFeature(),
  ];

  FutureOr<void> initialize() async {
    for (final package in packages) {
      await package.initialize();
    }

    for (final feature in features) {
      await feature.initialize();
    }
  }
}

Future<void> _initFirebaseConfig() async {
  final firebaseOptions = DefaultFirebaseOptions(
    androidConfig: PlatformConfig(
      apiKey: dotenv.get('ANDROID_API_KEY'),
      appId: dotenv.get('ANDROID_APP_ID'),
      messagingSenderId: dotenv.get('ANDROID_SENDER_ID'),
      projectId: dotenv.get('ANDROID_PROJECT_ID'),
      storageBucket: dotenv.get('ANDROID_STORAGE_BUCKET'),
      bundleId: null,
    ),
    iosConfig: PlatformConfig(
      apiKey: null,
      appId: null,
      messagingSenderId: null,
      projectId: null,
      storageBucket: null,
      bundleId: null,
    ),
  );

  await FirebaseService(firebaseOptions).init();
}
