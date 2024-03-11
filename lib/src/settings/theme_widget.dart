import 'package:flutter/material.dart';
import 'package:core/core.dart';
import 'settings_controller.dart';

class ThemeWidget extends StatelessWidget {
  const ThemeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: () {
              SL.I<SettingsController>().updateThemeMode(ThemeMode.light);
            },
            icon: const Icon(Icons.light_mode)),
        IconButton(
            onPressed: () {
              SL.I<SettingsController>().updateThemeMode(ThemeMode.dark);
            },
            icon: const Icon(Icons.dark_mode)),
      ],
    );
  }
}
