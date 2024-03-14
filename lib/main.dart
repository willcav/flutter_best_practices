import 'package:flutter/material.dart';
import 'package:core/core.dart';
import 'src/app.dart';
import 'src/dependency_injection/injection_container.dart' as di;
import 'src/settings/settings_controller.dart';

void main() async {
  await di.init();
  runApp(
    App(settingsController: SL.I<SettingsController>()),
  );
}
