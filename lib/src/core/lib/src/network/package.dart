import 'dart:async';

import '../../core.dart';
import 'src/data/interceptor_handler.dart';
import 'src/data/interceptors/interceptors.dart';
import 'src/data/interfaces/http_client.dart';
import 'src/data/network_impl.dart';
import 'src/domain/interfaces/network_interceptor.dart';
import 'src/infra/dio_client.dart';
import 'package:dio/dio.dart';

class NetworkPackage implements CommonPackage {
  @override
  FutureOr<void> initialize() {
    SL.I.registerFactory<HttpClient>(() => DioClient(Dio()));

    SL.I.registerFactoryWithParams<Network, String, List<NetworkInterceptor>>(
      (baseUrl, interceptors) {
        interceptors.addAll([ExampleInterceptor(), ConnectivityInterceptor()]);
        return NetworkImpl(
          url: baseUrl,
          httpClient: SL.I<HttpClient>(),
          interceptorHandler: NetworkInterceptorHandler(
            interceptors: interceptors,
          ),
        );
      },
    );
  }
}
