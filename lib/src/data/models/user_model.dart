import 'package:flutter/foundation.dart';
import 'package:flutter_clean_arch_error_handling/src/data/errors/data/data_error.dart';
import 'package:flutter_clean_arch_error_handling/src/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  final String dtoId;
  final String dtoName;
  final String dtoAvatarPicture;

  UserModel({
    required this.dtoId,
    required this.dtoName,
    this.dtoAvatarPicture = '',
  }) : super(id: dtoId, name: dtoName, avatarPicture: dtoAvatarPicture);

  factory UserModel.fromMap(Map<String, dynamic> map) {
    try {
      if (!(map.containsKey('id') && map.containsKey('name'))) {
        throw DataError.missingParameters();
      }
      return UserModel(
        dtoId: map['ids'] ?? '',
        dtoName: map['name'] ?? '',
        dtoAvatarPicture: map['avatar'] ?? '',
      );
    } on DataError catch (e) {
      debugPrint(e.toString());
      rethrow;
    } catch (e) {
      debugPrint(e.toString());
      throw DataError.failedToConvert();
    }
  }
}
