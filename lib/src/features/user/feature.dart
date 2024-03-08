import 'dart:async';

import 'package:core/core.dart';
import '../../dependency_injection/injection_container.dart';
import 'data/get_user_repository_impl.dart';
import 'data/interfaces/user_datasource.dart';
import 'datasources/user_datasource_impl.dart';
import 'domain/interfaces/get_user_repository.dart';
import 'domain/usecases/get_user_usecase.dart';
import 'presentation/user_viewmodel.dart';

class UserFeature implements CommonFeature {
  @override
  FutureOr<void> initialize() {
    // Datasource
    SL.I.registerFactory<UserDatasource>(
      () => UserDataSourceImpl(Network(SL.I<Environment>().baseUrl)),
    );

    // Repository
    SL.I.registerFactory<GetUserRepository>(
      () => GetUserRepositoryImpl(SL.I<UserDatasource>()),
    );

    // Domain
    SL.I.registerFactory<GetUserUseCase>(
      () => GetUserUseCase(repository: SL.I<GetUserRepository>()),
    );

    // Presentation
    SL.I.registerFactory<UserViewModel>(
      () => UserViewModel(getUserUseCase: SL.I<GetUserUseCase>()),
    );
  }
}
