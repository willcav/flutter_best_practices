import 'package:flutter_clean_arch_error_handling/src/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  final String dtoName;
  final String dtoAvatarPicture;

  UserModel({
    required this.dtoName,
    this.dtoAvatarPicture = '',
  }) : super(name: dtoName, avatarPicture: dtoAvatarPicture);

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      dtoName: map['name'] ?? '',
      dtoAvatarPicture: map['picture'] ?? '',
    );
  }
}
