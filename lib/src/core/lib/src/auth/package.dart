import 'dart:async';

import 'package:core/core.dart';

import '../credential_manager/src/domain/interfaces/credential_manager.dart';
import 'src/data/auth_impl.dart';
import 'src/data/interfaces/auth_driver.dart';
import 'src/infra/firebase_auth_driver.dart';

class AuthPackage implements CommonPackage {
  @override
  FutureOr<void> initialize() {
    SL.I.registerFactory<AuthDriver>(
      () => FirebaseAuthDriver(SL.I<CredentialManager>()),
    );
    SL.I.registerFactory<Auth>(() => AuthImpl(SL.I<AuthDriver>()));
  }
}
