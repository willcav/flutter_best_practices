import 'package:core/core.dart';

abstract interface class StorageDriver {
  Future<Either<Failure, bool>> saveValue<T>(String key, T value);

  Future<Either<Failure, T>> getValue<T>(String key);

  Future<Either<Failure, Map<String, dynamic>>> getAll();

  Future<Either<Failure, bool>> deleteValue(String key);

  Future<Either<Failure, bool>> deleteAll();
}
