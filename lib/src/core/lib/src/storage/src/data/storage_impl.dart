import 'package:core/core.dart';

import 'interfaces/storage_driver.dart';

class StorageImpl implements Storage {
  final StorageDriver driver;

  const StorageImpl(this.driver);

  @override
  Future<Either<Failure, bool>> deleteAll() => driver.deleteAll();

  @override
  Future<Either<Failure, bool>> deleteValue({required String key}) =>
      driver.deleteValue(key);

  @override
  Future<Either<Failure, Map<String, dynamic>>> getAll() => driver.getAll();

  @override
  Future<Either<Failure, T>> getValue<T>({required String key}) =>
      driver.getValue<T>(key);

  @override
  Future<Either<Failure, bool>> saveValue<T>(
          {required String key, required T value}) =>
      driver.saveValue<T>(key, value);
}
