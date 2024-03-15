import 'dart:async';

import 'package:core/core.dart';
import 'package:core/src/storage/src/data/interfaces/storage_driver.dart';
import 'package:core/src/storage/src/data/storage_impl.dart';
import 'package:core/src/storage/src/infra/shared_preferences_driver.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StoragePackage implements CommonPackage {
  @override
  FutureOr<void> initialize() async {
    // Driver
    final prefsDriver = await SharedPreferences.getInstance();
    SL.I.registerFactory<StorageDriver>(
        () => SharedPreferencesDriver(prefsDriver));

    // Storage
    SL.I.registerFactory<Storage>(() => StorageImpl(SL.I<StorageDriver>()));
  }
}
