import 'package:flutter_clean_arch_error_handling/src/base/api_error.dart';
import 'package:flutter_clean_arch_error_handling/src/base/not_found_error.dart';
import 'package:flutter_clean_arch_error_handling/src/base/time_out_error.dart';

import '../../../base/invalid_data_error.dart';
import '../../../base/unauthorized_error.dart';
import '../../../domain/errors/domain_error.dart';

abstract class HttpError extends DomainError {
  const HttpError._({String message = ''}) : super(message: message);

  factory HttpError.badRequest({String message = ''}) => _BadRequest(message: message);
  factory HttpError.unauthorized({String message = ''}) => _Unauthorized(message: message);
  factory HttpError.forbidden({String message = ''}) => _Forbidden(message: message);
  factory HttpError.notFound({String message = ''}) => _NotFound(message: message);
  factory HttpError.invalidData({String message = ''}) => _InvalidData(message: message);
  factory HttpError.timeOut({String message = ''}) => _TimeOut(message: message);
  factory HttpError.serverError({String message = ''}) => _ServerError(message: message);
}

class _BadRequest extends HttpError {
  _BadRequest({String message = ''}) : super._(message: message);
}

class _Unauthorized extends HttpError {
  _Unauthorized({String message = ''}) : super._(message: message);
}

class _Forbidden extends HttpError {
  _Forbidden({String message = ''}) : super._(message: message);
}

class _NotFound extends HttpError {
  _NotFound({String message = ''}) : super._(message: message);
}

class _InvalidData extends HttpError {
  _InvalidData({String message = ''}) : super._(message: message);
}

class _TimeOut extends HttpError {
  _TimeOut({String message = ''}) : super._(message: message);
}

class _ServerError extends HttpError {
  _ServerError({String message = ''}) : super._(message: message);
}

extension ConvertToBaseError on HttpError {
  /// Convert HttpError to BaseError equivalent
  DomainError convertError() {
    switch (runtimeType) {
      case _BadRequest:
        return InvalidDataError(message: message);
      case _Unauthorized:
        return UnauthorizedError(message: message);
      case _Forbidden:
        return UnauthorizedError(message: message);
      case _NotFound:
        return NotFoundError(message: message);
      case _InvalidData:
        return InvalidDataError(message: message);
      case _TimeOut:
        return TimeOutError(message: message);
      case _ServerError:
        return ApiError(message: message);
      default:
        return ApiError(message: message);
    }
  }
}
