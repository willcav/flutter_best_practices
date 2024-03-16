import 'dart:async';

import '../../core.dart';
import 'src/data/credential_manager_impl.dart';
import 'src/domain/interfaces/credential_manager.dart';

class CredentialManagerPackage implements CommonPackage {
  @override
  FutureOr<void> initialize() {
    SL.I.registerFactory<CredentialManager>(
        () => CredentialManagerImpl(SL.I<Storage>()));
  }
}
