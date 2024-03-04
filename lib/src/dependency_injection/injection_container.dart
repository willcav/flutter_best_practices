import 'package:dio/dio.dart';
import 'package:flutter_clean_arch_error_handling/src/data/http/http_client.dart';
import 'package:flutter_clean_arch_error_handling/src/data/usecases/remote_get_user.dart';
import 'package:flutter_clean_arch_error_handling/src/domain/usecases/get_user_usecase.dart';
import 'package:flutter_clean_arch_error_handling/src/infra/dio_adapter.dart';
import 'package:flutter_clean_arch_error_handling/src/presentation/user_presenter.dart';
import 'package:flutter_clean_arch_error_handling/src/service_locator/domain/service_locator.dart';
import 'package:flutter_clean_arch_error_handling/src/ui/user_presenter.dart';

Future<void> init() async {
  // User Presenter
  SL.I.registerFactory<UserPresenter>(
      () => UserPresenterImpl(getUserUseCase: SL.I()));

  // Get User use case
  SL.I.registerLazySingleton<GetUserUseCase>(() => RemoteGetUser(
        client: SL.I(),
        url: 'https://61a00297a647020017613270.mockapi.io/api/v1/user',
      ));

  // HttpClient Dio Adapater
  SL.I.registerLazySingleton(() => Dio());
  SL.I.registerLazySingleton<HttpClient>(() => DioAdapter(client: SL.I()));
}
