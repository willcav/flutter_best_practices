import '../utils/network_request_method.dart';

class NetworkFailure {
  final String message;
  final String url;
  final NetworkRequestMethod method;
  final int? statusCode;
  final Map<String, dynamic>? headers;
  final dynamic body;

  NetworkFailure({
    required this.message,
    required this.url,
    required this.method,
    this.statusCode,
    this.headers,
    this.body,
  });
}
