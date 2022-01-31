import '../domain/errors/domain_error.dart';

class TimeOutError extends DomainError {
  TimeOutError({String message = ''}) : super(message: message);
}
