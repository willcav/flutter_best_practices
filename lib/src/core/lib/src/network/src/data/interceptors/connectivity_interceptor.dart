import 'dart:io';

import '../../../../../core.dart';
import '../../domain/entities/network_failure.dart';
import '../../domain/interfaces/network_interceptor.dart';

class ConnectivityInterceptor implements NetworkInterceptor {
  @override
  Future<Either<NetworkFailure, NetworkRequest>> onRequest(
      NetworkRequest request) async {
    try {
      final result = await InternetAddress.lookup('google.com')
          .timeout(request.timeout ?? const Duration(seconds: 60));
      if (result.isEmpty) {
        throw Failure;
      }
      return Right(request);
    } catch (e) {
      return Left(
        NetworkFailure(
          message: "No Connection",
          url: request.url,
          method: request.method,
        ),
      );
    }
  }

  @override
  Future<Either<NetworkFailure, NetworkResponse>> onResponse(
          NetworkResponse response) async =>
      Right(response);
}
