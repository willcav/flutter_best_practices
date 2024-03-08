import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.id,
    required super.name,
    super.avatarPicture,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['ids'] ?? '',
      name: map['name'] ?? '',
      avatarPicture: map['avatar'] ?? '',
    );
  }
}
