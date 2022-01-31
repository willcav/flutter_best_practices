import 'package:flutter/material.dart';

import 'src/app.dart';
import 'src/dependency_injection/injection_container.dart' as di;
import 'src/settings/settings_controller.dart';
import 'src/settings/settings_service.dart';

void main() async {
  final settingsController = SettingsController(SettingsService());

  await settingsController.loadSettings();

  await di.init();

  runApp(App(settingsController: settingsController));
}
