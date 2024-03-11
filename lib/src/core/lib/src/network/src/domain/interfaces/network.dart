import '../../data/interceptors/example_interceptor.dart';
import '../entities/content_type.dart';
import '../entities/network_response.dart';
import '../../../../abstractions/abstractions.dart';
import '../../../../service_locator/service_locator.dart';

import '../utils/network_response_type.dart';
import 'network_interceptor.dart';

abstract interface class Network {
  /// Create the default [Network] instance.
  ///
  /// # Parameters
  /// **baseUrl:** Base URL of the API
  ///
  /// **interceptors:** List of [NetworkInterceptor] that can customize both the request and response
  factory Network(
    String baseUrl, {
    List<NetworkInterceptor> interceptors = const [],
  }) {
    return SL.I<Network>(param1: baseUrl, param2: [
      ...[ExampleInterceptor()],
      ...interceptors,
    ]);
  }

  /// The base URL of the API that the application communicates with.
  ///
  /// This URL serves as the starting point for constructing complete URLs for
  /// making HTTP requests to various endpoints within the API or server.
  String get baseUrl;

  Future<Either<Failure, NetworkResponse>> get(
    String endpoint, {
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
    NetworkResponseType? responseType,
  });

  Future<Either<Failure, NetworkResponse>> post(
    String endpoint, {
    dynamic body,
    ContentType? contentType = ContentType.json,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
    NetworkResponseType? responseType,
  });

  Future<Either<Failure, NetworkResponse>> put(
    String endpoint, {
    dynamic body,
    ContentType? contentType = ContentType.json,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
    NetworkResponseType? responseType,
  });

  Future<Either<Failure, NetworkResponse>> patch(
    String endpoint, {
    dynamic body,
    ContentType? contentType = ContentType.json,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
    NetworkResponseType? responseType,
  });

  Future<Either<Failure, NetworkResponse>> delete(
    String endpoint, {
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
    NetworkResponseType? responseType,
  });
}
