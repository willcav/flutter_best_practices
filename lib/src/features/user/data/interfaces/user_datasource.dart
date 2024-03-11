import 'package:core/core.dart';

abstract interface class UserDatasource {
  Future<Either<Failure, NetworkResponse>> getUser(
      {required bool simulateError});
}
