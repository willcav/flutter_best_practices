import '../../../../abstractions/either.dart';
import '../../domain/entities/network_failure.dart';
import '../../domain/entities/network_request.dart';
import '../../domain/entities/network_response.dart';
import '../../domain/interfaces/network_interceptor.dart';

/// Used to simulate an error given a scenario
class ExampleInterceptor implements NetworkInterceptor {
  @override
  Future<Either<NetworkFailure, NetworkRequest>> onRequest(
      NetworkRequest request) async {
    if (request.url.contains('error')) {
      return Left(
        NetworkFailure(
          message: "Failure message",
          url: request.url,
          method: request.method,
        ),
      );
    }

    return Right(request);
  }

  @override
  Future<Either<NetworkFailure, NetworkResponse>> onResponse(
          NetworkResponse response) async =>
      Right(response);
}
