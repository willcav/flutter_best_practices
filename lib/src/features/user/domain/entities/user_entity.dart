class UserEntity {
  final String id;
  final String name;
  final String? avatarPicture;

  UserEntity({
    required this.id,
    required this.name,
    this.avatarPicture,
  });
}
