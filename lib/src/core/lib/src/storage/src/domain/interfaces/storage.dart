import 'package:core/src/abstractions/abstractions.dart';

abstract interface class Storage {
  /// Saves a [T] value to the persistent storage
  Future<Either<Failure, bool>> saveValue<T>({
    required String key,
    required T value,
  });

  /// Reads a value [T] from the persistent storage, throwing an exception
  ///
  /// if the [key] does not exist or if the expected type [T] is wrong
  Future<Either<Failure, T>> getValue<T>({required String key});

  /// Reads a all values from the persistent storage
  ///
  /// and returns them in a [Json]
  Future<Either<Failure, Map<String, dynamic>>> getAll();

  /// Removes an entry from the persistent storage given a [key]
  Future<Either<Failure, bool>> deleteValue({required String key});

  /// Removes all entries from the persistent storage
  Future<Either<Failure, bool>> deleteAll();
}
