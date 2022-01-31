import 'package:dio/dio.dart';
import 'package:flutter_clean_arch_error_handling/src/data/http/http_client.dart';
import 'package:flutter_clean_arch_error_handling/src/data/usecases/remote_get_user.dart';
import 'package:flutter_clean_arch_error_handling/src/domain/usecases/get_user_usecase.dart';
import 'package:flutter_clean_arch_error_handling/src/infra/dio_adapter.dart';
import 'package:flutter_clean_arch_error_handling/src/presentation/user_presenter.dart';
import 'package:flutter_clean_arch_error_handling/src/ui/user_presenter.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // User Presenter
  sl.registerFactory<UserPresenter>(() => UserPresenterImpl(getUserUseCase: sl()));

  // Get User use case
  sl.registerLazySingleton<GetUserUseCase>(() => RemoteGetUser(
        client: sl(),
        url: 'https://61a00297a647020017613270.mockapi.io/api/v1/user',
      ));

  // HttpClient Dio Adapater
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton<HttpClient>(() => DioAdapter(client: sl()));
}
