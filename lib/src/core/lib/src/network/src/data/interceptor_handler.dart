import '../../../abstractions/either.dart';
import '../domain/entities/network_failure.dart';
import '../domain/entities/network_response.dart';
import '../domain/entities/network_request.dart';
import '../domain/interfaces/network_interceptor.dart';
import 'package:flutter/foundation.dart';

class NetworkInterceptorHandler {
  final List<NetworkInterceptor> interceptors;

  NetworkInterceptorHandler({required this.interceptors});

  /// Action called upon request before calling the driver implementation
  /// It will iterate through all interceptors and call their onRequest method
  Future<Either<NetworkFailure, NetworkRequest>> onRequest(
    NetworkRequest request,
  ) async {
    return intercept<NetworkRequest>(
      input: request,
      interceptorCall: (interceptor, interceptedRequest) =>
          interceptor.onRequest(interceptedRequest),
      copyWithCallback: (interceptedRequest, updatedRequest) =>
          interceptedRequest.copyWith(
        url: updatedRequest.url,
        method: updatedRequest.method,
        body: updatedRequest.body,
        responseType: updatedRequest.responseType,
        headers: updatedRequest.headers,
        queryParameters: updatedRequest.queryParameters,
        timeout: updatedRequest.timeout,
      ),
    );
  }

  /// Action called after getting the driver implementation response
  /// It will iterate through all interceptors and call their onResponse method
  Future<Either<NetworkFailure, NetworkResponse>> onResponse(
      NetworkResponse response) async {
    return intercept<NetworkResponse>(
      input: response,
      interceptorCall: (interceptor, interceptedResponse) =>
          interceptor.onResponse(interceptedResponse),
      copyWithCallback: (interceptedResponse, updatedResponse) =>
          interceptedResponse.copyWith(
        url: updatedResponse.url,
        statusCode: updatedResponse.statusCode,
        headers: updatedResponse.headers,
        data: updatedResponse.getData(),
      ),
    );
  }

  /// Logic that handles common interaction and calls
  /// methods [onRequest] and [onResponse] from interceptors.
  ///
  /// # Parameters:
  /// - **input** is the request or response that will be intercepted
  ///
  /// - **InterceptorCall** is the method [onResponse] or [onRequest] of the interceptor
  ///
  /// - **CopyWithCallback** updates the request or response based on the interception
  @visibleForTesting
  Future<Either<NetworkFailure, T>> intercept<T>({
    required T input,
    required InterceptorCall<T> interceptorCall,
    required CopyWithCallback<T> copyWithCallback,
  }) async {
    T interceptedValue = input;
    for (final interceptor in interceptors) {
      final result = await interceptorCall(interceptor, interceptedValue);
      if (result.isLeft) return Left(result.left);

      interceptedValue = copyWithCallback(interceptedValue, result.right);
    }

    return Right(interceptedValue);
  }
}

@visibleForTesting
typedef InterceptorCall<T> = Future<Either<NetworkFailure, T>> Function(
    NetworkInterceptor, T);

@visibleForTesting
typedef CopyWithCallback<T> = T Function(T interceptedValue, T updatedValue);
