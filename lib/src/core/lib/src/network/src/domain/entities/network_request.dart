import '../utils/network_request_method.dart';
import '../utils/network_response_type.dart';
import 'content_type.dart';

class NetworkRequest {
  final String url;
  final NetworkRequestMethod method;
  final Object? body;
  final ContentType? contentType;
  final NetworkResponseType? responseType;
  final Map<String, dynamic>? headers;
  final Map<String, dynamic>? queryParameters;
  final Duration? timeout;

  NetworkRequest({
    required this.url,
    required this.method,
    this.body,
    this.contentType,
    this.responseType,
    this.headers,
    this.queryParameters,
    this.timeout,
  });

  NetworkRequest copyWith({
    String? url,
    NetworkRequestMethod? method,
    Object? body,
    NetworkResponseType? responseType,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
    Duration? timeout,
  }) =>
      NetworkRequest(
        url: url ?? this.url,
        method: method ?? this.method,
        body: body ?? this.body,
        responseType: responseType ?? this.responseType,
        headers: headers ?? this.headers,
        queryParameters: queryParameters ?? this.queryParameters,
        timeout: timeout ?? this.timeout,
      );
}
