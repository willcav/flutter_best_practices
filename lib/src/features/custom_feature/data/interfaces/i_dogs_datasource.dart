import 'package:core/core.dart';

abstract interface class IDogsDatasource {
  Future<Either<Failure, NetworkResponse>> getDogs();

  Future <Either<Failure, NetworkResponse>> getDogsTemplate();
}
