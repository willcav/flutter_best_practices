import 'package:flutter_clean_arch_error_handling/src/base/api_error.dart';
import 'package:flutter_clean_arch_error_handling/src/domain/errors/domain_error.dart';

abstract class UIError extends DomainError {
  const UIError._({String message = ''}) : super(message: message);

  factory UIError.apiError({String message = ''}) => _ApiError(message: message);
}

class _ApiError extends UIError {
  const _ApiError({String message = ''}) : super._(message: message);
}

extension ConverToUIError on DomainError {
  UIError toUIError() {
    switch (runtimeType) {
      case ApiError:
        return UIError.apiError(message: 'Erro no servidor');
      default:
        return UIError.apiError(message: message);
    }
  }
}
