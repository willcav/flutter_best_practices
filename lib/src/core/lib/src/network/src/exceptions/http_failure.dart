import '../../../abstractions/failure.dart';

enum HttpFailureType {
  // Add more status codes as needed
  badRequest('400'),
  unauthorized('401'),
  forbidden('403'),
  notFound('404'),
  timeout('408'),
  serverError('500'),
  error('');

  final String name;

  const HttpFailureType(this.name);
}

class HttpFailure implements Failure {
  @override
  final String? message;
  final int? statusCode;

  HttpFailure({this.statusCode, this.message});

  HttpFailureType get type {
    switch (statusCode) {
      case 400:
        return HttpFailureType.badRequest;
      case 401:
        return HttpFailureType.unauthorized;
      case 403:
        return HttpFailureType.forbidden;
      case 404:
        return HttpFailureType.notFound;
      case 408:
        return HttpFailureType.timeout;
      case 500:
        return HttpFailureType.serverError;
      default:
        return HttpFailureType.error;
    }
  }
}
