class UserEntity {
  final String _id;
  final String _name;
  final String _avatarPicture;

  const UserEntity({required String id, required String name, String avatarPicture = ''})
      : _id = id,
        _name = name,
        _avatarPicture = avatarPicture;

  String get id => _id;
  String get name => _name;
  String get avatarPicture => _avatarPicture;
}
