import '../../../abstractions/either.dart';
import '../../../abstractions/failure.dart';
import '../domain/utils/network_request_method.dart';
import '../domain/utils/network_response_type.dart';
import '../exceptions/http_failure.dart';
import 'interceptor_handler.dart';
import 'interfaces/http_client.dart';
import '../domain/entities/content_type.dart';
import '../domain/entities/network_failure.dart';
import '../domain/entities/network_response.dart';
import '../domain/entities/network_request.dart';
import '../domain/interfaces/network.dart';
import 'package:flutter/foundation.dart';

class NetworkImpl implements Network {
  final String url;
  final HttpClient httpClient;
  final NetworkInterceptorHandler interceptorHandler;

  NetworkImpl({
    required this.url,
    required this.httpClient,
    required this.interceptorHandler,
  });

  @override
  String get baseUrl => url;

  @override
  Future<Either<Failure, NetworkResponse>> get(
    String endpoint, {
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
    NetworkResponseType? responseType,
  }) async {
    final request = await prepareRequest(
      NetworkRequestMethod.get,
      endpoint,
      headers: headers,
      queryParameters: queryParameters,
      responseType: responseType,
    );

    return executeRequest(request);
  }

  @override
  Future<Either<Failure, NetworkResponse>> post(
    String endpoint, {
    body,
    ContentType? contentType = ContentType.json,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
    NetworkResponseType? responseType,
  }) async {
    final request = await prepareRequest(
      NetworkRequestMethod.post,
      endpoint,
      contentType: contentType,
      headers: headers,
      body: body,
      queryParameters: queryParameters,
      responseType: responseType,
    );

    return executeRequest(request);
  }

  @override
  Future<Either<Failure, NetworkResponse>> put(
    String endpoint, {
    body,
    ContentType? contentType = ContentType.json,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
    NetworkResponseType? responseType,
  }) async {
    final request = await prepareRequest(
      NetworkRequestMethod.put,
      endpoint,
      contentType: contentType,
      headers: headers,
      body: body,
      queryParameters: queryParameters,
      responseType: responseType,
    );

    return executeRequest(request);
  }

  @override
  Future<Either<Failure, NetworkResponse>> patch(
    String endpoint, {
    body,
    ContentType? contentType = ContentType.json,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
    NetworkResponseType? responseType,
  }) async {
    final request = await prepareRequest(
      NetworkRequestMethod.patch,
      endpoint,
      contentType: contentType,
      headers: headers,
      body: body,
      queryParameters: queryParameters,
      responseType: responseType,
    );

    return executeRequest(request);
  }

  @override
  Future<Either<Failure, NetworkResponse>> delete(
    String endpoint, {
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
    NetworkResponseType? responseType,
  }) async {
    final request = await prepareRequest(
      NetworkRequestMethod.delete,
      endpoint,
      headers: headers,
      queryParameters: queryParameters,
      responseType: responseType,
    );

    return executeRequest(request);
  }

  @visibleForTesting
  Future<Either<NetworkFailure, NetworkRequest>> prepareRequest(
    NetworkRequestMethod requestMethod,
    String endpoint, {
    body,
    ContentType? contentType,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    NetworkResponseType? responseType,
  }) async {
    final url = "$baseUrl$endpoint";

    // The timeout information can come from a remoteConfig and
    // be injected into this class via a service
    const timeout = Duration(milliseconds: 5000);

    final request = NetworkRequest(
      url: url,
      method: requestMethod,
      body: body,
      responseType: responseType,
      headers: headers,
      queryParameters: queryParameters,
      timeout: timeout,
    );
    return await interceptorHandler.onRequest(request);
  }

  @visibleForTesting
  Future<Either<Failure, NetworkResponse>> executeRequest(
      Either<NetworkFailure, NetworkRequest> request) async {
    try {
      if (request.isLeft) throw request.left;

      final result = await httpClient.request(request.right);

      final response = NetworkResponse.fromJson(result);

      final interceptedResponse = await interceptorHandler.onResponse(response);

      if (interceptedResponse.isLeft) throw interceptedResponse.left;

      return Right(interceptedResponse.right);
    } on NetworkFailure catch (exception) {
      return Left(HttpFailure(
          statusCode: exception.statusCode, message: exception.message));
    } catch (exception) {
      return Left(GenericFailure(message: exception.toString()));
    }
  }
}
