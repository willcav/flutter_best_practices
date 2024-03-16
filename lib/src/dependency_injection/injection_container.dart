import 'dart:async';

import 'package:core/core.dart';
import 'package:flutter/material.dart';
import '../features/user/feature.dart';
import '../settings/settings_controller.dart';
import '../settings/settings_service.dart';

Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();

  SL.I.registerLazySingleton<Environment>(() => Environment());
  SL.I.registerLazySingleton<SettingsController>(
      () => SettingsController(SettingsService()));

  await InitializationResources().initialize();
  SL.I<SettingsController>().loadSettings();
}

// Implement the environment with your conditions.
// Based on your flavors and environments.
class Environment {
  String get baseUrl => 'https://65e67675d7f0758a76e86f94.mockapi.io/';
}

// Initialize your resources using your strategies
class InitializationResources {
  static final packages = <CommonPackage>[
    NetworkPackage(),
    StoragePackage(),
    CredentialManagerPackage(),
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
