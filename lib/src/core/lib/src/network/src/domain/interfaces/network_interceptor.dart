import '../../../../abstractions/either.dart';
import '../entities/network_failure.dart';
import '../entities/network_response.dart';
import '../entities/network_request.dart';

abstract interface class NetworkInterceptor {
  /// Method called upon request by the **InterceptorHandler**
  Future<Either<NetworkFailure, NetworkRequest>> onRequest(
      NetworkRequest request);

  /// Method called after response by the **InterceptorHandler**
  Future<Either<NetworkFailure, NetworkResponse>> onResponse(
      NetworkResponse response);
}
