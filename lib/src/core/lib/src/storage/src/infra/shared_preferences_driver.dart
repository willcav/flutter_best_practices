import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:core/core.dart';
import '../data/interfaces/storage_driver.dart';

typedef StringList = List<String>;

class SharedPreferencesDriver implements StorageDriver {
  final SharedPreferences sharedPreferences;

  const SharedPreferencesDriver(this.sharedPreferences);

  @override
  Future<Either<Failure, bool>> saveValue<T>(String key, T value) async {
    try {
      final result = await saveValueWithCorrectType<T>(key, value);
      return result
          ? Right(result)
          : Left(
              GenericFailure(message: "Could not save your $T data"),
            );
    } catch (e) {
      return Left(
        GenericFailure(
            message: "Failed to save data. Please check your data type $T"),
      );
    }
  }

  @override
  Future<Either<Failure, T>> getValue<T>(String key) async {
    try {
      final result = getValueWithCorrectType<T>(key);
      if (result != null) {
        return Right(result);
      }
      return Left(GenericFailure(message: "No $T data for key $key"));
    } catch (e) {
      return Left(GenericFailure(
          message:
              "Failed to retrieve $T data for key $key. Please check your data type $T or key $key"));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> getAll() async {
    try {
      final keys = sharedPreferences.getKeys();
      final Json values = {};
      for (final key in keys) {
        final result = sharedPreferences.get(key);
        values.addEntries([MapEntry(key, result)]);
      }
      return Right(values);
    } catch (e) {
      return Left(
          GenericFailure(message: "Failed to retrieve all data from storage"));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteValue(String key) async {
    try {
      final result = await sharedPreferences.remove(key);
      if (result) return Right(result);
      return Left(GenericFailure(message: "Could not delete key $key"));
    } catch (e) {
      return Left(GenericFailure(message: "Failed to delete key $key"));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteAll() async {
    try {
      final result = await sharedPreferences.clear();
      if (result) return Right(result);
      return Left(GenericFailure(message: "Could not clear the storage"));
    } catch (e) {
      return Left(GenericFailure(message: "Failed to clear the storage"));
    }
  }

  @visibleForTesting
  Future<bool> saveValueWithCorrectType<T>(String key, T value) async {
    final valueType = value.staticType != dynamic ? value.staticType : T;
    switch (valueType) {
      case String:
        return await sharedPreferences.setString(key, value as String);
      case bool:
        return await sharedPreferences.setBool(key, value as bool);
      case int:
        return await sharedPreferences.setInt(key, value as int);
      case double:
        return await sharedPreferences.setDouble(key, value as double);
      case StringList:
        return await sharedPreferences.setStringList(key, value as StringList);
      case Json:
        final encodedValue = jsonEncode(value as Json);
        return await sharedPreferences.setString(key, encodedValue);
      default:
        throw Failure;
    }
  }

  @visibleForTesting
  T getValueWithCorrectType<T>(String key) {
    final valueType = T;
    switch (valueType) {
      case String:
        return sharedPreferences.getString(key) as T;
      case bool:
        return sharedPreferences.getBool(key) as T;
      case int:
        return sharedPreferences.getInt(key) as T;
      case double:
        return sharedPreferences.getDouble(key) as T;
      case StringList:
        return sharedPreferences.getStringList(key) as T;
      case Json:
        final result = sharedPreferences.getString(key);
        if (result == null) throw Failure;
        return jsonDecode(result);
      default:
        throw Failure;
    }
  }
}
