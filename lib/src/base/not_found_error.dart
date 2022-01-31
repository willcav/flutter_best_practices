import '../domain/errors/domain_error.dart';

class NotFoundError extends DomainError {
  NotFoundError({String message = ''}) : super(message: message);
}
