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
    return UserModel(
      dtoId: map['id'] ?? '',
      dtoName: map['name'] ?? '',
      dtoAvatarPicture: map['avatar'] ?? '',
    );
  }
}
