import 'dart:async';

import 'package:core/core.dart';
import '../features/user/feature.dart';

Future<void> init() async {
  SL.I.registerLazySingleton<Environment>(() => Environment());

  InitializationResources().initialize();
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
