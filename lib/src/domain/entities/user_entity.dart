class UserEntity {
  final String _name;
  final String _avatarPicture;

  const UserEntity({required String name, String avatarPicture = ''})
      : _name = name,
        _avatarPicture = avatarPicture;

  String get name => _name;
  String get avatarPicture => _avatarPicture;
}
