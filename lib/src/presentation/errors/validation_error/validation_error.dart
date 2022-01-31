import 'package:flutter_clean_arch_error_handling/src/domain/errors/domain_error.dart';

abstract class ValidationError extends DomainError {
  const ValidationError._({String message = ''}) : super(message: message);

  factory ValidationError.noError({String message = ''}) => _NoError(message: message);
  factory ValidationError.requiredField({String message = ''}) => _RequiredField(message: message);
  factory ValidationError.invalidField({String message = ''}) => _InvalidField(message: message);
  factory ValidationError.fieldsDoNotMatch({String message = ''}) => _FieldsDoNotMatch(message: message);
  factory ValidationError.minimumLength({String message = ''}) => _MinimumLength(message: message);
}

class _NoError extends ValidationError {
  const _NoError({String message = ''}) : super._(message: message);
}

class _RequiredField extends ValidationError {
  const _RequiredField({String message = ''}) : super._(message: message);
}

class _InvalidField extends ValidationError {
  const _InvalidField({String message = ''}) : super._(message: message);
}

class _FieldsDoNotMatch extends ValidationError {
  const _FieldsDoNotMatch({String message = ''}) : super._(message: message);
}

class _MinimumLength extends ValidationError {
  const _MinimumLength({String message = ''}) : super._(message: message);
}
